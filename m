Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A225EB64DC
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:05 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.10492.1688227322283789541
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cEqgZfvU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010189123095b8-27a9e1e8-0ee3-4820-a44b-41d545448e81-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227321;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=429qmHH80JOyrUgBcN9JbBcbp6MrsrCzxiaj5U2nJjM=;
	b=cEqgZfvUHJRAZC14QgmSCv8hMw+Hu/+ZYfFTb2KiO4axI5PXUHVRVVXOPAT9c2Fi
	7akLBSZIKQBZI8lHQ5PRxYfZEq3ObVp8a/PdXXRtFUrg/4jEKchIbX+y9qlL3SUBolA
	Mv76gB3FYPqiHkIQxhNkKBbaG466+nDg+eH5P6PA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227321;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=429qmHH80JOyrUgBcN9JbBcbp6MrsrCzxiaj5U2nJjM=;
	b=agdgJ7X/Z3wyLHUr+JzyQGfuL8CHM8p+X52E7OyxZGhoZ71X6IHiCG7YN9YMOV+r
	0XgEYh2RC37X/31GTkZb+7Wq95Xnd2ZdZroyDcxGBm2UWdL3dh15q3V1qNiMD7dIKAY
	6A3h9U0peKbMUqD1Z5eXPw/3dBaax0LHNmk1Y2UI=
Content-Type: multipart/mixed; boundary="===============5522246344554565876=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libuv: upgrading to 1.46.0 SUCCEEDED
Message-ID: <01010189123095b8-27a9e1e8-0ee3-4820-a44b-41d545448e81-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:01 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183710

--===============5522246344554565876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libuv* to *1.46.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libuv-upgrade-1.45.0-1.46.0.patch
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
From 8948af26b80d251ccce5aa93c08f74aeb170d291 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jul 2023 06:50:12 +0000
Subject: [PATCH] libuv: upgrade 1.45.0 -> 1.46.0

