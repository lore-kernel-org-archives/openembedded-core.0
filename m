Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF616C072AB
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:12 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.8647.1698848703568689614
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FNsLXtjy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ahV8LNaE;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.192, mailfrom: 0101018b8b460ba7-ba57f2eb-df98-4439-b3cc-e1ccf13d5bff-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1ek0HfZqMe/pu6UI6/1YAXfRzI75/mslbHWF5KcqNJM=;
	b=FNsLXtjy4Eihn7qJ/Ka7B0GgkeEJ/ChlFPrYlgLpbMvkBsKf2couuaG3er/sG2sO
	w8/HjQWyClWtkunnNx1u6C2PH+HeUH+nRrn+Mq3Pawd+ujDQSBeR/fhCjgBzGUNCLXw
	fqR58b3CMNIhEAnc8WnwB9EgTOcIoMFn6j4rPX34=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1ek0HfZqMe/pu6UI6/1YAXfRzI75/mslbHWF5KcqNJM=;
	b=ahV8LNaEWLU4NeiwuO5VtZMSjidjwa8Cf9KW7OgNSgdbbkXGJ4E8LNpRynpH4lK+
	mK/9XVEqVExUpCOUui+OmxbhduZiV7tvBmpdowxULU9jYwFM55GP5AG5DaxosGSB9ZK
	Tu03HriqPnAr7IseUPmppQlhhB6apBoSXjPqHBqI=
Content-Type: multipart/mixed; boundary="===============4279959027523607624=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libjpeg-turbo: upgrading to 3.0.1 SUCCEEDED
Message-ID: <0101018b8b460ba7-ba57f2eb-df98-4439-b3cc-e1ccf13d5bff-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190011

--===============4279959027523607624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libjpeg-turbo* to *3.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libjpeg-turbo-upgrade-3.0.0-3.0.1.patch
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
From e71cd2dee89d95ccbec1362b7f80138a2f22c3a8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 12:25:49 +0000
Subject: [PATCH] libjpeg-turbo: upgrade 3.0.0 -> 3.0.1

---
 .../jpeg/{libjpeg-turbo_3.0.0.bb => libjpeg-turbo_3.0.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_3.0.0.bb => libjpeg-turbo_3.0.1.bb} (97%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
similarity index 97%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
index 146d80008c..99ed82dac4 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
@@ -10,7 +10,7 @@ DEPENDS:append:x86:class-target = " nasm-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "c77c65fcce3d33417b2e90432e7a0eb05f59a7fff884022a9d931775d583bfaa"
+SRC_URI[sha256sum] = "22429507714ae147b3acacd299e82099fce5d9f456882fc28e252e4579ba2a75"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.39.2


--===============4279959027523607624==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libjpeg-turbo-upgrade-3.0.0-3.0.1.patch"

RnJvbSBlNzFjZDJkZWU4OWQ5NWNjYmVjMTM2MmI3ZjgwMTM4YTJmMjJjM2E4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMjoyNTo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmpwZWctdHVyYm86IHVwZ3JhZGUgMy4wLjAgLT4gMy4wLjEKCi0tLQogLi4uL2pwZWcve2xpYmpw
ZWctdHVyYm9fMy4wLjAuYmIgPT4gbGlianBlZy10dXJib18zLjAuMS5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcve2xpYmpwZWctdHVyYm9fMy4wLjAuYmIgPT4gbGlianBl
Zy10dXJib18zLjAuMS5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMC4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pw
ZWcvbGlianBlZy10dXJib18zLjAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMC4wLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMC4xLmJiCmlu
ZGV4IDE0NmQ4MDAwOGMuLjk5ZWQ4MmRhYzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4wLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2pwZWcvbGlianBlZy10dXJib18zLjAuMS5iYgpAQCAtMTAsNyArMTAsNyBAQCBERVBFTkRT
OmFwcGVuZDp4ODY6Y2xhc3MtdGFyZ2V0ID0gIiBuYXNtLW5hdGl2ZSIKIAogU1JDX1VSSSA9ICIk
e1NPVVJDRUZPUkdFX01JUlJPUn0vJHtCUE59LyR7QlBOfS0ke1BWfS50YXIuZ3oiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJjNzdjNjVmY2NlM2QzMzQxN2IyZTkwNDMyZTdhMGViMDVmNTlhN2Zm
Zjg4NDAyMmE5ZDkzMTc3NWQ1ODNiZmFhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIyNDI5NTA3
NzE0YWUxNDdiM2FjYWNkMjk5ZTgyMDk5ZmNlNWQ5ZjQ1Njg4MmZjMjhlMjUyZTQ1NzliYTJhNzUi
CiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cDovL3NvdXJjZWZvcmdlLm5ldC9wcm9qZWN0cy9s
aWJqcGVnLXR1cmJvL2ZpbGVzLyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIi9saWJqcGVnLXR1
cmJvL2ZpbGVzLyg/UDxwdmVyPihcZCtbXC5cLV9dKikrKS8iCiAKLS0gCjIuMzkuMgoK

--===============4279959027523607624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libjpeg-turbo/jpeg-tools: PV changed from "3.0.0" to "3.0.1"
packages/core2-64-poky-linux/libjpeg-turbo/jpeg-tools: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/libjpeg-turbo: PV changed from "3.0.0" to "3.0.1"
packages/core2-64-poky-linux/libjpeg-turbo: SRC_URI changed from "https://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-3.0.0.tar.gz" to "https://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-3.0.1.tar.gz"
packages/core2-64-poky-linux/libjpeg-turbo: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGSIZE changed from 5480824 to 5482248 (+0%)
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PV changed from "3.0.0" to "3.0.1"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGSIZE changed from 191588 to 191714 (+0%)
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PV changed from "3.0.0" to "3.0.1"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PKGSIZE changed from 399910 to 401242 (+0%)
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PV changed from "3.0.0" to "3.0.1"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PV changed from "3.0.0" to "3.0.1"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGSIZE changed from 2336793 to 2337251 (+0%)
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PV changed from "3.0.0" to "3.0.1"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PV changed from "3.0.0" to "3.0.1"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo: PV changed from "3.0.0" to "3.0.1"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libturbojpeg: PV changed from "3.0.0" to "3.0.1"
packages/core2-64-poky-linux/libjpeg-turbo/libturbojpeg: PKGV changed from 3.0.0 [default] to 3.0.1 [default]

--===============4279959027523607624==--

