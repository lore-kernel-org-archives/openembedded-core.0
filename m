Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580ECC77B7F
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:04 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.8887.1749993280586977019
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xUfcc6DV;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jzlI7/2A;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019773baa60f-96720246-e55e-41d2-943d-3b2b8dab5c8a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993301;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZvrHjt1b2/2MKp4zmqYP5AqxK6ONBK167pk0/TSfeK0=;
	b=xUfcc6DVYbDg/gRIhGrMNuiGpWnZjDU4zAo1G2ze0J4lYwvJKfnebVG30J4rMo88
	/RuEmEJXjw3H2tIv4CjR6Zh5HdZfg+WAnhh1gbirYt20Ga510DB5b4UDIJFc3hyvus9
	pjLlYBl4Rmf824lHxDTp5mjbPepvRVxY7bqrd4AU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993301;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZvrHjt1b2/2MKp4zmqYP5AqxK6ONBK167pk0/TSfeK0=;
	b=jzlI7/2A8X2eGDF6YRRnj8n7G5hikc2LKRPBNq4RoHBPSD4uTCOqmZ/gE247ybYy
	RzyB02ihQz/3oln2DTs8j0eOHw+9/oLjzB25Y5Uzf0rssERLuoKZSFm8DnWqUdyXDre
	Q6S3Y5AkBM7UsYHkjLQslXeEIHu03hIkgiFCDUyc=
Content-Type: multipart/mixed; boundary="===============1109693163164016260=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] mpg123: upgrading to 1.33.0 SUCCEEDED
Message-ID: <0101019773baa60f-96720246-e55e-41d2-943d-3b2b8dab5c8a-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:15:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218730

--===============1109693163164016260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mpg123* to *1.33.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mpg123-upgrade-1.32.10-1.33.0.patch
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
From c348eba5446539726125eae367234700dd428846 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 12:13:45 +0000
Subject: [PATCH] mpg123: upgrade 1.32.10 -> 1.33.0

