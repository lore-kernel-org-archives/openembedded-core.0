Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C65C021A6
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:02 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.42715.1738416048586333496
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:21:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=c8VH59rA;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ucC/T9Uo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010194c1abf5e8-7e237918-4c25-46e1-b704-b825198b1e08-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xaXP7ZvOT4Ix6zB4N4Rc6513J0GhCQ1mvP7p1ifzQLc=;
	b=c8VH59rAFL/zo3nuTxITiSqHwcTge3gqhEd6KRJExoqbS7cK6MMheNPRjBRbV2BU
	iygNGx6WG6lO1k6MCT+ZklqQ//Ebl+AaeB56bIzTRyPECT/ZUQR3Ugnt3do3j/q2orG
	U2tBQ6ZZIR9mmdBgk/Rls9BmQtCf91zgA6dMEDrU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xaXP7ZvOT4Ix6zB4N4Rc6513J0GhCQ1mvP7p1ifzQLc=;
	b=ucC/T9UowLPuhyqQMWew74J3uK6KqO0AD2l5w/NWsaO9VqPQ+eTaFpm7tuTTdes0
	P3ZVwuqnKfQlZNYsVz4Xs+OiYQeUKAacqp8x/yyAPanYjyL1l9ix6AZnMEjeG/Ki8p7
	3v4hc/4AzfG71nGLoU3YOdjVdu2EzoFDHAhJQ6so=
Content-Type: multipart/mixed; boundary="===============3980330670633003398=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] msmtp: upgrading to 1.8.28 SUCCEEDED
Message-ID: <01010194c1abf5e8-7e237918-4c25-46e1-b704-b825198b1e08-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210560

--===============3980330670633003398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *msmtp* to *1.8.28* has Succeeded.

Next steps:
    - apply the patch: git am 0001-msmtp-upgrade-1.8.27-1.8.28.patch
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
From 6497dd1d35a7441bb446a57549423369467d6e37 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 10:10:26 +0000
Subject: [PATCH] msmtp: upgrade 1.8.27 -> 1.8.28

---
 .../recipes-extended/msmtp/{msmtp_1.8.27.bb => msmtp_1.8.28.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.27.bb => msmtp_1.8.28.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.27.bb b/meta/recipes-extended/msmtp/msmtp_1.8.28.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.27.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.28.bb
index 3f10be9f5e..48c597de24 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.27.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.28.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "94030580a63a747faa0a3b9b1b264ae355aad33a4d94b832bfeb5b21633c965e"
+SRC_URI[sha256sum] = "3a57f155f54e4860f7dd42138d9bea1af615b99dfab5ab4cd728fc8c09a647a4"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.44.1


--===============3980330670633003398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/msmtp: SRC_URI changed from "https://marlam.de/msmtp/releases/msmtp-1.8.27.tar.xz" to "https://marlam.de/msmtp/releases/msmtp-1.8.28.tar.xz"
packages/core2-64-poky-linux/msmtp: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-dbg: PKGSIZE changed from 462056 to 462280 (+0%)
packages/core2-64-poky-linux/msmtp/msmtp-dbg: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-dbg: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-dev: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-dev: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-doc: PKGSIZE changed from 116721 to 116972 (+0%)
packages/core2-64-poky-linux/msmtp/msmtp-doc: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-doc: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-de: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-de: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-eo: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-eo: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-es: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-es: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-fr: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-fr: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-pt-br: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-pt-br: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-ro: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-ro: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-ru: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-ru: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-sr: PKGSIZE changed from 45456 to 45662 (+0%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-sr: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-sr: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-sv: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-sv: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-ta: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-ta: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-uk: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-uk: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-src: PKGSIZE changed from 520376 to 521379 (+0%)
packages/core2-64-poky-linux/msmtp/msmtp-src: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-src: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-staticdev: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-staticdev: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp: PKGV changed from 1.8.27 [default] to 1.8.28 [default]

--===============3980330670633003398==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-msmtp-upgrade-1.8.27-1.8.28.patch"

RnJvbSA2NDk3ZGQxZDM1YTc0NDFiYjQ0NmE1NzU0OTQyMzM2OTQ2N2Q2ZTM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAxMDoxMDoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1z
bXRwOiB1cGdyYWRlIDEuOC4yNyAtPiAxLjguMjgKCi0tLQogLi4uL3JlY2lwZXMtZXh0ZW5kZWQv
bXNtdHAve21zbXRwXzEuOC4yNy5iYiA9PiBtc210cF8xLjguMjguYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL21zbXRwL3ttc210cF8xLjguMjcuYmIgPT4gbXNtdHBfMS44LjI4LmJifSAo
OTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9tc210cF8xLjgu
MjcuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAvbXNtdHBfMS44LjI4LmJiCnNpbWls
YXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9t
c210cF8xLjguMjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9tc210
cF8xLjguMjguYmIKaW5kZXggM2YxMGJlOWY1ZS4uNDhjNTk3ZGUyNCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL21zbXRwL21zbXRwXzEuOC4yNy5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbXNtdHAvbXNtdHBfMS44LjI4LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWQzMjIzOWJjYjY3MzQ2M2FiODc0ZTgw
ZDQ3ZmFlNTA0IgogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vbWFybGFtLmRlL21zbXRw
L2Rvd25sb2FkLyIKIAogU1JDX1VSSSA9ICJodHRwczovL21hcmxhbS5kZS8ke0JQTn0vcmVsZWFz
ZXMvJHtCUH0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk0MDMwNTgwYTYzYTc0N2Zh
YTBhM2I5YjFiMjY0YWUzNTVhYWQzM2E0ZDk0YjgzMmJmZWI1YjIxNjMzYzk2NWUiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiM2E1N2YxNTVmNTRlNDg2MGY3ZGQ0MjEzOGQ5YmVhMWFmNjE1Yjk5ZGZh
YjVhYjRjZDcyOGZjOGMwOWE2NDdhNCIKIAogaW5oZXJpdCBnZXR0ZXh0IGF1dG90b29scyB1cGRh
dGUtYWx0ZXJuYXRpdmVzIHBrZ2NvbmZpZwogCi0tIAoyLjQ0LjEKCg==

--===============3980330670633003398==--

