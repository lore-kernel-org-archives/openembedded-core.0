Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0581EC3065F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:24 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1115.1714579215467194242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NLBoen3k;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=jnU6XUnj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018f34e29677-555331b2-ddfc-4fa4-928d-a673b495bb56-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Xkb/HWgRuihr73yo5tlrnQzvUJgnPzx/o92Qm67/hHU=;
	b=NLBoen3k8lJh2iWRfzZr5tkTIQlspszuJN9ka9SqpqFjtdhA9gmxpRiZk5e5wAq+
	pzyl8cauzbhIo/9ohp2HbsslQH62uPfP/fYlnk/5iCBM/VzbHEh1bbcD/3aYwrzmy07
	G/P05HgzyNN4Fu93i7CMyTYS6pOjCckaFPRafUG4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Xkb/HWgRuihr73yo5tlrnQzvUJgnPzx/o92Qm67/hHU=;
	b=jnU6XUnj6vJI9tMOAatvy5R8ohGOOMHq+cj9BUvg8HJtFw+k1XQCdQVCzPOo6hnQ
	oU+qgfV/LxSZXX68Xjja6eUNhgaw5JLG5uUhj0RgSqC7/zvI8/2qbquVoKH2fL8VwHx
	xksc+0qI22uM0KoKOh99+SkF6vRbwz4/4hCJY+7o=
Content-Type: multipart/mixed; boundary="===============5236894841265691656=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-protocols: upgrading to 1.36 SUCCEEDED
Message-ID: <0101018f34e29677-555331b2-ddfc-4fa4-928d-a673b495bb56-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198838

--===============5236894841265691656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wayland-protocols* to *1.36* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wayland-protocols-upgrade-1.35-1.36.patch
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
From ae7e86ba5edea3f16f578a667413b7bef516df62 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 12:38:03 +0000
Subject: [PATCH] wayland-protocols: upgrade 1.35 -> 1.36

---
 .../{wayland-protocols_1.35.bb => wayland-protocols_1.36.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.35.bb => wayland-protocols_1.36.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.35.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.35.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.36.bb
index 7e70de346c..505164695d 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.35.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "37a2716a28133dc819341c568a29d21e8cb72130e5c126a1fcfc9f42c23d95ab"
+SRC_URI[sha256sum] = "71fd4de05e79f9a1ca559fac30c1f8365fa10346422f9fe795f74d77b9ef7e92"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 
-- 
2.44.0


--===============5236894841265691656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wayland-protocols: PV changed from "1.35" to "1.36"
packages/all-poky-linux/wayland-protocols: PKGV changed from 1.35 [default] to 1.36 [default]
packages/all-poky-linux/wayland-protocols: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.35/downloads/wayland-protocols-1.35.tar.xz" to "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.36/downloads/wayland-protocols-1.36.tar.xz"
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PV changed from "1.35" to "1.36"
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PKGV changed from 1.35 [default] to 1.36 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: PV changed from "1.35" to "1.36"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGV changed from 1.35 [default] to 1.36 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGSIZE changed from 653476 to 653480 (+0%)

--===============5236894841265691656==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-protocols-upgrade-1.35-1.36.patch"

RnJvbSBhZTdlODZiYTVlZGVhM2YxNmY1NzhhNjY3NDEzYjdiZWY1MTZkZjYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAxMjozODowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdh
eWxhbmQtcHJvdG9jb2xzOiB1cGdyYWRlIDEuMzUgLT4gMS4zNgoKLS0tCiAuLi4ve3dheWxhbmQt
cHJvdG9jb2xzXzEuMzUuYmIgPT4gd2F5bGFuZC1wcm90b2NvbHNfMS4zNi5iYn0gICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC97d2F5bGFuZC1wcm90b2NvbHNfMS4zNS5iYiA9
PiB3YXlsYW5kLXByb3RvY29sc18xLjM2LmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzXzEuMzUuYmIgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjM2LmJiCnNpbWlsYXJp
dHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dh
eWxhbmQtcHJvdG9jb2xzXzEuMzUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93
YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzXzEuMzYuYmIKaW5kZXggN2U3MGRlMzQ2Yy4uNTA1MTY0
Njk1ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC1w
cm90b2NvbHNfMS4zNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXls
YW5kLXByb3RvY29sc18xLjM2LmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PWM3YjEyYjY3MDJkYTM4Y2EwMjhhY2U1NGFhZTNkNDg0IFwK
ICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3N0YWJsZS9wcmVzZW50YXRpb24tdGltZS9wcmVz
ZW50YXRpb24tdGltZS54bWw7ZW5kbGluZT0yNjttZDU9NDY0NmNkN2Q5ZWRjOWZhNTVkYjk0MWYy
ZDNhN2RjNTMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3dh
eWxhbmQvd2F5bGFuZC1wcm90b2NvbHMvLS9yZWxlYXNlcy8ke1BWfS9kb3dubG9hZHMvd2F5bGFu
ZC1wcm90b2NvbHMtJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM3YTI3MTZh
MjgxMzNkYzgxOTM0MWM1NjhhMjlkMjFlOGNiNzIxMzBlNWMxMjZhMWZjZmM5ZjQyYzIzZDk1YWIi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzFmZDRkZTA1ZTc5ZjlhMWNhNTU5ZmFjMzBjMWY4MzY1
ZmExMDM0NjQyMmY5ZmU3OTVmNzRkNzdiOWVmN2U5MiIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0g
Imh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xz
Ly0vdGFncyIKIAotLSAKMi40NC4wCgo=

--===============5236894841265691656==--

