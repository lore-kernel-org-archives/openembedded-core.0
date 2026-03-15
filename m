Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9A0F013CA
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:10 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28801.1773582115543762820
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Y/886F09;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=l/FtieGe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019cf1bb8b9d-da6f8357-1bac-48e8-ba2b-4e6cad374365-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582126;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gGpAw4ZF1xeRnfEeI+GwxSWF/h8YDmiBsOfyMLAnVaE=;
	b=Y/886F09k75CoLSQpsJS4B1cXlaYc2aL7MESm3vzJt12JU0R7qg+WHA41b9nwDLk
	UKjoskfpiVE1Xeg6lui3fZkNCJ7RUkIWpQfeZJZpO7p3vb/MHEovoxoExQyHn1rte3w
	BQEtT3FSnsp73B6bkusHaSuQ1wNwFlLGG0xsYBOs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582126;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gGpAw4ZF1xeRnfEeI+GwxSWF/h8YDmiBsOfyMLAnVaE=;
	b=l/FtieGef8RfylDUWhDe/TZmYbXlu8Jf8sxVMxGfiY+WS8bfXc+mCe9rwK3S8zkq
	FTxNzjSAdCcuyMAXvWQ9aZsYuUnRv+SFDt2+8PQa9xqaF8M+G3XUFOt9mzLZSS0tL2R
	f0mxVymRCJvsLtNwQVMgtCdRI3JQ5vnYyHKPWjhQ=
Content-Type: multipart/mixed; boundary="===============1648108627903255557=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] at-spi2-core: upgrading to 2.60.0 SUCCEEDED
Message-ID: <0101019cf1bb8b9d-da6f8357-1bac-48e8-ba2b-4e6cad374365-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233184

--===============1648108627903255557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *at-spi2-core* to *2.60.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-at-spi2-core-upgrade-2.58.3-2.60.0.patch
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
From 67a7fa112e4500bab784f9ab64a2c2ee152188fe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 12:58:24 +0000
Subject: [PATCH] at-spi2-core: upgrade 2.58.3 -> 2.60.0

