Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE75CEE323
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:19 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12138.1763224745079703698
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=4BFw1HwD;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=XGBRGEf/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019a88627e57-dfc60835-9313-4091-b153-bb1cfaea8ae7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MNrCDCZGKtuMezTUrMNjeUjXDy5FhPLilnfWXWNSUEo=;
	b=4BFw1HwDLAidWC0l9hI0F8WI4Qj2HNZxYnukeScP3FS6X2cBrCz0d7KUIDfiTl56
	l7X1pXFFk3eBeh6a0Pwz8+2MNjklN8uE797/08QxkMibG+21MLQ9YU5kQY3hNHgwtUa
	/t4wb0Ztr4AxVF7PUp3tPbPCpc+3RcqdU7YcmJ6A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MNrCDCZGKtuMezTUrMNjeUjXDy5FhPLilnfWXWNSUEo=;
	b=XGBRGEf/ckn2bFXLcs6vaKMZS5lGqn6YcrWEpk0wVnN2PXuFCuEDJrrPwFxhDpv8
	swXifcEmpflXPJEK2wFyKHcwxGQGXPWMR6o+yg9wopKGeXzhslWfSHpSTm06hRMBKGY
	Vkueh4CNUiy4g9U9SbFP/gBSlsUI2yKVuv65WKks=
Content-Type: multipart/mixed; boundary="===============2275620160793797753=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.29.2 SUCCEEDED
Message-ID: <0101019a88627e57-dfc60835-9313-4091-b153-bb1cfaea8ae7-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226427

--===============2275620160793797753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libinput* to *1.29.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.29.1-1.29.2.patch
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
From 92356128b43975f3d39affa505c3b467a1a220b8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 14:47:33 +0000
Subject: [PATCH] libinput: upgrade 1.29.1 -> 1.29.2

