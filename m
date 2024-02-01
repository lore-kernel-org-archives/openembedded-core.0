Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FC2C54EBE
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:21 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.2151.1706810405175972832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=STiGN8Ax;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VntgKGKw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018d65d3ee5d-82e4bd2d-1247-436c-8965-dda8f6b7cba5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810404;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Brtqrkc6UcSnmA5XmrEot8MX3O0pFxqb1+p20/d43Us=;
	b=STiGN8Axot9ELfheYSIVDnBzO2RUiB+hTFsfFQSFHmns/AqKQecv6pRBrRm38ywy
	7ectJPxMVk0Qti5X6dZWZlc9JG1jCEr0MjzVvtXqeQW84HNRlQdCeNhQFlN9BkL5fjf
	XUHx21HFhMapIhgocobooMlA8pzjwCOC3W6zVRWQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810404;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Brtqrkc6UcSnmA5XmrEot8MX3O0pFxqb1+p20/d43Us=;
	b=VntgKGKwgR/S1SQTSEkYOtmjjTlNTcHlEYmiqZFGXCgCby+rBbB1RfY6oVZL2vcX
	eDsYnihjIkZK9/WVFh7FmV1lr1THJRi459p9we0QItW+YopdboOAk9PDBrUfF5T4jD+
	2hgyQeQD3wYc6zoAsTdCKFySRY9Oi+VGn5XPdZ2Y=
Content-Type: multipart/mixed; boundary="===============5446344110142748987=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffstat: upgrading to 1.66 SUCCEEDED
Message-ID: <0101018d65d3ee5d-82e4bd2d-1247-436c-8965-dda8f6b7cba5-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194612

--===============5446344110142748987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffstat* to *1.66* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffstat-upgrade-1.65-1.66.patch
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
From bd67d64831fa6a66b111df07b2c1d744e898e748 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 06:39:41 +0000
Subject: [PATCH] diffstat: upgrade 1.65 -> 1.66

---
 .../diffstat/avoid-check-user-break-cc.patch  |  6 ++---
 .../{diffstat_1.65.bb => diffstat_1.66.bb}    | 23 +++++++++++++++++--
 2 files changed, 24 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/diffstat/{diffstat_1.65.bb => diffstat_1.66.bb} (47%)

diff --git a/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch b/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch
index 811faa48da..6fdeaf3017 100644
--- a/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch
+++ b/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch
@@ -1,4 +1,4 @@
-From 1046593aacb74ff888a0d68c0ff89b20c4bc9ed4 Mon Sep 17 00:00:00 2001
+From 336c9673e719d2689c5666669a6f0cc42b49a8bd Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 15 May 2018 17:17:01 +0800
 Subject: [PATCH] diffstat: fix wrong evaluation of CC
@@ -18,10 +18,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/aclocal.m4 b/aclocal.m4
-index 9281aa8..dd57b7a 100644
+index d4bd283..1b653c4 100644
 --- a/aclocal.m4
 +++ b/aclocal.m4
-@@ -1239,7 +1239,7 @@ CF_GCC_VERSION
+@@ -1522,7 +1522,7 @@ CF_GCC_VERSION
  CF_ACVERSION_CHECK(2.52,
  	[AC_PROG_CC_STDC],
  	[CF_ANSI_CC_REQD])
diff --git a/meta/recipes-devtools/diffstat/diffstat_1.65.bb b/meta/recipes-devtools/diffstat/diffstat_1.66.bb
similarity index 47%
rename from meta/recipes-devtools/diffstat/diffstat_1.65.bb
rename to meta/recipes-devtools/diffstat/diffstat_1.66.bb
index 59db7b1d78..2e10ea59d0 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.65.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.66.bb
@@ -1,3 +1,22 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,4 +1,4 @@
+# -Copyright 1994-2021,2022 by Thomas E. Dickey
+# +Copyright 1994-2023,2024 by Thomas E. Dickey
+#  All Rights Reserved.
+#  
+#  Permission to use, copy, modify, and distribute this software and its
+# 
+#
+
 SUMMARY = "Tool to produce a statistics based on a diff"
 DESCRIPTION = "diffstat reads the output of diff and displays a histogram of \
 the insertions, deletions, and modifications per-file. It is useful for \
@@ -5,14 +24,14 @@ reviewing large, complex patch files."
 HOMEPAGE = "http://invisible-island.net/diffstat/"
 SECTION = "devel"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6450594049f0eed1052e634ddcbeec28"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5713b4719a66a6527e6301e8f8745877"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
            file://avoid-check-user-break-cc.patch \
            "
 
