Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0E2C32792
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:03 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web12.6333.1660589819989571958
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FX/62fJp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 01010182a2ddc48d-0bb9effc-650c-449e-94d2-301f44f61050-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Az/uupLqNxxNjZGFW7FyI8tYcvkspZJrxmXCEVBGsMQ=;
	b=FX/62fJpu+6EkyPqbZJLVico+aunaQCuzvuDx9HOAB9oma2uAIfKCPzzT9hDItaG
	RjorohAsvtVSpiU6TlFD2ZJnDaEnqutc+mlxiTALRa6KSdtY1xvnu2yymw7CP7V6M2L
	zyn3kGIC8d1StDwduCCm60j8fPJFylRDck5+Cwcw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Az/uupLqNxxNjZGFW7FyI8tYcvkspZJrxmXCEVBGsMQ=;
	b=DktxAR+nMj6VaWSnF0ZOSm4ScfEWOTuM2w9atx5wPDveSE0A2G5jttP51QVVqZdE
	2agTumv54mkO1p80Glh7ze3P07tzFa/YEDrYzrGe2siF2ay6+fwuZbkNlJeqYATlsiM
	BpEZ9iKLfpGXAv8Tzyb+qlpa5xoArbOE6QdY6hPU=
Content-Type: multipart/mixed; boundary="===============3917400328280959059=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-networking: upgrading to 2.72.2 SUCCEEDED
Message-ID: 
 <01010182a2ddc48d-0bb9effc-650c-449e-94d2-301f44f61050-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:56:59 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169363

--===============3917400328280959059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-networking* to *2.72.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-networking-upgrade-2.72.1-2.72.2.patch
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
--===============3917400328280959059==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-networking-upgrade-2.72.1-2.72.2.patch"

RnJvbSBlNjE1YzZmYzJhYzIxOTkyNWU0Mzg5MDEwMzRlZjI3NGJlNDhiMGY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMDY6Mzc6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bGliLW5ldHdvcmtpbmc6IHVwZ3JhZGUgMi43Mi4xIC0+IDIuNzIuMgoKLS0tCiAuLi4ve2dsaWIt
bmV0d29ya2luZ18yLjcyLjEuYmIgPT4gZ2xpYi1uZXR3b3JraW5nXzIuNzIuMi5iYn0gICAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcve2dsaWItbmV0d29ya2luZ18yLjcy
LjEuYmIgPT4gZ2xpYi1uZXR3b3JraW5nXzIuNzIuMi5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuNzIuMS5i
YiBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmdfMi43
Mi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmdfMi43Mi4xLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuNzIuMi5iYgpp
bmRleCA0MWYxOGQxYzQ4Li43NDZkMWJjMzljIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuNzIuMS5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuNzIuMi5iYgpAQCAt
OSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NGZiZDY1
MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMiCiBTRUNUSU9OID0gImxpYnMiCiBERVBFTkRTID0g
ImdsaWItMi4wIgogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI2ZmMxYmVkYzgwNjI0
ODRkYzhhMDIwNDk2NTk5NWVmMjM2N2MzZGI1YzkzNDA1OGZmMTYwN2U1YTI0ZDk1YTc0IgorU1JD
X1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiY2QyYTA4NGM3YmI5MWQ3OGU4NDlmYjU1ZDQwZTQ3
MmY2ZDhmNjg2MmNkZGM5ZjEyYzM5MTQ5MzU5YmExODI2OCIKIAogUEFDS0FHRUNPTkZJRyA/Pz0g
Im9wZW5zc2wgJHtAYmIudXRpbHMuY29udGFpbnMoJ1BURVNUX0VOQUJMRUQnLCAnMScsICd0ZXN0
cycsICcnLCBkKX0iCiAKLS0gCjIuMzEuMQoK

--===============3917400328280959059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-dev: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-dev: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-doc: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-doc: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-an: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-an: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ar: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ar: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-as: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-as: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-be: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-be: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bg: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bg: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bn-in: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bn-in: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bs: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bs: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-cs: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-cs: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-da: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-da: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-de: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-de: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-el: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-el: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-ca: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-ca: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-gb: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-gb: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eo: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eo: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-es: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-es: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-et: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-et: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eu: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eu: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fa: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fa: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fi: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fi: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fr: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fr: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fur: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fur: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gd: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gd: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gl: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gl: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gu: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gu: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-he: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-he: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hi: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hi: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hr: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hr: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hu: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hu: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-id: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-id: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-it: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-it: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ja: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ja: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kk: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kk: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-km: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-km: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kn: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kn: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ko: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ko: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lt: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lt: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lv: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lv: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ml: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ml: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-mr: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-mr: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ms: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ms: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nb: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nb: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ne: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ne: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nl: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nl: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-oc: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-oc: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-or: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-or: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pa: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pa: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pl: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pl: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt-br: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt-br: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ro: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ro: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ru: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ru: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sk: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sk: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sl: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sl: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr+latin: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr+latin: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sv: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sv: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ta: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ta: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-te: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-te: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tg: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tg: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-th: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-th: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tr: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tr: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ug: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ug: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-uk: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-uk: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-vi: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-vi: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-cn: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-cn: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-hk: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-hk: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-tw: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-tw: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PKGSIZE changed from 502240 to 502238 (-0%)
packages/core2-32-poky-linux/glib-networking/glib-networking-staticdev: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking-staticdev: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking/glib-networking: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-networking: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-networking: SRC_URI changed from "https://download.gnome.org/sources//glib-networking/2.72/glib-networking-2.72.1.tar.xz;name=archive file://run-ptest" to "https://download.gnome.org/sources//glib-networking/2.72/glib-networking-2.72.2.tar.xz;name=archive file://run-ptest"

--===============3917400328280959059==--

