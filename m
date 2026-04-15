Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC81F43848
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:57 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19743.1776261880454230442
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=T3oJ+Y+D;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kaMQcjiF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d917584d1-c2d1bbf2-c7e5-4691-a562-21aa7982675d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261891;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UvFWWGtyVBWVMD8iBqLj4ItbR2Kp8vC4Qhiu5BhIPkg=;
	b=T3oJ+Y+D0AkEreR2BHhzl0TXG3k+/n3N0GgApU/W4ubmB3tOu+RdK6/5mRlA9LK0
	Y8a0fQtq4Fim6+tj065cZWYL8za8UaqEjRwi5fyClGpaW4qzxfJtI8Nb/MaM17p7HDF
	aA0i/WX4hqz/Mj5rf6pzBC675SME7CX8YoL5lxDM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261891;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UvFWWGtyVBWVMD8iBqLj4ItbR2Kp8vC4Qhiu5BhIPkg=;
	b=kaMQcjiFC5fwuciDVW4hMCCrkw6BpfjuiLSn2j8UYK4YH7RRR5Mk9L9A0tIMp6Rt
	57uaw24KJYd2mPQsQdqCnSFvHNy4uZ/+4Pv8et9OOY3lrkHhy0xgYNPfCF51cjwgBRO
	dXB38IbMux5ay40U/rchvSV3o0eM6a+XBoeynWdQ=
Content-Type: multipart/mixed; boundary="===============3026476001280407522=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-protocols: upgrading to 1.48 SUCCEEDED
Message-ID: <0101019d917584d1-c2d1bbf2-c7e5-4691-a562-21aa7982675d-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235283

--===============3026476001280407522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wayland-protocols* to *1.48* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wayland-protocols-upgrade-1.47-1.48.patch
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
From a2c3e4bb2f1dc65fd435dd74a8daae4cd9599815 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 12:22:33 +0000
Subject: [PATCH] wayland-protocols: upgrade 1.47 -> 1.48

