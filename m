Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987C3CA1005
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:24 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.11409.1755263221155361270
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2Gx6rekl;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=eDnJXKXz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010198add778cb-1a9a73c9-be63-40d4-aae6-c9c1791179a2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263236;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PdKAASqdPLlr36gdN3fBuLkDM/+TaWzO1fSPr9WwAZ0=;
	b=2Gx6reklrkxhMF0TSbId4UYY7Cr6JN2us53vq6YJ6/FqqrjM6t0xE3hqgI8hCOMs
	xpV91l92VHrBvvJbVUZKu1MiaZNEHce0x7NUdHLvaXUJGkExt7O652YFlufVPlR5k8L
	ocW/oGNaay/YPvROndaEP1HSAOCaraEYAeRJiqq8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263236;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PdKAASqdPLlr36gdN3fBuLkDM/+TaWzO1fSPr9WwAZ0=;
	b=eDnJXKXzBWfWi/B3q25xrn1IDDe1cHqG4VFuOYO6I7P/lP55xQe/gy69jqaleKjo
	HZKoX4codwwc1Cg7Ew2Kwq2IpPI71Axz/ZMxH7QMWFA3LxCqOv3P2kOL/BnjhyaZntH
	Xg3X996Bn//pEHUmtPxEXK4HaczsZLv8mbd5yhaQ=
Content-Type: multipart/mixed; boundary="===============0446767050719121084=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.29.0 SUCCEEDED
Message-ID: <01010198add778cb-1a9a73c9-be63-40d4-aae6-c9c1791179a2-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221944

--===============0446767050719121084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libinput* to *1.29.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.28.1-1.29.0.patch
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
From 4203784d70c57636f50f9f2d33bb1436c739eb6c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 11:39:29 +0000
Subject: [PATCH] libinput: upgrade 1.28.1 -> 1.29.0

