Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5422.1792563749481101643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 23:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XsPJT5e2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ibHk4W1Q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a15d201f4e-f82329da-7746-4f36-a0d5-182e5a5c4018-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792563748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QrtvImS5zwhRPfirkUW7gdwB/OWFRu66cp7fXITJ70U=;
	b=XsPJT5e23SkIqfVYuhmwdRItro7CtE+Hb2MKRrvwtRSWD0qe4MAbcMcPh5PQKSdF
	STDLs3JXlad2poyzXtKX/cwPJKvLMHKq0WQupnLlCmlX1Lyndssz8vT+3GyQ7uylOQD
	77P1xN43yZUbqZ3+eq2o4PQrcGKk5kvk0iNhbhHQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792563748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QrtvImS5zwhRPfirkUW7gdwB/OWFRu66cp7fXITJ70U=;
	b=ibHk4W1Qr5X4+8XEFonRuxiYTFSGQ2xulixFaUJeNhq/2JbFzYdqRoJOJLHHoeu9
	56ciLOkHj0pDIO2QPILoj0clDlJSi/0cIJB6ICLrMO8OmUi2kTllyI+GdUaFtDQ2RtR
	/BSlIC0xF5zYIzPeLNiuYV0SSONEZ95gdJYd/m1c=
Content-Type: multipart/mixed; boundary="===============2258218431186608429=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wcwidth: upgrading to 0.9.3 SUCCEEDED
Message-ID: <010101a15d201f4e-f82329da-7746-4f36-a0d5-182e5a5c4018-000000@us-west-2.amazonses.com>
Date: Wed, 21 Oct 2026 06:22:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.21-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 06:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248359

--===============2258218431186608429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-wcwidth* to *0.9.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wcwidth-upgrade-0.9.1-0.9.3.patch
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
From cae0c5ee0603ab61b7a827dc5bfd8146ca9a3423 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 21 Oct 2026 06:05:38 +0000
Subject: [PATCH] python3-wcwidth: upgrade 0.9.1 -> 0.9.3

0.9.3 *unreleased*
0.9.2 *2026-10-04*
---
 .../{python3-wcwidth_0.9.1.bb => python3-wcwidth_0.9.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.9.1.bb => python3-wcwidth_0.9.3.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.9.1.bb b/meta/recipes-devtools/python/python3-wcwidth_0.9.3.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-wcwidth_0.9.1.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.9.3.bb
index e7156a79ee..710de13f97 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.9.1.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.9.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "5823209b0d43af322ce698c689380d7c15ca31fa8e6e3be8459f27031bef0af5"
+SRC_URI[sha256sum] = "dfe7cfbd4cb59db9fe0931bd6091ab4a95b3acc5d56bfb50fa9fef0ccba5dc5c"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.1


--===============2258218431186608429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.9.1.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.9.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-wcwidth: PV changed from "0.9.1" to "0.9.3"
packages/x86-64-v3-poky-linux/python3-wcwidth: PKGV changed from 0.9.1 [default] to 0.9.3 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PV changed from "0.9.1" to "0.9.3"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGSIZE changed from 1604928 to 1606568 (+0%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGV changed from 0.9.1 [default] to 0.9.3 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PV changed from "0.9.1" to "0.9.3"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PKGV changed from 0.9.1 [default] to 0.9.3 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PV changed from "0.9.1" to "0.9.3"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PKGV changed from 0.9.1 [default] to 0.9.3 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PV changed from "0.9.1" to "0.9.3"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PKGV changed from 0.9.1 [default] to 0.9.3 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PV changed from "0.9.1" to "0.9.3"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 3834969 to 3846159 (+0%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGV changed from 0.9.1 [default] to 0.9.3 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: FILELIST: directory renamed /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables -> /usr/src/debug/python3-wcwidth/0.9.3/libwcwidth/src/tables, directory renamed /usr/src/debug/python3-wcwidth/0.9.1/wcwidth -> /usr/src/debug/python3-wcwidth/0.9.3/wcwidth, directory renamed /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src -> /usr/src/debug/python3-wcwidth/0.9.3/libwcwidth/src, directory renamed /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth -> /usr/src/debug/python3-wcwidth/0.9.3/libwcwidth/include/wcwidth
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PV changed from "0.9.1" to "0.9.3"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGSIZE changed from 3534102 to 3536412 (+0%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGV changed from 0.9.1 [default] to 0.9.3 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PV changed from "0.9.1" to "0.9.3"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PKGV changed from 0.9.1 [default] to 0.9.3 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/wcwidth-0.9.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info -> /usr/lib/python3.14/site-packages/wcwidth-0.9.3.dist-info
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PV changed from "0.9.1" to "0.9.3"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 5343493 to 5351192 (+0%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGV changed from 0.9.1 [default] to 0.9.3 [default]
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info moved to /usr/lib/python3.14/site-packages/wcwidth-0.9.3.dist-info

--===============2258218431186608429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-wcwidth-changelog.txt"

0.9.3 *unreleased*
0.9.2 *2026-10-04*

--===============2258218431186608429==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wcwidth-upgrade-0.9.1-0.9.3.patch"

RnJvbSBjYWUwYzVlZTA2MDNhYjYxYjdhODI3ZGM1YmZkODE0NmNhOWEzNDIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjEgT2N0IDIwMjYgMDY6MDU6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdjd2lkdGg6IHVwZ3JhZGUgMC45LjEgLT4gMC45LjMKCjAuOS4zICp1bnJlbGVhc2Vk
KgowLjkuMiAqMjAyNi0xMC0wNCoKLS0tCiAuLi4ve3B5dGhvbjMtd2N3aWR0aF8wLjkuMS5iYiA9
PiBweXRob24zLXdjd2lkdGhfMC45LjMuYmJ9ICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3tweXRob24zLXdjd2lkdGhfMC45LjEuYmIgPT4gcHl0aG9uMy13Y3dpZHRoXzAu
OS4zLmJifSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy13Y3dpZHRoXzAuOS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXdjd2lkdGhfMC45LjMuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdjd2lkdGhfMC45LjEuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuOS4z
LmJiCmluZGV4IGU3MTU2YTc5ZWUuLjcxMGRlMTNmOTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuOS4xLmJiCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuOS4zLmJiCkBAIC00LDcgKzQs
NyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vanF1YXN0L3djd2lkdGgiCiBMSUNF
TlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWIxNTk3
OWMzOWEyNTQzODkyZmNhOGNkODZiNGI1MmNiIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTgy
MzIwOWIwZDQzYWYzMjJjZTY5OGM2ODkzODBkN2MxNWNhMzFmYThlNmUzYmU4NDU5ZjI3MDMxYmVm
MGFmNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkZmU3Y2ZiZDRjYjU5ZGI5ZmUwOTMxYmQ2MDkx
YWI0YTk1YjNhY2M1ZDU2YmZiNTBmYTlmZWYwY2NiYTVkYzVjIgogCiBpbmhlcml0IHB5cGkgcHl0
aG9uX2hhdGNobGluZyBwdGVzdC1weXRob24tcHl0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============2258218431186608429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info -> /usr/lib/python3.14/site-packages/wcwidth-0.9.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/wcwidth-0.9.3.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info moved to /usr/lib/python3.14/site-packages/wcwidth-0.9.3.dist-info

--===============2258218431186608429==--
