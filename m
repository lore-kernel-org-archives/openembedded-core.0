Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775F0C88E69
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 05:40:45 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13649.1789364445024101933
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 22:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GRrbm6RD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=yIBG7bb3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a09e6e9c23-0beecf16-cab6-4076-84d3-72264e79523f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789364444;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=OQP37Fw8kJZ47LzzaI+7I/KV8xBngk46oQkedrWDpVs=;
	b=GRrbm6RDcHAi6gyPozLVxLxDRM3AMN+OSTsADebKPR2PijSQ56U14F+QEFs0oy0s
	WPLq9AiyXnp0RuQhht520nEFZZwf+sLjPmll7Mr3BUMTuau2Pst5uqQnyJgGD3DMH5Q
	dTed0pSAwV/nd1XBQkun3vUrfQPr+xdKQcHmb46g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789364444;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=OQP37Fw8kJZ47LzzaI+7I/KV8xBngk46oQkedrWDpVs=;
	b=yIBG7bb3HmFEs1GAGdl+xNj4Biyl7y+5yUskSrIXuuwSUvOh/cLw92L5fzDj1xgx
	+H1ao0LWf1eQ4KDkmaqxg3+AbFZjE9cXL5uUF4etGNfRH2PBBhGBJYZLWIpL63v9uEH
	cQLoSp6IDLKfREz2A73hzTLSPBvxhnhOG1hYsKkM=
Content-Type: multipart/mixed; boundary="===============3441873538364033705=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libtirpc: upgrading to 1.3.8 SUCCEEDED
Message-ID: <010101a09e6e9c23-0beecf16-cab6-4076-84d3-72264e79523f-000000@us-west-2.amazonses.com>
Date: Mon, 14 Sep 2026 05:40:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.14-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245752

--===============3441873538364033705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtirpc* to *1.3.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtirpc-upgrade-1.3.7-1.3.8.patch
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
From 6c1b07a9b43aa5f61e1bc78bb1c22763c3401ae2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 14 Sep 2026 05:29:50 +0000
Subject: [PATCH] libtirpc: upgrade 1.3.7 -> 1.3.8

---
 ...0001-libtirpc-fix-bindresvport-build-with-clang-22-C23.patch | 2 +-
 .../libtirpc/{libtirpc_1.3.7.bb => libtirpc_1.3.8.bb}           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libtirpc/{libtirpc_1.3.7.bb => libtirpc_1.3.8.bb} (93%)

diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-libtirpc-fix-bindresvport-build-with-clang-22-C23.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-libtirpc-fix-bindresvport-build-with-clang-22-C23.patch
index 4e5844e18e..1d2a9bf287 100644
--- a/meta/recipes-extended/libtirpc/libtirpc/0001-libtirpc-fix-bindresvport-build-with-clang-22-C23.patch
+++ b/meta/recipes-extended/libtirpc/libtirpc/0001-libtirpc-fix-bindresvport-build-with-clang-22-C23.patch
@@ -1,4 +1,4 @@
-From 0ae4371ee63e25a48777a83c0601c85c5747cbac Mon Sep 17 00:00:00 2001
+From 801ec3f723fcf6d531cb57c9f3c6ec1c51b5eb54 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Tue, 31 Mar 2026 23:07:09 -0700
 Subject: [PATCH] libtirpc: fix bindresvport build with clang-22/C23
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.8.bb
similarity index 93%
rename from meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
rename to meta/recipes-extended/libtirpc/libtirpc_1.3.8.bb
index cef541e3d0..6d95f3f69d 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.8.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
           "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
-SRC_URI[sha256sum] = "b47d3ac19d3549e54a05d0019a6c400674da716123858cfdb6d3bdd70a66c702"
+SRC_URI[sha256sum] = "8839959bfcc7a0f4c609d8e4f53f1c67ae33de23775ec35beb39ff15adf11920"
 
 inherit autotools pkgconfig
 
-- 
2.47.1


--===============3441873538364033705==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtirpc-upgrade-1.3.7-1.3.8.patch"

