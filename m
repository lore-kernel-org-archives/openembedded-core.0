Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F703C3271C
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:42 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.42230.1717263218016036248
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=P3qDvxxn;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FUuRVlPE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018fd4dd3981-3cffe92d-f59c-49d1-96e0-dd73ff9a66c7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sI5R8uPboAFF0gslUugTgJlAqndJ2AVSKc3Irf71t+U=;
	b=P3qDvxxnAUr6seRDJuDZErnhYWtRnXLpQAkG6wK2E7WyQxsw4BFa5mWj4zSolJvi
	BZo4eeyv6wjvJhy+GFKz4Th82i+8M53SFUrY5HHsG0mGDQSXa1etw0EpIPzbW086EXH
	6cVaAySFd5/6SYr9XpyI4RSMmYeAkjawn+S3Qs8E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sI5R8uPboAFF0gslUugTgJlAqndJ2AVSKc3Irf71t+U=;
	b=FUuRVlPEKIi2soQtFQEHz5EXjcb3usj/7DWYnSJGlQqgoZgxe3VyrrwzgmJmmEdD
	Qf9DJByecSctQAR34eps0cuchCVYFl3s9Uim0OxrM1n4EYq7+s1vG4kIiBh4tBrqlUO
	ip1xI0/jbFzJzJpAXXW6VZK7J+JgStapHJqx0HPk=
Content-Type: multipart/mixed; boundary="===============4604017524689998698=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 13.0.1 SUCCEEDED
Message-ID: <0101018fd4dd3981-3cffe92d-f59c-49d1-96e0-dd73ff9a66c7-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200171

--===============4604017524689998698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *weston* to *13.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-weston-upgrade-13.0.0-13.0.1.patch
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
From af204cc105ea3b5c9480dfcfb233c9d197306b1a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 14:13:10 +0000
Subject: [PATCH] weston: upgrade 13.0.0 -> 13.0.1

---
 ...tools-Include-libgen.h-for-basename-signat.patch | 13 +++++--------
 .../wayland/{weston_13.0.0.bb => weston_13.0.1.bb}  |  2 +-
 2 files changed, 6 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_13.0.0.bb => weston_13.0.1.bb} (98%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
index 1d281fa832..fbec9f9d4e 100644
--- a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
@@ -1,4 +1,4 @@
-From 2b53236ac637dfa7fb0f438f7391a73f6ef92a06 Mon Sep 17 00:00:00 2001
+From e050830898ea37d30ef1c5339cb1665bdb92dcdc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 14 Dec 2023 09:13:54 -0800
 Subject: [PATCH] libweston,tools: Include libgen.h for basename signature
@@ -20,7 +20,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+)
 
 diff --git a/libweston/backend-drm/libbacklight.c b/libweston/backend-drm/libbacklight.c
-index ca7f2d68..74690fa7 100644
+index ca7f2d6..74690fa 100644
 --- a/libweston/backend-drm/libbacklight.c
 +++ b/libweston/backend-drm/libbacklight.c
 @@ -41,6 +41,7 @@
@@ -30,19 +30,16 @@ index ca7f2d68..74690fa7 100644
 +#include <libgen.h>
  #include <string.h>
  #include <errno.h>
-
+ 
 diff --git a/tools/zunitc/src/zunitc_impl.c b/tools/zunitc/src/zunitc_impl.c
-index 18f03015..9b460fa0 100644
+index 18f0301..9b460fa 100644
 --- a/tools/zunitc/src/zunitc_impl.c
 +++ b/tools/zunitc/src/zunitc_impl.c
 @@ -27,6 +27,7 @@
-
+ 
  #include <errno.h>
  #include <fcntl.h>
 +#include <libgen.h>
  #include <stdarg.h>
  #include <stdbool.h>
  #include <stdio.h>
