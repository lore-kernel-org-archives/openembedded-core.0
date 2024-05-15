Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF71C27C75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.1284.1715794338536972189
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=i6Br6r6E;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FtpWA0x0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018f7d4fe37f-b1ce66b7-8ce3-44d2-ad65-f10125792697-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Bxw7hIlmHDCTsalOGTaIH7OuFa5XM2o38uejWy8QkxU=;
	b=i6Br6r6E0v0vJrkKS/bP2CX3eaZpJi/0H2T89vC1Gy/rdHeReD4sv/j0Omhb3EJa
	hpthvoHX1YUABoIjJsawQ9US+o6b0Wuk0lKKC19Tx9kH47ilmEDJ8JXEdIWH7Yd7Tj9
	OY6f0vXFeMhxYSm5SNtmdOnM0QGhK+rKR6X+ZUTM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Bxw7hIlmHDCTsalOGTaIH7OuFa5XM2o38uejWy8QkxU=;
	b=FtpWA0x0AhvtN4hb1uUk1hkiGpUFRDNU6xFhiYdbTgwmY1j1irkjcKtMP8JR7m37
	aWWL5pQnUp1G44VeEw41cN9R61/ixlKLru3IDRyep8NmR0goyPeFoiPBNB+uyKwBwcb
	51X60LaI8z5AJbDWOLhiAcfKQl7yk0otT+libQeo=
Content-Type: multipart/mixed; boundary="===============2675574994257179115=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] msmtp: upgrading to 1.8.26 SUCCEEDED
Message-ID: <0101018f7d4fe37f-b1ce66b7-8ce3-44d2-ad65-f10125792697-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199369

--===============2675574994257179115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *msmtp* to *1.8.26* has Succeeded.

Next steps:
    - apply the patch: git am 0001-msmtp-upgrade-1.8.25-1.8.26.patch
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
From ea3facddaf2bdd7f4a1bf4daddfa4e3e8f066fcb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 12:21:55 +0000
Subject: [PATCH] msmtp: upgrade 1.8.25 -> 1.8.26

