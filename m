Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAFEC47258
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:51 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.63610.1702649863489767398
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=T0AfpztN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MpDoqPN1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018c6dd72e55-47b2399f-6081-4c76-97a8-a104b52722b6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649867;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SayQdPDE2YCpIViMAFqXZamfdjARA4VNjvuD5Dmren8=;
	b=T0AfpztNWK3IM141FR+hf09ASVllU/d1yYtOeq55YsdgjHTTjQhfSaq6Rn9v8C02
	CiO3Zk/DOXkUwZAsgFZCOdvGsXZxJflNap52qqaVxgI9YNsBYU3vlQOA0N1EcN7LzkH
	wME0NbJQZQ9k9zBpkp4WTWLOU5WHM6Ggaw3uK0F4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649867;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SayQdPDE2YCpIViMAFqXZamfdjARA4VNjvuD5Dmren8=;
	b=MpDoqPN1YFgd3eW2mFzEXoJRvSD9OWBZsVOqcFaNq7ZevW/+1LNkr5wZTyPoVtPh
	+ReXnyP6Ge1BiXATfBQnCRL7XtiHtVrQQkHjXbJZN7eIOGIyjhHf+Luz7GdpW8n5PU6
	ck9wDy82Akq2XKULxUA3nTbHPkTnpPmdDVCzdY7M=
Content-Type: multipart/mixed; boundary="===============4130115152940025759=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmscube: upgrading to 96d63eb59e34c647cda1cbb489265f8c536ae055
 SUCCEEDED
Message-ID: <0101018c6dd72e55-47b2399f-6081-4c76-97a8-a104b52722b6-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192499

--===============4130115152940025759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kmscube* to *96d63eb59e34c647cda1cbb489265f8c536ae055* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kmscube-upgrade-to-latest-revision.patch
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
From cb04c5d698d62e3002432c371e4489f5c7e6f9fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 10:31:05 +0000
Subject: [PATCH] kmscube: upgrade to latest revision

---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 4cdc0f06bb..aab582281a 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "ea6c5d1eeefbfb0a1c27ab74a6e4621f1d9adf4c"
+SRCREV = "96d63eb59e34c647cda1cbb489265f8c536ae055"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.42.0


--===============4130115152940025759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/kmscube/kmscube-dbg: PKGSIZE changed from 320496 to 351120 (+10%)
packages/core2-64-poky-linux/kmscube/kmscube-src: FILELIST: added "/usr/src/debug/kmscube/git/cube-gears.c"
packages/core2-64-poky-linux/kmscube/kmscube-src: PKGSIZE changed from 4583630 to 4610159 (+1%)
packages/core2-64-poky-linux/kmscube/kmscube: PKGSIZE changed from 1565256 to 1585736 (+1%)

--===============4130115152940025759==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kmscube-upgrade-to-latest-revision.patch"

RnJvbSBjYjA0YzVkNjk4ZDYyZTMwMDI0MzJjMzcxZTQ0ODlmNWM3ZTZmOWZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMTA6MzE6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
bXNjdWJlOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9rbXNjdWJlL2ttc2N1YmVfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1
YmUva21zY3ViZV9naXQuYmIKaW5kZXggNGNkYzBmMDZiYi4uYWFiNTgyMjgxYSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIKQEAgLTEwLDcgKzEwLDcg
QEAgREVQRU5EUyA9ICJ2aXJ0dWFsL2xpYmdsZXMzIHZpcnR1YWwvbGliZ2xlczIgdmlydHVhbC9l
Z2wgbGliZHJtIHZpcnR1YWwvbGliZ2JtIgogCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9r
bXNjdWJlLmM7YmVnaW5saW5lPTE7ZW5kbGluZT0yMzttZDU9OGIzMDlkNGVlNjdiNzMxNWZmNzM4
MTI3MGRkNjMxZmIiCiAKLVNSQ1JFViA9ICJlYTZjNWQxZWVlZmJmYjBhMWMyN2FiNzRhNmU0NjIx
ZjFkOWFkZjRjIgorU1JDUkVWID0gIjk2ZDYzZWI1OWUzNGM2NDdjZGExY2JiNDg5MjY1ZjhjNTM2
YWUwNTUiCiBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9rbXNj
dWJlO2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNLX0NPTU1J
VFMgPSAiMSIKLS0gCjIuNDIuMAoK

--===============4130115152940025759==--

