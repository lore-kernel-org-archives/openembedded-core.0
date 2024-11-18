Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149F5D591C6
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:16:49 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.4781.1731964601435238992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ey/uA6M8;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=huYIfXkz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019341228137-110231f2-4f61-476d-8ed9-70897f69aeb1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JlnBCNlfXLZWp8PCftKDpt8TF27IjGT4W9dixyp7N84=;
	b=ey/uA6M8KPd1izSveKgyEb/POHwv8lfCY7YT8Wl0EFdkPtcB/ku0xWCF3Jp9scw7
	Jj+0sALV7FHn7rq8yy5O0Vldkv+Ne5Lm98GrkwCKCIAO4l5nHOaX8YjaF8keLsAcZJg
	omtZXhx2gIclCLxpkOKJoirMLnGkEuCWsXqZbH0U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JlnBCNlfXLZWp8PCftKDpt8TF27IjGT4W9dixyp7N84=;
	b=huYIfXkzs/LiSqGnaUTRD6S74OahdQ5wRXCT/TwwjHB85kNZBDW6UAGEni4vgfYa
	dvKtIKHZ7hpHHj1wkxKN/DYQX+ZPcwFOJiq2eNvAPAKapi7DIUeG3rpctWml2jcNRsz
	EpxzrtCiHniJ2KxyK7kDbqevqduKtM+GbpwTt88s=
Content-Type: multipart/mixed; boundary="===============1995314495470271688=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 14.0.1 FAILED
Message-ID: <0101019341228137-110231f2-4f61-476d-8ed9-70897f69aeb1-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207235

--===============1995314495470271688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *weston* to *14.0.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-weston-upgrade-13.0.3-14.0.1.patch
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
From f2ef7891b64f45b112e6d331bad06b50f1ff50f3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Nov 2024 22:35:29 +0000
Subject: [PATCH] weston: upgrade 13.0.3 -> 14.0.1

---
 ...Include-libgen.h-for-basename-signat.patch | 45 -------------------
 ...1-vnc-Allow-neatvnc-in-version-0.8.0.patch | 27 -----------
 .../{weston_13.0.3.bb => weston_14.0.1.bb}    |  4 +-
 3 files changed, 1 insertion(+), 75 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch
 rename meta/recipes-graphics/wayland/{weston_13.0.3.bb => weston_14.0.1.bb} (96%)

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
diff --git a/meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch b/meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch
deleted file mode 100644
index 4ac1c075fd..0000000000
--- a/meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 534cfa08ea0a0c2646b4aec20b16bf95f6d0aae6 Mon Sep 17 00:00:00 2001
-From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
-Date: Mon, 3 Jun 2024 13:39:27 +0200
-Subject: [PATCH] vnc: Allow neatvnc in version 0.8.0
-
-Neat VNC 0.8.0 does not introduce any changes that breaks API used
-by VNC backend, so it is safe to extend compatibility.
-
-Upstream-Status: Backport [05e5405651054c580b248c4ab2791ed8d66369e3]
-Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
----
- libweston/backend-vnc/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libweston/backend-vnc/meson.build b/libweston/backend-vnc/meson.build
-index b7b6916..39b15cf 100644
---- a/libweston/backend-vnc/meson.build
-+++ b/libweston/backend-vnc/meson.build
-@@ -3,7 +3,7 @@ if not get_option('backend-vnc')
- endif
- 
- config_h.set('BUILD_VNC_COMPOSITOR', '1')
--dep_neatvnc = dependency('neatvnc', version: ['>= 0.7.0', '< 0.8.0'], required: false, fallback: ['neatvnc', 'neatvnc_dep'])
-+dep_neatvnc = dependency('neatvnc', version: ['>= 0.7.0', '< 0.9.0'], required: false, fallback: ['neatvnc', 'neatvnc_dep'])
- if not dep_neatvnc.found()
- 	error('VNC backend requires neatvnc which was not found. Or, you can use \'-Dbackend-vnc=false\'.')
- endif
diff --git a/meta/recipes-graphics/wayland/weston_13.0.3.bb b/meta/recipes-graphics/wayland/weston_14.0.1.bb
similarity index 96%
rename from meta/recipes-graphics/wayland/weston_13.0.3.bb
rename to meta/recipes-graphics/wayland/weston_14.0.1.bb
index 471dc52bb3..3b28d4c7a7 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.3.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.1.bb
@@ -7,15 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
                     "
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
-           file://0001-libweston-tools-Include-libgen.h-for-basename-signat.patch \
-           file://0001-vnc-Allow-neatvnc-in-version-0.8.0.patch \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "27f68d96e3b97d98daadef13a202356524924fa381418fa6716b9136ef099093"
+SRC_URI[sha256sum] = "a8150505b126a59df781fe8c30c8e6f87da7013e179039eb844a5bbbcc7c79b3"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.44.1