---
 .../mpg123/{mpg123_1.32.10.bb => mpg123_1.33.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.32.10.bb => mpg123_1.33.0.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb b/meta/recipes-multimedia/mpg123/mpg123_1.33.0.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.33.0.bb
index d559bc6417..2905bf0abc 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.0.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "87b2c17fe0c979d3ef38eeceff6362b35b28ac8589fbf1854b5be75c9ab6557c"
+SRC_URI[sha256sum] = "2290e3aede6f4d163e1a17452165af33caad4b5f0948f99429cfa2d8385faa9d"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.47.1


--===============1109693163164016260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mpg123: PKGV changed from 1.32.10 [default] to 1.33.0 [default]
packages/core2-64-poky-linux/mpg123: PV changed from "1.32.10" to "1.33.0"
packages/core2-64-poky-linux/mpg123: SRC_URI changed from "https://www.mpg123.de/download/mpg123-1.32.10.tar.bz2" to "https://www.mpg123.de/download/mpg123-1.33.0.tar.bz2"
packages/core2-64-poky-linux/mpg123/mpg123-dbg: PKGSIZE changed from 2346096 to 2348056 (+0%)
packages/core2-64-poky-linux/mpg123/mpg123-dbg: PKGV changed from 1.32.10 [default] to 1.33.0 [default]
packages/core2-64-poky-linux/mpg123/mpg123-dbg: PV changed from "1.32.10" to "1.33.0"
packages/core2-64-poky-linux/mpg123/mpg123-dbg: FILELIST: removed "/usr/lib/.debug/libmpg123.so.0.48.3 /usr/lib/.debug/libout123.so.0.5.1", added "/usr/lib/.debug/libout123.so.0.5.2 /usr/lib/.debug/libmpg123.so.0.49.3"
packages/core2-64-poky-linux/mpg123/mpg123-dev: PKGSIZE changed from 193424 to 196987 (+2%)
packages/core2-64-poky-linux/mpg123/mpg123-dev: PKGV changed from 1.32.10 [default] to 1.33.0 [default]
packages/core2-64-poky-linux/mpg123/mpg123-dev: PV changed from "1.32.10" to "1.33.0"
packages/core2-64-poky-linux/mpg123/mpg123-doc: PKGSIZE changed from 41764 to 41897 (+0%)
packages/core2-64-poky-linux/mpg123/mpg123-doc: PKGV changed from 1.32.10 [default] to 1.33.0 [default]
packages/core2-64-poky-linux/mpg123/mpg123-doc: PV changed from "1.32.10" to "1.33.0"
packages/core2-64-poky-linux/mpg123/mpg123-locale: PKGV changed from 1.32.10 [default] to 1.33.0 [default]
packages/core2-64-poky-linux/mpg123/mpg123-locale: PV changed from "1.32.10" to "1.33.0"
packages/core2-64-poky-linux/mpg123/mpg123-src: PKGV changed from 1.32.10 [default] to 1.33.0 [default]
packages/core2-64-poky-linux/mpg123/mpg123-src: PV changed from "1.32.10" to "1.33.0"
packages/core2-64-poky-linux/mpg123/mpg123-staticdev: PKGV changed from 1.32.10 [default] to 1.33.0 [default]
packages/core2-64-poky-linux/mpg123/mpg123-staticdev: PV changed from "1.32.10" to "1.33.0"
packages/core2-64-poky-linux/mpg123/mpg123: PKGSIZE changed from 1010799 to 1014895 (+0%)
packages/core2-64-poky-linux/mpg123/mpg123: PKGV changed from 1.32.10 [default] to 1.33.0 [default]
packages/core2-64-poky-linux/mpg123/mpg123: PV changed from "1.32.10" to "1.33.0"
packages/core2-64-poky-linux/mpg123/mpg123: FILELIST: removed "/usr/lib/libmpg123.so.0.48.3 /usr/lib/libout123.so.0.5.1", added "/usr/lib/libout123.so.0.5.2 /usr/lib/libmpg123.so.0.49.3"
Changes to packages/core2-64-poky-linux/mpg123 (sysroot):
  /usr/lib/libmpg123.so.0 changed symlink target from libmpg123.so.0.48.3 to libmpg123.so.0.49.3
  /usr/lib/libmpg123.so changed symlink target from libmpg123.so.0.48.3 to libmpg123.so.0.49.3
  /usr/lib/libout123.so.0 changed symlink target from libout123.so.0.5.1 to libout123.so.0.5.2
  /usr/lib/libout123.so changed symlink target from libout123.so.0.5.1 to libout123.so.0.5.2
  /usr/lib/libmpg123.so.0.48.3 moved to /usr/lib/libmpg123.so.0.49.3
  /usr/lib/libout123.so.0.5.1 moved to /usr/lib/libout123.so.0.5.2

--===============1109693163164016260==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mpg123-upgrade-1.32.10-1.33.0.patch"

RnJvbSBjMzQ4ZWJhNTQ0NjUzOTcyNjEyNWVhZTM2NzIzNDcwMGRkNDI4ODQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMTI6MTM6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
cGcxMjM6IHVwZ3JhZGUgMS4zMi4xMCAtPiAxLjMzLjAKCi0tLQogLi4uL21wZzEyMy97bXBnMTIz
XzEuMzIuMTAuYmIgPT4gbXBnMTIzXzEuMzMuMC5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvbXBnMTIzL3ttcGcxMjNfMS4zMi4xMC5iYiA9PiBtcGcxMjNfMS4z
My4wLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEy
My9tcGcxMjNfMS4zMi4xMC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcx
MjNfMS4zMy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4zMi4xMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvbXBnMTIzL21wZzEyM18xLjMzLjAuYmIKaW5kZXggZDU1OWJjNjQxNy4u
MjkwNWJmMGFiYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbXBnMTIzL21w
ZzEyM18xLjMyLjEwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcx
MjNfMS4zMy4wLmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ0VOU0UgPSAiTEdQTC0yLjEtb25seSIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWU3YjljMTVmY2ZiOTg2YWJi
NGNjNWU4NDAwYTI0MTY5IgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lm1wZzEyMy5kZS9kb3du
bG9hZC8ke0JQfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg3YjJjMTdmZTBjOTc5
ZDNlZjM4ZWVjZWZmNjM2MmIzNWIyOGFjODU4OWZiZjE4NTRiNWJlNzVjOWFiNjU1N2MiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMjI5MGUzYWVkZTZmNGQxNjNlMWExNzQ1MjE2NWFmMzNjYWFkNGI1
ZjA5NDhmOTk0MjljZmEyZDgzODVmYWE5ZCIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAibXBn
MTIzLSg/UDxwdmVyPlxkKyhcLlxkKykrKVwudGFyIgogCi0tIAoyLjQ3LjEKCg==

--===============1109693163164016260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/mpg123/mpg123: FILELIST: removed "/usr/lib/libout123.so.0.5.1 /usr/lib/libmpg123.so.0.48.3", added "/usr/lib/libmpg123.so.0.49.3 /usr/lib/libout123.so.0.5.2"
Changes to packages/core2-64-poky-linux/mpg123 (sysroot):
  /usr/lib/libmpg123.so.0 changed symlink target from libmpg123.so.0.48.3 to libmpg123.so.0.49.3
  /usr/lib/libmpg123.so changed symlink target from libmpg123.so.0.48.3 to libmpg123.so.0.49.3
  /usr/lib/libout123.so.0 changed symlink target from libout123.so.0.5.1 to libout123.so.0.5.2
  /usr/lib/libout123.so changed symlink target from libout123.so.0.5.1 to libout123.so.0.5.2
  /usr/lib/libmpg123.so.0.48.3 moved to /usr/lib/libmpg123.so.0.49.3
  /usr/lib/libout123.so.0.5.1 moved to /usr/lib/libout123.so.0.5.2

--===============1109693163164016260==--