---
 .../wayland/{libinput_1.28.1.bb => libinput_1.29.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.28.1.bb => libinput_1.29.0.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.28.1.bb b/meta/recipes-graphics/wayland/libinput_1.29.0.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.28.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.29.0.bb
index 521a7f9a09..f38532a0c2 100644
--- a/meta/recipes-graphics/wayland/libinput_1.28.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.29.0.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main;tag=${PV} \
            file://run-ptest \
            "
-SRCREV = "4f7b4ef0e4eb5d569df36be387579858eba349bb"
+SRCREV = "936cee224267a7d21c87c06203cd866c1572df20"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.47.1


--===============0446767050719121084==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.28.1-1.29.0.patch"

RnJvbSA0MjAzNzg0ZDcwYzU3NjM2ZjUwZjlmMmQzM2JiMTQzNmM3MzllYjZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMTE6Mzk6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJpbnB1dDogdXBncmFkZSAxLjI4LjEgLT4gMS4yOS4wCgotLS0KIC4uLi93YXlsYW5kL3tsaWJp
bnB1dF8xLjI4LjEuYmIgPT4gbGliaW5wdXRfMS4yOS4wLmJifSAgICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3tsaWJpbnB1dF8xLjI4LjEuYmIgPT4gbGliaW5wdXRf
MS4yOS4wLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXls
YW5kL2xpYmlucHV0XzEuMjguMS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL2xp
YmlucHV0XzEuMjkuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC9saWJpbnB1dF8xLjI4LjEuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL2xpYmlucHV0XzEuMjkuMC5iYgppbmRleCA1MjFhN2Y5
YTA5Li5mMzg1MzJhMGMyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFu
ZC9saWJpbnB1dF8xLjI4LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQv
bGliaW5wdXRfMS4yOS4wLmJiCkBAIC0xNSw3ICsxNSw3IEBAIERFUEVORFMgPSAibGliZXZkZXYg
dWRldiBtdGRldiIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9saWJp
bnB1dC9saWJpbnB1dC5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW47dGFnPSR7UFZ9IFwK
ICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICI0
ZjdiNGVmMGU0ZWI1ZDU2OWRmMzZiZTM4NzU3OTg1OGViYTM0OWJiIgorU1JDUkVWID0gIjkzNmNl
ZTIyNDI2N2E3ZDIxYzg3YzA2MjAzY2Q4NjZjMTU3MmRmMjAiCiAKIFVQU1RSRUFNX0NIRUNLX1JF
R0VYID0gImxpYmlucHV0LSg/UDxwdmVyPlxkK1wuXGQrXC4oPyE5XGQrKVxkKykiCiAKLS0gCjIu
NDcuMQoK

--===============0446767050719121084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libinput/libinput-dbg: RRECOMMENDS: added "systemd-dbg"
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 7752328 to 8748992 (+13%)
packages/core2-64-poky-linux/libinput/libinput-dev: RDEPENDS: added "systemd-dev"
packages/core2-64-poky-linux/libinput/libinput-dev: RRECOMMENDS: added "systemd-dev"
packages/core2-64-poky-linux/libinput/libinput-doc: FILELIST: added "/usr/share/man/man1/libinput-debug-tablet-pad.1"
packages/core2-64-poky-linux/libinput/libinput: RDEPENDS: added "libsystemd (['>= 257.8'])"
packages/core2-64-poky-linux/libinput/libinput: FILELIST: added "/usr/libexec/libinput/libinput-debug-tablet-pad"
packages/core2-64-poky-linux/libinput/libinput: PKGSIZE changed from 1441935 to 1649281 (+14%)

--===============0446767050719121084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libinput: PKGV changed from 1.28.1 [default] to 1.29.0 [default]
packages/core2-64-poky-linux/libinput: SRC_URI changed from "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main;tag=1.28.1 file://run-ptest" to "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main;tag=1.29.0 file://run-ptest"
packages/core2-64-poky-linux/libinput: PV changed from "1.28.1" to "1.29.0"
packages/core2-64-poky-linux/libinput/libinput-bin: PKGV changed from 1.28.1 [default] to 1.29.0 [default]
packages/core2-64-poky-linux/libinput/libinput-bin: PV changed from "1.28.1" to "1.29.0"
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGV changed from 1.28.1 [default] to 1.29.0 [default]
packages/core2-64-poky-linux/libinput/libinput-dbg: RRECOMMENDS: added "systemd-dbg"
packages/core2-64-poky-linux/libinput/libinput-dbg: FILELIST: added "/usr/libexec/libinput/.debug/libinput-debug-tablet-pad"
packages/core2-64-poky-linux/libinput/libinput-dbg: PV changed from "1.28.1" to "1.29.0"
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 7752328 to 8748992 (+13%)
packages/core2-64-poky-linux/libinput/libinput-dev: PKGV changed from 1.28.1 [default] to 1.29.0 [default]
packages/core2-64-poky-linux/libinput/libinput-dev: RDEPENDS: added "systemd-dev"
packages/core2-64-poky-linux/libinput/libinput-dev: RRECOMMENDS: added "systemd-dev"
packages/core2-64-poky-linux/libinput/libinput-dev: PV changed from "1.28.1" to "1.29.0"
packages/core2-64-poky-linux/libinput/libinput-dev: PKGSIZE changed from 228925 to 236020 (+3%)
packages/core2-64-poky-linux/libinput/libinput-doc: PKGV changed from 1.28.1 [default] to 1.29.0 [default]
packages/core2-64-poky-linux/libinput/libinput-doc: FILELIST: added "/usr/share/man/man1/libinput-debug-tablet-pad.1"
packages/core2-64-poky-linux/libinput/libinput-doc: PV changed from "1.28.1" to "1.29.0"
packages/core2-64-poky-linux/libinput/libinput-doc: PKGSIZE changed from 47709 to 49110 (+3%)
packages/core2-64-poky-linux/libinput/libinput-locale: PKGV changed from 1.28.1 [default] to 1.29.0 [default]
packages/core2-64-poky-linux/libinput/libinput-locale: PV changed from "1.28.1" to "1.29.0"
packages/core2-64-poky-linux/libinput/libinput-ptest: PKGV changed from 1.28.1 [default] to 1.29.0 [default]
packages/core2-64-poky-linux/libinput/libinput-ptest: PV changed from "1.28.1" to "1.29.0"
packages/core2-64-poky-linux/libinput/libinput-ptest: PKGSIZE changed from 1160118 to 1192710 (+3%)
packages/core2-64-poky-linux/libinput/libinput-src: PKGV changed from 1.28.1 [default] to 1.29.0 [default]
packages/core2-64-poky-linux/libinput/libinput-src: PV changed from "1.28.1" to "1.29.0"
packages/core2-64-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.28.1 [default] to 1.29.0 [default]
packages/core2-64-poky-linux/libinput/libinput-staticdev: PV changed from "1.28.1" to "1.29.0"
packages/core2-64-poky-linux/libinput/libinput: PKGV changed from 1.28.1 [default] to 1.29.0 [default]
packages/core2-64-poky-linux/libinput/libinput: RDEPENDS: added "libsystemd (['>= 257.8'])"
packages/core2-64-poky-linux/libinput/libinput: FILELIST: added "/usr/libexec/libinput/libinput-debug-tablet-pad"
packages/core2-64-poky-linux/libinput/libinput: PV changed from "1.28.1" to "1.29.0"
packages/core2-64-poky-linux/libinput/libinput: PKGSIZE changed from 1441935 to 1649281 (+14%)

--===============0446767050719121084==--

