Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE1FC18E1A
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:15 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.8500.1698848705640419608
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GJ1iVRwd;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lSuLpc9D;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.23, mailfrom: 0101018b8b460a03-ed08616c-de05-4d4b-9adf-b843c27b434b-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2nIPhv0NrJ9UT/59dp0pFzyINKoqmqiTL5julESydI8=;
	b=GJ1iVRwdfHCHiFLy8fAjInFPMtenx9iQ+5+bmCWAVsPbvVvbAqIQE7B+N92idtE5
	ZWIroeV6i/KyZJ5Dnzl6J5On2aqurwpIHO2whfo3L2Iltgt3LcALO/5bD0IjX/KzbwZ
	Bwf7LOR0/mbFvhmRYg9UUk/H7Mh4feNeUBM4HhsA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2nIPhv0NrJ9UT/59dp0pFzyINKoqmqiTL5julESydI8=;
	b=lSuLpc9DLAtQ2oI23IfMFgy9R3tICCeAzucQkgHmzFtzFkZh7RQYK9U+8kdjvPsU
	pA+gz3iTCOVAfPJ3IEgfFQYO2Vd95apt10ccHS81O6svNGwcaA8RdIHWTWvaU4Htvo3
	GZ/Ys4yAXUx/rOeTL1T4NeRmu7sl7sBg8wO7zxeQ=
Content-Type: multipart/mixed; boundary="===============5257885721823913601=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] msmtp: upgrading to 1.8.25 SUCCEEDED
Message-ID: <0101018b8b460a03-ed08616c-de05-4d4b-9adf-b843c27b434b-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189994

--===============5257885721823913601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *msmtp* to *1.8.25* has Succeeded.

Next steps:
    - apply the patch: git am 0001-msmtp-upgrade-1.8.24-1.8.25.patch
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
From f5b6bdb2176f0ad78c5274e134ef982eba95affc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 11:32:46 +0000
Subject: [PATCH] msmtp: upgrade 1.8.24 -> 1.8.25

