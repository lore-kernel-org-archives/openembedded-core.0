Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA27C531D4
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:48 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1389.1771440098848526382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cK37jflT;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cja9B7lB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019c720ecf1b-045c38a9-72cb-43e0-992c-0f95c4a363b8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440099;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6s/P/F9SCRsDFlw0zmS3z2YpWQ6PbD0/yDjO3k0Gj4g=;
	b=cK37jflTOGWzQtwtQAwUNaaNyZTWy6KmmGTRVscrCUt2kd6At23rUBmF3XrUJnp9
	JQUoBmd7c4Z7FmpOOfzEcTxOuhNV7EbBg/a0SZC+x9eZRpTF4lyl4/JEIG0RfM86pio
	NZEMXGToAbyTCZkNqgVpgrh+THJMpHySHj6TvhdE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440099;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6s/P/F9SCRsDFlw0zmS3z2YpWQ6PbD0/yDjO3k0Gj4g=;
	b=cja9B7lBDmKTj9sSzH6suqM8DHUejceg6I+TMfsxPd7+IyXhq9+5wQEZQW1J4iXC
	/yBjgdW/UtOoO4utpjqw4IOQ6PSjOWaP2xE9exL/L9x8J7r+Ca/wqfZ6t7rygc4bfw4
	GT+NPY26XSlLURwEFB5OyMD5SodSd9cXm29svz/I=
Content-Type: multipart/mixed; boundary="===============4144624519255023961=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ttyrun: upgrading to 2.41.0 SUCCEEDED
Message-ID: <0101019c720ecf1b-045c38a9-72cb-43e0-992c-0f95c4a363b8-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231340

--===============4144624519255023961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ttyrun* to *2.41.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ttyrun-upgrade-2.40.0-2.41.0.patch
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
From e2ca94a321aaa19fcd94ce890b5dfa470b8f4bf5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 12:22:44 +0000
Subject: [PATCH] ttyrun: upgrade 2.40.0 -> 2.41.0

---
 meta/recipes-core/ttyrun/{ttyrun_2.40.0.bb => ttyrun_2.41.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.40.0.bb => ttyrun_2.41.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.40.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.41.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.40.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.41.0.bb
index 974b0a8aa0..59dfab7122 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.40.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.41.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "aca6704cfa27434452580369b4bc8a024bd0edee"
+SRCREV = "5e07b30bdf67623e7a6d3850e26208b642d416d7"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.47.1


--===============4144624519255023961==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ttyrun-upgrade-2.40.0-2.41.0.patch"

RnJvbSBlMmNhOTRhMzIxYWFhMTlmY2Q5NGNlODkwYjVkZmE0NzBiOGY0YmY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTI6MjI6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
dHlydW46IHVwZ3JhZGUgMi40MC4wIC0+IDIuNDEuMAoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS90
dHlydW4ve3R0eXJ1bl8yLjQwLjAuYmIgPT4gdHR5cnVuXzIuNDEuMC5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29yZS90dHlydW4ve3R0eXJ1bl8yLjQwLjAuYmIgPT4gdHR5cnVuXzIuNDEuMC5iYn0g
KDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuNDAu
MC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi40MS4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5f
Mi40MC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuNDEu
MC5iYgppbmRleCA5NzRiMGE4YWEwLi41OWRmYWI3MTIyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS90dHlydW4vdHR5cnVuXzIuNDAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS90
dHlydW4vdHR5cnVuXzIuNDEuMC5iYgpAQCAtNyw3ICs3LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mNTExOGYxNjdiMDU1YmZkN2Mz
NDUwODAzZjE4NDdhZiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2libS1zMzkwLWxp
bnV4L3MzOTAtdG9vbHM7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3Rlcjt0YWc9diR7UFZ9Igot
U1JDUkVWID0gImFjYTY3MDRjZmEyNzQzNDQ1MjU4MDM2OWI0YmM4YTAyNGJkMGVkZWUiCitTUkNS
RVYgPSAiNWUwN2IzMGJkZjY3NjIzZTdhNmQzODUwZTI2MjA4YjY0MmQ0MTZkNyIKIAogQ1ZFX1BS
T0RVQ1QgPSAiczM5MC10b29scyIKIAotLSAKMi40Ny4xCgo=

--===============4144624519255023961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ttyrun: PV changed from "2.40.0" to "2.41.0"
packages/x86-64-v3-poky-linux/ttyrun: PKGV changed from 2.40.0 [default] to 2.41.0 [default]
packages/x86-64-v3-poky-linux/ttyrun: SRC_URI changed from "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v2.40.0" to "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v2.41.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dbg: PV changed from "2.40.0" to "2.41.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dbg: PKGV changed from 2.40.0 [default] to 2.41.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dev: PV changed from "2.40.0" to "2.41.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dev: PKGV changed from 2.40.0 [default] to 2.41.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-doc: PV changed from "2.40.0" to "2.41.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-doc: PKGV changed from 2.40.0 [default] to 2.41.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-locale: PV changed from "2.40.0" to "2.41.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-locale: PKGV changed from 2.40.0 [default] to 2.41.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: PV changed from "2.40.0" to "2.41.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: PKGV changed from 2.40.0 [default] to 2.41.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: FILELIST: directory renamed /usr/src/debug/ttyrun/2.40.0/iucvterm/src -> /usr/src/debug/ttyrun/2.41.0/iucvterm/src
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-staticdev: PV changed from "2.40.0" to "2.41.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-staticdev: PKGV changed from 2.40.0 [default] to 2.41.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun: PV changed from "2.40.0" to "2.41.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun: PKGV changed from 2.40.0 [default] to 2.41.0 [default]

--===============4144624519255023961==--

