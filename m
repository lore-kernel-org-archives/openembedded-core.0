Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 94370798CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 11:49:08 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n11-v6so1345583wro.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 04:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1Hhs/afmy4w01XvKNmVAvHdm6CpMwLSD3nnEouPsqJ0=;
	b=y99UY3LITCCaB45fGfzR7i8M0LesgEcSh6E2tRRGCePPUBDfX3u/LSsL8tCqoe3qTP
	iUnu5fpwv3G3h4KHfW6rznTQ9NNyNViOr8CIZmnUl1T9Cj2k/yrqJxoTwsAS5sjqN6VE
	ar6sirgG/12vBioYrzLUEXT04yhzPl0RAHmNpOxLO4EP9524vSgVJt9Rc3jS/uJI12X2
	NuwZYtKdXUU1QBgTpnbnsk+PG/s2eu/nNg0NGJFUR8jMz8/D4RPydsqJzN8s5Ci/FM8A
	owgy56LWZdJT6cd0Bx1UYMGMRIzLquPrjQMjXxTEICN9HK3+REmyaODJ2y804MXfbx1X
	1kBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1Hhs/afmy4w01XvKNmVAvHdm6CpMwLSD3nnEouPsqJ0=;
	b=IijQHdLw5ZuX4SLYS58pfpTuxS+ik73tRei8wakYDbWB5fZ2pQtrSgLcHZk9Zt+UZA
	VIA853rE3MFk8QEU6F4c5j7nOqcWKxb3qcEinDFUjwC8wIC10Gme73IwDVnhN+swmE9p
	Lm7FYPYevra5Hf2i27BV9MEDPoGJiwp0y+L9lVglpKkaFljHy0ZMy3bGXebLnxUD28/e
	NZ02l25kaMku9lqSQdj7oomDKozmalHyFrinU0rDpEi2QQiPMq+Pba4R7RUX4jigS5Ih
	8i1AGt0YVZ8hNWBWFEIjYwnVJVxlwXR60xIV3udR8u4DGMuFJSW84muT8v9uiWb700LM
	jzfQ==
X-Gm-Message-State: APzg51C9Y6BjShtJ6vHpDKVtRoyU0AdYL7Us/qBG3peYph741rHyEWBp
	NWOvrUMNGv/GfmIdi+Q1l6FlSf3Ke38=
X-Google-Smtp-Source: ANB0VdbT37H+4Pa6CncTffdy61i7ZF9ipkquRz9K8OTPm3Ke/Lkxo5gmXGIvx2yIyVyST9SckhYIIg==
X-Received: by 2002:a05:6000:c:: with SMTP id
	h12mr38544087wrx.103.1537530548948; 
	Fri, 21 Sep 2018 04:49:08 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n8-v6sm3479850wrw.31.2018.09.21.04.49.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Sep 2018 04:49:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2018 12:48:59 +0100
Message-Id: <20180921114900.26338-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180921114900.26338-1-ross.burton@intel.com>
References: <20180921114900.26338-1-ross.burton@intel.com>
Subject: [PATCH 3/4] python3: consolidate tests
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
X-List-Received-Date: Fri, 21 Sep 2018 11:49:08 -0000

Currently the bulk of the tests in python3-tests, some more in
python3-sqlite3-tests, and others in their parent module (such as
python3-ctypes).  This is pointless space usage if we're not planning on running
the tests, so consolidate all the tests into python3-tests.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../python/python3/python3-manifest.json           | 36 +++++++++-------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 95ae3fb0215..539b7967b59 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1,4 +1,18 @@
 {
+    "tests": {
+        "summary": "Python test suite",
+        "rdepends": [
+            "core",
+            "modules"
+        ],
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/*/test",
+            "${libdir}/python${PYTHON_MAJMIN}/*/tests",
+            "${libdir}/python${PYTHON_MAJMIN}/idlelib/idle_test/",
+            "${libdir}/python${PYTHON_MAJMIN}/test"
+        ],
+        "cached": []
+    },
     "2to3": {
         "summary": "Python automated Python 2 to 3 code translator",
         "rdepends": [
@@ -989,17 +1003,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__/dump.*.pyc"
         ]
     },
-    "sqlite3-tests": {
-        "cached": [],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/test"
-        ],
-        "rdepends": [
-            "core",
-            "tests"
-        ],
-        "summary": "Python Sqlite3 database support tests"
-    },
     "stringold": {
         "summary": "Python string APIs [deprecated]",
         "rdepends": [
@@ -1037,17 +1040,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tty.*.pyc"
         ]
     },
-    "tests": {
-        "cached": [],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/test"
-        ],
-        "rdepends": [
-            "core",
-            "modules"
-        ],
-        "summary": "Python tests"
-    },
     "threading": {
         "summary": "Python threading & synchronization support",
         "rdepends": [
-- 
2.11.0


