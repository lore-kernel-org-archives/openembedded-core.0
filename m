Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12843.1793079632661969332
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 22:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=A0BDJpsn;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=vPXuOJ/L;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a17bdfdf1f-84892c44-beaf-4952-88a1-2bf98edbdd00-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793079631;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JRMOUjJfVJrM798jg/Z0IAvmPUP/U/EId+2FCczHw9M=;
	b=A0BDJpsnulGyPbmloitWrGCjUt1KwjsFNTjL4tUwwG5rUHbtaS0B+oFg6eS9hihx
	clOqTgyxlKE71tnRkiuYfGWsC7zfP8cEIfF7pfMeFTFIKGjbMVLWUgYNvt9x+naXYAk
	Xw4uxmiMXGc0K4REWoU+H2bmSXQarjVtxRd4bjBw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793079631;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JRMOUjJfVJrM798jg/Z0IAvmPUP/U/EId+2FCczHw9M=;
	b=vPXuOJ/LWl6FDMfMmVt00O/S7ZKMnvS4HulD3UmN5LRcpn1Y0gpYULFDQySpbOmI
	hOC82Nf5vB+iQUNO8XRti9xWSfrInYMlVU99tf94H/f/Fjs3NTFAtI45SmMKsL7PIlg
	9vGcHtNOJVW3lqe3wcRILcbdfSJejVYZ2Amv/uVw=
Content-Type: multipart/mixed; boundary="===============3146619914007240619=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 16.0.2 SUCCEEDED
Message-ID: <010101a17bdfdf1f-84892c44-beaf-4952-88a1-2bf98edbdd00-000000@us-west-2.amazonses.com>
Date: Tue, 27 Oct 2026 05:40:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.27-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 05:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248705

--===============3146619914007240619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *weston* to *16.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-weston-upgrade-16.0.0-16.0.2.patch
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
From bde4322525344951b1e0c7c21813fc4356180d39 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 27 Oct 2026 05:18:10 +0000
Subject: [PATCH] weston: upgrade 16.0.0 -> 16.0.2

