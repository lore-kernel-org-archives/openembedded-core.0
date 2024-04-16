Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FFF3C52D71
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:18 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.13601.1713248040263053685
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UvpdAcvB;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Kn6W+eEJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018ee58a9b24-848cbf2d-7c9c-45de-bdb7-7750f1e119c9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248050;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Lstayv1BxZptAkV3EwutsZIB5EvAARawRWY0ZpT5d7I=;
	b=UvpdAcvBEydh9S7lWmsK2R+4PBd2H9SxxetrYeHD+TD9R7ZFM25UyayKqX739gbH
	VJanUiShR27kcZ38SlOdiUA36MmcVmpX+MeFg5e1kIgumrVmiPBwYhdK6VcGpayJvZU
	fdQ3CgfpWx3orXdl9ceEm9dBwgkkHtiQXW9U9myM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248050;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Lstayv1BxZptAkV3EwutsZIB5EvAARawRWY0ZpT5d7I=;
	b=Kn6W+eEJtTgkudjWiIr5RpKGvW+06rST6nrNQ75RlWOQyy/5vGTIbjffGDuL+n0a
	ZgL0JOg9Cz7SH3+CZDy9dKh2VvLS88Rb+Bs7YcisxYYXECNcyVb89isYsmWNcSx5Aou
	BcNT6XoSRiluGCM32nZLzVe3TPwCdJUOVNjeyQkk=
Content-Type: multipart/mixed; boundary="===============6686094230896621923=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-protocols: upgrading to 1.34 SUCCEEDED
Message-ID: <0101018ee58a9b24-848cbf2d-7c9c-45de-bdb7-7750f1e119c9-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198367

--===============6686094230896621923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wayland-protocols* to *1.34* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wayland-protocols-upgrade-1.33-1.34.patch
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
From 35b8269db7044b3c46bff15e16d2298b1bd16aa9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 00:08:59 +0000
Subject: [PATCH] wayland-protocols: upgrade 1.33 -> 1.34

---
 .../{wayland-protocols_1.33.bb => wayland-protocols_1.34.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.33.bb => wayland-protocols_1.34.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.34.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.34.bb
index 074ea3663a..8c12985714 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.34.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "94f0c50b090d6e61a03f62048467b19abbe851be4e11ae7b36f65f8b98c3963a"
+SRC_URI[sha256sum] = "c59b27cacd85f60baf4ee5f80df5c0d15760ead6a2432b00ab7e2e0574dcafeb"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 
-- 
2.42.0


--===============6686094230896621923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/share/wayland-protocols/staging/linux-drm-syncobj was added
  /usr/share/wayland-protocols/staging/linux-drm-syncobj/linux-drm-syncobj-v1.xml was added
  /usr/share/wayland-protocols/staging/xdg-dialog was added
  /usr/share/wayland-protocols/staging/xdg-dialog/xdg-dialog-v1.xml was added
  /usr/share/wayland-protocols/staging/xdg-toplevel-drag was added
  /usr/share/wayland-protocols/staging/xdg-toplevel-drag/xdg-toplevel-drag-v1.xml was added
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILELIST: added "/usr/share/wayland-protocols/staging/xdg-dialog/xdg-dialog-v1.xml /usr/share/wayland-protocols/staging/linux-drm-syncobj/linux-drm-syncobj-v1.xml /usr/share/wayland-protocols/staging/xdg-toplevel-drag/xdg-toplevel-drag-v1.xml"

--===============6686094230896621923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wayland-protocols: PV changed from "1.33" to "1.34"
packages/all-poky-linux/wayland-protocols: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.33/downloads/wayland-protocols-1.33.tar.xz" to "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.34/downloads/wayland-protocols-1.34.tar.xz"
packages/all-poky-linux/wayland-protocols: PKGV changed from 1.33 [default] to 1.34 [default]
Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/share/wayland-protocols/staging/linux-drm-syncobj was added
  /usr/share/wayland-protocols/staging/linux-drm-syncobj/linux-drm-syncobj-v1.xml was added
  /usr/share/wayland-protocols/staging/xdg-dialog was added
  /usr/share/wayland-protocols/staging/xdg-dialog/xdg-dialog-v1.xml was added
  /usr/share/wayland-protocols/staging/xdg-toplevel-drag was added
  /usr/share/wayland-protocols/staging/xdg-toplevel-drag/xdg-toplevel-drag-v1.xml was added
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PV changed from "1.33" to "1.34"
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PKGV changed from 1.33 [default] to 1.34 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILELIST: added "/usr/share/wayland-protocols/staging/xdg-dialog/xdg-dialog-v1.xml /usr/share/wayland-protocols/staging/linux-drm-syncobj/linux-drm-syncobj-v1.xml /usr/share/wayland-protocols/staging/xdg-toplevel-drag/xdg-toplevel-drag-v1.xml"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PV changed from "1.33" to "1.34"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGSIZE changed from 572594 to 597232 (+4%)
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGV changed from 1.33 [default] to 1.34 [default]

--===============6686094230896621923==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-protocols-upgrade-1.33-1.34.patch"

RnJvbSAzNWI4MjY5ZGI3MDQ0YjNjNDZiZmYxNWUxNmQyMjk4YjFiZDE2YWE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDA6MDg6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
YXlsYW5kLXByb3RvY29sczogdXBncmFkZSAxLjMzIC0+IDEuMzQKCi0tLQogLi4uL3t3YXlsYW5k
LXByb3RvY29sc18xLjMzLmJiID0+IHdheWxhbmQtcHJvdG9jb2xzXzEuMzQuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQve3dheWxhbmQtcHJvdG9jb2xzXzEuMzMuYmIg
PT4gd2F5bGFuZC1wcm90b2NvbHNfMS4zNC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjMzLmJiIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC1wcm90b2NvbHNfMS4zNC5iYgpzaW1pbGFy
aXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93
YXlsYW5kLXByb3RvY29sc18xLjMzLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
d2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjM0LmJiCmluZGV4IDA3NGVhMzY2M2EuLjhjMTI5
ODU3MTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQt
cHJvdG9jb2xzXzEuMzMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5
bGFuZC1wcm90b2NvbHNfMS4zNC5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jN2IxMmI2NzAyZGEzOGNhMDI4YWNlNTRhYWUzZDQ4NCBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zdGFibGUvcHJlc2VudGF0aW9uLXRpbWUvcHJl
c2VudGF0aW9uLXRpbWUueG1sO2VuZGxpbmU9MjY7bWQ1PTQ2NDZjZDdkOWVkYzlmYTU1ZGI5NDFm
MmQzYTdkYzUzIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93
YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzLy0vcmVsZWFzZXMvJHtQVn0vZG93bmxvYWRzL3dheWxh
bmQtcHJvdG9jb2xzLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5NGYwYzUw
YjA5MGQ2ZTYxYTAzZjYyMDQ4NDY3YjE5YWJiZTg1MWJlNGUxMWFlN2IzNmY2NWY4Yjk4YzM5NjNh
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImM1OWIyN2NhY2Q4NWY2MGJhZjRlZTVmODBkZjVjMGQx
NTc2MGVhZDZhMjQzMmIwMGFiN2UyZTA1NzRkY2FmZWIiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9
ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93YXlsYW5kLXByb3RvY29s
cy8tL3RhZ3MiCiAKLS0gCjIuNDIuMAoK

--===============6686094230896621923==--

