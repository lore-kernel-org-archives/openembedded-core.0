Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5929.1794551762185320423
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 22:36:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EvQsIRoL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wYjzjEkH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a1d39ec9bd-b336282a-1217-4854-9839-178d3565b59e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794551761;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=kv7SRyQ7jgz2Zu++7eBCWjHIk85NnJO0gGD9DVkjsjA=;
	b=EvQsIRoLs/IlGddffopZ4G/SgkDX0OTBo5vskmUlDQMnrdaXEetIzTOhm+0Hwohp
	8HKr3KZp1wO+9oO+LNMzcAgvu1/OBEB7JMJ1BLAWT0A2ZwFWEgKQI1i7+/f/mg3vhhj
	mjNEempgif67LswhscKHmY1EIwVBAatfumSTooZ0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794551761;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=kv7SRyQ7jgz2Zu++7eBCWjHIk85NnJO0gGD9DVkjsjA=;
	b=wYjzjEkHRsXaHGG0WaWZ2ussW/rgCVD4XAnXPj91gtqOAKyyVqFa/xjHWb58xIKc
	USqyFTshEiDdhR8nYNw+SvMx7pNteIjeEzeVYpXoV+p6p2D6f+I3zKWRnw5NhRShO1a
	l5oaDm+RCBIo6ro+3xFW0MhTtTCVUzOJ1xcFQfU0=
Content-Type: multipart/mixed; boundary="===============5482513742842958928=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] p11-kit: upgrading to 0.26.6 SUCCEEDED
Message-ID: <010101a1d39ec9bd-b336282a-1217-4854-9839-178d3565b59e-000000@us-west-2.amazonses.com>
Date: Fri, 13 Nov 2026 06:36:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.13-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250149

--===============5482513742842958928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *p11-kit* to *0.26.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-p11-kit-upgrade-0.26.5-0.26.6.patch
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
From 001846b76ae12c961c7a6093dfca0a03af8de007 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 13 Nov 2026 06:35:52 +0000
Subject: [PATCH] p11-kit: upgrade 0.26.5 -> 0.26.6

0.26.6 (stable)
---
 .../p11-kit/{p11-kit_0.26.5.bb => p11-kit_0.26.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.26.5.bb => p11-kit_0.26.6.bb} (97%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb b/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb
similarity index 97%
rename from meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.26.6.bb
index 722f2d876e..18430f0a74 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb
@@ -11,7 +11,7 @@ DEPENDS = "libffi"
 DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=${PV}"
-SRCREV = "120050e353e8f43d7c40bbcc047f667f903f4de5"
+SRCREV = "f9813f90a51761dc75b5dcd8d9766466b8904f5c"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} trust"
 PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
-- 
2.47.1


--===============5482513742842958928==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-p11-kit-upgrade-0.26.5-0.26.6.patch"

