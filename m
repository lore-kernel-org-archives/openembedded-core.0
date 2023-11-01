Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5D7C07CA9
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:13 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.8668.1698848705709708367
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ID6Fd5wE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mry66IhE;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.191, mailfrom: 0101018b8b4609d3-881f1369-f161-4686-8116-6938239fdb61-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Gf/GJEC8ZWw9D3KDf+51ql2KjPkkyALatzmv24hrsMM=;
	b=ID6Fd5wEeDhj1T8LR5hdQG9QjiNEFzflAG0T7xSDYnwhZP06OQJX28ESjIXq5aSo
	HDIIpZB+ZvB8TKbPP/ymZM1mBoHLGY0KdA7l7XEvN0x9bRSiBtIEn45ZNENDXPreCpf
	uW1fVwyI2KI+SRWryeq6TrUII2rRUEtB3hSnn7ZE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Gf/GJEC8ZWw9D3KDf+51ql2KjPkkyALatzmv24hrsMM=;
	b=mry66IhEkqIPEPKgfZ3lwB540ZTxpVWrk8M+omNgh1cJZr/OT63sFaQ1cR9PBGMM
	XDqEfhQREL+mDDH6TFEPk/IO4dUFISPq19mUU5VYYHED3oc78MuAkZ5/b6JykgSvIVx
	6k+xTLiEjNVBxTVyT6qN35axacItch2NQiXQPgp0=
Content-Type: multipart/mixed; boundary="===============4829560961629904551=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtirpc: upgrading to 1.3.4 SUCCEEDED
Message-ID: <0101018b8b4609d3-881f1369-f161-4686-8116-6938239fdb61-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190000

--===============4829560961629904551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libtirpc* to *1.3.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtirpc-upgrade-1.3.3-1.3.4.patch
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
From 47478c626cd0288a0ceac3bea4e89497237a65c7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 11:26:42 +0000
Subject: [PATCH] libtirpc: upgrade 1.3.3 -> 1.3.4

---
 .../libtirpc/{libtirpc_1.3.3.bb => libtirpc_1.3.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libtirpc/{libtirpc_1.3.3.bb => libtirpc_1.3.4.bb} (93%)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb
similarity index 93%
rename from meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb
rename to meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb
index 898a952a8b..16c7a6007a 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
 "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
-SRC_URI[sha256sum] = "6474e98851d9f6f33871957ddee9714fdcd9d8a5ee9abb5a98d63ea2e60e12f3"
+SRC_URI[sha256sum] = "1e0b0c7231c5fa122e06c0609a76723664d068b0dba3b8219b63e6340b347860"
 
 CVE_STATUS[CVE-2021-46828] = "fixed-version: fixed in 1.3.3rc1 so not present in 1.3.3"
 
-- 
2.39.2


--===============4829560961629904551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libtirpc: PV changed from "1.3.3" to "1.3.4"
packages/core2-64-poky-linux/libtirpc: SRC_URI changed from "https://downloads.sourceforge.net/libtirpc/libtirpc-1.3.3.tar.bz2 file://ipv6.patch" to "https://downloads.sourceforge.net/libtirpc/libtirpc-1.3.4.tar.bz2 file://ipv6.patch"
packages/core2-64-poky-linux/libtirpc: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-64-poky-linux/libtirpc/libtirpc-dbg: PV changed from "1.3.3" to "1.3.4"
packages/core2-64-poky-linux/libtirpc/libtirpc-dbg: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-64-poky-linux/libtirpc/libtirpc-dbg: PKGSIZE changed from 615392 to 617664 (+0%)
packages/core2-64-poky-linux/libtirpc/libtirpc-dev: PV changed from "1.3.3" to "1.3.4"
packages/core2-64-poky-linux/libtirpc/libtirpc-dev: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-64-poky-linux/libtirpc/libtirpc-doc: PV changed from "1.3.3" to "1.3.4"
packages/core2-64-poky-linux/libtirpc/libtirpc-doc: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-64-poky-linux/libtirpc/libtirpc-locale: PV changed from "1.3.3" to "1.3.4"
packages/core2-64-poky-linux/libtirpc/libtirpc-locale: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-64-poky-linux/libtirpc/libtirpc-src: PV changed from "1.3.3" to "1.3.4"
packages/core2-64-poky-linux/libtirpc/libtirpc-src: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-64-poky-linux/libtirpc/libtirpc-src: PKGSIZE changed from 672330 to 674982 (+0%)
packages/core2-64-poky-linux/libtirpc/libtirpc-staticdev: PV changed from "1.3.3" to "1.3.4"
packages/core2-64-poky-linux/libtirpc/libtirpc-staticdev: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-64-poky-linux/libtirpc/libtirpc: PV changed from "1.3.3" to "1.3.4"
packages/core2-64-poky-linux/libtirpc/libtirpc: PKGV changed from 1.3.3 [default] to 1.3.4 [default]

--===============4829560961629904551==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtirpc-upgrade-1.3.3-1.3.4.patch"

RnJvbSA0NzQ3OGM2MjZjZDAyODhhMGNlYWMzYmVhNGU4OTQ5NzIzN2E2NWM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMToyNjo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnRpcnBjOiB1cGdyYWRlIDEuMy4zIC0+IDEuMy40CgotLS0KIC4uLi9saWJ0aXJwYy97bGlidGly
cGNfMS4zLjMuYmIgPT4gbGlidGlycGNfMS4zLjQuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9saWJ0aXJwYy97bGlidGlycGNfMS4zLjMuYmIgPT4gbGlidGlycGNfMS4z
LjQuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBj
L2xpYnRpcnBjXzEuMy4zLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBjL2xpYnRp
cnBjXzEuMy40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC9saWJ0aXJwYy9saWJ0aXJwY18xLjMuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2xpYnRpcnBjL2xpYnRpcnBjXzEuMy40LmJiCmluZGV4IDg5OGE5NTJhOGIu
LjE2YzdhNjAwN2EgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ0aXJwYy9s
aWJ0aXJwY18xLjMuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlidGlycGMvbGli
dGlycGNfMS4zLjQuYmIKQEAgLTE0LDcgKzE0LDcgQEAgU1JDX1VSSSA9ICIke1NPVVJDRUZPUkdF
X01JUlJPUn0vJHtCUE59LyR7QlB9LnRhci5iejIgXAogIgogVVBTVFJFQU1fQ0hFQ0tfVVJJID0g
Imh0dHBzOi8vc291cmNlZm9yZ2UubmV0L3Byb2plY3RzL2xpYnRpcnBjL2ZpbGVzL2xpYnRpcnBj
LyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIig/UDxwdmVyPlxkKyhcLlxkKykrKS8iCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNjQ3NGU5ODg1MWQ5ZjZmMzM4NzE5NTdkZGVlOTcxNGZkY2Q5ZDhh
NWVlOWFiYjVhOThkNjNlYTJlNjBlMTJmMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxZTBiMGM3
MjMxYzVmYTEyMmUwNmMwNjA5YTc2NzIzNjY0ZDA2OGIwZGJhM2I4MjE5YjYzZTYzNDBiMzQ3ODYw
IgogCiBDVkVfU1RBVFVTW0NWRS0yMDIxLTQ2ODI4XSA9ICJmaXhlZC12ZXJzaW9uOiBmaXhlZCBp
biAxLjMuM3JjMSBzbyBub3QgcHJlc2VudCBpbiAxLjMuMyIKIAotLSAKMi4zOS4yCgo=

--===============4829560961629904551==--

