Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C1DFEEE272
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:38:11 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.103064.1767267481794377899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:38:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LY5Crv4J;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JNVyh/r8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019b7959b61b-8d88da9c-f335-4d1d-bb5a-4e9c6b0355be-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267481;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q55oDNnujlok+dxSANch6vQZ6fjY7dVcCgz1/FfaxJY=;
	b=LY5Crv4JAxqWmsKOSKfapFPctqSxPTmkWYaJjyAlBrmFyoSZP7VHKskhjl8hl4/0
	6aWnuhrl5kgIUklE2D/sba+76l/NCZAKq/AYQY8Jyg6aU0DmABhl1uYzFnlJbkYMRay
	nTDCGkPEzyInYffl21ZEFbZxv0UclCiXA8QLuMZY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267481;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q55oDNnujlok+dxSANch6vQZ6fjY7dVcCgz1/FfaxJY=;
	b=JNVyh/r8Oy+ba9A2yGj8G6NRWK+rTakratFxEe/vkL8tzHthpY/6YoDPGEwRmHRv
	httq0XhXAP+saUthQDJkmWNocNOQfa/7qMxI7L7nlXPnnE2rHBHjj6qG/VrmVhdd7Hy
	kEh241guTNWCbntH+q6pPK6XZcs1sXeJZVvh1Mvo=
Content-Type: multipart/mixed; boundary="===============6892292804280448744=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-utils: upgrading to 1.2.15.1 SUCCEEDED
Message-ID: <0101019b7959b61b-8d88da9c-f335-4d1d-bb5a-4e9c6b0355be-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:38:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228803

--===============6892292804280448744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *alsa-utils* to *1.2.15.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-utils-upgrade-1.2.15-1.2.15.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From f68bd4cf99d41757842b59d9e1742594ed221b5a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 10:50:32 +0000
Subject: [PATCH] alsa-utils: upgrade 1.2.15 -> 1.2.15.1

---
 ...sactl-fix-build-when-in-subdirectory.patch | 29 -------------------
 ...utils_1.2.15.bb => alsa-utils_1.2.15.1.bb} |  5 ++--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils-1.2.15/0001-alsactl-fix-build-when-in-subdirectory.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.15.bb => alsa-utils_1.2.15.1.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.2.15/0001-alsactl-fix-build-when-in-subdirectory.patch b/meta/recipes-multimedia/alsa/alsa-utils-1.2.15/0001-alsactl-fix-build-when-in-subdirectory.patch
deleted file mode 100644
index d1c6b3d830..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-utils-1.2.15/0001-alsactl-fix-build-when-in-subdirectory.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 10587067fcf5b05e7fa5a84c38238dbffd079c4f Mon Sep 17 00:00:00 2001
-From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
-Date: Mon, 8 Dec 2025 11:12:34 +0000
-Subject: [PATCH] alsactl: fix build when in subdirectory
-
-From: Rudi Heitbaum <rudi@heitbaum.com>
-
-create the conf directory as part of the edit recipe
-
-Closes: https://github.com/alsa-project/alsa-utils/pull/311
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-Upstream-Status: Backport [10587067fcf5b05e7fa5a84c38238dbffd079c4f]
----
- alsactl/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/alsactl/Makefile.am b/alsactl/Makefile.am
-index 48b7c7a..c8729e0 100644
---- a/alsactl/Makefile.am
-+++ b/alsactl/Makefile.am
-@@ -47,6 +47,7 @@ endif
- edit = \
- 	extratest=$$(echo ' $(ALSACTL_UDEV_EXTRATEST)' | sed -e 's/__/ /g' -e 's/^ $$//'); \
- 	args=$$(echo ' $(ALSACTL_UDEV_ARGS)' | sed -e 's/__/ /g' -e 's/^ $$//'); \
-+	mkdir -p conf; \
- 	$(SED) -r -e 's,@sbindir\@,$(sbindir),g' \
- 		  -e 's,@mydatadir\@,$(mydatadir),g' \
- 		  -e 's,@daemonswitch\@,$(ALSACTL_DAEMONSWITCH),g' \
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
index 09b3de81f4..dad5478f39 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
@@ -24,9 +24,8 @@ PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev
 PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
-SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2 \
-	   file://0001-alsactl-fix-build-when-in-subdirectory.patch"
-SRC_URI[sha256sum] = "d3183d2ed2d69e9143c5beb97036267c3fdabfe8bfbea8bc6863f17b1f0b568e"
+SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "5ad79f349e59c30c9a4929ad4995ebee33267473e0e632d7c1a30e2b093d3327"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
-- 
2.47.1


--===============6892292804280448744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aconnect: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aconnect: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsactl: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsactl: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaloop: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaloop: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsamixer: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsamixer: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsatplg: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsatplg: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaucm: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaucm: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-amixer: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-amixer: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aplay: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aplay: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqdump: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqdump: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqnet: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqnet: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqsend: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqsend: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-dbg: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-dbg: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-dbg: PKGSIZE changed from 2477464 to 2479536 (+0%)
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-dev: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-dev: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-doc: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-doc: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-iecset: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-iecset: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-de: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-de: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-eu: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-eu: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-fr: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-fr: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ja: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ja: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ka: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ka: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ko: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ko: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ru: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ru: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-sk: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-sk: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-midi: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-midi: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-nhltdmicinfo: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-nhltdmicinfo: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-scripts: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-scripts: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-scripts: PKGSIZE changed from 65573 to 65575 (+0%)
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-speakertest: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-speakertest: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-src: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-src: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-src: FILELIST: directory renamed /usr/src/debug/alsa-utils/1.2.15/amidi -> /usr/src/debug/alsa-utils/1.2.15.1/amidi, directory renamed /usr/src/debug/alsa-utils/1.2.15/topology/nhlt/intel/dmic -> /usr/src/debug/alsa-utils/1.2.15.1/topology/nhlt/intel/dmic, directory renamed /usr/src/debug/alsa-utils/1.2.15/topology/nhlt/intel/ssp -> /usr/src/debug/alsa-utils/1.2.15.1/topology/nhlt/intel/ssp, directory renamed /usr/src/debug/alsa-utils/1.2.15/seq/aseqnet -> /usr/src/debug/alsa-utils/1.2.15.1/seq/aseqnet, directory renamed /usr/src/debug/alsa-utils/1.2.15/seq/aconnect -> /usr/src/debug/alsa-utils/1.2.15.1/seq/aconnect, directory renamed /usr/src/debug/alsa-utils/1.2.15/seq/aplaymidi -> /usr/src/debug/alsa-utils/1.2.15.1/seq/aplaymidi, directory renamed /usr/src/debug/alsa-utils/1.2.15/seq/aseqdump -> /usr/src/debug/alsa-utils/1.2.15.1/seq/aseqdump, directory renamed /usr/src/debug/alsa-utils/1.2.15/topology/nhlt -> /usr/src/debug/alsa
 -utils/1.2.15.1/topology/nhlt, directory renamed /usr/src/debug/alsa-utils/1.2.15/amixer -> /usr/src/debug/alsa-utils/1.2.15.1/amixer, directory renamed /usr/src/debug/alsa-utils/1.2.15/alsactl -> /usr/src/debug/alsa-utils/1.2.15.1/alsactl, directory renamed /usr/src/debug/alsa-utils/1.2.15/iecset -> /usr/src/debug/alsa-utils/1.2.15.1/iecset, directory renamed /usr/src/debug/alsa-utils/1.2.15/axfer -> /usr/src/debug/alsa-utils/1.2.15.1/axfer, directory renamed /usr/src/debug/alsa-utils/1.2.15/alsaucm -> /usr/src/debug/alsa-utils/1.2.15.1/alsaucm, directory renamed /usr/src/debug/alsa-utils/1.2.15/nhlt -> /usr/src/debug/alsa-utils/1.2.15.1/nhlt, directory renamed /usr/src/debug/alsa-utils/1.2.15/aplay -> /usr/src/debug/alsa-utils/1.2.15.1/aplay, directory renamed /usr/src/debug/alsa-utils/1.2.15/seq/aplaymidi2 -> /usr/src/debug/alsa-utils/1.2.15.1/seq/aplaymidi2, directory renamed /usr/src/debug/alsa-utils/1.2.15/seq/aseqsend -> /usr/src/debug/alsa-utils/1.2.15.1/seq/aseqsend, direct
 ory renamed /usr/src/debug/alsa-utils/1.2.15/speaker-test -> /usr/src/debug/alsa-utils/1.2.15.1/speaker-test, directory renamed /usr/src/debug/alsa-utils/1.2.15/topology/nhlt/intel -> /usr/src/debug/alsa-utils/1.2.15.1/topology/nhlt/intel, directory renamed /usr/src/debug/alsa-utils/1.2.15/topology -> /usr/src/debug/alsa-utils/1.2.15.1/topology, directory renamed /usr/src/debug/alsa-utils/1.2.15/alsamixer -> /usr/src/debug/alsa-utils/1.2.15.1/alsamixer, directory renamed /usr/src/debug/alsa-utils/1.2.15/alsaloop -> /usr/src/debug/alsa-utils/1.2.15.1/alsaloop
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-src: PKGSIZE changed from 1466607 to 1466616 (+0%)
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-staticdev: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-staticdev: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/x86-64-v3-poky-linux/alsa-utils: PV changed from "1.2.15" to "1.2.15.1"
packages/x86-64-v3-poky-linux/alsa-utils: SRC_URI changed from "https://www.alsa-project.org/files/pub/utils/alsa-utils-1.2.15.tar.bz2 file://0001-alsactl-fix-build-when-in-subdirectory.patch" to "https://www.alsa-project.org/files/pub/utils/alsa-utils-1.2.15.1.tar.bz2"
packages/x86-64-v3-poky-linux/alsa-utils: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]

