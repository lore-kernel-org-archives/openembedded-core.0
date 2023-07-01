Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F117C16B13
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:07 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.10766.1688227323356980220
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ho5k0mSg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018912309ee6-6793cf5d-be49-4c0c-9b7f-df92d55f2191-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TE3JxT2suVPBL+qB2+hWx7NyWXcg7VNKzX12Efe7zQs=;
	b=Ho5k0mSgT2H5ybFPwKRvefWB69tRuTZlcT9b/lZ4ycr4IAed9KaUhns9aR3UpGBw
	1ESKWs9JfItjQYEe1YEYcnxYTrGuWs3ttYnAS4oU1WiAz9Lsbbt+Ivb3wxwwZdb8It4
	4gt9Kw8T7zyF5GhQBXbHbyNyK48QCc+gS+B7LprM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TE3JxT2suVPBL+qB2+hWx7NyWXcg7VNKzX12Efe7zQs=;
	b=KIP5jcfA+gGbbIEwJuEjbdZLOCGAnBrolHl70UytXxYrphmwwYiPGfrS2JoXP55O
	z+EN40ArlPcf0AGkodWq8A9rriJnUjnHVN7XC8bddAosYG4FeKsBB3bv+6qMRSgtGEp
	KllmghpQNtRyK5sC5s8LB5N/t90v9R2Yj7D/JvRQ=
Content-Type: multipart/mixed; boundary="===============4009041521386823287=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-utils: upgrading to 1.2.0 SUCCEEDED
Message-ID: <0101018912309ee6-6793cf5d-be49-4c0c-9b7f-df92d55f2191-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183742

--===============4009041521386823287==
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
From 1f26a077bfa441ecd1293431098752a6a01780a3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jul 2023 13:47:43 +0000
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


--===============4009041521386823287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/wayland-utils/wayland-utils-dbg: PKGSIZE changed from 102816 to 114092 (+11%)
packages/core2-32-poky-linux/wayland-utils/wayland-utils-doc: PKGSIZE changed from 1190 to 1418 (+19%)
packages/core2-32-poky-linux/wayland-utils/wayland-utils-src: PKGSIZE changed from 229578 to 268038 (+17%)

--===============4009041521386823287==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-utils-upgrade-1.1.0-1.2.0.patch"