--===============1995314495470271688==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-weston-upgrade-13.0.3-14.0.1.patch"

RnJvbSBmMmVmNzg5MWI2NGY0NWIxMTJlNmQzMzFiYWQwNmI1MGYxZmY1MGYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTm92IDIwMjQgMjI6MzU6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
ZXN0b246IHVwZ3JhZGUgMTMuMC4zIC0+IDE0LjAuMQoKLS0tCiAuLi5JbmNsdWRlLWxpYmdlbi5o
LWZvci1iYXNlbmFtZS1zaWduYXQucGF0Y2ggfCA0NSAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4x
LXZuYy1BbGxvdy1uZWF0dm5jLWluLXZlcnNpb24tMC44LjAucGF0Y2ggfCAyNyAtLS0tLS0tLS0t
LQogLi4uL3t3ZXN0b25fMTMuMC4zLmJiID0+IHdlc3Rvbl8xNC4wLjEuYmJ9ICAgIHwgIDQgKy0K
IDMgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDc1IGRlbGV0aW9ucygtKQogZGVsZXRl
IG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbi8wMDAxLWxp
Yndlc3Rvbi10b29scy1JbmNsdWRlLWxpYmdlbi5oLWZvci1iYXNlbmFtZS1zaWduYXQucGF0Y2gK
IGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b24v
MDAwMS12bmMtQWxsb3ctbmVhdHZuYy1pbi12ZXJzaW9uLTAuOC4wLnBhdGNoCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQve3dlc3Rvbl8xMy4wLjMuYmIgPT4gd2VzdG9uXzE0
LjAuMS5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFu
ZC93ZXN0b24vMDAwMS1saWJ3ZXN0b24tdG9vbHMtSW5jbHVkZS1saWJnZW4uaC1mb3ItYmFzZW5h
bWUtc2lnbmF0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uLzAw
MDEtbGlid2VzdG9uLXRvb2xzLUluY2x1ZGUtbGliZ2VuLmgtZm9yLWJhc2VuYW1lLXNpZ25hdC5w
YXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMmE4MzNlZTk3My4uMDAwMDAwMDAw
MAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b24vMDAwMS1saWJ3ZXN0
b24tdG9vbHMtSW5jbHVkZS1saWJnZW4uaC1mb3ItYmFzZW5hbWUtc2lnbmF0LnBhdGNoCisrKyAv
ZGV2L251bGwKQEAgLTEsNDUgKzAsMCBAQAotRnJvbSAxYTJhODcwMTNlYjZhZjhlNTI2N2VjYWY2
MWUxN2I2NWEzMWRjNjYyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4KLURhdGU6IFRodSwgMTQgRGVjIDIwMjMgMDk6MTM6NTQgLTA4
MDAKLVN1YmplY3Q6IFtQQVRDSF0gbGlid2VzdG9uLHRvb2xzOiBJbmNsdWRlIGxpYmdlbi5oIGZv
ciBiYXNlbmFtZSBzaWduYXR1cmUKLQotTGF0ZXN0IG11c2wgaGFzIHJlbW92ZWQgdGhlIGRlY2xh
cmF0aW9uIGZyb20gc3RyaW5nLmggWzFdIGFzIGl0IG9ubHkKLWltcGxlbWVudHMgUE9TSVggdmVy
c2lvbiBhbG9uZSBhbmQgc3RyaW5nLmggaW4gZ2xpYmMgaW1wbGVtZW50cyBHTlUKLXZlcnNpb24g
b2YgYmFzZW5hbWUuIFRoaXMgbm93IHJlc3VsdHMgaW4gY29tcGlsZSBlcnJvcnMgb24gbXVzbC4K
LQotVGhpcyBtaWdodCBiZSBhIHdhcm5pbmcgd2l0aCBvbGRlciBjb21waWxlcnMgYnV0IGl0IGlz
IGVycm9yIHdpdGgKLUNsYW5nLTE3KyBhcyBpdCB0cmVhdHMgLVdpbXBsaWNpdC1mdW5jdGlvbi1k
ZWNsYXJhdGlvbiBhcyBlcnJvcgotCi1bMV0gaHR0cHM6Ly9naXQubXVzbC1saWJjLm9yZy9jZ2l0
L211c2wvY29tbWl0Lz9pZD03MjVlMTdlZDZkZmY0ZDBjZDIyNDg3YmI2NDQ3MDg4MWU4NmE5MmU3
Ci0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvd2F5bGFuZC93ZXN0b24vLS9tZXJnZV9yZXF1ZXN0cy8xNDIwXQotU2lnbmVkLW9mZi1i
eTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLS0tLQotIGxpYndlc3Rvbi9iYWNrZW5k
LWRybS9saWJiYWNrbGlnaHQuYyB8IDEgKwotIHRvb2xzL3p1bml0Yy9zcmMvenVuaXRjX2ltcGwu
YyAgICAgICB8IDEgKwotIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCi0KLWRpZmYg
LS1naXQgYS9saWJ3ZXN0b24vYmFja2VuZC1kcm0vbGliYmFja2xpZ2h0LmMgYi9saWJ3ZXN0b24v
YmFja2VuZC1kcm0vbGliYmFja2xpZ2h0LmMKLWluZGV4IGNhN2YyZDYuLjc0NjkwZmEgMTAwNjQ0
Ci0tLS0gYS9saWJ3ZXN0b24vYmFja2VuZC1kcm0vbGliYmFja2xpZ2h0LmMKLSsrKyBiL2xpYndl
c3Rvbi9iYWNrZW5kLWRybS9saWJiYWNrbGlnaHQuYwotQEAgLTQxLDYgKzQxLDcgQEAKLSAjaW5j
bHVkZSA8ZHJtLmg+Ci0gI2luY2x1ZGUgPGZjbnRsLmg+Ci0gI2luY2x1ZGUgPG1hbGxvYy5oPgot
KyNpbmNsdWRlIDxsaWJnZW4uaD4KLSAjaW5jbHVkZSA8c3RyaW5nLmg+Ci0gI2luY2x1ZGUgPGVy
cm5vLmg+Ci0gCi1kaWZmIC0tZ2l0IGEvdG9vbHMvenVuaXRjL3NyYy96dW5pdGNfaW1wbC5jIGIv
dG9vbHMvenVuaXRjL3NyYy96dW5pdGNfaW1wbC5jCi1pbmRleCAxOGYwMzAxLi45YjQ2MGZhIDEw
MDY0NAotLS0tIGEvdG9vbHMvenVuaXRjL3NyYy96dW5pdGNfaW1wbC5jCi0rKysgYi90b29scy96
dW5pdGMvc3JjL3p1bml0Y19pbXBsLmMKLUBAIC0yNyw2ICsyNyw3IEBACi0gCi0gI2luY2x1ZGUg
PGVycm5vLmg+Ci0gI2luY2x1ZGUgPGZjbnRsLmg+Ci0rI2luY2x1ZGUgPGxpYmdlbi5oPgotICNp
bmNsdWRlIDxzdGRhcmcuaD4KLSAjaW5jbHVkZSA8c3RkYm9vbC5oPgotICNpbmNsdWRlIDxzdGRp
by5oPgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uLzAw
MDEtdm5jLUFsbG93LW5lYXR2bmMtaW4tdmVyc2lvbi0wLjguMC5wYXRjaCBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbi8wMDAxLXZuYy1BbGxvdy1uZWF0dm5jLWluLXZlcnNp
b24tMC44LjAucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDRhYzFjMDc1ZmQu
LjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uLzAw
MDEtdm5jLUFsbG93LW5lYXR2bmMtaW4tdmVyc2lvbi0wLjguMC5wYXRjaAorKysgL2Rldi9udWxs
CkBAIC0xLDI3ICswLDAgQEAKLUZyb20gNTM0Y2ZhMDhlYTBhMGMyNjQ2YjRhZWMyMGIxNmJmOTVm
NmQwYWFlNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEx1a2FzeiBDemVjaG93c2tp
IDxsdWthc3ouY3plY2hvd3NraUB0aGF1bWF0ZWMuY29tPgotRGF0ZTogTW9uLCAzIEp1biAyMDI0
IDEzOjM5OjI3ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIHZuYzogQWxsb3cgbmVhdHZuYyBpbiB2
ZXJzaW9uIDAuOC4wCi0KLU5lYXQgVk5DIDAuOC4wIGRvZXMgbm90IGludHJvZHVjZSBhbnkgY2hh
bmdlcyB0aGF0IGJyZWFrcyBBUEkgdXNlZAotYnkgVk5DIGJhY2tlbmQsIHNvIGl0IGlzIHNhZmUg
dG8gZXh0ZW5kIGNvbXBhdGliaWxpdHkuCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgWzA1
ZTU0MDU2NTEwNTRjNTgwYjI0OGM0YWIyNzkxZWQ4ZDY2MzY5ZTNdCi1TaWduZWQtb2ZmLWJ5OiBM
dWthc3ogQ3plY2hvd3NraSA8bHVrYXN6LmN6ZWNob3dza2lAdGhhdW1hdGVjLmNvbT4KLS0tLQot
IGxpYndlc3Rvbi9iYWNrZW5kLXZuYy9tZXNvbi5idWlsZCB8IDIgKy0KLSAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL2xpYndlc3Rv
bi9iYWNrZW5kLXZuYy9tZXNvbi5idWlsZCBiL2xpYndlc3Rvbi9iYWNrZW5kLXZuYy9tZXNvbi5i
dWlsZAotaW5kZXggYjdiNjkxNi4uMzliMTVjZiAxMDA2NDQKLS0tLSBhL2xpYndlc3Rvbi9iYWNr
ZW5kLXZuYy9tZXNvbi5idWlsZAotKysrIGIvbGlid2VzdG9uL2JhY2tlbmQtdm5jL21lc29uLmJ1
aWxkCi1AQCAtMyw3ICszLDcgQEAgaWYgbm90IGdldF9vcHRpb24oJ2JhY2tlbmQtdm5jJykKLSBl
bmRpZgotIAotIGNvbmZpZ19oLnNldCgnQlVJTERfVk5DX0NPTVBPU0lUT1InLCAnMScpCi0tZGVw
X25lYXR2bmMgPSBkZXBlbmRlbmN5KCduZWF0dm5jJywgdmVyc2lvbjogWyc+PSAwLjcuMCcsICc8
IDAuOC4wJ10sIHJlcXVpcmVkOiBmYWxzZSwgZmFsbGJhY2s6IFsnbmVhdHZuYycsICduZWF0dm5j
X2RlcCddKQotK2RlcF9uZWF0dm5jID0gZGVwZW5kZW5jeSgnbmVhdHZuYycsIHZlcnNpb246IFsn
Pj0gMC43LjAnLCAnPCAwLjkuMCddLCByZXF1aXJlZDogZmFsc2UsIGZhbGxiYWNrOiBbJ25lYXR2
bmMnLCAnbmVhdHZuY19kZXAnXSkKLSBpZiBub3QgZGVwX25lYXR2bmMuZm91bmQoKQotIAllcnJv
cignVk5DIGJhY2tlbmQgcmVxdWlyZXMgbmVhdHZuYyB3aGljaCB3YXMgbm90IGZvdW5kLiBPciwg
eW91IGNhbiB1c2UgXCctRGJhY2tlbmQtdm5jPWZhbHNlXCcuJykKLSBlbmRpZgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzEzLjAuMy5iYiBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbl8xNC4wLjEuYmIKc2ltaWxhcml0eSBpbmRl
eCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzEz
LjAuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzE0
LjAuMS5iYgppbmRleCA0NzFkYzUyYmIzLi4zYjI4ZDRjN2E3IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b25fMTMuMC4zLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbl8xNC4wLjEuYmIKQEAgLTcsMTUgKzcsMTMgQEAgTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9ZDc5ZWU5ZTY2YmIwZjk1ZDMzODZh
N2FjYWU3ODBiNzAgXAogICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3dheWxhbmQvd2VzdG9uLy0vcmVsZWFzZXMvJHtQVn0v
ZG93bmxvYWRzLyR7QlBOfS0ke1BWfS50YXIueHogXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1s
aWJ3ZXN0b24tdG9vbHMtSW5jbHVkZS1saWJnZW4uaC1mb3ItYmFzZW5hbWUtc2lnbmF0LnBhdGNo
IFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtdm5jLUFsbG93LW5lYXR2bmMtaW4tdmVyc2lvbi0w
LjguMC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly93ZXN0b24ucG5nIFwKICAgICAgICAgICAg
ZmlsZTovL3dlc3Rvbi5kZXNrdG9wIFwKICAgICAgICAgICAgZmlsZTovL3h3YXlsYW5kLndlc3Rv
bi1zdGFydCBcCiAgICAgICAgICAgIGZpbGU6Ly9zeXN0ZW1kLW5vdGlmeS53ZXN0b24tc3RhcnQg
XAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyN2Y2OGQ5NmUzYjk3ZDk4
ZGFhZGVmMTNhMjAyMzU2NTI0OTI0ZmEzODE0MThmYTY3MTZiOTEzNmVmMDk5MDkzIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImE4MTUwNTA1YjEyNmE1OWRmNzgxZmU4YzMwYzhlNmY4N2RhNzAxM2Ux
NzkwMzllYjg0NGE1YmJiY2M3Yzc5YjMiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93ZXN0b24vLS90YWdzIgogVVBTVFJFQU1f
Q0hFQ0tfUkVHRVggPSAicmVsZWFzZXMvKD9QPHB2ZXI+XGQrXC5cZCtcLig/ITlcZCspXGQrKSIK
LS0gCjIuNDQuMQoK

