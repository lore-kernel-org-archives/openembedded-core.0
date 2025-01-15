Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CFDC02188
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:08 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.17865.1736936766625722888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NldTV4N8;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=R8JNr7k/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010194697fbc77-e8cf45c4-ccae-4421-b303-772c911893ef-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936766;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=I4IGbV3NCd7WBawyj6cXqODoVMCtjUq2bakLAmgVLkg=;
	b=NldTV4N8JAPvvz2jQroV+MOkA4DRf4S542ZBaQXzRNTAHMG6lukJeDrzxs4vER6s
	Yd/pSgfT3gbfd7JC3/g/ycybFKe4GkR3iiz9SROwuszhef4+XWwScG15p95dSicM2JB
	Nrnz84ix2DdYMzig4/dB3ADgyz5F/SJ4uuELJYH8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936766;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=I4IGbV3NCd7WBawyj6cXqODoVMCtjUq2bakLAmgVLkg=;
	b=R8JNr7k/udd5E5GvsMk3naRQ5RKAsvF/wdNUsJO/BBjSElEX8h3AqrpcgRHmUq6Q
	mlDyrDqOZQuGJve/npnLdENOx9aIFTcau8oHDRcBsm3jrtFEdr6daxzQNwsvnKJQx6E
	VoSy6dBH1XNSGvHTK73ulFvp3heuMtslSgAUEy+I=
Content-Type: multipart/mixed; boundary="===============0090438686882266530=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fmt: upgrading to 11.1.2 SUCCEEDED
Message-ID: <01010194697fbc77-e8cf45c4-ccae-4421-b303-772c911893ef-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209834

--===============0090438686882266530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fmt* to *11.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fmt-upgrade-11.1.1-11.1.2.patch
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
From 45b39a828150c223106dfeeee39b71067a449323 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 06:42:56 +0000
Subject: [PATCH] fmt: upgrade 11.1.1 -> 11.1.2

