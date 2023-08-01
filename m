Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002D0C18E72
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:52 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.17589.1690907328808840636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Pu9e0gjg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hsMKghiT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010189b1ee417c-f02f54bb-0c86-4584-8040-f975a6072cb8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=k0ThIBSOHjglNA3c/epgcaXkwdn6rzFYwVDfbp9rJyE=;
	b=Pu9e0gjgbS7uDjFUKnsjIc0efl0LRznDYSZw6Y9EeRiznil0L2eERiSD4Z9T6Mvl
	4MHdQebokRpPnyhChZGZrGJJFPoiv4THL0mzZzO0M1jei7B2kaTAR9FJT7EkR3aE/rC
	5VGgi8KDrbC0huCiRNFSh5ZfMMJQcW1LPyOv4ChE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=k0ThIBSOHjglNA3c/epgcaXkwdn6rzFYwVDfbp9rJyE=;
	b=hsMKghiTXL8eAx0VqWVDfaecILoxJTMy5hrj8GsSQy4ce9n+MSGECtGAvpSv8QSz
	2YkMkyQZrGRVfRwPx/qFP4DyKF/UlQKYvniIznUobyDb/XUDixY3uHLV5oBoCzbDQ4V
	O1Exlvhr6+vc/UlEpl5iRnWEXAiaMto+O1KKnulM=
Content-Type: multipart/mixed; boundary="===============6794831373662146514=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] seatd: upgrading to 0.8.0 SUCCEEDED
Message-ID: <01010189b1ee417c-f02f54bb-0c86-4584-8040-f975a6072cb8-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185266

--===============6794831373662146514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *seatd* to *0.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-seatd-upgrade-0.7.0-0.8.0.patch
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
From 1f6adabe95d372f316903517d7b64c42f88cece4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Aug 2023 07:29:38 +0000
Subject: [PATCH] seatd: upgrade 0.7.0 -> 0.8.0

---
 meta/recipes-core/seatd/{seatd_0.7.0.bb => seatd_0.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/seatd/{seatd_0.7.0.bb => seatd_0.8.0.bb} (96%)

diff --git a/meta/recipes-core/seatd/seatd_0.7.0.bb b/meta/recipes-core/seatd/seatd_0.8.0.bb
similarity index 96%
rename from meta/recipes-core/seatd/seatd_0.7.0.bb
rename to meta/recipes-core/seatd/seatd_0.8.0.bb
index 59ef6ad9c1..14c5b1b7ae 100644
--- a/meta/recipes-core/seatd/seatd_0.7.0.bb
+++ b/meta/recipes-core/seatd/seatd_0.8.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
 
 SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
            file://init"
-SRCREV = "a803ba0502cccf147eec7fbcacd11c5b8643c0e0"
+SRCREV = "3e9ef69f14f630a719dd464f3c90a7932f1c8296"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig update-rc.d
-- 
2.39.2


--===============6794831373662146514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/seatd: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd-dbg: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd-dbg: PKGSIZE changed from 259344 to 259096 (-0%)
packages/core2-32-poky-linux/seatd/seatd-dbg: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd-dev: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd-dev: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd-doc: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd-doc: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd-locale: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd-locale: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd-src: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd-src: PKGSIZE changed from 132662 to 132790 (+0%)
packages/core2-32-poky-linux/seatd/seatd-src: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd-staticdev: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd-staticdev: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd: PKGV changed from 0.7.0 [default] to 0.8.0 [default]

--===============6794831373662146514==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-seatd-upgrade-0.7.0-0.8.0.patch"

RnJvbSAxZjZhZGFiZTk1ZDM3MmYzMTY5MDM1MTdkN2I2NGM0MmY4OGNlY2U0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBdWcgMjAyMyAwNzoyOTozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNl
YXRkOiB1cGdyYWRlIDAuNy4wIC0+IDAuOC4wCgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL3NlYXRk
L3tzZWF0ZF8wLjcuMC5iYiA9PiBzZWF0ZF8wLjguMC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29y
ZS9zZWF0ZC97c2VhdGRfMC43LjAuYmIgPT4gc2VhdGRfMC44LjAuYmJ9ICg5NiUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc2VhdGQvc2VhdGRfMC43LjAuYmIgYi9tZXRhL3JlY2lw
ZXMtY29yZS9zZWF0ZC9zZWF0ZF8wLjguMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9zZWF0ZC9zZWF0ZF8wLjcuMC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWNvcmUvc2VhdGQvc2VhdGRfMC44LjAuYmIKaW5kZXggNTllZjZhZDljMS4uMTRj
NWIxYjdhZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc2VhdGQvc2VhdGRfMC43LjAu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvc2VhdGQvc2VhdGRfMC44LjAuYmIKQEAgLTgsNyAr
OCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTcxNWE5OWQyZGQ1
NTJlNjE4OGU3NGQ0ZWQyOTE0ZDVhIgogCiBTUkNfVVJJID0gImdpdDovL2dpdC5zci5odC9+a2Vu
bnlsZXZpbnNlbi9zZWF0ZDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIFwKICAgICAgICAg
ICAgZmlsZTovL2luaXQiCi1TUkNSRVYgPSAiYTgwM2JhMDUwMmNjY2YxNDdlZWM3ZmJjYWNkMTFj
NWI4NjQzYzBlMCIKK1NSQ1JFViA9ICIzZTllZjY5ZjE0ZjYzMGE3MTlkZDQ2NGYzYzkwYTc5MzJm
MWM4Mjk2IgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogaW5oZXJpdCBtZXNvbiBwa2djb25maWcg
dXBkYXRlLXJjLmQKLS0gCjIuMzkuMgoK

--===============6794831373662146514==--