--===============1995314495470271688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (919 cached, 2 parsed). 1880 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:86e824ca065170108e10a9e3fe827583b294b921"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 416 Local 404 Mirrors 0 Missed 12 Current 745 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2727 of 3140 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_recipe_qa)
NOTE: Running task 2888 of 3140 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_write_config)
NOTE: recipe weston-14.0.1-r0: task do_recipe_qa: Started
NOTE: recipe weston-14.0.1-r0: task do_write_config: Started
NOTE: recipe weston-14.0.1-r0: task do_write_config: Succeeded
NOTE: recipe weston-14.0.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3117 of 3140 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_fetch)
NOTE: recipe weston-14.0.1-r0: task do_fetch: Started
NOTE: recipe weston-14.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 3118 of 3140 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_unpack)
NOTE: Running task 3119 of 3140 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-14.0.1-r0: task do_unpack: Started
NOTE: recipe weston-14.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe weston-14.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 3120 of 3140 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_patch)
NOTE: Running task 3121 of 3140 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_collect_spdx_deps)
NOTE: recipe weston-14.0.1-r0: task do_patch: Started
NOTE: recipe weston-14.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-14.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe weston-14.0.1-r0: task do_patch: Succeeded
NOTE: Running task 3122 of 3140 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3123 of 3140 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_populate_lic)
NOTE: recipe weston-14.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-14.0.1-r0: task do_populate_lic: Started
NOTE: recipe weston-14.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe weston-14.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe weston-14.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3124 of 3140 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_configure)
NOTE: recipe weston-14.0.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.7.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yoct
 o-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.1.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recip
 es-graphics/pango/pango_1.54.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gra
 phics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.5.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.4.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.6.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_populate_
 sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'seatd', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'cracklib', 'libnsl2', 'libtirpc', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gdk-pixbuf', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libepoxy', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'libinput', 'mtdev', 'wayland-protocols', 'wayland', 'xrandr', 'encodings', 'font-util', 'libfontenc', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxcursor', 'libxcvt', '
 libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxfont2', 'libxft', 'libxkbcommon', 'libxkbfile', 'libxrandr', 'libxrender', 'libxshmfence', 'libxxf86vm', 'pixman', 'xcb-util-cursor', 'xcb-util-image', 'xcb-util-renderutil', 'xcb-util', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'xwayland', 'kmod', 'linux-libc-headers', 'libpng', 'acl', 'attr', 'bash-completion', 'fribidi', 'gdbm', 'icu', 'libcap-ng', 'libcap', 'libcheck', 'libevdev', 'libffi', 'libpcre2', 'libseccomp', 'shared-mime-info', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native
 ', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'wayland-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dpipewire=false -Dsimple-clients=all -Ddemo-clients=true -Ddeprecated-color-management-colord=false -Drenderer-gl=true -Dbackend-headless=false -Dimage-jpeg=true -Dbackend-drm=true -Dcolor-management-lcms=false -Dbackend-pipewire=false -Dbackend-rdp=false -Dremoting=false -Dscreenshare=true -Dshell-desktop=true -Dshell-fullscreen=true -Dshell-ivi=true -Dshell-kiosk=true -Dsystemd=true -Dbackend-drm-screencast-vaapi=false -Dbackend-vnc=false -Dbackend-wayland=true -Dimage-webp=false -Dbackend-x11=true -Dxwayland=true...
| The Meson build system
| Version: 1.6.0
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.1/weston-14.0.1
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.1/build
| Build type: cross build
| 
| ../weston-14.0.1/meson.build:1:0: ERROR: Unknown options: "deprecated-color-management-colord"
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.1/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.1/temp/run.do_configure.1555893:170 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.1/temp/run.do_configure.1555893, line 170
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.1/temp/run.do_configure.1555893, line 159
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.1/temp/run.do_configure.1555893, line 148
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.1/temp/run.do_configure.1555893, line 183
NOTE: recipe weston-14.0.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3124 tasks of which 3114 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 10 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241115223415.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241115223415.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.1/temp/log.do_configure.1555893
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: weston-14.0.1-r0 do_configure: meson failed
ERROR: weston-14.0.1-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.1/temp/run.do_configure.1555893' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/weston/14.0.1/temp/log.do_configure.1555893
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_14.0.1.bb:do_configure) failed with exit code '1'

--===============1995314495470271688==--

