Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6FDC83F39
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:50 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.12162.1752594932041578220
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=coJO0RVg;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=AhWZAMya;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101980ecc9b60-1fb2e130-c58a-4568-a1db-8e64b25b52d3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594947;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=G8+MAKssOB7jVASd18TxqsHlIRBMLERuP0LCAHOqnMg=;
	b=coJO0RVgF64pb+KML51jvZkAn4h2bSqWsi5W3UhpGeeE7D4v6PnrEMJYCKnRkMbJ
	jTzJkUjbPlNl+bbRddvJ7/ISTT15VVskt2CcflUz/KcEFCidUl5WmbJ2Tuo/+7FDzuE
	mDH4xu9N0P/+T17MXxqzFIsaNeFedOh+dGklcP+E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594947;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=G8+MAKssOB7jVASd18TxqsHlIRBMLERuP0LCAHOqnMg=;
	b=AhWZAMyaN3V+eX9O74pMbyLzSJwINha6Fq50R6sXoWmE6Eaj+LLz9ShAjVGYkrQr
	YKPjCQij7mTFALkHV6KT9jZq6uybUhfsKchwdfzn6O53qJ9vtavSjd/WhhY9OVQOG98
	Vq0wrWoXIvu0ut18hGTywN3eJkhmag4njzOG9eok=
Content-Type: multipart/mixed; boundary="===============3655387663729996360=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsolv: upgrading to 0.7.34 SUCCEEDED
Message-ID: <010101980ecc9b60-1fb2e130-c58a-4568-a1db-8e64b25b52d3-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220363

--===============3655387663729996360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsolv* to *0.7.34* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsolv-upgrade-0.7.33-0.7.34.patch
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
From 75faebdfe73967de36e5b30126e162df2be34d5e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 10:49:10 +0000
Subject: [PATCH] libsolv: upgrade 0.7.33 -> 0.7.34

