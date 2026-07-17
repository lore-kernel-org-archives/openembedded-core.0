Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BBDC44519
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:31:57 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7367.1784266306190638446
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RWEOq8Cx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=w5p4l+98;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019f6e8f2e81-618229b6-7ba9-4ac7-9f7c-950dde066535-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784266305;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=a3CvaipiuZv+GIMV+t6ryk6yJaBVrsIl1xaESqrlwX4=;
	b=RWEOq8Cx4JzHuw+r7NIH3eL/XA1QOZZsA0AGNdcqcubxyHossAFutvGPQL8Jh3r5
	z4kO4Apo776Qh6YML/0HQIk0rYu5erAGmWEVe5rqdpadaKkNAQAN8dE1LuM7qGoaZ2T
	5bnv8ZxOABzUhT4cXvT9wDVuvPZCFOQP2bRYADg8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784266305;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=a3CvaipiuZv+GIMV+t6ryk6yJaBVrsIl1xaESqrlwX4=;
	b=w5p4l+98+10xzp6Yz31lY88tVk4RU2NDrE/aOcnQaET03eEbll5ewhPED+EReCHO
	Q5fgdjfBkDwe7GcoMQknw4FvBCETPlBIAo0sVTy5hCuvxrQGXEWlviolXSBJ2lieCe1
	/4YhvcU2V7IbW5g71/T/LcXzH1Z51vQ7flSf3JY4=
Content-Type: multipart/mixed; boundary="===============6191922141344271067=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland: upgrading to 1.26.0 SUCCEEDED
Message-ID: <0101019f6e8f2e81-618229b6-7ba9-4ac7-9f7c-950dde066535-000000@us-west-2.amazonses.com>
Date: Fri, 17 Jul 2026 05:31:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.17-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241128

--===============6191922141344271067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wayland* to *1.26.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wayland-upgrade-1.25.0-1.26.0.patch
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
From 03365f276d84d6f5a28ea30cdef4adea6315dd03 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 17 Jul 2026 05:31:38 +0000
Subject: [PATCH] wayland: upgrade 1.25.0 -> 1.26.0

---
 .../wayland/0001-build-Fix-strndup-detection-on-MinGW.patch   | 4 ++--
 .../wayland/0001-tests-Remove-event_loop_timer-test.patch     | 2 +-
 .../wayland/{wayland_1.25.0.bb => wayland_1.26.0.bb}          | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland_1.25.0.bb => wayland_1.26.0.bb} (96%)

diff --git a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch b/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
index d402fbf8b4..c60d01708c 100644
--- a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
+++ b/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
@@ -1,4 +1,4 @@
-From b4a3b9f913e06f9b71966cd695df1ab14a031ed0 Mon Sep 17 00:00:00 2001
+From a3239f480eecc8d45bd15b8c0f6774424249a295 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Thu, 20 Feb 2020 15:20:45 -0600
 Subject: [PATCH] build: Fix strndup detection on MinGW
