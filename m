Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F92AC54E4A
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:17 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.36971.1709330715941082491
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cWKOxnIK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=J2ClKa+f;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018dfc0cd1a3-9cc1d0d7-a4d8-40a3-a504-9afd2123713f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330715;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oWVkoY9Ui8Ljgbt6swhU33vEYGyac9TBAy45CUax2Oo=;
	b=cWKOxnIKOv/PKRIPcDjUzrkV5TFa8mG44+E0aOVSqpF5LX5dU4Y5JIEXOHnjBg69
	KkEB6NJp6ulquA3Hnr60NJo0zfSq+6DanCDUQQo9Ws211j6k2f9Hf5bxdGt6KssJ8/X
	d07y8ru6Tu4DiTqw98Ffsl0qM6UI3OD2i10vfjQQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330715;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oWVkoY9Ui8Ljgbt6swhU33vEYGyac9TBAy45CUax2Oo=;
	b=J2ClKa+fUZ9QjDF1BBwWLrNr93fAFeJA/54ixu97/F66DfQXqEOXO/WDd8lR7oSE
	HigT9msLdAVCKZxZ+x8t3UrzButUNgQX5t+M+jL3iFRE3HIp1n+hMN2dWcYfY6BTKYm
	ecL2Y/SzSnXUgzr4oMPr+pTrXypNWzjmVKZ3fpIM=
Content-Type: multipart/mixed; boundary="===============3053725072485445423=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ell: upgrading to 0.63 SUCCEEDED
Message-ID: <0101018dfc0cd1a3-9cc1d0d7-a4d8-40a3-a504-9afd2123713f-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196465

--===============3053725072485445423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ell* to *0.63* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ell-upgrade-0.62-0.63.patch
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
From 4ed1321b1ad69bb3560123f71986d8a494dca05f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 10:12:20 +0000
Subject: [PATCH] ell: upgrade 0.62 -> 0.63

---
 meta/recipes-core/ell/{ell_0.62.bb => ell_0.63.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.62.bb => ell_0.63.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.62.bb b/meta/recipes-core/ell/ell_0.63.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.62.bb
rename to meta/recipes-core/ell/ell_0.63.bb
index c6ec91afb4..7ecb63a478 100644
--- a/meta/recipes-core/ell/ell_0.62.bb
+++ b/meta/recipes-core/ell/ell_0.63.bb
@@ -15,7 +15,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f1efae12085610049714dc509c6fab3478925801609ad4232ce873b7daf1e03d"
+SRC_URI[sha256sum] = "7397c76996d7646b9917ebf016cd67586b10166295af2e0e18cdb5b8f6659965"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.42.0


--===============3053725072485445423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ell/ell-dbg: PKGSIZE changed from 1718568 to 1718680 (+0%)
packages/core2-64-poky-linux/ell/ell-dbg: PKGV changed from 0.62 [default] to 0.63 [default]
packages/core2-64-poky-linux/ell/ell-dbg: PV changed from "0.62" to "0.63"
packages/core2-64-poky-linux/ell/ell-dev: PKGSIZE changed from 120713 to 120820 (+0%)
packages/core2-64-poky-linux/ell/ell-dev: PKGV changed from 0.62 [default] to 0.63 [default]
packages/core2-64-poky-linux/ell/ell-dev: PV changed from "0.62" to "0.63"
packages/core2-64-poky-linux/ell/ell-doc: PKGV changed from 0.62 [default] to 0.63 [default]
packages/core2-64-poky-linux/ell/ell-doc: PV changed from "0.62" to "0.63"
packages/core2-64-poky-linux/ell/ell-locale: PKGV changed from 0.62 [default] to 0.63 [default]
packages/core2-64-poky-linux/ell/ell-locale: PV changed from "0.62" to "0.63"
packages/core2-64-poky-linux/ell/ell-src: PKGSIZE changed from 1397958 to 1398069 (+0%)
packages/core2-64-poky-linux/ell/ell-src: PKGV changed from 0.62 [default] to 0.63 [default]
packages/core2-64-poky-linux/ell/ell-src: PV changed from "0.62" to "0.63"
packages/core2-64-poky-linux/ell/ell-staticdev: PKGV changed from 0.62 [default] to 0.63 [default]
packages/core2-64-poky-linux/ell/ell-staticdev: PV changed from "0.62" to "0.63"
packages/core2-64-poky-linux/ell/ell: PKGV changed from 0.62 [default] to 0.63 [default]
packages/core2-64-poky-linux/ell/ell: PV changed from "0.62" to "0.63"
packages/core2-64-poky-linux/ell: SRC_URI changed from "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.62.tar.xz" to "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.63.tar.xz"
packages/core2-64-poky-linux/ell: PKGV changed from 0.62 [default] to 0.63 [default]
packages/core2-64-poky-linux/ell: PV changed from "0.62" to "0.63"

--===============3053725072485445423==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ell-upgrade-0.62-0.63.patch"

RnJvbSA0ZWQxMzIxYjFhZDY5YmIzNTYwMTIzZjcxOTg2ZDhhNDk0ZGNhMDVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxMDoxMjoyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVs
bDogdXBncmFkZSAwLjYyIC0+IDAuNjMKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUvZWxsL3tlbGxf
MC42Mi5iYiA9PiBlbGxfMC42My5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9lbGwve2VsbF8w
LjYyLmJiID0+IGVsbF8wLjYzLmJifSAoODklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL2VsbC9lbGxfMC42Mi5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC42My5iYgpz
aW1pbGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxs
XzAuNjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC42My5iYgppbmRl
eCBjNmVjOTFhZmI0Li43ZWNiNjNhNDc4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9l
bGwvZWxsXzAuNjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZWxsL2VsbF8wLjYzLmJiCkBA
IC0xNSw3ICsxNSw3IEBAIERFUEVORFMgPSAiZGJ1cyIKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2Nv
bmZpZwogCiBTUkNfVVJJID0gImh0dHBzOi8vbWlycm9ycy5lZGdlLmtlcm5lbC5vcmcvcHViL2xp
bnV4L2xpYnMvJHtCUE59LyR7QlBOfS0ke1BWfS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZjFlZmFlMTIwODU2MTAwNDk3MTRkYzUwOWM2ZmFiMzQ3ODkyNTgwMTYwOWFkNDIzMmNlODcz
YjdkYWYxZTAzZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3Mzk3Yzc2OTk2ZDc2NDZiOTkxN2Vi
ZjAxNmNkNjc1ODZiMTAxNjYyOTVhZjJlMGUxOGNkYjViOGY2NjU5OTY1IgogCiBkb19jb25maWd1
cmU6cHJlcGVuZCAoKSB7CiAgICAgbWtkaXIgLXAgJHtTfS9idWlsZC1hdXgKLS0gCjIuNDIuMAoK

--===============3053725072485445423==--