---
 meta/recipes-devtools/fmt/{fmt_11.1.1.bb => fmt_11.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fmt/{fmt_11.1.1.bb => fmt_11.1.2.bb} (90%)

diff --git a/meta/recipes-devtools/fmt/fmt_11.1.1.bb b/meta/recipes-devtools/fmt/fmt_11.1.2.bb
similarity index 90%
rename from meta/recipes-devtools/fmt/fmt_11.1.1.bb
rename to meta/recipes-devtools/fmt/fmt_11.1.2.bb
index a99a377ad4..d552a4cded 100644
--- a/meta/recipes-devtools/fmt/fmt_11.1.1.bb
+++ b/meta/recipes-devtools/fmt/fmt_11.1.2.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
 
 SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
-SRCREV = "e3ddede6c4ee818825c4e5a6dfa1d384860c27d9"
+SRCREV = "8303d140a1a11f19b982a9f664bbe59a1ccda3f4"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============0090438686882266530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/fmt/fmt-dbg: PV changed from "11.1.1" to "11.1.2"
packages/core2-64-poky-linux/fmt/fmt-dbg: PKGV changed from 11.1.1 [default] to 11.1.2 [default]
packages/core2-64-poky-linux/fmt/fmt-dbg: FILELIST: removed "/usr/lib/.debug/libfmt.so.11.1.1", added "/usr/lib/.debug/libfmt.so.11.1.2"
packages/core2-64-poky-linux/fmt/fmt-dbg: PKGSIZE changed from 1163592 to 1163936 (+0%)
packages/core2-64-poky-linux/fmt/fmt-dev: PV changed from "11.1.1" to "11.1.2"
packages/core2-64-poky-linux/fmt/fmt-dev: PKGV changed from 11.1.1 [default] to 11.1.2 [default]
packages/core2-64-poky-linux/fmt/fmt-dev: PKGSIZE changed from 580882 to 581989 (+0%)
packages/core2-64-poky-linux/fmt/fmt-doc: PV changed from "11.1.1" to "11.1.2"
packages/core2-64-poky-linux/fmt/fmt-doc: PKGV changed from 11.1.1 [default] to 11.1.2 [default]
packages/core2-64-poky-linux/fmt/fmt-locale: PV changed from "11.1.1" to "11.1.2"
packages/core2-64-poky-linux/fmt/fmt-locale: PKGV changed from 11.1.1 [default] to 11.1.2 [default]
packages/core2-64-poky-linux/fmt/fmt-src: PV changed from "11.1.1" to "11.1.2"
packages/core2-64-poky-linux/fmt/fmt-src: PKGV changed from 11.1.1 [default] to 11.1.2 [default]
packages/core2-64-poky-linux/fmt/fmt-src: PKGSIZE changed from 365437 to 366267 (+0%)
packages/core2-64-poky-linux/fmt/fmt-staticdev: PV changed from "11.1.1" to "11.1.2"
packages/core2-64-poky-linux/fmt/fmt-staticdev: PKGV changed from 11.1.1 [default] to 11.1.2 [default]
packages/core2-64-poky-linux/fmt/fmt: PV changed from "11.1.1" to "11.1.2"
packages/core2-64-poky-linux/fmt/fmt: PKGV changed from 11.1.1 [default] to 11.1.2 [default]
packages/core2-64-poky-linux/fmt/fmt: FILELIST: removed "/usr/lib/libfmt.so.11.1.1", added "/usr/lib/libfmt.so.11.1.2"
packages/core2-64-poky-linux/fmt: PV changed from "11.1.1" to "11.1.2"
packages/core2-64-poky-linux/fmt: PKGV changed from 11.1.1 [default] to 11.1.2 [default]
Changes to packages/core2-64-poky-linux/fmt (sysroot):
  /usr/lib/libfmt.so.11 changed symlink target from libfmt.so.11.1.1 to libfmt.so.11.1.2
  /usr/lib/libfmt.so.11.1.1 moved to /usr/lib/libfmt.so.11.1.2

--===============0090438686882266530==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fmt-upgrade-11.1.1-11.1.2.patch"

RnJvbSA0NWIzOWE4MjgxNTBjMjIzMTA2ZGZlZWVlMzliNzEwNjdhNDQ5MzIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDY6NDI6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
bXQ6IHVwZ3JhZGUgMTEuMS4xIC0+IDExLjEuMgoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Zm10L3tmbXRfMTEuMS4xLmJiID0+IGZtdF8xMS4xLjIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2ZtdC97Zm10XzExLjEuMS5iYiA9PiBmbXRfMTEuMS4yLmJifSAoOTAlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQvZm10XzExLjEuMS5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9mbXQvZm10XzExLjEuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZm10L2ZtdF8xMS4xLjEuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQvZm10XzExLjEuMi5iYgppbmRleCBhOTlhMzc3YWQ0
Li5kNTUyYTRjZGVkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZm10L2ZtdF8x
MS4xLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2ZtdC9mbXRfMTEuMS4yLmJiCkBA
IC01LDcgKzUsNyBAQCBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0U7bWQ1PWI5MjU3Nzg1ZmM0ZjM4MDNhNGI3MWI3NmMxNDEyNzI5IgogCiBTUkNfVVJJ
ID0gImdpdDovL2dpdGh1Yi5jb20vZm10bGliL2ZtdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0
dHBzIgotU1JDUkVWID0gImUzZGRlZGU2YzRlZTgxODgyNWM0ZTVhNmRmYTFkMzg0ODYwYzI3ZDki
CitTUkNSRVYgPSAiODMwM2QxNDBhMWExMWYxOWI5ODJhOWY2NjRiYmU1OWExY2NkYTNmNCIKIAog
UyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40NC4xCgo=

--===============0090438686882266530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/fmt/fmt: FILELIST: removed "/usr/lib/libfmt.so.11.1.1", added "/usr/lib/libfmt.so.11.1.2"
Changes to packages/core2-64-poky-linux/fmt (sysroot):
  /usr/lib/libfmt.so.11 changed symlink target from libfmt.so.11.1.1 to libfmt.so.11.1.2
  /usr/lib/libfmt.so.11.1.1 moved to /usr/lib/libfmt.so.11.1.2

--===============0090438686882266530==--

