Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id B5830799EE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 16:06:21 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id s12-v6so2772997wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 09:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Gsfy1xYMoyM1KE8nqzZSifvM9ejnY2F0Gb3a1GOYqyw=;
	b=gOY0/f+wP2Hj3YKumRqk1d/nZGKVCx6ccXmjqHhs9/6zA5nb5UROMTc7cNhnyvzgd+
	gBz3khFQ4xtlxfHR+87fi0cCGkQeWI84pN2mH8c9nq8Kc2rnOfQ/NFPkxIIzqtZht+uQ
	EwlWY9wbtlBbChlIgvxmrEdaaphz8PqROD8a/zoIj5qGRfIN3BepZ234+4/LUmyBN5a0
	OqrSGLuDE692DP9DNOSf2uEyjlEMp4dWA62+oRIOrhopcGjHmEhdq1qjZIV4S4g4ei+S
	Lt3pwsAdO8yULMBX0igOHplZLu8fD0nefUCM8r/H24kXQIC2RotjhhJGOuUwbJ+2ll5G
	pusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Gsfy1xYMoyM1KE8nqzZSifvM9ejnY2F0Gb3a1GOYqyw=;
	b=XGHV9k7hg0GIOy8quR1VX2GKUamj3uc3sot1DEBxwdjMe5Oig5QXweclGGImDK+UY0
	QtO0XD9bE3mmcd6GACmSOGYgtz/Y8wgu8W+ae29UQa1efngpfbUe+f+3Ajvb4bIwo7cu
	X87Jcx1yOvVQ/PiXaz/qn9QMSm4J7rLA1KbnpVjsGc2yFtBaQXNSamDgiJgaBqCpg5eA
	oDXZtkq+g3tI6WgXISkxbwXuRBWSFoEttrDIoO69+jsXLZRHl2QK7D4MiowAXMK4gJtD
	5RVt5sd3E3zBMNsD/vx6hCcz4WMyz/uk/0aXgNiTLdpwVJp/Bnb4JiTQBWMpcwOWK34O
	Tvzw==
X-Gm-Message-State: ABuFfog+P/S9zaacAWLIfqP4KQOR4IwdM8wUedjNgDrrsmTaGmBJd5QH
	a0LTG2GUTROE4qEIGNgAk4N0CiwvIdQ=
X-Google-Smtp-Source: ACcGV63U9eVqRk+D7j4z3sXgC75TiNkYDYvUlasKoX3e1lFHbtpfPqsdyE85Cn/+rvktCctPpqMI9Q==
X-Received: by 2002:a1c:d712:: with SMTP id
	o18-v6mr2416122wmg.54.1538150781968; 
	Fri, 28 Sep 2018 09:06:21 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	11-v6sm7562289wrb.95.2018.09.28.09.06.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Sep 2018 09:06:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Sep 2018 17:06:16 +0100
Message-Id: <20180928160616.6672-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180928160616.6672-1-ross.burton@intel.com>
References: <20180928160616.6672-1-ross.burton@intel.com>
Subject: [PATCH 3/3] python: move sqlite module into python-sqlite
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
X-List-Received-Date: Fri, 28 Sep 2018 16:06:22 -0000

The module was accidentally included in python-misc.

Also re-run create_manifest to update the dependencies of python-sqlite3,
causing some whitespace changes.

[ YOCTO #12933 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../python/python/python2-manifest.json            | 24 ++++++++++++----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
index 1e7004e05ea..260fa6f80d2 100644
--- a/meta/recipes-devtools/python/python/python2-manifest.json
+++ b/meta/recipes-devtools/python/python/python2-manifest.json
@@ -1,18 +1,18 @@
 {
     "tests": {
-        "summary": "Python test suite",
+        "summary": "Python test suite", 
         "rdepends": [
-            "core",
+            "core", 
             "modules"
-        ],
+        ], 
         "files": [
-            "${libdir}/python2.7/*/test",
-            "${libdir}/python2.7/*/tests",
-            "${libdir}/python2.7/idlelib/idle_test/",
+            "${libdir}/python2.7/*/test", 
+            "${libdir}/python2.7/*/tests", 
+            "${libdir}/python2.7/idlelib/idle_test/", 
             "${libdir}/python2.7/test"
-        ],
+        ], 
         "cached": []
-    },
+    }, 
     "2to3": {
         "summary": "Python automated Python 2 to 3 code translator", 
         "rdepends": [
@@ -881,10 +881,12 @@
     "sqlite3": {
         "summary": "Python Sqlite3 database support", 
         "rdepends": [
-            "core"
+            "core", 
+            "datetime"
         ], 
         "files": [
-            "${libdir}/python2.7/lib-dynload/_sqlite3.so"
+            "${libdir}/python2.7/lib-dynload/_sqlite3.so", 
+            "${libdir}/python2.7/sqlite3"
         ]
     }, 
     "stringold": {
@@ -1041,4 +1043,4 @@
             "${libdir}/python2.7/lib-dynload/zlib.so"
         ]
     }
-}
+}
\ No newline at end of file
-- 
2.11.0