---
 .../recipes-extended/msmtp/{msmtp_1.8.24.bb => msmtp_1.8.25.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.24.bb => msmtp_1.8.25.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.24.bb b/meta/recipes-extended/msmtp/msmtp_1.8.25.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.24.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.25.bb
index b8c867161b..b575fad5e1 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.24.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.25.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "bd6644b1aaab17d61b86647993e3efad860b23c54283b00ddc579c1f5110aa59"
+SRC_URI[sha256sum] = "2dfe1dbbb397d26fe0b0b6b2e9cd2efdf9d72dd42d18e70d7f363ada2652d738"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.39.2


--===============5257885721823913601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/msmtp: PKGV changed from 1.8.24 [default] to 1.8.25 [default]
packages/core2-64-poky-linux/msmtp: PACKAGES: added "msmtp-locale-ro"
packages/core2-64-poky-linux/msmtp: SRC_URI changed from "https://marlam.de/msmtp/releases/msmtp-1.8.24.tar.xz" to "https://marlam.de/msmtp/releases/msmtp-1.8.25.tar.xz"
packages/core2-64-poky-linux/msmtp: PV changed from "1.8.24" to "1.8.25"
packages/core2-64-poky-linux/msmtp/msmtp-dbg: PKGSIZE changed from 436392 to 437760 (+0%)
packages/core2-64-poky-linux/msmtp/msmtp-dbg: PKGV changed from 1.8.24 [default] to 1.8.25 [default]
packages/core2-64-poky-linux/msmtp/msmtp-dbg: PV changed from "1.8.24" to "1.8.25"
packages/core2-64-poky-linux/msmtp/msmtp-dev: PKGV changed from 1.8.24 [default] to 1.8.25 [default]
packages/core2-64-poky-linux/msmtp/msmtp-dev: PV changed from "1.8.24" to "1.8.25"
packages/core2-64-poky-linux/msmtp/msmtp-doc: PKGSIZE changed from 114861 to 115996 (+1%)
packages/core2-64-poky-linux/msmtp/msmtp-doc: PKGV changed from 1.8.24 [default] to 1.8.25 [default]
packages/core2-64-poky-linux/msmtp/msmtp-doc: PV changed from "1.8.24" to "1.8.25"
packages/core2-64-poky-linux/msmtp/msmtp-locale-de: PKGSIZE changed from 36812 to 36640 (-0%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-de: PKGV changed from 1.8.24 [default] to 1.8.25 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-de: PV changed from "1.8.24" to "1.8.25"
packages/core2-64-poky-linux/msmtp/msmtp-locale-eo: PKGSIZE changed from 34835 to 34666 (-0%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-eo: PKGV changed from 1.8.24 [default] to 1.8.25 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-eo: PV changed from "1.8.24" to "1.8.25"
packages/core2-64-poky-linux/msmtp/msmtp-locale-fr: PKGSIZE changed from 37402 to 37206 (-1%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-fr: PKGV changed from 1.8.24 [default] to 1.8.25 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-fr: PV changed from "1.8.24" to "1.8.25"
packages/core2-64-poky-linux/msmtp/msmtp-locale-pt-br: PKGSIZE changed from 36253 to 36085 (-0%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-pt-br: PKGV changed from 1.8.24 [default] to 1.8.25 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-pt-br: PV changed from "1.8.24" to "1.8.25"
packages/core2-64-poky-linux/msmtp/msmtp-locale-ru: PKGSIZE changed from 45081 to 44877 (-0%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-ru: PKGV changed from 1.8.24 [default] to 1.8.25 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-ru: PV changed from "1.8.24" to "1.8.25"
packages/core2-64-poky-linux/msmtp/msmtp-locale-sr: PKGSIZE changed from 45442 to 45243 (-0%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-sr: PKGV changed from 1.8.24 [default] to 1.8.25 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-sr: PV changed from "1.8.24" to "1.8.25"
packages/core2-64-poky-linux/msmtp/msmtp-locale-sv: PKGSIZE changed from 35142 to 34972 (-0%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-sv: PKGV changed from 1.8.24 [default] to 1.8.25 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-sv: PV changed from "1.8.24" to "1.8.25"
packages/core2-64-poky-linux/msmtp/msmtp-locale-ta: PKGV changed from 1.8.24 [default] to 1.8.25 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-ta: PV changed from "1.8.24" to "1.8.25"
packages/core2-64-poky-linux/msmtp/msmtp-locale-uk: PKGSIZE changed from 47284 to 47085 (-0%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-uk: PKGV changed from 1.8.24 [default] to 1.8.25 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-uk: PV changed from "1.8.24" to "1.8.25"
packages/core2-64-poky-linux/msmtp/msmtp-src: PKGSIZE changed from 514085 to 515088 (+0%)
packages/core2-64-poky-linux/msmtp/msmtp-src: PKGV changed from 1.8.24 [default] to 1.8.25 [default]
packages/core2-64-poky-linux/msmtp/msmtp-src: PV changed from "1.8.24" to "1.8.25"
packages/core2-64-poky-linux/msmtp/msmtp-staticdev: PKGV changed from 1.8.24 [default] to 1.8.25 [default]
packages/core2-64-poky-linux/msmtp/msmtp-staticdev: PV changed from "1.8.24" to "1.8.25"
packages/core2-64-poky-linux/msmtp/msmtp: PKGV changed from 1.8.24 [default] to 1.8.25 [default]
packages/core2-64-poky-linux/msmtp/msmtp: PV changed from "1.8.24" to "1.8.25"

--===============5257885721823913601==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-msmtp-upgrade-1.8.24-1.8.25.patch"

RnJvbSBmNWI2YmRiMjE3NmYwYWQ3OGM1Mjc0ZTEzNGVmOTgyZWJhOTVhZmZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMTozMjo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1z
bXRwOiB1cGdyYWRlIDEuOC4yNCAtPiAxLjguMjUKCi0tLQogLi4uL3JlY2lwZXMtZXh0ZW5kZWQv
bXNtdHAve21zbXRwXzEuOC4yNC5iYiA9PiBtc210cF8xLjguMjUuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL21zbXRwL3ttc210cF8xLjguMjQuYmIgPT4gbXNtdHBfMS44LjI1LmJifSAo
OTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9tc210cF8xLjgu
MjQuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAvbXNtdHBfMS44LjI1LmJiCnNpbWls
YXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9t
c210cF8xLjguMjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9tc210
cF8xLjguMjUuYmIKaW5kZXggYjhjODY3MTYxYi4uYjU3NWZhZDVlMSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL21zbXRwL21zbXRwXzEuOC4yNC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbXNtdHAvbXNtdHBfMS44LjI1LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWQzMjIzOWJjYjY3MzQ2M2FiODc0ZTgw
ZDQ3ZmFlNTA0IgogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vbWFybGFtLmRlL21zbXRw
L2Rvd25sb2FkLyIKIAogU1JDX1VSSSA9ICJodHRwczovL21hcmxhbS5kZS8ke0JQTn0vcmVsZWFz
ZXMvJHtCUH0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImJkNjY0NGIxYWFhYjE3ZDYx
Yjg2NjQ3OTkzZTNlZmFkODYwYjIzYzU0MjgzYjAwZGRjNTc5YzFmNTExMGFhNTkiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMmRmZTFkYmJiMzk3ZDI2ZmUwYjBiNmIyZTljZDJlZmRmOWQ3MmRkNDJk
MThlNzBkN2YzNjNhZGEyNjUyZDczOCIKIAogaW5oZXJpdCBnZXR0ZXh0IGF1dG90b29scyB1cGRh
dGUtYWx0ZXJuYXRpdmVzIHBrZ2NvbmZpZwogCi0tIAoyLjM5LjIKCg==

--===============5257885721823913601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/msmtp: PACKAGES: added "msmtp-locale-ro"

--===============5257885721823913601==--

