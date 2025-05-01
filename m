Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10E0C3ABAA
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:55 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.1786.1746113615645740914
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Udv1Dbha;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=VY04becT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101968c7b9fc4-c86c7e3e-78ce-4f44-bbd4-07676969ccc7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CvpSJhsgc2j0Hoqxl+mIu/fZysTzLqIAARsCcuc2hy4=;
	b=Udv1DbhauqNahdgXWhkz3Srl6zDduhh/khSLDkMLyESKEBaE9S/377F+2jLXB6zn
	SlvYBqPcvDn870BFn6dC4oqZ3CL7aoSFlumeQgutCie1GrIBOarqyDCUvnVMwbgPSS/
	gL/6QBx1IOk21Jf5WJnN89Nw3Pw47GXGZFwaDvII=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CvpSJhsgc2j0Hoqxl+mIu/fZysTzLqIAARsCcuc2hy4=;
	b=VY04becTaC6CkU2PLRex/Ej9hEn/PWmKJP7x8J7F+19JbE3U0CIe5ytfRuIf/AZv
	gKLVuM/I15XeigDdqZJeFCYq/OaLlYhWn5KLvzZMXXOBa4WBprG4IlyBbXQUuh6JS2X
	CC/Xikz1yqUo/TH+t4aj8rytPr2/NpxIjE8xsQuA=
Content-Type: multipart/mixed; boundary="===============8937974899932582153=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-protocols: upgrading to 1.44 SUCCEEDED
Message-ID: <010101968c7b9fc4-c86c7e3e-78ce-4f44-bbd4-07676969ccc7-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215871

--===============8937974899932582153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wayland-protocols* to *1.44* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wayland-protocols-upgrade-1.42-1.44.patch
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
From 4230d5345648c1cb49496a6b4797e5e40983cc84 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 13:04:01 +0000
Subject: [PATCH] wayland-protocols: upgrade 1.42 -> 1.44

