Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DECC3ABB4
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:18 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.20175.1744723992837089535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KK8ZmutY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=btgKmLAJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019639a75676-d1f1b7d6-44dd-450f-bf0d-d9b0c5a91fb3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q+VAeJsipJeh4wNidXY3HnrmHb6QdpXElYzdnYXUSFY=;
	b=KK8ZmutYpK1BA3CosCXHjQhIJCRth6H0ExtMuAXyoRFCwcverY2PiQi5sP04pgEn
	JyI76Ex+BkZ26jJJkrJB9iJTx+Ybo0+HL8DFRc37Y7d1DIGMOKixJQksNufv1TfPSH9
	zYAw6LFnxzlWtKa+M79tikvyOWroGehxol2DgPsg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q+VAeJsipJeh4wNidXY3HnrmHb6QdpXElYzdnYXUSFY=;
	b=btgKmLAJXDcMBJl/LDtuirQCK0225CiRW9x7ZKB3Bk1xuRfIP5j7TSJX/zWywfvE
	QelAyiVMblGe2EgmHBG3lFOOIk+mqVxPAOzqQdzcoyRdBl6gY1TSHpk93g/jPQAL4rX
	rXZU0iJuCh1EaiKU/Z7abN8KHO0nW37UzwEg+arI=
Content-Type: multipart/mixed; boundary="===============8748365907454515454=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael@opdenacker.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-utils: upgrading to 1.2.14 SUCCEEDED
Message-ID: <0101019639a75676-d1f1b7d6-44dd-450f-bf0d-d9b0c5a91fb3-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214937

--===============8748365907454515454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *alsa-utils* to *1.2.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-utils-upgrade-1.2.13-1.2.14.patch
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
From da98a2a88eb24b5ac884906de98b23f5e1466514 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 10:45:20 +0000
Subject: [PATCH] alsa-utils: upgrade 1.2.13 -> 1.2.14