---
-2.43.0
-
diff --git a/meta/recipes-graphics/wayland/weston_13.0.0.bb b/meta/recipes-graphics/wayland/weston_13.0.1.bb
similarity index 98%
rename from meta/recipes-graphics/wayland/weston_13.0.0.bb
rename to meta/recipes-graphics/wayland/weston_13.0.1.bb
index cb0024c5ca..eae13e1c21 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "52ff1d4aa2394a2e416c85a338b627ce97fa71d43eb762fd4aaf145d36fc795a"
+SRC_URI[sha256sum] = "ea1566ab4f5ffce7e9fd4f7a1fca5b30caae4d50023bf459213994094e02b29a"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.44.0


--===============4604017524689998698==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-weston-upgrade-13.0.0-13.0.1.patch"

RnJvbSBhZjIwNGNjMTA1ZWEzYjVjOTQ4MGRmY2ZiMjMzYzlkMTk3MzA2YjFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAxNDoxMzoxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdl
c3RvbjogdXBncmFkZSAxMy4wLjAgLT4gMTMuMC4xCgotLS0KIC4uLnRvb2xzLUluY2x1ZGUtbGli
Z2VuLmgtZm9yLWJhc2VuYW1lLXNpZ25hdC5wYXRjaCB8IDEzICsrKysrLS0tLS0tLS0KIC4uLi93
YXlsYW5kL3t3ZXN0b25fMTMuMC4wLmJiID0+IHdlc3Rvbl8xMy4wLjEuYmJ9ICB8ICAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC97d2VzdG9uXzEzLjAuMC5iYiA9PiB3ZXN0b25f
MTMuMC4xLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXls
YW5kL3dlc3Rvbi8wMDAxLWxpYndlc3Rvbi10b29scy1JbmNsdWRlLWxpYmdlbi5oLWZvci1iYXNl
bmFtZS1zaWduYXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b24v
MDAwMS1saWJ3ZXN0b24tdG9vbHMtSW5jbHVkZS1saWJnZW4uaC1mb3ItYmFzZW5hbWUtc2lnbmF0
LnBhdGNoCmluZGV4IDFkMjgxZmE4MzIuLmZiZWM5ZjlkNGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbi8wMDAxLWxpYndlc3Rvbi10b29scy1JbmNsdWRl
LWxpYmdlbi5oLWZvci1iYXNlbmFtZS1zaWduYXQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3dheWxhbmQvd2VzdG9uLzAwMDEtbGlid2VzdG9uLXRvb2xzLUluY2x1ZGUtbGliZ2Vu
LmgtZm9yLWJhc2VuYW1lLXNpZ25hdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMmI1MzIz
NmFjNjM3ZGZhN2ZiMGY0MzhmNzM5MWE3M2Y2ZWY5MmEwNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZTA1MDgzMDg5OGVhMzdkMzBlZjFjNTMzOWNiMTY2NWJkYjkyZGNkYyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBE
YXRlOiBUaHUsIDE0IERlYyAyMDIzIDA5OjEzOjU0IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxp
Yndlc3Rvbix0b29sczogSW5jbHVkZSBsaWJnZW4uaCBmb3IgYmFzZW5hbWUgc2lnbmF0dXJlCkBA
IC0yMCw3ICsyMCw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5j
b20+CiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL2xp
Yndlc3Rvbi9iYWNrZW5kLWRybS9saWJiYWNrbGlnaHQuYyBiL2xpYndlc3Rvbi9iYWNrZW5kLWRy
bS9saWJiYWNrbGlnaHQuYwotaW5kZXggY2E3ZjJkNjguLjc0NjkwZmE3IDEwMDY0NAoraW5kZXgg
Y2E3ZjJkNi4uNzQ2OTBmYSAxMDA2NDQKIC0tLSBhL2xpYndlc3Rvbi9iYWNrZW5kLWRybS9saWJi
YWNrbGlnaHQuYwogKysrIGIvbGlid2VzdG9uL2JhY2tlbmQtZHJtL2xpYmJhY2tsaWdodC5jCiBA
QCAtNDEsNiArNDEsNyBAQApAQCAtMzAsMTkgKzMwLDE2IEBAIGluZGV4IGNhN2YyZDY4Li43NDY5
MGZhNyAxMDA2NDQKICsjaW5jbHVkZSA8bGliZ2VuLmg+CiAgI2luY2x1ZGUgPHN0cmluZy5oPgog
ICNpbmNsdWRlIDxlcnJuby5oPgotCisgCiBkaWZmIC0tZ2l0IGEvdG9vbHMvenVuaXRjL3NyYy96
dW5pdGNfaW1wbC5jIGIvdG9vbHMvenVuaXRjL3NyYy96dW5pdGNfaW1wbC5jCi1pbmRleCAxOGYw
MzAxNS4uOWI0NjBmYTAgMTAwNjQ0CitpbmRleCAxOGYwMzAxLi45YjQ2MGZhIDEwMDY0NAogLS0t
IGEvdG9vbHMvenVuaXRjL3NyYy96dW5pdGNfaW1wbC5jCiArKysgYi90b29scy96dW5pdGMvc3Jj
L3p1bml0Y19pbXBsLmMKIEBAIC0yNyw2ICsyNyw3IEBACi0KKyAKICAjaW5jbHVkZSA8ZXJybm8u
aD4KICAjaW5jbHVkZSA8ZmNudGwuaD4KICsjaW5jbHVkZSA8bGliZ2VuLmg+CiAgI2luY2x1ZGUg
PHN0ZGFyZy5oPgogICNpbmNsdWRlIDxzdGRib29sLmg+CiAgI2luY2x1ZGUgPHN0ZGlvLmg+Ci0t
LQotMi40My4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dl
c3Rvbl8xMy4wLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b25fMTMu
MC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy93YXlsYW5kL3dlc3Rvbl8xMy4wLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy93YXlsYW5kL3dlc3Rvbl8xMy4wLjEuYmIKaW5kZXggY2IwMDI0YzVjYS4uZWFlMTNlMWMy
MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzEzLjAu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b25fMTMuMC4xLmJi
CkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL3dheWxhbmQvd2VzdG9uLy0vcmVsZWFzZXMvJHtQVn0vZG93bmxvCiAgICAgICAgICAgIGZp
bGU6Ly9zeXN0ZW1kLW5vdGlmeS53ZXN0b24tc3RhcnQgXAogICAgICAgICAgICAiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI1MmZmMWQ0YWEyMzk0YTJlNDE2Yzg1YTMzOGI2MjdjZTk3ZmE3MWQ0
M2ViNzYyZmQ0YWFmMTQ1ZDM2ZmM3OTVhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImVhMTU2NmFi
NGY1ZmZjZTdlOWZkNGY3YTFmY2E1YjMwY2FhZTRkNTAwMjNiZjQ1OTIxMzk5NDA5NGUwMmIyOWEi
CiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
d2F5bGFuZC93ZXN0b24vLS90YWdzIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVsZWFzZXMv
KD9QPHB2ZXI+XGQrXC5cZCtcLig/ITlcZCspXGQrKSIKLS0gCjIuNDQuMAoK

