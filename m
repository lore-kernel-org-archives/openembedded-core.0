Return-Path: <geissonator@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 309E779847
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 16:22:54 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id v198-v6so5619230oif.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 09:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yYY8POvl6h0L0WN2uzhoM2beNXTr0DgcR7f2LOVTcHI=;
	b=PIWFxMsqXHtVNGjZSIrzjkROuPcxE4DpnHiwYJ80SX8H4GCEtpv2i2zM8gInfo4toZ
	Sd6y3YRPsORRqjv662SlJTBjYjDqIu38W992fF3KHVYR89xiuw35Ex9jBVa0gTP8PXyO
	8m7kUdVFlLGZqeRXfJpjNyxsLIobyTNoNUpkLdNj4zI2jiZZ5LjXkWRw9Dy2plWM7ORA
	98qRVPNP+g69X9BfdjkCjshG2S++cbfvGaWNvwWnQJevi5l+6mS3djwLbY2+gNqpnzYd
	/Qgkjbpj0mF5zdqYPQwDYPNrdkb/wad10tiNGEJ25//84qT6ZltPfvBbyZd5NvqspLDg
	JY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yYY8POvl6h0L0WN2uzhoM2beNXTr0DgcR7f2LOVTcHI=;
	b=NkIcIup73RQslMmWJOt8tq/5sBwV66joQTVyu6kE+8s8FkNIWEXXtw+60URGygWkzh
	aiOMuYJEmH838FW367+k6wKoTas06/D5uaKMwSnuxlH/pWMVWjd3xGD+m5dkyHJac2LW
	Ur7LQ1dlL88SEZnSkEfz1Qi9rmK4VITnIR92sWki+sUZIVHBxRqNAXmp9pXvgAAtyhbj
	8EOym3Jiz+Q+N0AfBAYWQxHEb6WvzOvgo7nr7Bd9Nndq6+eOmNTrq9Fn3x7vvSzyr88a
	hn6lmF+FSJsBcOIHg9xDRo5j91OD0B3xrR6KS7PC6tXhnak4xAy4QOT2PJ3Xz+SoXYGb
	AiOQ==
X-Gm-Message-State: APzg51D60WqhLaJfFTHWUoLNXKv9DKEwTM1E+QWY27+GdCim0j5bT4ch
	na2qHU80MLjaT4ifHSfVUYljkVLBGZc=
X-Google-Smtp-Source: ANB0VdZ3Zoy2fxZ98E6TSqgLnn4fY+PJVcjt68YbK5lCrn8IH451EcJyqb6lDUoYvdEUjDw+6s07/A==
X-Received: by 2002:aca:4e50:: with SMTP id
	c77-v6mr2206004oib.254.1537374175932; 
	Wed, 19 Sep 2018 09:22:55 -0700 (PDT)
Received: from andrewg-VirtualBox.ibm.com
	(45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
	by smtp.gmail.com with ESMTPSA id
	f9-v6sm7212450oth.31.2018.09.19.09.22.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Sep 2018 09:22:55 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 09:22:29 -0700
Message-Id: <1537374149-27017-3-git-send-email-geissonator@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537374149-27017-1-git-send-email-geissonator@gmail.com>
References: <1537374149-27017-1-git-send-email-geissonator@gmail.com>
Cc: Andrew Geissler <geissonator@gmail.com>,
	alejandro.enedino.hernandez-samaniego@xilinx.com
Subject: [PATCH v3 3/3] python: consolidate tests
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2018 16:22:55 -0000

Currently the bulk of the tests in python-tests, some more in
python-sqlite3-tests, and others in their parent module (such as
python-ctypes).  This is pointless space usage if we're not planning on
running the tests, so consolidate all the tests into python-tests.

This is a backport of the same changes done by Ross Burton for python3

Changes since v1:
- Rebase

Signed-off-by: Andrew Geissler <geissonator@gmail.com>
---
 .../python/python/python2-manifest.json            | 33 +++++++++-------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
index 4a29c56..1e7004e 100644
--- a/meta/recipes-devtools/python/python/python2-manifest.json
+++ b/meta/recipes-devtools/python/python/python2-manifest.json
@@ -1,4 +1,18 @@
 {
+    "tests": {
+        "summary": "Python test suite",
+        "rdepends": [
+            "core",
+            "modules"
+        ],
+        "files": [
+            "${libdir}/python2.7/*/test",
+            "${libdir}/python2.7/*/tests",
+            "${libdir}/python2.7/idlelib/idle_test/",
+            "${libdir}/python2.7/test"
+        ],
+        "cached": []
+    },
     "2to3": {
         "summary": "Python automated Python 2 to 3 code translator", 
         "rdepends": [
@@ -873,16 +887,6 @@
             "${libdir}/python2.7/lib-dynload/_sqlite3.so"
         ]
     }, 
-    "sqlite3-tests": {
-        "summary": "Python Sqlite3 database support tests", 
-        "rdepends": [
-            "core", 
-            "tests"
-        ], 
-        "files": [
-            "${libdir}/python2.7/sqlite3/test"
-        ]
-    }, 
     "stringold": {
         "summary": "Python string APIs [deprecated]", 
         "rdepends": [
@@ -925,15 +929,6 @@
             "${libdir}/python2.7/tty.py"
         ]
     }, 
-    "tests": {
-        "summary": "Python tests", 
-        "rdepends": [
-            "core"
-        ], 
-        "files": [
-            "${libdir}/python2.7/test"
-        ]
-    }, 
     "textutils": {
         "summary": "Python option parsin", 
         "rdepends": [
-- 
2.7.4


