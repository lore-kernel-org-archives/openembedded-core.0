Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF002C27C6E
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.5934.1689456453455337169
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QPEqEBpn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101895b73acd5-43e5e5ed-0ce5-4df9-a15f-eeb7c9f5f148-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZWzp4Gax+plTwLNkH9J+I4gWYdxnDS9Z2JE5X1ifdlc=;
	b=QPEqEBpnjndB7oBG17Diz0H5xahpkWku2lYrvuiLVzw/mmI7x6BO+d9w967VUdwo
	v2J8KORLQlnug9re7mnPMsy6FmUsy7TBJkYh45VT/dSswogIdEBOH/q427TGkRvypX7
	xb6B+D9ryHAMtMw1TKOIQto+fw9aAwlUKhrZTAEs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZWzp4Gax+plTwLNkH9J+I4gWYdxnDS9Z2JE5X1ifdlc=;
	b=crc0IwPD7WqhBTq0PdibDYom4Vu5lEeuQKzZzS+QqGNR6DhccGTboQ7j5JX1mHQE
	mkHMvciZBlPWlsQJWEXBhjP3XSYWXxSiXJJU/0o6cHSIjHD5PqSh7f/1Dv+sdKUz460
	g4VOy69RBgBmIV28jGQ75SKXIm49cSNsaZsS7/6w=
Content-Type: multipart/mixed; boundary="===============1695695193457427989=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ghostscript: upgrading to 10.01.2 SUCCEEDED
Message-ID: <010101895b73acd5-43e5e5ed-0ce5-4df9-a15f-eeb7c9f5f148-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184348

--===============1695695193457427989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ghostscript* to *10.01.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ghostscript-upgrade-10.01.1-10.01.2.patch
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
From abff6ef18fdfcee427d646cc53b2afa77bd16b3e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 15:20:59 +0000
Subject: [PATCH] ghostscript: upgrade 10.01.1 -> 10.01.2

