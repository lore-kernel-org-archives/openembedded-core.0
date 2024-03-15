Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184DFC54ECD
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:14 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.1278.1710522013030419215
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bPS+fp5v;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=4OfPuoUr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018e430e9470-a0ebeaea-56ab-411d-b489-9d7d6628147e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522012;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cO3LtWBDWJkSObiVslDuNAH2/KIzIlOzIF42nDnAWL0=;
	b=bPS+fp5vd14O0ei8nDdXGr4RDrEz3SSgUHXnDNo0H2VpDi9MrfOZ1qVPImUzbHeC
	71GihsF4QesyMgyNYiDzFB82RVLH0xcRxccs036kfyrwW9iYrq+ejbNcFOmPUrLg46s
	+VB+ZfTPQLkdnGOLdw3jiag+Hk4owP09q9DIJYIQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522012;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cO3LtWBDWJkSObiVslDuNAH2/KIzIlOzIF42nDnAWL0=;
	b=4OfPuoUrRE2H+Xk5YgUE+ZcI7farxVBgsXKiM3/9HLURpNBZI4wvrPNG6SoI+VJ2
	HP/e+0m78inZkb8CUzfOsJjRbgKq6DYOuc+UZZCsiQ/xRH/7+5w1212zXeojubn8xZs
	2IWYV0VsZh5o1EwIcqAHpuYFau/73I+WKOrSSHXk=
Content-Type: multipart/mixed; boundary="===============1206741630762816626=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] psmisc: upgrading to 23.7 SUCCEEDED
Message-ID: <0101018e430e9470-a0ebeaea-56ab-411d-b489-9d7d6628147e-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197196

--===============1206741630762816626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *psmisc* to *23.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-psmisc-upgrade-23.6-23.7.patch
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
From 17cf28fb7d2a54b64d198ce171d5dd9e12c75e2a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 10:47:10 +0000
Subject: [PATCH] psmisc: upgrade 23.6 -> 23.7

---
 .../psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch | 6 +++---
 .../psmisc/{psmisc_23.6.bb => psmisc_23.7.bb}               | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/psmisc/{psmisc_23.6.bb => psmisc_23.7.bb} (85%)

diff --git a/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch b/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch
index ca13bdbd15..61d998d687 100644
--- a/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch
+++ b/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch
@@ -1,4 +1,4 @@
-From 115fcf1daff18aa2f2e130d63704f04031878db0 Mon Sep 17 00:00:00 2001
+From df1ec0991a44a1a255af9dd06c2cfdf4a52a4672 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 24 Mar 2016 15:46:14 +0000
 Subject: [PATCH] Use UINTPTR_MAX instead of __WORDSIZE
@@ -13,7 +13,7 @@ Upstream-Status: Pending
  1 file changed, 8 insertions(+), 5 deletions(-)
 
 diff --git a/src/peekfd.c b/src/peekfd.c
-index 5aa990a..7e8e3fc 100644
+index 36dff04..2b4b1dc 100644
 --- a/src/peekfd.c
 +++ b/src/peekfd.c
 @@ -30,8 +30,11 @@
@@ -28,7 +28,7 @@ index 5aa990a..7e8e3fc 100644
  #include <getopt.h>
  #include <ctype.h>
  #include <dirent.h>
