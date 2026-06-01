Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C5BCD6E6E
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:40 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1570.1780328136613517798
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=lJjVdPkQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=B6NsGfwF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e83d37d7e-fdfa2ec1-a48c-4ba0-9ba4-59f1d84b7d76-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328136;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=x9weSPA9xSu4TDqjfzNSMZJjQ4bs+3h5Elo8mZ1ZXEY=;
	b=lJjVdPkQFtDyuoz8sfO3d8nbF11dUNanpRKct4wRfPcanm6R3eDrwUa5hItSjd0r
	AVS6eg/Dhd9nrlfsG7hFFhl2KBisxJcjJ23xXdplTM+qa0tvrMQIByvM+vS0JqVOxiy
	l1Hq5rcswQ99aPfm0/LM+cfxt1X16cFvtP7bBkt4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328136;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=x9weSPA9xSu4TDqjfzNSMZJjQ4bs+3h5Elo8mZ1ZXEY=;
	b=B6NsGfwFiIRqj1EUtudUuaNeU3KP9gw0kNQRv096o9VV9wKxhcotTtZdb6t+c0iQ
	eAPgd3tVLf7TIIiUOR9BD3i3NjRdCrroSv0U6xUjSGw2BuLMJ1w5f2HjMBmWVtwXksp
	CUDHrzdUHVa/J5okpUYtC5QbgECOX0aI3yApWw+w=
Content-Type: multipart/mixed; boundary="===============6316381840777370107=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libedit: upgrading to 20260512-3.1 SUCCEEDED
Message-ID: <0101019e83d37d7e-fdfa2ec1-a48c-4ba0-9ba4-59f1d84b7d76-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237873

--===============6316381840777370107==
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
From 029ad7866c8e4df4a902965acfd9a2d52dc059c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 08:05:21 +0000
Subject: [PATCH] libedit: upgrade 20251016-3.1 -> 20260512-3.1

