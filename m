Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F5BCD4F51
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:33 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34824.1778851228960723657
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=lxOUVpkf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=f26s8oKI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019e2bcbaa5f-a96b5d32-deb0-46b7-a0db-097c2eb58b1b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Y1cTPntJizZZ6/tEZZhE913RuCBEQPrEx7gD08U1eZ0=;
	b=lxOUVpkfMQKaJMVpXShD2iRFAbHEtOF2rmHD1TM9MHrNXH0eQO/muuvfZ7I1bcJ3
	qMuuuXsbPiJd9Dotclgm6zDO7oM7eTZ1ki5BiKsFpVXIQ8ax+DOo7yzXkOw3I35TbYE
	iVOcXl6eBgm5v6XTZgPmwTWZgiPYXsMKEUI1F/XQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Y1cTPntJizZZ6/tEZZhE913RuCBEQPrEx7gD08U1eZ0=;
	b=f26s8oKI5VOgyVvqZRETkaFn8LVcChiElQ3KYHtrSTDLMmUnJsproqP9bSp4B0cb
	6KV0A9PEvtrbIEZOw6hpL8cJ+6H9bOGX5bOl6zmDMLHIuaUKWuu/UxDki7CdB7Vgyz0
	09sJhmUXeFr9zR28zrLOwG5FmBNgPHR+qdcpdE70=
Content-Type: multipart/mixed; boundary="===============6576111746685513540=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libedit: upgrading to 20260512-3.1 SUCCEEDED
Message-ID: <0101019e2bcbaa5f-a96b5d32-deb0-46b7-a0db-097c2eb58b1b-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237108

--===============6576111746685513540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libedit* to *20260512-3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libedit-upgrade-20251016-3.1-20260512-3.1.patch
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
From 18742da098c56dd39fd050d2247be576a239fb7f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 07:30:41 +0000
Subject: [PATCH] libedit: upgrade 20251016-3.1 -> 20260512-3.1

