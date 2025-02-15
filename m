Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1535C021AD
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:32 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.8094.1739623333240363604
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fIkPkC4w;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=La7Y/oiT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019509a1c165-9afe47c8-3791-427f-a605-3444f58cb819-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vnlcNPuytqhfM3S0y4S8piiMit9THBJYnjOSh/v67G4=;
	b=fIkPkC4wv3qv6FF6Z/9HBxqoooEcaUDLz7E5RU3rSQCdBMjUT4d/b+T9ktMlZTPn
	2ixjCsQ/C3yRHXGqVBf86IgMHmS0Xu0GCTLohxdFcEsQoILe/6tjivckjrocDaftOxD
	+gVmDAVTo1DZJTGvU3Sgii1jbjEAPE5oia9isOxI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vnlcNPuytqhfM3S0y4S8piiMit9THBJYnjOSh/v67G4=;
	b=La7Y/oiTSJvzEdgbp57mUBwZPns3+R4XOQNOeyHB2poev+TXMrXlMJOpad1cHeRs
	+lyTzyBLSGuVPv5UEG6s//Ujo/UShu8QUug3BdmF2irMh8Y6s9gpG8Tm4lwXKVFVUeU
	Bvj3BV9juVnXwx4fHxc/daKkRDbF5gWAc+NATpmw=
Content-Type: multipart/mixed; boundary="===============2531897346206964435=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libwpe: upgrading to 1.16.2 SUCCEEDED
Message-ID: <0101019509a1c165-9afe47c8-3791-427f-a605-3444f58cb819-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211472

--===============2531897346206964435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libwpe* to *1.16.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libwpe-upgrade-1.16.1-1.16.2.patch
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
From ae6cdf1c6eddf281cbeffea704e69d54059fa605 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 11:04:42 +0000
Subject: [PATCH] libwpe: upgrade 1.16.1 -> 1.16.2

