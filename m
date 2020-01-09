Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7FFFB7FDD9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 20:26:35 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j42so8761859wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 12:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=n/MfK8Z0PIVnbjdxVlUMYdbhFZdvZYi8BHT+D4zbajs=;
	b=c3gOw+tyEwisbEk3yOx9z3Ov8WUO7wOlaNVE3HkurhIbu8TaLnPUorm1mhUesfoyO1
	IUFSYBSamsZERTorKEUpSa+yhbDPIFqek4Wqu7bJHge67WMOVGkrXxxTpA7Lk2Ua+mLo
	f5Wp08ChGrPNdH0i+gYwpAdtWZyEVpy5xIuVQrpxtJnV2yRwp58alN9gCxAQfYDnfbOt
	Fhi168hODhi42UwfFOQolw32EPrLt9/PM9Ks4VhEevi72ZPk56YUNxZJmz+JGmMWDkTP
	tpf0HVc0SveZysjNuPK9+p1PP4HgHdSsBegDFGU0RdFQy2aWhqg4sXnVb3bPPP3SsF2O
	Z5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=n/MfK8Z0PIVnbjdxVlUMYdbhFZdvZYi8BHT+D4zbajs=;
	b=bK3DgXVTA6r6XRRB0pWUNgeijj9BPmgmdavu7Z48haddYr4cCZwK378eKjebv9j+xE
	4QVqUw6FDkEezek8sAM2a3ueNoljcBPBjvO4CqUlYTastxnbOX3xxeOkMd7Qs4yGVnbn
	6my0rep6MwunJg2kVqBXcZNT9mWucfxshWhcpRugbLjHDh2Ib10NBZc/p6/l9VzqB+0k
	A+QjsSEhRMIZkIuU/idBbBEUC3Q8CqcELdsmVINP7594US0+oR+YajrIQwvyjwZguNlm
	K46h0vTfU6pwjbXp+CVHxvCZVPPCCynGE2WKffKoEubiPYeP8JviX1bHkBbSxcHVwZFj
	MB4A==
X-Gm-Message-State: APjAAAVUXCbBlgu66c0qmQVuheJ0OtvBGVy/oLJib4PmX3+jToOywExJ
	DnTwAvimDpMQyne8jJo5BIT/Qf5Q4e8=
X-Google-Smtp-Source: APXvYqyVcOrB+d8ZvvgoG+iENk/hIebH1JITDbnPzBV21U4q9Sf4YQEhHGlpECTVI4dGs+0MpSsbnA==
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr969385wrn.75.1578601595850;
	Thu, 09 Jan 2020 12:26:35 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id z6sm9149986wrw.36.2020.01.09.12.26.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 12:26:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jan 2020 21:26:15 +0100
Message-Id: <20200109202623.28936-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200109202623.28936-1-schnitzeltony@gmail.com>
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/11] shared-mime-info: upgrade 1.10 -> 1.15
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
X-List-Received-Date: Thu, 09 Jan 2020 20:26:35 -0000
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
 ...mime-info.inc => shared-mime-info_1.15.bb} |  8 +++--
 4 files changed, 5 insertions(+), 68 deletions(-)
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_1.10.bb
 rename meta/recipes-support/shared-mime-info/{shared-mime-info.inc => shared-mime-info_1.15.bb} (69%)

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
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc b/meta/recipes-support/shared-mime-info/shared-mime-info_1.15.bb
similarity index 69%
rename from meta/recipes-support/shared-mime-info/shared-mime-info.inc
rename to meta/recipes-support/shared-mime-info/shared-mime-info_1.15.bb
index 3fe1a445b0..163e74f362 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_1.15.bb
@@ -5,11 +5,13 @@ SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "libxml2 intltool-native glib-2.0 shared-mime-info-native"
+DEPENDS = "libxml2 itstool glib-2.0 shared-mime-info-native"
 
-SRC_URI = "http://freedesktop.org/~hadess/shared-mime-info-${PV}.tar.xz"
+SRC_URI = "https://gitlab.freedesktop.org/xdg/shared-mime-info/uploads/b27eb88e4155d8fccb8bb3cd12025d5b/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "5215f3d679a817de97eb8b0b911e9393"
+SRC_URI[sha256sum] = "f482b027437c99e53b81037a9843fccd549243fd52145d016e9c7174a4f5db90"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext python3native
 
 EXTRA_OECONF = "--disable-update-mimedb"
 
-- 
2.21.0