---
 meta/recipes-devtools/libedit/libedit/stdc-predef.patch         | 2 +-
 .../{libedit_20251016-3.1.bb => libedit_20260512-3.1.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/libedit/{libedit_20251016-3.1.bb => libedit_20260512-3.1.bb} (87%)

diff --git a/meta/recipes-devtools/libedit/libedit/stdc-predef.patch b/meta/recipes-devtools/libedit/libedit/stdc-predef.patch
index 0ce6d127a9..f34c9f1fbf 100644
--- a/meta/recipes-devtools/libedit/libedit/stdc-predef.patch
+++ b/meta/recipes-devtools/libedit/libedit/stdc-predef.patch
@@ -1,4 +1,4 @@
-From 32918b3a91d9fe4719bba78a44ec3262a2994e68 Mon Sep 17 00:00:00 2001
+From bcc9d888e9e998d003408a21b774f1879d56ff0e Mon Sep 17 00:00:00 2001
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


--===============6316381840777370107==
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

--===============6316381840777370107==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libedit-upgrade-20251016-3.1-20260512-3.1.patch"

RnJvbSAwMjlhZDc4NjZjOGU0ZGY0YTkwMjk2NWFjZmQ5YTJkNTJkYzA1OWMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwODowNToyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmVkaXQ6IHVwZ3JhZGUgMjAyNTEwMTYtMy4xIC0+IDIwMjYwNTEyLTMuMQoKLS0tCiBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvbGliZWRpdC9saWJlZGl0L3N0ZGMtcHJlZGVmLnBhdGNoICAgICAgICAg
fCAyICstCiAuLi4ve2xpYmVkaXRfMjAyNTEwMTYtMy4xLmJiID0+IGxpYmVkaXRfMjAyNjA1MTIt
My4xLmJifSAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZWRpdC97bGli
ZWRpdF8yMDI1MTAxNi0zLjEuYmIgPT4gbGliZWRpdF8yMDI2MDUxMi0zLjEuYmJ9ICg4NyUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmVkaXQvbGliZWRpdC9zdGRjLXBy
ZWRlZi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJlZGl0L2xpYmVkaXQvc3RkYy1w
cmVkZWYucGF0Y2gKaW5kZXggMGNlNmQxMjdhOS4uZjM0YzlmMWZiZiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2xpYmVkaXQvbGliZWRpdC9zdGRjLXByZWRlZi5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZWRpdC9saWJlZGl0L3N0ZGMtcHJlZGVmLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzMjkxOGIzYTkxZDlmZTQ3MTliYmE3OGE0NGVjMzI2MmEy
OTk0ZTY4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiY2M5ZDg4OGU5ZTk5OGQwMDM0
MDhhMjFiNzc0ZjE4NzlkNTZmZjBlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMzEgSnVsIDIwMTkgMTA6NDg6
MTkgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliZWRpdDogTW92ZSBmcm9tIG1ldGEtb2UKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJlZGl0L2xpYmVkaXRfMjAyNTEwMTYt
My4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmVkaXQvbGliZWRpdF8yMDI2MDUxMi0z
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2xpYmVkaXQvbGliZWRpdF8yMDI1MTAxNi0zLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9saWJlZGl0L2xpYmVkaXRfMjAyNjA1MTItMy4xLmJiCmluZGV4IDJlYTc1YmJh
ODcuLmNhODA3NTVmOGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJlZGl0
L2xpYmVkaXRfMjAyNTEwMTYtMy4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJl
ZGl0L2xpYmVkaXRfMjAyNjA1MTItMy4xLmJiCkBAIC0xMyw3ICsxMyw3IEBAIGluaGVyaXQgYXV0
b3Rvb2xzCiBTUkNfVVJJID0gImh0dHA6Ly93d3cudGhyeXNvZWUuZGsvZWRpdGxpbmUvJHtCUH0u
dGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL3N0ZGMtcHJlZGVmLnBhdGNoIFwKICAgICAgICAg
ICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjEzNjJiMDA2NTNiYmZjMWM3MWY3MWE3NTc4ZGE2
NmI1YjUyMDM1NTlkNDMxMzRkMmRkNzcxOWUzMTNjZTA0MSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI0MzJkNWU3ZWE4YjAxMTZkZDM5ZjJlY2E3YmMxMWQwZWVkNzdmYWE2Yjc3ZWE1MjZhY2U4OTkw
N2MyM2VhNGEwIgogCiAjIGNvbmZpZ3VyZSBoYXJkY29kZXMgL3Vzci9iaW4gc2VhcmNoIHBhdGgg
YnlwYXNzaW5nIEhPU1RUT09MUwogQ0FDSEVEX0NPTkZJR1VSRVZBUlMgKz0gImFjX2N2X3BhdGhf
TlJPRkY9L2Jpbi9mYWxzZSIKLS0gCjIuNDcuMQoK

--===============6316381840777370107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libedit: SRC_URI changed from "http://www.thrysoee.dk/editline/libedit-20251016-3.1.tar.gz file://stdc-predef.patch" to "http://www.thrysoee.dk/editline/libedit-20260512-3.1.tar.gz file://stdc-predef.patch"
packages/x86-64-v3-poky-linux/libedit: PKGV changed from 20251016-3.1 [default] to 20260512-3.1 [default]
packages/x86-64-v3-poky-linux/libedit: PV changed from "20251016-3.1" to "20260512-3.1"
packages/x86-64-v3-poky-linux/libedit/libedit-dbg: PKGSIZE changed from 666024 to 669480 (+1%)
packages/x86-64-v3-poky-linux/libedit/libedit-dbg: PKGV changed from 20251016-3.1 [default] to 20260512-3.1 [default]
packages/x86-64-v3-poky-linux/libedit/libedit-dbg: PV changed from "20251016-3.1" to "20260512-3.1"
packages/x86-64-v3-poky-linux/libedit/libedit-dbg: FILELIST: removed "/usr/lib/.debug/libedit.so.0.0.76", added "/usr/lib/.debug/libedit.so.0.0.78"
packages/x86-64-v3-poky-linux/libedit/libedit-dev: PKGSIZE changed from 19565 to 19727 (+1%)
packages/x86-64-v3-poky-linux/libedit/libedit-dev: PKGV changed from 20251016-3.1 [default] to 20260512-3.1 [default]
packages/x86-64-v3-poky-linux/libedit/libedit-dev: PV changed from "20251016-3.1" to "20260512-3.1"
packages/x86-64-v3-poky-linux/libedit/libedit-doc: PKGSIZE changed from 60961 to 62033 (+2%)
packages/x86-64-v3-poky-linux/libedit/libedit-doc: PKGV changed from 20251016-3.1 [default] to 20260512-3.1 [default]
packages/x86-64-v3-poky-linux/libedit/libedit-doc: PV changed from "20251016-3.1" to "20260512-3.1"
packages/x86-64-v3-poky-linux/libedit/libedit-locale: PKGV changed from 20251016-3.1 [default] to 20260512-3.1 [default]
packages/x86-64-v3-poky-linux/libedit/libedit-locale: PV changed from "20251016-3.1" to "20260512-3.1"
packages/x86-64-v3-poky-linux/libedit/libedit-src: PKGSIZE changed from 587915 to 590842 (+0%)
packages/x86-64-v3-poky-linux/libedit/libedit-src: PKGV changed from 20251016-3.1 [default] to 20260512-3.1 [default]
packages/x86-64-v3-poky-linux/libedit/libedit-src: PV changed from "20251016-3.1" to "20260512-3.1"
packages/x86-64-v3-poky-linux/libedit/libedit-src: FILELIST: directory renamed /usr/src/debug/libedit/20251016-3.1/src -> /usr/src/debug/libedit/20260512-3.1/src, directory renamed /usr/src/debug/libedit/20251016-3.1/src/editline -> /usr/src/debug/libedit/20260512-3.1/src/editline
packages/x86-64-v3-poky-linux/libedit/libedit-staticdev: PKGV changed from 20251016-3.1 [default] to 20260512-3.1 [default]
packages/x86-64-v3-poky-linux/libedit/libedit-staticdev: PV changed from "20251016-3.1" to "20260512-3.1"
packages/x86-64-v3-poky-linux/libedit/libedit: PKGV changed from 20251016-3.1 [default] to 20260512-3.1 [default]
packages/x86-64-v3-poky-linux/libedit/libedit: PV changed from "20251016-3.1" to "20260512-3.1"
packages/x86-64-v3-poky-linux/libedit/libedit: FILELIST: removed "/usr/lib/libedit.so.0.0.76", added "/usr/lib/libedit.so.0.0.78"
Changes to packages/x86-64-v3-poky-linux/libedit (sysroot):
  /usr/lib/libedit.so.0 changed symlink target from libedit.so.0.0.76 to libedit.so.0.0.78
  /usr/lib/libedit.so changed symlink target from libedit.so.0.0.76 to libedit.so.0.0.78
  /usr/lib/libedit.so.0.0.76 moved to /usr/lib/libedit.so.0.0.78
Changes to packages/x86_64-linux/libedit-native (sysroot):
  /usr/lib/libedit.so.0 changed symlink target from libedit.so.0.0.76 to libedit.so.0.0.78
  /usr/lib/libedit.so changed symlink target from libedit.so.0.0.76 to libedit.so.0.0.78
  /usr/lib/libedit.so.0.0.76 moved to /usr/lib/libedit.so.0.0.78

--===============6316381840777370107==--

