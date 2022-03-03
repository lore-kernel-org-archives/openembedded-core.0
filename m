Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E933C43217
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:25 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.13918.1646329344619599625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GPROwB0g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 0101017f50e02dc2-ef61efdc-d640-479c-9d9c-c1f77df30205-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sRDPPAPNwMKvaFq8sCjCatCKEXKl4Q1mbEF/B5AB6Dw=;
	b=GPROwB0g8xnRPo6VYJi8Uj4XFxrVnO2UqAU7opjd0Era2j3Vd2CGtMz/urEOQjyF
	9Anu0SSDhJL4Vs3Mc3T9REuM+7mclU+SkpjnQXMi+7h/IAm6SBpzaDrRD8kT5Dauv/v
	SZkqJHF96/hl/aTj5kyo/gKkWoHZmrP9rqImA5zI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sRDPPAPNwMKvaFq8sCjCatCKEXKl4Q1mbEF/B5AB6Dw=;
	b=LSK0b9DXGPMfOYA/W324MwrjeilxyMVaIjnWOHIevz4GQjmKS6JPvfNbcJ1wtkZZ
	NTIURQ8GnFF7+Urtl0I+IisaIXJpf/tl/w1g8Hl5rxx+71DcH420F3LLZGjkYn8odr8
	B385I9S9t/Xjm/5DouFO81iIFQfX99yEgTwnM3FU=
Content-Type: multipart/mixed; boundary="===============8290196741612632183=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] seatd: upgrading to 0.6.4 SUCCEEDED
Message-ID: 
 <0101017f50e02dc2-ef61efdc-d640-479c-9d9c-c1f77df30205-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:23 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162680

--===============8290196741612632183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *seatd* to *0.6.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-seatd-upgrade-0.6.3-0.6.4.patch
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
--===============8290196741612632183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/seatd: SRC_URI changed from "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master file://init" to "git://git.sr.ht/%7Ekennylevinsen/seatd;protocol=https;branch=v0.6 file://init"
packages/core2-32-poky-linux/seatd: PKGV changed from 0.6.3 [default] to 0.6.4 [default]
packages/core2-32-poky-linux/seatd: PV changed from "0.6.3" to "0.6.4"
packages/core2-32-poky-linux/seatd/seatd-dbg: PKGV changed from 0.6.3 [default] to 0.6.4 [default]
packages/core2-32-poky-linux/seatd/seatd-dbg: PKGSIZE changed from 246100 to 245776 (-0%)
packages/core2-32-poky-linux/seatd/seatd-dbg: PV changed from "0.6.3" to "0.6.4"
packages/core2-32-poky-linux/seatd/seatd-dev: PKGV changed from 0.6.3 [default] to 0.6.4 [default]
packages/core2-32-poky-linux/seatd/seatd-dev: PV changed from "0.6.3" to "0.6.4"
packages/core2-32-poky-linux/seatd/seatd-doc: PKGV changed from 0.6.3 [default] to 0.6.4 [default]
packages/core2-32-poky-linux/seatd/seatd-doc: PV changed from "0.6.3" to "0.6.4"
packages/core2-32-poky-linux/seatd/seatd-locale: PKGV changed from 0.6.3 [default] to 0.6.4 [default]
packages/core2-32-poky-linux/seatd/seatd-locale: PV changed from "0.6.3" to "0.6.4"
packages/core2-32-poky-linux/seatd/seatd-src: PKGV changed from 0.6.3 [default] to 0.6.4 [default]
packages/core2-32-poky-linux/seatd/seatd-src: PKGSIZE changed from 130029 to 129869 (-0%)
packages/core2-32-poky-linux/seatd/seatd-src: PV changed from "0.6.3" to "0.6.4"
packages/core2-32-poky-linux/seatd/seatd-staticdev: PKGV changed from 0.6.3 [default] to 0.6.4 [default]
packages/core2-32-poky-linux/seatd/seatd-staticdev: PV changed from "0.6.3" to "0.6.4"
packages/core2-32-poky-linux/seatd/seatd: PKGV changed from 0.6.3 [default] to 0.6.4 [default]
packages/core2-32-poky-linux/seatd/seatd: PV changed from "0.6.3" to "0.6.4"

--===============8290196741612632183==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-seatd-upgrade-0.6.3-0.6.4.patch"

From da7ca29d6ce68f63b31a6db17889ffd505fd3c82 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 3 Mar 2022 12:42:33 +0000
Subject: [PATCH] seatd: upgrade 0.6.3 -> 0.6.4

---
 meta/recipes-core/seatd/{seatd_0.6.3.bb => seatd_0.6.4.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-core/seatd/{seatd_0.6.3.bb => seatd_0.6.4.bb} (86%)

diff --git a/meta/recipes-core/seatd/seatd_0.6.3.bb b/meta/recipes-core/seatd/seatd_0.6.4.bb
similarity index 86%
rename from meta/recipes-core/seatd/seatd_0.6.3.bb
rename to meta/recipes-core/seatd/seatd_0.6.4.bb
index abc8583087..3c72e3e901 100644
--- a/meta/recipes-core/seatd/seatd_0.6.3.bb
+++ b/meta/recipes-core/seatd/seatd_0.6.4.bb
@@ -6,9 +6,10 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
 
-SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
-           file://init"
-SRCREV = "88db55f6068c1c01d85b61aa6adff0a6b2a8dce8"
+SRC_URI = "git://git.sr.ht/%7Ekennylevinsen/seatd;protocol=https;branch=v0.6 \
+           file://init \
+           "
+SRCREV = "df13d03f9cfd0dc0c2b3298cd0e5eb4e4a10835e"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig update-rc.d
-- 
2.27.0


--===============8290196741612632183==--