---
 .../recipes-extended/msmtp/{msmtp_1.8.25.bb => msmtp_1.8.26.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.25.bb => msmtp_1.8.26.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.25.bb b/meta/recipes-extended/msmtp/msmtp_1.8.26.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.25.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.26.bb
index b575fad5e1..13820fe930 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.25.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.26.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "2dfe1dbbb397d26fe0b0b6b2e9cd2efdf9d72dd42d18e70d7f363ada2652d738"
+SRC_URI[sha256sum] = "6cfc488344cef189267e60aea481f00d4c7e2a59b53c6c659c520a4d121f66d8"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.44.0


--===============2675574994257179115==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-msmtp-upgrade-1.8.25-1.8.26.patch"

RnJvbSBlYTNmYWNkZGFmMmJkZDdmNGExYmY0ZGFkZGZhNGUzZThmMDY2ZmNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTI6MjE6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
c210cDogdXBncmFkZSAxLjguMjUgLT4gMS44LjI2CgotLS0KIC4uLi9yZWNpcGVzLWV4dGVuZGVk
L21zbXRwL3ttc210cF8xLjguMjUuYmIgPT4gbXNtdHBfMS44LjI2LmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9tc210cC97bXNtdHBfMS44LjI1LmJiID0+IG1zbXRwXzEuOC4yNi5iYn0g
KDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAvbXNtdHBfMS44
LjI1LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21zbXRwL21zbXRwXzEuOC4yNi5iYgpzaW1p
bGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAv
bXNtdHBfMS44LjI1LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAvbXNt
dHBfMS44LjI2LmJiCmluZGV4IGI1NzVmYWQ1ZTEuLjEzODIwZmU5MzAgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9tc210cF8xLjguMjUuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL21zbXRwL21zbXRwXzEuOC4yNi5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1kMzIyMzliY2I2NzM0NjNhYjg3NGU4
MGQ0N2ZhZTUwNCIKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL21hcmxhbS5kZS9tc210
cC9kb3dubG9hZC8iCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9tYXJsYW0uZGUvJHtCUE59L3JlbGVh
c2VzLyR7QlB9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyZGZlMWRiYmIzOTdkMjZm
ZTBiMGI2YjJlOWNkMmVmZGY5ZDcyZGQ0MmQxOGU3MGQ3ZjM2M2FkYTI2NTJkNzM4IgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjZjZmM0ODgzNDRjZWYxODkyNjdlNjBhZWE0ODFmMDBkNGM3ZTJhNTli
NTNjNmM2NTljNTIwYTRkMTIxZjY2ZDgiCiAKIGluaGVyaXQgZ2V0dGV4dCBhdXRvdG9vbHMgdXBk
YXRlLWFsdGVybmF0aXZlcyBwa2djb25maWcKIAotLSAKMi40NC4wCgo=

--===============2675574994257179115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/msmtp: PV changed from "1.8.25" to "1.8.26"
packages/core2-64-poky-linux/msmtp: SRC_URI changed from "https://marlam.de/msmtp/releases/msmtp-1.8.25.tar.xz" to "https://marlam.de/msmtp/releases/msmtp-1.8.26.tar.xz"
packages/core2-64-poky-linux/msmtp: PKGV changed from 1.8.25 [default] to 1.8.26 [default]
packages/core2-64-poky-linux/msmtp/msmtp-dbg: PKGSIZE changed from 437624 to 440112 (+1%)
packages/core2-64-poky-linux/msmtp/msmtp-dbg: PV changed from "1.8.25" to "1.8.26"
packages/core2-64-poky-linux/msmtp/msmtp-dbg: PKGV changed from 1.8.25 [default] to 1.8.26 [default]
packages/core2-64-poky-linux/msmtp/msmtp-dev: PV changed from "1.8.25" to "1.8.26"
packages/core2-64-poky-linux/msmtp/msmtp-dev: PKGV changed from 1.8.25 [default] to 1.8.26 [default]
packages/core2-64-poky-linux/msmtp/msmtp-doc: PKGSIZE changed from 115996 to 116720 (+1%)
packages/core2-64-poky-linux/msmtp/msmtp-doc: PV changed from "1.8.25" to "1.8.26"
packages/core2-64-poky-linux/msmtp/msmtp-doc: PKGV changed from 1.8.25 [default] to 1.8.26 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-de: PKGSIZE changed from 36640 to 36796 (+0%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-de: PV changed from "1.8.25" to "1.8.26"
packages/core2-64-poky-linux/msmtp/msmtp-locale-de: PKGV changed from 1.8.25 [default] to 1.8.26 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-eo: PKGSIZE changed from 34666 to 34819 (+0%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-eo: PV changed from "1.8.25" to "1.8.26"
packages/core2-64-poky-linux/msmtp/msmtp-locale-eo: PKGV changed from 1.8.25 [default] to 1.8.26 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-fr: PV changed from "1.8.25" to "1.8.26"
packages/core2-64-poky-linux/msmtp/msmtp-locale-fr: PKGV changed from 1.8.25 [default] to 1.8.26 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-pt-br: PV changed from "1.8.25" to "1.8.26"
packages/core2-64-poky-linux/msmtp/msmtp-locale-pt-br: PKGV changed from 1.8.25 [default] to 1.8.26 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-ro: PKGSIZE changed from 37955 to 38108 (+0%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-ro: PV changed from "1.8.25" to "1.8.26"
packages/core2-64-poky-linux/msmtp/msmtp-locale-ro: PKGV changed from 1.8.25 [default] to 1.8.26 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-ru: PKGSIZE changed from 44877 to 45057 (+0%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-ru: PV changed from "1.8.25" to "1.8.26"
packages/core2-64-poky-linux/msmtp/msmtp-locale-ru: PKGV changed from 1.8.25 [default] to 1.8.26 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-sr: PKGSIZE changed from 45243 to 45456 (+0%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-sr: PV changed from "1.8.25" to "1.8.26"
packages/core2-64-poky-linux/msmtp/msmtp-locale-sr: PKGV changed from 1.8.25 [default] to 1.8.26 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-sv: PKGSIZE changed from 34972 to 35126 (+0%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-sv: PV changed from "1.8.25" to "1.8.26"
packages/core2-64-poky-linux/msmtp/msmtp-locale-sv: PKGV changed from 1.8.25 [default] to 1.8.26 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-ta: PV changed from "1.8.25" to "1.8.26"
packages/core2-64-poky-linux/msmtp/msmtp-locale-ta: PKGV changed from 1.8.25 [default] to 1.8.26 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-uk: PKGSIZE changed from 47085 to 47268 (+0%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-uk: PV changed from "1.8.25" to "1.8.26"
packages/core2-64-poky-linux/msmtp/msmtp-locale-uk: PKGV changed from 1.8.25 [default] to 1.8.26 [default]
packages/core2-64-poky-linux/msmtp/msmtp-src: PKGSIZE changed from 515088 to 518761 (+1%)
packages/core2-64-poky-linux/msmtp/msmtp-src: PV changed from "1.8.25" to "1.8.26"
packages/core2-64-poky-linux/msmtp/msmtp-src: PKGV changed from 1.8.25 [default] to 1.8.26 [default]
packages/core2-64-poky-linux/msmtp/msmtp-staticdev: PV changed from "1.8.25" to "1.8.26"
packages/core2-64-poky-linux/msmtp/msmtp-staticdev: PKGV changed from 1.8.25 [default] to 1.8.26 [default]
packages/core2-64-poky-linux/msmtp/msmtp: PV changed from "1.8.25" to "1.8.26"
packages/core2-64-poky-linux/msmtp/msmtp: PKGV changed from 1.8.25 [default] to 1.8.26 [default]

--===============2675574994257179115==--

