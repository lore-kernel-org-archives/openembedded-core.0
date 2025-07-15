Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AE3C83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:38 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.12476.1752594929337931602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dE760stI;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hZqCx+eo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101980ecc534c-6c093234-7395-4f5b-9830-170e4093491e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594928;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BZP0AautIygkzEU9IiPye5rNFM+jT628DYygtvGvl4g=;
	b=dE760stIqVbCTJ0PaUgisqmyzWkmmzDCXBcEyDXYv95VF2RUY42z84KydZmRKrfM
	5qBCnkkvgVBojczpZyBUZKEetRVZqUAj6XIwUIVUj8gpE+OyU9sWiHgqUMkvFb1srdJ
	KVpcl5MjycDaXo9lAtdqVhZS8peB8AbuMPa6+Slk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594928;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BZP0AautIygkzEU9IiPye5rNFM+jT628DYygtvGvl4g=;
	b=hZqCx+eoxBZ0KyhoEgXgBEisAH7R15zV4sAqlLKdo1f1XcOutZX9XsQPWvvPxSlV
	VFlOYMKyghvQuWHnqRBp236WQ5xwz7lRK5d20q3OYbWkTU8LrQg2hA/Gy55hKEV5Byc
	J2mmlIhZPWxEem5A0ySI8zRuZtc0LMcQVhm9ZOZI=
Content-Type: multipart/mixed; boundary="===============8677086414911892008=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Fabio Estevam <festevam@denx.de>, Fabio Estevam <festevam@denx.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] u-boot,u-boot-tools: upgrading to 2025.07,2025.07 SUCCEEDED
Message-ID: <010101980ecc534c-6c093234-7395-4f5b-9830-170e4093491e-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220309

--===============8677086414911892008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *u-boot,u-boot-tools* to *2025.07,2025.07* has Succeeded.

Next steps:
    - apply the patch: git am 0001-u-boot-u-boot-tools-upgrade-2025.04-2025.07-2025.04-.patch
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
From ac6ecc959ad8d5581b74904597c2028c9bd50413 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 05:45:41 +0000
Subject: [PATCH] u-boot,u-boot-tools: upgrade 2025.04 -> 2025.07,2025.04 ->
 2025.07