RnJvbSAwMDE4NDZiNzZhZTEyYzk2MWM3YTYwOTNkZmNhMGEwM2FmOGRlMDA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTMgTm92IDIwMjYgMDY6MzU6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
MTEta2l0OiB1cGdyYWRlIDAuMjYuNSAtPiAwLjI2LjYKCjAuMjYuNiAoc3RhYmxlKQotLS0KIC4u
Li9wMTEta2l0L3twMTEta2l0XzAuMjYuNS5iYiA9PiBwMTEta2l0XzAuMjYuNi5iYn0gICAgICAg
ICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQve3AxMS1raXRfMC4yNi41LmJi
ID0+IHAxMS1raXRfMC4yNi42LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L3AxMS1raXQvcDExLWtpdF8wLjI2LjUuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9w
MTEta2l0L3AxMS1raXRfMC4yNi42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQvcDExLWtpdF8wLjI2LjUuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQvcDExLWtpdF8wLjI2LjYuYmIKaW5kZXggNzIy
ZjJkODc2ZS4uMTg0MzBmMGE3NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDEx
LWtpdC9wMTEta2l0XzAuMjYuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9wMTEta2l0
L3AxMS1raXRfMC4yNi42LmJiCkBAIC0xMSw3ICsxMSw3IEBAIERFUEVORFMgPSAibGliZmZpIgog
REVQRU5EUzphcHBlbmQgPSAiJHtAJyBnbGliLTIuMCcgaWYgZC5nZXRWYXIoJ0dUS0RPQ19FTkFC
TEVEJykgPT0gJ1RydWUnIGVsc2UgJyd9IgogCiBTUkNfVVJJID0gImdpdHNtOi8vZ2l0aHViLmNv
bS9wMTEtZ2x1ZS9wMTEta2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHM7dGFnPSR7UFZ9
IgotU1JDUkVWID0gIjEyMDA1MGUzNTNlOGY0M2Q3YzQwYmJjYzA0N2Y2NjdmOTAzZjRkZTUiCitT
UkNSRVYgPSAiZjk4MTNmOTBhNTE3NjFkYzc1YjVkY2Q4ZDk3NjY0NjZiODkwNGY1YyIKIAogUEFD
S0FHRUNPTkZJRyA/Pz0gIiR7QGJiLnV0aWxzLmZpbHRlcignRElTVFJPX0ZFQVRVUkVTJywgJ3N5
c3RlbWQnLCBkKX0gdHJ1c3QiCiBQQUNLQUdFQ09ORklHW3N5c3RlbWRdID0gIi1Ec3lzdGVtZD1l
bmFibGVkLC1Ec3lzdGVtZD1kaXNhYmxlZCxzeXN0ZW1kIgotLSAKMi40Ny4xCgo=