---
 .../atk/{at-spi2-core_2.58.3.bb => at-spi2-core_2.60.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.58.3.bb => at-spi2-core_2.60.0.bb} (94%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.58.3.bb b/meta/recipes-support/atk/at-spi2-core_2.60.0.bb
similarity index 94%
rename from meta/recipes-support/atk/at-spi2-core_2.58.3.bb
rename to meta/recipes-support/atk/at-spi2-core_2.60.0.bb
index 022d2ff71e..8e3314222c 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.58.3.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.60.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 CVE_PRODUCT += "at-spi2-atk"
 
-SRC_URI[archive.sha256sum] = "b0fabea6c9742eda8c9c675f9b8c1d1babba1da82da03ea1103710233717c1b0"
+SRC_URI[archive.sha256sum] = "80e50c1a97d8fd660a3fadb02ca35876df881c266d3d6108fc5b4c113614cb99"
 
 DEPENDS = " \
 	dbus \
-- 
2.47.1


--===============1648108627903255557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dbg: FILELIST: removed "/usr/lib/.debug/libatk-1.0.so.0.25812.1", added "/usr/lib/.debug/libatk-1.0.so.0.26009.1"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dbg: PKGSIZE changed from 2355584 to 2423200 (+3%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dbg: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dbg: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dev: FILELIST: removed "/usr/include/at-spi-2.0/atspi/atspi-gmain.h"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dev: PKGSIZE changed from 2171363 to 2201675 (+1%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dev: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dev: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-doc: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-doc: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ab: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ab: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-af: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-af: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-am: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-am: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-an: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-an: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ar: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ar: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-as: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-as: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ast: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ast: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-az: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-az: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-be+latin: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-be+latin: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-be: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-be: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bg: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bg: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bn-in: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bn-in: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bn: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bn: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bs: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bs: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ca+valencia: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ca+valencia: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ca: PKGSIZE changed from 11144 to 11145 (+0%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ca: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ca: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ckb: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ckb: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-cs: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-cs: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-cy: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-cy: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-da: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-da: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-de: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-de: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-dz: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-dz: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-el: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-el: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en+shaw: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en+shaw: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en-ca: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en-ca: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en-gb: PKGSIZE changed from 10349 to 10377 (+0%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en-gb: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en-gb: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-eo: PKGSIZE changed from 10101 to 10448 (+3%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-eo: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-eo: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-es: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-es: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-et: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-et: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-eu: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-eu: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fa: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fa: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fi: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fi: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fr: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fr: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fur: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fur: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ga: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ga: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gd: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gd: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gl: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gl: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gu: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gu: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-he: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-he: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hi: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hi: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hr: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hr: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hu: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hu: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hy: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hy: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-id: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-id: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-is: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-is: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-it: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-it: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ja: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ja: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ka: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ka: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kab: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kab: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kk: PKGSIZE changed from 4154 to 13779 (+232%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kk: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kk: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-km: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-km: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kn: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kn: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ko: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ko: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ku: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ku: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-li: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-li: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-lt: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-lt: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-lv: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-lv: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mai: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mai: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mk: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mk: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ml: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ml: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mn: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mn: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mr: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mr: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ms: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ms: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nb: PKGSIZE changed from 10558 to 10571 (+0%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nb: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nb: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ne: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ne: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nl: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nl: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nn: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nn: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-oc: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-oc: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-or: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-or: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pa: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pa: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pl: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pl: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ps: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ps: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pt-br: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pt-br: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pt: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pt: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ro: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ro: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ru: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ru: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-rw: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-rw: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-si: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-si: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sk: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sk: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sl: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sl: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sq: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sq: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr+ije: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr+ije: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr+latin: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr+latin: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sv: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sv: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ta: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ta: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-te: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-te: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tg: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tg: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-th: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-th: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tk: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tk: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tr: PKGSIZE changed from 10921 to 10920 (-0%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tr: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tr: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tt: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tt: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ug: PKGSIZE changed from 13531 to 13562 (+0%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ug: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ug: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uk: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uk: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uz+cyrillic: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uz+cyrillic: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uz: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uz: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-vi: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-vi: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-wa: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-wa: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-xh: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-xh: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-yi: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-yi: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-cn: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-cn: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-hk: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-hk: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-tw: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-tw: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zu: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zu: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-src: FILELIST: directory renamed /usr/src/debug/at-spi2-core/2.58.3/registryd -> /usr/src/debug/at-spi2-core/2.60.0/registryd, directory renamed /usr/src/debug/at-spi2-core/2.58.3/droute -> /usr/src/debug/at-spi2-core/2.60.0/droute, directory renamed /usr/src/debug/at-spi2-core/2.58.3/atk -> /usr/src/debug/at-spi2-core/2.60.0/atk, directory renamed /usr/src/debug/at-spi2-core/2.58.3/atk-adaptor/gtk-2.0 -> /usr/src/debug/at-spi2-core/2.60.0/atk-adaptor/gtk-2.0, directory renamed /usr/src/debug/at-spi2-core/2.58.3/atk-adaptor/adaptors -> /usr/src/debug/at-spi2-core/2.60.0/atk-adaptor/adaptors, directory renamed /usr/src/debug/at-spi2-core/2.58.3/atk-adaptor -> /usr/src/debug/at-spi2-core/2.60.0/atk-adaptor, directory renamed /usr/src/debug/at-spi2-core/2.58.3/xml -> /usr/src/debug/at-spi2-core/2.60.0/xml, directory renamed /usr/src/debug/at-spi2-core/2.58.3/dbind -> /usr/src/debug/at-spi2-core/2.60.0/dbind, directory renamed /usr/
 src/debug/at-spi2-core/2.58.3/bus -> /usr/src/debug/at-spi2-core/2.60.0/bus, removed "/usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-event-listener.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-registry.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-relation.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspimarshal.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-component.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-constants.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-object.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-registry.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-relation.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-event-listener.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-object.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-component.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspimarshal.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-accessible.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-misc.h /usr/src/debug/at-spi2-core/2.58.3/a
 tspi/atspi-stateset.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-misc.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-accessible.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-stateset.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-application.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-matchrule.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-action.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-device-a11y-manager.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-misc-private.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-device-listener-private.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-action.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-device-a11y-manager.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-application.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-matchrule.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-device-listener.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-device.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-device-leg
 acy.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-types.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-device.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-device-listener.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-device-legacy.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-editabletext.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-collection.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-device-x11.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-text.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-collection.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-editabletext.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-hyperlink.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-device-x11.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-text.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-table.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-private.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-table.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-table-c
 ell.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-enum-types.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-event-listener-private.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-selection.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-table-cell.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-selection.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-matchrule-private.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-enum-types.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-gmain.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-accessible-private.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-value.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-hyperlink.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-document.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-hypertext.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-image.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-hypertext.h /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-value.c /usr/src/debug/at-spi2-core/2.5
 8.3/atspi/atspi-gmain.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-image.c /usr/src/debug/at-spi2-core/2.58.3/atspi/atspi-document.h", added "/usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-event-listener.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-registry.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-relation.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspimarshal.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-component.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-constants.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-object.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-registry.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-relation.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-event-listener.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-object.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-component.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspimarshal.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-accessible.c /usr/src/debug/at-spi2-core/2.
 60.0/atspi/atspi-misc.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-stateset.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-misc.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-accessible.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-stateset.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-application.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-matchrule.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-action.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-device-a11y-manager.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-misc-private.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-device-listener-private.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-action.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-device-a11y-manager.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-application.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-matchrule.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-device-listener.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-device
 .h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-device-legacy.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-types.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-device.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-device-listener.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-device-legacy.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-editabletext.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-collection.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-device-x11.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-text.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-collection.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-editabletext.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-device-x11.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-text.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-hyperlink.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-table.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-private.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-ta
 ble.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-table-cell.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-enum-types.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-event-listener-private.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-selection.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-table-cell.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-selection.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-matchrule-private.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-enum-types.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-accessible-private.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-value.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-hyperlink.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-document.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-hypertext.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-image.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-hypertext.h /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-value.c /usr/src/debug/at-spi2-cor
 e/2.60.0/atspi/atspi-gmain.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-image.c /usr/src/debug/at-spi2-core/2.60.0/atspi/atspi-document.h"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-src: PKGSIZE changed from 2082614 to 2120090 (+2%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-src: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-src: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-staticdev: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-staticdev: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core: FILELIST: removed "/usr/lib/libatk-1.0.so.0.25812.1", added "/usr/lib/libatk-1.0.so.0.26009.1"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core: PKGSIZE changed from 975041 to 982609 (+1%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core: PV changed from "2.58.3" to "2.60.0"
packages/x86-64-v3-poky-linux/at-spi2-core: PKGV changed from 2.58.3 [default] to 2.60.0 [default]
packages/x86-64-v3-poky-linux/at-spi2-core: SRC_URI changed from "https://download.gnome.org/sources//at-spi2-core/2.58/at-spi2-core-2.58.3.tar.xz;name=archive" to "https://download.gnome.org/sources//at-spi2-core/2.60/at-spi2-core-2.60.0.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/at-spi2-core: PV changed from "2.58.3" to "2.60.0"
Changes to packages/x86-64-v3-poky-linux/at-spi2-core (sysroot):
  /usr/lib/libatk-1.0.so.0 changed symlink target from libatk-1.0.so.0.25812.1 to libatk-1.0.so.0.26009.1
  /usr/lib/libatk-1.0.so.0.25812.1 moved to /usr/lib/libatk-1.0.so.0.26009.1
  /usr/include/at-spi-2.0/atspi/atspi-gmain.h was removed

--===============1648108627903255557==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-at-spi2-core-upgrade-2.58.3-2.60.0.patch"

RnJvbSA2N2E3ZmExMTJlNDUwMGJhYjc4NGY5YWI2NGEyYzJlZTE1MjE4OGZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMTI6NTg6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
dC1zcGkyLWNvcmU6IHVwZ3JhZGUgMi41OC4zIC0+IDIuNjAuMAoKLS0tCiAuLi4vYXRrL3thdC1z
cGkyLWNvcmVfMi41OC4zLmJiID0+IGF0LXNwaTItY29yZV8yLjYwLjAuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsve2F0LXNwaTItY29yZV8yLjU4LjMuYmIgPT4gYXQtc3Bp
Mi1jb3JlXzIuNjAuMC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9hdGsvYXQtc3BpMi1jb3JlXzIuNTguMy5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9h
dC1zcGkyLWNvcmVfMi42MC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9hdC1zcGkyLWNvcmVfMi41OC4zLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsvYXQtc3BpMi1jb3JlXzIuNjAuMC5iYgppbmRleCAwMjJk
MmZmNzFlLi44ZTMzMTQyMjJjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsv
YXQtc3BpMi1jb3JlXzIuNTguMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsvYXQt
c3BpMi1jb3JlXzIuNjAuMC5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMiCiAKIENW
RV9QUk9EVUNUICs9ICJhdC1zcGkyLWF0ayIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0g
PSAiYjBmYWJlYTZjOTc0MmVkYThjOWM2NzVmOWI4YzFkMWJhYmJhMWRhODJkYTAzZWExMTAzNzEw
MjMzNzE3YzFiMCIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjgwZTUwYzFhOTdkOGZk
NjYwYTNmYWRiMDJjYTM1ODc2ZGY4ODFjMjY2ZDNkNjEwOGZjNWI0YzExMzYxNGNiOTkiCiAKIERF
UEVORFMgPSAiIFwKIAlkYnVzIFwKLS0gCjIuNDcuMQoK

--===============1648108627903255557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dev: FILELIST: removed "/usr/include/at-spi-2.0/atspi/atspi-gmain.h"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kk: PKGSIZE changed from 4154 to 13779 (+232%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core: FILELIST: removed "/usr/lib/libatk-1.0.so.0.25812.1", added "/usr/lib/libatk-1.0.so.0.26009.1"
Changes to packages/x86-64-v3-poky-linux/at-spi2-core (sysroot):
  /usr/lib/libatk-1.0.so.0 changed symlink target from libatk-1.0.so.0.25812.1 to libatk-1.0.so.0.26009.1
  /usr/lib/libatk-1.0.so.0.25812.1 moved to /usr/lib/libatk-1.0.so.0.26009.1
  /usr/include/at-spi-2.0/atspi/atspi-gmain.h was removed

--===============1648108627903255557==--