--===============6892292804280448744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1955 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-3878b5bc3186a34a0a08b0d02bc60db30e1bea1f"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:3878b5bc3186a34a0a08b0d02bc60db30e1bea1f"
meta-yocto-bsp       
meta-poky            = "master:853589ccc3445f5952efc02a7102587cb4d4f075"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 332 Local 301 Mirrors 0 Missed 31 Current 253 (90% match, 94% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 267 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa_setscene)
NOTE: Running setscene task 280 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 309 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 341 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 342 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 345 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running task 885 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_recipe_qa)
NOTE: Running task 892 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_recipe_qa)
NOTE: Running task 897 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb:do_recipe_qa)
NOTE: recipe bash-5.3-r0: task do_package_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_recipe_qa: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_recipe_qa: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_recipe_qa: Started
NOTE: recipe bash-5.3-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 357 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 360 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 364 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 365 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb:do_create_spdx_setscene)
NOTE: Running setscene task 369 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 378 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 379 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 384 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 970 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_fetch)
NOTE: Running task 971 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_fetch)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 981 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 386 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 389 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_fetch: Started
NOTE: Running setscene task 396 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_fetch: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_fetch: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 397 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 398 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 399 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 400 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 401 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 402 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 406 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 409 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 412 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 413 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/alsa-lib/1.2.15/temp/log.do_packagedata_setscene.1766602
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 415 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 416 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 417 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 424 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb:do_package_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 437 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 446 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 456 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 459 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 463 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 472 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1023 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_unpack)
NOTE: Running task 1038 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1044 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 480 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 483 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 490 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 491 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 492 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_unpack: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_unpack: Started
NOTE: Running setscene task 495 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 496 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-state-0.2.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 497 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 501 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 502 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.15-r0: task do_package_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1114 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1115 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: Running task 1118 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_patch)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 514 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1119 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_patch)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 516 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_patch: Started
NOTE: Running task 1120 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1121 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_patch: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 518 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-state-0.2.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 521 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1132 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: Running task 1133 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running task 1134 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1135 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_populate_lic)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1141 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_populate_lic: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.15-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 526 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1158 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_populate_lic: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1165 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1171 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1172 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 533 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 534 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 542 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 544 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 551 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 557 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 561 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 568 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 569 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1201 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 581 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 583 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 585 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1446 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb:do_packagedata)
NOTE: Running task 1455 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1516 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1601 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb:do_collect_spdx_deps)
NOTE: recipe alsa-lib-1.2.15-r0: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1609 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1610 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.15-r0: task do_packagedata: Succeeded
NOTE: Running task 1616 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_collect_spdx_deps)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1617 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_compile: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe alsa-state-0.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1618 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe alsa-state-0.2.0-r0: task do_install: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_install: Succeeded
NOTE: Running task 1619 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: Running task 1620 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb:do_populate_sysroot)
NOTE: recipe alsa-state-0.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_package: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r0: task do_package: Succeeded
NOTE: Running task 1621 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r0: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1622 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb:do_create_spdx)
NOTE: recipe alsa-state-0.2.0-r0: task do_create_spdx: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1623 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_compile)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_compile: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1624 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_install)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_install: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_install: Succeeded
NOTE: Running task 1625 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_package)
NOTE: Running task 1626 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_package: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1627 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1628 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_configure)
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_package: Succeeded
NOTE: Running task 1629 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1630 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_create_spdx)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_create_spdx: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1631 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_collect_spdx_deps)
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1632 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_compile)
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_compile: Succeeded
NOTE: Running task 1633 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_install)
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_install: Succeeded
NOTE: Running task 1634 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_package)
NOTE: Running task 1635 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_populate_sysroot)
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_package: Succeeded
NOTE: Running task 1636 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1637 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_create_spdx)
NOTE: Running task 1638 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_ipk)
NOTE: Running task 1639 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_deb)
NOTE: Running task 1640 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 1641 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_qa)
NOTE: Running task 1642 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_package_write_ipk)
NOTE: Running task 1643 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_package_write_deb)
NOTE: Running task 1644 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_package_write_rpm)
NOTE: Running task 1645 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_package_qa)
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_create_spdx: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_package_write_deb: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_package_write_ipk: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_package_qa: Started
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_package_write_ipk: Started
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_package_write_deb: Started
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_package_qa: Started
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1646 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_create_package_spdx)
NOTE: recipe alsa-state-0.2.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe alsa-state-0.2.0-r0: task do_package_qa: Succeeded
NOTE: recipe alsa-state-0.2.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_create_package_spdx: Started
NOTE: recipe alsa-state-0.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe alsa-utils-1.2.15.1-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 1647 of 1647 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1647 tasks of which 1584 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: alsa-lib-1.2.15-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.15.1-r0 to 0:1.2.15-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.15.1-r0 to 0:1.2.15-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.15.1-r0 to 0:1.2.15-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.15.1-r0 to 0:1.2.15-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15-r0 do_packagedata_setscene: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.15.1-r0 to 0:1.2.15-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.15.1-r0 to 0:1.2.15-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.15.1-r0 to 0:1.2.15-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.15.1-r0 to 0:1.2.15-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.15.1-r0 to 0:1.2.15-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.15.1-r0 to 0:1.2.15-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6892292804280448744==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-utils-upgrade-1.2.15-1.2.15.1.patch"

