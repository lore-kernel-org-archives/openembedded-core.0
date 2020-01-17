Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id E963D7FC51
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:29:19 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id a5so8791896wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=nYO/waeoIlwMEjAeuV6HaBB5873m3dIsnxrBLfcfqqA=;
	b=MEbUPfl3q1cODKiKVl/Nvi4d54rmJA284sVvX/nwMrbFI73RW8ZFUCP5nzZuSWqb+l
	E3V+QWoOR5/xbTtFODjKRsMMTsUAOBTZIdDqi7mNZbzopDBJX3zsjspLIYYZVmEEBRhC
	BaeN8y1lY19LV/mAicZfJBm8F+rkbCyp304JjjbWwTcZybdOnSu3x5qNZsjGAAAsmXF2
	uYQ/soGMbZFrZK0nYaqAEuWJHdu0eTx9GK+5NNX8VXnIM1aikxnuaxdvLtbAPyfEggX4
	Pjpr8C3UA/qKxSUdWJhQOG23CD+Zc+3JmG1I0tLVNEdFkf1L6NeX1w2M8S1R6c5o8kyf
	kD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nYO/waeoIlwMEjAeuV6HaBB5873m3dIsnxrBLfcfqqA=;
	b=UNUIgp7QSHIUpbDrsK3EFWFksn+xghH+1gt4M92BKLpHRZ5oh6UX67AHCBK9wF3mos
	LszzzN7oUJ8+4/VQz38I7MOvUzAPmEZt8UEehEcCEBH6WCrjj9u6N2JwtMzVpbdBzvKh
	kUwPEmgpDWf6rqefzrVMg1/gGFy3Dnn4nFq6f1a2J4GYQXngXw93yOe/GamzYL2oD6nX
	vXwwdM1RcfbJVgydOkP+p1PWAV/av9PLiPVipLlFG+vu5Q6W+9LNp842Qw0QYtoRaIbT
	8zYXo/JANuCuRHOsvMzVHabijb99aPPqJLGpStEzNWeKnOv+J4E4fh0WDkNjuCH2RM08
	gUJA==
X-Gm-Message-State: APjAAAVqHxwuTn2jWWgE+KR4ou5vVXykOz7i6/rMXF5pOpvI4XHzON+P
	h7ukRly0gYLqrUVJ1LFXYUZzPPsf9ag=
X-Google-Smtp-Source: APXvYqzmCLEnrejHJMPGpF4fjJo0FGT0+QJOOA+uCguHphn81D9VZ1/UVbfxrY21v/imeoDe5qGt5A==
X-Received: by 2002:a1c:7e0b:: with SMTP id z11mr6648800wmc.88.1579296560309; 
	Fri, 17 Jan 2020 13:29:20 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0BBB19EA1F5BE194E084E5.dip0.t-ipconnect.de.
	[2003:f0:7f0b:bb19:ea1f:5be1:94e0:84e5])
	by smtp.gmail.com with ESMTPSA id
	l7sm36094689wrq.61.2020.01.17.13.29.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 13:29:19 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 22:29:01 +0100
Message-Id: <20200117212908.32647-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200117212908.32647-1-schnitzeltony@gmail.com>
References: <20200117212908.32647-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 03/10] shared-mime-info: upgrade 1.10 -> 1.15
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
X-List-Received-Date: Fri, 17 Jan 2020 21:29:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* sources/development moved to freedesktop's gitlab
* patches do not apply any more due to major changes in Makefile.am
* give up bb/inc separation

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../shared-mime-info/install-data-hook.patch  | 25 --------------
 .../shared-mime-info/parallelmake.patch       | 33 -------------------
 .../shared-mime-info/shared-mime-info_1.10.bb |  7 ----
 ...-mime-info.inc => shared-mime-info_git.bb} |  9 +++--
 4 files changed, 6 insertions(+), 68 deletions(-)
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_1.10.bb
 rename meta/recipes-support/shared-mime-info/{shared-mime-info.inc => shared-mime-info_git.bb} (75%)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch
deleted file mode 100644
index 262ff7562c..0000000000
--- a/meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-fix shared-mime-info build race condition
-
-The definition of install-data-hook in Makefile.am leads
-to multiple, overlapping, executions of install-binPROGRAMS
-target.  We modify the definition to avoid that.
-
-Upstream-Status: Pending
-
-Signed-off-by: Joe Slater <jslater@windriver.com>
-
-Index: shared-mime-info-1.9/Makefile.am
-===================================================================
---- shared-mime-info-1.9.orig/Makefile.am
-+++ shared-mime-info-1.9/Makefile.am
-@@ -50,7 +50,9 @@ else
-   update_mime_database="$(top_builddir)/update-mime-database$(EXEEXT)"
- endif
- 
--install-data-hook: install-binPROGRAMS
-+# do NOT make this dependent on anything!
-+#
-+install-data-hook:
- if ENABLE_UPDATE_MIMEDB
- 	$(update_mime_database) -V "$(DESTDIR)$(datadir)/mime"
- endif
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch
deleted file mode 100644
index fea34a55a2..0000000000
--- a/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-The Makefile used by shared-mime-info is one big race with the SUBDIRS 
-option and the dependency specifically calling make all combining to
-create multiple make instances all of which may try and build targets
-like update-mime-database.
-
-This patch removes those options meaning make can correctly identify
-dependencies and stop itself racing itself.
-
-RP 10/10/2011
-
-Upstream-Status: Pending
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
-Index: shared-mime-info-1.9/Makefile.am
-===================================================================
---- shared-mime-info-1.9.orig/Makefile.am
-+++ shared-mime-info-1.9/Makefile.am
-@@ -1,5 +1,3 @@
--SUBDIRS=. po
--
- AM_CPPFLAGS = $(ALL_CFLAGS)
- 
- packagesdir = $(datadir)/mime/packages
-@@ -81,8 +79,7 @@ endif
- 
- all: $(defaultmakedeps)
- 
--create-pot:
--	$(AM_V_GEN) $(MAKE) -C po shared-mime-info.pot
-+create-pot: po
- 
- local-test: create-pot freedesktop.org.xml update-mime-database$(EXEEXT)
- if CROSS_COMPILING
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_1.10.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_1.10.bb
deleted file mode 100644
index 9fc210b718..0000000000
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_1.10.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require shared-mime-info.inc
-
-SRC_URI += "file://parallelmake.patch \
-	    file://install-data-hook.patch"
-
-SRC_URI[md5sum] = "418c2ced9dc4dd5ca8b06a755e6d64e9"
-SRC_URI[sha256sum] = "c625a83b4838befc8cafcd54e3619946515d9e44d63d61c4adf7f5513ddfbebf"
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
similarity index 75%
rename from meta/recipes-support/shared-mime-info/shared-mime-info.inc
rename to meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
index 3fe1a445b0..bf48e453a0 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
@@ -5,11 +5,14 @@ SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "libxml2 intltool-native glib-2.0 shared-mime-info-native"
+DEPENDS = "libxml2 itstool glib-2.0 shared-mime-info-native"
 
-SRC_URI = "http://freedesktop.org/~hadess/shared-mime-info-${PV}.tar.xz"
+SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https"
+SRCREV = "829b26d85e7d89a0caee03046c3bce373f04c80a"
+PV = "1.15"
+S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext python3native
 
 EXTRA_OECONF = "--disable-update-mimedb"
 
-- 
2.21.0