-SRC_URI[sha256sum] = "8cf27424926debcd85921755c3915559288244bd103f62d740dc6b83b557a28a"
+SRC_URI[sha256sum] = "f54531bbe32e8e0fa461f018b41e3af516b632080172f361f05e50367ecbb69e"
 
 inherit autotools gettext ptest
 
-- 
2.42.0


--===============5446344110142748987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/diffstat/diffstat-ptest: FILELIST: added "/usr/lib/diffstat/ptest/testing/case47.pat /usr/lib/diffstat/ptest/testing/case47.ref /usr/lib/diffstat/ptest/testing/case47p1.ref /usr/lib/diffstat/ptest/testing/case47p9.ref /usr/lib/diffstat/ptest/testing/case47r1.ref /usr/lib/diffstat/ptest/testing/case47r2.ref /usr/lib/diffstat/ptest/testing/case47Rp0.ref /usr/lib/diffstat/ptest/testing/case47R.ref /usr/lib/diffstat/ptest/testing/case47k.ref /usr/lib/diffstat/ptest/testing/case47u.ref /usr/lib/diffstat/ptest/testing/case47b.ref /usr/lib/diffstat/ptest/testing/case47f0.ref"

--===============5446344110142748987==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffstat-upgrade-1.65-1.66.patch"

