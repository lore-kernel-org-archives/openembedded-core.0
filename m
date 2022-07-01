Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC53C2BBF2
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:10 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.39377.1656687062508669252
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gei0vTut;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010181ba3e696e-8bbf5edc-124e-44fe-afeb-411c17857809-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687061;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=A4hs7KVo6cqJOfNjcsKtMdxWMecDjFguOABVXS/GBu8=;
	b=gei0vTutMru2I1eZiCPf2d198vHWRFZZSiJM4yvq68OlviaAn5fJ+gqhbi2oS/+2
	CcznOAygusgMgwqSUzTjZ5d9+/tWaH5Iwga2TWD0CVfK1a1hq46bToT/IPmJl7FTkKG
	P1Zr6BtaZ1UIMF0iOvy25TLCka2BZQ2RA/SnGWPo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687061;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=A4hs7KVo6cqJOfNjcsKtMdxWMecDjFguOABVXS/GBu8=;
	b=aKiOu68yxnqKKZgp3Vn9HpUVDq9+vqWxf+Tl8AZKLXk1xIJ13lvACmktOMOrMQuj
	wOLIkQm/skCkCFcCch/zontMmNWEAx1hOoTurRYHT3ZVQAJl2Xu7L8hOCoH9T6NL0jC
	TTqFc8CiZqoExEgF2ZkfkZGxXp8D4Xl0EFxyobrE=
Content-Type: multipart/mixed; boundary="===============4591124357576508016=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dmidecode: upgrading to 3.4 SUCCEEDED
Message-ID: 
 <01010181ba3e696e-8bbf5edc-124e-44fe-afeb-411c17857809-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:01 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167480

--===============4591124357576508016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dmidecode* to *3.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dmidecode-upgrade-3.3-3.4.patch
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
--===============4591124357576508016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dmidecode/dmidecode-dbg: PKGSIZE changed from 275932 to 290340 (+5%)
packages/core2-32-poky-linux/dmidecode/dmidecode-dbg: PV changed from "3.3" to "3.4"
packages/core2-32-poky-linux/dmidecode/dmidecode-dbg: PKGV changed from 3.3 [default] to 3.4 [default]
packages/core2-32-poky-linux/dmidecode/dmidecode-dev: PV changed from "3.3" to "3.4"
packages/core2-32-poky-linux/dmidecode/dmidecode-dev: PKGV changed from 3.3 [default] to 3.4 [default]
packages/core2-32-poky-linux/dmidecode/dmidecode-doc: PKGSIZE changed from 28360 to 29555 (+4%)
packages/core2-32-poky-linux/dmidecode/dmidecode-doc: PV changed from "3.3" to "3.4"
packages/core2-32-poky-linux/dmidecode/dmidecode-doc: PKGV changed from 3.3 [default] to 3.4 [default]
packages/core2-32-poky-linux/dmidecode/dmidecode-locale: PV changed from "3.3" to "3.4"
packages/core2-32-poky-linux/dmidecode/dmidecode-locale: PKGV changed from 3.3 [default] to 3.4 [default]
packages/core2-32-poky-linux/dmidecode/dmidecode-src: PKGSIZE changed from 209316 to 235645 (+13%)
packages/core2-32-poky-linux/dmidecode/dmidecode-src: PV changed from "3.3" to "3.4"
packages/core2-32-poky-linux/dmidecode/dmidecode-src: PKGV changed from 3.3 [default] to 3.4 [default]
packages/core2-32-poky-linux/dmidecode/dmidecode-staticdev: PV changed from "3.3" to "3.4"
packages/core2-32-poky-linux/dmidecode/dmidecode-staticdev: PKGV changed from 3.3 [default] to 3.4 [default]
packages/core2-32-poky-linux/dmidecode/dmidecode: PKGSIZE changed from 170444 to 182732 (+7%)
packages/core2-32-poky-linux/dmidecode/dmidecode: PV changed from "3.3" to "3.4"
packages/core2-32-poky-linux/dmidecode/dmidecode: PKGV changed from 3.3 [default] to 3.4 [default]
packages/core2-32-poky-linux/dmidecode: PKGV changed from 3.3 [default] to 3.4 [default]
packages/core2-32-poky-linux/dmidecode: PV changed from "3.3" to "3.4"
packages/core2-32-poky-linux/dmidecode: SRC_URI changed from "https://download.savannah.nongnu.org/releases/dmidecode/dmidecode-3.3.tar.xz file://0001-Committing-changes-from-do_unpack_extra.patch" to "https://download.savannah.nongnu.org/releases/dmidecode/dmidecode-3.4.tar.xz file://0001-Committing-changes-from-do_unpack_extra.patch"

--===============4591124357576508016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'dmidecode'
dmidecode was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

--===============4591124357576508016==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-dmidecode-upgrade-3.3-3.4.patch"

From cfe30e467fc037152b09e78a1558b85fec38bebb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 07:43:26 +0000
Subject: [PATCH] dmidecode: upgrade 3.3 -> 3.4

---
 .../dmidecode/{dmidecode_3.3.bb => dmidecode_3.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dmidecode/{dmidecode_3.3.bb => dmidecode_3.4.bb} (90%)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb
similarity index 90%
rename from meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
rename to meta/recipes-devtools/dmidecode/dmidecode_3.4.bb
index 23540b2703..bc741046dd 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb
@@ -20,5 +20,5 @@ do_install() {
 	oe_runmake DESTDIR="${D}" install
 }
 
-SRC_URI[sha256sum] = "82c737a780614c38a783e8055340d295e332fb12c7f418b5d21a0797d3fb1455"
+SRC_URI[sha256sum] = "43cba851d8467c9979ccdbeab192eb6638c7d3a697eba5ddb779da8837542212"
 
-- 
2.31.1


--===============4591124357576508016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/dmidecode/dmidecode-src: PKGSIZE changed from 209316 to 235645 (+13%)

--===============4591124357576508016==--

