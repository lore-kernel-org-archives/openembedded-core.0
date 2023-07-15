Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C86CC25B5E
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.5958.1689456455958089384
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EXeb2qtS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101895b73aed5-fd232ab7-8ef6-4b2b-b605-ee52a8453a52-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/rMwPI8EA6wzVdmEuVpYWUIC3tdpjJGJay8GQLxYbOw=;
	b=EXeb2qtSTjaHAQxA5vH4prxn3UAgCAyqWeZqcicB8Z7fFMNwGo0+c7v78VgkSlyv
	4n8X+/S5IYtVkTezwTGmF09Qbr7iwQ6hCkSnqUlSgC/+H/PEKvkTbWCorA/SZBO/aFC
	qzIdxEle61P6Fmt2NtcsAE2EeFw1oAcBY6OsIjVA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/rMwPI8EA6wzVdmEuVpYWUIC3tdpjJGJay8GQLxYbOw=;
	b=KtKaHY2n3elTJ2ssILcec4mk9EbF3YdgXHaPHbnyS0U0Z1egadfCSlS0SVWu02Vm
	Q9n/qu+TV2XbK9xvyNpGq9BO7kJTyl8ofsRFF/pjRY59As+q7ptk6Wk2DahcKilAWGy
	iV9u1H1fKgK2lvYV5JFrbe8RGtRKMFOZsuKEK/mI=
Content-Type: multipart/mixed; boundary="===============2043304179645092662=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmscube: upgrading to 53ea71efe63470cf698726d983e9da5748a754a1
 SUCCEEDED
Message-ID: <010101895b73aed5-fd232ab7-8ef6-4b2b-b605-ee52a8453a52-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184385

--===============2043304179645092662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kmscube* to *53ea71efe63470cf698726d983e9da5748a754a1* has Succeeded.

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
From 084c07eabecd3eecad8d127083f83b0f721e415c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 17:04:20 +0000
Subject: [PATCH] kmscube: upgrade to latest revision

---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index ca76251d7a..0b33635155 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "cf4ec7f35521eb54d72ce0c92ce65b2249171cbd"
+SRCREV = "53ea71efe63470cf698726d983e9da5748a754a1"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.39.2


--===============2043304179645092662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/kmscube/kmscube-dbg: PKGSIZE changed from 257144 to 267940 (+4%)
packages/core2-32-poky-linux/kmscube/kmscube-src: FILELIST: added "/usr/src/debug/kmscube/git-r0/drm-offscreen.c"
packages/core2-32-poky-linux/kmscube/kmscube-src: PKGSIZE changed from 4577537 to 4582698 (+0%)
packages/core2-32-poky-linux/kmscube/kmscube: PKGSIZE changed from 1563808 to 1567904 (+0%)

--===============2043304179645092662==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kmscube-upgrade-to-latest-revision.patch"

RnJvbSAwODRjMDdlYWJlY2QzZWVjYWQ4ZDEyNzA4M2Y4M2IwZjcyMWU0MTVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTc6MDQ6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
bXNjdWJlOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9rbXNjdWJlL2ttc2N1YmVfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1
YmUva21zY3ViZV9naXQuYmIKaW5kZXggY2E3NjI1MWQ3YS4uMGIzMzYzNTE1NSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIKQEAgLTEwLDcgKzEwLDcg
QEAgREVQRU5EUyA9ICJ2aXJ0dWFsL2xpYmdsZXMzIHZpcnR1YWwvbGliZ2xlczIgdmlydHVhbC9l
Z2wgbGliZHJtIHZpcnR1YWwvbGliZ2JtIgogCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9r
bXNjdWJlLmM7YmVnaW5saW5lPTE7ZW5kbGluZT0yMzttZDU9OGIzMDlkNGVlNjdiNzMxNWZmNzM4
MTI3MGRkNjMxZmIiCiAKLVNSQ1JFViA9ICJjZjRlYzdmMzU1MjFlYjU0ZDcyY2UwYzkyY2U2NWIy
MjQ5MTcxY2JkIgorU1JDUkVWID0gIjUzZWE3MWVmZTYzNDcwY2Y2OTg3MjZkOTgzZTlkYTU3NDhh
NzU0YTEiCiBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9rbXNj
dWJlO2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMiCiBVUFNUUkVBTV9DSEVDS19DT01NSVRT
ID0gIjEiCiAKLS0gCjIuMzkuMgoK

--===============2043304179645092662==--