RnJvbSAxZjI2YTA3N2JmYTQ0MWVjZDEyOTM0MzEwOTg3NTJhNmEwMTc4MGEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdWwgMjAyMyAxMzo0Nzo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdh
eWxhbmQtdXRpbHM6IHVwZ3JhZGUgMS4xLjAgLT4gMS4yLjAKCi0tLQogLi4uYXlsYW5kLWluZm8t
Rml4LWJ1aWxkLXdpdGhvdXQtbGliZHJtLnBhdGNoIHwgNDIgLS0tLS0tLS0tLS0tLS0tLS0tLQog
Li4uLXV0aWxzXzEuMS4wLmJiID0+IHdheWxhbmQtdXRpbHNfMS4yLjAuYmJ9IHwgIDYgKy0tCiAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNDYgZGVsZXRpb25zKC0pCiBkZWxldGUg
bW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvZmlsZXMvMDAwMS13YXls
YW5kLWluZm8tRml4LWJ1aWxkLXdpdGhvdXQtbGliZHJtLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3dheWxhbmQve3dheWxhbmQtdXRpbHNfMS4xLjAuYmIgPT4gd2F5bGFuZC11
dGlsc18xLjIuMC5iYn0gKDc1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
d2F5bGFuZC9maWxlcy8wMDAxLXdheWxhbmQtaW5mby1GaXgtYnVpbGQtd2l0aG91dC1saWJkcm0u
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC9maWxlcy8wMDAxLXdheWxhbmQt
aW5mby1GaXgtYnVpbGQtd2l0aG91dC1saWJkcm0ucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDg2YzQ0ZDQ0ODAuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3dheWxhbmQvZmlsZXMvMDAwMS13YXlsYW5kLWluZm8tRml4LWJ1aWxkLXdpdGhvdXQtbGli
ZHJtLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNDIgKzAsMCBAQAotRnJvbSBjNzlhM2ZiNTE3
MThjNDI4NmI3NGVkZjBmNzU4ZGY5MjE5OTk0ODQ0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQot
RnJvbTogT2xpdmllciBGb3VyZGFuIDxvZm91cmRhbkByZWRoYXQuY29tPgotRGF0ZTogV2VkLCAx
NCBTZXAgMjAyMiAwOTowNzoxMCArMDIwMAotU3ViamVjdDogW1BBVENIXSB3YXlsYW5kLWluZm86
IEZpeCBidWlsZCB3aXRob3V0IGxpYmRybQotCi13YXlsYW5kLWluZm8gY2FuIG9wdGlvbmFsbHkg
dXNlIGxpYmRybSB0byBwcm92aWRlIGEgZGVzY3JpcHRpb24gb2YgdGhlCi1kbWFidWYgZm9ybWF0
IG1vZGlmaWVycy4KLQotV2hlbiBub3QgdXNpbmcgbGliZHJtIGhvd2V2ZXIsIHRoZSBidWlsZCBm
YWlscyBiZWNhdXNlICJkZXZfdCIgaXMgbm90Ci1kZWZpbmVkLgotCi1UaGUgZGVmaW5pdGlvbiBv
ZiAiZGV2X3QiIGNvbWVzIGZyb20gPHN5cy90eXBlcy5oPiB3aGljaCBpcyBpbmNsdWRlZAotZnJv
bSA8bGliZHJtLmg+LCB3aGljaCBpcyBub3QgaW5jbHVkZWQgd2l0aG91dCBsaWJkcm0gc3VwcG9y
dCwgaGVuY2UgdGhlCi1idWlsZCBmYWlsdXJlLgotCi1TaW1wbHkgaW5jbHVkZSA8c3lzL3R5cGVz
Lmg+IHVuY29uZGl0aW9uYWxseSB0byBtYWtlIHN1cmUgImRldl90IiBpcwotZGVmaW5lZCByZWdh
cmRsZXNzIG9mIGxpYmRybSBzdXBwb3J0LCB0byBmaXggdGhlIGJ1aWxkIGZhaWx1cmUuCi0KLUNs
b3NlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3dheWxhbmQvd2F5bGFuZC11dGls
cy8tL2lzc3Vlcy82Ci1TaWduZWQtb2ZmLWJ5OiBPbGl2aWVyIEZvdXJkYW4gPG9mb3VyZGFuQHJl
ZGhhdC5jb20+Ci1GaXhlczogMjQwY2I3MzkgLSAiQWRkIHN1cHBvcnQgZm9yIGxpbnV4X2RtYWJ1
ZiB2ZXJzaW9uIDQiCi1SZXZpZXdlZC1ieTogU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZy
PgotUmV2aWV3ZWQtYnk6IFBla2thIFBhYWxhbmVuIDxwZWtrYS5wYWFsYW5lbkBjb2xsYWJvcmEu
Y29tPgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvd2F5bGFuZC93YXlsYW5kLXV0aWxzLy0vY29tbWl0L2JhYTY1YmE5ZjYyZTZhMDVj
MzJiOTIwMmI1MjQxNThhMjFmMjQyNDVdCi1TaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZp
biA8YWxleEBsaW51dHJvbml4LmRlPgotLS0tCi0gd2F5bGFuZC1pbmZvL3dheWxhbmQtaW5mby5j
IHwgMSArCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCi0KLWRpZmYgLS1naXQgYS93
YXlsYW5kLWluZm8vd2F5bGFuZC1pbmZvLmMgYi93YXlsYW5kLWluZm8vd2F5bGFuZC1pbmZvLmMK
LWluZGV4IDUzY2QwNGIuLjk4ZmYyMDUgMTAwNjQ0Ci0tLS0gYS93YXlsYW5kLWluZm8vd2F5bGFu
ZC1pbmZvLmMKLSsrKyBiL3dheWxhbmQtaW5mby93YXlsYW5kLWluZm8uYwotQEAgLTM0LDYgKzM0
LDcgQEAKLSAjaW5jbHVkZSA8Y3R5cGUuaD4KLSAjaW5jbHVkZSA8dW5pc3RkLmg+Ci0gI2luY2x1
ZGUgPHN5cy9tbWFuLmg+Ci0rI2luY2x1ZGUgPHN5cy90eXBlcy5oPgotIAotICNpbmNsdWRlIDx3
YXlsYW5kLWNsaWVudC5oPgotICNpZiBIQVZFX0hVTUFOX0ZPUk1BVF9NT0RJRklFUgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC11dGlsc18xLjEuMC5i
YiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQtdXRpbHNfMS4yLjAuYmIK
c2ltaWxhcml0eSBpbmRleCA3NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dh
eWxhbmQvd2F5bGFuZC11dGlsc18xLjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3dheWxhbmQvd2F5bGFuZC11dGlsc18xLjIuMC5iYgppbmRleCBkY2VlODdlMmNkLi41MzM1
YzU5ZDhkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5k
LXV0aWxzXzEuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxh
bmQtdXRpbHNfMS4yLjAuYmIKQEAgLTksMTAgKzksOCBAQCBMSUNFTlNFID0gIk1JVCIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTU0OGE2NjAzOGE3NzQxNWUxZGY1MTEx
ODYyNWU4MzJmIFwKICAgICAgICAgICAgICAgICAgICAiCiAKLVNSQ19VUkkgPSAiaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL3dheWxhbmQvd2F5bGFuZC11dGlscy8tL3JlbGVhc2VzLyR7
UFZ9L2Rvd25sb2Fkcy8ke0JQTn0tJHtQVn0udGFyLnh6IFwKLSAgICAgICAgICAgZmlsZTovLzAw
MDEtd2F5bGFuZC1pbmZvLUZpeC1idWlsZC13aXRob3V0LWxpYmRybS5wYXRjaCBcCi0gICAgICAg
ICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5ZTY4NTg2MzAyNWI0ZmVhZGUzNmQ1M2JiYzhl
MzFiNDNlMjY0OThiZTc0M2RlYTg0YzdhODQ5MTI5NTk0MTBhIgorU1JDX1VSSSA9ICJodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93YXlsYW5kLXV0aWxzLy0vcmVsZWFzZXMv
JHtQVn0vZG93bmxvYWRzLyR7QlBOfS0ke1BWfS50YXIueHoiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZDkyNzhjMjI1NTQ1ODY4ODE4MDI1NDA3NTFiY2M0MjU2OTI2MmJmODBjZDlhYzliMGZkMTJm
ZjRiZDA5YTllNCIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vd2F5bGFuZC5mcmVl
ZGVza3RvcC5vcmcvcmVsZWFzZXMuaHRtbCIKIAotLSAKMi4zOS4yCgo=

