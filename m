Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0522AC2FC18
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:30 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.800.1686887482112483621
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RBooH3E2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010188c2544c3d-ab271b37-407d-4717-9108-d1f00ebcde0c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PHgw3ivfqx0Kp/pdc9BEU9gpwGmsi2ja4gWGUcydLEA=;
	b=RBooH3E24BST6NDns7yMXauHrQhd7TWdm+VgyIf4LjMaQQzg0mKlOm9PsFbcJJoO
	HNVeYTg07l7L0PiLquiEDNRL1QW4xn/q5WU8aiULYadwcTJ08S3E7cWcEvWxa3e8UKJ
	Sgz94nfnsoIky0+nOdZ1PkX8c+p+cCSQVTfDI6Y0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PHgw3ivfqx0Kp/pdc9BEU9gpwGmsi2ja4gWGUcydLEA=;
	b=FmaXOh0DRkM4BqQ59AkdOGlHDOg5IqUn0FI/ttFlGq6zL/zjbI6IEIK3axmu041J
	VgIU6kPvZu31acMQ/pm6fGEc/DwHrse1MMRn/N7R7NxlmwQy8SJrVDFM/2AGUFJQckp
	X2cvJ4buK/Kr9RL9ygbqBx/YultYi4zU/JdyFY5c=
Content-Type: multipart/mixed; boundary="===============4338779065619129930=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-utils: upgrading to 1.2.0 SUCCEEDED
Message-ID: <01010188c2544c3d-ab271b37-407d-4717-9108-d1f00ebcde0c-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182983

--===============4338779065619129930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wayland-utils* to *1.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wayland-utils-upgrade-1.1.0-1.2.0.patch
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
From c51876a343315aa1f11d8d97366035f7c8354fea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 21:16:56 +0000
Subject: [PATCH] wayland-utils: upgrade 1.1.0 -> 1.2.0

---
 ...ayland-info-Fix-build-without-libdrm.patch | 42 -------------------
 ...-utils_1.1.0.bb => wayland-utils_1.2.0.bb} |  6 +--
 2 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/files/0001-wayland-info-Fix-build-without-libdrm.patch
 rename meta/recipes-graphics/wayland/{wayland-utils_1.1.0.bb => wayland-utils_1.2.0.bb} (75%)

diff --git a/meta/recipes-graphics/wayland/files/0001-wayland-info-Fix-build-without-libdrm.patch b/meta/recipes-graphics/wayland/files/0001-wayland-info-Fix-build-without-libdrm.patch
deleted file mode 100644
index 86c44d4480..0000000000
--- a/meta/recipes-graphics/wayland/files/0001-wayland-info-Fix-build-without-libdrm.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From c79a3fb51718c4286b74edf0f758df9219994844 Mon Sep 17 00:00:00 2001
-From: Olivier Fourdan <ofourdan@redhat.com>
-Date: Wed, 14 Sep 2022 09:07:10 +0200
-Subject: [PATCH] wayland-info: Fix build without libdrm
-
-wayland-info can optionally use libdrm to provide a description of the
-dmabuf format modifiers.
-
-When not using libdrm however, the build fails because "dev_t" is not
-defined.
-
-The definition of "dev_t" comes from <sys/types.h> which is included
-from <libdrm.h>, which is not included without libdrm support, hence the
-build failure.
-
-Simply include <sys/types.h> unconditionally to make sure "dev_t" is
-defined regardless of libdrm support, to fix the build failure.
-
-Closes: https://gitlab.freedesktop.org/wayland/wayland-utils/-/issues/6
-Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
-Fixes: 240cb739 - "Add support for linux_dmabuf version 4"
-Reviewed-by: Simon Ser <contact@emersion.fr>
-Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/wayland/wayland-utils/-/commit/baa65ba9f62e6a05c32b9202b524158a21f24245]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- wayland-info/wayland-info.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/wayland-info/wayland-info.c b/wayland-info/wayland-info.c
-index 53cd04b..98ff205 100644
---- a/wayland-info/wayland-info.c
-+++ b/wayland-info/wayland-info.c
-@@ -34,6 +34,7 @@
- #include <ctype.h>
- #include <unistd.h>
- #include <sys/mman.h>
-+#include <sys/types.h>
- 
- #include <wayland-client.h>
- #if HAVE_HUMAN_FORMAT_MODIFIER
diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.1.0.bb b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
similarity index 75%
rename from meta/recipes-graphics/wayland/wayland-utils_1.1.0.bb
rename to meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
index dcee87e2cd..5335c59d8d 100644
--- a/meta/recipes-graphics/wayland/wayland-utils_1.1.0.bb
+++ b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
@@ -9,10 +9,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=548a66038a77415e1df51118625e832f \
                    "
 
-SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
-           file://0001-wayland-info-Fix-build-without-libdrm.patch \
-           "
-SRC_URI[sha256sum] = "9e685863025b4feade36d53bbc8e31b43e26498be743dea84c7a84912959410a"
+SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz"
+SRC_URI[sha256sum] = "d9278c22554586881802540751bcc42569262bf80cd9ac9b0fd12ff4bd09a9e4"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.39.2


--===============4338779065619129930==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-utils-upgrade-1.1.0-1.2.0.patch"

RnJvbSBjNTE4NzZhMzQzMzE1YWExZjExZDhkOTczNjYwMzVmN2M4MzU0ZmVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMjE6MTY6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
YXlsYW5kLXV0aWxzOiB1cGdyYWRlIDEuMS4wIC0+IDEuMi4wCgotLS0KIC4uLmF5bGFuZC1pbmZv
LUZpeC1idWlsZC13aXRob3V0LWxpYmRybS5wYXRjaCB8IDQyIC0tLS0tLS0tLS0tLS0tLS0tLS0K
IC4uLi11dGlsc18xLjEuMC5iYiA9PiB3YXlsYW5kLXV0aWxzXzEuMi4wLmJifSB8ICA2ICstLQog
MiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQogZGVsZXRl
IG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL2ZpbGVzLzAwMDEtd2F5
bGFuZC1pbmZvLUZpeC1idWlsZC13aXRob3V0LWxpYmRybS5wYXRjaAogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy93YXlsYW5kL3t3YXlsYW5kLXV0aWxzXzEuMS4wLmJiID0+IHdheWxhbmQt
dXRpbHNfMS4yLjAuYmJ9ICg3NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3dheWxhbmQvZmlsZXMvMDAwMS13YXlsYW5kLWluZm8tRml4LWJ1aWxkLXdpdGhvdXQtbGliZHJt
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvZmlsZXMvMDAwMS13YXlsYW5k
LWluZm8tRml4LWJ1aWxkLXdpdGhvdXQtbGliZHJtLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCA4NmM0NGQ0NDgwLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy93YXlsYW5kL2ZpbGVzLzAwMDEtd2F5bGFuZC1pbmZvLUZpeC1idWlsZC13aXRob3V0LWxp
YmRybS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQyICswLDAgQEAKLUZyb20gYzc5YTNmYjUx
NzE4YzQyODZiNzRlZGYwZjc1OGRmOTIxOTk5NDg0NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
LUZyb206IE9saXZpZXIgRm91cmRhbiA8b2ZvdXJkYW5AcmVkaGF0LmNvbT4KLURhdGU6IFdlZCwg
MTQgU2VwIDIwMjIgMDk6MDc6MTAgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gd2F5bGFuZC1pbmZv
OiBGaXggYnVpbGQgd2l0aG91dCBsaWJkcm0KLQotd2F5bGFuZC1pbmZvIGNhbiBvcHRpb25hbGx5
IHVzZSBsaWJkcm0gdG8gcHJvdmlkZSBhIGRlc2NyaXB0aW9uIG9mIHRoZQotZG1hYnVmIGZvcm1h
dCBtb2RpZmllcnMuCi0KLVdoZW4gbm90IHVzaW5nIGxpYmRybSBob3dldmVyLCB0aGUgYnVpbGQg
ZmFpbHMgYmVjYXVzZSAiZGV2X3QiIGlzIG5vdAotZGVmaW5lZC4KLQotVGhlIGRlZmluaXRpb24g
b2YgImRldl90IiBjb21lcyBmcm9tIDxzeXMvdHlwZXMuaD4gd2hpY2ggaXMgaW5jbHVkZWQKLWZy
b20gPGxpYmRybS5oPiwgd2hpY2ggaXMgbm90IGluY2x1ZGVkIHdpdGhvdXQgbGliZHJtIHN1cHBv
cnQsIGhlbmNlIHRoZQotYnVpbGQgZmFpbHVyZS4KLQotU2ltcGx5IGluY2x1ZGUgPHN5cy90eXBl
cy5oPiB1bmNvbmRpdGlvbmFsbHkgdG8gbWFrZSBzdXJlICJkZXZfdCIgaXMKLWRlZmluZWQgcmVn
YXJkbGVzcyBvZiBsaWJkcm0gc3VwcG9ydCwgdG8gZml4IHRoZSBidWlsZCBmYWlsdXJlLgotCi1D
bG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93YXlsYW5kL3dheWxhbmQtdXRp
bHMvLS9pc3N1ZXMvNgotU2lnbmVkLW9mZi1ieTogT2xpdmllciBGb3VyZGFuIDxvZm91cmRhbkBy
ZWRoYXQuY29tPgotRml4ZXM6IDI0MGNiNzM5IC0gIkFkZCBzdXBwb3J0IGZvciBsaW51eF9kbWFi
dWYgdmVyc2lvbiA0IgotUmV2aWV3ZWQtYnk6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5m
cj4KLVJldmlld2VkLWJ5OiBQZWtrYSBQYWFsYW5lbiA8cGVra2EucGFhbGFuZW5AY29sbGFib3Jh
LmNvbT4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL3dheWxhbmQvd2F5bGFuZC11dGlscy8tL2NvbW1pdC9iYWE2NWJhOWY2MmU2YTA1
YzMyYjkyMDJiNTI0MTU4YTIxZjI0MjQ1XQotU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXhAbGludXRyb25peC5kZT4KLS0tLQotIHdheWxhbmQtaW5mby93YXlsYW5kLWluZm8u
YyB8IDEgKwotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQotCi1kaWZmIC0tZ2l0IGEv
d2F5bGFuZC1pbmZvL3dheWxhbmQtaW5mby5jIGIvd2F5bGFuZC1pbmZvL3dheWxhbmQtaW5mby5j
Ci1pbmRleCA1M2NkMDRiLi45OGZmMjA1IDEwMDY0NAotLS0tIGEvd2F5bGFuZC1pbmZvL3dheWxh
bmQtaW5mby5jCi0rKysgYi93YXlsYW5kLWluZm8vd2F5bGFuZC1pbmZvLmMKLUBAIC0zNCw2ICsz
NCw3IEBACi0gI2luY2x1ZGUgPGN0eXBlLmg+Ci0gI2luY2x1ZGUgPHVuaXN0ZC5oPgotICNpbmNs
dWRlIDxzeXMvbW1hbi5oPgotKyNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KLSAKLSAjaW5jbHVkZSA8
d2F5bGFuZC1jbGllbnQuaD4KLSAjaWYgSEFWRV9IVU1BTl9GT1JNQVRfTU9ESUZJRVIKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQtdXRpbHNfMS4xLjAu
YmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLXV0aWxzXzEuMi4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggNzUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93
YXlsYW5kL3dheWxhbmQtdXRpbHNfMS4xLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy93YXlsYW5kL3dheWxhbmQtdXRpbHNfMS4yLjAuYmIKaW5kZXggZGNlZTg3ZTJjZC4uNTMz
NWM1OWQ4ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFu
ZC11dGlsc18xLjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXls
YW5kLXV0aWxzXzEuMi4wLmJiCkBAIC05LDEwICs5LDggQEAgTElDRU5TRSA9ICJNSVQiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT01NDhhNjYwMzhhNzc0MTVlMWRmNTEx
MTg2MjVlODMyZiBcCiAgICAgICAgICAgICAgICAgICAgIgogCi1TUkNfVVJJID0gImh0dHBzOi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93YXlsYW5kL3dheWxhbmQtdXRpbHMvLS9yZWxlYXNlcy8k
e1BWfS9kb3dubG9hZHMvJHtCUE59LSR7UFZ9LnRhci54eiBcCi0gICAgICAgICAgIGZpbGU6Ly8w
MDAxLXdheWxhbmQtaW5mby1GaXgtYnVpbGQtd2l0aG91dC1saWJkcm0ucGF0Y2ggXAotICAgICAg
ICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWU2ODU4NjMwMjViNGZlYWRlMzZkNTNiYmM4
ZTMxYjQzZTI2NDk4YmU3NDNkZWE4NGM3YTg0OTEyOTU5NDEwYSIKK1NSQ19VUkkgPSAiaHR0cHM6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3dheWxhbmQvd2F5bGFuZC11dGlscy8tL3JlbGVhc2Vz
LyR7UFZ9L2Rvd25sb2Fkcy8ke0JQTn0tJHtQVn0udGFyLnh6IgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImQ5Mjc4YzIyNTU0NTg2ODgxODAyNTQwNzUxYmNjNDI1NjkyNjJiZjgwY2Q5YWM5YjBmZDEy
ZmY0YmQwOWE5ZTQiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL3dheWxhbmQuZnJl
ZWRlc2t0b3Aub3JnL3JlbGVhc2VzLmh0bWwiCiAKLS0gCjIuMzkuMgoK

