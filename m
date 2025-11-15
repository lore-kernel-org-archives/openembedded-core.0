Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42997CEBF7E
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:41 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11934.1763224717774095043
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gdBOtEnu;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=D2nQK/NZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019a88621031-479ccde8-7fa8-4838-9ba9-876d358049e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WkW0pARFOPaLvyre54PYs+Sigmgc6akfNypjXTdduWA=;
	b=gdBOtEnuSZ367evu/Ph1T3jlKOmU+Rk2piyHM1uSxXCjMJb/qsEieWDg+IuodndJ
	yYh0KWtib1x2ZzfN6XUAJLjJRsXgxJ54RkIXQIm22wOPLMBr77SEtCwq+xnhCIrN7AK
	t00k0MS+7FoOrZ+YJP18TRG8vouVWGF/lIVF5Nkw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WkW0pARFOPaLvyre54PYs+Sigmgc6akfNypjXTdduWA=;
	b=D2nQK/NZdXpRvUq2IalpLS+fGxXf6rO8cHQVCvX0gfuocgTX54LhNT84svoxkzdR
	zJgU/DrF1Nz1VLsIcpK6bOI5J7FRNu9TUEavQl78C9ytUlLQxel+q1nZ6OHZe+DySrI
	8+nC2h0iToBNlpkKoIqu5csPeAGQ50Iin3onoRNQ=
Content-Type: multipart/mixed; boundary="===============0530895539267617724=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gn: upgrading to 748c9571f3d18820a7989a880d5ddf220e54af1b
 SUCCEEDED
Message-ID: <0101019a88621031-479ccde8-7fa8-4838-9ba9-876d358049e4-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226336

--===============0530895539267617724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gn* to *748c9571f3d18820a7989a880d5ddf220e54af1b* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gn-upgrade-to-latest-revision.patch
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
From cfc065a4f2df942d9bdde58fde25b8d67aa30174 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 09:23:16 +0000
Subject: [PATCH] gn: upgrade to latest revision

---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index d8896609b1..da6255d16f 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "81b24e01531ecf0eff12ec9359a555ec3944ec4e"
+SRCREV = "748c9571f3d18820a7989a880d5ddf220e54af1b"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.47.1


--===============0530895539267617724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGSIZE changed from 99969600 to 100094584 (+0%)
packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+81b24e0153 to 0+git0+748c9571f3
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+81b24e0153 to 0+git0+748c9571f3
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+81b24e0153 to 0+git0+748c9571f3
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+81b24e0153 to 0+git0+748c9571f3
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+81b24e0153 to 0+git0+748c9571f3
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+81b24e0153 to 0+git0+748c9571f3
packages/x86-64-v3-poky-linux/gn/gn: PKGSIZE changed from 3653816 to 3662008 (+0%)
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+81b24e0153 to 0+git0+748c9571f3

--===============0530895539267617724==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gn-upgrade-to-latest-revision.patch"

RnJvbSBjZmMwNjVhNGYyZGY5NDJkOWJkZGU1OGZkZTI1YjhkNjdhYTMwMTc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDk6MjM6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bjogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2duL2duX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ24vZ25fZ2l0LmJiCmluZGV4IGQ4ODk2NjA5YjEu
LmRhNjI1NWQxNmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2duL2duX2dpdC5iYgpAQCAtNyw3ICs3LDcg
QEAgREVQRU5EUyArPSAibmluamEtbmF0aXZlIgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIx
IgogCiBTUkNfVVJJID0gImdpdDovL2duLmdvb2dsZXNvdXJjZS5jb20vZ247cHJvdG9jb2w9aHR0
cHM7YnJhbmNoPW1haW4iCi1TUkNSRVYgPSAiODFiMjRlMDE1MzFlY2YwZWZmMTJlYzkzNTlhNTU1
ZWMzOTQ0ZWM0ZSIKK1NSQ1JFViA9ICI3NDhjOTU3MWYzZDE4ODIwYTc5ODlhODgwZDVkZGYyMjBl
NTRhZjFiIgogUFYgPSAiMCtnaXQiCiAKIEJCX0dJVF9TSEFMTE9XID0gIiIKLS0gCjIuNDcuMQoK

--===============0530895539267617724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+81b24e0153 to 0+git0+748c9571f3
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+81b24e0153 to 0+git0+748c9571f3
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+81b24e0153 to 0+git0+748c9571f3
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+81b24e0153 to 0+git0+748c9571f3
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+81b24e0153 to 0+git0+748c9571f3
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+81b24e0153 to 0+git0+748c9571f3
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+81b24e0153 to 0+git0+748c9571f3

--===============0530895539267617724==--

