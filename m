Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D88CD12D5
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:30 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.2027.1711994603886047800
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fy891ffi;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=qSz7fxaR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018e9ad48593-9cfe6704-2be7-4473-8f0a-f9f777232601-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994603;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GIJJpbxLHr8kbitmhCSs91m53M3pjTyvNa/Tnm1OkUU=;
	b=fy891ffiFmN+OKNqy3sqw3uituM8SCUqMaQ9TXJqGAAxk9XdipxEXa3mBZj0hJGF
	Mw0ZEo3d75V+AxpUckddg+v2dJ09Q6OnczRFwNG59HhrkYm1fYsDSYCRkGxRwl6lArJ
	+hviUsw47hA7ELkcpC79L+hD1KHSMm7yH2FGZMr8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994603;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GIJJpbxLHr8kbitmhCSs91m53M3pjTyvNa/Tnm1OkUU=;
	b=qSz7fxaRuIE8XDskSii9LDrg1jxXWOFfZiKYVpD/2+HJE15P4+2bi6P43GPGt67u
	VtLW8/l7Hp+PMy0Drscg912MLTu4H7DEDPI03w3cZ1nXc+Ea91CysDZN3quO1T3Ltaj
	EVhrvDs98aOE+igQJiHHHJcDgXJWfARAoPxO8pIE=
Content-Type: multipart/mixed; boundary="===============4306921384937184279=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-protocols: upgrading to 1.34 SUCCEEDED
Message-ID: <0101018e9ad48593-9cfe6704-2be7-4473-8f0a-f9f777232601-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197816

--===============4306921384937184279==
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
From b49716d848ed06f077dd63ab17ed12c7c0f5d7ff Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 14:28:13 +0000
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


--===============4306921384937184279==
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

--===============4306921384937184279==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-protocols-upgrade-1.33-1.34.patch"

RnJvbSBiNDk3MTZkODQ4ZWQwNmYwNzdkZDYzYWIxN2VkMTJjN2MwZjVkN2ZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNDoyODoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdh
eWxhbmQtcHJvdG9jb2xzOiB1cGdyYWRlIDEuMzMgLT4gMS4zNAoKLS0tCiAuLi4ve3dheWxhbmQt
cHJvdG9jb2xzXzEuMzMuYmIgPT4gd2F5bGFuZC1wcm90b2NvbHNfMS4zNC5iYn0gICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC97d2F5bGFuZC1wcm90b2NvbHNfMS4zMy5iYiA9
PiB3YXlsYW5kLXByb3RvY29sc18xLjM0LmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzXzEuMzMuYmIgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjM0LmJiCnNpbWlsYXJp
dHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dh
eWxhbmQtcHJvdG9jb2xzXzEuMzMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93
YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzXzEuMzQuYmIKaW5kZXggMDc0ZWEzNjYzYS4uOGMxMjk4
NTcxNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC1w
cm90b2NvbHNfMS4zMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXls
YW5kLXByb3RvY29sc18xLjM0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PWM3YjEyYjY3MDJkYTM4Y2EwMjhhY2U1NGFhZTNkNDg0IFwK
ICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3N0YWJsZS9wcmVzZW50YXRpb24tdGltZS9wcmVz
ZW50YXRpb24tdGltZS54bWw7ZW5kbGluZT0yNjttZDU9NDY0NmNkN2Q5ZWRjOWZhNTVkYjk0MWYy
ZDNhN2RjNTMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3dh
eWxhbmQvd2F5bGFuZC1wcm90b2NvbHMvLS9yZWxlYXNlcy8ke1BWfS9kb3dubG9hZHMvd2F5bGFu
ZC1wcm90b2NvbHMtJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk0ZjBjNTBi
MDkwZDZlNjFhMDNmNjIwNDg0NjdiMTlhYmJlODUxYmU0ZTExYWU3YjM2ZjY1ZjhiOThjMzk2M2Ei
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzU5YjI3Y2FjZDg1ZjYwYmFmNGVlNWY4MGRmNWMwZDE1
NzYwZWFkNmEyNDMyYjAwYWI3ZTJlMDU3NGRjYWZlYiIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0g
Imh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xz
Ly0vdGFncyIKIAotLSAKMi40Mi4wCgo=

--===============4306921384937184279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wayland-protocols: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.33/downloads/wayland-protocols-1.33.tar.xz" to "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.34/downloads/wayland-protocols-1.34.tar.xz"
packages/all-poky-linux/wayland-protocols: PV changed from "1.33" to "1.34"
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
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGSIZE changed from 572594 to 597232 (+4%)
packages/all-poky-linux/wayland-protocols/wayland-protocols: PV changed from "1.33" to "1.34"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGV changed from 1.33 [default] to 1.34 [default]

--===============4306921384937184279==--

