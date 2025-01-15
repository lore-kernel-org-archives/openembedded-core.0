Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E1C7C021B6
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:32 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.17800.1736936770951580473
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GnKw0nbd;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=xQDNZ5vn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010194697ff13b-55efcad8-bddb-4484-ac1d-32f24fc5792e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936780;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pCvqSzcRj/Dlo+Dj6iiwB/UxlOF0X1t1BM8S7bCaZGI=;
	b=GnKw0nbd+jaegVUwe0i8uBvMeTp8W1E61arcYjzhUvUOz7BEie5f4F10CWeNO0S5
	C10XRzo7XTmksB81+x5YiHuJWS42WoZA9IQYh+2yQ3rFV7DaFiLGmNF8CwWGt1m8G3z
	cgqTLyjPqRipxLKrfAzLBcWvyRzCq1vWCKG/rJqE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936780;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pCvqSzcRj/Dlo+Dj6iiwB/UxlOF0X1t1BM8S7bCaZGI=;
	b=xQDNZ5vnSA2JNp/20t8FyyiuIxsKKvrDtrEBHVgEhZhsv9BKeG40uwy5xJPzuQ3j
	/2ZFnP44Zfk92Xy6uiaaOECA/rBdy88tsPrd28PDRIWbxclA+3phxCnX8y3we/Cg8Ru
	jld+ym75SKIJ5+FNIRBhJ9PptMshj4YrF2tE9BPA=
Content-Type: multipart/mixed; boundary="===============5578912835729256119=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.27.1 SUCCEEDED
Message-ID: <01010194697ff13b-55efcad8-bddb-4484-ac1d-32f24fc5792e-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209878

--===============5578912835729256119==
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
From b96b8a48ad7f56d45780afe20c3ca4e69906effb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 09:49:57 +0000
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


--===============5578912835729256119==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.27.0-1.27.1.patch"

RnJvbSBiOTZiOGE0OGFkN2Y1NmQ0NTc4MGFmZTIwYzNjYTRlNjk5MDZlZmZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDk6NDk6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJpbnB1dDogdXBncmFkZSAxLjI3LjAgLT4gMS4yNy4xCgotLS0KIC4uLi93YXlsYW5kL3tsaWJp
bnB1dF8xLjI3LjAuYmIgPT4gbGliaW5wdXRfMS4yNy4xLmJifSAgICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3tsaWJpbnB1dF8xLjI3LjAuYmIgPT4gbGliaW5wdXRf
MS4yNy4xLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXls
YW5kL2xpYmlucHV0XzEuMjcuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL2xp
YmlucHV0XzEuMjcuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC9saWJpbnB1dF8xLjI3LjAuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL2xpYmlucHV0XzEuMjcuMS5iYgppbmRleCA3NDcwNWZh
MzVmLi4wNGEwM2YwODA3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFu
ZC9saWJpbnB1dF8xLjI3LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQv
bGliaW5wdXRfMS4yNy4xLmJiCkBAIC0xNSw3ICsxNSw3IEBAIERFUEVORFMgPSAibGliZXZkZXYg
dWRldiBtdGRldiIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9saWJp
bnB1dC9saWJpbnB1dC5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXAogICAgICAgICAg
ICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjY0ZDFmMTk4ZmIy
NzY0ZGZiODUyYTE5YmVjYWY2ZjdmMDk3ZmNlMmMiCitTUkNSRVYgPSAiM2FhMDA0Yjk2NDg4YmYw
YjI0NDZjMTFiOTdhN2Y4YTc1ZmYzN2MyMyIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIFVQU1RS
RUFNX0NIRUNLX1JFR0VYID0gImxpYmlucHV0LSg/UDxwdmVyPlxkK1wuXGQrXC4oPyE5XGQrKVxk
KykiCi0tIAoyLjQ0LjEKCg==

--===============5578912835729256119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libinput: PKGV changed from 1.27.0 [default] to 1.27.1 [default]
packages/core2-64-poky-linux/libinput: PV changed from "1.27.0" to "1.27.1"
packages/core2-64-poky-linux/libinput/libinput-bin: PKGV changed from 1.27.0 [default] to 1.27.1 [default]
packages/core2-64-poky-linux/libinput/libinput-bin: PV changed from "1.27.0" to "1.27.1"
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 6894936 to 6894776 (-0%)
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGV changed from 1.27.0 [default] to 1.27.1 [default]
packages/core2-64-poky-linux/libinput/libinput-dbg: PV changed from "1.27.0" to "1.27.1"
packages/core2-64-poky-linux/libinput/libinput-dev: PKGV changed from 1.27.0 [default] to 1.27.1 [default]
packages/core2-64-poky-linux/libinput/libinput-dev: PV changed from "1.27.0" to "1.27.1"
packages/core2-64-poky-linux/libinput/libinput-doc: PKGV changed from 1.27.0 [default] to 1.27.1 [default]
packages/core2-64-poky-linux/libinput/libinput-doc: PV changed from "1.27.0" to "1.27.1"
packages/core2-64-poky-linux/libinput/libinput-locale: PKGV changed from 1.27.0 [default] to 1.27.1 [default]
packages/core2-64-poky-linux/libinput/libinput-locale: PV changed from "1.27.0" to "1.27.1"
packages/core2-64-poky-linux/libinput/libinput-ptest: PKGV changed from 1.27.0 [default] to 1.27.1 [default]
packages/core2-64-poky-linux/libinput/libinput-ptest: PV changed from "1.27.0" to "1.27.1"
packages/core2-64-poky-linux/libinput/libinput-src: PKGSIZE changed from 3698229 to 3698279 (+0%)
packages/core2-64-poky-linux/libinput/libinput-src: PKGV changed from 1.27.0 [default] to 1.27.1 [default]
packages/core2-64-poky-linux/libinput/libinput-src: PV changed from "1.27.0" to "1.27.1"
packages/core2-64-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.27.0 [default] to 1.27.1 [default]
packages/core2-64-poky-linux/libinput/libinput-staticdev: PV changed from "1.27.0" to "1.27.1"
packages/core2-64-poky-linux/libinput/libinput: PKGSIZE changed from 1358258 to 1359627 (+0%)
packages/core2-64-poky-linux/libinput/libinput: PKGV changed from 1.27.0 [default] to 1.27.1 [default]
packages/core2-64-poky-linux/libinput/libinput: PV changed from "1.27.0" to "1.27.1"

--===============5578912835729256119==--

