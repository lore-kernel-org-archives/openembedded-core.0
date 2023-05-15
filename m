Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9999FCA9EC6
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.3707.1684186747201505461
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RRSloHWS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188215a52ac-e6d696e4-9a47-4869-9a24-72a204958a07-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZIHBz9K0uTOYmXipDAMvAuMynlJ3TYgTg58lHt5gtso=;
	b=RRSloHWSaPdKUU5VNSIpmVYp3HrKn77yzV+bmWjB9gQR0gjk6CHugdO3A3mPH0g9
	+4YmZNQsCRSKT0LC1WriqQDxw4fKMq2BSu42AdYQ5L2wIGsScqF7j/2gXwOX3lrbQFQ
	B790xhF0CxtN+BZkbX4kpl9OsDNx+PcIpoe9GkN4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZIHBz9K0uTOYmXipDAMvAuMynlJ3TYgTg58lHt5gtso=;
	b=GU5FvBHm6P6J0BvnBSEGwBWvK6tLfLP/3kx2P+2JLzKZS6ktazmMpG7fwthzT9Gc
	ClUKu9/LuDjglLujbh7gcd6+3KkUK02/PWHbZKKSNIyR1SnOdty51DEcKvFwdX5ihsE
	WMDy9WGNU21S+4g/6Rdg01/qYSEynRqgJR+8x3p8=
Content-Type: multipart/mixed; boundary="===============1407696685498790736=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-psutil: upgrading to 5.9.5 SUCCEEDED
Message-ID: <01010188215a52ac-e6d696e4-9a47-4869-9a24-72a204958a07-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181308

--===============1407696685498790736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-psutil* to *5.9.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-psutil-upgrade-5.9.4-5.9.5.patch
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
--===============1407696685498790736==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-psutil-upgrade-5.9.4-5.9.5.patch"

RnJvbSAxNzQ5NjAyZGFiMWFhNmVjODZlNTFiNDIxZGY3OWNhOGM1MjQ5ODEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTI6MDg6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBzdXRpbDogdXBncmFkZSA1LjkuNCAtPiA1LjkuNQoKLS0tCiAuLi5zdXRpbF81Ljku
NC5iYiA9PiBweXRob24zLXBzdXRpbF81LjkuNS5iYn0gfCAyNSArKysrKysrKysrKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBzdXRpbF81LjkuNC5iYiA9
PiBweXRob24zLXBzdXRpbF81LjkuNS5iYn0gKDQ3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHN1dGlsXzUuOS40LmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBzdXRpbF81LjkuNS5iYgpzaW1pbGFyaXR5IGluZGV4
IDQ3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHN1
dGlsXzUuOS40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHN1dGlsXzUuOS41LmJiCmluZGV4IDAxOWVhMmRlYzEuLjc2YzdiN2VmNWEgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wc3V0aWxfNS45LjQuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBzdXRpbF81LjkuNS5i
YgpAQCAtMSw5ICsxLDMwIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMg
aGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcg
aXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4
dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1t
YXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1V
cGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFy
cyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQorIyArKysg
TElDRU5TRQorIyBAQCAtMSw2ICsxLDYgQEAKKyMgIEJTRCAzLUNsYXVzZSBMaWNlbnNlCisjICAK
KyMgLUNvcHlyaWdodCAoYykgMjAwOSwgSmF5IExvZGVuLCBEYXZlIERhZXNjaGxlciwgR2lhbXBh
b2xvIFJvZG9sYScKKyMgK0NvcHlyaWdodCAoYykgMjAwOSwgSmF5IExvZGVuLCBEYXZlIERhZXNj
aGxlciwgR2lhbXBhb2xvIFJvZG9sYQorIyAgQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgIAorIyAg
UmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBv
ciB3aXRob3V0IG1vZGlmaWNhdGlvbiwKKyMgCisjCisKIFNVTU1BUlkgPSAiQSBjcm9zcy1wbGF0
Zm9ybSBwcm9jZXNzIGFuZCBzeXN0ZW0gdXRpbGl0aWVzIG1vZHVsZSBmb3IgUHl0aG9uIgogTElD
RU5TRSA9ICJCU0QtMy1DbGF1c2UiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT1lMzVmZDlmMjcxZDE5ZDVmNzQyZjIwYTlkMWY4YmI4YiIKK0xJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWE5YzcyMTEzYTg0M2QwZDczMmEwYWMxYzIwMGQ4MWIxIgog
SE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0L3BzdXRpbC8iCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICIzZDdmOTczOWViNDM1ZDRiMTMzODk0NGFiZTIzZjQ5NTg0YmRlNTM5NWYy
NzQ4N2QyZWUyNWFkOWE4Nzc0YTYyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU0MTA2MzhlNGRm
MzljNTRkOTU3ZmM1MWNlMDMwNDhhY2Q4ZTZkNjBhYmMwZjUxMDdhZjUxZTVmYjU2NmViM2MiCiAK
IGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjM5LjIKCg==

--===============1407696685498790736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-psutil: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/psutil/psutil-5.9.4.tar.gz;downloadfilename=psutil-5.9.4.tar.gz" to "https://files.pythonhosted.org/packages/source/p/psutil/psutil-5.9.5.tar.gz;downloadfilename=psutil-5.9.5.tar.gz"
packages/core2-32-poky-linux/python3-psutil: PV changed from "5.9.4" to "5.9.5"
packages/core2-32-poky-linux/python3-psutil: PKGV changed from 5.9.4 [default] to 5.9.5 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dbg: PKGSIZE changed from 92332 to 92324 (-0%)
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dbg: PV changed from "5.9.4" to "5.9.5"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dbg: PKGV changed from 5.9.4 [default] to 5.9.5 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dev: PV changed from "5.9.4" to "5.9.5"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dev: PKGV changed from 5.9.4 [default] to 5.9.5 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-doc: PV changed from "5.9.4" to "5.9.5"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-doc: PKGV changed from 5.9.4 [default] to 5.9.5 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-locale: PV changed from "5.9.4" to "5.9.5"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-locale: PKGV changed from 5.9.4 [default] to 5.9.5 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-src: PKGSIZE changed from 60876 to 61218 (+1%)
packages/core2-32-poky-linux/python3-psutil/python3-psutil-src: PV changed from "5.9.4" to "5.9.5"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-src: PKGV changed from 5.9.4 [default] to 5.9.5 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-staticdev: PV changed from "5.9.4" to "5.9.5"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-staticdev: PKGV changed from 5.9.4 [default] to 5.9.5 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-tests: PKGSIZE changed from 1322696 to 1342645 (+2%)
packages/core2-32-poky-linux/python3-psutil/python3-psutil-tests: PV changed from "5.9.4" to "5.9.5"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-tests: PKGV changed from 5.9.4 [default] to 5.9.5 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil: PKGSIZE changed from 865576 to 869047 (+0%)
packages/core2-32-poky-linux/python3-psutil/python3-psutil: PV changed from "5.9.4" to "5.9.5"
packages/core2-32-poky-linux/python3-psutil/python3-psutil: PKGV changed from 5.9.4 [default] to 5.9.5 [default]
Changes to packages/core2-32-poky-linux/python3-psutil (sysroot):
  /usr/lib/python3.11/site-packages/psutil-5.9.4.dist-info moved to /usr/lib/python3.11/site-packages/psutil-5.9.5.dist-info

--===============1407696685498790736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-psutil (sysroot):
  /usr/lib/python3.11/site-packages/psutil-5.9.4.dist-info moved to /usr/lib/python3.11/site-packages/psutil-5.9.5.dist-info

--===============1407696685498790736==--

