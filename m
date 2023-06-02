Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E64CCA46D
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:46 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.7620.1685693431241538892
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YpaZOn6x;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101887b287d7f-029800ba-b719-4314-b2bc-3f6169987d0c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693431;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=D+bMprTpaDJNoLzjNSOS2MHhqqgZztfn6fa3SPcxS9M=;
	b=YpaZOn6xqWz68H7oSykThRbUfd4QGVJ7sGt/mAvtl4R5lChHwF/3r/3+wtk8Zbg4
	wFz3QuLtcepDcST18onjl25kpmqSJx0zxYAVFkdA5FA2IQAfsnyT4pCV5c6jv8BEkkf
	4lixkd7BPC0EBbjKe4I32FSxPVzUjsZEQ/cF3GoM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693431;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=D+bMprTpaDJNoLzjNSOS2MHhqqgZztfn6fa3SPcxS9M=;
	b=G0OhHunmKPBPCJjWiftuziV1oKOzmdBRpdiPLthAk65gKfZC66qQfnsfXX1wYSzo
	XFTV+EcFfAajUwRr2wcyYCUGzF9waxeF74T9QmP4nkYA67Rqn9zFUobmKdi9WdGgmXz
	/ugxkPjiEEjs5s7vKLFCNUaaNvItwKb8WmWgds9Q=
Content-Type: multipart/mixed; boundary="===============1456144816514606663=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.16.1 SUCCEEDED
Message-ID: <010101887b287d7f-029800ba-b719-4314-b2bc-3f6169987d0c-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182168

--===============1456144816514606663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.16.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.14.0-4.16.1.patch
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
--===============1456144816514606663==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.14.0-4.16.1.patch"

RnJvbSA1YWRhZDMyYjQwZjNhOTBmMDdhNmQ3YzViMWI4MzYxYTEwOTIzODIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAwOTo1NDo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRu
ZjogdXBncmFkZSA0LjE0LjAgLT4gNC4xNi4xCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9k
bmYve2RuZl80LjE0LjAuYmIgPT4gZG5mXzQuMTYuMS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZG5mL3tkbmZfNC4xNC4wLmJiID0+IGRuZl80LjE2LjEuYmJ9ICg5OCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4xNC4wLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2RuZi9kbmZfNC4xNi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMTQuMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4xNi4xLmJiCmluZGV4IDYyZGY4YzRhY2Uu
LmZmNzk3MDFkYzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mXzQu
MTQuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80LjE2LjEuYmIKQEAg
LTE4LDcgKzE4LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3JwbS1zb2Z0d2FyZS1t
YW5hZ2VtZW50L2RuZi5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2MKICAgICAgICAgICAgZmlsZTov
LzAwMDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoIFwKICAgICAgICAgICAg
IgogCi1TUkNSRVYgPSAiZTUwODc1YjNmNTc5MGY3MDcyMGJkYjY3MGUxZGQyYmY0ZDgyODc0NCIK
K1NSQ1JFViA9ICI5NGI3Y2M3OTU2NTgwNDA1YjIxOTMyOTU0MWQ2YjQwZGI2NDk5Y2YxIgogVVBT
VFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQrKSspIgogCiBTID0g
IiR7V09SS0RJUn0vZ2l0IgotLSAKMi4zOS4yCgo=

--===============1456144816514606663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/dnf/dnf: FILELIST: added "/etc/dnf/protected.d/python3-dnf.conf"

--===============1456144816514606663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dnf/dnf-bash-completion: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-dbg: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-dbg: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-dev: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-dev: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-doc: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-doc: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bn: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-bn: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-da: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-de: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-el: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-es: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-he: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-id: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-it: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-or: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-si: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-th: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-hans: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-hans: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-src: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-src: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-staticdev: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-test-dep: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-test-dep: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf-test-main: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf-test-main: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf/dnf: FILELIST: added "/etc/dnf/protected.d/python3-dnf.conf"
packages/core2-32-poky-linux/dnf/dnf: PKGSIZE changed from 950126 to 955026 (+1%)
packages/core2-32-poky-linux/dnf/dnf: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf/dnf: PKGV changed from 4.14.0 [default] to 4.16.1 [default]
packages/core2-32-poky-linux/dnf: PV changed from "4.14.0" to "4.16.1"
packages/core2-32-poky-linux/dnf: PKGV changed from 4.14.0 [default] to 4.16.1 [default]

--===============1456144816514606663==--

