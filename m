Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tkdqc-0007P6-U5
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 17:47:23 +0100
Received: from mail-la0-f69.google.com ([209.85.215.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 17 Dec 2012 08:32:40 -0800
Received: by mail-la0-f69.google.com with SMTP id w12so4291156lag.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 08:32:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=5tuk0LmnpW/nvIFV8uXbkbQJ1UQNBUVAKUOReIIb/5g=;
	b=VTE7a2+7RPQdb0NCOLMTTWGpGug2HXAVFtwwalFAQrv7x5gQsYFGFvjo1ZDKkqkm/c
	4o5/quViS5TsvCVAp52RTTA9JFcK2+zKNtgjF5E+dwn5zQFxZys/DZNKUH/YGM0KVG66
	K2XdAOjuYyKLuXwtEf4fnsYP/79qK0AwrgBjferaG62Lccltym0dhKsHqYlo/D8JXaCL
	cy+eFdKBvdUK1f28VjafzxAA9wOGOFVkHVs1jtbO/heRXY5EQjc3T1SI/2qdQLfUXv7D
	KidsOn5H7RDUKyHg2eCbemJIVazpF7Xh0a72Z6bpjqNEvZLW1WzwGEhS3rxo6PvpPjLE
	HvxQ==
X-Received: by 10.180.92.74 with SMTP id ck10mr16839239wib.9.1355761958281;
	Mon, 17 Dec 2012 08:32:38 -0800 (PST)
X-Received: by 10.180.92.74 with SMTP id ck10mr16839227wib.9.1355761958179;
	Mon, 17 Dec 2012 08:32:38 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id s16sm6529991wii.0.2012.12.17.08.32.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Dec 2012 08:32:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 16:26:53 +0000
Message-Id: <1355761613-32597-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1355761613-32597-1-git-send-email-ross.burton@intel.com>
References: <1355761613-32597-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQndWtw3u8lw1UYxaaMSuxvf0OH8zcD3Jgc5nZL8kyexSDwKVm4jkwj+E6yymgt0hiWAw9kCJjCAvCbnW26khHJZ8DKEw2i71dh9HsITGo+mC9uD2OONrb1WyrqYXhpehml5E6KndobuxnMHb6h1B6cwJAI/nyRpk6LLIeRcxU4XmCay+Xhu5JPtlk0Y3qIjP4e3RQQ3
Subject: [PATCH 2/2] matchbox-wm-2: remove
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
X-List-Received-Date: Mon, 17 Dec 2012 16:47:23 -0000

Matchbox Window Manager 2 is more of a framework than a window manager,
certainly isn't ready to replace v1 yet, and isn't under active development.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../matchbox-wm-2/matchbox-wm-2/fix_makefile.patch |   21 ---------
 .../matchbox-wm-2/matchbox-wm-2_git.bb             |   45 --------------------
 2 files changed, 66 deletions(-)
 delete mode 100644 meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2/fix_makefile.patch
 delete mode 100644 meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb

diff --git a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2/fix_makefile.patch b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2/fix_makefile.patch
deleted file mode 100644
index 1f877d7..0000000
--- a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2/fix_makefile.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Accepted
-Instead matchbox-window-manager-2, it is in libmatchboxwm2, which has build
-failure as partial gtk-doc implementation.
-
-Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/10
-Fix following build error:
-| Makefile:734: *** missing separator (did you mean TAB instead of 8 spaces?).  Stop.
-| ERROR: oe_runmake failed
-
-Index: matchbox-window-manager-2/Makefile.am
-===================================================================
---- matchbox-window-manager-2.orig/Makefile.am
-+++ matchbox-window-manager-2/Makefile.am
-@@ -3,6 +3,6 @@ SUBDIRS = matchbox data doc util
- # Extra clean files so that maintainer-clean removes *everything*
- 
- snapshot:
--        $(MAKE) dist distdir=$(PACKAGE)-snapshot-`date +"%Y%m%d"`
-+	$(MAKE) dist distdir=$(PACKAGE)-snapshot-`date +"%Y%m%d"`
- 
- MAINTAINERCLEANFILES = aclocal.m4 compile config.guess config.sub configure depcomp install-sh ltmain.sh Makefile.in missing
diff --git a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb
deleted file mode 100644
index 7369339..0000000
--- a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SECTION = "x11/wm"
-DESCRIPTION = "Matchbox window manager"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://matchbox/core/mb-wm.h;endline=21;md5=1b1d328a527906350ea7ce7ab1bb7564"
-
-DEPENDS = "virtual/libx11 libxext libxrender startup-notification expat gconf pango libxdamage libxcomposite gtk+"
-
-SRCREV = "01fa5465743c9ee43d040350f4405d35293e4869"
-PV = "0.1+git${SRCPV}"
-PR = "r2"
-
-SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager-2;protocol=git \
-	file://fix_makefile.patch \
-	  "
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig update-alternatives
-
-# Change this to x-session-manager->matchbox-session and put in
-# matchbox-session, then change this to x-window-manager to
-# matchbox-window-manager-2.
-ALTERNATIVE_${PN} = "x-window-manager"
-ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/matchbox-window-manager"
-ALTERNATIVE_PRIORITY = "10"
-
-PACKAGES =+ "libmatchbox2"
-
-FILES_libmatchbox2 = "${libdir}/*${SOLIBS}"
-
-FILES_${PN} += "${datadir}/matchbox-2 \
-                ${sysconfdir}/matchbox-2 \
-                ${datadir}/themes/*"
-
-EXTRA_OECONF = 	"--enable-debug			\
-                 --enable-simple-manager \
-                 --enable-compositing-manager	\
-                 --enable-libmatchbox \
-                 --enable-png-theme \
-		"
-
-do_install_append () {
-	cd ${D}${bindir}
-	ln -s matchbox-window-manager-2-simple matchbox-window-manager
-}
-- 
1.7.10



