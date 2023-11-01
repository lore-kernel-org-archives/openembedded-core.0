Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA16C07548
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.8484.1698848703888072599
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LkRiiYDS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pv++PIvh;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.193, mailfrom: 0101018b8b460ab4-7311ca55-1920-46be-9a69-e99aca36e3db-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DLrO1jRS4aoe9X8j0eY3eaBmDRWvrU8PVE+3oMXyF1k=;
	b=LkRiiYDSXzr+cn7UOTjRbeCcGz6zxjdixly8bE8nVc66RgkaPblFujaz6jdap7q0
	R685BpGMWtYtUzjk4oLVryzyYKqIeArQQrl9mlCPELDqIXX+j1v7rdICmx9QggwYy/F
	8Y9q1syusvxnYWoqp1uWVmZp71Nhee4zvBvPWtV0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DLrO1jRS4aoe9X8j0eY3eaBmDRWvrU8PVE+3oMXyF1k=;
	b=pv++PIvhbK4zeJbSFY3XJLWPXGnCJzmRu2jv70x446vXS4s2W/xQmJrfU6+W98oH
	c94it19TlT1UIY7UQX350PXA6rNCf4r6tnW+TJmucICVFg4zP24K0hJhMZ/uR0JYR30
	JM5dPCEby0pz7+4xzA0WQzyBEH5VWqxeTj8iyRbw=
Content-Type: multipart/mixed; boundary="===============6610536973267039673=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] json-glib: upgrading to 1.8.0 SUCCEEDED
Message-ID: <0101018b8b460ab4-7311ca55-1920-46be-9a69-e99aca36e3db-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190001

--===============6610536973267039673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *json-glib* to *1.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-json-glib-upgrade-1.6.6-1.8.0.patch
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
From 0e217ef48179656413ffe9d6543d37898cdb74a4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 12:11:40 +0000
Subject: [PATCH] json-glib: upgrade 1.6.6 -> 1.8.0