---
 .../{wayland-protocols_1.42.bb => wayland-protocols_1.44.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.42.bb => wayland-protocols_1.44.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.44.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.42.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.44.bb
index 7cbb650cda..c86f09eb7c 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.44.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "23ba80d410d1200a86fe29592c19766eae8f1c350b67289999e9e7ea12d9f7aa"
+SRC_URI[sha256sum] = "3df1107ecf8bfd6ee878aeca5d3b7afd81248a48031e14caf6ae01f14eebb50e"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.47.1


--===============8937974899932582153==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-protocols-upgrade-1.42-1.44.patch"

RnJvbSA0MjMwZDUzNDU2NDhjMWNiNDk0OTZhNmI0Nzk3ZTVlNDA5ODNjYzg0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxMzowNDowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdh
eWxhbmQtcHJvdG9jb2xzOiB1cGdyYWRlIDEuNDIgLT4gMS40NAoKLS0tCiAuLi4ve3dheWxhbmQt
cHJvdG9jb2xzXzEuNDIuYmIgPT4gd2F5bGFuZC1wcm90b2NvbHNfMS40NC5iYn0gICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC97d2F5bGFuZC1wcm90b2NvbHNfMS40Mi5iYiA9
PiB3YXlsYW5kLXByb3RvY29sc18xLjQ0LmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzXzEuNDIuYmIgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjQ0LmJiCnNpbWlsYXJp
dHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dh
eWxhbmQtcHJvdG9jb2xzXzEuNDIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93
YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzXzEuNDQuYmIKaW5kZXggN2NiYjY1MGNkYS4uYzg2ZjA5
ZWI3YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC1w
cm90b2NvbHNfMS40Mi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXls
YW5kLXByb3RvY29sc18xLjQ0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PWM3YjEyYjY3MDJkYTM4Y2EwMjhhY2U1NGFhZTNkNDg0IFwK
ICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3N0YWJsZS9wcmVzZW50YXRpb24tdGltZS9wcmVz
ZW50YXRpb24tdGltZS54bWw7ZW5kbGluZT0yNjttZDU9NDY0NmNkN2Q5ZWRjOWZhNTVkYjk0MWYy
ZDNhN2RjNTMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3dh
eWxhbmQvd2F5bGFuZC1wcm90b2NvbHMvLS9yZWxlYXNlcy8ke1BWfS9kb3dubG9hZHMvd2F5bGFu
ZC1wcm90b2NvbHMtJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIzYmE4MGQ0
MTBkMTIwMGE4NmZlMjk1OTJjMTk3NjZlYWU4ZjFjMzUwYjY3Mjg5OTk5ZTllN2VhMTJkOWY3YWEi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2RmMTEwN2VjZjhiZmQ2ZWU4NzhhZWNhNWQzYjdhZmQ4
MTI0OGE0ODAzMWUxNGNhZjZhZTAxZjE0ZWViYjUwZSIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0g
Imh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xz
Ly0vdGFncyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2VzLyg/UDxwdmVyPi4rKSIK
LS0gCjIuNDcuMQoK

--===============8937974899932582153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wayland-protocols: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.42/downloads/wayland-protocols-1.42.tar.xz" to "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.44/downloads/wayland-protocols-1.44.tar.xz"
packages/all-poky-linux/wayland-protocols: PV changed from "1.42" to "1.44"
packages/all-poky-linux/wayland-protocols: PKGV changed from 1.42 [default] to 1.44 [default]
Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/include/wayland-protocols/color-representation-v1-enum.h was added
  /usr/include/wayland-protocols/xdg-toplevel-tag-v1-enum.h was added
  /usr/share/wayland-protocols/staging/color-representation was added
  /usr/share/wayland-protocols/staging/color-representation/color-representation-v1.xml was added
  /usr/share/wayland-protocols/staging/xdg-toplevel-tag was added
  /usr/share/wayland-protocols/staging/xdg-toplevel-tag/xdg-toplevel-tag-v1.xml was added
packages/all-poky-linux/wayland-protocols/wayland-protocols-dbg: PV changed from "1.42" to "1.44"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dbg: PKGV changed from 1.42 [default] to 1.44 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: FILELIST: added "/usr/include/wayland-protocols/xdg-toplevel-tag-v1-enum.h /usr/include/wayland-protocols/color-representation-v1-enum.h"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PV changed from "1.42" to "1.44"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PKGSIZE changed from 111330 to 122303 (+10%)
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PKGV changed from 1.42 [default] to 1.44 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-doc: PV changed from "1.42" to "1.44"
packages/all-poky-linux/wayland-protocols/wayland-protocols-doc: PKGV changed from 1.42 [default] to 1.44 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-locale: PV changed from "1.42" to "1.44"
packages/all-poky-linux/wayland-protocols/wayland-protocols-locale: PKGV changed from 1.42 [default] to 1.44 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PV changed from "1.42" to "1.44"
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PKGV changed from 1.42 [default] to 1.44 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: PV changed from "1.42" to "1.44"
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: PKGV changed from 1.42 [default] to 1.44 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILELIST: added "/usr/share/wayland-protocols/staging/xdg-toplevel-tag/xdg-toplevel-tag-v1.xml /usr/share/wayland-protocols/staging/color-representation/color-representation-v1.xml"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PV changed from "1.42" to "1.44"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGSIZE changed from 815357 to 839193 (+3%)
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGV changed from 1.42 [default] to 1.44 [default]

--===============8937974899932582153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/include/wayland-protocols/color-representation-v1-enum.h was added
  /usr/include/wayland-protocols/xdg-toplevel-tag-v1-enum.h was added
  /usr/share/wayland-protocols/staging/color-representation was added
  /usr/share/wayland-protocols/staging/color-representation/color-representation-v1.xml was added
  /usr/share/wayland-protocols/staging/xdg-toplevel-tag was added
  /usr/share/wayland-protocols/staging/xdg-toplevel-tag/xdg-toplevel-tag-v1.xml was added
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: FILELIST: added "/usr/include/wayland-protocols/color-representation-v1-enum.h /usr/include/wayland-protocols/xdg-toplevel-tag-v1-enum.h"
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILELIST: added "/usr/share/wayland-protocols/staging/color-representation/color-representation-v1.xml /usr/share/wayland-protocols/staging/xdg-toplevel-tag/xdg-toplevel-tag-v1.xml"

--===============8937974899932582153==--