--===============4604017524689998698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1878 targets, 46 skipped, 0 masked, 0 errors.
Removing 100 recipes from the core2-64 sysroot...done.
Removing 103 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-9eb1a12adfc3a8b9422efd687c5cf275c3b6f1fd"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9eb1a12adfc3a8b9422efd687c5cf275c3b6f1fd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 779 Local 744 Mirrors 0 Missed 35 Current 339 (95% match, 96% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 6 stale sstate objects for arch allarch...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 346 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 347 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 348 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 356 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 360 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 361 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 362 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 363 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 364 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 366 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 367 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 373 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 378 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kbd-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 379 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 380 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 381 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 383 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_ipk_setscene)
NOTE: recipe kbd-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 384 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 385 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_rpm_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 387 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.52.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 388 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 390 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 391 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_create_spdx_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 395 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 396 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 398 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe kbd-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 406 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 407 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 408 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 412 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_create_spdx_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 413 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 415 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 421 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 422 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 425 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 428 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 430 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 431 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 432 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.52.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 436 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 437 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.52.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_create_spdx_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 443 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 444 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 445 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 447 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libinput-1.25.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 451 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 458 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 459 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 462 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 463 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 468 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 470 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 472 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 477 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-8.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libinput-1.25.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 479 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.52.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 482 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 485 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libinput-1.25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 486 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 487 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 492 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 493 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 495 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 500 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 505 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 508 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 510 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 511 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 513 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 515 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 517 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 522 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 523 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 526 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 527 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_packagedata_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 528 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 532 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 535 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 537 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 538 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 544 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 545 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 550 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_packagedata_setscene)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 551 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 556 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 558 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 559 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 562 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 567 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 568 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 570 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 577 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 581 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_packagedata_setscene)
NOTE: recipe xcb-util-0.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_packagedata_setscene)
NOTE: recipe xcb-util-0.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 583 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xwayland-24.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 586 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_populate_sysroot_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 587 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 590 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-util-0.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 596 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe xwayland-24.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 597 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 600 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 602 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 604 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_packagedata_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 606 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 614 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 615 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 617 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 619 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 622 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 625 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 628 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 630 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 634 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 636 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 639 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 641 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/wayland/1.22.0/temp/log.do_packagedata_setscene.2238537
NOTE: recipe libfontenc-1_1.1.8-r0: task do_recipe_qa_setscene: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 642 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_package_setscene)
NOTE: recipe xwayland-24.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 646 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 649 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 653 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 654 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 663 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 666 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 668 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 670 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.14.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 671 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 673 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 675 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 686 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 691 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 693 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 695 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 697 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 698 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 699 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 701 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_create_spdx_setscene)
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 705 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 711 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 849 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 851 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 852 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 854 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_recipe_qa_setscene)
NOTE: recipe libevdev-1.13.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 855 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 858 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 866 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_create_spdx_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 884 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 885 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 886 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 887 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 889 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 892 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 893 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 895 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 897 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 899 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 901 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 902 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 903 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 904 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 906 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 910 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 911 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.12.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 914 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.12.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 915 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 916 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 918 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 984 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_fetch)
NOTE: recipe libxml2-2.12.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.12.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 923 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.7.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 927 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 929 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_fetch: Started
NOTE: Running setscene task 930 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 931 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 933 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 934 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 935 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.12.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1206 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_write_config)
NOTE: Running task 1279 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1297 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_fetch)
NOTE: recipe libxml2-2.12.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1355 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_recipe_qa)
NOTE: Running task 1357 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_write_config)
NOTE: Running task 1366 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_fetch)
NOTE: Running task 1401 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_write_config)
NOTE: recipe libinput-1.25.0-r0: task do_write_config: Started
NOTE: recipe libinput-1.25.0-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1402 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_fetch: Started
NOTE: Running task 1422 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1423 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.25.0-r0: task do_write_config: Succeeded
NOTE: Running task 1438 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_fetch)
NOTE: recipe xwayland-24.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1453 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_unpack)
NOTE: recipe weston-init-1.0-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_write_config: Started
NOTE: Running setscene task 942 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe weston-13.0.1-r0: task do_recipe_qa: Started
NOTE: Running setscene task 944 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 946 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 947 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 948 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 950 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1477 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_unpack)
NOTE: recipe weston-13.0.1-r0: task do_write_config: Started
NOTE: recipe libinput-1.25.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-24.1.0-r0: task do_write_config: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 953 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 954 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe xwayland-24.1.0-r0: task do_unpack: Started
NOTE: recipe weston-13.0.1-r0: task do_write_config: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 955 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe kbd-2.6.4-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 956 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_unpack: Started
NOTE: Running setscene task 957 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running setscene task 958 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1494 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1500 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_patch)
NOTE: Running task 1501 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_unpack)
NOTE: Running task 1502 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: recipe weston-13.0.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_recipe_qa unihash changed to 4e4a83860e266b697739fd9d98a7a149012a97e64384d52c920bf6319c521823
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-init-1.0-r0: task do_patch: Started
NOTE: Running setscene task 960 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 962 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe kbd-2.6.4-r0: task do_unpack: Started
NOTE: Running task 1509 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_patch)
NOTE: Running task 1510 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 964 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 965 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1512 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 968 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 970 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xwayland-24.1.0-r0: task do_patch: Started
NOTE: recipe weston-13.0.1-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libinput-1.25.0-r0: task do_unpack: Succeeded
NOTE: Running task 1515 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_patch)
NOTE: recipe xwayland-24.1.0-r0: task do_patch: Succeeded
NOTE: recipe weston-13.0.1-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1527 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_unpack)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_unpack: Succeeded
NOTE: Running task 1528 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1529 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 974 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_patch: Started
NOTE: recipe weston-13.0.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe kbd-2.6.4-r0: task do_patch: Started
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1541 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libinput-1.25.0-r0: task do_patch: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running setscene task 976 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe weston-13.0.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 978 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 979 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 981 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 982 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 983 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 984 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 985 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 986 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: Running task 1544 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_patch)
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 987 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 988 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 989 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 991 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 993 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe weston-13.0.1-r0: task do_patch: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 994 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 996 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 998 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 999 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1002 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1004 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe weston-13.0.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running setscene task 1005 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1006 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1008 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1009 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1011 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1013 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1014 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1016 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1019 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1021 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1022 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1024 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1026 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1028 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1030 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1032 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1034 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1035 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1037 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1042 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1043 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1044 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1047 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1049 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1052 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1054 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1056 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1059 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1061 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1963 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1964 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2001 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_populate_lic)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe weston-13.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-13.0.1-r0: task do_populate_lic: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1063 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1064 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1066 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe weston-13.0.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_populate_lic unihash changed to c7f75e1f821d1142ab7b76e650778ff2b52451225ff3889e3a7a6e26271d53a7
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe weston-13.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_deploy_source_date_epoch unihash changed to d84d3d02033cce5b9bbaa09ede646ed8d1916838914cb7a323c818e0e496aeca
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1068 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1069 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1070 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1072 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1074 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1076 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1078 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1079 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1081 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1083 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1084 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1086 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1087 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1089 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1091 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1092 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1093 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1094 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1096 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1098 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2053 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1105 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1107 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1108 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c8afda1b9ad17f0a32fe2282140fb9fbfb6a58c64c5c1f9fe1f3c72112aae711
NOTE: Running task 2077 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1111 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1113 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1114 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1116 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1118 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2604 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata)
NOTE: Running task 2617 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2779 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata: Started
NOTE: recipe libinput-1.25.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2845 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2927 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2969 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_collect_spdx_deps)
NOTE: recipe xwayland-24.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2976 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe kbd-2.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.25.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2998 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_collect_spdx_deps)
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3001 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_configure)
NOTE: Running task 3002 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 84b5de9da03360a64d4498693efe2cfbc1fd74dd8432b0d807425ead25b5c926
NOTE: Running task 3003 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-24.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.25.0-r0: task do_configure: Started
NOTE: recipe kbd-2.6.4-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-24.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3004 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_configure)
NOTE: recipe xwayland-24.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3005 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_configure)
NOTE: recipe weston-init-1.0-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_configure: Succeeded
NOTE: Running task 3006 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_compile)
NOTE: recipe weston-init-1.0-r0: task do_compile: Started
NOTE: recipe weston-init-1.0-r0: task do_compile: Succeeded
NOTE: Running task 3007 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_install)
NOTE: recipe weston-init-1.0-r0: task do_install: Started
NOTE: recipe weston-init-1.0-r0: task do_install: Succeeded
NOTE: Running task 3008 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_package)
NOTE: recipe weston-init-1.0-r0: task do_package: Started
NOTE: recipe libinput-1.25.0-r0: task do_configure: Succeeded
NOTE: Running task 3009 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.25.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.25.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3010 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_compile)
NOTE: recipe libinput-1.25.0-r0: task do_compile: Started
NOTE: recipe weston-init-1.0-r0: task do_package: Succeeded
NOTE: Running task 3011 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata)
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Started
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata unihash changed to d15f1de3bff845fa07fd3cba849f7e38a14b568e6db148814b2e02435c92242e
NOTE: Setscene tasks completed
NOTE: Running task 3012 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_create_spdx)
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Started
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3013 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_compile)
NOTE: recipe xwayland-24.1.0-r0: task do_compile: Started
NOTE: recipe libinput-1.25.0-r0: task do_compile: Succeeded
NOTE: Running task 3014 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.25.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.25.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3015 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_install)
NOTE: recipe libinput-1.25.0-r0: task do_install: Started
NOTE: recipe libinput-1.25.0-r0: task do_install: Succeeded
NOTE: Running task 3016 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_install_ptest_base)
NOTE: recipe libinput-1.25.0-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.25.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3017 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_package)
NOTE: Running task 3018 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_populate_sysroot)
NOTE: recipe libinput-1.25.0-r0: task do_package: Started
NOTE: recipe libinput-1.25.0-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.25.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_package: Succeeded
NOTE: Running task 3019 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_packagedata)
NOTE: recipe kbd-2.6.4-r0: task do_configure: Succeeded
NOTE: Running task 3020 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_compile)
NOTE: recipe libinput-1.25.0-r0: task do_packagedata: Started
NOTE: recipe kbd-2.6.4-r0: task do_compile: Started
NOTE: recipe libinput-1.25.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_packagedata unihash changed to c23f95f4e20249214f5a0728e07d7076a9eab2cdd7910e00ef5cf67900de6818
NOTE: Setscene tasks completed
NOTE: Running task 3021 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_create_spdx)
NOTE: recipe libinput-1.25.0-r0: task do_create_spdx: Started
NOTE: recipe xwayland-24.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3022 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_install)
NOTE: recipe xwayland-24.1.0-r0: task do_install: Started
NOTE: recipe libinput-1.25.0-r0: task do_create_spdx: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_install: Succeeded
NOTE: Running task 3023 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_package)
NOTE: Running task 3024 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_populate_sysroot)
NOTE: recipe xwayland-24.1.0-r0: task do_package: Started
NOTE: recipe xwayland-24.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-24.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3025 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-13.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kbd-2.6.4-r0: task do_compile: Succeeded
NOTE: Running task 3026 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_install)
NOTE: recipe kbd-2.6.4-r0: task do_install: Started
NOTE: recipe weston-13.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3027 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_configure)
NOTE: recipe weston-13.0.1-r0: task do_configure: Started
NOTE: recipe xwayland-24.1.0-r0: task do_package: Succeeded
NOTE: Running task 3028 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_packagedata)
NOTE: recipe xwayland-24.1.0-r0: task do_packagedata: Started
NOTE: recipe kbd-2.6.4-r0: task do_install: Succeeded
NOTE: Running task 3029 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_package)
NOTE: recipe xwayland-24.1.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_packagedata unihash changed to 6dcd4142a50810f17bce522e8cac964624d00d86f4b798eddb72e4b940165270
NOTE: recipe kbd-2.6.4-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 3030 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_create_spdx)
NOTE: Running task 3031 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_package_write_ipk)
NOTE: Running task 3032 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_package_write_deb)
NOTE: Running task 3033 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_package_write_rpm)
NOTE: recipe xwayland-24.1.0-r0: task do_create_spdx: Started
NOTE: recipe xwayland-24.1.0-r0: task do_package_write_ipk: Started
NOTE: recipe xwayland-24.1.0-r0: task do_package_write_deb: Started
NOTE: recipe xwayland-24.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-24.1.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_package_write_ipk unihash changed to 434f3f7c029ed539ad20b0047bb2495ac6a132e57989d7db51581ab7232ea96a
NOTE: recipe xwayland-24.1.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3034 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_collect_spdx_deps)
NOTE: recipe weston-13.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-13.0.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3035 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_compile)
NOTE: recipe weston-13.0.1-r0: task do_compile: Started
NOTE: recipe weston-13.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_package: Succeeded
NOTE: Running task 3036 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_packagedata)
NOTE: recipe kbd-2.6.4-r0: task do_packagedata: Started
NOTE: recipe xwayland-24.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_package_write_rpm unihash changed to 747f902ecdf56f3b02e2a1e2b26bc176d99cd92dd35cb6cbfc8ef7319f60713a
NOTE: recipe xwayland-24.1.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_package_write_deb unihash changed to 279bc1024ed60e4eb77c0f17edd7376c7954c7ea3fee7add4f2d3874026ff51f
NOTE: recipe kbd-2.6.4-r0: task do_packagedata: Succeeded
NOTE: recipe weston-13.0.1-r0: task do_compile: Succeeded
NOTE: Running task 3037 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_install)
NOTE: recipe weston-13.0.1-r0: task do_install: Started
NOTE: recipe weston-13.0.1-r0: task do_install: Succeeded
NOTE: Running task 3038 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_package)
NOTE: Running task 3039 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_populate_sysroot)
NOTE: recipe weston-13.0.1-r0: task do_package: Started
NOTE: recipe weston-13.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe weston-13.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe weston-13.0.1-r0: task do_package: Succeeded
NOTE: Running task 3040 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_packagedata)
NOTE: recipe weston-13.0.1-r0: task do_packagedata: Started
NOTE: recipe weston-13.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3041 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_create_spdx)
NOTE: Running task 3042 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_package_write_ipk)
NOTE: Running task 3043 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_package_write_deb)
NOTE: Running task 3044 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_package_write_rpm)
NOTE: Running task 3045 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_package_write_ipk)
NOTE: recipe weston-13.0.1-r0: task do_create_spdx: Started
NOTE: Running task 3046 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_package_write_deb)
NOTE: recipe weston-init-1.0-r0: task do_package_write_ipk: Started
NOTE: recipe weston-init-1.0-r0: task do_package_write_deb: Started
NOTE: Running task 3047 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_package_write_rpm)
NOTE: Running task 3048 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_package_qa)
NOTE: recipe weston-init-1.0-r0: task do_package_write_rpm: Started
NOTE: recipe weston-13.0.1-r0: task do_package_write_ipk: Started
NOTE: recipe weston-13.0.1-r0: task do_package_write_deb: Started
NOTE: recipe weston-13.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe weston-13.0.1-r0: task do_package_qa: Started
NOTE: recipe weston-init-1.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_package_write_ipk unihash changed to 9073cab31bd3cb070b11de7e5f470bf2ed90c68b750b1e157a4a87217c15803e
NOTE: recipe weston-init-1.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_package_write_deb unihash changed to 94b1cbd9fbddc09b23fb14ed341f59c97571907fa1a0a0cfdb94547abfe144e5
NOTE: recipe weston-init-1.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_package_write_rpm unihash changed to f0efd68f2b627f0a84a1632160ceb66cb8dad2299c7197c0a11d3450a29e2e76
NOTE: recipe weston-13.0.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe weston-13.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3049 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_create_runtime_spdx)
NOTE: recipe weston-13.0.1-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_package_qa unihash changed to 6f9805e8d28146341b86eae7c2f6ed40e5989b4d94735b470bec1a0e48c72b55
NOTE: recipe weston-13.0.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe weston-13.0.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe weston-13.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe weston-13.0.1-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 3050 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 3050 tasks of which 2960 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: wayland-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package wayland-src went backwards which would break package feeds (from 0:1.23.0-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: wayland-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package wayland-dbg went backwards which would break package feeds (from 0:1.23.0-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: wayland-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package wayland-tools went backwards which would break package feeds (from 0:1.23.0-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: wayland-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package wayland-ptest went backwards which would break package feeds (from 0:1.23.0-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: wayland-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package wayland-staticdev went backwards which would break package feeds (from 0:1.23.0-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: wayland-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package wayland-dev went backwards which would break package feeds (from 0:1.23.0-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: wayland-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package wayland-doc went backwards which would break package feeds (from 0:1.23.0-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: wayland-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package wayland-locale went backwards which would break package feeds (from 0:1.23.0-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: wayland-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package wayland went backwards which would break package feeds (from 0:1.23.0-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: wayland-1.22.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4604017524689998698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/weston: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/weston/-/releases/13.0.0/downloads/weston-13.0.0.tar.xz file://0001-libweston-tools-Include-libgen.h-for-basename-signat.patch file://weston.png file://weston.desktop file://xwayland.weston-start file://systemd-notify.weston-start" to "https://gitlab.freedesktop.org/wayland/weston/-/releases/13.0.1/downloads/weston-13.0.1.tar.xz file://0001-libweston-tools-Include-libgen.h-for-basename-signat.patch file://weston.png file://weston.desktop file://xwayland.weston-start file://systemd-notify.weston-start"
packages/core2-64-poky-linux/weston: PKGV changed from 13.0.0 [default] to 13.0.1 [default]
packages/core2-64-poky-linux/weston/libweston-13: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston/libweston-13: FILELIST: removed "/usr/lib/libweston-13.so.0.0.0", added "/usr/lib/libweston-13.so.0.0.1"
packages/core2-64-poky-linux/weston/libweston-13: PKGV changed from 13.0.0 [default] to 13.0.1 [default]
Changes to packages/core2-64-poky-linux/weston (sysroot):
  /usr/lib/libweston-13.so.0 changed symlink target from libweston-13.so.0.0.0 to libweston-13.so.0.0.1
  /usr/lib/libweston-13.so.0.0.0 moved to /usr/lib/libweston-13.so.0.0.1
packages/core2-64-poky-linux/weston/weston-dbg: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston/weston-dbg: PKGSIZE changed from 15930944 to 15932336 (+0%)
packages/core2-64-poky-linux/weston/weston-dbg: FILELIST: removed "/usr/lib/.debug/libweston-13.so.0.0.0", added "/usr/lib/.debug/libweston-13.so.0.0.1"
packages/core2-64-poky-linux/weston/weston-dbg: PKGV changed from 13.0.0 [default] to 13.0.1 [default]
packages/core2-64-poky-linux/weston/weston-dev: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston/weston-dev: PKGSIZE changed from 160781 to 160754 (-0%)
packages/core2-64-poky-linux/weston/weston-dev: PKGV changed from 13.0.0 [default] to 13.0.1 [default]
packages/core2-64-poky-linux/weston/weston-doc: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston/weston-doc: PKGV changed from 13.0.0 [default] to 13.0.1 [default]
packages/core2-64-poky-linux/weston/weston-examples: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston/weston-examples: PKGV changed from 13.0.0 [default] to 13.0.1 [default]
packages/core2-64-poky-linux/weston/weston-locale: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston/weston-locale: PKGV changed from 13.0.0 [default] to 13.0.1 [default]
packages/core2-64-poky-linux/weston/weston-src: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston/weston-src: PKGSIZE changed from 5034527 to 5036746 (+0%)
packages/core2-64-poky-linux/weston/weston-src: PKGV changed from 13.0.0 [default] to 13.0.1 [default]
packages/core2-64-poky-linux/weston/weston-staticdev: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston/weston-staticdev: PKGV changed from 13.0.0 [default] to 13.0.1 [default]
packages/core2-64-poky-linux/weston/weston-xwayland: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston/weston-xwayland: PKGV changed from 13.0.0 [default] to 13.0.1 [default]
packages/core2-64-poky-linux/weston/weston: PV changed from "13.0.0" to "13.0.1"
packages/core2-64-poky-linux/weston/weston: PKGV changed from 13.0.0 [default] to 13.0.1 [default]

--===============4604017524689998698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/weston/libweston-13: FILELIST: removed "/usr/lib/libweston-13.so.0.0.0", added "/usr/lib/libweston-13.so.0.0.1"
Changes to packages/core2-64-poky-linux/weston (sysroot):
  /usr/lib/libweston-13.so.0 changed symlink target from libweston-13.so.0.0.0 to libweston-13.so.0.0.1
  /usr/lib/libweston-13.so.0.0.0 moved to /usr/lib/libweston-13.so.0.0.1

--===============4604017524689998698==--

