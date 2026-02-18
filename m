Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA89C531CC
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:47 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1386.1771440096963301464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SpxPsI8R;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=n8bC/Qcd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019c720ec439-848d68dc-4c90-4645-9999-2e97cd69ae30-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440096;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ANUOhcNvIs2cNjdmoh0jSbyxa/UtiFpgsAAoyYCGeks=;
	b=SpxPsI8R60gh0cHTSGFkGtXIXayU+Y6pkUeAJo94t0YW7r+PjZZcPIC5zkAsFgn2
	Re70RRoSgS6gYOx8SB++yvCUMPWbEgvUmKb6F6eEj9Orl2PM9IhBRApiC1Hr6Hy+wJC
	r//5uEo9InGAc43kmYHvA/t8Mxdi1uQTkFMvQ2XM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440096;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ANUOhcNvIs2cNjdmoh0jSbyxa/UtiFpgsAAoyYCGeks=;
	b=n8bC/QcdbUvbDyKUkBKqcs7Nrt5cAr6490Ijxuk9wyxhvQyPSJMg1JnP45ucF6Tf
	vbjTaBpcqT8GWUhq55jNf09u1VCsuOX0jNRhQUJVa7i9kJ78R8qjnVhOi/BTHbFp0oL
	HTfI27Pn+jawaOmzEfVOPg2LZZu/o74uwRGoWlNY=
Content-Type: multipart/mixed; boundary="===============7164926695527620192=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] font-alias: upgrading to 1.0.6 SUCCEEDED
Message-ID: <0101019c720ec439-848d68dc-4c90-4645-9999-2e97cd69ae30-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231328

--===============7164926695527620192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *font-alias* to *1.0.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-font-alias-upgrade-1.0.5-1.0.6.patch
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
From ce850ae3a6b93a74199c9bbafb4b2438510277f3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 10:50:55 +0000
Subject: [PATCH] font-alias: upgrade 1.0.5 -> 1.0.6

---
 .../xorg-font/{font-alias_1.0.5.bb => font-alias_1.0.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-font/{font-alias_1.0.5.bb => font-alias_1.0.6.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-font/font-alias_1.0.5.bb b/meta/recipes-graphics/xorg-font/font-alias_1.0.6.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-font/font-alias_1.0.5.bb
rename to meta/recipes-graphics/xorg-font/font-alias_1.0.6.bb
index 03c39a4334..908df1ebd1 100644
--- a/meta/recipes-graphics/xorg-font/font-alias_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-font/font-alias_1.0.6.bb
@@ -19,4 +19,4 @@ inherit allarch
 
 PE = "1"
 
-SRC_URI[sha256sum] = "9f89e217bb73e0e3636a0a493fbf8b7c995156e0c53d9a0476d201b67c2d6b6e"
+SRC_URI[sha256sum] = "f6a5e968b616e728a981fd1fd9ed5fe2ca0fe18fbe072b1888cb3f71b701e4c0"
-- 
2.47.1


--===============7164926695527620192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/font-alias/font-alias-dbg: PV changed from "1.0.5" to "1.0.6"
packages/all-poky-linux/font-alias/font-alias-dbg: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/all-poky-linux/font-alias/font-alias-dev: PV changed from "1.0.5" to "1.0.6"
packages/all-poky-linux/font-alias/font-alias-dev: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/all-poky-linux/font-alias/font-alias-doc: PV changed from "1.0.5" to "1.0.6"
packages/all-poky-linux/font-alias/font-alias-doc: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/all-poky-linux/font-alias/font-alias-locale: PV changed from "1.0.5" to "1.0.6"
packages/all-poky-linux/font-alias/font-alias-locale: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/all-poky-linux/font-alias/font-alias-src: PV changed from "1.0.5" to "1.0.6"
packages/all-poky-linux/font-alias/font-alias-src: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/all-poky-linux/font-alias/font-alias-staticdev: PV changed from "1.0.5" to "1.0.6"
packages/all-poky-linux/font-alias/font-alias-staticdev: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/all-poky-linux/font-alias/font-alias: PV changed from "1.0.5" to "1.0.6"
packages/all-poky-linux/font-alias/font-alias: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/all-poky-linux/font-alias: PV changed from "1.0.5" to "1.0.6"
packages/all-poky-linux/font-alias: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/all-poky-linux/font-alias: SRC_URI changed from "https://www.x.org/releases//individual/font/font-alias-1.0.5.tar.xz" to "https://www.x.org/releases//individual/font/font-alias-1.0.6.tar.xz"

--===============7164926695527620192==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-font-alias-upgrade-1.0.5-1.0.6.patch"

RnJvbSBjZTg1MGFlM2E2YjkzYTc0MTk5YzliYmFmYjRiMjQzODUxMDI3N2YzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTA6NTA6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
b250LWFsaWFzOiB1cGdyYWRlIDEuMC41IC0+IDEuMC42CgotLS0KIC4uLi94b3JnLWZvbnQve2Zv
bnQtYWxpYXNfMS4wLjUuYmIgPT4gZm9udC1hbGlhc18xLjAuNi5iYn0gICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLWZvbnQve2ZvbnQtYWxpYXNfMS4wLjUuYmIgPT4gZm9udC1h
bGlhc18xLjAuNi5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
eG9yZy1mb250L2ZvbnQtYWxpYXNfMS4wLjUuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy1mb250L2ZvbnQtYWxpYXNfMS4wLjYuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZm9udC9mb250LWFsaWFzXzEuMC41LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1mb250L2ZvbnQtYWxpYXNfMS4wLjYu
YmIKaW5kZXggMDNjMzlhNDMzNC4uOTA4ZGYxZWJkMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmctZm9udC9mb250LWFsaWFzXzEuMC41LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWZvbnQvZm9udC1hbGlhc18xLjAuNi5iYgpAQCAtMTksNCArMTksNCBA
QCBpbmhlcml0IGFsbGFyY2gKIAogUEUgPSAiMSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjlm
ODllMjE3YmI3M2UwZTM2MzZhMGE0OTNmYmY4YjdjOTk1MTU2ZTBjNTNkOWEwNDc2ZDIwMWI2N2My
ZDZiNmUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjZhNWU5NjhiNjE2ZTcyOGE5ODFmZDFmZDll
ZDVmZTJjYTBmZTE4ZmJlMDcyYjE4ODhjYjNmNzFiNzAxZTRjMCIKLS0gCjIuNDcuMQoK

--===============7164926695527620192==--