--===============5482513742842958928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: FILES: removed "/lib/*.la /lib/*.o /lib/lib*.so"
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILES: removed "/bin/* /lib/*.so.* /sbin/*", added "/usr/lib/*.so.*"
packages/x86-64-v3-poky-linux/p11-kit: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit: SRC_URI changed from "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=0.26.5" to "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-bash-completion: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-bash-completion: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-bin: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-bin: PKGSIZE changed from 567273 to 571369 (+1%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-bin: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dbg: FILELIST: removed "/usr/lib/.debug/libp11-kit.so.0.4.11", added "/usr/lib/.debug/libp11-kit.so.0.4.12"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dbg: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dbg: PKGSIZE changed from 18068904 to 18302552 (+1%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dbg: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dev: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dev: PKGSIZE changed from 189716 to 189788 (+0%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dev: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-doc: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-doc: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ar: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ar: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-as: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-as: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ast: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ast: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-az: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-az: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-bg: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-bg: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-bn-in: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-bn-in: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ca+valencia: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ca+valencia: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ca: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ca: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-cs: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-cs: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-cy: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-cy: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-da: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-da: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-de: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-de: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-el: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-el: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-en-gb: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-en-gb: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-eo: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-eo: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-es: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-es: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-et: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-et: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-eu: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-eu: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fa: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fa: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fi: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fi: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fo: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fo: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fr: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fr: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fur: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fur: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ga: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ga: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-gl: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-gl: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-gu: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-gu: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-he: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-he: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hi: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hi: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hr: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hr: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hu: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hu: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ia: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ia: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-id: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-id: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-it: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-it: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ja: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ja: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ka: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ka: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-kk: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-kk: PKGSIZE changed from 38299 to 50583 (+32%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-kk: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-kn: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-kn: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ko: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ko: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-lt: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-lt: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-lv: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-lv: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ml: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ml: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-mr: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-mr: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ms: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ms: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nb: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nb: PKGSIZE changed from 473 to 38623 (+8066%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nb: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nl: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nl: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nn: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nn: PKGSIZE changed from 473 to 38854 (+8114%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nn: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-oc: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-oc: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-or: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-or: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pa: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pa: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pl: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pl: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pt-br: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pt-br: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pt: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pt: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ro: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ro: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ru: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ru: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-si: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-si: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sk: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sk: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sl: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sl: PKGSIZE changed from 38344 to 39218 (+2%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sl: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sq: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sq: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sr+latin: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sr+latin: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sr: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sr: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sv: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sv: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ta: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ta: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-te: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-te: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-th: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-th: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-tr: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-tr: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-uk: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-uk: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-vi: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-vi: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-wa: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-wa: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-cn: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-cn: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-hk: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-hk: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-tw: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-tw: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-modules: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-modules: PKGSIZE changed from 1833365 to 1869653 (+2%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-modules: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-remote: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-remote: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-src: FILELIST: directory renamed /usr/src/debug/p11-kit/0.26.5/common -> /usr/src/debug/p11-kit/0.26.6/common, directory renamed /usr/src/debug/p11-kit/0.26.5/trust -> /usr/src/debug/p11-kit/0.26.6/trust, removed "/usr/src/debug/p11-kit/0.26.5/p11-kit/util.c /usr/src/debug/p11-kit/0.26.5/p11-kit/uri.h /usr/src/debug/p11-kit/0.26.5/p11-kit/proxy-init.c /usr/src/debug/p11-kit/0.26.5/p11-kit/list-tokens.c /usr/src/debug/p11-kit/0.26.5/p11-kit/log.c /usr/src/debug/p11-kit/0.26.5/p11-kit/uri.c /usr/src/debug/p11-kit/0.26.5/p11-kit/log.h /usr/src/debug/p11-kit/0.26.5/p11-kit/add-profile.c /usr/src/debug/p11-kit/0.26.5/p11-kit/list-profiles.c /usr/src/debug/p11-kit/0.26.5/p11-kit/private.h /usr/src/debug/p11-kit/0.26.5/p11-kit/virtual-fixed-closures.h /usr/src/debug/p11-kit/0.26.5/p11-kit/proxy.h /usr/src/debug/p11-kit/0.26.5/p11-kit/proxy.c /usr/src/debug/p11-kit/0.26.5/p11-kit/virtual-ffi-generated.h /usr/src/debug/p11-kit/0.26.5/p11-kit/delet
 e-profile.c /usr/src/debug/p11-kit/0.26.5/p11-kit/pin.c /usr/src/debug/p11-kit/0.26.5/p11-kit/virtual-base-generated.h /usr/src/debug/p11-kit/0.26.5/p11-kit/import-object.c /usr/src/debug/p11-kit/0.26.5/p11-kit/rpc-transport.c /usr/src/debug/p11-kit/0.26.5/p11-kit/tool.c /usr/src/debug/p11-kit/0.26.5/p11-kit/pin.h /usr/src/debug/p11-kit/0.26.5/p11-kit/tool.h /usr/src/debug/p11-kit/0.26.5/p11-kit/virtual-stack-generated.h /usr/src/debug/p11-kit/0.26.5/p11-kit/client-init.c /usr/src/debug/p11-kit/0.26.5/p11-kit/rpc-client.c /usr/src/debug/p11-kit/0.26.5/p11-kit/rpc-server.c /usr/src/debug/p11-kit/0.26.5/p11-kit/client.c /usr/src/debug/p11-kit/0.26.5/p11-kit/client.h /usr/src/debug/p11-kit/0.26.5/p11-kit/lists.c /usr/src/debug/p11-kit/0.26.5/p11-kit/generate-keypair.c /usr/src/debug/p11-kit/0.26.5/p11-kit/filter.c /usr/src/debug/p11-kit/0.26.5/p11-kit/iter.h /usr/src/debug/p11-kit/0.26.5/p11-kit/print-config.c /usr/src/debug/p11-kit/0.26.5/p11-kit/tty.h /usr/src/debug/p11-kit/0.26.5/p1
 1-kit/virtual.h /usr/src/debug/p11-kit/0.26.5/p11-kit/list-objects.c /usr/src/debug/p11-kit/0.26.5/p11-kit/list-mechanisms.c /usr/src/debug/p11-kit/0.26.5/p11-kit/tty.c /usr/src/debug/p11-kit/0.26.5/p11-kit/iter.c /usr/src/debug/p11-kit/0.26.5/p11-kit/filter.h /usr/src/debug/p11-kit/0.26.5/p11-kit/virtual.c /usr/src/debug/p11-kit/0.26.5/p11-kit/messages.c /usr/src/debug/p11-kit/0.26.5/p11-kit/p11-kit.c /usr/src/debug/p11-kit/0.26.5/p11-kit/rpc-message.h /usr/src/debug/p11-kit/0.26.5/p11-kit/modules.h /usr/src/debug/p11-kit/0.26.5/p11-kit/delete-object.c /usr/src/debug/p11-kit/0.26.5/p11-kit/rpc-message.c /usr/src/debug/p11-kit/0.26.5/p11-kit/p11-kit.h /usr/src/debug/p11-kit/0.26.5/p11-kit/rpc.h /usr/src/debug/p11-kit/0.26.5/p11-kit/modules.c /usr/src/debug/p11-kit/0.26.5/p11-kit/conf.h /usr/src/debug/p11-kit/0.26.5/p11-kit/server.c /usr/src/debug/p11-kit/0.26.5/p11-kit/proxy-generated.h /usr/src/debug/p11-kit/0.26.5/p11-kit/remote.h /usr/src/debug/p11-kit/0.26.5/p11-kit/export-objec
 t.c /usr/src/debug/p11-kit/0.26.5/p11-kit/conf.c /usr/src/debug/p11-kit/0.26.5/p11-kit/remote.c", added "/usr/src/debug/p11-kit/0.26.6/p11-kit/util.c /usr/src/debug/p11-kit/0.26.6/p11-kit/uri.h /usr/src/debug/p11-kit/0.26.6/p11-kit/proxy-init.c /usr/src/debug/p11-kit/0.26.6/p11-kit/list-tokens.c /usr/src/debug/p11-kit/0.26.6/p11-kit/log.c /usr/src/debug/p11-kit/0.26.6/p11-kit/uri.c /usr/src/debug/p11-kit/0.26.6/p11-kit/log.h /usr/src/debug/p11-kit/0.26.6/p11-kit/add-profile.c /usr/src/debug/p11-kit/0.26.6/p11-kit/list-profiles.c /usr/src/debug/p11-kit/0.26.6/p11-kit/private.h /usr/src/debug/p11-kit/0.26.6/p11-kit/virtual-fixed-closures.h /usr/src/debug/p11-kit/0.26.6/p11-kit/proxy.h /usr/src/debug/p11-kit/0.26.6/p11-kit/proxy.c /usr/src/debug/p11-kit/0.26.6/p11-kit/virtual-ffi-generated.h /usr/src/debug/p11-kit/0.26.6/p11-kit/delete-profile.c /usr/src/debug/p11-kit/0.26.6/p11-kit/pin.c /usr/src/debug/p11-kit/0.26.6/p11-kit/virtual-base-generated.h /usr/src/debug/p11-kit/0.26.6/p11-k
 it/import-object.c /usr/src/debug/p11-kit/0.26.6/p11-kit/rpc-transport.c /usr/src/debug/p11-kit/0.26.6/p11-kit/tool.c /usr/src/debug/p11-kit/0.26.6/p11-kit/pin.h /usr/src/debug/p11-kit/0.26.6/p11-kit/tool.h /usr/src/debug/p11-kit/0.26.6/p11-kit/virtual-stack-generated.h /usr/src/debug/p11-kit/0.26.6/p11-kit/client-init.c /usr/src/debug/p11-kit/0.26.6/p11-kit/rpc-client.c /usr/src/debug/p11-kit/0.26.6/p11-kit/rpc-server.c /usr/src/debug/p11-kit/0.26.6/p11-kit/client.c /usr/src/debug/p11-kit/0.26.6/p11-kit/client.h /usr/src/debug/p11-kit/0.26.6/p11-kit/lists.c /usr/src/debug/p11-kit/0.26.6/p11-kit/generate-keypair.c /usr/src/debug/p11-kit/0.26.6/p11-kit/filter.c /usr/src/debug/p11-kit/0.26.6/p11-kit/iter.h /usr/src/debug/p11-kit/0.26.6/p11-kit/print-config.c /usr/src/debug/p11-kit/0.26.6/p11-kit/rpc-attribute.c /usr/src/debug/p11-kit/0.26.6/p11-kit/tty.h /usr/src/debug/p11-kit/0.26.6/p11-kit/virtual.h /usr/src/debug/p11-kit/0.26.6/p11-kit/list-objects.c /usr/src/debug/p11-kit/0.26.6/p
 11-kit/list-mechanisms.c /usr/src/debug/p11-kit/0.26.6/p11-kit/rpc-attribute.h /usr/src/debug/p11-kit/0.26.6/p11-kit/iter.c /usr/src/debug/p11-kit/0.26.6/p11-kit/filter.h /usr/src/debug/p11-kit/0.26.6/p11-kit/tty.c /usr/src/debug/p11-kit/0.26.6/p11-kit/messages.c /usr/src/debug/p11-kit/0.26.6/p11-kit/virtual.c /usr/src/debug/p11-kit/0.26.6/p11-kit/p11-kit.c /usr/src/debug/p11-kit/0.26.6/p11-kit/rpc-message.h /usr/src/debug/p11-kit/0.26.6/p11-kit/modules.h /usr/src/debug/p11-kit/0.26.6/p11-kit/delete-object.c /usr/src/debug/p11-kit/0.26.6/p11-kit/rpc-message.c /usr/src/debug/p11-kit/0.26.6/p11-kit/p11-kit.h /usr/src/debug/p11-kit/0.26.6/p11-kit/rpc.h /usr/src/debug/p11-kit/0.26.6/p11-kit/modules.c /usr/src/debug/p11-kit/0.26.6/p11-kit/conf.h /usr/src/debug/p11-kit/0.26.6/p11-kit/server.c /usr/src/debug/p11-kit/0.26.6/p11-kit/rpc-mechanism.c /usr/src/debug/p11-kit/0.26.6/p11-kit/proxy-generated.h /usr/src/debug/p11-kit/0.26.6/p11-kit/remote.h /usr/src/debug/p11-kit/0.26.6/p11-kit/rpc-
 mechanism.h /usr/src/debug/p11-kit/0.26.6/p11-kit/export-object.c /usr/src/debug/p11-kit/0.26.6/p11-kit/conf.c /usr/src/debug/p11-kit/0.26.6/p11-kit/remote.c"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-src: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-src: PKGSIZE changed from 2039004 to 2160752 (+6%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-src: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-staticdev: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-staticdev: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit: FILELIST: removed "/usr/lib/libp11-kit.so.0.4.11", added "/usr/lib/libp11-kit.so.0.4.12"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit: PV changed from "0.26.5" to "0.26.6"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit: PKGSIZE changed from 1893098 to 1949866 (+3%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit: PKGV changed from 0.26.5 [default] to 0.26.6 [default]
