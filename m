Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE80C5B55A
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:08 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.131415.1723748333645538745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=S48Qi2c6;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=tn1mBHnp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010191576835b2-87ae2bd5-3c03-480d-b93f-bad648a30d5e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NiDzTTG6aDXAYRJZv9Urvoo1HTByU/DoFM+wQgRf6C0=;
	b=S48Qi2c6ZDKl22UyXTAPPd4AzBo5+TigbBErfhVMtvCBZRX1IGekGIEBsOiGp3EY
	U22X2e39WQIpxMfMMm6+A2k19CCsYxEtcAd20MnYJJboVouJGnVIntyuzZRREmKgN65
	ZM7aLh0Z+LF4j2ZAbW6DhAOwptoDzuLWGmYwmQu8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NiDzTTG6aDXAYRJZv9Urvoo1HTByU/DoFM+wQgRf6C0=;
	b=tn1mBHnp68f3a2gopB3y+X5nxnqqA2XWGgDQsoYr5qQbsMpB3n1BstZQj5/miPYh
	ugxt/XJKOS2EVcS4yUfjKigiOshEwvbQwCqsz4NnUPjXl05xB7qJyzH/kIsSxZkeiaw
	TlsOe7nyoWTOBjzvbFXoWlRYDAZCo/yOxemTvYB0=
Content-Type: multipart/mixed; boundary="===============8674893815536407711=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 13.0.3 SUCCEEDED
Message-ID: <01010191576835b2-87ae2bd5-3c03-480d-b93f-bad648a30d5e-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203343

--===============8674893815536407711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *weston* to *13.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-weston-upgrade-13.0.1-13.0.3.patch
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
From e8ec90ad78d0c0909e849c24e0291b9badbc122c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 08:09:45 +0000
Subject: [PATCH] weston: upgrade 13.0.1 -> 13.0.3

