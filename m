Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C5FC3065A
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.13582.1713248037649172335
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KYw4zBP0;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ahbzYYWB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018ee58a6790-26d1b73f-c342-4588-88c5-c50544de7e43-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248036;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=V2r9pF7x24GaichUlfIgsaHU7sqPYG1paih43BBFvKI=;
	b=KYw4zBP0ljwVMdRCuMfZQO1UOb3TlSDRhqvGFpAxQldlLEJCktzVXLtHHTFG838G
	uym51JVf6k8erpyGDR9MKRbkc7j7g6+ZWmkmAHxcUg5dBEKslGmY5rehQ4z9uQQmshV
	BAZIc1kJqCinj0Zrd090xYpgZQoSYpeE8h3zg/BQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248036;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=V2r9pF7x24GaichUlfIgsaHU7sqPYG1paih43BBFvKI=;
	b=ahbzYYWBmrq8Sk3vGrM3wxb7RzJMRs1xLEL1Dzik5wQ8XqnQSNS3wdu15hXSQtKx
	Sk7May3J1yCcONLRK7DptswaVm5FQGS7ZF6rZkJRCGXOVjoDTZVfRA6l9nThgC7tuo+
	vZ6gg6dX/vcy2LfbyF/9gf1SvAAu+lYbt2R9oxCY=
Content-Type: multipart/mixed; boundary="===============1017225659415114518=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ell: upgrading to 0.64 SUCCEEDED
Message-ID: <0101018ee58a6790-26d1b73f-c342-4588-88c5-c50544de7e43-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198257

--===============1017225659415114518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ell* to *0.64* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ell-upgrade-0.63-0.64.patch
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
From 0d80b7545e37585eca26b08faeaf718819a825db Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 17:55:47 +0000
Subject: [PATCH] ell: upgrade 0.63 -> 0.64

---
 meta/recipes-core/ell/{ell_0.63.bb => ell_0.64.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.63.bb => ell_0.64.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.63.bb b/meta/recipes-core/ell/ell_0.64.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.63.bb
rename to meta/recipes-core/ell/ell_0.64.bb
index 7ecb63a478..c4f16905fd 100644
--- a/meta/recipes-core/ell/ell_0.63.bb
+++ b/meta/recipes-core/ell/ell_0.64.bb
@@ -15,7 +15,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7397c76996d7646b9917ebf016cd67586b10166295af2e0e18cdb5b8f6659965"
+SRC_URI[sha256sum] = "760f3901078409f66cadf1bb24c8bdc60f13d53f6dd66b88631221d2494f8405"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.42.0


--===============1017225659415114518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ell/ell-dbg: PV changed from "0.63" to "0.64"
packages/core2-64-poky-linux/ell/ell-dbg: PKGSIZE changed from 1718680 to 1718864 (+0%)
packages/core2-64-poky-linux/ell/ell-dbg: PKGV changed from 0.63 [default] to 0.64 [default]
packages/core2-64-poky-linux/ell/ell-dev: PV changed from "0.63" to "0.64"
packages/core2-64-poky-linux/ell/ell-dev: PKGSIZE changed from 120820 to 121969 (+1%)
packages/core2-64-poky-linux/ell/ell-dev: PKGV changed from 0.63 [default] to 0.64 [default]
packages/core2-64-poky-linux/ell/ell-doc: PV changed from "0.63" to "0.64"
packages/core2-64-poky-linux/ell/ell-doc: PKGV changed from 0.63 [default] to 0.64 [default]
packages/core2-64-poky-linux/ell/ell-locale: PV changed from "0.63" to "0.64"
packages/core2-64-poky-linux/ell/ell-locale: PKGV changed from 0.63 [default] to 0.64 [default]
packages/core2-64-poky-linux/ell/ell-src: PV changed from "0.63" to "0.64"
packages/core2-64-poky-linux/ell/ell-src: PKGSIZE changed from 1398069 to 1399366 (+0%)
packages/core2-64-poky-linux/ell/ell-src: PKGV changed from 0.63 [default] to 0.64 [default]
packages/core2-64-poky-linux/ell/ell-staticdev: PV changed from "0.63" to "0.64"
packages/core2-64-poky-linux/ell/ell-staticdev: PKGV changed from 0.63 [default] to 0.64 [default]
packages/core2-64-poky-linux/ell/ell: PV changed from "0.63" to "0.64"
packages/core2-64-poky-linux/ell/ell: PKGV changed from 0.63 [default] to 0.64 [default]
packages/core2-64-poky-linux/ell: PV changed from "0.63" to "0.64"
packages/core2-64-poky-linux/ell: PKGV changed from 0.63 [default] to 0.64 [default]
packages/core2-64-poky-linux/ell: SRC_URI changed from "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.63.tar.xz" to "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.64.tar.xz"

--===============1017225659415114518==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ell-upgrade-0.63-0.64.patch"

RnJvbSAwZDgwYjc1NDVlMzc1ODVlY2EyNmIwOGZhZWFmNzE4ODE5YTgyNWRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTc6NTU6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bGw6IHVwZ3JhZGUgMC42MyAtPiAwLjY0CgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL2VsbC97ZWxs
XzAuNjMuYmIgPT4gZWxsXzAuNjQuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZWxsL3tlbGxf
MC42My5iYiA9PiBlbGxfMC42NC5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29yZS9lbGwvZWxsXzAuNjMuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuNjQuYmIK
c2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvZWxsL2Vs
bF8wLjYzLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuNjQuYmIKaW5k
ZXggN2VjYjYzYTQ3OC4uYzRmMTY5MDVmZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUv
ZWxsL2VsbF8wLjYzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC42NC5iYgpA
QCAtMTUsNyArMTUsNyBAQCBERVBFTkRTID0gImRidXMiCiBpbmhlcml0IGF1dG90b29scyBwa2dj
b25maWcKIAogU1JDX1VSSSA9ICJodHRwczovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1Yi9s
aW51eC9saWJzLyR7QlBOfS8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjczOTdjNzY5OTZkNzY0NmI5OTE3ZWJmMDE2Y2Q2NzU4NmIxMDE2NjI5NWFmMmUwZTE4Y2Ri
NWI4ZjY2NTk5NjUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzYwZjM5MDEwNzg0MDlmNjZjYWRm
MWJiMjRjOGJkYzYwZjEzZDUzZjZkZDY2Yjg4NjMxMjIxZDI0OTRmODQwNSIKIAogZG9fY29uZmln
dXJlOnByZXBlbmQgKCkgewogICAgIG1rZGlyIC1wICR7U30vYnVpbGQtYXV4Ci0tIAoyLjQyLjAK
Cg==

--===============1017225659415114518==--

