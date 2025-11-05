Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E982FCD37B0
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:36 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2351.1762384575994735130
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xmttDI71;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dN2SQnL7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019a564ec5b9-804eaa78-d9a4-4377-bb9c-ae7e5aeb9fd6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384594;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0u+qRKvoIvXLAK7Nv8RDeJP30CYZ5XAHR7DBqYakIP4=;
	b=xmttDI71TL1pGZ8fnQiuGUh9tY0YuRWZdHEwTHZJvJtfcsBJQyq8Qz1joHC9myO0
	LmCgb2MRkPwmdBOENjoZAYv6Q4F+c0/MBd3+XgUu7XSHvSHyW1CXx26j+cheAhSjg26
	ji0B9JL5mJNziT3/U+ay3sf82VFkGms5TVO7CTD0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384594;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0u+qRKvoIvXLAK7Nv8RDeJP30CYZ5XAHR7DBqYakIP4=;
	b=dN2SQnL7mRd/+TqY4NAyGel+Vnk8VXGLGSEpqbKyZ3udb6jvPM6CE8xe+fgc3/+a
	zGcBjkbzunZ+D5DKezXbG7Hn+CCApE5pQHIAHBx3aXETUdrjDjEtLQb5wQyK78OtzeV
	8O2+YkjTHwnpFxH/U6sYjAGzuiAf9/YHPRauq5b8=
Content-Type: multipart/mixed; boundary="===============3947796621778075432=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] msmtp: upgrading to 1.8.32 SUCCEEDED
Message-ID: <0101019a564ec5b9-804eaa78-d9a4-4377-bb9c-ae7e5aeb9fd6-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225864

--===============3947796621778075432==
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
From 1515937f35c43d05237f99f273d3e3c046ab1a45 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 18:54:47 +0000
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


--===============3947796621778075432==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-msmtp-upgrade-1.8.31-1.8.32.patch"

RnJvbSAxNTE1OTM3ZjM1YzQzZDA1MjM3Zjk5ZjI3M2QzZTNjMDQ2YWIxYTQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxODo1NDo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1z
bXRwOiB1cGdyYWRlIDEuOC4zMSAtPiAxLjguMzIKCi0tLQogLi4uL3JlY2lwZXMtZXh0ZW5kZWQv
bXNtdHAve21zbXRwXzEuOC4zMS5iYiA9PiBtc210cF8xLjguMzIuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL21zbXRwL3ttc210cF8xLjguMzEuYmIgPT4gbXNtdHBfMS44LjMyLmJifSAo
OTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9tc210cF8xLjgu
MzEuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAvbXNtdHBfMS44LjMyLmJiCnNpbWls
YXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9t
c210cF8xLjguMzEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9tc210
cF8xLjguMzIuYmIKaW5kZXggZjQzZGMzOGJkOS4uNTQ4Yzk0YWFhZiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL21zbXRwL21zbXRwXzEuOC4zMS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbXNtdHAvbXNtdHBfMS44LjMyLmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWQzMjIzOWJjYjY3MzQ2M2FiODc0ZTgw
ZDQ3ZmFlNTA0IgogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vbWFybGFtLmRlL21zbXRw
L2Rvd25sb2FkLyIKIAogU1JDX1VSSSA9ICJodHRwczovL21hcmxhbS5kZS8ke0JQTn0vcmVsZWFz
ZXMvJHtCUH0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImMyNjJiMTE3NjJkODU4MmEz
YzZkNmNhOGQ4YjJjY2EyYjE2MDU0OTczMjRjYTI3Y2M1N2ZkYzE0NWEyNzExOWYiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMjBjZDU4YjU4ZGQwMDdhY2Y3YjkzN2ZhMWExZTIxZjNhZmIzZTllZjVi
YmNmYjhiNGY1NjUwZGVhZGM2NGRiNCIKIAogaW5oZXJpdCBnZXR0ZXh0IGF1dG90b29scyB1cGRh
dGUtYWx0ZXJuYXRpdmVzIHBrZ2NvbmZpZwogCi0tIAoyLjQ3LjEKCg==

--===============3947796621778075432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/msmtp: SRC_URI changed from "https://marlam.de/msmtp/releases/msmtp-1.8.31.tar.xz" to "https://marlam.de/msmtp/releases/msmtp-1.8.32.tar.xz"
packages/x86-64-v3-poky-linux/msmtp: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
packages/x86-64-v3-poky-linux/msmtp: PV changed from "1.8.31" to "1.8.32"
packages/x86-64-v3-poky-linux/msmtp/msmtp-dbg: PKGSIZE changed from 506536 to 508400 (+0%)
packages/x86-64-v3-poky-linux/msmtp/msmtp-dbg: PKGV changed from 1.8.31 [default] to 1.8.32 [default]
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

--===============3947796621778075432==--