RnJvbSBiZDY3ZDY0ODMxZmE2YTY2YjExMWRmMDdiMmMxZDc0NGU4OThlNzQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwNjozOTo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZzdGF0OiB1cGdyYWRlIDEuNjUgLT4gMS42NgoKLS0tCiAuLi4vZGlmZnN0YXQvYXZvaWQtY2hl
Y2stdXNlci1icmVhay1jYy5wYXRjaCAgfCAgNiArKy0tLQogLi4uL3tkaWZmc3RhdF8xLjY1LmJi
ID0+IGRpZmZzdGF0XzEuNjYuYmJ9ICAgIHwgMjMgKysrKysrKysrKysrKysrKystLQogMiBmaWxl
cyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9kaWZmc3RhdC97ZGlmZnN0YXRfMS42NS5iYiA9PiBkaWZmc3RhdF8x
LjY2LmJifSAoNDclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kaWZmc3Rh
dC9kaWZmc3RhdC9hdm9pZC1jaGVjay11c2VyLWJyZWFrLWNjLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2RpZmZzdGF0L2RpZmZzdGF0L2F2b2lkLWNoZWNrLXVzZXItYnJlYWstY2MucGF0
Y2gKaW5kZXggODExZmFhNDhkYS4uNmZkZWFmMzAxNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2RpZmZzdGF0L2RpZmZzdGF0L2F2b2lkLWNoZWNrLXVzZXItYnJlYWstY2MucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RpZmZzdGF0L2RpZmZzdGF0L2F2b2lkLWNo
ZWNrLXVzZXItYnJlYWstY2MucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDEwNDY1OTNhYWNi
NzRmZjg4OGEwZDY4YzBmZjg5YjIwYzRiYzllZDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDMzNmM5NjczZTcxOWQyNjg5YzU2NjY2NjlhNmYwY2M0MmI0OWE4YmQgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBLYWkgS2FuZyA8a2FpLmthbmdAd2luZHJpdmVyLmNvbT4KIERh
dGU6IFR1ZSwgMTUgTWF5IDIwMTggMTc6MTc6MDEgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gZGlm
ZnN0YXQ6IGZpeCB3cm9uZyBldmFsdWF0aW9uIG9mIENDCkBAIC0xOCwxMCArMTgsMTAgQEAgU2ln
bmVkLW9mZi1ieTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9hY2xv
Y2FsLm00IGIvYWNsb2NhbC5tNAotaW5kZXggOTI4MWFhOC4uZGQ1N2I3YSAxMDA2NDQKK2luZGV4
IGQ0YmQyODMuLjFiNjUzYzQgMTAwNjQ0CiAtLS0gYS9hY2xvY2FsLm00CiArKysgYi9hY2xvY2Fs
Lm00Ci1AQCAtMTIzOSw3ICsxMjM5LDcgQEAgQ0ZfR0NDX1ZFUlNJT04KK0BAIC0xNTIyLDcgKzE1
MjIsNyBAQCBDRl9HQ0NfVkVSU0lPTgogIENGX0FDVkVSU0lPTl9DSEVDSygyLjUyLAogIAlbQUNf
UFJPR19DQ19TVERDXSwKICAJW0NGX0FOU0lfQ0NfUkVRRF0pCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZGlmZnN0YXQvZGlmZnN0YXRfMS42NS5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9kaWZmc3RhdC9kaWZmc3RhdF8xLjY2LmJiCnNpbWlsYXJpdHkgaW5kZXggNDclCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kaWZmc3RhdC9kaWZmc3RhdF8xLjY1LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGlmZnN0YXQvZGlmZnN0YXRfMS42Ni5i
YgppbmRleCA1OWRiN2IxZDc4Li4yZTEwZWE1OWQwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZGlmZnN0YXQvZGlmZnN0YXRfMS42NS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZGlmZnN0YXQvZGlmZnN0YXRfMS42Ni5iYgpAQCAtMSwzICsxLDIyIEBACisjIEZJWE1F
OiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRv
b2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0
aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElD
RU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhl
IGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAn
TGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFu
Z2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBAQCAtMSw0ICsxLDQgQEAK
KyMgLUNvcHlyaWdodCAxOTk0LTIwMjEsMjAyMiBieSBUaG9tYXMgRS4gRGlja2V5CisjICtDb3B5
cmlnaHQgMTk5NC0yMDIzLDIwMjQgYnkgVGhvbWFzIEUuIERpY2tleQorIyAgQWxsIFJpZ2h0cyBS
ZXNlcnZlZC4KKyMgIAorIyAgUGVybWlzc2lvbiB0byB1c2UsIGNvcHksIG1vZGlmeSwgYW5kIGRp
c3RyaWJ1dGUgdGhpcyBzb2Z0d2FyZSBhbmQgaXRzCisjIAorIworCiBTVU1NQVJZID0gIlRvb2wg
dG8gcHJvZHVjZSBhIHN0YXRpc3RpY3MgYmFzZWQgb24gYSBkaWZmIgogREVTQ1JJUFRJT04gPSAi
ZGlmZnN0YXQgcmVhZHMgdGhlIG91dHB1dCBvZiBkaWZmIGFuZCBkaXNwbGF5cyBhIGhpc3RvZ3Jh
bSBvZiBcCiB0aGUgaW5zZXJ0aW9ucywgZGVsZXRpb25zLCBhbmQgbW9kaWZpY2F0aW9ucyBwZXIt
ZmlsZS4gSXQgaXMgdXNlZnVsIGZvciBcCkBAIC01LDE0ICsyNCwxNCBAQCByZXZpZXdpbmcgbGFy
Z2UsIGNvbXBsZXggcGF0Y2ggZmlsZXMuIgogSE9NRVBBR0UgPSAiaHR0cDovL2ludmlzaWJsZS1p
c2xhbmQubmV0L2RpZmZzdGF0LyIKIFNFQ1RJT04gPSAiZGV2ZWwiCiBMSUNFTlNFID0gIk1JVCIK
LUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTY0NTA1OTQwNDlmMGVlZDEw
NTJlNjM0ZGRjYmVlYzI4IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9
NTcxM2I0NzE5YTY2YTY1MjdlNjMwMWU4Zjg3NDU4NzciCiAKIFNSQ19VUkkgPSAiaHR0cDovL2lu
dmlzaWJsZS1taXJyb3IubmV0L2FyY2hpdmVzLyR7QlBOfS8ke0JQfS50Z3ogXAogICAgICAgICAg
ICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgZmlsZTovL2F2b2lkLWNoZWNrLXVzZXIt
YnJlYWstY2MucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4
Y2YyNzQyNDkyNmRlYmNkODU5MjE3NTVjMzkxNTU1OTI4ODI0NGJkMTAzZjYyZDc0MGRjNmI4M2I1
NTdhMjhhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImY1NDUzMWJiZTMyZThlMGZhNDYxZjAxOGI0
MWUzYWY1MTZiNjMyMDgwMTcyZjM2MWYwNWU1MDM2N2VjYmI2OWUiCiAKIGluaGVyaXQgYXV0b3Rv
b2xzIGdldHRleHQgcHRlc3QKIAotLSAKMi40Mi4wCgo=