Changes to packages/x86-64-v3-poky-linux/p11-kit (sysroot):
  /usr/lib/libp11-kit.so.0 changed symlink target from libp11-kit.so.0.4.11 to libp11-kit.so.0.4.12
  /usr/lib/libp11-kit.so.0.4.11 moved to /usr/lib/libp11-kit.so.0.4.12
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/p11-kit-native (sysroot):
  /usr/lib/libp11-kit.so.0 changed symlink target from libp11-kit.so.0.4.11 to libp11-kit.so.0.4.12
  /usr/lib/libp11-kit.so.0.4.11 moved to /usr/lib/libp11-kit.so.0.4.12

--===============5482513742842958928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="p11-kit-changelog.txt"

0.26.6 (stable)

--===============5482513742842958928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-kk: PKGSIZE changed from 38299 to 50583 (+32%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nb: PKGSIZE changed from 473 to 38623 (+8066%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nn: PKGSIZE changed from 473 to 38854 (+8114%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit: FILELIST: removed "/usr/lib/libp11-kit.so.0.4.11", added "/usr/lib/libp11-kit.so.0.4.12"
Changes to packages/x86-64-v3-poky-linux/p11-kit (sysroot):
  /usr/lib/libp11-kit.so.0 changed symlink target from libp11-kit.so.0.4.11 to libp11-kit.so.0.4.12
  /usr/lib/libp11-kit.so.0.4.11 moved to /usr/lib/libp11-kit.so.0.4.12
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/p11-kit-native (sysroot):
  /usr/lib/libp11-kit.so.0 changed symlink target from libp11-kit.so.0.4.11 to libp11-kit.so.0.4.12
  /usr/lib/libp11-kit.so.0.4.11 moved to /usr/lib/libp11-kit.so.0.4.12

--===============5482513742842958928==--
