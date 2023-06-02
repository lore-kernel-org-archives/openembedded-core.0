Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB23CCA46E
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:46 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.7633.1685693432530739229
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QmkfR2Bw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101887b287ebc-ba1b4782-b573-432b-9c8b-5b8861ea23e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2bfoZLxCaimI2AYUzQPhAbeS982F/DZAh+OQiaxC9EA=;
	b=QmkfR2BwlsKQFHGI2lYyLJ0ACPD8sUJ+nSAeMjS4ZPbFZy86xMF+goXnn/AF2YY4
	NaMkVUbiVP6Un7Y0NY3CjCkyWGGHmzvgdAA2DaKj/uAciI2PJNAUAypdgqEyjXOXjoR
	pa4THbbBNVOmEUwFsk1VtL+FpHnjyPnl8WT0P8RQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2bfoZLxCaimI2AYUzQPhAbeS982F/DZAh+OQiaxC9EA=;
	b=h8myIduU+G+d8MEGhdBESGD90iS74NhSsyksN9j2srEGcbt0YHi3huFcZo3RVUPe
	W2YeoDPS85bWkvLHN5iWxY3h9rMgELkpdGsWN7Dp0m4S8fI9StZL5mO07ccnHuxqBfE
	7TSUplUEc8Z36FFxvOCclxgMrvxWuEiCOC2IHIMM=
Content-Type: multipart/mixed; boundary="===============2016879204301663744=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdnf: upgrading to 0.70.1 SUCCEEDED
Message-ID: <010101887b287ebc-ba1b4782-b573-432b-9c8b-5b8861ea23e4-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182183

--===============2016879204301663744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libdnf* to *0.70.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdnf-upgrade-0.70.0-0.70.1.patch
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
--===============2016879204301663744==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdnf-upgrade-0.70.0-0.70.1.patch"

RnJvbSBhZjdiOGUxY2RjOTllYmM4ZjQ0MDcwMzliNzhhMGYyNzcwZDZhYmM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxMDozMTowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmRuZjogdXBncmFkZSAwLjcwLjAgLT4gMC43MC4xCgotLS0KIC4uLi9saWJkbmYve2xpYmRuZl8w
LjcwLjAuYmIgPT4gbGliZG5mXzAuNzAuMS5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9saWJkbmYve2xpYmRuZl8wLjcwLjAuYmIgPT4gbGliZG5mXzAuNzAuMS5i
Yn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRu
Zl8wLjcwLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZl8wLjcwLjEu
YmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2xpYmRuZi9saWJkbmZfMC43MC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bGliZG5mL2xpYmRuZl8wLjcwLjEuYmIKaW5kZXggMTRkNmEzN2RlMS4uYzQ0YWUyNzI5YiAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmZfMC43MC4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mXzAuNzAuMS5iYgpAQCAtMTIs
NyArMTIsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vcnBtLXNvZnR3YXJlLW1hbmFn
ZW1lbnQvbGliZG5mO2JyYW5jaD1kbmYtNC1tYXN0ZXI7cAogICAgICAgICAgICBmaWxlOi8vMDAw
MS1kcm9wLUZpbmRQeXRob25JbnN0RGlyLmNtYWtlLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1T
UkNSRVYgPSAiOTM3NTliYzVjYWMyNjI5MDZlNTJiNmExNzNkN2IxNTc5MTRlYzI5ZSIKK1NSQ1JF
ViA9ICIzYjhlNTlhZDhlZDNhM2ViNzM2ZDhhMmUxNmI0ZmMwNDMxM2QxZjEyIgogVVBTVFJFQU1f
Q0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+KD8hNFwuOTApXGQrKFwuXGQrKSspIgogCiBT
ID0gIiR7V09SS0RJUn0vZ2l0IgotLSAKMi4zOS4yCgo=

--===============2016879204301663744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libdnf: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-dbg: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-dbg: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-dbg: PKGSIZE changed from 50884296 to 50891404 (+0%)
packages/core2-32-poky-linux/libdnf/libdnf-dev: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-dev: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-doc: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-doc: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-as: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-as: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-bg: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-bg: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-bn-in: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-bn-in: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-bn: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-bn: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ca: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ca: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-cs: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-cs: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-da: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-da: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-de: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-de: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-el: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-el: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-es: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-es: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-eu: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-eu: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-fa: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-fa: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-fi: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-fi: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-fil: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-fil: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-fr: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-fr: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-fur: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-fur: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-gu: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-gu: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-hi: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-hi: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-hu: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-hu: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ia: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ia: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-id: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-id: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-is: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-is: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-it: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-it: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ja: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ja: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-kn: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-kn: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ko: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ko: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-mai: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-mai: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ml: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ml: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-mr: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-mr: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-nb: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-nb: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-nl: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-nl: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-or: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-or: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-pa: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-pa: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-pl: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-pl: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-pt-br: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-pt-br: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-pt: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-pt: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ru: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ru: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-si: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-si: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-sk: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-sk: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-sq: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-sq: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-sr+latin: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-sr+latin: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-sr: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-sr: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-sv: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-sv: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ta: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ta: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-te: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-te: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-th: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-th: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-tr: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-tr: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-uk: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-uk: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-zh-cn: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-zh-cn: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-zh-tw: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-zh-tw: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-src: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-src: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-src: PKGSIZE changed from 7283435 to 7283201 (-0%)
packages/core2-32-poky-linux/libdnf/libdnf-staticdev: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf-staticdev: PKGV changed from 0.70.0 [default] to 0.70.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf: PV changed from "0.70.0" to "0.70.1"
packages/core2-32-poky-linux/libdnf/libdnf: PKGV changed from 0.70.0 [default] to 0.70.1 [default]

--===============2016879204301663744==--

