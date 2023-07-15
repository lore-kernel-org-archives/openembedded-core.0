Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA32C05052
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:38 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.6028.1689456454825564112
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TTRDvl8M;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101895b73b0d5-3328c658-6a2c-40be-8e22-b52b6915ebe9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0qYQ5tWlOk+coTJI3s9L4PWWEP3c5ecZmHE8MLF0ppQ=;
	b=TTRDvl8Mz9Tldg8Kp7Uv5hzwiVhy8WW3AtDg14Fc1urNtukAHvRp5eDUFFTeK4T5
	NTwmCVBcoE4EJ9aRtSKRDI+ySleZDthz4pAmEe5S+nFlrIYt9k0vk8M16ex2coB8J0b
	xeY5wZFmx+lFJ3SzIw7TyHSCR7ne+78FkgFONL+E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0qYQ5tWlOk+coTJI3s9L4PWWEP3c5ecZmHE8MLF0ppQ=;
	b=FJ+NtkiYARU/2xdyOwDMUKwQtGginvgz89TwdwGH2KS23hNx/QY/T1lNxIpXqViY
	Yf9zmyB0rQzF9jTsLauDfvihFNfbVrnSlNS9As3tytXhOlgv0G9TWrAAboN6PyBNc3o
	S1JHpgDh0YaC56snkaFAMOxi+geRwXH0ToxS8VbM=
Content-Type: multipart/mixed; boundary="===============6541713511011036419=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-protocols: upgrading to 1.32 SUCCEEDED
Message-ID: <010101895b73b0d5-3328c658-6a2c-40be-8e22-b52b6915ebe9-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184395

--===============6541713511011036419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wayland-protocols* to *1.32* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wayland-protocols-upgrade-1.31-1.32.patch
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
From 27e9849ac32b15d7b557bd35ef0285ec73d77362 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 19:20:08 +0000
Subject: [PATCH] wayland-protocols: upgrade 1.31 -> 1.32

---
 .../{wayland-protocols_1.31.bb => wayland-protocols_1.32.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.31.bb => wayland-protocols_1.32.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.31.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.31.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.32.bb
index afde995fd4..05943bc388 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.31.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a07fa722ed87676ec020d867714bc9a2f24c464da73912f39706eeef5219e238"
+SRC_URI[sha256sum] = "7459799d340c8296b695ef857c07ddef24c5a09b09ab6a74f7b92640d2b1ba11"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.39.2


--===============6541713511011036419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wayland-protocols: PV changed from "1.31" to "1.32"
packages/all-poky-linux/wayland-protocols: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.31/downloads/wayland-protocols-1.31.tar.xz" to "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.32/downloads/wayland-protocols-1.32.tar.xz"
packages/all-poky-linux/wayland-protocols: PKGV changed from 1.31 [default] to 1.32 [default]
Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/share/wayland-protocols/staging/cursor-shape was added
  /usr/share/wayland-protocols/staging/cursor-shape/cursor-shape-v1.xml was added
  /usr/share/wayland-protocols/staging/ext-foreign-toplevel-list was added
  /usr/share/wayland-protocols/staging/ext-foreign-toplevel-list/ext-foreign-toplevel-list-v1.xml was added
  /usr/share/wayland-protocols/staging/security-context was added
  /usr/share/wayland-protocols/staging/security-context/security-context-v1.xml was added
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PV changed from "1.31" to "1.32"
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PKGV changed from 1.31 [default] to 1.32 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: PV changed from "1.31" to "1.32"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGSIZE changed from 507848 to 538657 (+6%)
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGV changed from 1.31 [default] to 1.32 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILELIST: added "/usr/share/wayland-protocols/staging/cursor-shape/cursor-shape-v1.xml /usr/share/wayland-protocols/staging/security-context/security-context-v1.xml /usr/share/wayland-protocols/staging/ext-foreign-toplevel-list/ext-foreign-toplevel-list-v1.xml"

--===============6541713511011036419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/share/wayland-protocols/staging/cursor-shape was added
  /usr/share/wayland-protocols/staging/cursor-shape/cursor-shape-v1.xml was added
  /usr/share/wayland-protocols/staging/ext-foreign-toplevel-list was added
  /usr/share/wayland-protocols/staging/ext-foreign-toplevel-list/ext-foreign-toplevel-list-v1.xml was added
  /usr/share/wayland-protocols/staging/security-context was added
  /usr/share/wayland-protocols/staging/security-context/security-context-v1.xml was added
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILELIST: added "/usr/share/wayland-protocols/staging/cursor-shape/cursor-shape-v1.xml /usr/share/wayland-protocols/staging/security-context/security-context-v1.xml /usr/share/wayland-protocols/staging/ext-foreign-toplevel-list/ext-foreign-toplevel-list-v1.xml"

--===============6541713511011036419==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-protocols-upgrade-1.31-1.32.patch"

RnJvbSAyN2U5ODQ5YWMzMmIxNWQ3YjU1N2JkMzVlZjAyODVlYzczZDc3MzYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTk6MjA6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
YXlsYW5kLXByb3RvY29sczogdXBncmFkZSAxLjMxIC0+IDEuMzIKCi0tLQogLi4uL3t3YXlsYW5k
LXByb3RvY29sc18xLjMxLmJiID0+IHdheWxhbmQtcHJvdG9jb2xzXzEuMzIuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQve3dheWxhbmQtcHJvdG9jb2xzXzEuMzEuYmIg
PT4gd2F5bGFuZC1wcm90b2NvbHNfMS4zMi5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjMxLmJiIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC1wcm90b2NvbHNfMS4zMi5iYgpzaW1pbGFy
aXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93
YXlsYW5kLXByb3RvY29sc18xLjMxLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
d2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjMyLmJiCmluZGV4IGFmZGU5OTVmZDQuLjA1OTQz
YmMzODggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQt
cHJvdG9jb2xzXzEuMzEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5
bGFuZC1wcm90b2NvbHNfMS4zMi5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jN2IxMmI2NzAyZGEzOGNhMDI4YWNlNTRhYWUzZDQ4NCBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zdGFibGUvcHJlc2VudGF0aW9uLXRpbWUvcHJl
c2VudGF0aW9uLXRpbWUueG1sO2VuZGxpbmU9MjY7bWQ1PTQ2NDZjZDdkOWVkYzlmYTU1ZGI5NDFm
MmQzYTdkYzUzIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93
YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzLy0vcmVsZWFzZXMvJHtQVn0vZG93bmxvYWRzL3dheWxh
bmQtcHJvdG9jb2xzLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhMDdmYTcy
MmVkODc2NzZlYzAyMGQ4Njc3MTRiYzlhMmYyNGM0NjRkYTczOTEyZjM5NzA2ZWVlZjUyMTllMjM4
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc0NTk3OTlkMzQwYzgyOTZiNjk1ZWY4NTdjMDdkZGVm
MjRjNWEwOWIwOWFiNmE3NGY3YjkyNjQwZDJiMWJhMTEiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9
ICJodHRwczovL3dheWxhbmQuZnJlZWRlc2t0b3Aub3JnL3JlbGVhc2VzLmh0bWwiCiAKLS0gCjIu
MzkuMgoK

--===============6541713511011036419==--