--===============4009041521386823287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/wayland-utils: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/wayland-utils: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/1.1.0/downloads/wayland-utils-1.1.0.tar.xz file://0001-wayland-info-Fix-build-without-libdrm.patch" to "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/1.2.0/downloads/wayland-utils-1.2.0.tar.xz"
packages/core2-32-poky-linux/wayland-utils: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/wayland-utils/wayland-utils-dbg: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/wayland-utils/wayland-utils-dbg: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/wayland-utils/wayland-utils-dbg: PKGSIZE changed from 102816 to 114092 (+11%)
packages/core2-32-poky-linux/wayland-utils/wayland-utils-dev: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/wayland-utils/wayland-utils-dev: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/wayland-utils/wayland-utils-doc: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/wayland-utils/wayland-utils-doc: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/wayland-utils/wayland-utils-doc: PKGSIZE changed from 1190 to 1418 (+19%)
packages/core2-32-poky-linux/wayland-utils/wayland-utils-locale: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/wayland-utils/wayland-utils-locale: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/wayland-utils/wayland-utils-src: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/wayland-utils/wayland-utils-src: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/wayland-utils/wayland-utils-src: PKGSIZE changed from 229578 to 268038 (+17%)
packages/core2-32-poky-linux/wayland-utils/wayland-utils-src: FILELIST: removed "/usr/src/debug/wayland-utils/1.1.0-r0/wayland-info/xdg-output-unstable-v1-client-protocol.h /usr/src/debug/wayland-utils/1.1.0-r0/wayland-info/linux-dmabuf-unstable-v1-protocol.c /usr/src/debug/wayland-utils/1.1.0-r0/wayland-info/wayland-info.c /usr/src/debug/wayland-utils/1.1.0-r0/wayland-info/tablet-unstable-v2-client-protocol.h /usr/src/debug/wayland-utils/1.1.0-r0/wayland-info/presentation-time-client-protocol.h /usr/src/debug/wayland-utils/1.1.0-r0/wayland-info/linux-dmabuf-unstable-v1-client-protocol.h /usr/src/debug/wayland-utils/1.1.0-r0/wayland-info/tablet-unstable-v2-protocol.c /usr/src/debug/wayland-utils/1.1.0-r0/wayland-info/presentation-time-protocol.c /usr/src/debug/wayland-utils/1.1.0-r0/wayland-info/xdg-output-unstable-v1-protocol.c", added "/usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/drm-lease-v1-client-protocol.h /usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/linux-dmabuf-un
 stable-v1-protocol.c /usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/xdg-output-unstable-v1-client-protocol.h /usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/wayland-info.c /usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/tablet-unstable-v2-client-protocol.h /usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/presentation-time-client-protocol.h /usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/linux-dmabuf-unstable-v1-client-protocol.h /usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/tablet-unstable-v2-protocol.c /usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/presentation-time-protocol.c /usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/xdg-output-unstable-v1-protocol.c /usr/src/debug/wayland-utils/1.2.0-r0/wayland-info/drm-lease-v1-protocol.c"
packages/core2-32-poky-linux/wayland-utils/wayland-utils-staticdev: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/wayland-utils/wayland-utils-staticdev: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/wayland-utils/wayland-utils: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/wayland-utils/wayland-utils: PV changed from "1.1.0" to "1.2.0"

--===============4009041521386823287==--

