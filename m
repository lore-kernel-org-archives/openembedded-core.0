Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B145CED26F
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:04 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12135.1763224742312639128
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XU2V8sUo;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dfl/UKwN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019a88626759-167484e9-9edb-48fa-88b2-d21d4073daee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224741;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OqjTwEX48l5roj6QNRDMXhvMOleN5JZ7eSFWZabwK/E=;
	b=XU2V8sUo06q3ieRYdmhVNmpe/cJs/fEbaeeagSF1MYPWf0teQH1ll5nigiaxog8R
	zvLduBAbTq2dXh49utIAYOduzz5KyVWGl7q02x/o08Awwi3hBOvhlV+9FEmwicybBgK
	y44zE7LVpCDXB69BB8ygt4u+E60B0hN6Qb+Mxvy4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224741;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OqjTwEX48l5roj6QNRDMXhvMOleN5JZ7eSFWZabwK/E=;
	b=dfl/UKwNieRpOiECnmxSKgQ++e8kXRBCGROphRNg4EZ70zMbdc5X3/3d+IGt8Rt3
	K5sUstO8rKine+yQY8/2aKF/6tww9S8VOqQtzou8efaVs4vEBj2kYXvNebgC1B5XFuQ
	yhG+G5lUF+nnkeh9esS7LUH+UYlh5XOJoge+csdY=
Content-Type: multipart/mixed; boundary="===============6908833232694155833=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] msmtp: upgrading to 1.8.32 SUCCEEDED
Message-ID: <0101019a88626759-167484e9-9edb-48fa-88b2-d21d4073daee-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226402

--===============6908833232694155833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *msmtp* to *1.8.32* has Succeeded.

Next steps:
    - apply the patch: git am 0001-msmtp-upgrade-1.8.31-1.8.32.patch
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
From e3a98558ce0c29b0a6d9038e4a2e8a98c1cc3c5e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 12:26:23 +0000
Subject: [PATCH] msmtp: upgrade 1.8.31 -> 1.8.32

---
 .../recipes-extended/msmtp/{msmtp_1.8.31.bb => msmtp_1.8.32.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.31.bb => msmtp_1.8.32.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.31.bb b/meta/recipes-extended/msmtp/msmtp_1.8.32.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.31.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.32.bb
index f43dc38bd9..548c94aaaf 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.31.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.32.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "c262b11762d8582a3c6d6ca8d8b2cca2b1605497324ca27cc57fdc145a27119f"
+SRC_URI[sha256sum] = "20cd58b58dd007acf7b937fa1a1e21f3afb3e9ef5bbcfb8b4f5650deadc64db4"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.47.1


--===============6908833232694155833==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-msmtp-upgrade-1.8.31-1.8.32.patch"

RnJvbSBlM2E5ODU1OGNlMGMyOWIwYTZkOTAzOGU0YTJlOGE5OGMxY2MzYzVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTI6MjY6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
c210cDogdXBncmFkZSAxLjguMzEgLT4gMS44LjMyCgotLS0KIC4uLi9yZWNpcGVzLWV4dGVuZGVk
L21zbXRwL3ttc210cF8xLjguMzEuYmIgPT4gbXNtdHBfMS44LjMyLmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9tc210cC97bXNtdHBfMS44LjMxLmJiID0+IG1zbXRwXzEuOC4zMi5iYn0g
KDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAvbXNtdHBfMS44
LjMxLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21zbXRwL21zbXRwXzEuOC4zMi5iYgpzaW1p
bGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAv
bXNtdHBfMS44LjMxLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAvbXNt
dHBfMS44LjMyLmJiCmluZGV4IGY0M2RjMzhiZDkuLjU0OGM5NGFhYWYgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9tc210cF8xLjguMzEuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL21zbXRwL21zbXRwXzEuOC4zMi5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1kMzIyMzliY2I2NzM0NjNhYjg3NGU4
MGQ0N2ZhZTUwNCIKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL21hcmxhbS5kZS9tc210
cC9kb3dubG9hZC8iCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9tYXJsYW0uZGUvJHtCUE59L3JlbGVh
c2VzLyR7QlB9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjMjYyYjExNzYyZDg1ODJh
M2M2ZDZjYThkOGIyY2NhMmIxNjA1NDk3MzI0Y2EyN2NjNTdmZGMxNDVhMjcxMTlmIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjIwY2Q1OGI1OGRkMDA3YWNmN2I5MzdmYTFhMWUyMWYzYWZiM2U5ZWY1
YmJjZmI4YjRmNTY1MGRlYWRjNjRkYjQiCiAKIGluaGVyaXQgZ2V0dGV4dCBhdXRvdG9vbHMgdXBk
YXRlLWFsdGVybmF0aXZlcyBwa2djb25maWcKIAotLSAKMi40Ny4xCgo=

--===============6908833232694155833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/msmtp: SRC_URI changed from "https://marlam.de/msmtp/releases/msmtp-1.8.31.tar.xz" to "https://marlam.de/msmtp/releases/msmtp-1.8.32.tar.xz"
packages/x86-64-v3-poky-linux/msmtp: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
packages/x86-64-v3-poky-linux/msmtp: PV changed from "1.8.31" to "1.8.32"
packages/x86-64-v3-poky-linux/msmtp/msmtp-dbg: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-dbg: PKGSIZE changed from 506536 to 508400 (+0%)
packages/x86-64-v3-poky-linux/msmtp/msmtp-dbg: PV changed from "1.8.31" to "1.8.32"
packages/x86-64-v3-poky-linux/msmtp/msmtp-dev: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-dev: PV changed from "1.8.31" to "1.8.32"
packages/x86-64-v3-poky-linux/msmtp/msmtp-doc: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-doc: PV changed from "1.8.31" to "1.8.32"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-de: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-de: PV changed from "1.8.31" to "1.8.32"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-eo: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-eo: PV changed from "1.8.31" to "1.8.32"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-es: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-es: PV changed from "1.8.31" to "1.8.32"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-fr: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-fr: PV changed from "1.8.31" to "1.8.32"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-pt-br: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-pt-br: PV changed from "1.8.31" to "1.8.32"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-ro: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-ro: PV changed from "1.8.31" to "1.8.32"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-ru: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-ru: PV changed from "1.8.31" to "1.8.32"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-sr: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-sr: PV changed from "1.8.31" to "1.8.32"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-sv: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-sv: PV changed from "1.8.31" to "1.8.32"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-ta: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-ta: PV changed from "1.8.31" to "1.8.32"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-uk: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-uk: PV changed from "1.8.31" to "1.8.32"
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-zh-cn: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-locale-zh-cn: PV changed from "1.8.31" to "1.8.32"
packages/x86-64-v3-poky-linux/msmtp/msmtp-src: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-src: PV changed from "1.8.31" to "1.8.32"
packages/x86-64-v3-poky-linux/msmtp/msmtp-staticdev: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp-staticdev: PV changed from "1.8.31" to "1.8.32"
packages/x86-64-v3-poky-linux/msmtp/msmtp: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
packages/x86-64-v3-poky-linux/msmtp/msmtp: PV changed from "1.8.31" to "1.8.32"

--===============6908833232694155833==--

