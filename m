Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U1GWd-0001FN-5O
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 14:19:34 +0100
Received: from mail-bk0-f72.google.com ([209.85.214.72])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 01 Feb 2013 05:03:41 -0800
Received: by mail-bk0-f72.google.com with SMTP id w5so4544780bku.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 05:03:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=dNrt+7DYon35gl3plkHPF6SL5nhjo20UDqGbTYKg/gg=;
	b=NqEzH2kf80tuWStFY0sCl1q+jRGdxTyj55evLlLpZwp/srJvWEai8oQHQYGWVAzh/Q
	k9UJtQ1DF/i7FVR+GfrP+qCI8+ArjD0eKmMQ5dwJaw7wrOZJpqUUn6Wie9In+nw0l1qQ
	iWiauIGcH2c0ovurymYBzC+Phb9apE5YaazblbcNmBjJG5rbdB5439vMFc1fXGXND5hl
	J8sJOf/oxYZ1m4T/vpmxAW+Tg6NLyg3rKc4fKR7jxpXOo7PoS8EH8yHOZCUDW7uRMX1Y
	LqdT+93SbNYULUrq78XI2LDQAVa5jNCt0CalA7Q/+3B7TPOJIy9pYZx3f3iPf6JXifKM
	L7kw==
X-Received: by 10.180.85.8 with SMTP id d8mr2715166wiz.4.1359723820044;
	Fri, 01 Feb 2013 05:03:40 -0800 (PST)
X-Received: by 10.180.85.8 with SMTP id d8mr2715139wiz.4.1359723819824;
	Fri, 01 Feb 2013 05:03:39 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hu8sm3146594wib.6.2013.02.01.05.03.38
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 01 Feb 2013 05:03:39 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2013 13:01:22 +0000
Message-Id: <3742a00f9efeb85866fd7b1748c8a346fe2e2bb9.1359723526.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359723526.git.ross.burton@intel.com>
References: <cover.1359723526.git.ross.burton@intel.com>
In-Reply-To: <cover.1359723526.git.ross.burton@intel.com>
References: <cover.1359723526.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnSsVQ49BeQCeuid/3i7aesUD6PixSQm1R1gc5xO5abRKe2+Y/SCDcuSZLZ+OxEiuu4c0pF0hV5fgPvmSj/wFN3D7OsQQSdUB3MaII1uyzB2T0Pkq/oD00Tgj8kqvgWqK4Cnibzgzjpb2S3ij/lwjF5Orbhk4bT7VZNFwTAoVx2AkU3MZfO20eIPA1CpzHRLdGc5/1I
Subject: [PATCH 6/6] matchbox-stroke: remove
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 13:19:36 -0000

matchbox-stroke was never more than a proof of concept, so remove it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../matchbox-stroke/files/configure_fix.patch      |   15 ------------
 .../matchbox-stroke/files/single-instance.patch    |   20 ----------------
 .../matchbox-stroke/matchbox-stroke_git.bb         |   25 --------------------
 3 files changed, 60 deletions(-)
 delete mode 100644 meta/recipes-sato/matchbox-stroke/files/configure_fix.patch
 delete mode 100644 meta/recipes-sato/matchbox-stroke/files/single-instance.patch
 delete mode 100644 meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb

diff --git a/meta/recipes-sato/matchbox-stroke/files/configure_fix.patch b/meta/recipes-sato/matchbox-stroke/files/configure_fix.patch
deleted file mode 100644
index 800bf3b..0000000
--- a/meta/recipes-sato/matchbox-stroke/files/configure_fix.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: matchbox-window-manager/configure.ac
-===================================================================
---- matchbox-window-manager.orig/configure.ac	2007-11-14 12:02:28.000000000 +0000
-+++ matchbox-window-manager/configure.ac	2007-11-14 12:18:55.000000000 +0000
-@@ -283,7 +283,7 @@
-     yes)
- 
- 	case "$expat" in
--	  yes)
-+	  yes|"")
- 		EXPAT_LIBS="-lexpat"
- 		;;
- 	    *)
diff --git a/meta/recipes-sato/matchbox-stroke/files/single-instance.patch b/meta/recipes-sato/matchbox-stroke/files/single-instance.patch
deleted file mode 100644
index 239aadb..0000000
--- a/meta/recipes-sato/matchbox-stroke/files/single-instance.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Multiple matchbox-stroke instances would occupy whole screen and cause end user
-confusing. Making matchbox-stroke singleton is one work around.
-
-This patch allow only one instance of matchbox-stroke based on some mechanism
-in matchbox-desktop.
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: matchbox-stroke/matchbox-stroke.desktop
-===================================================================
---- matchbox-stroke.orig/matchbox-stroke.desktop	2010-07-10 10:23:26.000000000 +0800
-+++ matchbox-stroke/matchbox-stroke.desktop	2010-12-22 20:59:26.000000000 +0800
-@@ -6,3 +6,5 @@
- Icon=matchbox-stroke.png
- Categories=Panel;Utility;MB
- X-MB-INPUT-MECHANSIM=True
-+X-MB-SingleInstance=true
-+StartupNotify=true
diff --git a/meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb b/meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb
deleted file mode 100644
index 79d5bf3..0000000
--- a/meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "Matchbox stroke recogniser"
-HOMEPAGE = "http://matchbox-project.org"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://src/matchbox-stroke.h;endline=12;md5=8ed5c5bbec2321fbf5d31bdd55af03aa"
-
-DEPENDS = "libfakekey expat libxft"
-SECTION = "x11/wm"
-SRCREV = "2b772583b61d2f6e8358e7c80e10293fc27cfcb7"
-PV = "0.0+git${SRCPV}"
-PR = "r0"
-
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
-           file://single-instance.patch \
-           file://configure_fix.patch;maxrev=1819"
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig gettext
-
-FILES_${PN} = "${bindir}/* \
-	       ${datadir}/applications \
-	       ${datadir}/pixmaps \
-		${datadir}/matchbox-stroke"
-- 
1.7.10.4