RnJvbSBmNjhiZDRjZjk5ZDQxNzU3ODQyYjU5ZDllMTc0MjU5NGVkMjIxYjVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAxMDo1MDozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFs
c2EtdXRpbHM6IHVwZ3JhZGUgMS4yLjE1IC0+IDEuMi4xNS4xCgotLS0KIC4uLnNhY3RsLWZpeC1i
dWlsZC13aGVuLWluLXN1YmRpcmVjdG9yeS5wYXRjaCB8IDI5IC0tLS0tLS0tLS0tLS0tLS0tLS0K
IC4uLnV0aWxzXzEuMi4xNS5iYiA9PiBhbHNhLXV0aWxzXzEuMi4xNS4xLmJifSB8ICA1ICsrLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkKIGRlbGV0
ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHMtMS4y
LjE1LzAwMDEtYWxzYWN0bC1maXgtYnVpbGQtd2hlbi1pbi1zdWJkaXJlY3RvcnkucGF0Y2gKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL3thbHNhLXV0aWxzXzEuMi4xNS5iYiA9
PiBhbHNhLXV0aWxzXzEuMi4xNS4xLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGlscy0xLjIuMTUvMDAwMS1hbHNhY3RsLWZpeC1idWls
ZC13aGVuLWluLXN1YmRpcmVjdG9yeS5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fs
c2EvYWxzYS11dGlscy0xLjIuMTUvMDAwMS1hbHNhY3RsLWZpeC1idWlsZC13aGVuLWluLXN1YmRp
cmVjdG9yeS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZDFjNmIzZDgzMC4u
MDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHMt
MS4yLjE1LzAwMDEtYWxzYWN0bC1maXgtYnVpbGQtd2hlbi1pbi1zdWJkaXJlY3RvcnkucGF0Y2gK
KysrIC9kZXYvbnVsbApAQCAtMSwyOSArMCwwIEBACi1Gcm9tIDEwNTg3MDY3ZmNmNWIwNWU3ZmE1
YTg0YzM4MjM4ZGJmZmQwNzljNGYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBNaWNo
YWVsIE9wZGVuYWNrZXIgPG1pY2hhZWwub3BkZW5hY2tlckByb290Y29tbWl0LmNvbT4KLURhdGU6
IE1vbiwgOCBEZWMgMjAyNSAxMToxMjozNCArMDAwMAotU3ViamVjdDogW1BBVENIXSBhbHNhY3Rs
OiBmaXggYnVpbGQgd2hlbiBpbiBzdWJkaXJlY3RvcnkKLQotRnJvbTogUnVkaSBIZWl0YmF1bSA8
cnVkaUBoZWl0YmF1bS5jb20+Ci0KLWNyZWF0ZSB0aGUgY29uZiBkaXJlY3RvcnkgYXMgcGFydCBv
ZiB0aGUgZWRpdCByZWNpcGUKLQotQ2xvc2VzOiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9q
ZWN0L2Fsc2EtdXRpbHMvcHVsbC8zMTEKLVNpZ25lZC1vZmYtYnk6IFJ1ZGkgSGVpdGJhdW0gPHJ1
ZGlAaGVpdGJhdW0uY29tPgotU2lnbmVkLW9mZi1ieTogSmFyb3NsYXYgS3lzZWxhIDxwZXJleEBw
ZXJleC5jej4KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgWzEwNTg3MDY3ZmNmNWIwNWU3ZmE1
YTg0YzM4MjM4ZGJmZmQwNzljNGZdCi0tLS0KLSBhbHNhY3RsL01ha2VmaWxlLmFtIHwgMSArCi0g
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCi0KLWRpZmYgLS1naXQgYS9hbHNhY3RsL01h
a2VmaWxlLmFtIGIvYWxzYWN0bC9NYWtlZmlsZS5hbQotaW5kZXggNDhiN2M3YS4uYzg3MjllMCAx
MDA2NDQKLS0tLSBhL2Fsc2FjdGwvTWFrZWZpbGUuYW0KLSsrKyBiL2Fsc2FjdGwvTWFrZWZpbGUu
YW0KLUBAIC00Nyw2ICs0Nyw3IEBAIGVuZGlmCi0gZWRpdCA9IFwKLSAJZXh0cmF0ZXN0PSQkKGVj
aG8gJyAkKEFMU0FDVExfVURFVl9FWFRSQVRFU1QpJyB8IHNlZCAtZSAncy9fXy8gL2cnIC1lICdz
L14gJCQvLycpOyBcCi0gCWFyZ3M9JCQoZWNobyAnICQoQUxTQUNUTF9VREVWX0FSR1MpJyB8IHNl
ZCAtZSAncy9fXy8gL2cnIC1lICdzL14gJCQvLycpOyBcCi0rCW1rZGlyIC1wIGNvbmY7IFwKLSAJ
JChTRUQpIC1yIC1lICdzLEBzYmluZGlyXEAsJChzYmluZGlyKSxnJyBcCi0gCQkgIC1lICdzLEBt
eWRhdGFkaXJcQCwkKG15ZGF0YWRpciksZycgXAotIAkJICAtZSAncyxAZGFlbW9uc3dpdGNoXEAs
JChBTFNBQ1RMX0RBRU1PTlNXSVRDSCksZycgXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzXzEuMi4xNS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2Fsc2EvYWxzYS11dGlsc18xLjIuMTUuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjE1LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjE1
LjEuYmIKaW5kZXggMDliM2RlODFmNC4uZGFkNTQ3OGYzOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzXzEuMi4xNS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjE1LjEuYmIKQEAgLTI0LDkgKzI0LDgg
QEAgUEFDS0FHRUNPTkZJR1t1ZGV2XSA9ICItLXdpdGgtdWRldi1ydWxlcy1kaXI9YHBrZy1jb25m
aWcgLS12YXJpYWJsZT11ZGV2ZGlyIHVkZXYKIFBBQ0tBR0VDT05GSUdbbWFucGFnZXNdID0gIi0t
ZW5hYmxlLXhtbHRvLCAtLWRpc2FibGUteG1sdG8sIHhtbHRvLW5hdGl2ZSBkb2Nib29rLXhtbC1k
dGQ0LW5hdGl2ZSBkb2Nib29rLXhzbC1zdHlsZXNoZWV0cy1uYXRpdmUiCiAKICMgYWxzYS11dGls
cyBzcGVjaWZpZWQgaW4gU1JDX1VSSSBkdWUgdG8gYWxzYS11dGlscy1zY3JpcHRzIHJlY2lwZQot
U1JDX1VSSSA9ICJodHRwczovL3d3dy5hbHNhLXByb2plY3Qub3JnL2ZpbGVzL3B1Yi91dGlscy9h
bHNhLXV0aWxzLSR7UFZ9LnRhci5iejIgXAotCSAgIGZpbGU6Ly8wMDAxLWFsc2FjdGwtZml4LWJ1
aWxkLXdoZW4taW4tc3ViZGlyZWN0b3J5LnBhdGNoIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQz
MTgzZDJlZDJkNjllOTE0M2M1YmViOTcwMzYyNjdjM2ZkYWJmZThiZmJlYThiYzY4NjNmMTdiMWYw
YjU2OGUiCitTUkNfVVJJID0gImh0dHBzOi8vd3d3LmFsc2EtcHJvamVjdC5vcmcvZmlsZXMvcHVi
L3V0aWxzL2Fsc2EtdXRpbHMtJHtQVn0udGFyLmJ6MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1
YWQ3OWYzNDllNTljMzBjOWE0OTI5YWQ0OTk1ZWJlZTMzMjY3NDczZTBlNjMyZDdjMWEzMGUyYjA5
M2QzMzI3IgogCiAjIE9uIGJ1aWxkIG1hY2hpbmVzIHdpdGggcHl0aG9uLWRvY3V0aWxzIChub3Qg
cHl0aG9uMy1kb2N1dGlscyAhISkgaW5zdGFsbGVkCiAjIHJzdDJtYW4gKG5vdCByc3QybWFuLnB5
KSBpcyBkZXRlY3RlZCBhbmQgY29tcGlsZSBmYWlscyB3aXRoCi0tIAoyLjQ3LjEKCg==

--===============6892292804280448744==--

