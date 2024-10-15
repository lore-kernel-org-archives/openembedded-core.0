Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114F7D1D86B
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:15:51 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.11786.1728994546834975125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=jT0tN5ry;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=kJ5NyXrh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010192901b10e9-e9f0650f-2f7c-4f15-8c84-6f0dbc49fc73-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994546;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=P0tS6u2gbiXkfesfX3YoOWYR5sFrZCXHNcN7VB2a5F4=;
	b=jT0tN5ryVFmDnXfKIj9KJ5GhmMS/XGM4DkBWhAmq+CNXRaQk1wv9X81FjJW/VrPi
	oKnn67Y45BnN+PUXPTTTQj8tSF9pSfEmTbtLoIWLrlFpiyuSitBXsUwFByGIQoaOc7N
	ozzivLLjUeUXuXaRihmauaLQ4aPNOYcKm83horiw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994546;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=P0tS6u2gbiXkfesfX3YoOWYR5sFrZCXHNcN7VB2a5F4=;
	b=kJ5NyXrhXT1W4UEFiez1wtWLC3kOq6pOnU6vNn8by+HazhUpPFzr/0quPgeguDCZ
	ge14porOZ5YHYDmufatOG5IE1cr5AG0I8tE4MBdyvGtBCySKrhrtI3N711fSseNaCs8
	4V4joQLe/FM+/sstb6ddCFYd55fw642XUyKedSb0=
Content-Type: multipart/mixed; boundary="===============2506147190534273190=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 14.0.0 FAILED
Message-ID: <01010192901b10e9-e9f0650f-2f7c-4f15-8c84-6f0dbc49fc73-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205814

--===============2506147190534273190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *weston* to *14.0.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-weston-upgrade-13.0.3-14.0.0.patch
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
From aba8ef7e8f166a50ab187e25745fbc5b6e3bea81 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 06:34:04 +0000
Subject: [PATCH] weston: upgrade 13.0.3 -> 14.0.0

---
 ...Include-libgen.h-for-basename-signat.patch | 45 -------------------
 .../{weston_13.0.3.bb => weston_14.0.0.bb}    |  3 +-
 2 files changed, 1 insertion(+), 47 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
 rename meta/recipes-graphics/wayland/{weston_13.0.3.bb => weston_14.0.0.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
deleted file mode 100644
index 2a833ee973..0000000000
--- a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 1a2a87013eb6af8e5267ecaf61e17b65a31dc662 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 14 Dec 2023 09:13:54 -0800
-Subject: [PATCH] libweston,tools: Include libgen.h for basename signature
-
-Latest musl has removed the declaration from string.h [1] as it only
-implements POSIX version alone and string.h in glibc implements GNU
-version of basename. This now results in compile errors on musl.
-
-This might be a warning with older compilers but it is error with
-Clang-17+ as it treats -Wimplicit-function-declaration as error
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1420]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libweston/backend-drm/libbacklight.c | 1 +
- tools/zunitc/src/zunitc_impl.c       | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/libweston/backend-drm/libbacklight.c b/libweston/backend-drm/libbacklight.c
-index ca7f2d6..74690fa 100644
---- a/libweston/backend-drm/libbacklight.c
-+++ b/libweston/backend-drm/libbacklight.c
-@@ -41,6 +41,7 @@
- #include <drm.h>
- #include <fcntl.h>
- #include <malloc.h>
-+#include <libgen.h>
- #include <string.h>
- #include <errno.h>
- 
-diff --git a/tools/zunitc/src/zunitc_impl.c b/tools/zunitc/src/zunitc_impl.c
-index 18f0301..9b460fa 100644
---- a/tools/zunitc/src/zunitc_impl.c
-+++ b/tools/zunitc/src/zunitc_impl.c
-@@ -27,6 +27,7 @@
- 
- #include <errno.h>
- #include <fcntl.h>
-+#include <libgen.h>
- #include <stdarg.h>
- #include <stdbool.h>
- #include <stdio.h>
diff --git a/meta/recipes-graphics/wayland/weston_13.0.3.bb b/meta/recipes-graphics/wayland/weston_14.0.0.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/weston_13.0.3.bb
rename to meta/recipes-graphics/wayland/weston_14.0.0.bb
index e4843d38f7..cb31343107 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.3.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.0.bb
@@ -7,14 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
                     "
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
-           file://0001-libweston-tools-Include-libgen.h-for-basename-signat.patch \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "27f68d96e3b97d98daadef13a202356524924fa381418fa6716b9136ef099093"
+SRC_URI[sha256sum] = "47fd0325b0b948e9b003a38fdf4eb3a8581f3fdc740b8932b35ae8793bf4e4a5"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.44.1