---
 .../json-glib/{json-glib_1.6.6.bb => json-glib_1.8.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/json-glib/{json-glib_1.6.6.bb => json-glib_1.8.0.bb} (93%)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb b/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb
similarity index 93%
rename from meta/recipes-gnome/json-glib/json-glib_1.6.6.bb
rename to meta/recipes-gnome/json-glib/json-glib_1.8.0.bb
index 9c34fb7f40..9b57de1c5e 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb
@@ -19,7 +19,7 @@ GIDOCGEN_MESON_ENABLE_FLAG = 'enabled'
 GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
 
 SRC_URI += " file://run-ptest"
-SRC_URI[archive.sha256sum] = "96ec98be7a91f6dde33636720e3da2ff6ecbb90e76ccaa49497f31a6855a490e"
+SRC_URI[archive.sha256sum] = "97ef5eb92ca811039ad50a65f06633f1aae64792789307be7170795d8b319454"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native"
-- 
2.39.2


--===============6610536973267039673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/json-glib/json-glib-bin: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-bin: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-dbg: PKGSIZE changed from 1032456 to 1022216 (-1%)
packages/core2-64-poky-linux/json-glib/json-glib-dbg: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-dbg: FILELIST: removed "/usr/lib/.debug/libjson-glib-1.0.so.0.600.6", added "/usr/lib/.debug/libjson-glib-1.0.so.0.800.0"
packages/core2-64-poky-linux/json-glib/json-glib-dbg: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-dev: PKGSIZE changed from 450872 to 453371 (+1%)
packages/core2-64-poky-linux/json-glib/json-glib-dev: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-dev: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-doc: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-doc: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-as: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-as: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-be: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-be: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-bg: PKGSIZE changed from 4478 to 6578 (+47%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-bg: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-bg: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-bn-in: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-bn-in: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-bs: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-bs: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ca+valencia: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ca+valencia: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ca: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ca: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-cs: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-cs: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-da: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-da: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-de: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-de: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-el: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-el: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-en-gb: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-en-gb: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-eo: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-eo: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-es: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-es: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-et: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-et: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-eu: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-eu: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-fr: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-fr: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-fur: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-fur: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-gl: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-gl: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-he: PKGSIZE changed from 5028 to 5307 (+6%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-he: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-he: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-hi: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-hi: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-hr: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-hr: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-hu: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-hu: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-id: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-id: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-it: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-it: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ja: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ja: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ko: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ko: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ky: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ky: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-lt: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-lt: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-lv: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-lv: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ml: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ml: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ms: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ms: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-nb: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-nb: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ne: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ne: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-nl: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-nl: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-oc: PKGSIZE changed from 5631 to 5732 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-oc: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-oc: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-or: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-or: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-pa: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-pa: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-pl: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-pl: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-pt-br: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-pt-br: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-pt: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-pt: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ro: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ro: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ru: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ru: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-sk: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-sk: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-sl: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-sl: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-sr+latin: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-sr+latin: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-sr: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-sr: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-sv: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-sv: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-te: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-te: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-tg: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-tg: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-tr: PKGSIZE changed from 5459 to 5457 (-0%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-tr: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-tr: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ug: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ug: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-uk: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-uk: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-vi: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-vi: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-zh-cn: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-zh-cn: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-zh-hk: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-zh-hk: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-zh-tw: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-locale-zh-tw: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-ptest: PKGSIZE changed from 326345 to 321873 (-1%)
packages/core2-64-poky-linux/json-glib/json-glib-ptest: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-ptest: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-src: PKGSIZE changed from 613013 to 612489 (-0%)
packages/core2-64-poky-linux/json-glib/json-glib-src: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-src: FILELIST: directory renamed /usr/src/debug/json-glib/1.6.6-r0/json-glib/tests -> /usr/src/debug/json-glib/1.8.0-r0/json-glib/tests, removed "/usr/src/debug/json-glib/1.6.6-r0/json-glib/json-serializable.c /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-generator.h /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-array.c /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-glib-validate.c /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-generator.c /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-path.c /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-node.c /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-path.h /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-value.c /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-utils.c /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-types.h /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-gvariant.c /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-enum-types.c /usr/src/debug/json-glib/1.6.6-r0/
 json-glib/json-gvariant.h /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-gboxed.c /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-glib-format.c /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-object.c /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-parser.c /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-reader.c /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-parser.h /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-reader.h /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-builder.c /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-types-private.h /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-builder.h /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-gobject.h /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-scanner.h /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-debug.h /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-gobject.c /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-debug.c /usr/src/debug/json-glib/1.6.6-r0/json-glib/json-gobject-private.h /usr/src/debug/json
 -glib/1.6.6-r0/json-glib/json-scanner.c", added "/usr/src/debug/json-glib/1.8.0-r0/json-glib/json-serializable.c /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-generator.h /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-array.c /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-glib-validate.c /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-generator.c /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-path.c /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-node.c /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-path.h /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-value.c /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-utils.h /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-utils.c /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-types.h /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-gvariant.c /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-enum-types.c /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-gvariant.h /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-gboxed.c /usr
 /src/debug/json-glib/1.8.0-r0/json-glib/json-glib-format.c /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-object.c /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-parser.c /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-reader.c /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-parser.h /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-reader.h /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-builder.c /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-types-private.h /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-builder.h /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-gobject.h /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-scanner.h /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-debug.h /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-gobject.c /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-debug.c /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-gobject-private.h /usr/src/debug/json-glib/1.8.0-r0/json-glib/json-scanner.c"
packages/core2-64-poky-linux/json-glib/json-glib-src: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib-staticdev: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib-staticdev: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib/json-glib: PKGSIZE changed from 196039 to 196119 (+0%)
packages/core2-64-poky-linux/json-glib/json-glib: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib/json-glib: FILELIST: removed "/usr/lib/libjson-glib-1.0.so.0.600.6", added "/usr/lib/libjson-glib-1.0.so.0.800.0"
packages/core2-64-poky-linux/json-glib/json-glib: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib: PACKAGES: added "json-glib-locale-fa json-glib-locale-ab json-glib-locale-ka"
packages/core2-64-poky-linux/json-glib: PKGV changed from 1.6.6 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/json-glib: PV changed from "1.6.6" to "1.8.0"
packages/core2-64-poky-linux/json-glib: SRC_URI changed from "https://download.gnome.org/sources//json-glib/1.6/json-glib-1.6.6.tar.xz;name=archive file://run-ptest" to "https://download.gnome.org/sources//json-glib/1.8/json-glib-1.8.0.tar.xz;name=archive file://run-ptest"
Changes to packages/core2-64-poky-linux/json-glib (sysroot):
  /usr/lib/libjson-glib-1.0.so.0 changed symlink target from libjson-glib-1.0.so.0.600.6 to libjson-glib-1.0.so.0.800.0
  /usr/lib/libjson-glib-1.0.so.0.600.6 moved to /usr/lib/libjson-glib-1.0.so.0.800.0

--===============6610536973267039673==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-json-glib-upgrade-1.6.6-1.8.0.patch"

RnJvbSAwZTIxN2VmNDgxNzk2NTY0MTNmZmU5ZDY1NDNkMzc4OThjZGI3NGE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMjoxMTo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGpz
b24tZ2xpYjogdXBncmFkZSAxLjYuNiAtPiAxLjguMAoKLS0tCiAuLi4vanNvbi1nbGliL3tqc29u
LWdsaWJfMS42LjYuYmIgPT4ganNvbi1nbGliXzEuOC4wLmJifSAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ25vbWUvanNvbi1nbGliL3tqc29uLWdsaWJfMS42LjYuYmIgPT4ganNvbi1nbGliXzEu
OC4wLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9qc29uLWdsaWIv
anNvbi1nbGliXzEuNi42LmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2pzb24tZ2xpYi9qc29uLWds
aWJfMS44LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdub21lL2pzb24tZ2xpYi9qc29uLWdsaWJfMS42LjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1nbm9tZS9qc29uLWdsaWIvanNvbi1nbGliXzEuOC4wLmJiCmluZGV4IDljMzRmYjdmNDAuLjli
NTdkZTFjNWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9qc29uLWdsaWIvanNvbi1n
bGliXzEuNi42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9qc29uLWdsaWIvanNvbi1nbGli
XzEuOC4wLmJiCkBAIC0xOSw3ICsxOSw3IEBAIEdJRE9DR0VOX01FU09OX0VOQUJMRV9GTEFHID0g
J2VuYWJsZWQnCiBHSURPQ0dFTl9NRVNPTl9ESVNBQkxFX0ZMQUcgPSAnZGlzYWJsZWQnCiAKIFNS
Q19VUkkgKz0gIiBmaWxlOi8vcnVuLXB0ZXN0IgotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0g
PSAiOTZlYzk4YmU3YTkxZjZkZGUzMzYzNjcyMGUzZGEyZmY2ZWNiYjkwZTc2Y2NhYTQ5NDk3ZjMx
YTY4NTVhNDkwZSIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjk3ZWY1ZWI5MmNhODEx
MDM5YWQ1MGE2NWYwNjYzM2YxYWFlNjQ3OTI3ODkzMDdiZTcxNzA3OTVkOGIzMTk0NTQiCiAKIFBB
Q0tBR0VDT05GSUcgPz89ICIke0BiYi51dGlscy5jb250YWlucygnUFRFU1RfRU5BQkxFRCcsICcx
JywgJ3Rlc3RzJywgJycsIGQpfSIKIFBBQ0tBR0VDT05GSUdbbWFucGFnZXNdID0gIi1EbWFuPXRy
dWUsLURtYW49ZmFsc2UsbGlieHNsdC1uYXRpdmUgeG1sdG8tbmF0aXZlIgotLSAKMi4zOS4yCgo=

--===============6610536973267039673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/json-glib/json-glib-locale-bg: PKGSIZE changed from 4478 to 6578 (+47%)
packages/core2-64-poky-linux/json-glib/json-glib: FILELIST: removed "/usr/lib/libjson-glib-1.0.so.0.600.6", added "/usr/lib/libjson-glib-1.0.so.0.800.0"
packages/core2-64-poky-linux/json-glib: PACKAGES: added "json-glib-locale-fa json-glib-locale-ka json-glib-locale-ab"
Changes to packages/core2-64-poky-linux/json-glib (sysroot):
  /usr/lib/libjson-glib-1.0.so.0 changed symlink target from libjson-glib-1.0.so.0.600.6 to libjson-glib-1.0.so.0.800.0
  /usr/lib/libjson-glib-1.0.so.0.600.6 moved to /usr/lib/libjson-glib-1.0.so.0.800.0

--===============6610536973267039673==--

