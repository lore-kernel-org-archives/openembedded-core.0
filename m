Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BB8C47092
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:12 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.2288.1651434543439322571
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=mRfyHxj7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010180812b5c5e-1ab76ef6-6186-4bf4-8031-1fa737170a8a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434544;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=n9BjFVEgQu6kONUnImp55gpWDbc029Z2K/rN4roPUss=;
	b=mRfyHxj7uokff1fpIVRG7khZ77asAA86N2TjB8O/V3vjeCrYsEC9cDjwevoQOCuY
	8ZKZ03tRQ/4+X+HXP78gBQQNr7/h6k8YMR4+gzqdf72qDBx2TjjIEB7oy67d+74WFdg
	u/nDYx8TAh79deZE0Hjvn+t0Gs1EcrDqTFD9snZk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434544;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=n9BjFVEgQu6kONUnImp55gpWDbc029Z2K/rN4roPUss=;
	b=djMOeE+8EUywk8rnCi5MufLyxou6IWjPM5kFmSD7DyDyi868fZfBaO6sbp1EBwqu
	Vu3GvRiHPL2XfUKKAuyOoAcavvNIdSsKoim1VlaMLxuipNF1ibpjWifJgT2M9KtDWmn
	nORYalGxWl/Jf9BJlGzBBWSDIXq5tJcXWZD21cQc=
Content-Type: multipart/mixed; boundary="===============4272461086787077032=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fribidi: upgrading to 1.0.12 SUCCEEDED
Message-ID: 
 <01010180812b5c5e-1ab76ef6-6186-4bf4-8031-1fa737170a8a-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:04 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165148

--===============4272461086787077032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *fribidi* to *1.0.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fribidi-upgrade-1.0.11-1.0.12.patch
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
--===============4272461086787077032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/fribidi/fribidi-doc: PKGSIZE changed from 67822 to 0 (-100%)

--===============4272461086787077032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/fribidi/fribidi-bin: PKGV changed from 1.0.11 [default] to 1.0.12 [default]
packages/core2-32-poky-linux/fribidi/fribidi-bin: PV changed from "1.0.11" to "1.0.12"
packages/core2-32-poky-linux/fribidi/fribidi-dbg: PKGSIZE changed from 113548 to 113640 (+0%)
packages/core2-32-poky-linux/fribidi/fribidi-dbg: PKGV changed from 1.0.11 [default] to 1.0.12 [default]
packages/core2-32-poky-linux/fribidi/fribidi-dbg: PV changed from "1.0.11" to "1.0.12"
packages/core2-32-poky-linux/fribidi/fribidi-dev: PKGV changed from 1.0.11 [default] to 1.0.12 [default]
packages/core2-32-poky-linux/fribidi/fribidi-dev: PV changed from "1.0.11" to "1.0.12"
packages/core2-32-poky-linux/fribidi/fribidi-doc: PKGSIZE changed from 67822 to 0 (-100%)
packages/core2-32-poky-linux/fribidi/fribidi-doc: PKGV changed from 1.0.11 [default] to 1.0.12 [default]
packages/core2-32-poky-linux/fribidi/fribidi-doc: PV changed from "1.0.11" to "1.0.12"
packages/core2-32-poky-linux/fribidi/fribidi-locale: PKGV changed from 1.0.11 [default] to 1.0.12 [default]
packages/core2-32-poky-linux/fribidi/fribidi-locale: PV changed from "1.0.11" to "1.0.12"
packages/core2-32-poky-linux/fribidi/fribidi-src: PKGSIZE changed from 818367 to 818483 (+0%)
packages/core2-32-poky-linux/fribidi/fribidi-src: PKGV changed from 1.0.11 [default] to 1.0.12 [default]
packages/core2-32-poky-linux/fribidi/fribidi-src: PV changed from "1.0.11" to "1.0.12"
packages/core2-32-poky-linux/fribidi/fribidi-staticdev: PKGV changed from 1.0.11 [default] to 1.0.12 [default]
packages/core2-32-poky-linux/fribidi/fribidi-staticdev: PV changed from "1.0.11" to "1.0.12"
packages/core2-32-poky-linux/fribidi/fribidi: PKGV changed from 1.0.11 [default] to 1.0.12 [default]
packages/core2-32-poky-linux/fribidi/fribidi: PV changed from "1.0.11" to "1.0.12"
packages/core2-32-poky-linux/fribidi: SRC_URI changed from "https://github.com/fribidi/fribidi/releases/download/v1.0.11/fribidi-1.0.11.tar.xz" to "https://github.com/fribidi/fribidi/releases/download/v1.0.12/fribidi-1.0.12.tar.xz"
packages/core2-32-poky-linux/fribidi: PKGV changed from 1.0.11 [default] to 1.0.12 [default]
packages/core2-32-poky-linux/fribidi: PV changed from "1.0.11" to "1.0.12"

--===============4272461086787077032==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-fribidi-upgrade-1.0.11-1.0.12.patch"

From b987adcb25b5869fa7d17ba01dac8544c8721302 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 19:02:47 +0000
Subject: [PATCH] fribidi: upgrade 1.0.11 -> 1.0.12

---
 .../fribidi/{fribidi_1.0.11.bb => fribidi_1.0.12.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/fribidi/{fribidi_1.0.11.bb => fribidi_1.0.12.bb} (90%)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.11.bb b/meta/recipes-support/fribidi/fribidi_1.0.12.bb
similarity index 90%
rename from meta/recipes-support/fribidi/fribidi_1.0.11.bb
rename to meta/recipes-support/fribidi/fribidi_1.0.12.bb
index 56ca734558..b29c47822f 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.11.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.12.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.xz \
            "
-SRC_URI[sha256sum] = "30f93e9c63ee627d1a2cedcf59ac34d45bf30240982f99e44c6e015466b4e73d"
+SRC_URI[sha256sum] = "0cd233f97fc8c67bb3ac27ce8440def5d3ffacf516765b91c2cc654498293495"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.27.0


--===============4272461086787077032==--