---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2025.04.bb => u-boot-tools_2025.07.bb} | 1 +
 .../recipes-bsp/u-boot/{u-boot_2025.04.bb => u-boot_2025.07.bb} | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2025.04.bb => u-boot-tools_2025.07.bb} (98%)
 rename meta/recipes-bsp/u-boot/{u-boot_2025.04.bb => u-boot_2025.07.bb} (99%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 8600d4bab6..2734b318d7 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "34820924edbc4ec7803eb89d9852f4b870fa760a"
+SRCREV = "e37de002fac3895e8d0b60ae2015e17bb33e2b5b"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2025.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2025.07.bb
similarity index 98%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2025.04.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2025.07.bb
index 7eaf721ca8..ef386f76e6 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2025.04.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2025.07.bb
@@ -1,2 +1,3 @@
 require u-boot-common.inc
 require u-boot-tools.inc
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2025.04.bb b/meta/recipes-bsp/u-boot/u-boot_2025.07.bb
similarity index 99%
rename from meta/recipes-bsp/u-boot/u-boot_2025.04.bb
rename to meta/recipes-bsp/u-boot/u-boot_2025.07.bb
index 89e964f627..e6bb6c97a4 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2025.04.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2025.07.bb
@@ -6,3 +6,4 @@ DEPENDS += "bc-native dtc-native gnutls-native python3-pyelftools-native"
 # workarounds for aarch64 kvm qemu boot regressions
 SRC_URI:append:qemuarm64 = " file://disable-CONFIG_BLOBLIST.cfg file://disable_CONFIG_USB.cfg"
 SRC_URI:append:genericarm64 = " file://disable-CONFIG_BLOBLIST.cfg file://disable_CONFIG_USB.cfg"
+
-- 
2.47.1


--===============8677086414911892008==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-u-boot-u-boot-tools-upgrade-2025.04-2025.07-2025.04-.patch"

RnJvbSBhYzZlY2M5NTlhZDhkNTU4MWI3NDkwNDU5N2MyMDI4YzliZDUwNDEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMDU6NDU6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
LWJvb3QsdS1ib290LXRvb2xzOiB1cGdyYWRlIDIwMjUuMDQgLT4gMjAyNS4wNywyMDI1LjA0IC0+
CiAyMDI1LjA3CgotLS0KIG1ldGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdC1jb21tb24uaW5j
ICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi91LWJvb3Qve3UtYm9vdC10b29sc18y
MDI1LjA0LmJiID0+IHUtYm9vdC10b29sc18yMDI1LjA3LmJifSB8IDEgKwogLi4uL3JlY2lwZXMt
YnNwL3UtYm9vdC97dS1ib290XzIwMjUuMDQuYmIgPT4gdS1ib290XzIwMjUuMDcuYmJ9IHwgMSAr
CiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1ic3AvdS1ib290L3t1LWJvb3QtdG9vbHNfMjAyNS4wNC5iYiA9PiB1LWJv
b3QtdG9vbHNfMjAyNS4wNy5iYn0gKDk4JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtYnNwL3UtYm9v
dC97dS1ib290XzIwMjUuMDQuYmIgPT4gdS1ib290XzIwMjUuMDcuYmJ9ICg5OSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LWNvbW1vbi5pbmMgYi9tZXRhL3Jl
Y2lwZXMtYnNwL3UtYm9vdC91LWJvb3QtY29tbW9uLmluYwppbmRleCA4NjAwZDRiYWI2Li4yNzM0
YjMxOGQ3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3QtY29tbW9u
LmluYworKysgYi9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3QtY29tbW9uLmluYwpAQCAt
MTIsNyArMTIsNyBAQCBQRSA9ICIxIgogCiAjIFdlIHVzZSB0aGUgcmV2aXNpb24gaW4gb3JkZXIg
dG8gYXZvaWQgaGF2aW5nIHRvIGZldGNoIGl0IGZyb20gdGhlCiAjIHJlcG8gZHVyaW5nIHBhcnNl
Ci1TUkNSRVYgPSAiMzQ4MjA5MjRlZGJjNGVjNzgwM2ViODlkOTg1MmY0Yjg3MGZhNzYwYSIKK1NS
Q1JFViA9ICJlMzdkZTAwMmZhYzM4OTVlOGQwYjYwYWUyMDE1ZTE3YmIzM2UyYjViIgogCiBTUkNf
VVJJID0gImdpdDovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC91LWJvb3QuZ2l0O3Byb3RvY29sPWh0
dHBzO2JyYW5jaD1tYXN0ZXI7dGFnPXYke1BWfSIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWJzcC91LWJvb3QvdS1ib290LXRvb2xzXzIwMjUuMDQuYmIgYi9tZXRhL3JlY2lwZXMtYnNwL3Ut
Ym9vdC91LWJvb3QtdG9vbHNfMjAyNS4wNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3QtdG9vbHNfMjAyNS4wNC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LXRvb2xzXzIwMjUuMDcuYmIKaW5k
ZXggN2VhZjcyMWNhOC4uZWYzODZmNzZlNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWJzcC91
LWJvb3QvdS1ib290LXRvb2xzXzIwMjUuMDQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWJzcC91LWJv
b3QvdS1ib290LXRvb2xzXzIwMjUuMDcuYmIKQEAgLTEsMiArMSwzIEBACiByZXF1aXJlIHUtYm9v
dC1jb21tb24uaW5jCiByZXF1aXJlIHUtYm9vdC10b29scy5pbmMKKwpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290XzIwMjUuMDQuYmIgYi9tZXRhL3JlY2lwZXMtYnNw
L3UtYm9vdC91LWJvb3RfMjAyNS4wNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk5JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3RfMjAyNS4wNC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290XzIwMjUuMDcuYmIKaW5kZXggODllOTY0ZjYyNy4u
ZTZiYjZjOTdhNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290XzIw
MjUuMDQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290XzIwMjUuMDcuYmIK
QEAgLTYsMyArNiw0IEBAIERFUEVORFMgKz0gImJjLW5hdGl2ZSBkdGMtbmF0aXZlIGdudXRscy1u
YXRpdmUgcHl0aG9uMy1weWVsZnRvb2xzLW5hdGl2ZSIKICMgd29ya2Fyb3VuZHMgZm9yIGFhcmNo
NjQga3ZtIHFlbXUgYm9vdCByZWdyZXNzaW9ucwogU1JDX1VSSTphcHBlbmQ6cWVtdWFybTY0ID0g
IiBmaWxlOi8vZGlzYWJsZS1DT05GSUdfQkxPQkxJU1QuY2ZnIGZpbGU6Ly9kaXNhYmxlX0NPTkZJ
R19VU0IuY2ZnIgogU1JDX1VSSTphcHBlbmQ6Z2VuZXJpY2FybTY0ID0gIiBmaWxlOi8vZGlzYWJs
ZS1DT05GSUdfQkxPQkxJU1QuY2ZnIGZpbGU6Ly9kaXNhYmxlX0NPTkZJR19VU0IuY2ZnIgorCi0t
IAoyLjQ3LjEKCg==

--===============8677086414911892008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/u-boot-tools: PV changed from "2025.04" to "2025.07"
packages/core2-64-poky-linux/u-boot-tools: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/core2-64-poky-linux/u-boot-tools: SRC_URI changed from "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v2025.04" to "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v2025.07"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-dbg: PV changed from "2025.04" to "2025.07"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-dbg: PKGSIZE changed from 4226384 to 4260328 (+1%)
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-dbg: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-dev: PV changed from "2025.04" to "2025.07"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-dev: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-doc: PV changed from "2025.04" to "2025.07"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-doc: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-locale: PV changed from "2025.04" to "2025.07"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-locale: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-mkeficapsule: PV changed from "2025.04" to "2025.07"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-mkeficapsule: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-mkenvimage: PV changed from "2025.04" to "2025.07"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-mkenvimage: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-mkimage: PV changed from "2025.04" to "2025.07"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-mkimage: PKGSIZE changed from 1047064 to 1059928 (+1%)
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-mkimage: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-src: PV changed from "2025.04" to "2025.07"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-src: PKGSIZE changed from 1473426 to 1483003 (+1%)
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-src: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-staticdev: PV changed from "2025.04" to "2025.07"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-staticdev: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools: PV changed from "2025.04" to "2025.07"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/qemux86_64-poky-linux/u-boot: PV changed from "2025.04" to "2025.07"
packages/qemux86_64-poky-linux/u-boot: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/qemux86_64-poky-linux/u-boot: SRC_URI changed from "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v2025.04" to "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v2025.07"
Changes to packages/qemux86_64-poky-linux/u-boot (sysroot):
  /boot/u-boot.bin changed symlink target from u-boot-qemux86-64-2025.04-r0.bin to u-boot-qemux86-64-2025.07-r0.bin
  /boot/u-boot-qemux86-64-2025.04-r0.bin moved to /boot/u-boot-qemux86-64-2025.07-r0.bin
packages/qemux86_64-poky-linux/u-boot/u-boot-dbg: PV changed from "2025.04" to "2025.07"
packages/qemux86_64-poky-linux/u-boot/u-boot-dbg: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/qemux86_64-poky-linux/u-boot/u-boot-dev: PV changed from "2025.04" to "2025.07"
packages/qemux86_64-poky-linux/u-boot/u-boot-dev: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/qemux86_64-poky-linux/u-boot/u-boot-doc: PV changed from "2025.04" to "2025.07"
packages/qemux86_64-poky-linux/u-boot/u-boot-doc: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/qemux86_64-poky-linux/u-boot/u-boot-env: PV changed from "2025.04" to "2025.07"
packages/qemux86_64-poky-linux/u-boot/u-boot-env: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/qemux86_64-poky-linux/u-boot/u-boot-env: FILELIST: removed "/etc/u-boot-initial-env-qemux86-64-2025.04-r0", added "/etc/u-boot-initial-env-qemux86-64-2025.07-r0"
packages/qemux86_64-poky-linux/u-boot/u-boot-extlinux: PV changed from "2025.04" to "2025.07"
packages/qemux86_64-poky-linux/u-boot/u-boot-extlinux: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/qemux86_64-poky-linux/u-boot/u-boot-locale: PV changed from "2025.04" to "2025.07"
packages/qemux86_64-poky-linux/u-boot/u-boot-locale: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/qemux86_64-poky-linux/u-boot/u-boot-src: PV changed from "2025.04" to "2025.07"
packages/qemux86_64-poky-linux/u-boot/u-boot-src: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/qemux86_64-poky-linux/u-boot/u-boot-staticdev: PV changed from "2025.04" to "2025.07"
packages/qemux86_64-poky-linux/u-boot/u-boot-staticdev: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/qemux86_64-poky-linux/u-boot/u-boot: PV changed from "2025.04" to "2025.07"
packages/qemux86_64-poky-linux/u-boot/u-boot: PKGSIZE changed from 984122 to 1279154 (+30%)
packages/qemux86_64-poky-linux/u-boot/u-boot: PKGV changed from 2025.04 [default] to 2025.07 [default]
packages/qemux86_64-poky-linux/u-boot/u-boot: FILELIST: removed "/boot/u-boot-qemux86-64-2025.04-r0.bin", added "/boot/u-boot-qemux86-64-2025.07-r0.bin"

--===============8677086414911892008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/qemux86_64-poky-linux/u-boot (sysroot):
  /boot/u-boot.bin changed symlink target from u-boot-qemux86-64-2025.04-r0.bin to u-boot-qemux86-64-2025.07-r0.bin
  /boot/u-boot-qemux86-64-2025.04-r0.bin moved to /boot/u-boot-qemux86-64-2025.07-r0.bin
packages/qemux86_64-poky-linux/u-boot/u-boot-env: FILELIST: removed "/etc/u-boot-initial-env-qemux86-64-2025.04-r0", added "/etc/u-boot-initial-env-qemux86-64-2025.07-r0"
packages/qemux86_64-poky-linux/u-boot/u-boot: FILELIST: removed "/boot/u-boot-qemux86-64-2025.04-r0.bin", added "/boot/u-boot-qemux86-64-2025.07-r0.bin"
packages/qemux86_64-poky-linux/u-boot/u-boot: PKGSIZE changed from 984122 to 1279154 (+30%)

--===============8677086414911892008==--

