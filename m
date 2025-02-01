Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED4CC282C2
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:14 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.42731.1738416060782910355
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:21:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cgvBfj3/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QbDtTuS0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010194c1ac1241-dcb57e1c-09cd-45c5-a16b-1ee2f8d4c4f7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416067;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=k1NmHIND1T/+zSDOtdO+XkPzBFMBrTAIR5SgAhIuLsE=;
	b=cgvBfj3/CA3dfNDvNhOkEZpGrKHQyhVxt1RHpTxdHY612Zmu+rgFGMoPFBD/pRzW
	rn5VN3UFFOPWaWwjUgg/I7IZb9F0O5KsaJJ7YE1JGdmeVV7gI4A4f0izuikBUHzR6Pn
	m9kgf07j+fBV7Ahwn4wxiclwoyrDWljo3SkwpSbY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416067;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=k1NmHIND1T/+zSDOtdO+XkPzBFMBrTAIR5SgAhIuLsE=;
	b=QbDtTuS0CJsuf7NdYZNtqPBWEL2b6vtdZs3ruIABslfwtQ+TCdPRecfNKWJ17twM
	Qq3Q149p02ZVJuoApLN7E7GDFRXFE0qdvWY7jY684qftt4D4BOsk+tODC68IRKshLtb
	LJkUQwj7FCYSxxXbyOz47JzqCl5wvkweRAJzcNoU=
Content-Type: multipart/mixed; boundary="===============2854258851291694289=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.27.1 SUCCEEDED
Message-ID: <01010194c1ac1241-dcb57e1c-09cd-45c5-a16b-1ee2f8d4c4f7-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:21:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210586

--===============2854258851291694289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libinput* to *1.27.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.27.0-1.27.1.patch
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
From 2133cdffe5d3a80cc242f74511635c3294834db6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 12:20:03 +0000
Subject: [PATCH] libinput: upgrade 1.27.0 -> 1.27.1

---
 .../wayland/{libinput_1.27.0.bb => libinput_1.27.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.27.0.bb => libinput_1.27.1.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.27.0.bb b/meta/recipes-graphics/wayland/libinput_1.27.1.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.27.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.27.1.bb
index 74705fa35f..04a03f0807 100644
--- a/meta/recipes-graphics/wayland/libinput_1.27.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.27.1.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main \
            file://run-ptest \
            "
-SRCREV = "64d1f198fb2764dfb852a19becaf6f7f097fce2c"
+SRCREV = "3aa004b96488bf0b2446c11b97a7f8a75ff37c23"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.44.1


--===============2854258851291694289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libinput: PKGV changed from 1.27.0 [default] to 1.27.1 [default]
packages/core2-64-poky-linux/libinput: PV changed from "1.27.0" to "1.27.1"
packages/core2-64-poky-linux/libinput/libinput-bin: PV changed from "1.27.0" to "1.27.1"
packages/core2-64-poky-linux/libinput/libinput-bin: PKGV changed from 1.27.0 [default] to 1.27.1 [default]
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 6894936 to 6894776 (-0%)
packages/core2-64-poky-linux/libinput/libinput-dbg: PV changed from "1.27.0" to "1.27.1"
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGV changed from 1.27.0 [default] to 1.27.1 [default]
packages/core2-64-poky-linux/libinput/libinput-dev: PV changed from "1.27.0" to "1.27.1"
packages/core2-64-poky-linux/libinput/libinput-dev: PKGV changed from 1.27.0 [default] to 1.27.1 [default]
packages/core2-64-poky-linux/libinput/libinput-doc: PV changed from "1.27.0" to "1.27.1"
packages/core2-64-poky-linux/libinput/libinput-doc: PKGV changed from 1.27.0 [default] to 1.27.1 [default]
packages/core2-64-poky-linux/libinput/libinput-locale: PV changed from "1.27.0" to "1.27.1"
packages/core2-64-poky-linux/libinput/libinput-locale: PKGV changed from 1.27.0 [default] to 1.27.1 [default]
packages/core2-64-poky-linux/libinput/libinput-ptest: PV changed from "1.27.0" to "1.27.1"
packages/core2-64-poky-linux/libinput/libinput-ptest: PKGV changed from 1.27.0 [default] to 1.27.1 [default]
packages/core2-64-poky-linux/libinput/libinput-src: PKGSIZE changed from 3698229 to 3698279 (+0%)
packages/core2-64-poky-linux/libinput/libinput-src: PV changed from "1.27.0" to "1.27.1"
packages/core2-64-poky-linux/libinput/libinput-src: PKGV changed from 1.27.0 [default] to 1.27.1 [default]
packages/core2-64-poky-linux/libinput/libinput-staticdev: PV changed from "1.27.0" to "1.27.1"
packages/core2-64-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.27.0 [default] to 1.27.1 [default]
packages/core2-64-poky-linux/libinput/libinput: PKGSIZE changed from 1358258 to 1359627 (+0%)
packages/core2-64-poky-linux/libinput/libinput: PV changed from "1.27.0" to "1.27.1"
packages/core2-64-poky-linux/libinput/libinput: PKGV changed from 1.27.0 [default] to 1.27.1 [default]

--===============2854258851291694289==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.27.0-1.27.1.patch"

RnJvbSAyMTMzY2RmZmU1ZDNhODBjYzI0MmY3NDUxMTYzNWMzMjk0ODM0ZGI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAxMjoyMDowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmlucHV0OiB1cGdyYWRlIDEuMjcuMCAtPiAxLjI3LjEKCi0tLQogLi4uL3dheWxhbmQve2xpYmlu
cHV0XzEuMjcuMC5iYiA9PiBsaWJpbnB1dF8xLjI3LjEuYmJ9ICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQve2xpYmlucHV0XzEuMjcuMC5iYiA9PiBsaWJpbnB1dF8x
LjI3LjEuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxh
bmQvbGliaW5wdXRfMS4yNy4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvbGli
aW5wdXRfMS4yNy4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy93YXlsYW5kL2xpYmlucHV0XzEuMjcuMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvbGliaW5wdXRfMS4yNy4xLmJiCmluZGV4IDc0NzA1ZmEz
NWYuLjA0YTAzZjA4MDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5k
L2xpYmlucHV0XzEuMjcuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC9s
aWJpbnB1dF8xLjI3LjEuYmIKQEAgLTE1LDcgKzE1LDcgQEAgREVQRU5EUyA9ICJsaWJldmRldiB1
ZGV2IG10ZGV2IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2xpYmlu
cHV0L2xpYmlucHV0LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbiBcCiAgICAgICAgICAg
IGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiNjRkMWYxOThmYjI3
NjRkZmI4NTJhMTliZWNhZjZmN2YwOTdmY2UyYyIKK1NSQ1JFViA9ICIzYWEwMDRiOTY0ODhiZjBi
MjQ0NmMxMWI5N2E3ZjhhNzVmZjM3YzIzIgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogVVBTVFJF
QU1fQ0hFQ0tfUkVHRVggPSAibGliaW5wdXQtKD9QPHB2ZXI+XGQrXC5cZCtcLig/ITlcZCspXGQr
KSIKLS0gCjIuNDQuMQoK

--===============2854258851291694289==--

