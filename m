Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99B9C3ABB2
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:17 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.20171.1744723987468305785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=c1uMZrIn;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=AAWVktY1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019639a7501b-88deba7c-f461-46df-9a32-305cf323f0b4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723988;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fo0CwAe4xOdSc9hVFB+5ItYNybXDvHs12tW2v9hh//A=;
	b=c1uMZrInOmc41R11RT5eFDp9LUo4cZNIaFyz5Fu8lY5vaMihGlQa2vszVZiH+/oi
	mjQbnDVnisNcwDzzcixha/rdFMRF5s3Ghzvr/ZuF+VPdQ/ZQIOpbbgv+SfaN/Wzw8iK
	cYW+N7Qnq4IXBkXaanApec03YzIL393fmVy91cWA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723988;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fo0CwAe4xOdSc9hVFB+5ItYNybXDvHs12tW2v9hh//A=;
	b=AAWVktY1pm2IKph/S6Ju9wI5SqgUTFAXdf31AqsXJ/ozzkrQPENzwRRPRMdoHHDs
	DU2fqy8u2O5/hFr5oEhOaMZWzmCnCjNdngfcq6MYmoMBPyVIN076V8BOhbfp+i4Oe/I
	+fW1cI/M4CB+NlmLgZCI/CN65nOMIJ6OgsoQg0po=
Content-Type: multipart/mixed; boundary="===============1629491595439132411=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-protocols: upgrading to 1.43 SUCCEEDED
Message-ID: <0101019639a7501b-88deba7c-f461-46df-9a32-305cf323f0b4-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214918

--===============1629491595439132411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wayland-protocols* to *1.43* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wayland-protocols-upgrade-1.42-1.43.patch
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
From cc5471466d4b00be94d4720d47e141fd96b3f394 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 10:19:16 +0000
Subject: [PATCH] wayland-protocols: upgrade 1.42 -> 1.43

---
 .../{wayland-protocols_1.42.bb => wayland-protocols_1.43.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.42.bb => wayland-protocols_1.43.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.43.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.42.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.43.bb
index 7cbb650cda..5318d78da0 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.43.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "23ba80d410d1200a86fe29592c19766eae8f1c350b67289999e9e7ea12d9f7aa"
+SRC_URI[sha256sum] = "ba3c3425dd27c57b5291e93dba97be12479601e00bcab24d26471948cb643653"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.47.1


--===============1629491595439132411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wayland-protocols: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.42/downloads/wayland-protocols-1.42.tar.xz" to "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.43/downloads/wayland-protocols-1.43.tar.xz"
packages/all-poky-linux/wayland-protocols: PV changed from "1.42" to "1.43"
packages/all-poky-linux/wayland-protocols: PKGV changed from 1.42 [default] to 1.43 [default]
Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/include/wayland-protocols/xdg-toplevel-tag-v1-enum.h was added
  /usr/share/wayland-protocols/staging/xdg-toplevel-tag was added
  /usr/share/wayland-protocols/staging/xdg-toplevel-tag/xdg-toplevel-tag-v1.xml was added
packages/all-poky-linux/wayland-protocols/wayland-protocols-dbg: PV changed from "1.42" to "1.43"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dbg: PKGV changed from 1.42 [default] to 1.43 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PV changed from "1.42" to "1.43"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PKGSIZE changed from 111330 to 113289 (+2%)
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: FILELIST: added "/usr/include/wayland-protocols/xdg-toplevel-tag-v1-enum.h"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PKGV changed from 1.42 [default] to 1.43 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-doc: PV changed from "1.42" to "1.43"
packages/all-poky-linux/wayland-protocols/wayland-protocols-doc: PKGV changed from 1.42 [default] to 1.43 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-locale: PV changed from "1.42" to "1.43"
packages/all-poky-linux/wayland-protocols/wayland-protocols-locale: PKGV changed from 1.42 [default] to 1.43 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PV changed from "1.42" to "1.43"
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PKGV changed from 1.42 [default] to 1.43 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: PV changed from "1.42" to "1.43"
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: PKGV changed from 1.42 [default] to 1.43 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: PV changed from "1.42" to "1.43"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGSIZE changed from 815357 to 821103 (+1%)
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILELIST: added "/usr/share/wayland-protocols/staging/xdg-toplevel-tag/xdg-toplevel-tag-v1.xml"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGV changed from 1.42 [default] to 1.43 [default]

--===============1629491595439132411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/include/wayland-protocols/xdg-toplevel-tag-v1-enum.h was added
  /usr/share/wayland-protocols/staging/xdg-toplevel-tag was added
  /usr/share/wayland-protocols/staging/xdg-toplevel-tag/xdg-toplevel-tag-v1.xml was added
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: FILELIST: added "/usr/include/wayland-protocols/xdg-toplevel-tag-v1-enum.h"
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILELIST: added "/usr/share/wayland-protocols/staging/xdg-toplevel-tag/xdg-toplevel-tag-v1.xml"

--===============1629491595439132411==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-protocols-upgrade-1.42-1.43.patch"

RnJvbSBjYzU0NzE0NjZkNGIwMGJlOTRkNDcyMGQ0N2UxNDFmZDk2YjNmMzk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMTA6MTk6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
YXlsYW5kLXByb3RvY29sczogdXBncmFkZSAxLjQyIC0+IDEuNDMKCi0tLQogLi4uL3t3YXlsYW5k
LXByb3RvY29sc18xLjQyLmJiID0+IHdheWxhbmQtcHJvdG9jb2xzXzEuNDMuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQve3dheWxhbmQtcHJvdG9jb2xzXzEuNDIuYmIg
PT4gd2F5bGFuZC1wcm90b2NvbHNfMS40My5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjQyLmJiIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC1wcm90b2NvbHNfMS40My5iYgpzaW1pbGFy
aXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93
YXlsYW5kLXByb3RvY29sc18xLjQyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
d2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjQzLmJiCmluZGV4IDdjYmI2NTBjZGEuLjUzMThk
NzhkYTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQt
cHJvdG9jb2xzXzEuNDIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5
bGFuZC1wcm90b2NvbHNfMS40My5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jN2IxMmI2NzAyZGEzOGNhMDI4YWNlNTRhYWUzZDQ4NCBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zdGFibGUvcHJlc2VudGF0aW9uLXRpbWUvcHJl
c2VudGF0aW9uLXRpbWUueG1sO2VuZGxpbmU9MjY7bWQ1PTQ2NDZjZDdkOWVkYzlmYTU1ZGI5NDFm
MmQzYTdkYzUzIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93
YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzLy0vcmVsZWFzZXMvJHtQVn0vZG93bmxvYWRzL3dheWxh
bmQtcHJvdG9jb2xzLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyM2JhODBk
NDEwZDEyMDBhODZmZTI5NTkyYzE5NzY2ZWFlOGYxYzM1MGI2NzI4OTk5OWU5ZTdlYTEyZDlmN2Fh
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImJhM2MzNDI1ZGQyN2M1N2I1MjkxZTkzZGJhOTdiZTEy
NDc5NjAxZTAwYmNhYjI0ZDI2NDcxOTQ4Y2I2NDM2NTMiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9
ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93YXlsYW5kLXByb3RvY29s
cy8tL3RhZ3MiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy8oP1A8cHZlcj4uKyki
Ci0tIAoyLjQ3LjEKCg==

--===============1629491595439132411==--

