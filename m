Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 420A96148C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 19:49:30 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id q59so5889969wes.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 11:49:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7xj0VAoIkRX1YveokNb/l6YtF2QU5+SiUAJwfHiByPQ=;
	b=JCxWY2uyNuV2zoZ6Wy+ata12DzLGgoAc3smWhNzpdAXhS9yHCkID57rg6XSa8X4nMR
	7bvKfwCMmSYqXlr9Glka0RsZcQdDc7Vwt1XdWykdlAgVzwWNSVaGxXsPXg4wtqNU6e9i
	crGTnrcAU0bvCKi47lcfeBGucp/SUQ9dIArV1o8sT1jAV0yg/NnLk2Myhqd/AwPoA68b
	4jzekimz8w4VW5gaVH1zlwwbN3/H7aryXq0aro7UbTEIXf3MZjKSdpBEFPzf9W51p/4R
	5J13OQGNaQqU8CHdsBc9S8v93of5hcT7mxNmph3ArAsJ1N0dGt+r0s42fezqu9AtmXvn
	Qvyg==
X-Gm-Message-State: ALoCoQmBUcfrS9Pin+42y/E22XAvUfc0GR0DVqBeMWYSoIhsMJqkxis9cMVWdS4CLUZUAFptvvIB
X-Received: by 10.194.89.233 with SMTP id br9mr28039084wjb.15.1385495369559;
	Tue, 26 Nov 2013 11:49:29 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id f11sm46512647wic.4.2013.11.26.11.49.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Nov 2013 11:49:28 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2013 19:49:20 +0000
Message-Id: <1385495362-20784-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1385495362-20784-1-git-send-email-ross.burton@intel.com>
References: <1385495362-20784-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/4] pango: upgrade to 1.32.6
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
X-List-Received-Date: Tue, 26 Nov 2013 19:49:31 -0000

Drop automake macro patch, merged upstream.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../pango/pango-1.32.5/obsolete_automake_macros.patch |   15 ---------------
 .../{pango-1.32.5 => pango}/multilib-fix-clean.patch  |    0
 .../pango/{pango-1.32.5 => pango}/no-tests.patch      |    0
 meta/recipes-graphics/pango/pango_1.32.5.bb           |   17 -----------------
 meta/recipes-graphics/pango/pango_1.32.6.bb           |   12 ++++++++++++
 5 files changed, 12 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-graphics/pango/pango-1.32.5/obsolete_automake_macros.patch
 rename meta/recipes-graphics/pango/{pango-1.32.5 => pango}/multilib-fix-clean.patch (100%)
 rename meta/recipes-graphics/pango/{pango-1.32.5 => pango}/no-tests.patch (100%)
 delete mode 100644 meta/recipes-graphics/pango/pango_1.32.5.bb
 create mode 100644 meta/recipes-graphics/pango/pango_1.32.6.bb

diff --git a/meta/recipes-graphics/pango/pango-1.32.5/obsolete_automake_macros.patch b/meta/recipes-graphics/pango/pango-1.32.5/obsolete_automake_macros.patch
deleted file mode 100644
index 3f229b5..0000000
--- a/meta/recipes-graphics/pango/pango-1.32.5/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Accepted [https://bugzilla.gnome.org/show_bug.cgi?id=691263]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd pango-1.32.5/configure.ac pango-1.32.5/configure.ac
---- pango-1.32.5/configure.ac	2012-12-07 04:43:25.000000000 +0200
-+++ pango-1.32.5/configure.ac	2013-01-07 03:25:42.734109587 +0200
-@@ -54,7 +54,7 @@
- dnl usage of GNU Make specific features.
- AM_INIT_AUTOMAKE(1.9 gnits dist-xz no-dist-gzip -Wno-portability)
- m4_ifdef([AM_SILENT_RULES],[AM_SILENT_RULES([yes])])
--AM_CONFIG_HEADER([config.h])
-+AC_CONFIG_HEADERS([config.h])
-
-
- PANGO_VERSION_MAJOR=pango_version_major()
diff --git a/meta/recipes-graphics/pango/pango-1.32.5/multilib-fix-clean.patch b/meta/recipes-graphics/pango/pango/multilib-fix-clean.patch
similarity index 100%
rename from meta/recipes-graphics/pango/pango-1.32.5/multilib-fix-clean.patch
rename to meta/recipes-graphics/pango/pango/multilib-fix-clean.patch
diff --git a/meta/recipes-graphics/pango/pango-1.32.5/no-tests.patch b/meta/recipes-graphics/pango/pango/no-tests.patch
similarity index 100%
rename from meta/recipes-graphics/pango/pango-1.32.5/no-tests.patch
rename to meta/recipes-graphics/pango/pango/no-tests.patch
diff --git a/meta/recipes-graphics/pango/pango_1.32.5.bb b/meta/recipes-graphics/pango/pango_1.32.5.bb
deleted file mode 100644
index 6219940..0000000
--- a/meta/recipes-graphics/pango/pango_1.32.5.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require pango.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-
-PR = "r2"
-
-GNOME_COMPRESS_TYPE="xz"
-
-SRC_URI += "file://no-tests.patch \
-            file://multilib-fix-clean.patch \
-            file://obsolete_automake_macros.patch \
-"
-
-SRC_URI[archive.md5sum] = "8e846804d6e219bc795a26a4a39b5bfd"
-SRC_URI[archive.sha256sum] = "7d7bc99c3d9b580cb4fe787fe47824e56e39534b9040e1c8a2a159248d8e5821"
-
-#PARALLEL_MAKE = ""
diff --git a/meta/recipes-graphics/pango/pango_1.32.6.bb b/meta/recipes-graphics/pango/pango_1.32.6.bb
new file mode 100644
index 0000000..9c5c1cd
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango_1.32.6.bb
@@ -0,0 +1,12 @@
+require pango.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+
+GNOME_COMPRESS_TYPE="xz"
+
+SRC_URI += "file://no-tests.patch \
+            file://multilib-fix-clean.patch \
+"
+
+SRC_URI[archive.md5sum] = "1af2e3a0ac5a258eff5ceddb6ed60ebd"
+SRC_URI[archive.sha256sum] = "8e9a3eadebf30a31640f2b3ae0fb455cf92d10d1cad246d0ffe72ec595905174"
-- 
1.7.10.4


