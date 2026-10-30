Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6189.1793344583317665900
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 00:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dRCNC8jX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JXgzYOKN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a18baab314-b4a3efc2-9580-4318-ae24-676323c12644-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793344582;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LG0QKbV5ruQLyl9e4JlPjCKloOH3ng2oeLLNAQfzGKI=;
	b=dRCNC8jXoRlRKAmUwYv4vldHsmAj19S0Fvfe/mw6O0oI1Y4k6Y6owTJzEJumDpBE
	kYhqGmS8dxQYdYVpcB7+fFcBnVZ7T2+7wp86glO1ZHarw9Sjajb2aQcWYwazgj/cbBh
	4ubkImnCH7kEsB7lmLRYDafKMpVDdC+Qdymk9etk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793344582;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LG0QKbV5ruQLyl9e4JlPjCKloOH3ng2oeLLNAQfzGKI=;
	b=JXgzYOKNFxOdmCU9BYh+kZNCtW455m8LyT5rPSH5tgxntk9MpPUBpBjlkMvqXYbQ
	pqlhJ1tIgc2EGhJHdmdEPnDFy3X3aP3yq3L/cX8eZHlylSGi+aYVTLkDoQed22zl/wL
	VLB7P4fFWywg6KSgB4MTu0HnCqSltc+xBl6fx4LE=
Content-Type: multipart/mixed; boundary="===============7068564742394264665=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-protocols: upgrading to 1.50 SUCCEEDED
Message-ID: <010101a18baab314-b4a3efc2-9580-4318-ae24-676323c12644-000000@us-west-2.amazonses.com>
Date: Fri, 30 Oct 2026 07:16:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.30-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249002

--===============7068564742394264665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wayland-protocols* to *1.50* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wayland-protocols-upgrade-1.49-1.50.patch
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
From 4d3f2147ba4fd7a52ad1e85803d2ed0aaf88456a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 30 Oct 2026 07:13:04 +0000
Subject: [PATCH] wayland-protocols: upgrade 1.49 -> 1.50

---
 .../{wayland-protocols_1.49.bb => wayland-protocols_1.50.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.49.bb => wayland-protocols_1.50.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.50.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.49.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.50.bb
index f06e75fe8a..530f83216f 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.50.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ec4c8f74942d6dff7ace8b4ce4764f0ef9ff618a935d974ea77edee2ad240b14"
+SRC_URI[sha256sum] = "4460c20cfcf68b994a5ee206ed15fc19ad312f16c96075186e83b0e3f4aa48a5"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.47.1


--===============7068564742394264665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wayland-protocols: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.49/downloads/wayland-protocols-1.49.tar.xz" to "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.50/downloads/wayland-protocols-1.50.tar.xz"
packages/all-poky-linux/wayland-protocols: PKGV changed from 1.49 [default] to 1.50 [default]
packages/all-poky-linux/wayland-protocols: PV changed from "1.49" to "1.50"
Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/include/wayland-protocols/xx-hotkey-v1-enum.h was added
  /usr/include/wayland-protocols/xx-image-capture-color-management-v1-enum.h was added
packages/all-poky-linux/wayland-protocols/wayland-protocols-dbg: PKGV changed from 1.49 [default] to 1.50 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-dbg: PV changed from "1.49" to "1.50"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: FILES: removed "/lib/*.la /lib/*.o /lib/lib*.so"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PKGSIZE changed from 148792 to 154106 (+4%)
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: FILELIST: added "/usr/include/wayland-protocols/xx-hotkey-v1-enum.h /usr/include/wayland-protocols/xx-image-capture-color-management-v1-enum.h"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PKGV changed from 1.49 [default] to 1.50 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PV changed from "1.49" to "1.50"
packages/all-poky-linux/wayland-protocols/wayland-protocols-doc: PKGV changed from 1.49 [default] to 1.50 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-doc: PV changed from "1.49" to "1.50"
packages/all-poky-linux/wayland-protocols/wayland-protocols-locale: PKGV changed from 1.49 [default] to 1.50 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-locale: PV changed from "1.49" to "1.50"
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PKGV changed from 1.49 [default] to 1.50 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PV changed from "1.49" to "1.50"
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: PKGV changed from 1.49 [default] to 1.50 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: PV changed from "1.49" to "1.50"
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILES: removed "/sbin/* /bin/* /lib/*.so.*", added "/usr/lib/*.so.*"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGSIZE changed from 882098 to 883853 (+0%)
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGV changed from 1.49 [default] to 1.50 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: PV changed from "1.49" to "1.50"

--===============7068564742394264665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/include/wayland-protocols/xx-hotkey-v1-enum.h was added
  /usr/include/wayland-protocols/xx-image-capture-color-management-v1-enum.h was added
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: FILELIST: added "/usr/include/wayland-protocols/xx-image-capture-color-management-v1-enum.h /usr/include/wayland-protocols/xx-hotkey-v1-enum.h"

--===============7068564742394264665==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-protocols-upgrade-1.49-1.50.patch"

RnJvbSA0ZDNmMjE0N2JhNGZkN2E1MmFkMWU4NTgwM2QyZWQwYWFmODg0NTZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMzAgT2N0IDIwMjYgMDc6MTM6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
YXlsYW5kLXByb3RvY29sczogdXBncmFkZSAxLjQ5IC0+IDEuNTAKCi0tLQogLi4uL3t3YXlsYW5k
LXByb3RvY29sc18xLjQ5LmJiID0+IHdheWxhbmQtcHJvdG9jb2xzXzEuNTAuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQve3dheWxhbmQtcHJvdG9jb2xzXzEuNDkuYmIg
PT4gd2F5bGFuZC1wcm90b2NvbHNfMS41MC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjQ5LmJiIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC1wcm90b2NvbHNfMS41MC5iYgpzaW1pbGFy
aXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93
YXlsYW5kLXByb3RvY29sc18xLjQ5LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
d2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjUwLmJiCmluZGV4IGYwNmU3NWZlOGEuLjUzMGY4
MzIxNmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQt
cHJvdG9jb2xzXzEuNDkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5
bGFuZC1wcm90b2NvbHNfMS41MC5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jN2IxMmI2NzAyZGEzOGNhMDI4YWNlNTRhYWUzZDQ4NCBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zdGFibGUvcHJlc2VudGF0aW9uLXRpbWUvcHJl
c2VudGF0aW9uLXRpbWUueG1sO2VuZGxpbmU9MjY7bWQ1PTQ2NDZjZDdkOWVkYzlmYTU1ZGI5NDFm
MmQzYTdkYzUzIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93
YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzLy0vcmVsZWFzZXMvJHtQVn0vZG93bmxvYWRzL3dheWxh
bmQtcHJvdG9jb2xzLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlYzRjOGY3
NDk0MmQ2ZGZmN2FjZThiNGNlNDc2NGYwZWY5ZmY2MThhOTM1ZDk3NGVhNzdlZGVlMmFkMjQwYjE0
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ0NjBjMjBjZmNmNjhiOTk0YTVlZTIwNmVkMTVmYzE5
YWQzMTJmMTZjOTYwNzUxODZlODNiMGUzZjRhYTQ4YTUiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9
ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93YXlsYW5kLXByb3RvY29s
cy8tL3RhZ3MiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy8oP1A8cHZlcj4uKyki
Ci0tIAoyLjQ3LjEKCg==

--===============7068564742394264665==--