---
 ...restore.rules-fix-alsa_restore_go-st.patch | 42 -------------------
 ...restore.rules-fix-AMD-acp-pdm-mach-l.patch | 35 ----------------
 ...a-utils_1.2.13.bb => alsa-utils_1.2.14.bb} |  7 +---
 3 files changed, 2 insertions(+), 82 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-90-alsa-restore.rules-fix-alsa_restore_go-st.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0002-alsactl-90-alsa-restore.rules-fix-AMD-acp-pdm-mach-l.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.13.bb => alsa-utils_1.2.14.bb} (95%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-90-alsa-restore.rules-fix-alsa_restore_go-st.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-90-alsa-restore.rules-fix-alsa_restore_go-st.patch
deleted file mode 100644
index ea02fdb8c5..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-90-alsa-restore.rules-fix-alsa_restore_go-st.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From f90124c73edd050b24961197a4abcf17e53b41a8 Mon Sep 17 00:00:00 2001
-From: Jaroslav Kysela <perex@perex.cz>
-Date: Thu, 14 Nov 2024 09:38:49 +0100
-Subject: [PATCH 1/2] alsactl: 90-alsa-restore.rules - fix alsa_restore_go/std
-
-Fix the label mismatch which was introduced in the transition from the
-temporary test rules.
-
-Closes: https://github.com/alsa-project/alsa-utils/issues/280
-Fixes: 8116639 ("alsactl: 90-alsa-restore.rules - add support for AMD ACP digital microphone")
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-Upstream-Status: Backport [https://github.com/alsa-project/alsa-utils/commit/f90124c73edd050b24961197a4abcf17e53b41a8]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- alsactl/90-alsa-restore.rules.in | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/alsactl/90-alsa-restore.rules.in b/alsactl/90-alsa-restore.rules.in
-index 85f0b15f4856..dae2ed8ccc8f 100644
---- a/alsactl/90-alsa-restore.rules.in
-+++ b/alsactl/90-alsa-restore.rules.in
-@@ -3,6 +3,8 @@
- ACTION=="add", SUBSYSTEM=="sound", KERNEL=="controlC*", KERNELS!="card*",@extratest@ GOTO="alsa_restore_go"
- GOTO="alsa_restore_end"
- 
-+LABEL="alsa_restore_go"
-+
- ENV{ALSA_CARD_NUMBER}="$attr{device/number}"
- 
- # mark HDA analog card; HDMI/DP card does not have capture devices
-@@ -21,7 +23,7 @@ TEST!="/run/udev/alsa-hda-analog-card", GOTO="alsa_restore_std"
- IMPORT{program}="/usr/bin/cat /run/udev/alsa-hda-analog-card"
- ENV{ALSA_CARD_HDA_ANALOG}!="", ENV{ALSA_CARD_NUMBER}="$env{ALSA_CARD_HDA_ANALOG}"
- 
--LABEL="alsa_restore_go"
-+LABEL="alsa_restore_std"
- TEST!="@daemonswitch@", RUN+="@sbindir@/alsactl@args@ restore $env{ALSA_CARD_NUMBER}"
- TEST=="@daemonswitch@", RUN+="@sbindir@/alsactl@args@ nrestore $env{ALSA_CARD_NUMBER}"
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0002-alsactl-90-alsa-restore.rules-fix-AMD-acp-pdm-mach-l.patch b/meta/recipes-multimedia/alsa/alsa-utils/0002-alsactl-90-alsa-restore.rules-fix-AMD-acp-pdm-mach-l.patch
deleted file mode 100644
index 2299718d14..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-utils/0002-alsactl-90-alsa-restore.rules-fix-AMD-acp-pdm-mach-l.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 6f7ce73159c02b726a6f0fe0acff961c95e337a8 Mon Sep 17 00:00:00 2001
-From: Aaron Ma <aaron.ma@canonical.com>
-Date: Wed, 20 Nov 2024 15:55:02 +0800
-Subject: [PATCH 2/2] alsactl: 90-alsa-restore.rules - fix AMD acp-pdm-mach
- link
-
-The link name of AMD ACP digital microphones driver acp-pdm-mach
-is acp-dmic-codec. Fix it to make UCM initialize it again.
-
-Closes: https://github.com/alsa-project/alsa-utils/pull/281
-Fixes: 8116639 ("alsactl: 90-alsa-restore.rules - add support for AMD ACP digital microphone")
-Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-Upstream-Status: Backport [https://github.com/alsa-project/alsa-utils/commit/6f7ce73159c02b726a6f0fe0acff961c95e337a8]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- alsactl/90-alsa-restore.rules.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/alsactl/90-alsa-restore.rules.in b/alsactl/90-alsa-restore.rules.in
-index dae2ed8ccc8f..5db6080b0dc6 100644
---- a/alsactl/90-alsa-restore.rules.in
-+++ b/alsactl/90-alsa-restore.rules.in
-@@ -14,7 +14,7 @@ DRIVERS=="snd_hda_intel", TEST=="device/pcmC$env{ALSA_CARD_NUMBER}D0p", RUN+="/b
- TEST=="device/device/acp3x-dmic-capture", GOTO="alsa_hda_analog"
- TEST=="device/device/acp6x-dmic-capture", GOTO="alsa_hda_analog"
- TEST=="device/device/acp63-dmic-capture", GOTO="alsa_hda_analog"
--TEST=="device/device/acp-pdm-dmic", GOTO="alsa_hda_analog"
-+TEST=="device/device/acp-dmic-codec", GOTO="alsa_hda_analog"
- GOTO="alsa_restore_std"
- 
- LABEL="alsa_hda_analog"
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.13.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb
similarity index 95%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.13.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb
index 91dcee1453..74b36291d6 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.13.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb
@@ -24,11 +24,8 @@ PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev
 PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
-SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2 \
-           file://0001-alsactl-90-alsa-restore.rules-fix-alsa_restore_go-st.patch \
-           file://0002-alsactl-90-alsa-restore.rules-fix-AMD-acp-pdm-mach-l.patch \
-           "
-SRC_URI[sha256sum] = "1702a6b1cdf9ba3e996ecbc1ddcf9171e6808f5961d503d0f27e80ee162f1daa"
+SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "0794c74d33fed943e7c50609c13089e409312b6c403d6ae8984fc429c0960741"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
-- 
2.47.1


--===============8748365907454515454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/alsa-utils/alsa-utils-aconnect: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-aconnect: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsactl: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsactl: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsaloop: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsaloop: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsamixer: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsamixer: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsatplg: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsatplg: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsaucm: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsaucm: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-amixer: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-amixer: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-aplay: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-aplay: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-aseqdump: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-aseqdump: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-aseqnet: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-aseqnet: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-aseqsend: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-aseqsend: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-dbg: PKGSIZE changed from 2433408 to 2435456 (+0%)
packages/core2-64-poky-linux/alsa-utils/alsa-utils-dbg: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-dbg: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-dev: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-dev: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-doc: PKGSIZE changed from 107946 to 107865 (-0%)
packages/core2-64-poky-linux/alsa-utils/alsa-utils-doc: FILELIST: removed "/usr/share/man/man1/alsa-info.sh.1", added "/usr/share/man/man8/alsa-info.sh.8"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-doc: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-doc: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-iecset: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-iecset: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-de: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-de: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-eu: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-eu: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-fr: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-fr: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-ja: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-ja: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-ka: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-ka: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-ko: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-ko: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-ru: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-ru: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-sk: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-sk: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-midi: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-midi: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-nhltdmicinfo: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-nhltdmicinfo: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-scripts: PKGSIZE changed from 65569 to 65573 (+0%)
packages/core2-64-poky-linux/alsa-utils/alsa-utils-scripts: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-scripts: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-speakertest: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-speakertest: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-src: PKGSIZE changed from 1414423 to 1414824 (+0%)
packages/core2-64-poky-linux/alsa-utils/alsa-utils-src: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-src: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-staticdev: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-staticdev: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils/alsa-utils: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils: PV changed from "1.2.13" to "1.2.14"
packages/core2-64-poky-linux/alsa-utils: SRC_URI changed from "https://www.alsa-project.org/files/pub/utils/alsa-utils-1.2.13.tar.bz2 file://0001-alsactl-90-alsa-restore.rules-fix-alsa_restore_go-st.patch file://0002-alsactl-90-alsa-restore.rules-fix-AMD-acp-pdm-mach-l.patch" to "https://www.alsa-project.org/files/pub/utils/alsa-utils-1.2.14.tar.bz2"
packages/core2-64-poky-linux/alsa-utils: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/core2-64-poky-linux/alsa-utils: PV changed from "1.2.13" to "1.2.14"

--===============8748365907454515454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/alsa-utils/alsa-utils-doc: FILELIST: removed "/usr/share/man/man1/alsa-info.sh.1", added "/usr/share/man/man8/alsa-info.sh.8"

--===============8748365907454515454==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-utils-upgrade-1.2.13-1.2.14.patch"

RnJvbSBkYTk4YTJhODhlYjI0YjVhYzg4NDkwNmRlOThiMjNmNWUxNDY2NTE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMTA6NDU6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
bHNhLXV0aWxzOiB1cGdyYWRlIDEuMi4xMyAtPiAxLjIuMTQKCi0tLQogLi4ucmVzdG9yZS5ydWxl
cy1maXgtYWxzYV9yZXN0b3JlX2dvLXN0LnBhdGNoIHwgNDIgLS0tLS0tLS0tLS0tLS0tLS0tLQog
Li4ucmVzdG9yZS5ydWxlcy1maXgtQU1ELWFjcC1wZG0tbWFjaC1sLnBhdGNoIHwgMzUgLS0tLS0t
LS0tLS0tLS0tLQogLi4uYS11dGlsc18xLjIuMTMuYmIgPT4gYWxzYS11dGlsc18xLjIuMTQuYmJ9
IHwgIDcgKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDgyIGRlbGV0aW9u
cygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxz
YS11dGlscy8wMDAxLWFsc2FjdGwtOTAtYWxzYS1yZXN0b3JlLnJ1bGVzLWZpeC1hbHNhX3Jlc3Rv
cmVfZ28tc3QucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9hbHNhL2Fsc2EtdXRpbHMvMDAwMi1hbHNhY3RsLTkwLWFsc2EtcmVzdG9yZS5ydWxlcy1maXgt
QU1ELWFjcC1wZG0tbWFjaC1sLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
YWxzYS97YWxzYS11dGlsc18xLjIuMTMuYmIgPT4gYWxzYS11dGlsc18xLjIuMTQuYmJ9ICg5NSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzLzAw
MDEtYWxzYWN0bC05MC1hbHNhLXJlc3RvcmUucnVsZXMtZml4LWFsc2FfcmVzdG9yZV9nby1zdC5w
YXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGlscy8wMDAxLWFsc2Fj
dGwtOTAtYWxzYS1yZXN0b3JlLnJ1bGVzLWZpeC1hbHNhX3Jlc3RvcmVfZ28tc3QucGF0Y2gKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGVhMDJmZGI4YzUuLjAwMDAwMDAwMDAKLS0tIGEv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzLzAwMDEtYWxzYWN0bC05MC1h
bHNhLXJlc3RvcmUucnVsZXMtZml4LWFsc2FfcmVzdG9yZV9nby1zdC5wYXRjaAorKysgL2Rldi9u
dWxsCkBAIC0xLDQyICswLDAgQEAKLUZyb20gZjkwMTI0YzczZWRkMDUwYjI0OTYxMTk3YTRhYmNm
MTdlNTNiNDFhOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEphcm9zbGF2IEt5c2Vs
YSA8cGVyZXhAcGVyZXguY3o+Ci1EYXRlOiBUaHUsIDE0IE5vdiAyMDI0IDA5OjM4OjQ5ICswMTAw
Ci1TdWJqZWN0OiBbUEFUQ0ggMS8yXSBhbHNhY3RsOiA5MC1hbHNhLXJlc3RvcmUucnVsZXMgLSBm
aXggYWxzYV9yZXN0b3JlX2dvL3N0ZAotCi1GaXggdGhlIGxhYmVsIG1pc21hdGNoIHdoaWNoIHdh
cyBpbnRyb2R1Y2VkIGluIHRoZSB0cmFuc2l0aW9uIGZyb20gdGhlCi10ZW1wb3JhcnkgdGVzdCBy
dWxlcy4KLQotQ2xvc2VzOiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdXRp
bHMvaXNzdWVzLzI4MAotRml4ZXM6IDgxMTY2MzkgKCJhbHNhY3RsOiA5MC1hbHNhLXJlc3RvcmUu
cnVsZXMgLSBhZGQgc3VwcG9ydCBmb3IgQU1EIEFDUCBkaWdpdGFsIG1pY3JvcGhvbmUiKQotU2ln
bmVkLW9mZi1ieTogSmFyb3NsYXYgS3lzZWxhIDxwZXJleEBwZXJleC5jej4KLVVwc3RyZWFtLVN0
YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11dGls
cy9jb21taXQvZjkwMTI0YzczZWRkMDUwYjI0OTYxMTk3YTRhYmNmMTdlNTNiNDFhOF0KLVNpZ25l
ZC1vZmYtYnk6IEFsZXggS2llcm5hbiA8YWxleC5raWVybmFuQGdtYWlsLmNvbT4KLS0tLQotIGFs
c2FjdGwvOTAtYWxzYS1yZXN0b3JlLnJ1bGVzLmluIHwgNCArKystCi0gMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvYWxzYWN0bC85
MC1hbHNhLXJlc3RvcmUucnVsZXMuaW4gYi9hbHNhY3RsLzkwLWFsc2EtcmVzdG9yZS5ydWxlcy5p
bgotaW5kZXggODVmMGIxNWY0ODU2Li5kYWUyZWQ4Y2NjOGYgMTAwNjQ0Ci0tLS0gYS9hbHNhY3Rs
LzkwLWFsc2EtcmVzdG9yZS5ydWxlcy5pbgotKysrIGIvYWxzYWN0bC85MC1hbHNhLXJlc3RvcmUu
cnVsZXMuaW4KLUBAIC0zLDYgKzMsOCBAQAotIEFDVElPTj09ImFkZCIsIFNVQlNZU1RFTT09InNv
dW5kIiwgS0VSTkVMPT0iY29udHJvbEMqIiwgS0VSTkVMUyE9ImNhcmQqIixAZXh0cmF0ZXN0QCBH
T1RPPSJhbHNhX3Jlc3RvcmVfZ28iCi0gR09UTz0iYWxzYV9yZXN0b3JlX2VuZCIKLSAKLStMQUJF
TD0iYWxzYV9yZXN0b3JlX2dvIgotKwotIEVOVntBTFNBX0NBUkRfTlVNQkVSfT0iJGF0dHJ7ZGV2
aWNlL251bWJlcn0iCi0gCi0gIyBtYXJrIEhEQSBhbmFsb2cgY2FyZDsgSERNSS9EUCBjYXJkIGRv
ZXMgbm90IGhhdmUgY2FwdHVyZSBkZXZpY2VzCi1AQCAtMjEsNyArMjMsNyBAQCBURVNUIT0iL3J1
bi91ZGV2L2Fsc2EtaGRhLWFuYWxvZy1jYXJkIiwgR09UTz0iYWxzYV9yZXN0b3JlX3N0ZCIKLSBJ
TVBPUlR7cHJvZ3JhbX09Ii91c3IvYmluL2NhdCAvcnVuL3VkZXYvYWxzYS1oZGEtYW5hbG9nLWNh
cmQiCi0gRU5We0FMU0FfQ0FSRF9IREFfQU5BTE9HfSE9IiIsIEVOVntBTFNBX0NBUkRfTlVNQkVS
fT0iJGVudntBTFNBX0NBUkRfSERBX0FOQUxPR30iCi0gCi0tTEFCRUw9ImFsc2FfcmVzdG9yZV9n
byIKLStMQUJFTD0iYWxzYV9yZXN0b3JlX3N0ZCIKLSBURVNUIT0iQGRhZW1vbnN3aXRjaEAiLCBS
VU4rPSJAc2JpbmRpckAvYWxzYWN0bEBhcmdzQCByZXN0b3JlICRlbnZ7QUxTQV9DQVJEX05VTUJF
Un0iCi0gVEVTVD09IkBkYWVtb25zd2l0Y2hAIiwgUlVOKz0iQHNiaW5kaXJAL2Fsc2FjdGxAYXJn
c0AgbnJlc3RvcmUgJGVudntBTFNBX0NBUkRfTlVNQkVSfSIKLSAKLS0tIAotMi4yNS4xCi0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGlscy8wMDAyLWFs
c2FjdGwtOTAtYWxzYS1yZXN0b3JlLnJ1bGVzLWZpeC1BTUQtYWNwLXBkbS1tYWNoLWwucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHMvMDAwMi1hbHNhY3RsLTkw
LWFsc2EtcmVzdG9yZS5ydWxlcy1maXgtQU1ELWFjcC1wZG0tbWFjaC1sLnBhdGNoCmRlbGV0ZWQg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAyMjk5NzE4ZDE0Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGlscy8wMDAyLWFsc2FjdGwtOTAtYWxzYS1y
ZXN0b3JlLnJ1bGVzLWZpeC1BTUQtYWNwLXBkbS1tYWNoLWwucGF0Y2gKKysrIC9kZXYvbnVsbApA
QCAtMSwzNSArMCwwIEBACi1Gcm9tIDZmN2NlNzMxNTljMDJiNzI2YTZmMGZlMGFjZmY5NjFjOTVl
MzM3YTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBBYXJvbiBNYSA8YWFyb24ubWFA
Y2Fub25pY2FsLmNvbT4KLURhdGU6IFdlZCwgMjAgTm92IDIwMjQgMTU6NTU6MDIgKzA4MDAKLVN1
YmplY3Q6IFtQQVRDSCAyLzJdIGFsc2FjdGw6IDkwLWFsc2EtcmVzdG9yZS5ydWxlcyAtIGZpeCBB
TUQgYWNwLXBkbS1tYWNoCi0gbGluawotCi1UaGUgbGluayBuYW1lIG9mIEFNRCBBQ1AgZGlnaXRh
bCBtaWNyb3Bob25lcyBkcml2ZXIgYWNwLXBkbS1tYWNoCi1pcyBhY3AtZG1pYy1jb2RlYy4gRml4
IGl0IHRvIG1ha2UgVUNNIGluaXRpYWxpemUgaXQgYWdhaW4uCi0KLUNsb3NlczogaHR0cHM6Ly9n
aXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLXV0aWxzL3B1bGwvMjgxCi1GaXhlczogODExNjYz
OSAoImFsc2FjdGw6IDkwLWFsc2EtcmVzdG9yZS5ydWxlcyAtIGFkZCBzdXBwb3J0IGZvciBBTUQg
QUNQIGRpZ2l0YWwgbWljcm9waG9uZSIpCi1TaWduZWQtb2ZmLWJ5OiBBYXJvbiBNYSA8YWFyb24u
bWFAY2Fub25pY2FsLmNvbT4KLVNpZ25lZC1vZmYtYnk6IEphcm9zbGF2IEt5c2VsYSA8cGVyZXhA
cGVyZXguY3o+Ci1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGh1Yi5jb20v
YWxzYS1wcm9qZWN0L2Fsc2EtdXRpbHMvY29tbWl0LzZmN2NlNzMxNTljMDJiNzI2YTZmMGZlMGFj
ZmY5NjFjOTVlMzM3YThdCi1TaWduZWQtb2ZmLWJ5OiBBbGV4IEtpZXJuYW4gPGFsZXgua2llcm5h
bkBnbWFpbC5jb20+Ci0tLS0KLSBhbHNhY3RsLzkwLWFsc2EtcmVzdG9yZS5ydWxlcy5pbiB8IDIg
Ky0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKLQotZGlm
ZiAtLWdpdCBhL2Fsc2FjdGwvOTAtYWxzYS1yZXN0b3JlLnJ1bGVzLmluIGIvYWxzYWN0bC85MC1h
bHNhLXJlc3RvcmUucnVsZXMuaW4KLWluZGV4IGRhZTJlZDhjY2M4Zi4uNWRiNjA4MGIwZGM2IDEw
MDY0NAotLS0tIGEvYWxzYWN0bC85MC1hbHNhLXJlc3RvcmUucnVsZXMuaW4KLSsrKyBiL2Fsc2Fj
dGwvOTAtYWxzYS1yZXN0b3JlLnJ1bGVzLmluCi1AQCAtMTQsNyArMTQsNyBAQCBEUklWRVJTPT0i
c25kX2hkYV9pbnRlbCIsIFRFU1Q9PSJkZXZpY2UvcGNtQyRlbnZ7QUxTQV9DQVJEX05VTUJFUn1E
MHAiLCBSVU4rPSIvYgotIFRFU1Q9PSJkZXZpY2UvZGV2aWNlL2FjcDN4LWRtaWMtY2FwdHVyZSIs
IEdPVE89ImFsc2FfaGRhX2FuYWxvZyIKLSBURVNUPT0iZGV2aWNlL2RldmljZS9hY3A2eC1kbWlj
LWNhcHR1cmUiLCBHT1RPPSJhbHNhX2hkYV9hbmFsb2ciCi0gVEVTVD09ImRldmljZS9kZXZpY2Uv
YWNwNjMtZG1pYy1jYXB0dXJlIiwgR09UTz0iYWxzYV9oZGFfYW5hbG9nIgotLVRFU1Q9PSJkZXZp
Y2UvZGV2aWNlL2FjcC1wZG0tZG1pYyIsIEdPVE89ImFsc2FfaGRhX2FuYWxvZyIKLStURVNUPT0i
ZGV2aWNlL2RldmljZS9hY3AtZG1pYy1jb2RlYyIsIEdPVE89ImFsc2FfaGRhX2FuYWxvZyIKLSBH
T1RPPSJhbHNhX3Jlc3RvcmVfc3RkIgotIAotIExBQkVMPSJhbHNhX2hkYV9hbmFsb2ciCi0tLSAK
LTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2Et
dXRpbHNfMS4yLjEzLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxz
XzEuMi4xNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjEzLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjE0LmJiCmluZGV4IDkxZGNlZTE0NTMu
Ljc0YjM2MjkxZDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxz
YS11dGlsc18xLjIuMTMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNh
LXV0aWxzXzEuMi4xNC5iYgpAQCAtMjQsMTEgKzI0LDggQEAgUEFDS0FHRUNPTkZJR1t1ZGV2XSA9
ICItLXdpdGgtdWRldi1ydWxlcy1kaXI9YHBrZy1jb25maWcgLS12YXJpYWJsZT11ZGV2ZGlyIHVk
ZXYKIFBBQ0tBR0VDT05GSUdbbWFucGFnZXNdID0gIi0tZW5hYmxlLXhtbHRvLCAtLWRpc2FibGUt
eG1sdG8sIHhtbHRvLW5hdGl2ZSBkb2Nib29rLXhtbC1kdGQ0LW5hdGl2ZSBkb2Nib29rLXhzbC1z
dHlsZXNoZWV0cy1uYXRpdmUiCiAKICMgYWxzYS11dGlscyBzcGVjaWZpZWQgaW4gU1JDX1VSSSBk
dWUgdG8gYWxzYS11dGlscy1zY3JpcHRzIHJlY2lwZQotU1JDX1VSSSA9ICJodHRwczovL3d3dy5h
bHNhLXByb2plY3Qub3JnL2ZpbGVzL3B1Yi91dGlscy9hbHNhLXV0aWxzLSR7UFZ9LnRhci5iejIg
XAotICAgICAgICAgICBmaWxlOi8vMDAwMS1hbHNhY3RsLTkwLWFsc2EtcmVzdG9yZS5ydWxlcy1m
aXgtYWxzYV9yZXN0b3JlX2dvLXN0LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDItYWxz
YWN0bC05MC1hbHNhLXJlc3RvcmUucnVsZXMtZml4LUFNRC1hY3AtcGRtLW1hY2gtbC5wYXRjaCBc
Ci0gICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxNzAyYTZiMWNkZjliYTNlOTk2
ZWNiYzFkZGNmOTE3MWU2ODA4ZjU5NjFkNTAzZDBmMjdlODBlZTE2MmYxZGFhIgorU1JDX1VSSSA9
ICJodHRwczovL3d3dy5hbHNhLXByb2plY3Qub3JnL2ZpbGVzL3B1Yi91dGlscy9hbHNhLXV0aWxz
LSR7UFZ9LnRhci5iejIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDc5NGM3NGQzM2ZlZDk0M2U3
YzUwNjA5YzEzMDg5ZTQwOTMxMmI2YzQwM2Q2YWU4OTg0ZmM0MjljMDk2MDc0MSIKIAogIyBPbiBi
dWlsZCBtYWNoaW5lcyB3aXRoIHB5dGhvbi1kb2N1dGlscyAobm90IHB5dGhvbjMtZG9jdXRpbHMg
ISEpIGluc3RhbGxlZAogIyByc3QybWFuIChub3QgcnN0Mm1hbi5weSkgaXMgZGV0ZWN0ZWQgYW5k
IGNvbXBpbGUgZmFpbHMgd2l0aAotLSAKMi40Ny4xCgo=

--===============8748365907454515454==--

