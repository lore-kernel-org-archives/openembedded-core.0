Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43010C4708B
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.350.1664643228089855639
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kx9nOscC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101839477dc56-df2f7950-5d20-44a8-bd4c-7a95a876ca96-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8sm707/3fVW5DXV7IlE6oa99x+D/P4WuoU5hPwR4Bos=;
	b=kx9nOscC/m7uqHvSBZbGzNJZhaImC/av1mW8EzxTL6YjTZzme0g8kaM2agiOZVTR
	xmB2kz3joc7fNGGf2BipohXxcG6qPhfvnFoJbW54TmdCQKcifsSeafzpgTN4XVDb11p
	HhVKH+zbdTUENMeI40KkPxkkzmZARgbiYR+SVzkM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8sm707/3fVW5DXV7IlE6oa99x+D/P4WuoU5hPwR4Bos=;
	b=YgAhz86i4+hK1mY5sp/CX7C/6h6fLvXrpo4PrzN2CACEIPD/tI1jZK778DXAtivs
	DSHvJUrf+YlEtxvUwgPqncN6ssIXxMhyeRtyc0HmpyjZLuxDoxqi7NcvmblLengcUSL
	4HhqIuUJMXyTyf3v7auTIb2yeAEDgoZaKRpDmI8U=
Content-Type: multipart/mixed; boundary="===============4326109921609387075=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-iso8601: upgrading to 1.1.0 SUCCEEDED
Message-ID: 
 <010101839477dc56-df2f7950-5d20-44a8-bd4c-7a95a876ca96-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171295

--===============4326109921609387075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-iso8601* to *1.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-iso8601-upgrade-1.0.2-1.1.0.patch
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
--===============4326109921609387075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-iso8601 (sysroot):
  /usr/lib/python3.10/site-packages/iso8601-1.0.2.dist-info moved to /usr/lib/python3.10/site-packages/iso8601-1.1.0.dist-info

--===============4326109921609387075==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-iso8601-upgrade-1.0.2-1.1.0.patch"

RnJvbSAzZTYxZjlmZDA4ZGYzY2NhY2RhNWFkMmM4OGVlODc2NGU5ZTRjMDc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwODoyNDowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaXNvODYwMTogdXBncmFkZSAxLjAuMiAtPiAxLjEuMAoKLS0tCiAuLi44NjAxXzEuMC4y
LmJiID0+IHB5dGhvbjMtaXNvODYwMV8xLjEuMC5iYn0gfCAyMyArKysrKysrKysrKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWlzbzg2MDFfMS4wLjIuYmIg
PT4gcHl0aG9uMy1pc284NjAxXzEuMS4wLmJifSAoMjQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pc284NjAxXzEuMC4yLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWlzbzg2MDFfMS4xLjAuYmIKc2ltaWxhcml0eSBp
bmRleCAyNCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWlzbzg2MDFfMS4wLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1pc284NjAxXzEuMS4wLmJiCmluZGV4IDkzYWYyMzNkMjkuLmVkZTdkOTljZTUgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pc284NjAxXzEu
MC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pc284NjAx
XzEuMS4wLmJiCkBAIC0xLDkgKzEsMjggQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VN
IHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZv
bGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGlj
ZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwg
YW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdM
aWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJp
Z2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNF
CisjICsrKyBMSUNFTlNFCisjIEBAIC0xLDQgKzEsNCBAQAorIyAtQ29weXJpZ2h0IChjKSAyMDA3
IC0gMjAxNSBNaWNoYWVsIFR3b21leQorIyArQ29weXJpZ2h0IChjKSAyMDA3IC0gMjAyMiBNaWNo
YWVsIFR3b21leQorIyAgCisjICBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9m
IGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYQorIyAgY29weSBvZiB0aGlzIHNvZnR3
YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZQorIyAKKyMKKwogU1VN
TUFSWSA9ICJTaW1wbGUgbW9kdWxlIHRvIHBhcnNlIElTTyA4NjAxIGRhdGVzIgogSE9NRVBBR0Ug
PSAiaHR0cDovL3B5aXNvODYwMS5yZWFkdGhlZG9jcy5vcmcvIgogTElDRU5TRSA9ICJNSVQiCi1M
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1iMDU2MjVmMjMzNmZhMDI0ZThk
NTdlNjVjNjU5NTg0NCIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWFh
YjMxZjJlZjdiYTIxNGE1YTM0MWVhYTQ3YTdmMzY3IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MjdmNTAzMjIwZTY4NDVkOWRiOTU0ZmIyMTJiOTViMDM2MmQ4YjdlNmMxYjIzMjZhODcwNjFjM2Rl
OTM1OTRiMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzMjgxMWU3YjgxZGVlZTIwNjNlYTZkMmU5
NGY4ODE5YTg2ZDFmMzgxMWU0OWQyMzYyM2E0MWZhODMyYmVmMDNmIgogCiBpbmhlcml0IHB5cGkg
cHl0aG9uX3BvZXRyeV9jb3JlCiAKLS0gCjIuMzEuMQoK

--===============4326109921609387075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-iso8601: PKGV changed from 1.0.2 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/iso8601/iso8601-1.0.2.tar.gz" to "https://files.pythonhosted.org/packages/source/i/iso8601/iso8601-1.1.0.tar.gz"
packages/core2-32-poky-linux/python3-iso8601: PV changed from "1.0.2" to "1.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-dbg: PKGV changed from 1.0.2 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-dbg: PV changed from "1.0.2" to "1.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-dev: PKGV changed from 1.0.2 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-dev: PV changed from "1.0.2" to "1.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-doc: PKGV changed from 1.0.2 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-doc: PV changed from "1.0.2" to "1.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-locale: PKGV changed from 1.0.2 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-locale: PV changed from "1.0.2" to "1.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-src: PKGV changed from 1.0.2 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-src: PV changed from "1.0.2" to "1.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-staticdev: PKGV changed from 1.0.2 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-staticdev: PV changed from "1.0.2" to "1.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601: PKGSIZE changed from 37424 to 38691 (+3%)
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601: PKGV changed from 1.0.2 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601: PV changed from "1.0.2" to "1.1.0"
Changes to packages/core2-32-poky-linux/python3-iso8601 (sysroot):
  /usr/lib/python3.10/site-packages/iso8601-1.0.2.dist-info moved to /usr/lib/python3.10/site-packages/iso8601-1.1.0.dist-info

--===============4326109921609387075==--