---
 .../wayland/{libinput_1.29.1.bb => libinput_1.29.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.29.1.bb => libinput_1.29.2.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.29.1.bb b/meta/recipes-graphics/wayland/libinput_1.29.2.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.29.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.29.2.bb
index 809c291e23..f771085388 100644
--- a/meta/recipes-graphics/wayland/libinput_1.29.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.29.2.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=1.29-branch;tag=${PV} \
            file://run-ptest \
            "
-SRCREV = "dc2c1ad181be88e1487468f7ca6f9d320981f133"
+SRCREV = "917783150a5bab7d55eedc5714f1b49b192426ac"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.47.1


--===============2275620160793797753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libinput: PKGV changed from 1.29.1 [default] to 1.29.2 [default]
packages/x86-64-v3-poky-linux/libinput: PV changed from "1.29.1" to "1.29.2"
packages/x86-64-v3-poky-linux/libinput: SRC_URI changed from "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=1.29-branch;tag=1.29.1 file://run-ptest" to "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=1.29-branch;tag=1.29.2 file://run-ptest"
packages/x86-64-v3-poky-linux/libinput/libinput-bin: PKGV changed from 1.29.1 [default] to 1.29.2 [default]
packages/x86-64-v3-poky-linux/libinput/libinput-bin: PV changed from "1.29.1" to "1.29.2"
packages/x86-64-v3-poky-linux/libinput/libinput-dbg: PKGV changed from 1.29.1 [default] to 1.29.2 [default]
packages/x86-64-v3-poky-linux/libinput/libinput-dbg: PV changed from "1.29.1" to "1.29.2"
packages/x86-64-v3-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 8714640 to 8726808 (+0%)
packages/x86-64-v3-poky-linux/libinput/libinput-dev: PKGV changed from 1.29.1 [default] to 1.29.2 [default]
packages/x86-64-v3-poky-linux/libinput/libinput-dev: PV changed from "1.29.1" to "1.29.2"
packages/x86-64-v3-poky-linux/libinput/libinput-dev: PKGSIZE changed from 236020 to 236567 (+0%)
packages/x86-64-v3-poky-linux/libinput/libinput-doc: PKGV changed from 1.29.1 [default] to 1.29.2 [default]
packages/x86-64-v3-poky-linux/libinput/libinput-doc: PV changed from "1.29.1" to "1.29.2"
packages/x86-64-v3-poky-linux/libinput/libinput-locale: PKGV changed from 1.29.1 [default] to 1.29.2 [default]
packages/x86-64-v3-poky-linux/libinput/libinput-locale: PV changed from "1.29.1" to "1.29.2"
packages/x86-64-v3-poky-linux/libinput/libinput-ptest: PKGV changed from 1.29.1 [default] to 1.29.2 [default]
packages/x86-64-v3-poky-linux/libinput/libinput-ptest: PV changed from "1.29.1" to "1.29.2"
packages/x86-64-v3-poky-linux/libinput/libinput-src: PKGV changed from 1.29.1 [default] to 1.29.2 [default]
packages/x86-64-v3-poky-linux/libinput/libinput-src: PV changed from "1.29.1" to "1.29.2"
packages/x86-64-v3-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.29.1 [default] to 1.29.2 [default]
packages/x86-64-v3-poky-linux/libinput/libinput-staticdev: PV changed from "1.29.1" to "1.29.2"
packages/x86-64-v3-poky-linux/libinput/libinput: PKGV changed from 1.29.1 [default] to 1.29.2 [default]
packages/x86-64-v3-poky-linux/libinput/libinput: FILELIST: added "/usr/share/libinput/30-vendor-nulea.quirks"
packages/x86-64-v3-poky-linux/libinput/libinput: PV changed from "1.29.1" to "1.29.2"
packages/x86-64-v3-poky-linux/libinput/libinput: PKGSIZE changed from 1652228 to 1654508 (+0%)
Changes to packages/x86-64-v3-poky-linux/libinput (sysroot):
  /usr/share/libinput/30-vendor-nulea.quirks was added

--===============2275620160793797753==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.29.1-1.29.2.patch"

RnJvbSA5MjM1NjEyOGI0Mzk3NWYzZDM5YWZmYTUwNWMzYjQ2N2ExYTIyMGI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTQ6NDc6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJpbnB1dDogdXBncmFkZSAxLjI5LjEgLT4gMS4yOS4yCgotLS0KIC4uLi93YXlsYW5kL3tsaWJp
bnB1dF8xLjI5LjEuYmIgPT4gbGliaW5wdXRfMS4yOS4yLmJifSAgICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3tsaWJpbnB1dF8xLjI5LjEuYmIgPT4gbGliaW5wdXRf
MS4yOS4yLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXls
YW5kL2xpYmlucHV0XzEuMjkuMS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL2xp
YmlucHV0XzEuMjkuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC9saWJpbnB1dF8xLjI5LjEuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL2xpYmlucHV0XzEuMjkuMi5iYgppbmRleCA4MDljMjkx
ZTIzLi5mNzcxMDg1Mzg4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFu
ZC9saWJpbnB1dF8xLjI5LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQv
bGliaW5wdXRfMS4yOS4yLmJiCkBAIC0xNSw3ICsxNSw3IEBAIERFUEVORFMgPSAibGliZXZkZXYg
dWRldiBtdGRldiIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9saWJp
bnB1dC9saWJpbnB1dC5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPTEuMjktYnJhbmNoO3RhZz0k
e1BWfSBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICAiCi1TUkNS
RVYgPSAiZGMyYzFhZDE4MWJlODhlMTQ4NzQ2OGY3Y2E2ZjlkMzIwOTgxZjEzMyIKK1NSQ1JFViA9
ICI5MTc3ODMxNTBhNWJhYjdkNTVlZWRjNTcxNGYxYjQ5YjE5MjQyNmFjIgogCiBVUFNUUkVBTV9D
SEVDS19HSVRUQUdSRUdFWCA9ICIoP1A8cHZlcj5cZCtcLlxkK1wuKD8hOVxkKylcZCspIgogCi0t
IAoyLjQ3LjEKCg==

--===============2275620160793797753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libinput/libinput: FILELIST: added "/usr/share/libinput/30-vendor-nulea.quirks"
Changes to packages/x86-64-v3-poky-linux/libinput (sysroot):
  /usr/share/libinput/30-vendor-nulea.quirks was added

--===============2275620160793797753==--