--===============5446344110142748987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffstat/diffstat-dbg: PKGSIZE changed from 137520 to 140520 (+2%)
packages/core2-64-poky-linux/diffstat/diffstat-dbg: PV changed from "1.65" to "1.66"
packages/core2-64-poky-linux/diffstat/diffstat-dbg: PKGV changed from 1.65 [default] to 1.66 [default]
packages/core2-64-poky-linux/diffstat/diffstat-dev: PV changed from "1.65" to "1.66"
packages/core2-64-poky-linux/diffstat/diffstat-dev: PKGV changed from 1.65 [default] to 1.66 [default]
packages/core2-64-poky-linux/diffstat/diffstat-doc: PKGSIZE changed from 9066 to 9160 (+1%)
packages/core2-64-poky-linux/diffstat/diffstat-doc: PV changed from "1.65" to "1.66"
packages/core2-64-poky-linux/diffstat/diffstat-doc: PKGV changed from 1.65 [default] to 1.66 [default]
packages/core2-64-poky-linux/diffstat/diffstat-locale: PV changed from "1.65" to "1.66"
packages/core2-64-poky-linux/diffstat/diffstat-locale: PKGV changed from 1.65 [default] to 1.66 [default]
packages/core2-64-poky-linux/diffstat/diffstat-ptest: PKGSIZE changed from 623782 to 635329 (+2%)
packages/core2-64-poky-linux/diffstat/diffstat-ptest: PV changed from "1.65" to "1.66"
packages/core2-64-poky-linux/diffstat/diffstat-ptest: FILELIST: added "/usr/lib/diffstat/ptest/testing/case47Rp0.ref /usr/lib/diffstat/ptest/testing/case47f0.ref /usr/lib/diffstat/ptest/testing/case47p1.ref /usr/lib/diffstat/ptest/testing/case47p9.ref /usr/lib/diffstat/ptest/testing/case47r1.ref /usr/lib/diffstat/ptest/testing/case47r2.ref /usr/lib/diffstat/ptest/testing/case47.pat /usr/lib/diffstat/ptest/testing/case47u.ref /usr/lib/diffstat/ptest/testing/case47b.ref /usr/lib/diffstat/ptest/testing/case47R.ref /usr/lib/diffstat/ptest/testing/case47k.ref /usr/lib/diffstat/ptest/testing/case47.ref"
packages/core2-64-poky-linux/diffstat/diffstat-ptest: PKGV changed from 1.65 [default] to 1.66 [default]
packages/core2-64-poky-linux/diffstat/diffstat-src: PKGSIZE changed from 85350 to 87941 (+3%)
packages/core2-64-poky-linux/diffstat/diffstat-src: PV changed from "1.65" to "1.66"
packages/core2-64-poky-linux/diffstat/diffstat-src: PKGV changed from 1.65 [default] to 1.66 [default]
packages/core2-64-poky-linux/diffstat/diffstat-staticdev: PV changed from "1.65" to "1.66"
packages/core2-64-poky-linux/diffstat/diffstat-staticdev: PKGV changed from 1.65 [default] to 1.66 [default]
packages/core2-64-poky-linux/diffstat/diffstat: PV changed from "1.65" to "1.66"
packages/core2-64-poky-linux/diffstat/diffstat: PKGV changed from 1.65 [default] to 1.66 [default]
packages/core2-64-poky-linux/diffstat: SRC_URI changed from "http://invisible-mirror.net/archives/diffstat/diffstat-1.65.tgz file://run-ptest file://avoid-check-user-break-cc.patch" to "http://invisible-mirror.net/archives/diffstat/diffstat-1.66.tgz file://run-ptest file://avoid-check-user-break-cc.patch"
packages/core2-64-poky-linux/diffstat: PV changed from "1.65" to "1.66"
packages/core2-64-poky-linux/diffstat: PKGV changed from 1.65 [default] to 1.66 [default]

--===============5446344110142748987==--