--===============2506147190534273190==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-weston-upgrade-13.0.3-14.0.0.patch"

RnJvbSBhYmE4ZWY3ZThmMTY2YTUwYWIxODdlMjU3NDVmYmM1YjZlM2JlYTgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDY6MzQ6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
ZXN0b246IHVwZ3JhZGUgMTMuMC4zIC0+IDE0LjAuMAoKLS0tCiAuLi5JbmNsdWRlLWxpYmdlbi5o
LWZvci1iYXNlbmFtZS1zaWduYXQucGF0Y2ggfCA0NSAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4v
e3dlc3Rvbl8xMy4wLjMuYmIgPT4gd2VzdG9uXzE0LjAuMC5iYn0gICAgfCAgMyArLQogMiBmaWxl
cyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNDcgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAx
MDA2NDQgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uLzAwMDEtbGlid2VzdG9u
LXRvb2xzLUluY2x1ZGUtbGliZ2VuLmgtZm9yLWJhc2VuYW1lLXNpZ25hdC5wYXRjaAogcmVuYW1l
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3t3ZXN0b25fMTMuMC4zLmJiID0+IHdlc3Rv
bl8xNC4wLjAuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dh
eWxhbmQvd2VzdG9uLzAwMDEtbGlid2VzdG9uLXRvb2xzLUluY2x1ZGUtbGliZ2VuLmgtZm9yLWJh
c2VuYW1lLXNpZ25hdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rv
bi8wMDAxLWxpYndlc3Rvbi10b29scy1JbmNsdWRlLWxpYmdlbi5oLWZvci1iYXNlbmFtZS1zaWdu
YXQucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDJhODMzZWU5NzMuLjAwMDAw
MDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uLzAwMDEtbGli
d2VzdG9uLXRvb2xzLUluY2x1ZGUtbGliZ2VuLmgtZm9yLWJhc2VuYW1lLXNpZ25hdC5wYXRjaAor
KysgL2Rldi9udWxsCkBAIC0xLDQ1ICswLDAgQEAKLUZyb20gMWEyYTg3MDEzZWI2YWY4ZTUyNjdl
Y2FmNjFlMTdiNjVhMzFkYzY2MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci1EYXRlOiBUaHUsIDE0IERlYyAyMDIzIDA5OjEzOjU0
IC0wODAwCi1TdWJqZWN0OiBbUEFUQ0hdIGxpYndlc3Rvbix0b29sczogSW5jbHVkZSBsaWJnZW4u
aCBmb3IgYmFzZW5hbWUgc2lnbmF0dXJlCi0KLUxhdGVzdCBtdXNsIGhhcyByZW1vdmVkIHRoZSBk
ZWNsYXJhdGlvbiBmcm9tIHN0cmluZy5oIFsxXSBhcyBpdCBvbmx5Ci1pbXBsZW1lbnRzIFBPU0lY
IHZlcnNpb24gYWxvbmUgYW5kIHN0cmluZy5oIGluIGdsaWJjIGltcGxlbWVudHMgR05VCi12ZXJz
aW9uIG9mIGJhc2VuYW1lLiBUaGlzIG5vdyByZXN1bHRzIGluIGNvbXBpbGUgZXJyb3JzIG9uIG11
c2wuCi0KLVRoaXMgbWlnaHQgYmUgYSB3YXJuaW5nIHdpdGggb2xkZXIgY29tcGlsZXJzIGJ1dCBp
dCBpcyBlcnJvciB3aXRoCi1DbGFuZy0xNysgYXMgaXQgdHJlYXRzIC1XaW1wbGljaXQtZnVuY3Rp
b24tZGVjbGFyYXRpb24gYXMgZXJyb3IKLQotWzFdIGh0dHBzOi8vZ2l0Lm11c2wtbGliYy5vcmcv
Y2dpdC9tdXNsL2NvbW1pdC8/aWQ9NzI1ZTE3ZWQ2ZGZmNGQwY2QyMjQ4N2JiNjQ0NzA4ODFlODZh
OTJlNwotCi1VcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL3dheWxhbmQvd2VzdG9uLy0vbWVyZ2VfcmVxdWVzdHMvMTQyMF0KLVNpZ25lZC1v
ZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBsaWJ3ZXN0b24vYmFj
a2VuZC1kcm0vbGliYmFja2xpZ2h0LmMgfCAxICsKLSB0b29scy96dW5pdGMvc3JjL3p1bml0Y19p
bXBsLmMgICAgICAgfCAxICsKLSAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQotCi1k
aWZmIC0tZ2l0IGEvbGlid2VzdG9uL2JhY2tlbmQtZHJtL2xpYmJhY2tsaWdodC5jIGIvbGlid2Vz
dG9uL2JhY2tlbmQtZHJtL2xpYmJhY2tsaWdodC5jCi1pbmRleCBjYTdmMmQ2Li43NDY5MGZhIDEw
MDY0NAotLS0tIGEvbGlid2VzdG9uL2JhY2tlbmQtZHJtL2xpYmJhY2tsaWdodC5jCi0rKysgYi9s
aWJ3ZXN0b24vYmFja2VuZC1kcm0vbGliYmFja2xpZ2h0LmMKLUBAIC00MSw2ICs0MSw3IEBACi0g
I2luY2x1ZGUgPGRybS5oPgotICNpbmNsdWRlIDxmY250bC5oPgotICNpbmNsdWRlIDxtYWxsb2Mu
aD4KLSsjaW5jbHVkZSA8bGliZ2VuLmg+Ci0gI2luY2x1ZGUgPHN0cmluZy5oPgotICNpbmNsdWRl
IDxlcnJuby5oPgotIAotZGlmZiAtLWdpdCBhL3Rvb2xzL3p1bml0Yy9zcmMvenVuaXRjX2ltcGwu
YyBiL3Rvb2xzL3p1bml0Yy9zcmMvenVuaXRjX2ltcGwuYwotaW5kZXggMThmMDMwMS4uOWI0NjBm
YSAxMDA2NDQKLS0tLSBhL3Rvb2xzL3p1bml0Yy9zcmMvenVuaXRjX2ltcGwuYwotKysrIGIvdG9v
bHMvenVuaXRjL3NyYy96dW5pdGNfaW1wbC5jCi1AQCAtMjcsNiArMjcsNyBAQAotIAotICNpbmNs
dWRlIDxlcnJuby5oPgotICNpbmNsdWRlIDxmY250bC5oPgotKyNpbmNsdWRlIDxsaWJnZW4uaD4K
LSAjaW5jbHVkZSA8c3RkYXJnLmg+Ci0gI2luY2x1ZGUgPHN0ZGJvb2wuaD4KLSAjaW5jbHVkZSA8
c3RkaW8uaD4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rv
bl8xMy4wLjMuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b25fMTQuMC4w
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy93YXlsYW5kL3dlc3Rvbl8xMy4wLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy93YXlsYW5kL3dlc3Rvbl8xNC4wLjAuYmIKaW5kZXggZTQ4NDNkMzhmNy4uY2IzMTM0MzEwNyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzEzLjAuMy5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b25fMTQuMC4wLmJiCkBA
IC03LDE0ICs3LDEzIEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWQ3
OWVlOWU2NmJiMGY5NWQzMzg2YTdhY2FlNzgwYjcwIFwKICAgICAgICAgICAgICAgICAgICAgIgog
CiBTUkNfVVJJID0gImh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93YXlsYW5kL3dlc3Rv
bi8tL3JlbGVhc2VzLyR7UFZ9L2Rvd25sb2Fkcy8ke0JQTn0tJHtQVn0udGFyLnh6IFwKLSAgICAg
ICAgICAgZmlsZTovLzAwMDEtbGlid2VzdG9uLXRvb2xzLUluY2x1ZGUtbGliZ2VuLmgtZm9yLWJh
c2VuYW1lLXNpZ25hdC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly93ZXN0b24ucG5nIFwKICAg
ICAgICAgICAgZmlsZTovL3dlc3Rvbi5kZXNrdG9wIFwKICAgICAgICAgICAgZmlsZTovL3h3YXls
YW5kLndlc3Rvbi1zdGFydCBcCiAgICAgICAgICAgIGZpbGU6Ly9zeXN0ZW1kLW5vdGlmeS53ZXN0
b24tc3RhcnQgXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyN2Y2OGQ5
NmUzYjk3ZDk4ZGFhZGVmMTNhMjAyMzU2NTI0OTI0ZmEzODE0MThmYTY3MTZiOTEzNmVmMDk5MDkz
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ3ZmQwMzI1YjBiOTQ4ZTliMDAzYTM4ZmRmNGViM2E4
NTgxZjNmZGM3NDBiODkzMmIzNWFlODc5M2JmNGU0YTUiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9
ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93ZXN0b24vLS90YWdzIgog
VVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVsZWFzZXMvKD9QPHB2ZXI+XGQrXC5cZCtcLig/ITlc
ZCspXGQrKSIKLS0gCjIuNDQuMQoK

