Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0D7C7EE2F
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:02 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.32133.1680384534515256745
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TU452voO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101873eb92d40-84567cc8-92a5-46f0-ac10-5a6d87520948-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Iiusaw6sanHhTlJza73sl37bQJK19AK0k6MQgoNtvf4=;
	b=TU452voOGk7TiM94OQ8LJP1BL42ZkdpBo/2do3vwK8DYDE30VtrvY2twOLjHmfeo
	r60coPJOMw2UC41GWTUucMWdc70fK/aPnz93Eu5LRYMNxiw7HXMRqs7j0CcaXC3loAd
	FD2v8Y+Y3GYwkWzKNLVKDP9OLZi0oLHmYm8z3NQU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Iiusaw6sanHhTlJza73sl37bQJK19AK0k6MQgoNtvf4=;
	b=r0X3KMohQM2xqCUEzukkYHeaqV3JrzD6kpjF66eWxCBl+GiP8Cg+2+jhQKOjsSJs
	REr4Lppm8+9i7gHSeWqAyDyL00PsdEmZeDhcql3ZpLJ5flMLtZvB+jzZai8wocQfi3L
	pm8HizRsgqaFWB7QDfn+CbzqijRZim/ShtQAGFbI=
Content-Type: multipart/mixed; boundary="===============3064081773454424667=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cryptodev-linux: upgrading to 1.13 SUCCEEDED
Message-ID: <010101873eb92d40-84567cc8-92a5-46f0-ac10-5a6d87520948-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179540

--===============3064081773454424667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cryptodev-linux* to *1.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cryptodev-linux-upgrade-1.12-1.13.patch
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
--===============3064081773454424667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-dbg: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-dbg: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-dev: PKGSIZE changed from 9848 to 9914 (+1%)
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-dev: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-dev: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-doc: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-doc: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-locale: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-locale: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-src: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-src: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-staticdev: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-staticdev: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux: PKGV changed from 1.12 [default] to 1.13 [default]

--===============3064081773454424667==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cryptodev-linux-upgrade-1.12-1.13.patch"

RnJvbSBlNzVjNzA2ZDljOWExOGU5MTU0OWIwZDllNjZjNjIwZjhlOWVhNzEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAxODoxMToyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNy
eXB0b2Rldi1saW51eDogdXBncmFkZSAxLjEyIC0+IDEuMTMKCi0tLQogLi4uL3tjcnlwdG9kZXYt
bGludXhfMS4xMi5iYiA9PiBjcnlwdG9kZXYtbGludXhfMS4xMy5iYn0gICAgICAgIHwgMAogbWV0
YS9yZWNpcGVzLWtlcm5lbC9jcnlwdG9kZXYvY3J5cHRvZGV2LmluYyAgICAgICAgICAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1rZXJuZWwvY3J5cHRvZGV2L3tjcnlwdG9kZXYtbGludXhf
MS4xMi5iYiA9PiBjcnlwdG9kZXYtbGludXhfMS4xMy5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWtlcm5lbC9jcnlwdG9kZXYvY3J5cHRvZGV2LWxpbnV4XzEuMTIuYmIgYi9t
ZXRhL3JlY2lwZXMta2VybmVsL2NyeXB0b2Rldi9jcnlwdG9kZXYtbGludXhfMS4xMy5iYgpzaW1p
bGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWtlcm5lbC9jcnlwdG9k
ZXYvY3J5cHRvZGV2LWxpbnV4XzEuMTIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwv
Y3J5cHRvZGV2L2NyeXB0b2Rldi1saW51eF8xLjEzLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMta2VybmVsL2NyeXB0b2Rldi9jcnlwdG9kZXYuaW5jIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9j
cnlwdG9kZXYvY3J5cHRvZGV2LmluYwppbmRleCBlZjM0MmExNTdjLi42MWM2ODhmMWQwIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2NyeXB0b2Rldi9jcnlwdG9kZXYuaW5jCisrKyBi
L21ldGEvcmVjaXBlcy1rZXJuZWwvY3J5cHRvZGV2L2NyeXB0b2Rldi5pbmMKQEAgLTEwLDcgKzEw
LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVlNGQ2OWY1
ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9jcnlw
dG9kZXYtbGludXgvY3J5cHRvZGV2LWxpbnV4O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMg
XAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiZTBjMjVlMjg5ZDZiYWYxZDgzYzJiOWNiNTIzZDNi
YzIzN2QwYzBjOSIKK1NSQ1JFViA9ICI3OTVmNWZkYTE0ODVkNDQ3Y2RiYWQzNDJlODMwNGJlMzE3
ZDRmN2U4IgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM5LjIKCg==

--===============3064081773454424667==--

