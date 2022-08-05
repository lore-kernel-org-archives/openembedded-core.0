Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC15C32770
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:38 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web12.3947.1659679408484598311
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mN6BKK/v;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101826c99f98c-57959a7b-5f62-4946-96d7-4b0261a0e3c8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Sz3GBiY1wplfRmGcxlP1Pqp20H6j331AFzpJKWscBJY=;
	b=mN6BKK/vmdIYqDJT0gk4t8z/+Rejp94ajo1lxC4KdOGu1fDr9cO4nvdzsfoeGFuE
	syxDlvZ8jq9tr/wL0VwF+46zdeSS9i6MctdziSX/emwTcWcFJlVzmsOpDaYSaSqRg+C
	I/DXbFcIi0JDffUugGCPM55jf5gQ4SvjzHwNdasA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Sz3GBiY1wplfRmGcxlP1Pqp20H6j331AFzpJKWscBJY=;
	b=fpiFPN5UvtNzJQw7WnpavYex9M3pTfHuizjaFUzba/roTA1UOJaP3AKQIdUm2WQl
	pTQl5aHc8TvSU7r+PmBEeaOIchtBgGmzVZQcez2Jt/mSNGdGbc2FyyfZXsjJiBRklSD
	y6Q5muHKhdI+ZT/kXuA/8fCuckXYupkvD3wPkkoY=
Content-Type: multipart/mixed; boundary="===============2046020185503047346=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mobile-broadband-provider-info: upgrading to 20220725 SUCCEEDED
Message-ID: 
 <010101826c99f98c-57959a7b-5f62-4946-96d7-4b0261a0e3c8-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:26 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168898

--===============2046020185503047346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mobile-broadband-provider-info* to *20220725* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mobile-broadband-provider-info-upgrade-20220511-2022.patch
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
--===============2046020185503047346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mobile-broadband-provider-info: PKGV changed from 20220511 [default] to 20220725 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info: PV changed from "20220511" to "20220725"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dbg: PKGV changed from 20220511 [default] to 20220725 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dbg: PV changed from "20220511" to "20220725"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dev: PKGV changed from 20220511 [default] to 20220725 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dev: PV changed from "20220511" to "20220725"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-doc: PKGV changed from 20220511 [default] to 20220725 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-doc: PV changed from "20220511" to "20220725"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-locale: PKGV changed from 20220511 [default] to 20220725 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-locale: PV changed from "20220511" to "20220725"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-src: PKGV changed from 20220511 [default] to 20220725 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-src: PV changed from "20220511" to "20220725"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-staticdev: PKGV changed from 20220511 [default] to 20220725 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-staticdev: PV changed from "20220511" to "20220725"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PKGV changed from 20220511 [default] to 20220725 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PKGSIZE changed from 517675 to 518778 (+0%)
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PV changed from "20220511" to "20220725"

--===============2046020185503047346==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mobile-broadband-provider-info-upgrade-20220511-2022.patch"

RnJvbSAyMGM2MGZmOGY0NTBhZDRkZGVkNWNhNmViZTA5MzIzYzMyNDU0ZGExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNCBBdWcgMjAyMiAyMDozNzoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1v
YmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mbzogdXBncmFkZSAyMDIyMDUxMSAtPiAyMDIyMDcy
NQoKLS0tCiAuLi4vbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvX2dpdC5iYiAgICAgICAg
ICAgICAgICAgICAgIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9i
aWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvL21vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5m
b19naXQuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L21vYmlsZS1icm9hZGJhbmQtcHJv
dmlkZXItaW5mby9tb2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWluZm9fZ2l0LmJiCmluZGV4IGU2
ZjIxNmU1Y2IuLjJjYzkyYjdiNDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvL21vYmlsZS1icm9hZGJhbmQtcHJvdmlk
ZXItaW5mb19naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb2JpbGUtYnJv
YWRiYW5kLXByb3ZpZGVyLWluZm8vbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvX2dpdC5i
YgpAQCAtNSw4ICs1LDggQEAgU0VDVElPTiA9ICJuZXR3b3JrIgogTElDRU5TRSA9ICJQRCIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTg3OTY0NTc5YjJhOGVjZTRiYzY3
NDRkMmRjOWE4YjA0IgogCi1TUkNSRVYgPSAiM2Q1YzhkMGY3ZTAyNjQ3NjhhMmMwMDBkMGZkNGI0
ZDRhOTkxZTA0MSIKLVBWID0gIjIwMjIwNTExIgorU1JDUkVWID0gImZlMTk4OTJhODE2OGJmMTlk
ODFlM2JjNGVlMzE5YmY3ZjlmMDU4ZjUiCitQViA9ICIyMDIyMDcyNSIKIFBFID0gIjEiCiAKIFNS
Q19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9tb2JpbGUtYnJvYWRiYW5kLXBy
b3ZpZGVyLWluZm8uZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIgotLSAKMi4zMS4xCgo=

--===============2046020185503047346==--