---
 .../{ghostscript_10.01.1.bb => ghostscript_10.01.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.01.1.bb => ghostscript_10.01.2.bb} (96%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
similarity index 96%
rename from meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
index 0d41242bc2..fdbdfb6502 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://avoid-host-contamination.patch \
 "
 
-SRC_URI[sha256sum] = "4df18a808cd4369f25e02dbcec2f133cb6d674627b2c6b1502020e58d43e32ce"
+SRC_URI[sha256sum] = "a4cd61a07fec161bee35da0211a5e5cde8ff8a0aaf942fc0176715e499d21661"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.39.2


--===============1695695193457427989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ghostscript/ghostscript-dbg: PV changed from "10.01.1" to "10.01.2"
packages/core2-32-poky-linux/ghostscript/ghostscript-dbg: PKGV changed from 10.01.1 [default] to 10.01.2 [default]
packages/core2-32-poky-linux/ghostscript/ghostscript-dbg: PKGSIZE changed from 81487976 to 81488496 (+0%)
packages/core2-32-poky-linux/ghostscript/ghostscript-dev: PV changed from "10.01.1" to "10.01.2"
packages/core2-32-poky-linux/ghostscript/ghostscript-dev: PKGV changed from 10.01.1 [default] to 10.01.2 [default]
packages/core2-32-poky-linux/ghostscript/ghostscript-doc: PV changed from "10.01.1" to "10.01.2"
packages/core2-32-poky-linux/ghostscript/ghostscript-doc: PKGV changed from 10.01.1 [default] to 10.01.2 [default]
packages/core2-32-poky-linux/ghostscript/ghostscript-doc: PKGSIZE changed from 11240278 to 11240277 (-0%)
packages/core2-32-poky-linux/ghostscript/ghostscript-locale: PV changed from "10.01.1" to "10.01.2"
packages/core2-32-poky-linux/ghostscript/ghostscript-locale: PKGV changed from 10.01.1 [default] to 10.01.2 [default]
packages/core2-32-poky-linux/ghostscript/ghostscript-src: PV changed from "10.01.1" to "10.01.2"
packages/core2-32-poky-linux/ghostscript/ghostscript-src: PKGV changed from 10.01.1 [default] to 10.01.2 [default]
packages/core2-32-poky-linux/ghostscript/ghostscript-src: PKGSIZE changed from 69696761 to 69699244 (+0%)
packages/core2-32-poky-linux/ghostscript/ghostscript-staticdev: PV changed from "10.01.1" to "10.01.2"
packages/core2-32-poky-linux/ghostscript/ghostscript-staticdev: PKGV changed from 10.01.1 [default] to 10.01.2 [default]
packages/core2-32-poky-linux/ghostscript/ghostscript: PV changed from "10.01.1" to "10.01.2"
packages/core2-32-poky-linux/ghostscript/ghostscript: PKGV changed from 10.01.1 [default] to 10.01.2 [default]
packages/core2-32-poky-linux/ghostscript: PV changed from "10.01.1" to "10.01.2"
packages/core2-32-poky-linux/ghostscript: PKGV changed from 10.01.1 [default] to 10.01.2 [default]
packages/core2-32-poky-linux/ghostscript: SRC_URI changed from "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10011/ghostscript-10.01.1.tar.gz file://ghostscript-9.16-Werror-return-type.patch file://avoid-host-contamination.patch" to "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10012/ghostscript-10.01.2.tar.gz file://ghostscript-9.16-Werror-return-type.patch file://avoid-host-contamination.patch"
Changes to packages/core2-32-poky-linux/ghostscript (sysroot):
  /usr/share/ghostscript/10.01.1 moved to /usr/share/ghostscript/10.01.2

--===============1695695193457427989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/ghostscript (sysroot):
  /usr/share/ghostscript/10.01.1 moved to /usr/share/ghostscript/10.01.2

--===============1695695193457427989==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ghostscript-upgrade-10.01.1-10.01.2.patch"

RnJvbSBhYmZmNmVmMThmZGZjZWU0MjdkNjQ2Y2M1M2IyYWZhNzdiZDE2YjNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTU6MjA6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aG9zdHNjcmlwdDogdXBncmFkZSAxMC4wMS4xIC0+IDEwLjAxLjIKCi0tLQogLi4uL3tnaG9zdHNj
cmlwdF8xMC4wMS4xLmJiID0+IGdob3N0c2NyaXB0XzEwLjAxLjIuYmJ9ICAgICAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L3tnaG9zdHNjcmlwdF8xMC4wMS4xLmJi
ID0+IGdob3N0c2NyaXB0XzEwLjAxLjIuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0XzEwLjAxLjEuYmIgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHRfMTAuMDEuMi5iYgpzaW1pbGFy
aXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3Jp
cHQvZ2hvc3RzY3JpcHRfMTAuMDEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2dob3N0c2NyaXB0L2dob3N0c2NyaXB0XzEwLjAxLjIuYmIKaW5kZXggMGQ0MTI0MmJjMi4uZmRi
ZGZiNjUwMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2do
b3N0c2NyaXB0XzEwLjAxLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2Ny
aXB0L2dob3N0c2NyaXB0XzEwLjAxLjIuYmIKQEAgLTI3LDcgKzI3LDcgQEAgU1JDX1VSSSA9ICJo
dHRwczovL2dpdGh1Yi5jb20vQXJ0aWZleFNvZnR3YXJlL2dob3N0cGRsLWRvd25sb2Fkcy9yZWxl
YXNlcy9kb3dubG8KICAgICAgICAgICAgZmlsZTovL2F2b2lkLWhvc3QtY29udGFtaW5hdGlvbi5w
YXRjaCBcCiAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0ZGYxOGE4MDhjZDQzNjlmMjVlMDJk
YmNlYzJmMTMzY2I2ZDY3NDYyN2IyYzZiMTUwMjAyMGU1OGQ0M2UzMmNlIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gImE0Y2Q2MWEwN2ZlYzE2MWJlZTM1ZGEwMjExYTVlNWNkZThmZjhhMGFhZjk0MmZj
MDE3NjcxNWU0OTlkMjE2NjEiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIiCiBQQUNLQUdFQ09ORklH
W2d0a10gPSAiLS1lbmFibGUtZ3RrLC0tZGlzYWJsZS1ndGssZ3RrKzMiCi0tIAoyLjM5LjIKCg==

--===============1695695193457427989==--

