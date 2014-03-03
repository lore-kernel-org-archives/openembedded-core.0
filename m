Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 87F806EA4A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 14:24:01 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id y10so3258212wgg.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Mar 2014 06:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=TaT9cjNoTmgG2j3X6yf+TCpRkR91uEhklMOhOOHrF8g=;
	b=KJtNpyXrdyNwqGvL+mYRLBHadwddcsg+AHe3Nm9B/SYUjdjE4TIj/SJnOJyAHieOBw
	Kg/h0icHJlmUtBXJpfEU0xrLyakzYqDp0a7NrQzpWx1JmdQ3tRfOvCHYaiZmuB2ktIb6
	ml/dQost+SWxj2h9jkMzh7Uua92b4LyOLJP6WnXGOhz6AcxoUXHbh56pREUZ1lQx+05s
	V/omRpZYFrlteZInG6C4O5IqgrjGM43v2vk+d/RmbJYhwst4odeLytoslblL4YCRMddv
	aYLJVA69h5lBSR6i+uaKPvSy2TE7KawtYnUBZPffgzR5KhPHsaVmifPM0tRsrjmAcqyh
	Zaaw==
X-Gm-Message-State: ALoCoQlXID0bcP57J3/qrJaelhYYo4zLTQqFqA+r4DziWdRkHBsg/1/fSZmUNIGlMbwr6knitueT
X-Received: by 10.194.82.69 with SMTP id g5mr6286338wjy.85.1393856309308;
	Mon, 03 Mar 2014 06:18:29 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id t5sm36019486wjw.15.2014.03.03.06.18.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Mar 2014 06:18:28 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Mar 2014 14:18:25 +0000
Message-Id: <1393856305-1517-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] mtdev: upgrade to 1.1.5
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
X-List-Received-Date: Mon, 03 Mar 2014 14:24:03 -0000

Removed the following patch(es):
 * fixsepbuild.patch (changes included in release)

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../wayland/mtdev/fixsepbuild.patch                |   24 --------------------
 .../wayland/{mtdev_1.1.4.bb => mtdev_1.1.5.bb}     |    7 +++---
 2 files changed, 3 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/mtdev/fixsepbuild.patch
 rename meta/recipes-graphics/wayland/{mtdev_1.1.4.bb => mtdev_1.1.5.bb} (69%)

diff --git a/meta/recipes-graphics/wayland/mtdev/fixsepbuild.patch b/meta/recipes-graphics/wayland/mtdev/fixsepbuild.patch
deleted file mode 100644
index 9895650..0000000
--- a/meta/recipes-graphics/wayland/mtdev/fixsepbuild.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Some tests do #include  relative to the top-level, so add top_srcdir to the
-include path as otherwise out-of-tree builds can't find the files.
-
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- test/Makefile.am |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/Makefile.am b/test/Makefile.am
-index 2b504bd..6688b41 100644
---- a/test/Makefile.am
-+++ b/test/Makefile.am
-@@ -1,7 +1,7 @@
- noinst_PROGRAMS = mtdev-mapgen mtdev-matching mtdev-kernel
- bin_PROGRAMS = mtdev-test
- 
--AM_CPPFLAGS=-I$(top_srcdir)/include/
-+AM_CPPFLAGS=-I$(top_srcdir) -I$(top_srcdir)/include/
- 
- mtdev_mapgen_SOURCES = mtdev-mapgen.c
- 
--- 
-1.7.10.4
diff --git a/meta/recipes-graphics/wayland/mtdev_1.1.4.bb b/meta/recipes-graphics/wayland/mtdev_1.1.5.bb
similarity index 69%
rename from meta/recipes-graphics/wayland/mtdev_1.1.4.bb
rename to meta/recipes-graphics/wayland/mtdev_1.1.5.bb
index 6b38f58..ccd0ebb 100644
--- a/meta/recipes-graphics/wayland/mtdev_1.1.4.bb
+++ b/meta/recipes-graphics/wayland/mtdev_1.1.5.bb
@@ -11,9 +11,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea6bd0268bb0fcd6b27698616ceee5d6"
 
-SRC_URI = "http://bitmath.org/code/${BPN}/${BP}.tar.bz2 \
-           file://fixsepbuild.patch"
-SRC_URI[md5sum] = "73a915d6075b31db4f08ab8c6d314695"
-SRC_URI[sha256sum] = "6b59b055ff22f2b91d4284187c2515826c338b81f6f33bd90f6bedc7c1fb9a38"
+SRC_URI = "http://bitmath.org/code/${BPN}/${BP}.tar.bz2"
+SRC_URI[md5sum] = "52c9610b6002f71d1642dc1a1cca5ec1"
+SRC_URI[sha256sum] = "6677d5708a7948840de734d8b4675d5980d4561171c5a8e89e54adf7a13eba7f"
 
 inherit autotools pkgconfig
-- 
1.7.10.4


