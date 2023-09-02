Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8F4CA1016
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:14 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.5680.1693650553499292826
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=P0+sS38g;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=L2q02RnT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018a55708769-f5ab965b-0aa4-405c-a3cf-114d79eb8abf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=r1uFM1kGl/f0UvmW0knSUf6eNFgjy+G9fJxGjS7OSGY=;
	b=P0+sS38gNyXAwkFfw/Fvc9kzE6pok5kXJdK7V8QJEKFpl+26aFFQYl7bvnzH1Jb/
	hfRt6gG8oFjR35MrXhzm6Z9l6DZkPir1KWw4P/mHRybrJkHSxeM/NZ8KsHVCqG9dMD1
	PEEsV6cur7VmyIlPiNqKNT13Sx85GzcqvutFNi6s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=r1uFM1kGl/f0UvmW0knSUf6eNFgjy+G9fJxGjS7OSGY=;
	b=L2q02RnTvnlBLJOE9g4svxtMgdpKwyAg/phGLbWOdE9SlD3pCrDLLg2YU1DMPaOC
	e43JO/skDikfbF9scs5SWtF+C1znVp+kcf1bxnGleFae1kmVCVu27BUrNICA4iLKPLp
	oFacc7GSWOJOezCAG+m79GDkcGzyDpwiKMkE03Ao=
Content-Type: multipart/mixed; boundary="===============8900078894611312559=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 2.0.2 SUCCEEDED
Message-ID: <0101018a55708769-f5ab965b-0aa4-405c-a3cf-114d79eb8abf-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187064

--===============8900078894611312559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pkgconf* to *2.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-1.9.5-2.0.2.patch
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
From 433805104e50b9ce818385df92b34c45564c1359 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 14:03:02 +0000
Subject: [PATCH] pkgconf: upgrade 1.9.5 -> 2.0.2

---
 .../pkgconf/{pkgconf_1.9.5.bb => pkgconf_2.0.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.9.5.bb => pkgconf_2.0.2.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.0.2.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.0.2.bb
index ab1d1c84e8..c6badb123e 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.0.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "1ac1656debb27497563036f7bffc281490f83f9b8457c0d60bcfb638fb6b6171"
+SRC_URI[sha256sum] = "ea5a25ef8f251eb5377ec0e21c75fb61894433cfbdbf0b2559ba33e4c2664401"
 
 inherit autotools
 
-- 
2.39.2


--===============8900078894611312559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-1.9.5.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-2.0.2.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/core2-32-poky-linux/pkgconf: PV changed from "1.9.5" to "2.0.2"
packages/core2-32-poky-linux/pkgconf: PKGV changed from 1.9.5 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PV changed from "1.9.5" to "2.0.2"
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 256364 to 257744 (+1%)
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 1.9.5 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-dev: PV changed from "1.9.5" to "2.0.2"
packages/core2-32-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 24019 to 24161 (+1%)
packages/core2-32-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 1.9.5 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-doc: PV changed from "1.9.5" to "2.0.2"
packages/core2-32-poky-linux/pkgconf/pkgconf-doc: PKGSIZE changed from 29208 to 29202 (-0%)
packages/core2-32-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 1.9.5 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-locale: PV changed from "1.9.5" to "2.0.2"
packages/core2-32-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 1.9.5 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PV changed from "1.9.5" to "2.0.2"
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 268524 to 269402 (+0%)
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PKGV changed from 1.9.5 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "1.9.5" to "2.0.2"
packages/core2-32-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 1.9.5 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf: PV changed from "1.9.5" to "2.0.2"
packages/core2-32-poky-linux/pkgconf/pkgconf: PKGSIZE changed from 150517 to 150601 (+0%)
packages/core2-32-poky-linux/pkgconf/pkgconf: PKGV changed from 1.9.5 [default] to 2.0.2 [default]

--===============8900078894611312559==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-1.9.5-2.0.2.patch"

RnJvbSA0MzM4MDUxMDRlNTBiOWNlODE4Mzg1ZGY5MmIzNGM0NTU2NGMxMzU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAxNDowMzowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBr
Z2NvbmY6IHVwZ3JhZGUgMS45LjUgLT4gMi4wLjIKCi0tLQogLi4uL3BrZ2NvbmYve3BrZ2NvbmZf
MS45LjUuYmIgPT4gcGtnY29uZl8yLjAuMi5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3BrZ2NvbmYve3BrZ2NvbmZfMS45LjUuYmIgPT4gcGtnY29uZl8yLjAuMi5i
Yn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2dj
b25mXzEuOS41LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8yLjAu
Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGtnY29uZi9wa2djb25mXzEuOS41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGtnY29uZi9wa2djb25mXzIuMC4yLmJiCmluZGV4IGFiMWQxYzg0ZTguLmM2YmFkYjEyM2Ug
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMS45LjUu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8yLjAuMi5iYgpA
QCAtMjAsNyArMjAsNyBAQCBTUkNfVVJJID0gIlwKICAgICBmaWxlOi8vcGtnLWNvbmZpZy1uYXRp
dmUuaW4gXAogICAgIGZpbGU6Ly9wa2ctY29uZmlnLWVzZGsuaW4gXAogIgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjFhYzE2NTZkZWJiMjc0OTc1NjMwMzZmN2JmZmMyODE0OTBmODNmOWI4NDU3YzBk
NjBiY2ZiNjM4ZmI2YjYxNzEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWE1YTI1ZWY4ZjI1MWVi
NTM3N2VjMGUyMWM3NWZiNjE4OTQ0MzNjZmJkYmYwYjI1NTliYTMzZTRjMjY2NDQwMSIKIAogaW5o
ZXJpdCBhdXRvdG9vbHMKIAotLSAKMi4zOS4yCgo=

--===============8900078894611312559==--