--===============2506147190534273190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (917 cached, 2 parsed). 1875 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:deed84b23ae3077ea87780645277f04f1e133ac6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 407 Local 396 Mirrors 0 Missed 11 Current 749 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 877 of 1156 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe weston-14.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe weston-14.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2728 of 3135 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.0.bb:do_fetch)
NOTE: Running task 2891 of 3135 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.0.bb:do_write_config)
NOTE: recipe weston-14.0.0-r0: task do_fetch: Started
NOTE: recipe weston-14.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 3114 of 3135 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.0.bb:do_unpack)
NOTE: Running task 3115 of 3135 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-14.0.0-r0: task do_write_config: Started
NOTE: recipe weston-14.0.0-r0: task do_write_config: Succeeded
NOTE: recipe weston-14.0.0-r0: task do_unpack: Started
NOTE: recipe weston-14.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe weston-14.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 3116 of 3135 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.0.bb:do_patch)
NOTE: Running task 3117 of 3135 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.0.bb:do_collect_spdx_deps)
NOTE: recipe weston-14.0.0-r0: task do_patch: Started
NOTE: recipe weston-14.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-14.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe weston-14.0.0-r0: task do_patch: Succeeded
NOTE: Running task 3118 of 3135 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3119 of 3135 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.0.bb:do_populate_lic)
NOTE: recipe weston-14.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-14.0.0-r0: task do_populate_lic: Started
NOTE: recipe weston-14.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe weston-14.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe weston-14.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.0.bb:do_populate_lic unihash changed to d593a8fece2f6ace52312e8d5dac841282c334168744bd161f27ebae142fbec9
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.0.bb:do_deploy_source_date_epoch unihash changed to 66ef35b9ba2bdc16f26420ccce77ddb27a4bc72a576d4b3f25d8f7a6a27d321b
NOTE: Setscene tasks completed
NOTE: Running task 3120 of 3135 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.0.bb:do_configure)
NOTE: recipe weston-14.0.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yoct
 o-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recip
 es-graphics/pango/pango_1.54.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gra
 phics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.5.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.5.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_populate_
 sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'seatd', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'cracklib', 'libnsl2', 'libtirpc', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gdk-pixbuf', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libepoxy', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'libinput', 'mtdev', 'wayland-protocols', 'wayland', 'xrandr', 'encodings', 'font-util', 'libfontenc', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxcursor', 'libxcvt', '
 libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxfont2', 'libxft', 'libxkbcommon', 'libxkbfile', 'libxrandr', 'libxrender', 'libxshmfence', 'libxxf86vm', 'pixman', 'xcb-util-cursor', 'xcb-util-image', 'xcb-util-renderutil', 'xcb-util', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'xwayland', 'kmod', 'linux-libc-headers', 'libpng', 'acl', 'attr', 'bash-completion', 'fribidi', 'gdbm', 'icu', 'libcap-ng', 'libcap', 'libcheck', 'libevdev', 'libffi', 'libpcre2', 'libseccomp', 'shared-mime-info', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native
 ', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'wayland-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dpipewire=false -Dsimple-clients=all -Ddemo-clients=true -Ddeprecated-color-management-colord=false -Drenderer-gl=true -Dbackend-headless=false -Dimage-jpeg=true -Dbackend-drm=true -Dcolor-management-lcms=false -Dbackend-pipewire=false -Dbackend-rdp=false -Dremoting=false -Dscreenshare=true -Dshell-desktop=true -Dshell-fullscreen=true -Dshell-ivi=true -Dshell-kiosk=true -Dsystemd=true -Dbackend-drm-screencast-vaapi=false -Dbackend-vnc=false -Dbackend-wayland=true -Dimage-webp=false -Dbackend-x11=true -Dxwayland=true...
| The Meson build system
| Version: 1.5.2
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.0/weston-14.0.0
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.0/build
| Build type: cross build
| 
| ../weston-14.0.0/meson.build:1:0: ERROR: Unknown options: "deprecated-color-management-colord"
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.0/temp/run.do_configure.2522127:170 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.0/temp/run.do_configure.2522127, line 170
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.0/temp/run.do_configure.2522127, line 159
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.0/temp/run.do_configure.2522127, line 148
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.0/temp/run.do_configure.2522127, line 183
NOTE: recipe weston-14.0.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3120 tasks of which 3111 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015063349.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015063349.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.0/temp/log.do_configure.2522127
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: weston-14.0.0-r0 do_configure: meson failed
ERROR: weston-14.0.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.0/temp/run.do_configure.2522127' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.0/temp/log.do_configure.2522127
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.0.bb:do_configure) failed with exit code '1'

--===============2506147190534273190==--