---
 .../{wayland-protocols_1.47.bb => wayland-protocols_1.48.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.47.bb => wayland-protocols_1.48.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.47.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.48.bb
index e19045fed0..c6b5da44ba 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5fd4349bcbc9bab9a46f8cf77d1f434296a7a052c87440a094f63fcf62a58e20"
+SRC_URI[sha256sum] = "398036ac0eb6484982ddbde7ff86848d753231f9cdeeae983f06b52946625aa1"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.47.1


--===============3026476001280407522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/include/wayland-protocols/xdg-session-management-v1-enum.h was added
  /usr/include/wayland-protocols/xx-cutouts-v1-enum.h was added
  /usr/include/wayland-protocols/xx-keyboard-filter-v1-enum.h was added
  /usr/include/wayland-protocols/xx-zones-v1-enum.h was added
  /usr/share/wayland-protocols/staging/xdg-session-management was added
  /usr/share/wayland-protocols/staging/xdg-session-management/xdg-session-management-v1.xml was added
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: FILELIST: added "/usr/include/wayland-protocols/xdg-session-management-v1-enum.h /usr/include/wayland-protocols/xx-zones-v1-enum.h /usr/include/wayland-protocols/xx-cutouts-v1-enum.h /usr/include/wayland-protocols/xx-keyboard-filter-v1-enum.h"
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILELIST: added "/usr/share/wayland-protocols/staging/xdg-session-management/xdg-session-management-v1.xml"

--===============3026476001280407522==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-protocols-upgrade-1.47-1.48.patch"

RnJvbSBhMmMzZTRiYjJmMWRjNjVmZDQzNWRkNzRhOGRhYWU0Y2Q5NTk5ODE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTI6MjI6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
YXlsYW5kLXByb3RvY29sczogdXBncmFkZSAxLjQ3IC0+IDEuNDgKCi0tLQogLi4uL3t3YXlsYW5k
LXByb3RvY29sc18xLjQ3LmJiID0+IHdheWxhbmQtcHJvdG9jb2xzXzEuNDguYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQve3dheWxhbmQtcHJvdG9jb2xzXzEuNDcuYmIg
PT4gd2F5bGFuZC1wcm90b2NvbHNfMS40OC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjQ3LmJiIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC1wcm90b2NvbHNfMS40OC5iYgpzaW1pbGFy
aXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93
YXlsYW5kLXByb3RvY29sc18xLjQ3LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
d2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjQ4LmJiCmluZGV4IGUxOTA0NWZlZDAuLmM2YjVk
YTQ0YmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQt
cHJvdG9jb2xzXzEuNDcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5
bGFuZC1wcm90b2NvbHNfMS40OC5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jN2IxMmI2NzAyZGEzOGNhMDI4YWNlNTRhYWUzZDQ4NCBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zdGFibGUvcHJlc2VudGF0aW9uLXRpbWUvcHJl
c2VudGF0aW9uLXRpbWUueG1sO2VuZGxpbmU9MjY7bWQ1PTQ2NDZjZDdkOWVkYzlmYTU1ZGI5NDFm
MmQzYTdkYzUzIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93
YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzLy0vcmVsZWFzZXMvJHtQVn0vZG93bmxvYWRzL3dheWxh
bmQtcHJvdG9jb2xzLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1ZmQ0MzQ5
YmNiYzliYWI5YTQ2ZjhjZjc3ZDFmNDM0Mjk2YTdhMDUyYzg3NDQwYTA5NGY2M2ZjZjYyYTU4ZTIw
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM5ODAzNmFjMGViNjQ4NDk4MmRkYmRlN2ZmODY4NDhk
NzUzMjMxZjljZGVlYWU5ODNmMDZiNTI5NDY2MjVhYTEiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9
ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93YXlsYW5kLXByb3RvY29s
cy8tL3RhZ3MiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy8oP1A8cHZlcj4uKyki
Ci0tIAoyLjQ3LjEKCg==

--===============3026476001280407522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wayland-protocols: PV changed from "1.47" to "1.48"
packages/all-poky-linux/wayland-protocols: PKGV changed from 1.47 [default] to 1.48 [default]
packages/all-poky-linux/wayland-protocols: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.47/downloads/wayland-protocols-1.47.tar.xz" to "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.48/downloads/wayland-protocols-1.48.tar.xz"
Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/include/wayland-protocols/xdg-session-management-v1-enum.h was added
  /usr/include/wayland-protocols/xx-cutouts-v1-enum.h was added
  /usr/include/wayland-protocols/xx-keyboard-filter-v1-enum.h was added
  /usr/include/wayland-protocols/xx-zones-v1-enum.h was added
  /usr/share/wayland-protocols/staging/xdg-session-management was added
  /usr/share/wayland-protocols/staging/xdg-session-management/xdg-session-management-v1.xml was added
packages/all-poky-linux/wayland-protocols/wayland-protocols-dbg: PV changed from "1.47" to "1.48"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dbg: PKGV changed from 1.47 [default] to 1.48 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PV changed from "1.47" to "1.48"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PKGSIZE changed from 135988 to 147610 (+9%)
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: FILELIST: added "/usr/include/wayland-protocols/xx-zones-v1-enum.h /usr/include/wayland-protocols/xdg-session-management-v1-enum.h /usr/include/wayland-protocols/xx-cutouts-v1-enum.h /usr/include/wayland-protocols/xx-keyboard-filter-v1-enum.h"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PKGV changed from 1.47 [default] to 1.48 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-doc: PV changed from "1.47" to "1.48"
packages/all-poky-linux/wayland-protocols/wayland-protocols-doc: PKGV changed from 1.47 [default] to 1.48 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-locale: PV changed from "1.47" to "1.48"
packages/all-poky-linux/wayland-protocols/wayland-protocols-locale: PKGV changed from 1.47 [default] to 1.48 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PV changed from "1.47" to "1.48"
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PKGV changed from 1.47 [default] to 1.48 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: PV changed from "1.47" to "1.48"
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: PKGV changed from 1.47 [default] to 1.48 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: PV changed from "1.47" to "1.48"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGSIZE changed from 853052 to 877380 (+3%)
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILELIST: added "/usr/share/wayland-protocols/staging/xdg-session-management/xdg-session-management-v1.xml"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGV changed from 1.47 [default] to 1.48 [default]

--===============3026476001280407522==--

