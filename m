Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.16265.1623585061229056797
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 04:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id A9FC638C13B7
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 11:51:00 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] grub: upgrading to 2.06 SUCCEEDED
Message-ID: <MADEUP.16882202DE9A36EE.12353@lists.openembedded.org>
X-Groupsio-MsgNum: 152886
Content-Type: multipart/mixed; boundary="===============5529578814313532813=="

--===============5529578814313532813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *grub* to *2.06* has Succeeded.

Next steps:
    - apply the patch: git am 0001-grub-upgrade-2.04-2.06-rc1-2.06.patch
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

--===============5529578814313532813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/grub/grub-common: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-common: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-dbg: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-dbg: PKGSIZE changed from 28444944 to 28436720 (-0%)
packages/core2-32-poky-linux/grub/grub-dbg: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-dev: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-dev: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-doc: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-doc: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-editenv: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-editenv: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-ast: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-ast: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-ca: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-ca: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-da: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-da: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-de+hebrew: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-de+hebrew: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-de-ch: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-de-ch: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-de: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-de: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-en+arabic: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-en+arabic: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-en+cyrillic: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-en+cyrillic: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-en+greek: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-en+greek: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-en+hebrew: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-en+hebrew: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-en+piglatin: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-en+piglatin: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-en+quot: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-en+quot: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-eo: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-eo: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-es: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-es: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-fi: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-fi: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-fr: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-fr: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-gl: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-gl: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-hr: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-hr: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-hu: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-hu: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-id: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-id: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-it: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-it: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-ja: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-ja: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-ko: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-ko: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-lg: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-lg: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-lt: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-lt: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-nb: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-nb: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-nl: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-nl: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-pa: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-pa: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-pl: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-pl: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-pt-br: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-pt-br: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-pt: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-pt: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-ro: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-ro: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-ru: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-ru: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-sl: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-sl: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-sr: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-sr: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-sv: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-sv: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-tr: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-tr: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-uk: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-uk: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-vi: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-vi: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-zh-cn: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-zh-cn: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-locale-zh-tw: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-locale-zh-tw: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-src: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-src: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub-staticdev: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub-staticdev: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub/grub: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub/grub: PV changed from "2.04+2.06~rc1" to "2.06"
packages/core2-32-poky-linux/grub: PKGV changed from 2.04+2.06~rc1 [default] to 2.06 [default]
packages/core2-32-poky-linux/grub: PV changed from "2.04+2.06~rc1" to "2.06"

--===============5529578814313532813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
ERROR: Nothing PROVIDES 'grub'
grub was skipped: incompatible with host arm-poky-linux-gnueabi (not in COMPATIBLE_HOST)
Parsing of 817 .bb files complete (0 cached, 817 parsed). 1454 targets, 49 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============5529578814313532813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
ERROR: Nothing PROVIDES 'grub'
grub was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)
Parsing of 817 .bb files complete (0 cached, 817 parsed). 1454 targets, 58 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============5529578814313532813==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-grub-upgrade-2.04-2.06-rc1-2.06.patch"

From eefe98aa9d047a83dbcfa32064a996b8da462492 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 13 Jun 2021 06:22:03 +0000
Subject: [PATCH] grub: upgrade 2.04+2.06~rc1 -> 2.06

---
 meta/recipes-bsp/grub/grub2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 3c6b434c2d..351d837192 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -25,7 +25,7 @@ SRC_URI = "https://alpha.gnu.org/gnu/grub/grub-${REALPV}.tar.xz \
 SRC_URI[sha256sum] = "2c87f1f21e2ab50043e6cd9163c08f1b6c3a6171556bf23ff9ed65b074145484"
 
 REALPV = "2.06~rc1"
-PV = "2.04+${REALPV}"
+PV = "2.06"
 
 # Fixed in 2.06~rc1, can be removed for 2.06 final
 CVE_CHECK_WHITELIST += "\
-- 
2.17.1


--===============5529578814313532813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
ERROR: Nothing PROVIDES 'grub'
grub was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)
Parsing of 817 .bb files complete (0 cached, 817 parsed). 1454 targets, 66 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============5529578814313532813==--