--===============4338779065619129930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/wayland-utils: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/wayland-utils: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/1.1.0/downloads/wayland-utils-1.1.0.tar.xz file://0001-wayland-info-Fix-build-without-libdrm.patch" to "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/1.2.0/downloads/wayland-utils-1.2.0.tar.xz"
packages/core2-32-poky-linux/wayland-utils: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/wayland-utils/wayland-utils-dbg: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/wayland-utils/wayland-utils-dbg: PKGSIZE changed from 102816 to 114092 (+11%)
packages/core2-32-poky-linux/wayland-utils/wayland-utils-dbg: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/wayland-utils/wayland-utils-dev: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/wayland-utils/wayland-utils-dev: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/wayland-utils/wayland-utils-doc: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/wayland-utils/wayland-utils-doc: PKGSIZE changed from 1190 to 1418 (+19%)
packages/core2-32-poky-linux/wayland-utils/wayland-utils-doc: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/wayland-utils/wayland-utils-locale: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/wayland-utils/wayland-utils-locale: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/wayland-utils/wayland-utils-src: FILELIST: removed "/usr/src/debug/wayland-utils/1.1.0-r0/wayland-info/wayland-info.c /usr/src/debug/wayland-utils/1.1.0-r0/wayland-info/presentation-time-protocol.c /usr/src/debug/wayland-utils/1.1.0-r0/wayland-info/presentation-time-client-protocol.h /usr/src/debug/wayland-utils/1.1.0-r0/wayland-info/xdg-output-unstable-v1-client-protocol.h /usr/src/debug/wayland-utils/1.1.0-r0/wayland-info/tablet-unstable-v2-client-protocol.h /usr/src/debug/wayland-utils/1.1.0-r0/wayland-info/tablet-unstable-v2-protocol.c /usr/src/debug/wayland-utils/1.1.0-r0/wayland-info/xdg-output-unstable-v1-protocol.c /usr/src/debug/wayland-utils/1.1.0-r0/wayland-info/linux-dmabuf-unstable-v1-client-protocol.h /usr/src/debug/wayland-utils/1.1.0-r0/wayland-info/linux-dmabuf-unstable-v1-protocol.c", added "/usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/wayland-info.c /usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/presentation-time-protocol.c /u
 sr/src/debug/wayland-utils/1.2.0-r0/wayland-info/presentation-time-client-protocol.h /usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/xdg-output-unstable-v1-client-protocol.h /usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/tablet-unstable-v2-client-protocol.h /usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/drm-lease-v1-protocol.c /usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/drm-lease-v1-client-protocol.h /usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/tablet-unstable-v2-protocol.c /usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/xdg-output-unstable-v1-protocol.c /usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/linux-dmabuf-unstable-v1-client-protocol.h /usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/linux-dmabuf-unstable-v1-protocol.c"
packages/core2-32-poky-linux/wayland-utils/wayland-utils-src: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/wayland-utils/wayland-utils-src: PKGSIZE changed from 229578 to 268038 (+17%)
packages/core2-32-poky-linux/wayland-utils/wayland-utils-src: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/wayland-utils/wayland-utils-staticdev: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/wayland-utils/wayland-utils-staticdev: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/wayland-utils/wayland-utils: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/wayland-utils/wayland-utils: PKGV changed from 1.1.0 [default] to 1.2.0 [default]

--===============4338779065619129930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/wayland-utils/wayland-utils-dbg: PKGSIZE changed from 102816 to 114092 (+11%)
packages/core2-32-poky-linux/wayland-utils/wayland-utils-doc: PKGSIZE changed from 1190 to 1418 (+19%)
packages/core2-32-poky-linux/wayland-utils/wayland-utils-src: PKGSIZE changed from 229578 to 268038 (+17%)

--===============4338779065619129930==--

