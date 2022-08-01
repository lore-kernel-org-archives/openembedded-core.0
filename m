Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8146FC00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:14:56 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.22199.1659341690240293621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FqyTunwP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101825878d229-4d4be50a-569d-4079-8b49-7a8406b2f5e3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659341689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=W431Qii1pQxeoHjjKi8hYe1XK3UM9oVshZi/ozQ8Zgs=;
	b=FqyTunwPRKLwjOmZF8thdZsJgoIcxK9f+7kVgVr3KL19XJ2VLNCOQihcqc/uhyVA
	4+PER/cPS6y+vuCPqN4wKGqrMJFmXMcV1+ag/Lx0ShUeriUZjIMZfC5u/GEQO78/VBL
	4HxTKn3kGvUkVVnn7uu4DpMjtGaKfjOpCrdU2LrE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659341689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=W431Qii1pQxeoHjjKi8hYe1XK3UM9oVshZi/ozQ8Zgs=;
	b=W3hBA47OD4e7zassRPnYbTpEXhZGGz7aDT3zZq9SD9N+hNCVTT9ZY3VIHez6xlQi
	xX17mGCJAGqFVUpSzzF2Dzs3K1hakR2vcnPjrMgWjNz+aHr5QwgSt4oyIrx/dJfN4/B
	vIcvyevSupcjIcp9EXonIRYS/Nn9hHx0VXcfyvN4=
Content-Type: multipart/mixed; boundary="===============3679255664190690165=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mobile-broadband-provider-info: upgrading to 20220725 SUCCEEDED
Message-ID: 
 <010101825878d229-4d4be50a-569d-4079-8b49-7a8406b2f5e3-000000@us-west-2.amazonses.com>
Date: Mon, 1 Aug 2022 08:14:49 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 08:14:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168696

--===============3679255664190690165==
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
--===============3679255664190690165==
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
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PKGSIZE changed from 517675 to 518778 (+0%)
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PKGV changed from 20220511 [default] to 20220725 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PV changed from "20220511" to "20220725"

--===============3679255664190690165==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mobile-broadband-provider-info-upgrade-20220511-2022.patch"

RnJvbSA1ZWYwYzBiNGQ2OGEyZTViMjUzYzk4MGM1ODFkZjk4NzdmYTA2YzdiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBdWcgMjAyMiAwNzo0ODoxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1v
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

--===============3679255664190690165==--