RnJvbSA2YzFiMDdhOWI0M2FhNWY2MWUxYmM3OGJiMWMyMjc2M2MzNDAxYWUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTQgU2VwIDIwMjYgMDU6Mjk6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ0aXJwYzogdXBncmFkZSAxLjMuNyAtPiAxLjMuOAoKLS0tCiAuLi4wMDAxLWxpYnRpcnBjLWZp
eC1iaW5kcmVzdnBvcnQtYnVpbGQtd2l0aC1jbGFuZy0yMi1DMjMucGF0Y2ggfCAyICstCiAuLi4v
bGlidGlycGMve2xpYnRpcnBjXzEuMy43LmJiID0+IGxpYnRpcnBjXzEuMy44LmJifSAgICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlidGlycGMve2xpYnRpcnBjXzEuMy43
LmJiID0+IGxpYnRpcnBjXzEuMy44LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9saWJ0aXJwYy9saWJ0aXJwYy8wMDAxLWxpYnRpcnBjLWZpeC1iaW5kcmVzdnBv
cnQtYnVpbGQtd2l0aC1jbGFuZy0yMi1DMjMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bGlidGlycGMvbGlidGlycGMvMDAwMS1saWJ0aXJwYy1maXgtYmluZHJlc3Zwb3J0LWJ1aWxkLXdp
dGgtY2xhbmctMjItQzIzLnBhdGNoCmluZGV4IDRlNTg0NGUxOGUuLjFkMmE5YmYyODcgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ0aXJwYy9saWJ0aXJwYy8wMDAxLWxpYnRp
cnBjLWZpeC1iaW5kcmVzdnBvcnQtYnVpbGQtd2l0aC1jbGFuZy0yMi1DMjMucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBjL2xpYnRpcnBjLzAwMDEtbGlidGlycGMtZml4
LWJpbmRyZXN2cG9ydC1idWlsZC13aXRoLWNsYW5nLTIyLUMyMy5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gMGFlNDM3MWVlNjNlMjVhNDg3NzdhODNjMDYwMWM4NWM1NzQ3Y2JhYyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODAxZWMzZjcyM2ZjZjZkNTMxY2I1N2M5ZjNjNmVjMWM1
MWI1ZWI1NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxraGVtLnJh
akBvc3MucXVhbGNvbW0uY29tPgogRGF0ZTogVHVlLCAzMSBNYXIgMjAyNiAyMzowNzowOSAtMDcw
MAogU3ViamVjdDogW1BBVENIXSBsaWJ0aXJwYzogZml4IGJpbmRyZXN2cG9ydCBidWlsZCB3aXRo
IGNsYW5nLTIyL0MyMwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBj
L2xpYnRpcnBjXzEuMy43LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBjL2xpYnRp
cnBjXzEuMy44LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC9saWJ0aXJwYy9saWJ0aXJwY18xLjMuNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2xpYnRpcnBjL2xpYnRpcnBjXzEuMy44LmJiCmluZGV4IGNlZjU0MWUzZDAu
LjZkOTVmM2Y2OWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ0aXJwYy9s
aWJ0aXJwY18xLjMuNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlidGlycGMvbGli
dGlycGNfMS4zLjguYmIKQEAgLTE0LDcgKzE0LDcgQEAgU1JDX1VSSSA9ICIke1NPVVJDRUZPUkdF
X01JUlJPUn0vJHtCUE59LyR7QlB9LnRhci5iejIgXAogICAgICAgICAgICIKIFVQU1RSRUFNX0NI
RUNLX1VSSSA9ICJodHRwczovL3NvdXJjZWZvcmdlLm5ldC9wcm9qZWN0cy9saWJ0aXJwYy9maWxl
cy9saWJ0aXJwYy8iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICIoP1A8cHZlcj5cZCsoXC5cZCsp
KykvIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImI0N2QzYWMxOWQzNTQ5ZTU0YTA1ZDAwMTlhNmM0
MDA2NzRkYTcxNjEyMzg1OGNmZGI2ZDNiZGQ3MGE2NmM3MDIiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiODgzOTk1OWJmY2M3YTBmNGM2MDlkOGU0ZjUzZjFjNjdhZTMzZGUyMzc3NWVjMzViZWIzOWZm
MTVhZGYxMTkyMCIKIAogaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnCiAKLS0gCjIuNDcuMQoK

--===============3441873538364033705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libtirpc: SRC_URI changed from "https://downloads.sourceforge.net/libtirpc/libtirpc-1.3.7.tar.bz2 file://0001-libtirpc-fix-bindresvport-build-with-clang-22-C23.patch" to "https://downloads.sourceforge.net/libtirpc/libtirpc-1.3.8.tar.bz2 file://0001-libtirpc-fix-bindresvport-build-with-clang-22-C23.patch"
packages/x86-64-v3-poky-linux/libtirpc: PKGV changed from 1.3.7 [default] to 1.3.8 [default]
packages/x86-64-v3-poky-linux/libtirpc: PV changed from "1.3.7" to "1.3.8"
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-dbg: PKGV changed from 1.3.7 [default] to 1.3.8 [default]
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-dbg: PKGSIZE changed from 625736 to 626152 (+0%)
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-dbg: PV changed from "1.3.7" to "1.3.8"
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-dev: PKGV changed from 1.3.7 [default] to 1.3.8 [default]
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-dev: PV changed from "1.3.7" to "1.3.8"
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-doc: PKGV changed from 1.3.7 [default] to 1.3.8 [default]
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-doc: PV changed from "1.3.7" to "1.3.8"
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-locale: PKGV changed from 1.3.7 [default] to 1.3.8 [default]
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-locale: PV changed from "1.3.7" to "1.3.8"
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-src: FILELIST: directory renamed /usr/src/debug/libtirpc/1.3.7/src -> /usr/src/debug/libtirpc/1.3.8/src, directory renamed /usr/src/debug/libtirpc/1.3.7/tirpc -> /usr/src/debug/libtirpc/1.3.8/tirpc, directory renamed /usr/src/debug/libtirpc/1.3.7/tirpc/rpc -> /usr/src/debug/libtirpc/1.3.8/tirpc/rpc
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-src: PKGV changed from 1.3.7 [default] to 1.3.8 [default]
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-src: PKGSIZE changed from 671289 to 672098 (+0%)
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-src: PV changed from "1.3.7" to "1.3.8"
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-staticdev: PKGV changed from 1.3.7 [default] to 1.3.8 [default]
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-staticdev: PV changed from "1.3.7" to "1.3.8"
packages/x86-64-v3-poky-linux/libtirpc/libtirpc: PKGV changed from 1.3.7 [default] to 1.3.8 [default]
packages/x86-64-v3-poky-linux/libtirpc/libtirpc: PKGSIZE changed from 171487 to 179679 (+5%)
packages/x86-64-v3-poky-linux/libtirpc/libtirpc: PV changed from "1.3.7" to "1.3.8"

--===============3441873538364033705==--