---
 meta/recipes-devtools/libedit/libedit/stdc-predef.patch         | 2 +-
 .../{libedit_20251016-3.1.bb => libedit_20260512-3.1.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/libedit/{libedit_20251016-3.1.bb => libedit_20260512-3.1.bb} (87%)

diff --git a/meta/recipes-devtools/libedit/libedit/stdc-predef.patch b/meta/recipes-devtools/libedit/libedit/stdc-predef.patch
index 0ce6d127a9..5f13942821 100644
--- a/meta/recipes-devtools/libedit/libedit/stdc-predef.patch
+++ b/meta/recipes-devtools/libedit/libedit/stdc-predef.patch
@@ -1,4 +1,4 @@
-From 32918b3a91d9fe4719bba78a44ec3262a2994e68 Mon Sep 17 00:00:00 2001
+From 4d8ae45289c97a6462878af88dc59aca3daf2721 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 31 Jul 2019 10:48:19 -0700
 Subject: [PATCH] libedit: Move from meta-oe
diff --git a/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb b/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb
similarity index 87%
rename from meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20260512-3.1.bb
index 2ea75bba87..ca80755f8a 100644
--- a/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb
@@ -13,7 +13,7 @@ inherit autotools
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[sha256sum] = "21362b00653bbfc1c71f71a7578da66b5b5203559d43134d2dd7719e313ce041"
+SRC_URI[sha256sum] = "432d5e7ea8b0116dd39f2eca7bc11d0eed77faa6b77ea526ace89907c23ea4a0"
 
 # configure hardcodes /usr/bin search path bypassing HOSTTOOLS
 CACHED_CONFIGUREVARS += "ac_cv_path_NROFF=/bin/false"
-- 
2.47.1


--===============6576111746685513540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libedit: PKGV changed from 20251016-3.1 [default] to 20260512-3.1 [default]
packages/x86-64-v3-poky-linux/libedit: SRC_URI changed from "http://www.thrysoee.dk/editline/libedit-20251016-3.1.tar.gz file://stdc-predef.patch" to "http://www.thrysoee.dk/editline/libedit-20260512-3.1.tar.gz file://stdc-predef.patch"
packages/x86-64-v3-poky-linux/libedit: PV changed from "20251016-3.1" to "20260512-3.1"
packages/x86-64-v3-poky-linux/libedit/libedit-dbg: PKGV changed from 20251016-3.1 [default] to 20260512-3.1 [default]
packages/x86-64-v3-poky-linux/libedit/libedit-dbg: PKGSIZE changed from 647776 to 651280 (+1%)
packages/x86-64-v3-poky-linux/libedit/libedit-dbg: FILELIST: removed "/usr/lib/.debug/libedit.so.0.0.76", added "/usr/lib/.debug/libedit.so.0.0.78"
packages/x86-64-v3-poky-linux/libedit/libedit-dbg: PV changed from "20251016-3.1" to "20260512-3.1"
packages/x86-64-v3-poky-linux/libedit/libedit-dev: PKGV changed from 20251016-3.1 [default] to 20260512-3.1 [default]
packages/x86-64-v3-poky-linux/libedit/libedit-dev: PKGSIZE changed from 19565 to 19727 (+1%)
packages/x86-64-v3-poky-linux/libedit/libedit-dev: PV changed from "20251016-3.1" to "20260512-3.1"
packages/x86-64-v3-poky-linux/libedit/libedit-doc: PKGV changed from 20251016-3.1 [default] to 20260512-3.1 [default]
packages/x86-64-v3-poky-linux/libedit/libedit-doc: PKGSIZE changed from 60961 to 62033 (+2%)
packages/x86-64-v3-poky-linux/libedit/libedit-doc: PV changed from "20251016-3.1" to "20260512-3.1"
packages/x86-64-v3-poky-linux/libedit/libedit-locale: PKGV changed from 20251016-3.1 [default] to 20260512-3.1 [default]
packages/x86-64-v3-poky-linux/libedit/libedit-locale: PV changed from "20251016-3.1" to "20260512-3.1"
packages/x86-64-v3-poky-linux/libedit/libedit-src: PKGV changed from 20251016-3.1 [default] to 20260512-3.1 [default]
packages/x86-64-v3-poky-linux/libedit/libedit-src: PKGSIZE changed from 587915 to 590842 (+0%)
packages/x86-64-v3-poky-linux/libedit/libedit-src: FILELIST: directory renamed /usr/src/debug/libedit/20251016-3.1/src -> /usr/src/debug/libedit/20260512-3.1/src, directory renamed /usr/src/debug/libedit/20251016-3.1/src/editline -> /usr/src/debug/libedit/20260512-3.1/src/editline
packages/x86-64-v3-poky-linux/libedit/libedit-src: PV changed from "20251016-3.1" to "20260512-3.1"
packages/x86-64-v3-poky-linux/libedit/libedit-staticdev: PKGV changed from 20251016-3.1 [default] to 20260512-3.1 [default]
packages/x86-64-v3-poky-linux/libedit/libedit-staticdev: PV changed from "20251016-3.1" to "20260512-3.1"
packages/x86-64-v3-poky-linux/libedit/libedit: PKGV changed from 20251016-3.1 [default] to 20260512-3.1 [default]
packages/x86-64-v3-poky-linux/libedit/libedit: PKGSIZE changed from 227473 to 231569 (+2%)
packages/x86-64-v3-poky-linux/libedit/libedit: FILELIST: removed "/usr/lib/libedit.so.0.0.76", added "/usr/lib/libedit.so.0.0.78"
packages/x86-64-v3-poky-linux/libedit/libedit: PV changed from "20251016-3.1" to "20260512-3.1"
Changes to packages/x86-64-v3-poky-linux/libedit (sysroot):
  /usr/lib/libedit.so.0 changed symlink target from libedit.so.0.0.76 to libedit.so.0.0.78
  /usr/lib/libedit.so changed symlink target from libedit.so.0.0.76 to libedit.so.0.0.78
  /usr/lib/libedit.so.0.0.76 moved to /usr/lib/libedit.so.0.0.78
Changes to packages/x86_64-linux/libedit-native (sysroot):
  /usr/lib/libedit.so.0 changed symlink target from libedit.so.0.0.76 to libedit.so.0.0.78
  /usr/lib/libedit.so changed symlink target from libedit.so.0.0.76 to libedit.so.0.0.78
  /usr/lib/libedit.so.0.0.76 moved to /usr/lib/libedit.so.0.0.78

--===============6576111746685513540==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libedit-upgrade-20251016-3.1-20260512-3.1.patch"

RnJvbSAxODc0MmRhMDk4YzU2ZGQzOWZkMDUwZDIyNDdiZTU3NmEyMzlmYjdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDc6MzA6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJlZGl0OiB1cGdyYWRlIDIwMjUxMDE2LTMuMSAtPiAyMDI2MDUxMi0zLjEKCi0tLQogbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2xpYmVkaXQvbGliZWRpdC9zdGRjLXByZWRlZi5wYXRjaCAgICAgICAg
IHwgMiArLQogLi4uL3tsaWJlZGl0XzIwMjUxMDE2LTMuMS5iYiA9PiBsaWJlZGl0XzIwMjYwNTEy
LTMuMS5iYn0gICAgICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmVkaXQve2xp
YmVkaXRfMjAyNTEwMTYtMy4xLmJiID0+IGxpYmVkaXRfMjAyNjA1MTItMy4xLmJifSAoODclKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJlZGl0L2xpYmVkaXQvc3RkYy1w
cmVkZWYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZWRpdC9saWJlZGl0L3N0ZGMt
cHJlZGVmLnBhdGNoCmluZGV4IDBjZTZkMTI3YTkuLjVmMTM5NDI4MjEgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9saWJlZGl0L2xpYmVkaXQvc3RkYy1wcmVkZWYucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmVkaXQvbGliZWRpdC9zdGRjLXByZWRlZi5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzI5MThiM2E5MWQ5ZmU0NzE5YmJhNzhhNDRlYzMyNjJh
Mjk5NGU2OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNGQ4YWU0NTI4OWM5N2E2NDYy
ODc4YWY4OGRjNTlhY2EzZGFmMjcyMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDMxIEp1bCAyMDE5IDEwOjQ4
OjE5IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxpYmVkaXQ6IE1vdmUgZnJvbSBtZXRhLW9lCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZWRpdC9saWJlZGl0XzIwMjUxMDE2
LTMuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJlZGl0L2xpYmVkaXRfMjAyNjA1MTIt
My4xLmJiCnNpbWlsYXJpdHkgaW5kZXggODclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9saWJlZGl0L2xpYmVkaXRfMjAyNTEwMTYtMy4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbGliZWRpdC9saWJlZGl0XzIwMjYwNTEyLTMuMS5iYgppbmRleCAyZWE3NWJi
YTg3Li5jYTgwNzU1ZjhhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZWRp
dC9saWJlZGl0XzIwMjUxMDE2LTMuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGli
ZWRpdC9saWJlZGl0XzIwMjYwNTEyLTMuMS5iYgpAQCAtMTMsNyArMTMsNyBAQCBpbmhlcml0IGF1
dG90b29scwogU1JDX1VSSSA9ICJodHRwOi8vd3d3LnRocnlzb2VlLmRrL2VkaXRsaW5lLyR7QlB9
LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9zdGRjLXByZWRlZi5wYXRjaCBcCiAgICAgICAg
ICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIxMzYyYjAwNjUzYmJmYzFjNzFmNzFhNzU3OGRh
NjZiNWI1MjAzNTU5ZDQzMTM0ZDJkZDc3MTllMzEzY2UwNDEiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNDMyZDVlN2VhOGIwMTE2ZGQzOWYyZWNhN2JjMTFkMGVlZDc3ZmFhNmI3N2VhNTI2YWNlODk5
MDdjMjNlYTRhMCIKIAogIyBjb25maWd1cmUgaGFyZGNvZGVzIC91c3IvYmluIHNlYXJjaCBwYXRo
IGJ5cGFzc2luZyBIT1NUVE9PTFMKIENBQ0hFRF9DT05GSUdVUkVWQVJTICs9ICJhY19jdl9wYXRo
X05ST0ZGPS9iaW4vZmFsc2UiCi0tIAoyLjQ3LjEKCg==

--===============6576111746685513540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libedit/libedit: FILELIST: removed "/usr/lib/libedit.so.0.0.76", added "/usr/lib/libedit.so.0.0.78"
Changes to packages/x86-64-v3-poky-linux/libedit (sysroot):
  /usr/lib/libedit.so.0 changed symlink target from libedit.so.0.0.76 to libedit.so.0.0.78
  /usr/lib/libedit.so changed symlink target from libedit.so.0.0.76 to libedit.so.0.0.78
  /usr/lib/libedit.so.0.0.76 moved to /usr/lib/libedit.so.0.0.78
Changes to packages/x86_64-linux/libedit-native (sysroot):
  /usr/lib/libedit.so.0 changed symlink target from libedit.so.0.0.76 to libedit.so.0.0.78
  /usr/lib/libedit.so changed symlink target from libedit.so.0.0.76 to libedit.so.0.0.78
  /usr/lib/libedit.so.0.0.76 moved to /usr/lib/libedit.so.0.0.78

--===============6576111746685513540==--