-@@ -266,11 +269,11 @@ int main(int argc, char **argv)
+@@ -341,11 +344,11 @@ int main(int argc, char **argv)
  		if (WIFSTOPPED(status)) {
  #ifdef PPC
  			struct pt_regs regs;
diff --git a/meta/recipes-extended/psmisc/psmisc_23.6.bb b/meta/recipes-extended/psmisc/psmisc_23.7.bb
similarity index 85%
rename from meta/recipes-extended/psmisc/psmisc_23.6.bb
rename to meta/recipes-extended/psmisc/psmisc_23.7.bb
index 2e55ad00bd..ea272cd92d 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.6.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.7.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https;branch=master \
            file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
            "
-SRCREV = "3098e641dc1ddb210186f53464255670b480377b"
+SRCREV = "9091d6dbcce3d8fb87adf9249a2eb346d25a562c"
 S = "${WORKDIR}/git"
-- 
2.42.0


--===============1206741630762816626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/psmisc/fuser-doc: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/fuser-doc: PKGSIZE changed from 7585 to 7817 (+3%)
packages/core2-64-poky-linux/psmisc/fuser-doc: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/fuser: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/fuser: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/killall-doc: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/killall-doc: PKGSIZE changed from 5435 to 5456 (+0%)
packages/core2-64-poky-linux/psmisc/killall-doc: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/killall: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/killall: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc: PACKAGES: added "psmisc-locale-ko psmisc-locale-ka"
packages/core2-64-poky-linux/psmisc/psmisc-dbg: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-dbg: PKGSIZE changed from 319600 to 320720 (+0%)
packages/core2-64-poky-linux/psmisc/psmisc-dbg: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-dev: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-dev: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-doc: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-doc: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-extras: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-extras: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-bg: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-bg: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-ca: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-ca: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-cs: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-cs: PKGSIZE changed from 18820 to 18667 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-cs: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-da: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-da: PKGSIZE changed from 17817 to 17551 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-da: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-de: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-de: PKGSIZE changed from 19007 to 18853 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-de: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-el: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-el: PKGSIZE changed from 20518 to 20607 (+0%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-el: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-eo: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-eo: PKGSIZE changed from 17801 to 17860 (+0%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-eo: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-es: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-es: PKGSIZE changed from 19187 to 19035 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-es: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-eu: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-eu: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-fi: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-fi: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-fr: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-fr: PKGSIZE changed from 19132 to 18979 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-fr: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-hr: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-hr: PKGSIZE changed from 18551 to 18391 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-hr: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-hu: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-hu: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-id: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-id: PKGSIZE changed from 18488 to 18104 (-2%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-id: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-it: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-it: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-ja: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-ja: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-nb: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-nb: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-nl: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-nl: PKGSIZE changed from 18155 to 18295 (+1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-nl: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-pl: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-pl: PKGSIZE changed from 18770 to 18618 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-pl: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-pt-br: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-pt-br: PKGSIZE changed from 18305 to 18167 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-pt-br: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-pt: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-pt: PKGSIZE changed from 18161 to 18025 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-pt: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-ro: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-ro: PKGSIZE changed from 19666 to 19506 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-ro: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-ru: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-ru: PKGSIZE changed from 23507 to 23424 (-0%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-ru: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-sr: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-sr: PKGSIZE changed from 22645 to 22443 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-sr: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-sv: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-sv: PKGSIZE changed from 18355 to 17974 (-2%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-sv: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-uk: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-uk: PKGSIZE changed from 23962 to 23815 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-uk: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-vi: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-vi: PKGSIZE changed from 20219 to 20359 (+1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-vi: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-zh-cn: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-zh-cn: PKGSIZE changed from 17755 to 17602 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-zh-cn: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-locale-zh-tw: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-locale-zh-tw: PKGSIZE changed from 17868 to 17727 (-1%)
packages/core2-64-poky-linux/psmisc/psmisc-locale-zh-tw: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-src: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-src: PKGSIZE changed from 177702 to 178548 (+0%)
packages/core2-64-poky-linux/psmisc/psmisc-src: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc-staticdev: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc-staticdev: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/psmisc: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/psmisc: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/pstree-doc: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/pstree-doc: PKGV changed from 23.6 [default] to 23.7 [default]
packages/core2-64-poky-linux/psmisc/pstree: PV changed from "23.6" to "23.7"
packages/core2-64-poky-linux/psmisc/pstree: PKGV changed from 23.6 [default] to 23.7 [default]

--===============1206741630762816626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/psmisc: PACKAGES: added "psmisc-locale-ka psmisc-locale-ko"

--===============1206741630762816626==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-psmisc-upgrade-23.6-23.7.patch"

RnJvbSAxN2NmMjhmYjdkMmE1NGI2NGQxOThjZTE3MWQ1ZGQ5ZTEyYzc1ZTJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMTA6NDc6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
c21pc2M6IHVwZ3JhZGUgMjMuNiAtPiAyMy43CgotLS0KIC4uLi9wc21pc2MvMDAwMS1Vc2UtVUlO
VFBUUl9NQVgtaW5zdGVhZC1vZi1fX1dPUkRTSVpFLnBhdGNoIHwgNiArKystLS0KIC4uLi9wc21p
c2Mve3BzbWlzY18yMy42LmJiID0+IHBzbWlzY18yMy43LmJifSAgICAgICAgICAgICAgIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BzbWlzYy97cHNtaXNjXzIzLjYuYmIgPT4gcHNtaXNj
XzIzLjcuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BzbWlz
Yy9wc21pc2MvMDAwMS1Vc2UtVUlOVFBUUl9NQVgtaW5zdGVhZC1vZi1fX1dPUkRTSVpFLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BzbWlzYy9wc21pc2MvMDAwMS1Vc2UtVUlOVFBUUl9N
QVgtaW5zdGVhZC1vZi1fX1dPUkRTSVpFLnBhdGNoCmluZGV4IGNhMTNiZGJkMTUuLjYxZDk5OGQ2
ODcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9wc21pc2MvcHNtaXNjLzAwMDEt
VXNlLVVJTlRQVFJfTUFYLWluc3RlYWQtb2YtX19XT1JEU0laRS5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvcHNtaXNjL3BzbWlzYy8wMDAxLVVzZS1VSU5UUFRSX01BWC1pbnN0ZWFk
LW9mLV9fV09SRFNJWkUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDExNWZjZjFkYWZmMThh
YTJmMmUxMzBkNjM3MDRmMDQwMzE4NzhkYjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGRmMWVjMDk5MWE0NGExYTI1NWFmOWRkMDZjMmNmZGY0YTUyYTQ2NzIgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVGh1
LCAyNCBNYXIgMjAxNiAxNTo0NjoxNCArMDAwMAogU3ViamVjdDogW1BBVENIXSBVc2UgVUlOVFBU
Ul9NQVggaW5zdGVhZCBvZiBfX1dPUkRTSVpFCkBAIC0xMyw3ICsxMyw3IEBAIFVwc3RyZWFtLVN0
YXR1czogUGVuZGluZwogIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvcGVla2ZkLmMgYi9zcmMvcGVla2ZkLmMKLWluZGV4
IDVhYTk5MGEuLjdlOGUzZmMgMTAwNjQ0CitpbmRleCAzNmRmZjA0Li4yYjRiMWRjIDEwMDY0NAog
LS0tIGEvc3JjL3BlZWtmZC5jCiArKysgYi9zcmMvcGVla2ZkLmMKIEBAIC0zMCw4ICszMCwxMSBA
QApAQCAtMjgsNyArMjgsNyBAQCBpbmRleCA1YWE5OTBhLi43ZThlM2ZjIDEwMDY0NAogICNpbmNs
dWRlIDxnZXRvcHQuaD4KICAjaW5jbHVkZSA8Y3R5cGUuaD4KICAjaW5jbHVkZSA8ZGlyZW50Lmg+
Ci1AQCAtMjY2LDExICsyNjksMTEgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQor
QEAgLTM0MSwxMSArMzQ0LDExIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKICAJ
CWlmIChXSUZTVE9QUEVEKHN0YXR1cykpIHsKICAjaWZkZWYgUFBDCiAgCQkJc3RydWN0IHB0X3Jl
Z3MgcmVnczsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9wc21pc2MvcHNtaXNj
XzIzLjYuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcHNtaXNjL3BzbWlzY18yMy43LmJiCnNp
bWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wc21p
c2MvcHNtaXNjXzIzLjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wc21pc2Mv
cHNtaXNjXzIzLjcuYmIKaW5kZXggMmU1NWFkMDBiZC4uZWEyNzJjZDkyZCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BzbWlzYy9wc21pc2NfMjMuNi5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvcHNtaXNjL3BzbWlzY18yMy43LmJiCkBAIC01LDUgKzUsNSBAQCBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0wNjM2ZTczZmYwMjE1ZThkNjcyZGM0
YzMyYzMxN2JiMyIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmNvbS9wc21pc2MvcHNtaXNjLmdp
dDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEt
VXNlLVVJTlRQVFJfTUFYLWluc3RlYWQtb2YtX19XT1JEU0laRS5wYXRjaCBcCiAgICAgICAgICAg
ICIKLVNSQ1JFViA9ICIzMDk4ZTY0MWRjMWRkYjIxMDE4NmY1MzQ2NDI1NTY3MGI0ODAzNzdiIgor
U1JDUkVWID0gIjkwOTFkNmRiY2NlM2Q4ZmI4N2FkZjkyNDlhMmViMzQ2ZDI1YTU2MmMiCiBTID0g
IiR7V09SS0RJUn0vZ2l0IgotLSAKMi40Mi4wCgo=

--===============1206741630762816626==--