---
 .../libuv/{libuv_1.45.0.bb => libuv_1.46.0.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.45.0.bb => libuv_1.46.0.bb} (85%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.45.0.bb b/meta/recipes-connectivity/libuv/libuv_1.46.0.bb
similarity index 85%
rename from meta/recipes-connectivity/libuv/libuv_1.45.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.46.0.bb
index 456cb2f962..c9aa25c518 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.45.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.46.0.bb
@@ -6,8 +6,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b \
                     file://LICENSE-extra;md5=f9307417749e19bd1d6d68a394b49324"
 
-SRCREV = "96e05543f53b19d9642b4b0dd73b86ad3cea313e"
-SRC_URI = "git://github.com/libuv/libuv.git;branch=master;protocol=https"
+SRCREV = "f0bb7e40f0508bedf6fad33769b3f87bb8aedfa6"
+SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


--===============5522246344554565876==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libuv-upgrade-1.45.0-1.46.0.patch"

RnJvbSA4OTQ4YWYyNmI4MGQyNTFjY2NlNWFhOTNjMDhmNzRhZWIxNzBkMjkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdWwgMjAyMyAwNjo1MDoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnV2OiB1cGdyYWRlIDEuNDUuMCAtPiAxLjQ2LjAKCi0tLQogLi4uL2xpYnV2L3tsaWJ1dl8xLjQ1
LjAuYmIgPT4gbGlidXZfMS40Ni4wLmJifSAgICAgICAgICAgICAgICB8IDQgKystLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2xpYnV2L3tsaWJ1dl8xLjQ1LjAuYmIgPT4gbGlidXZfMS40Ni4w
LmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlidXYv
bGlidXZfMS40NS4wLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJ1di9saWJ1dl8x
LjQ2LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9saWJ1di9saWJ1dl8xLjQ1LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvbGlidXYvbGlidXZfMS40Ni4wLmJiCmluZGV4IDQ1NmNiMmY5NjIuLmM5YWEy
NWM1MTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlidXYvbGlidXZf
MS40NS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlidXYvbGlidXZfMS40
Ni4wLmJiCkBAIC02LDggKzYsOCBAQCBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTc0YjZmMmY3ODE4YTRlM2E4MGQwMzU1NmY3MWIxMjliIFwK
ICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0UtZXh0cmE7bWQ1PWY5MzA3NDE3NzQ5
ZTE5YmQxZDZkNjhhMzk0YjQ5MzI0IgogCi1TUkNSRVYgPSAiOTZlMDU1NDNmNTNiMTlkOTY0MmI0
YjBkZDczYjg2YWQzY2VhMzEzZSIKLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9saWJ1di9s
aWJ1di5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyIKK1NSQ1JFViA9ICJmMGJiN2U0
MGYwNTA4YmVkZjZmYWQzMzc2OWIzZjg3YmI4YWVkZmE2IgorU1JDX1VSSSA9ICJnaXQ6Ly9naXRo
dWIuY29tL2xpYnV2L2xpYnV2LmdpdDticmFuY2g9djEueDtwcm90b2NvbD1odHRwcyIKIFVQU1RS
RUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gInYoP1A8cHZlcj5cZCsoXC5cZCspKykiCiAKIFMgPSAi
JHtXT1JLRElSfS9naXQiCi0tIAoyLjM5LjIKCg==

--===============5522246344554565876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libuv: PKGV changed from 1.45.0 [default] to 1.46.0 [default]
packages/core2-32-poky-linux/libuv: PV changed from "1.45.0" to "1.46.0"
packages/core2-32-poky-linux/libuv: SRC_URI changed from "git://github.com/libuv/libuv.git;branch=master;protocol=https" to "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https"
packages/core2-32-poky-linux/libuv/libuv-dbg: PKGV changed from 1.45.0 [default] to 1.46.0 [default]
packages/core2-32-poky-linux/libuv/libuv-dbg: PV changed from "1.45.0" to "1.46.0"
packages/core2-32-poky-linux/libuv/libuv-dbg: PKGSIZE changed from 617756 to 648948 (+5%)
packages/core2-32-poky-linux/libuv/libuv-dev: PKGV changed from 1.45.0 [default] to 1.46.0 [default]
packages/core2-32-poky-linux/libuv/libuv-dev: PV changed from "1.45.0" to "1.46.0"
packages/core2-32-poky-linux/libuv/libuv-dev: PKGSIZE changed from 104549 to 105460 (+1%)
packages/core2-32-poky-linux/libuv/libuv-doc: PKGV changed from 1.45.0 [default] to 1.46.0 [default]
packages/core2-32-poky-linux/libuv/libuv-doc: PV changed from "1.45.0" to "1.46.0"
packages/core2-32-poky-linux/libuv/libuv-locale: PKGV changed from 1.45.0 [default] to 1.46.0 [default]
packages/core2-32-poky-linux/libuv/libuv-locale: PV changed from "1.45.0" to "1.46.0"
packages/core2-32-poky-linux/libuv/libuv-src: PKGV changed from 1.45.0 [default] to 1.46.0 [default]
packages/core2-32-poky-linux/libuv/libuv-src: PV changed from "1.45.0" to "1.46.0"
packages/core2-32-poky-linux/libuv/libuv-src: PKGSIZE changed from 602926 to 608069 (+1%)
packages/core2-32-poky-linux/libuv/libuv-staticdev: PKGV changed from 1.45.0 [default] to 1.46.0 [default]
packages/core2-32-poky-linux/libuv/libuv-staticdev: PV changed from "1.45.0" to "1.46.0"
packages/core2-32-poky-linux/libuv/libuv: PKGV changed from 1.45.0 [default] to 1.46.0 [default]
packages/core2-32-poky-linux/libuv/libuv: PV changed from "1.45.0" to "1.46.0"

--===============5522246344554565876==--