---
 .../libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch | 2 +-
 .../libsolv/{libsolv_0.7.33.bb => libsolv_0.7.34.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.33.bb => libsolv_0.7.34.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
index d6e983dec8..4d61644fdc 100644
--- a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
+++ b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
@@ -1,4 +1,4 @@
-From da99bf09e83469612e2c821696025a4e591bb95c Mon Sep 17 00:00:00 2001
+From bb9edb2936139af6cc2d9f847a6922af69a1fc70 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 28 Oct 2021 22:28:45 -0700
 Subject: [PATCH] utils: Conside musl when wrapping qsort_r
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.33.bb b/meta/recipes-extended/libsolv/libsolv_0.7.34.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.33.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.34.bb
index 13a6df2290..2d6da36b85 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.33.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.34.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "9fb855d872139fb1ebebec4c892b338fccda69ba"
+SRCREV = "262e8efa0239a78770910fde1579158725cc6ffa"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============3655387663729996360==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsolv-upgrade-0.7.33-0.7.34.patch"

RnJvbSA3NWZhZWJkZmU3Mzk2N2RlMzZlNWIzMDEyNmUxNjJkZjJiZTM0ZDVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTA6NDk6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzb2x2OiB1cGdyYWRlIDAuNy4zMyAtPiAwLjcuMzQKCi0tLQogLi4uL2xpYnNvbHYvMDAwMS11
dGlscy1Db25zaWRlLW11c2wtd2hlbi13cmFwcGluZy1xc29ydF9yLnBhdGNoIHwgMiArLQogLi4u
L2xpYnNvbHYve2xpYnNvbHZfMC43LjMzLmJiID0+IGxpYnNvbHZfMC43LjM0LmJifSAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYve2xpYnNvbHZfMC43LjMz
LmJiID0+IGxpYnNvbHZfMC43LjM0LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9saWJzb2x2L2xpYnNvbHYvMDAwMS11dGlscy1Db25zaWRlLW11c2wtd2hlbi13
cmFwcGluZy1xc29ydF9yLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGli
c29sdi8wMDAxLXV0aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdyYXBwaW5nLXFzb3J0X3IucGF0Y2gK
aW5kZXggZDZlOTgzZGVjOC4uNGQ2MTY0NGZkYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2xpYnNvbHYvbGlic29sdi8wMDAxLXV0aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdyYXBw
aW5nLXFzb3J0X3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGli
c29sdi8wMDAxLXV0aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdyYXBwaW5nLXFzb3J0X3IucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGRhOTliZjA5ZTgzNDY5NjEyZTJjODIxNjk2MDI1YTRlNTkx
YmI5NWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGJiOWVkYjI5MzYxMzlhZjZjYzJk
OWY4NDdhNjkyMmFmNjlhMWZjNzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyOCBPY3QgMjAyMSAyMjoyODo0
NSAtMDcwMAogU3ViamVjdDogW1BBVENIXSB1dGlsczogQ29uc2lkZSBtdXNsIHdoZW4gd3JhcHBp
bmcgcXNvcnRfcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGli
c29sdl8wLjcuMzMuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2XzAu
Ny4zNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy4zMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2xpYnNvbHYvbGlic29sdl8wLjcuMzQuYmIKaW5kZXggMTNhNmRmMjI5MC4uMmQ2ZGEz
NmI4NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdl8w
LjcuMzMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdl8wLjcu
MzQuYmIKQEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL29wZW5T
VVNFL2xpYnNvbHYuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAg
ICBmaWxlOi8vMDAwMS11dGlscy1Db25zaWRlLW11c2wtd2hlbi13cmFwcGluZy1xc29ydF9yLnBh
dGNoIFwKICIKIAotU1JDUkVWID0gIjlmYjg1NWQ4NzIxMzlmYjFlYmViZWM0Yzg5MmIzMzhmY2Nk
YTY5YmEiCitTUkNSRVYgPSAiMjYyZThlZmEwMjM5YTc4NzcwOTEwZmRlMTU3OTE1ODcyNWNjNmZm
YSIKIAogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQrKSsp
IgogCi0tIAoyLjQ3LjEKCg==

--===============3655387663729996360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libsolv: PKGV changed from 0.7.33 [default] to 0.7.34 [default]
packages/core2-64-poky-linux/libsolv: PV changed from "0.7.33" to "0.7.34"
packages/core2-64-poky-linux/libsolv/libsolv-dbg: PV changed from "0.7.33" to "0.7.34"
packages/core2-64-poky-linux/libsolv/libsolv-dbg: PKGV changed from 0.7.33 [default] to 0.7.34 [default]
packages/core2-64-poky-linux/libsolv/libsolv-dev: PV changed from "0.7.33" to "0.7.34"
packages/core2-64-poky-linux/libsolv/libsolv-dev: PKGV changed from 0.7.33 [default] to 0.7.34 [default]
packages/core2-64-poky-linux/libsolv/libsolv-doc: PV changed from "0.7.33" to "0.7.34"
packages/core2-64-poky-linux/libsolv/libsolv-doc: PKGV changed from 0.7.33 [default] to 0.7.34 [default]
packages/core2-64-poky-linux/libsolv/libsolv-locale: PV changed from "0.7.33" to "0.7.34"
packages/core2-64-poky-linux/libsolv/libsolv-locale: PKGV changed from 0.7.33 [default] to 0.7.34 [default]
packages/core2-64-poky-linux/libsolv/libsolv-src: PV changed from "0.7.33" to "0.7.34"
packages/core2-64-poky-linux/libsolv/libsolv-src: PKGSIZE changed from 1661072 to 1661094 (+0%)
packages/core2-64-poky-linux/libsolv/libsolv-src: PKGV changed from 0.7.33 [default] to 0.7.34 [default]
packages/core2-64-poky-linux/libsolv/libsolv-staticdev: PV changed from "0.7.33" to "0.7.34"
packages/core2-64-poky-linux/libsolv/libsolv-staticdev: PKGSIZE changed from 4378670 to 4378662 (-0%)
packages/core2-64-poky-linux/libsolv/libsolv-staticdev: PKGV changed from 0.7.33 [default] to 0.7.34 [default]
packages/core2-64-poky-linux/libsolv/libsolv-tools: PV changed from "0.7.33" to "0.7.34"
packages/core2-64-poky-linux/libsolv/libsolv-tools: PKGV changed from 0.7.33 [default] to 0.7.34 [default]
packages/core2-64-poky-linux/libsolv/libsolv: PKGV changed from 0.7.33 [default] to 0.7.34 [default]
packages/core2-64-poky-linux/libsolv/libsolv: PV changed from "0.7.33" to "0.7.34"
packages/core2-64-poky-linux/libsolv/libsolvext: PKGV changed from 0.7.33 [default] to 0.7.34 [default]
packages/core2-64-poky-linux/libsolv/libsolvext: PV changed from "0.7.33" to "0.7.34"

--===============3655387663729996360==--