---
 ...1-libweston-tools-Include-libgen.h-for-basename-signat.patch | 2 +-
 .../wayland/{weston_13.0.1.bb => weston_13.0.3.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_13.0.1.bb => weston_13.0.3.bb} (98%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
index fbec9f9d4e..2a833ee973 100644
--- a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
@@ -1,4 +1,4 @@
-From e050830898ea37d30ef1c5339cb1665bdb92dcdc Mon Sep 17 00:00:00 2001
+From 1a2a87013eb6af8e5267ecaf61e17b65a31dc662 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 14 Dec 2023 09:13:54 -0800
 Subject: [PATCH] libweston,tools: Include libgen.h for basename signature
diff --git a/meta/recipes-graphics/wayland/weston_13.0.1.bb b/meta/recipes-graphics/wayland/weston_13.0.3.bb
similarity index 98%
rename from meta/recipes-graphics/wayland/weston_13.0.1.bb
rename to meta/recipes-graphics/wayland/weston_13.0.3.bb
index eae13e1c21..e4843d38f7 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.3.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "ea1566ab4f5ffce7e9fd4f7a1fca5b30caae4d50023bf459213994094e02b29a"
+SRC_URI[sha256sum] = "27f68d96e3b97d98daadef13a202356524924fa381418fa6716b9136ef099093"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.44.0


--===============8674893815536407711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/weston/libweston-13: FILELIST: removed "/usr/lib/libweston-13.so.0.0.1", added "/usr/lib/libweston-13.so.0.0.3"
Changes to packages/core2-64-poky-linux/weston (sysroot):
  /usr/lib/libweston-13.so.0 changed symlink target from libweston-13.so.0.0.1 to libweston-13.so.0.0.3
  /usr/lib/libweston-13.so.0.0.1 moved to /usr/lib/libweston-13.so.0.0.3

--===============8674893815536407711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/weston: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/weston/-/releases/13.0.1/downloads/weston-13.0.1.tar.xz file://0001-libweston-tools-Include-libgen.h-for-basename-signat.patch file://weston.png file://weston.desktop file://xwayland.weston-start file://systemd-notify.weston-start" to "https://gitlab.freedesktop.org/wayland/weston/-/releases/13.0.3/downloads/weston-13.0.3.tar.xz file://0001-libweston-tools-Include-libgen.h-for-basename-signat.patch file://weston.png file://weston.desktop file://xwayland.weston-start file://systemd-notify.weston-start"
packages/core2-64-poky-linux/weston: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/libweston-13: FILELIST: removed "/usr/lib/libweston-13.so.0.0.1", added "/usr/lib/libweston-13.so.0.0.3"
packages/core2-64-poky-linux/weston/libweston-13: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/libweston-13: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
Changes to packages/core2-64-poky-linux/weston (sysroot):
  /usr/lib/libweston-13.so.0 changed symlink target from libweston-13.so.0.0.1 to libweston-13.so.0.0.3
  /usr/lib/libweston-13.so.0.0.1 moved to /usr/lib/libweston-13.so.0.0.3
packages/core2-64-poky-linux/weston/weston-dbg: FILELIST: removed "/usr/lib/.debug/libweston-13.so.0.0.1", added "/usr/lib/.debug/libweston-13.so.0.0.3"
packages/core2-64-poky-linux/weston/weston-dbg: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-dbg: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-dev: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-dev: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-doc: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-doc: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-examples: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-examples: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-locale: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-locale: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-src: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-src: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-staticdev: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-staticdev: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-xwayland: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-xwayland: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston: PKGV changed from 13.0.1 [default] to 13.0.3 [default]

--===============8674893815536407711==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-weston-upgrade-13.0.1-13.0.3.patch"

RnJvbSBlOGVjOTBhZDc4ZDBjMDkwOWU4NDljMjRlMDI5MWI5YmFkYmMxMjJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMDg6MDk6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
ZXN0b246IHVwZ3JhZGUgMTMuMC4xIC0+IDEzLjAuMwoKLS0tCiAuLi4xLWxpYndlc3Rvbi10b29s
cy1JbmNsdWRlLWxpYmdlbi5oLWZvci1iYXNlbmFtZS1zaWduYXQucGF0Y2ggfCAyICstCiAuLi4v
d2F5bGFuZC97d2VzdG9uXzEzLjAuMS5iYiA9PiB3ZXN0b25fMTMuMC4zLmJifSAgICAgICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC97d2VzdG9uXzEzLjAuMS5i
YiA9PiB3ZXN0b25fMTMuMC4zLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy93YXlsYW5kL3dlc3Rvbi8wMDAxLWxpYndlc3Rvbi10b29scy1JbmNsdWRlLWxpYmdl
bi5oLWZvci1iYXNlbmFtZS1zaWduYXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5
bGFuZC93ZXN0b24vMDAwMS1saWJ3ZXN0b24tdG9vbHMtSW5jbHVkZS1saWJnZW4uaC1mb3ItYmFz
ZW5hbWUtc2lnbmF0LnBhdGNoCmluZGV4IGZiZWM5ZjlkNGUuLjJhODMzZWU5NzMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbi8wMDAxLWxpYndlc3Rvbi10
b29scy1JbmNsdWRlLWxpYmdlbi5oLWZvci1iYXNlbmFtZS1zaWduYXQucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uLzAwMDEtbGlid2VzdG9uLXRvb2xzLUlu
Y2x1ZGUtbGliZ2VuLmgtZm9yLWJhc2VuYW1lLXNpZ25hdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gZTA1MDgzMDg5OGVhMzdkMzBlZjFjNTMzOWNiMTY2NWJkYjkyZGNkYyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWEyYTg3MDEzZWI2YWY4ZTUyNjdlY2FmNjFlMTdiNjVhMzFk
YzY2MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+CiBEYXRlOiBUaHUsIDE0IERlYyAyMDIzIDA5OjEzOjU0IC0wODAwCiBTdWJqZWN0
OiBbUEFUQ0hdIGxpYndlc3Rvbix0b29sczogSW5jbHVkZSBsaWJnZW4uaCBmb3IgYmFzZW5hbWUg
c2lnbmF0dXJlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0
b25fMTMuMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzEzLjAu
My5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3Mvd2F5bGFuZC93ZXN0b25fMTMuMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3Mvd2F5bGFuZC93ZXN0b25fMTMuMC4zLmJiCmluZGV4IGVhZTEzZTFjMjEuLmU0ODQzZDM4Zjcg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbl8xMy4wLjEu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzEzLjAuMy5iYgpA
QCAtMTQsNyArMTQsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy93YXlsYW5kL3dlc3Rvbi8tL3JlbGVhc2VzLyR7UFZ9L2Rvd25sbwogICAgICAgICAgICBmaWxl
Oi8vc3lzdGVtZC1ub3RpZnkud2VzdG9uLXN0YXJ0IFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiZWExNTY2YWI0ZjVmZmNlN2U5ZmQ0ZjdhMWZjYTViMzBjYWFlNGQ1MDAy
M2JmNDU5MjEzOTk0MDk0ZTAyYjI5YSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyN2Y2OGQ5NmUz
Yjk3ZDk4ZGFhZGVmMTNhMjAyMzU2NTI0OTI0ZmEzODE0MThmYTY3MTZiOTEzNmVmMDk5MDkzIgog
CiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3dh
eWxhbmQvd2VzdG9uLy0vdGFncyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2VzLyg/
UDxwdmVyPlxkK1wuXGQrXC4oPyE5XGQrKVxkKykiCi0tIAoyLjQ0LjAKCg==

--===============8674893815536407711==--

