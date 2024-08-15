Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6073EC54ED1
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:06 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.131116.1723748336188923896
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=a/AEcrpT;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=aw3VePA6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019157683fa4-7aff1b59-939f-4bab-b84d-b106c9537ef5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=58pO3EBPCZcH2Jpn3RgYVPBfVxgt5s0AgkGiu5wp4Ek=;
	b=a/AEcrpTg81ovLElvpI5WaT3Ye1QtooIUU0yrxXvhQVvNbGoAoyPp9THnBKZb6kd
	gyPuM3LvA/3QVPf7dIuf5n3n8fntu7GYJF/gt+iF5/7PyGhVywkzoMVT1hIuKii4trW
	xKXe5tHwtpbSxC4+MXTA7vUr9BAKAwAHlSN8H+nw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=58pO3EBPCZcH2Jpn3RgYVPBfVxgt5s0AgkGiu5wp4Ek=;
	b=aw3VePA600P5vgsPUYplVr4ZSgHAjCif6CsmQqWpXT/NQ7qR+hP79QPEox7rDgwm
	rhSPL7W77zhroboOvzcqXUfetYacJP1FiN6KEbEleU7L8ZgW8fxj7lP2w4ggRPyIrnr
	0WvPqVEjU9KOix6yYpjktvqytZUe/PnfG5esKUZk=
Content-Type: multipart/mixed; boundary="===============4015923525321475789=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.8.2 SUCCEEDED
Message-ID: <0101019157683fa4-7aff1b59-939f-4bab-b84d-b106c9537ef5-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203418

--===============4015923525321475789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *enchant2* to *2.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.8.1-2.8.2.patch
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
From 6aca0389283b1df97b3a553ffcb8c7091c0bfaea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 18:19:14 +0000
Subject: [PATCH] enchant2: upgrade 2.8.1 -> 2.8.2

---
 .../enchant/{enchant2_2.8.1.bb => enchant2_2.8.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.1.bb => enchant2_2.8.2.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.1.bb b/meta/recipes-support/enchant/enchant2_2.8.2.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.1.bb
rename to meta/recipes-support/enchant/enchant2_2.8.2.bb
index 825cf2e388..f0da896e59 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.1.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "ff79de470b8eb16f53849dc49f2bce8ca4eb7decabfc1349716fe12616e52f4e"
+SRC_URI[sha256sum] = "8f19535adb5577b83b00e02f330fe9b9eb40dd21f19e2899636fc4d3a7696375"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.44.0


--===============4015923525321475789==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.8.1-2.8.2.patch"

RnJvbSA2YWNhMDM4OTI4M2IxZGY5N2IzYTU1M2ZmY2I4YzcwOTFjMGJmYWVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTg6MTk6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bmNoYW50MjogdXBncmFkZSAyLjguMSAtPiAyLjguMgoKLS0tCiAuLi4vZW5jaGFudC97ZW5jaGFu
dDJfMi44LjEuYmIgPT4gZW5jaGFudDJfMi44LjIuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9lbmNoYW50L3tlbmNoYW50Ml8yLjguMS5iYiA9PiBlbmNoYW50Ml8yLjgu
Mi5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2Vu
Y2hhbnQyXzIuOC4xLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50Ml8y
LjguMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuOC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuOC4yLmJiCmluZGV4IDgyNWNmMmUzODguLmYwZGE4OTZl
NTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQvZW5jaGFudDJfMi44
LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50Ml8yLjguMi5i
YgpAQCAtMTIsNyArMTIsNyBAQCBERVBFTkRTID0gImdsaWItMi4wIGdyb2ZmLW5hdGl2ZSIKIGlu
aGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBnaXRodWItcmVsZWFzZXMKIAogU1JDX1VSSSA9ICIk
e0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L2VuY2hhbnQtJHtQVn0udGFyLmd6Igot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImZmNzlkZTQ3MGI4ZWIxNmY1Mzg0OWRjNDlmMmJjZThjYTRl
YjdkZWNhYmZjMTM0OTcxNmZlMTI2MTZlNTJmNGUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGYx
OTUzNWFkYjU1NzdiODNiMDBlMDJmMzMwZmU5YjllYjQwZGQyMWYxOWUyODk5NjM2ZmM0ZDNhNzY5
NjM3NSIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9BYmlXb3JkL2Vu
Y2hhbnQvcmVsZWFzZXMiCiAKLS0gCjIuNDQuMAoK

--===============4015923525321475789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.1", added "/usr/lib/libenchant-2.so.2.8.2"
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.1 to libenchant-2.so.2.8.2
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.1 to libenchant-2.so.2.8.2
  /usr/lib/libenchant-2.so.2.8.1 moved to /usr/lib/libenchant-2.so.2.8.2

--===============4015923525321475789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/enchant2/enchant2-dbg: PV changed from "2.8.1" to "2.8.2"
packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 364216 to 363352 (-0%)
packages/core2-64-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/.debug/libenchant-2.so.2.8.1", added "/usr/lib/.debug/libenchant-2.so.2.8.2"
packages/core2-64-poky-linux/enchant2/enchant2-dev: PV changed from "2.8.1" to "2.8.2"
packages/core2-64-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2-doc: PV changed from "2.8.1" to "2.8.2"
packages/core2-64-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2-locale: PV changed from "2.8.1" to "2.8.2"
packages/core2-64-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2-src: PV changed from "2.8.1" to "2.8.2"
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.8.1" to "2.8.2"
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2: PV changed from "2.8.1" to "2.8.2"
packages/core2-64-poky-linux/enchant2/enchant2: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.1", added "/usr/lib/libenchant-2.so.2.8.2"
packages/core2-64-poky-linux/enchant2: PV changed from "2.8.1" to "2.8.2"
packages/core2-64-poky-linux/enchant2: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-64-poky-linux/enchant2: SRC_URI changed from "https://github.com/AbiWord/enchant/releases/download/v2.8.1/enchant-2.8.1.tar.gz" to "https://github.com/AbiWord/enchant/releases/download/v2.8.2/enchant-2.8.2.tar.gz"
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.1 to libenchant-2.so.2.8.2
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.1 to libenchant-2.so.2.8.2
  /usr/lib/libenchant-2.so.2.8.1 moved to /usr/lib/libenchant-2.so.2.8.2

--===============4015923525321475789==--

