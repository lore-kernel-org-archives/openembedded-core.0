Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A26BC47096
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:54 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web08.11724.1650052687027043254
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JcRz/WH+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 010101802ecdea43-5b2ceffe-522a-428c-8603-0d861ef1d075-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052688;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=igVkQTaNhY52JlqbyayZ/dfOwLM+rP9Uu5uoiY/q4dI=;
	b=JcRz/WH+DkXl3RCgSdt5mPc7/tQE1GhHKwaW73r9/p6Q9l7w3bJInHwyM07jqcOq
	O0/FKvLXyVf1sFi7j7DfF+aYpToJE+XK/fY6a83Q69+vTKx26QiCBgCEdfof9AND6ES
	+3g/VjrSAKm6xHOAZblCrnjzFa1dQhsrVlq39K5c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052688;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=igVkQTaNhY52JlqbyayZ/dfOwLM+rP9Uu5uoiY/q4dI=;
	b=Xrf4hZrNZW2Ny3PQ4uhL9IYgizWpj8WJLEGK9GFkkqGP4afdodhFHEDZ6xIyoQiO
	Y9l0SGTbEYgIlu5SYNHzS0/y5rikERIMT9HHEK+IYBaaPvgCQAQoRArXwB9Kpms+p9h
	R9pldE06gFG/vJljHY0xuTMiia+1fS3zFzGCdR88=
Content-Type: multipart/mixed; boundary="===============5854261932584874516=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 42.1 SUCCEEDED
Message-ID: 
 <010101802ecdea43-5b2ceffe-522a-428c-8603-0d861ef1d075-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:08 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164487

--===============5854261932584874516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *epiphany* to *42.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-42.0-42.1.patch
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
--===============5854261932584874516==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-42.0-42.1.patch"

From 3b54c4b3a623dd688c087fa0cfefcecfbbd41777 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 15:58:24 +0000
Subject: [PATCH] epiphany: upgrade 42.0 -> 42.1

---
 .../epiphany/{epiphany_42.0.bb => epiphany_42.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_42.0.bb => epiphany_42.1.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_42.0.bb b/meta/recipes-gnome/epiphany/epiphany_42.1.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_42.0.bb
rename to meta/recipes-gnome/epiphany/epiphany_42.1.bb
index 1cf731c7d6..1aef6846f9 100644
--- a/meta/recipes-gnome/epiphany/epiphany_42.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_42.1.bb
@@ -28,7 +28,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "3dbfa8c00e45b7f44e1824d01f0febe83707b5fb9330c261173f68b7f03cd5e3"
+SRC_URI[archive.sha256sum] = "68acc3c5c62917f1b43916a5b46bec136f5b307f03aada58db740c78b103f038"
 
 PACKAGECONFIG_SOUP ?= "soup2"
 PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
-- 
2.27.0


--===============5854261932584874516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/epiphany/epiphany-dbg: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 4269604 to 4269280 (-0%)
packages/core2-32-poky-linux/epiphany/epiphany-dbg: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-dev: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-dev: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-doc: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-doc: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-af: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-am: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-an: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ar: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-as: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ast: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-az: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-be: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-bg: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-bn: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-br: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-bs: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ca: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-cs: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-cy: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-da: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-de: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-dz: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-el: PKGSIZE changed from 117336 to 117611 (+0%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-el: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-en-gb: PKGSIZE changed from 78764 to 79896 (+1%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-eo: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-es: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-et: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-eu: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-fa: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-fi: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-fr: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-fur: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-fy: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-fy: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ga: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-gl: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-gu: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-gv: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-he: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-hi: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-hr: PKGSIZE changed from 83586 to 83406 (-0%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-hr: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-hu: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-hy: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-id: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ig: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-is: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-it: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ja: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ka: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-kk: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-km: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-kn: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ko: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ku: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-li: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-lt: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-lv: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mai: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mg: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mi: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mk: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ml: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mn: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mr: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ms: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-nb: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-nds: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ne: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-nl: PKGSIZE changed from 84402 to 85531 (+1%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-nl: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-nn: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-oc: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-or: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-pa: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-pl: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ps: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-pt: PKGSIZE changed from 85276 to 85466 (+0%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-pt: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ro: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ru: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-rw: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-si: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sk: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sl: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sq: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sr: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sv: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ta: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-te: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-tg: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-th: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-tk: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-tr: PKGSIZE changed from 85091 to 84886 (-0%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-tr: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ug: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-uk: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-uz: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-vi: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-wa: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-yo: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-src: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 26613661 to 26613082 (-0%)
packages/core2-32-poky-linux/epiphany/epiphany-src: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-staticdev: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany/epiphany: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany: PKGSIZE changed from 5665609 to 5665954 (+0%)
packages/core2-32-poky-linux/epiphany/epiphany: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany: PKGV changed from 42.0 [default] to 42.1 [default]
packages/core2-32-poky-linux/epiphany: PV changed from "42.0" to "42.1"
packages/core2-32-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/42/epiphany-42.0.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/42/epiphany-42.1.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"

--===============5854261932584874516==--