---
 .../weston/Allow-libdisplay-info-0.4.0.patch  | 28 -------------------
 .../{weston_16.0.0.bb => weston_16.0.2.bb}    |  3 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/Allow-libdisplay-info-0.4.0.patch
 rename meta/recipes-graphics/wayland/{weston_16.0.0.bb => weston_16.0.2.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/weston/Allow-libdisplay-info-0.4.0.patch b/meta/recipes-graphics/wayland/weston/Allow-libdisplay-info-0.4.0.patch
deleted file mode 100644
index 07f37b277f..0000000000
--- a/meta/recipes-graphics/wayland/weston/Allow-libdisplay-info-0.4.0.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 54cd5c3354c618815addd7e1d82fc66247099136 Mon Sep 17 00:00:00 2001
-From: Tom Pollard <tom.pollard@codethink.co.uk>
-Date: Tue, 28 Jul 2026 10:51:27 +0100
-Subject: [PATCH] Allow libdisplay-info 0.4.0
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/wayland/weston/-/commit/54cd5c3354c618815addd7e1d82fc66247099136]
-
-Signed-off-by: Tom Pollard <tom.pollard@codethink.co.uk>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 03f4d3201f..4814a81592 100644
---- a/meson.build
-+++ b/meson.build
-@@ -180,7 +180,7 @@ endif
- 
- dep_libdisplay_info = dependency(
- 	'libdisplay-info',
--	version: ['>= 0.2.0', '< 0.4.0'],
-+	version: ['>= 0.2.0', '< 0.5.0'],
- 	fallback: ['display-info', 'di_dep'],
- 	default_options: [
- 		'werror=false',
--- 
-GitLab
-
diff --git a/meta/recipes-graphics/wayland/weston_16.0.0.bb b/meta/recipes-graphics/wayland/weston_16.0.2.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/weston_16.0.0.bb
rename to meta/recipes-graphics/wayland/weston_16.0.2.bb
index 8e5d79aec3..e9b8b392aa 100644
--- a/meta/recipes-graphics/wayland/weston_16.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_16.0.2.bb
@@ -11,10 +11,9 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://weston.desktop \
            file://xwayland.weston-start \
            file://systemd-notify.weston-start \
-           file://Allow-libdisplay-info-0.4.0.patch \
            "
 
-SRC_URI[sha256sum] = "dfb32e2bccabda957b94a8d0ec6075acd18c71c87ebc543ee3e618d294ca0f7f"
+SRC_URI[sha256sum] = "49dd87d18cb229384264d2f69cb5a51f14f61a111e9227bfedb91b3ca8c39643"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.47.1


--===============3146619914007240619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/weston: PKGV changed from 16.0.0 [default] to 16.0.2 [default]
packages/x86-64-v3-poky-linux/weston: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/weston/-/releases/16.0.0/downloads/weston-16.0.0.tar.xz file://weston.png file://weston.desktop file://xwayland.weston-start file://systemd-notify.weston-start file://Allow-libdisplay-info-0.4.0.patch" to "https://gitlab.freedesktop.org/wayland/weston/-/releases/16.0.2/downloads/weston-16.0.2.tar.xz file://weston.png file://weston.desktop file://xwayland.weston-start file://systemd-notify.weston-start"
packages/x86-64-v3-poky-linux/weston: PV changed from "16.0.0" to "16.0.2"
packages/x86-64-v3-poky-linux/weston/libweston-16: FILELIST: removed "/usr/lib/libweston-16.so.0.0.0", added "/usr/lib/libweston-16.so.0.0.2"
packages/x86-64-v3-poky-linux/weston/libweston-16: PKGV changed from 16.0.0 [default] to 16.0.2 [default]
packages/x86-64-v3-poky-linux/weston/libweston-16: PV changed from "16.0.0" to "16.0.2"
Changes to packages/x86-64-v3-poky-linux/weston (sysroot):
  /usr/lib/libweston-16.so.0 changed symlink target from libweston-16.so.0.0.0 to libweston-16.so.0.0.2
  /usr/lib/libweston-16.so.0.0.0 moved to /usr/lib/libweston-16.so.0.0.2
packages/x86-64-v3-poky-linux/weston/weston-dbg: FILELIST: removed "/usr/lib/.debug/libweston-16.so.0.0.0", added "/usr/lib/.debug/libweston-16.so.0.0.2"
packages/x86-64-v3-poky-linux/weston/weston-dbg: PKGV changed from 16.0.0 [default] to 16.0.2 [default]
packages/x86-64-v3-poky-linux/weston/weston-dbg: PKGSIZE changed from 21572736 to 21579168 (+0%)
packages/x86-64-v3-poky-linux/weston/weston-dbg: PV changed from "16.0.0" to "16.0.2"
packages/x86-64-v3-poky-linux/weston/weston-dev: PKGV changed from 16.0.0 [default] to 16.0.2 [default]
packages/x86-64-v3-poky-linux/weston/weston-dev: PKGSIZE changed from 198117 to 198642 (+0%)
packages/x86-64-v3-poky-linux/weston/weston-dev: PV changed from "16.0.0" to "16.0.2"
packages/x86-64-v3-poky-linux/weston/weston-doc: PKGV changed from 16.0.0 [default] to 16.0.2 [default]
packages/x86-64-v3-poky-linux/weston/weston-doc: PV changed from "16.0.0" to "16.0.2"
packages/x86-64-v3-poky-linux/weston/weston-examples: PKGV changed from 16.0.0 [default] to 16.0.2 [default]
packages/x86-64-v3-poky-linux/weston/weston-examples: PV changed from "16.0.0" to "16.0.2"
packages/x86-64-v3-poky-linux/weston/weston-locale: PKGV changed from 16.0.0 [default] to 16.0.2 [default]
packages/x86-64-v3-poky-linux/weston/weston-locale: PV changed from "16.0.0" to "16.0.2"
packages/x86-64-v3-poky-linux/weston/weston-src: FILELIST: directory renamed /usr/src/debug/weston/16.0.0/kiosk-shell -> /usr/src/debug/weston/16.0.2/kiosk-shell, directory renamed /usr/src/debug/weston/16.0.0/libweston/backend-x11 -> /usr/src/debug/weston/16.0.2/libweston/backend-x11, directory renamed /usr/src/debug/weston/16.0.0/libweston/desktop -> /usr/src/debug/weston/16.0.2/libweston/desktop, directory renamed /usr/src/debug/weston/16.0.0/xwayland -> /usr/src/debug/weston/16.0.2/xwayland, directory renamed /usr/src/debug/weston/16.0.0/libweston/renderer-gl -> /usr/src/debug/weston/16.0.2/libweston/renderer-gl, directory renamed /usr/src/debug/weston/16.0.0/clients -> /usr/src/debug/weston/16.0.2/clients, directory renamed /usr/src/debug/weston/16.0.0/include/libweston -> /usr/src/debug/weston/16.0.2/include/libweston, directory renamed /usr/src/debug/weston/16.0.0/frontend -> /usr/src/debug/weston/16.0.2/frontend, directory renamed /usr/src/debug/weston/16.0.0/desktop-shell ->
  /usr/src/debug/weston/16.0.2/desktop-shell, directory renamed /usr/src/debug/weston/16.0.0/libweston/backend-wayland -> /usr/src/debug/weston/16.0.2/libweston/backend-wayland, directory renamed /usr/src/debug/weston/16.0.0/libweston -> /usr/src/debug/weston/16.0.2/libweston, directory renamed /usr/src/debug/weston/16.0.0/libweston/backend-drm -> /usr/src/debug/weston/16.0.2/libweston/backend-drm, directory renamed /usr/src/debug/weston/16.0.0/tests/harness -> /usr/src/debug/weston/16.0.2/tests/harness, directory renamed /usr/src/debug/weston/16.0.0/ivi-shell -> /usr/src/debug/weston/16.0.2/ivi-shell, directory renamed /usr/src/debug/weston/16.0.0/libweston/perfetto -> /usr/src/debug/weston/16.0.2/libweston/perfetto, directory renamed /usr/src/debug/weston/16.0.0/libweston/renderer-vulkan -> /usr/src/debug/weston/16.0.2/libweston/renderer-vulkan, directory renamed /usr/src/debug/weston/16.0.0/shared -> /usr/src/debug/weston/16.0.2/shared, directory renamed /usr/src/debug/weston/16.0
 .0/protocol -> /usr/src/debug/weston/16.0.2/protocol, directory renamed /usr/src/debug/weston/16.0.0/libweston/shell-utils -> /usr/src/debug/weston/16.0.2/libweston/shell-utils
packages/x86-64-v3-poky-linux/weston/weston-src: PKGV changed from 16.0.0 [default] to 16.0.2 [default]
packages/x86-64-v3-poky-linux/weston/weston-src: PKGSIZE changed from 6425744 to 6430084 (+0%)
packages/x86-64-v3-poky-linux/weston/weston-src: PV changed from "16.0.0" to "16.0.2"
packages/x86-64-v3-poky-linux/weston/weston-staticdev: PKGV changed from 16.0.0 [default] to 16.0.2 [default]
packages/x86-64-v3-poky-linux/weston/weston-staticdev: PV changed from "16.0.0" to "16.0.2"
packages/x86-64-v3-poky-linux/weston/weston-xwayland: PKGV changed from 16.0.0 [default] to 16.0.2 [default]
packages/x86-64-v3-poky-linux/weston/weston-xwayland: PV changed from "16.0.0" to "16.0.2"
packages/x86-64-v3-poky-linux/weston/weston: PKGV changed from 16.0.0 [default] to 16.0.2 [default]
packages/x86-64-v3-poky-linux/weston/weston: PV changed from "16.0.0" to "16.0.2"

--===============3146619914007240619==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-weston-upgrade-16.0.0-16.0.2.patch"

RnJvbSBiZGU0MzIyNTI1MzQ0OTUxYjFlMGM3YzIxODEzZmM0MzU2MTgwZDM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjcgT2N0IDIwMjYgMDU6MTg6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
ZXN0b246IHVwZ3JhZGUgMTYuMC4wIC0+IDE2LjAuMgoKLS0tCiAuLi4vd2VzdG9uL0FsbG93LWxp
YmRpc3BsYXktaW5mby0wLjQuMC5wYXRjaCAgfCAyOCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4v
e3dlc3Rvbl8xNi4wLjAuYmIgPT4gd2VzdG9uXzE2LjAuMi5iYn0gICAgfCAgMyArLQogMiBmaWxl
cyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMzAgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAx
MDA2NDQgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uL0FsbG93LWxpYmRpc3Bs
YXktaW5mby0wLjQuMC5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5k
L3t3ZXN0b25fMTYuMC4wLmJiID0+IHdlc3Rvbl8xNi4wLjIuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uL0FsbG93LWxpYmRpc3BsYXkt
aW5mby0wLjQuMC5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbi9B
bGxvdy1saWJkaXNwbGF5LWluZm8tMC40LjAucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDA3ZjM3YjI3N2YuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3dheWxhbmQvd2VzdG9uL0FsbG93LWxpYmRpc3BsYXktaW5mby0wLjQuMC5wYXRjaAorKysgL2Rl
di9udWxsCkBAIC0xLDI4ICswLDAgQEAKLUZyb20gNTRjZDVjMzM1NGM2MTg4MTVhZGRkN2UxZDgy
ZmM2NjI0NzA5OTEzNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFRvbSBQb2xsYXJk
IDx0b20ucG9sbGFyZEBjb2RldGhpbmsuY28udWs+Ci1EYXRlOiBUdWUsIDI4IEp1bCAyMDI2IDEw
OjUxOjI3ICswMTAwCi1TdWJqZWN0OiBbUEFUQ0hdIEFsbG93IGxpYmRpc3BsYXktaW5mbyAwLjQu
MAotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvd2F5bGFuZC93ZXN0b24vLS9jb21taXQvNTRjZDVjMzM1NGM2MTg4MTVhZGRkN2UxZDgy
ZmM2NjI0NzA5OTEzNl0KLQotU2lnbmVkLW9mZi1ieTogVG9tIFBvbGxhcmQgPHRvbS5wb2xsYXJk
QGNvZGV0aGluay5jby51az4KLS0tLQotIG1lc29uLmJ1aWxkIHwgMiArLQotIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvbWVzb24u
YnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggMDNmNGQzMjAxZi4uNDgxNGE4MTU5MiAxMDA2NDQK
LS0tLSBhL21lc29uLmJ1aWxkCi0rKysgYi9tZXNvbi5idWlsZAotQEAgLTE4MCw3ICsxODAsNyBA
QCBlbmRpZgotIAotIGRlcF9saWJkaXNwbGF5X2luZm8gPSBkZXBlbmRlbmN5KAotIAknbGliZGlz
cGxheS1pbmZvJywKLS0JdmVyc2lvbjogWyc+PSAwLjIuMCcsICc8IDAuNC4wJ10sCi0rCXZlcnNp
b246IFsnPj0gMC4yLjAnLCAnPCAwLjUuMCddLAotIAlmYWxsYmFjazogWydkaXNwbGF5LWluZm8n
LCAnZGlfZGVwJ10sCi0gCWRlZmF1bHRfb3B0aW9uczogWwotIAkJJ3dlcnJvcj1mYWxzZScsCi0t
LSAKLUdpdExhYgotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93
ZXN0b25fMTYuMC4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzE2
LjAuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvd2F5bGFuZC93ZXN0b25fMTYuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvd2F5bGFuZC93ZXN0b25fMTYuMC4yLmJiCmluZGV4IDhlNWQ3OWFlYzMuLmU5YjhiMzky
YWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbl8xNi4w
LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzE2LjAuMi5i
YgpAQCAtMTEsMTAgKzExLDkgQEAgU1JDX1VSSSA9ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvd2F5bGFuZC93ZXN0b24vLS9yZWxlYXNlcy8ke1BWfS9kb3dubG8KICAgICAgICAgICAg
ZmlsZTovL3dlc3Rvbi5kZXNrdG9wIFwKICAgICAgICAgICAgZmlsZTovL3h3YXlsYW5kLndlc3Rv
bi1zdGFydCBcCiAgICAgICAgICAgIGZpbGU6Ly9zeXN0ZW1kLW5vdGlmeS53ZXN0b24tc3RhcnQg
XAotICAgICAgICAgICBmaWxlOi8vQWxsb3ctbGliZGlzcGxheS1pbmZvLTAuNC4wLnBhdGNoIFwK
ICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGZiMzJlMmJjY2FiZGE5NTdi
OTRhOGQwZWM2MDc1YWNkMThjNzFjODdlYmM1NDNlZTNlNjE4ZDI5NGNhMGY3ZiIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICI0OWRkODdkMThjYjIyOTM4NDI2NGQyZjY5Y2I1YTUxZjE0ZjYxYTExMWU5
MjI3YmZlZGI5MWIzY2E4YzM5NjQzIgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL3dheWxhbmQvd2VzdG9uLy0vdGFncyIKIFVQU1RSRUFNX0NI
RUNLX1JFR0VYID0gInJlbGVhc2VzLyg/UDxwdmVyPlxkK1wuXGQrXC4oPyE5XGQrKVxkKykiCi0t
IAoyLjQ3LjEKCg==

--===============3146619914007240619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/weston/libweston-16: FILELIST: removed "/usr/lib/libweston-16.so.0.0.0", added "/usr/lib/libweston-16.so.0.0.2"
Changes to packages/x86-64-v3-poky-linux/weston (sysroot):
  /usr/lib/libweston-16.so.0 changed symlink target from libweston-16.so.0.0.0 to libweston-16.so.0.0.2
  /usr/lib/libweston-16.so.0.0.0 moved to /usr/lib/libweston-16.so.0.0.2

--===============3146619914007240619==--
