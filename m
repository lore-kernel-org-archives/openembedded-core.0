Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9A1566102D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 08:26:32 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hn9so3079308wib.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 01:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YdCdKxQAtgITAdnJw9wS0YjLChbUzC7/grNK+X7hekA=;
	b=S0/xyF+a0iCycI3OcH4KBsOHWHY8/NExRcEsMlEeiBamv+B2EWI3qxUjdwIMorDtke
	MAPYKRDwuSsWixFdec+OMWCb+fGXoQj1uCR25vtjgnQJcJcH01TElpHZZA1GLDsWvTkm
	uQ0qTuoVQCGO40MGg4ovq+cSodyspGD1DnUIMr13QqQpCWMDwYzvfkgv+KrGOSBDQHkH
	Skai0IOUp80EWeVrnlT2n+MmzGMFD7LkaSovlI1TR1HbAH/mcJhz3jsNqTXcaKX2+Iha
	IIuO4saB4XfQIRygsz1TPYRYvOs2zoWc3uwg/9BTMDlqq2VZ51F8opOUmLgCXbq5dr6l
	+VRw==
X-Gm-Message-State: ALoCoQmad7u5D9leYDtTR9TuZ6w73W9Xgr2QHR6fA/Cb1geKbHWAN1lvXr950Q0ZHa5Xm7C+FDqu
X-Received: by 10.194.241.228 with SMTP id wl4mr21525398wjc.2.1379319994188;
	Mon, 16 Sep 2013 01:26:34 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id li9sm21747874wic.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 01:26:33 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2013 09:26:29 +0100
Message-Id: <1379319989-9475-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379319989-9475-1-git-send-email-ross.burton@intel.com>
References: <1379319989-9475-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] imake: remove
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
X-List-Received-Date: Mon, 16 Sep 2013 08:26:33 -0000

Remove both imake and the associated xorg-cf-files, as nothing has used imake to
build for a long time.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../packagegroups/packagegroup-toolset-native.bb   |    2 --
 meta/recipes-graphics/xorg-util/imake_1.0.5.bb     |   20 --------------------
 .../xorg-util/xorg-cf-files_1.0.5.bb               |   15 ---------------
 3 files changed, 37 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-util/imake_1.0.5.bb
 delete mode 100644 meta/recipes-graphics/xorg-util/xorg-cf-files_1.0.5.bb

diff --git a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
index 934b1be..53914f3 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
@@ -92,7 +92,6 @@ DEPENDS = "\
     icecc-create-env-native \
     icon-naming-utils-native \
     icu-native \
-    imake-native \
     inputproto-native \
     insserv-native \
     intltool-native \
@@ -225,7 +224,6 @@ DEPENDS = "\
     xcmiscproto-native \
     xextproto-native \
     xkbcomp-native \
-    xorg-cf-files-native \
     xproto-native \
     xtrans-native \
     xz-native \
diff --git a/meta/recipes-graphics/xorg-util/imake_1.0.5.bb b/meta/recipes-graphics/xorg-util/imake_1.0.5.bb
deleted file mode 100644
index ee1e181..0000000
--- a/meta/recipes-graphics/xorg-util/imake_1.0.5.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require xorg-util-common.inc
-
-SUMMARY = "C preprocessor interface to the make utility"
-DESCRIPTION = "Imake is used to generate Makefiles from a template, a \
-set of cpp macro functions, and a per-directory input file called an \
-Imakefile. This allows machine dependencies (such as compiler options, \
-alternate command names, and special make rules) to be kept separate \
-from the descriptions of the various items to be built."
-LIC_FILES_CHKSUM = "file://COPYING;md5=b9c6cfb044c6d0ff899eaafe4c729367"
-
-DEPENDS = "util-macros xproto xorg-cf-files"
-RDEPENDS_${PN} = "perl xproto"
-
-PR = "r0"
-PE = "1"
-
-SRC_URI[md5sum] = "60f4c648d9598603c2bc94b44efef4b2"
-SRC_URI[sha256sum] = "e939695e46c26bc123065911c13d1210d062a54e3e01ea26e8ad20fa8a8e3b4f"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-graphics/xorg-util/xorg-cf-files_1.0.5.bb b/meta/recipes-graphics/xorg-util/xorg-cf-files_1.0.5.bb
deleted file mode 100644
index fca8328..0000000
--- a/meta/recipes-graphics/xorg-util/xorg-cf-files_1.0.5.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require xorg-util-common.inc
-
-SUMMARY = "Data files for the imake utility"
-DESCRIPTION = "Data files for the imake utility"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0f334a06f2de517e37e86d6757167d88"
-
-DEPENDS = "font-util"
-
-
-FILES_${PN} += "${libdir}/X11/config/*"
-
-SRC_URI[md5sum] = "ccb5f341ed5932d5ae870d9128e37c32"
-SRC_URI[sha256sum] = "8c9ce7952094d49a1d3f849e45caf848d83ad879d91f3169cc373f52502d0c20"
-
-BBCLASSEXTEND = "native"
-- 
1.7.10.4