@@ -20,7 +20,7 @@ Signed-off-by: Denys Dmytriyenko <denis@denix.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 33653e7..e05eaef 100644
+index 2c010be..3b6f8d7 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -49,12 +49,12 @@ have_funcs = [
diff --git a/meta/recipes-graphics/wayland/wayland/0001-tests-Remove-event_loop_timer-test.patch b/meta/recipes-graphics/wayland/wayland/0001-tests-Remove-event_loop_timer-test.patch
index b225bec96d..3de3047314 100644
--- a/meta/recipes-graphics/wayland/wayland/0001-tests-Remove-event_loop_timer-test.patch
+++ b/meta/recipes-graphics/wayland/wayland/0001-tests-Remove-event_loop_timer-test.patch
@@ -1,4 +1,4 @@
-From 46da8d01e695f415aeb4a8442dbc13ae0898912c Mon Sep 17 00:00:00 2001
+From 022ef36fa8a9fe57a117a6cbc55d8b81bf0fa023 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Thu, 6 Nov 2025 08:35:26 -0700
 Subject: [PATCH] tests: Remove event_loop_timer test
diff --git a/meta/recipes-graphics/wayland/wayland_1.25.0.bb b/meta/recipes-graphics/wayland/wayland_1.26.0.bb
similarity index 96%
rename from meta/recipes-graphics/wayland/wayland_1.25.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.26.0.bb
index a0bc13df56..c4e3c8b0f6 100644
--- a/meta/recipes-graphics/wayland/wayland_1.25.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.26.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downl
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
            file://0001-tests-Remove-event_loop_timer-test.patch \
            "
-SRC_URI[sha256sum] = "c065f040afdff3177680600f249727e41a1afc22fccf27222f15f5306faa1f03"
+SRC_URI[sha256sum] = "64176eaa46e4969903e286f8e5ef8331affc17fdf03ac9b58381d2b23162b7a3"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.47.1


--===============6191922141344271067==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-upgrade-1.25.0-1.26.0.patch"

RnJvbSAwMzM2NWYyNzZkODRkNmY1YTI4ZWEzMGNkZWY0YWRlYTYzMTVkZDAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTcgSnVsIDIwMjYgMDU6MzE6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
YXlsYW5kOiB1cGdyYWRlIDEuMjUuMCAtPiAxLjI2LjAKCi0tLQogLi4uL3dheWxhbmQvMDAwMS1i
dWlsZC1GaXgtc3RybmR1cC1kZXRlY3Rpb24tb24tTWluR1cucGF0Y2ggICB8IDQgKystLQogLi4u
L3dheWxhbmQvMDAwMS10ZXN0cy1SZW1vdmUtZXZlbnRfbG9vcF90aW1lci10ZXN0LnBhdGNoICAg
ICB8IDIgKy0KIC4uLi93YXlsYW5kL3t3YXlsYW5kXzEuMjUuMC5iYiA9PiB3YXlsYW5kXzEuMjYu
MC5iYn0gICAgICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC97d2F5
bGFuZF8xLjI1LjAuYmIgPT4gd2F5bGFuZF8xLjI2LjAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC8wMDAxLWJ1aWxkLUZpeC1zdHJu
ZHVwLWRldGVjdGlvbi1vbi1NaW5HVy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXls
YW5kL3dheWxhbmQvMDAwMS1idWlsZC1GaXgtc3RybmR1cC1kZXRlY3Rpb24tb24tTWluR1cucGF0
Y2gKaW5kZXggZDQwMmZiZjhiNC4uYzYwZDAxNzA4YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC8wMDAxLWJ1aWxkLUZpeC1zdHJuZHVwLWRldGVjdGlv
bi1vbi1NaW5HVy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXls
YW5kLzAwMDEtYnVpbGQtRml4LXN0cm5kdXAtZGV0ZWN0aW9uLW9uLU1pbkdXLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSBiNGEzYjlmOTEzZTA2ZjliNzE5NjZjZDY5NWRmMWFiMTRhMDMxZWQw
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhMzIzOWY0ODBlZWNjOGQ0NWJkMTViOGMw
ZjY3NzQ0MjQyNDlhMjk1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSm9zaHVhIFdh
dHQgPEpQRVdoYWNrZXJAZ21haWwuY29tPgogRGF0ZTogVGh1LCAyMCBGZWIgMjAyMCAxNToyMDo0
NSAtMDYwMAogU3ViamVjdDogW1BBVENIXSBidWlsZDogRml4IHN0cm5kdXAgZGV0ZWN0aW9uIG9u
IE1pbkdXCkBAIC0yMCw3ICsyMCw3IEBAIFNpZ25lZC1vZmYtYnk6IERlbnlzIERteXRyaXllbmtv
IDxkZW5pc0BkZW5peC5vcmc+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRl
eCAzMzY1M2U3Li5lMDVlYWVmIDEwMDY0NAoraW5kZXggMmMwMTBiZS4uM2I2ZjhkNyAxMDA2NDQK
IC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAogQEAgLTQ5LDEyICs0OSwxMiBA
QCBoYXZlX2Z1bmNzID0gWwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxh
bmQvd2F5bGFuZC8wMDAxLXRlc3RzLVJlbW92ZS1ldmVudF9sb29wX3RpbWVyLXRlc3QucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLzAwMDEtdGVzdHMtUmVtb3Zl
LWV2ZW50X2xvb3BfdGltZXItdGVzdC5wYXRjaAppbmRleCBiMjI1YmVjOTZkLi4zZGUzMDQ3MzE0
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLzAwMDEt
dGVzdHMtUmVtb3ZlLWV2ZW50X2xvb3BfdGltZXItdGVzdC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLzAwMDEtdGVzdHMtUmVtb3ZlLWV2ZW50X2xvb3Bf
dGltZXItdGVzdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDZkYThkMDFlNjk1ZjQxNWFl
YjRhODQ0MmRiYzEzYWUwODk4OTEyYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDIy
ZWYzNmZhOGE5ZmU1N2ExMTdhNmNiYzU1ZDhiODFiZjBmYTAyMyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEpvc2h1YSBXYXR0IDxKUEVXaGFja2VyQGdtYWlsLmNvbT4KIERhdGU6IFRo
dSwgNiBOb3YgMjAyNSAwODozNToyNiAtMDcwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0czogUmVt
b3ZlIGV2ZW50X2xvb3BfdGltZXIgdGVzdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3dheWxhbmQvd2F5bGFuZF8xLjI1LjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5
bGFuZC93YXlsYW5kXzEuMjYuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kXzEuMjUuMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZF8xLjI2LjAuYmIKaW5kZXggYTBi
YzEzZGY1Ni4uYzRlM2M4YjBmNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dh
eWxhbmQvd2F5bGFuZF8xLjI1LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxh
bmQvd2F5bGFuZF8xLjI2LjAuYmIKQEAgLTE3LDcgKzE3LDcgQEAgU1JDX1VSSSA9ICJodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93YXlsYW5kLy0vcmVsZWFzZXMvJHtQVn0v
ZG93bmwKICAgICAgICAgICAgZmlsZTovLzAwMDEtYnVpbGQtRml4LXN0cm5kdXAtZGV0ZWN0aW9u
LW9uLU1pbkdXLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtdGVzdHMtUmVtb3ZlLWV2
ZW50X2xvb3BfdGltZXItdGVzdC5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICJjMDY1ZjA0MGFmZGZmMzE3NzY4MDYwMGYyNDk3MjdlNDFhMWFmYzIyZmNjZjI3MjIy
ZjE1ZjUzMDZmYWExZjAzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY0MTc2ZWFhNDZlNDk2OTkw
M2UyODZmOGU1ZWY4MzMxYWZmYzE3ZmRmMDNhYzliNTgzODFkMmIyMzE2MmI3YTMiCiAKIFVQU1RS
RUFNX0NIRUNLX1VSSSA9ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93
YXlsYW5kLy0vdGFncyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2VzLyg/UDxwdmVy
PlxkK1wuXGQrXC4oPyE5XGQrKVxkKykiCi0tIAoyLjQ3LjEKCg==

--===============6191922141344271067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/wayland (sysroot):
  /usr/lib/libwayland-client.so.0 changed symlink target from libwayland-client.so.0.25.0 to libwayland-client.so.0.26.0
  /usr/lib/libwayland-cursor.so.0 changed symlink target from libwayland-cursor.so.0.25.0 to libwayland-cursor.so.0.26.0
  /usr/lib/libwayland-egl.so.1 changed symlink target from libwayland-egl.so.1.25.0 to libwayland-egl.so.1.26.0
  /usr/lib/libwayland-server.so.0 changed symlink target from libwayland-server.so.0.25.0 to libwayland-server.so.0.26.0
  /usr/lib/libwayland-client.so.0.25.0 moved to /usr/lib/libwayland-client.so.0.26.0
  /usr/lib/libwayland-cursor.so.0.25.0 moved to /usr/lib/libwayland-cursor.so.0.26.0
  /usr/lib/libwayland-egl.so.1.25.0 moved to /usr/lib/libwayland-egl.so.1.26.0
  /usr/lib/libwayland-server.so.0.25.0 moved to /usr/lib/libwayland-server.so.0.26.0
packages/x86-64-v3-poky-linux/wayland/wayland: FILELIST: removed "/usr/lib/libwayland-client.so.0.25.0 /usr/lib/libwayland-egl.so.1.25.0 /usr/lib/libwayland-server.so.0.25.0 /usr/lib/libwayland-cursor.so.0.25.0", added "/usr/lib/libwayland-egl.so.1.26.0 /usr/lib/libwayland-server.so.0.26.0 /usr/lib/libwayland-cursor.so.0.26.0 /usr/lib/libwayland-client.so.0.26.0"

--===============6191922141344271067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/wayland: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.25.0/downloads/wayland-1.25.0.tar.xz file://run-ptest file://0001-build-Fix-strndup-detection-on-MinGW.patch file://0001-tests-Remove-event_loop_timer-test.patch" to "https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.26.0/downloads/wayland-1.26.0.tar.xz file://run-ptest file://0001-build-Fix-strndup-detection-on-MinGW.patch file://0001-tests-Remove-event_loop_timer-test.patch"
packages/x86-64-v3-poky-linux/wayland: PKGV changed from 1.25.0 [default] to 1.26.0 [default]
packages/x86-64-v3-poky-linux/wayland: PV changed from "1.25.0" to "1.26.0"
Changes to packages/x86-64-v3-poky-linux/wayland (sysroot):
  /usr/lib/libwayland-client.so.0 changed symlink target from libwayland-client.so.0.25.0 to libwayland-client.so.0.26.0
  /usr/lib/libwayland-cursor.so.0 changed symlink target from libwayland-cursor.so.0.25.0 to libwayland-cursor.so.0.26.0
  /usr/lib/libwayland-egl.so.1 changed symlink target from libwayland-egl.so.1.25.0 to libwayland-egl.so.1.26.0
  /usr/lib/libwayland-server.so.0 changed symlink target from libwayland-server.so.0.25.0 to libwayland-server.so.0.26.0
  /usr/lib/libwayland-client.so.0.25.0 moved to /usr/lib/libwayland-client.so.0.26.0
  /usr/lib/libwayland-cursor.so.0.25.0 moved to /usr/lib/libwayland-cursor.so.0.26.0
  /usr/lib/libwayland-egl.so.1.25.0 moved to /usr/lib/libwayland-egl.so.1.26.0
  /usr/lib/libwayland-server.so.0.25.0 moved to /usr/lib/libwayland-server.so.0.26.0
packages/x86-64-v3-poky-linux/wayland/wayland-dbg: PKGV changed from 1.25.0 [default] to 1.26.0 [default]
packages/x86-64-v3-poky-linux/wayland/wayland-dbg: FILELIST: removed "/usr/lib/.debug/libwayland-egl.so.1.25.0 /usr/lib/.debug/libwayland-cursor.so.0.25.0 /usr/lib/.debug/libwayland-server.so.0.25.0 /usr/lib/.debug/libwayland-client.so.0.25.0", added "/usr/lib/.debug/libwayland-cursor.so.0.26.0 /usr/lib/.debug/libwayland-client.so.0.26.0 /usr/lib/.debug/libwayland-server.so.0.26.0 /usr/lib/.debug/libwayland-egl.so.1.26.0"
packages/x86-64-v3-poky-linux/wayland/wayland-dbg: PKGSIZE changed from 2721216 to 2742784 (+1%)
packages/x86-64-v3-poky-linux/wayland/wayland-dbg: PV changed from "1.25.0" to "1.26.0"
packages/x86-64-v3-poky-linux/wayland/wayland-dev: PKGV changed from 1.25.0 [default] to 1.26.0 [default]
packages/x86-64-v3-poky-linux/wayland/wayland-dev: PKGSIZE changed from 475419 to 484063 (+2%)
packages/x86-64-v3-poky-linux/wayland/wayland-dev: PV changed from "1.25.0" to "1.26.0"
packages/x86-64-v3-poky-linux/wayland/wayland-doc: PKGV changed from 1.25.0 [default] to 1.26.0 [default]
packages/x86-64-v3-poky-linux/wayland/wayland-doc: PV changed from "1.25.0" to "1.26.0"
packages/x86-64-v3-poky-linux/wayland/wayland-locale: PKGV changed from 1.25.0 [default] to 1.26.0 [default]
packages/x86-64-v3-poky-linux/wayland/wayland-locale: PV changed from "1.25.0" to "1.26.0"
packages/x86-64-v3-poky-linux/wayland/wayland-ptest: PKGV changed from 1.25.0 [default] to 1.26.0 [default]
packages/x86-64-v3-poky-linux/wayland/wayland-ptest: PKGSIZE changed from 1399544 to 1407906 (+1%)
packages/x86-64-v3-poky-linux/wayland/wayland-ptest: PV changed from "1.25.0" to "1.26.0"
packages/x86-64-v3-poky-linux/wayland/wayland-src: PKGV changed from 1.25.0 [default] to 1.26.0 [default]
packages/x86-64-v3-poky-linux/wayland/wayland-src: FILELIST: directory renamed /usr/src/debug/wayland/1.25.0/src -> /usr/src/debug/wayland/1.26.0/src, directory renamed /usr/src/debug/wayland/1.25.0/egl -> /usr/src/debug/wayland/1.26.0/egl, directory renamed /usr/src/debug/wayland/1.25.0/cursor -> /usr/src/debug/wayland/1.26.0/cursor, directory renamed /usr/src/debug/wayland/1.25.0/tests -> /usr/src/debug/wayland/1.26.0/tests, directory renamed /usr/src/debug/wayland/1.25.0/tests/data -> /usr/src/debug/wayland/1.26.0/tests/data
packages/x86-64-v3-poky-linux/wayland/wayland-src: PKGSIZE changed from 1149985 to 1170883 (+2%)
packages/x86-64-v3-poky-linux/wayland/wayland-src: PV changed from "1.25.0" to "1.26.0"
packages/x86-64-v3-poky-linux/wayland/wayland-staticdev: PKGV changed from 1.25.0 [default] to 1.26.0 [default]
packages/x86-64-v3-poky-linux/wayland/wayland-staticdev: PV changed from "1.25.0" to "1.26.0"
packages/x86-64-v3-poky-linux/wayland/wayland-tools: PKGV changed from 1.25.0 [default] to 1.26.0 [default]
packages/x86-64-v3-poky-linux/wayland/wayland-tools: PV changed from "1.25.0" to "1.26.0"
packages/x86-64-v3-poky-linux/wayland/wayland: PKGV changed from 1.25.0 [default] to 1.26.0 [default]
packages/x86-64-v3-poky-linux/wayland/wayland: FILELIST: removed "/usr/lib/libwayland-cursor.so.0.25.0 /usr/lib/libwayland-client.so.0.25.0 /usr/lib/libwayland-server.so.0.25.0 /usr/lib/libwayland-egl.so.1.25.0", added "/usr/lib/libwayland-egl.so.1.26.0 /usr/lib/libwayland-server.so.0.26.0 /usr/lib/libwayland-client.so.0.26.0 /usr/lib/libwayland-cursor.so.0.26.0"
packages/x86-64-v3-poky-linux/wayland/wayland: PKGSIZE changed from 393981 to 401690 (+2%)
packages/x86-64-v3-poky-linux/wayland/wayland: PV changed from "1.25.0" to "1.26.0"

--===============6191922141344271067==--