---
 meta/recipes-sato/webkit/{libwpe_1.16.1.bb => libwpe_1.16.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{libwpe_1.16.1.bb => libwpe_1.16.2.bb} (88%)

diff --git a/meta/recipes-sato/webkit/libwpe_1.16.1.bb b/meta/recipes-sato/webkit/libwpe_1.16.2.bb
similarity index 88%
rename from meta/recipes-sato/webkit/libwpe_1.16.1.bb
rename to meta/recipes-sato/webkit/libwpe_1.16.2.bb
index 083e48b2cb..324e2f213c 100644
--- a/meta/recipes-sato/webkit/libwpe_1.16.1.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.16.2.bb
@@ -11,7 +11,7 @@ inherit cmake features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9cca60f2c4393ea0de53c675ebc3cdbe9c5aa249259dd1d6d81a49b052d37481"
+SRC_URI[sha256sum] = "960bdd11c3f2cf5bd91569603ed6d2aa42fd4000ed7cac930a804eac367888d7"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.44.1


--===============2531897346206964435==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libwpe-upgrade-1.16.1-1.16.2.patch"

RnJvbSBhZTZjZGYxYzZlZGRmMjgxY2JlZmZlYTcwNGU2OWQ1NDA1OWZhNjA1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMTE6MDQ6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ3cGU6IHVwZ3JhZGUgMS4xNi4xIC0+IDEuMTYuMgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0by93
ZWJraXQve2xpYndwZV8xLjE2LjEuYmIgPT4gbGlid3BlXzEuMTYuMi5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc2F0by93ZWJraXQve2xpYndwZV8xLjE2LjEuYmIgPT4gbGlid3BlXzEuMTYuMi5iYn0g
KDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvbGlid3BlXzEuMTYu
MS5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC9saWJ3cGVfMS4xNi4yLmJiCnNpbWlsYXJp
dHkgaW5kZXggODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC9saWJ3cGVf
MS4xNi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvbGlid3BlXzEuMTYu
Mi5iYgppbmRleCAwODNlNDhiMmNiLi4zMjRlMmYyMTNjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc2F0by93ZWJraXQvbGlid3BlXzEuMTYuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by93
ZWJraXQvbGlid3BlXzEuMTYuMi5iYgpAQCAtMTEsNyArMTEsNyBAQCBpbmhlcml0IGNtYWtlIGZl
YXR1cmVzX2NoZWNrIHBrZ2NvbmZpZwogUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0gIm9wZW5n
bCIKIAogU1JDX1VSSSA9ICJodHRwczovL3dwZXdlYmtpdC5vcmcvcmVsZWFzZXMvJHtCUE59LSR7
UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5Y2NhNjBmMmM0MzkzZWEwZGU1M2M2
NzVlYmMzY2RiZTljNWFhMjQ5MjU5ZGQxZDZkODFhNDliMDUyZDM3NDgxIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjk2MGJkZDExYzNmMmNmNWJkOTE1Njk2MDNlZDZkMmFhNDJmZDQwMDBlZDdjYWM5
MzBhODA0ZWFjMzY3ODg4ZDciCiAKICMgVGhpcyBpcyBhIHR3ZWFrIG9mIHVwc3RyZWFtLXZlcnNp
b24taXMtZXZlbiBuZWVkZWQgYmVjYXVzZQogIyBpcHN0cmVhbSBkaXJlY3RvcnkgY29udGFpbnMg
dGFyYmFsbHMgZm9yIG90aGVyIGNvbXBvbmVudHMgYXMgd2VsbC4KLS0gCjIuNDQuMQoK

--===============2531897346206964435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libwpe: PV changed from "1.16.1" to "1.16.2"
packages/core2-64-poky-linux/libwpe: PKGV changed from 1.16.1 [default] to 1.16.2 [default]
packages/core2-64-poky-linux/libwpe: SRC_URI changed from "https://wpewebkit.org/releases/libwpe-1.16.1.tar.xz" to "https://wpewebkit.org/releases/libwpe-1.16.2.tar.xz"
packages/core2-64-poky-linux/libwpe/libwpe-dbg: FILELIST: removed "/usr/lib/.debug/libwpe-1.0.so.1.9.4", added "/usr/lib/.debug/libwpe-1.0.so.1.9.5"
packages/core2-64-poky-linux/libwpe/libwpe-dbg: PV changed from "1.16.1" to "1.16.2"
packages/core2-64-poky-linux/libwpe/libwpe-dbg: PKGSIZE changed from 261168 to 261120 (-0%)
packages/core2-64-poky-linux/libwpe/libwpe-dbg: PKGV changed from 1.16.1 [default] to 1.16.2 [default]
packages/core2-64-poky-linux/libwpe/libwpe-dev: PV changed from "1.16.1" to "1.16.2"
packages/core2-64-poky-linux/libwpe/libwpe-dev: PKGSIZE changed from 265889 to 265855 (-0%)
packages/core2-64-poky-linux/libwpe/libwpe-dev: PKGV changed from 1.16.1 [default] to 1.16.2 [default]
packages/core2-64-poky-linux/libwpe/libwpe-doc: PV changed from "1.16.1" to "1.16.2"
packages/core2-64-poky-linux/libwpe/libwpe-doc: PKGV changed from 1.16.1 [default] to 1.16.2 [default]
packages/core2-64-poky-linux/libwpe/libwpe-locale: PV changed from "1.16.1" to "1.16.2"
packages/core2-64-poky-linux/libwpe/libwpe-locale: PKGV changed from 1.16.1 [default] to 1.16.2 [default]
packages/core2-64-poky-linux/libwpe/libwpe-src: PV changed from "1.16.1" to "1.16.2"
packages/core2-64-poky-linux/libwpe/libwpe-src: PKGSIZE changed from 256964 to 256930 (-0%)
packages/core2-64-poky-linux/libwpe/libwpe-src: PKGV changed from 1.16.1 [default] to 1.16.2 [default]
packages/core2-64-poky-linux/libwpe/libwpe-staticdev: PV changed from "1.16.1" to "1.16.2"
packages/core2-64-poky-linux/libwpe/libwpe-staticdev: PKGV changed from 1.16.1 [default] to 1.16.2 [default]
packages/core2-64-poky-linux/libwpe/libwpe: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.9.4", added "/usr/lib/libwpe-1.0.so.1.9.5"
packages/core2-64-poky-linux/libwpe/libwpe: PV changed from "1.16.1" to "1.16.2"
packages/core2-64-poky-linux/libwpe/libwpe: PKGV changed from 1.16.1 [default] to 1.16.2 [default]
Changes to packages/core2-64-poky-linux/libwpe (sysroot):
  /usr/lib/libwpe-1.0.so.1 changed symlink target from libwpe-1.0.so.1.9.4 to libwpe-1.0.so.1.9.5
  /usr/lib/libwpe-1.0.so.1.9.4 moved to /usr/lib/libwpe-1.0.so.1.9.5

--===============2531897346206964435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libwpe/libwpe: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.9.4", added "/usr/lib/libwpe-1.0.so.1.9.5"
Changes to packages/core2-64-poky-linux/libwpe (sysroot):
  /usr/lib/libwpe-1.0.so.1 changed symlink target from libwpe-1.0.so.1.9.4 to libwpe-1.0.so.1.9.5
  /usr/lib/libwpe-1.0.so.1.9.4 moved to /usr/lib/libwpe-1.0.so.1.9.5

--===============2531897346206964435==--

