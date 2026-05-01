Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E16ACD3425
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:38 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15615.1777645533778284771
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=P8G7vhmg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Vr+qdc5z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019de3ee4514-ac63cf1a-2ec3-4ce4-a43c-16a2cd5e4b21-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ElN43KdmYVxGvk5FF4u3gUo+f2av6ecluTCKYfqH95Q=;
	b=P8G7vhmge4EuHX6CAQ53dJJ9I/YxhIrk3nOiR55N/31ljH3MEBFe0sf6nabEGRSe
	lE2tigtCgMln5LUm9d2knzT1ATEBE3afm5YfKm7Qql1xtoBRG93EtT00qfOqJoUi4sF
	naBFuAxNbtlStehMjdIRGlvWdW4anly6FU/aSqzo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ElN43KdmYVxGvk5FF4u3gUo+f2av6ecluTCKYfqH95Q=;
	b=Vr+qdc5zfSOilCYthkwLbnHFQIhqswsBqk6RdXAU2hONt3JBkOEHyAM2cTIUb7Es
	mkvHwoKpp0EQjjBh7pIJae3heZ27c/378KmuMiRGLrkAv+zsxRSn9W7nz+NHb7Hwfau
	B5rrSToGChZKG4kSN00IDGwLUZRY+jdG8BgOLAqs=
Content-Type: multipart/mixed; boundary="===============7585025762287522765=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.54.0 SUCCEEDED
Message-ID: <0101019de3ee4514-ac63cf1a-2ec3-4ce4-a43c-16a2cd5e4b21-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236226

--===============7585025762287522765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *git* to *2.54.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.53.0-2.54.0.patch
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
From 3012d0c2bd015eb800dbb1ee47b05a9ec5bc01df Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 07:21:36 +0000
Subject: [PATCH] git: upgrade 2.53.0 -> 2.54.0

---
 ...uname-do-not-force-RHEL-7-specific-build-.patch |  4 ++--
 meta/recipes-devtools/git/git/fixsort.patch        | 14 +++++++-------
 .../git/{git_2.53.0.bb => git_2.54.0.bb}           |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/git/{git_2.53.0.bb => git_2.54.0.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
index 61bf0e12dc..b0c8e652aa 100644
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -1,4 +1,4 @@
-From 325c30dac4eafdd463c8ffcfe1215858d642ab91 Mon Sep 17 00:00:00 2001
+From d73b4c666aa12452a26c3fac83371a707e6f13c0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 7 Feb 2022 10:13:15 +0100
 Subject: [PATCH] config.mak.uname: do not force RHEL-7 specific build settings
@@ -17,7 +17,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/config.mak.uname b/config.mak.uname
-index b12d4e1..b5b8d82 100644
+index 5feb582..060cd29 100644
 --- a/config.mak.uname
 +++ b/config.mak.uname
 @@ -63,10 +63,6 @@ ifeq ($(uname_S),Linux)
diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
index 7066e1808d..046d09160a 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,4 +1,4 @@
-From 65fa5c0f849fe4a1e3cb8e6af0086ef0748c28de Mon Sep 17 00:00:00 2001
+From f928abf16841e42bfd49ccaabc164318f61e842a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 17 Feb 2021 17:57:13 +0000
 Subject: [PATCH] generate-configlist.sh: Fix determinism issue
@@ -19,14 +19,14 @@ shell script generating the header.
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Upstream-Status: Submitted [https://public-inbox.org/git/f029a942dd3d50d85e60bd37d8e454524987842f.camel@linuxfoundation.org/T/#u]
 ---
- generate-configlist.sh | 2 +-
+ tools/generate-configlist.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/generate-configlist.sh b/generate-configlist.sh
-index 75c39ad..6d4525e 100755
---- a/generate-configlist.sh
-+++ b/generate-configlist.sh
-@@ -23,7 +23,7 @@ EOF
+diff --git a/tools/generate-configlist.sh b/tools/generate-configlist.sh
+index e28054f..96ddd51 100755
+--- a/tools/generate-configlist.sh
++++ b/tools/generate-configlist.sh
+@@ -24,7 +24,7 @@ EOF
  	d' \
  	    "$SOURCE_DIR"/Documentation/*config.adoc \
  	    "$SOURCE_DIR"/Documentation/config/*.adoc |
diff --git a/meta/recipes-devtools/git/git_2.53.0.bb b/meta/recipes-devtools/git/git_2.54.0.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.53.0.bb
rename to meta/recipes-devtools/git/git_2.54.0.bb
index 8d71905f41..80c535a726 100644
--- a/meta/recipes-devtools/git/git_2.53.0.bb
+++ b/meta/recipes-devtools/git/git_2.54.0.bb
@@ -170,7 +170,7 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "429dc0f5fe5f14109930cdbbb588c5d6ef5b8528910f0d738040744bebdc6275"
+SRC_URI[tarball.sha256sum] = "45e8107643a44e3ce46f5665beb35af3932fb0d70017687905ab5d4e3aafa8eb"
 
 CVE_STATUS[CVE-2024-32002] = "fixed-version: fixed since v2.46.0"
 CVE_STATUS[CVE-2024-50349] = "fixed-version: fixed since v2.49.0"
-- 
2.47.1


--===============7585025762287522765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/git/git: FILELIST: added "/usr/libexec/git-core/git-history"

--===============7585025762287522765==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.53.0-2.54.0.patch"

RnJvbSAzMDEyZDBjMmJkMDE1ZWI4MDBkYmIxZWU0N2IwNWE5ZWM1YmMwMWRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwNzoyMTozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdp
dDogdXBncmFkZSAyLjUzLjAgLT4gMi41NC4wCgotLS0KIC4uLnVuYW1lLWRvLW5vdC1mb3JjZS1S
SEVMLTctc3BlY2lmaWMtYnVpbGQtLnBhdGNoIHwgIDQgKystLQogbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2dpdC9naXQvZml4c29ydC5wYXRjaCAgICAgICAgfCAxNCArKysrKysrLS0tLS0tLQogLi4u
L2dpdC97Z2l0XzIuNTMuMC5iYiA9PiBnaXRfMi41NC4wLmJifSAgICAgICAgICAgfCAgMiArLQog
MyBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L3tnaXRfMi41My4wLmJiID0+IGdpdF8yLjU0LjAu
YmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXQvMDAw
MS1jb25maWcubWFrLnVuYW1lLWRvLW5vdC1mb3JjZS1SSEVMLTctc3BlY2lmaWMtYnVpbGQtLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXQvMDAwMS1jb25maWcubWFrLnVuYW1l
LWRvLW5vdC1mb3JjZS1SSEVMLTctc3BlY2lmaWMtYnVpbGQtLnBhdGNoCmluZGV4IDYxYmYwZTEy
ZGMuLmIwYzhlNjUyYWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0
LzAwMDEtY29uZmlnLm1hay51bmFtZS1kby1ub3QtZm9yY2UtUkhFTC03LXNwZWNpZmljLWJ1aWxk
LS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC8wMDAxLWNvbmZpZy5t
YWsudW5hbWUtZG8tbm90LWZvcmNlLVJIRUwtNy1zcGVjaWZpYy1idWlsZC0ucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDMyNWMzMGRhYzRlYWZkZDQ2M2M4ZmZjZmUxMjE1ODU4ZDY0MmFiOTEg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQ3M2I0YzY2NmFhMTI0NTJhMjZjM2ZhYzgz
MzcxYTcwN2U2ZjEzYzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogTW9uLCA3IEZlYiAyMDIyIDEwOjEz
OjE1ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZy5tYWsudW5hbWU6IGRvIG5vdCBmb3Jj
ZSBSSEVMLTcgc3BlY2lmaWMgYnVpbGQgc2V0dGluZ3MKQEAgLTE3LDcgKzE3LDcgQEAgU2lnbmVk
LW9mZi1ieTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+CiAgMSBmaWxl
IGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWcubWFrLnVuYW1l
IGIvY29uZmlnLm1hay51bmFtZQotaW5kZXggYjEyZDRlMS4uYjViOGQ4MiAxMDA2NDQKK2luZGV4
IDVmZWI1ODIuLjA2MGNkMjkgMTAwNjQ0CiAtLS0gYS9jb25maWcubWFrLnVuYW1lCiArKysgYi9j
b25maWcubWFrLnVuYW1lCiBAQCAtNjMsMTAgKzYzLDYgQEAgaWZlcSAoJCh1bmFtZV9TKSxMaW51
eCkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0L2ZpeHNvcnQucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdC9maXhzb3J0LnBhdGNoCmluZGV4IDcw
NjZlMTgwOGQuLjA0NmQwOTE2MGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
aXQvZ2l0L2ZpeHNvcnQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXQv
Zml4c29ydC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNjVmYTVjMGY4NDlmZTRhMWUzY2I4
ZTZhZjAwODZlZjA3NDhjMjhkZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjkyOGFi
ZjE2ODQxZTQyYmZkNDljY2FhYmMxNjQzMThmNjFlODQyYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24u
b3JnPgogRGF0ZTogV2VkLCAxNyBGZWIgMjAyMSAxNzo1NzoxMyArMDAwMAogU3ViamVjdDogW1BB
VENIXSBnZW5lcmF0ZS1jb25maWdsaXN0LnNoOiBGaXggZGV0ZXJtaW5pc20gaXNzdWUKQEAgLTE5
LDE0ICsxOSwxNCBAQCBzaGVsbCBzY3JpcHQgZ2VuZXJhdGluZyB0aGUgaGVhZGVyLgogU2lnbmVk
LW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5v
cmc+CiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9wdWJsaWMtaW5ib3gub3Jn
L2dpdC9mMDI5YTk0MmRkM2Q1MGQ4NWU2MGJkMzdkOGU0NTQ1MjQ5ODc4NDJmLmNhbWVsQGxpbnV4
Zm91bmRhdGlvbi5vcmcvVC8jdV0KIC0tLQotIGdlbmVyYXRlLWNvbmZpZ2xpc3Quc2ggfCAyICst
CisgdG9vbHMvZ2VuZXJhdGUtY29uZmlnbGlzdC5zaCB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAotZGlmZiAtLWdpdCBhL2dlbmVyYXRlLWNv
bmZpZ2xpc3Quc2ggYi9nZW5lcmF0ZS1jb25maWdsaXN0LnNoCi1pbmRleCA3NWMzOWFkLi42ZDQ1
MjVlIDEwMDc1NQotLS0tIGEvZ2VuZXJhdGUtY29uZmlnbGlzdC5zaAotKysrIGIvZ2VuZXJhdGUt
Y29uZmlnbGlzdC5zaAotQEAgLTIzLDcgKzIzLDcgQEAgRU9GCitkaWZmIC0tZ2l0IGEvdG9vbHMv
Z2VuZXJhdGUtY29uZmlnbGlzdC5zaCBiL3Rvb2xzL2dlbmVyYXRlLWNvbmZpZ2xpc3Quc2gKK2lu
ZGV4IGUyODA1NGYuLjk2ZGRkNTEgMTAwNzU1CistLS0gYS90b29scy9nZW5lcmF0ZS1jb25maWds
aXN0LnNoCisrKysgYi90b29scy9nZW5lcmF0ZS1jb25maWdsaXN0LnNoCitAQCAtMjQsNyArMjQs
NyBAQCBFT0YKICAJZCcgXAogIAkgICAgIiRTT1VSQ0VfRElSIi9Eb2N1bWVudGF0aW9uLypjb25m
aWcuYWRvYyBcCiAgCSAgICAiJFNPVVJDRV9ESVIiL0RvY3VtZW50YXRpb24vY29uZmlnLyouYWRv
YyB8CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjUzLjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjU0LjAuYmIKc2ltaWxhcml0eSBpbmRl
eCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi41My4wLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjU0LjAuYmIKaW5kZXgg
OGQ3MTkwNWY0MS4uODBjNTM1YTcyNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2dpdC9naXRfMi41My4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIu
NTQuMC5iYgpAQCAtMTcwLDcgKzE3MCw3IEBAIEVYVFJBX09FQ09ORiArPSAiYWNfY3Zfc25wcmlu
dGZfcmV0dXJuc19ib2d1cz1ubyBcCiAgICAgICAgICAgICAgICAgICIKIEVYVFJBX09FTUFLRSAr
PSAiTk9fR0VUVEVYVD0xIgogCi1TUkNfVVJJW3RhcmJhbGwuc2hhMjU2c3VtXSA9ICI0MjlkYzBm
NWZlNWYxNDEwOTkzMGNkYmJiNTg4YzVkNmVmNWI4NTI4OTEwZjBkNzM4MDQwNzQ0YmViZGM2Mjc1
IgorU1JDX1VSSVt0YXJiYWxsLnNoYTI1NnN1bV0gPSAiNDVlODEwNzY0M2E0NGUzY2U0NmY1NjY1
YmViMzVhZjM5MzJmYjBkNzAwMTc2ODc5MDVhYjVkNGUzYWFmYThlYiIKIAogQ1ZFX1NUQVRVU1tD
VkUtMjAyNC0zMjAwMl0gPSAiZml4ZWQtdmVyc2lvbjogZml4ZWQgc2luY2UgdjIuNDYuMCIKIENW
RV9TVEFUVVNbQ1ZFLTIwMjQtNTAzNDldID0gImZpeGVkLXZlcnNpb246IGZpeGVkIHNpbmNlIHYy
LjQ5LjAiCi0tIAoyLjQ3LjEKCg==

--===============7585025762287522765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-ef0dd5eb98345bc4f8ceae6b15f27a2c4d802d1b"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:ef0dd5eb98345bc4f8ceae6b15f27a2c4d802d1b"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 357 Local 338 Mirrors 0 Missed 19 Current 231 (94% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 237 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 250 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 275 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 281 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 283 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 289 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 300 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 321 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 330 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 342 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 350 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 358 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 360 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_package_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe git-2.54.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_package_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe grep-3.12-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe git-2.54.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 373 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 375 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe curl-8.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 378 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 379 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 380 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 381 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 382 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe curl-8.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 386 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 387 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: recipe curl-8.19.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe grep-3.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 396 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 399 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe expat-2.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 402 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 407 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 411 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 413 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/coreutils/9.10/temp/log.do_packagedata_setscene.3963211
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 415 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_package_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 417 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 418 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 424 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 425 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 428 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 429 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 844 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_recipe_qa)
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 437 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 439 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 442 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe git-2.54.0-r0: task do_recipe_qa: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 445 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 446 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 455 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe procps-4.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe git-2.54.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 916 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_package_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe git-2.54.0-r0: task do_fetch: Started
NOTE: recipe procps-4.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.54.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 471 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 934 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_unpack)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 486 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 1031 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_create_recipe_spdx)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.54.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe git-2.54.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1055 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe git-2.54.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1061 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1062 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.54.0-r0: task do_unpack: Succeeded
NOTE: Running task 1063 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1064 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe git-2.54.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1066 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe git-2.54.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1067 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1069 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe git-2.54.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1070 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe git-2.54.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 501 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 502 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1072 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.10-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 503 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 513 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 525 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 530 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 531 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 532 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 540 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 543 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 550 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running setscene task 555 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1129 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 561 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 562 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 570 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 571 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 580 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 584 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 586 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 588 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1418 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1480 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_packagedata)
NOTE: recipe git-2.54.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.10-r0: task do_packagedata: Started
NOTE: recipe git-2.54.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1500 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_configure)
NOTE: recipe git-2.54.0-r0: task do_configure: Started
NOTE: recipe coreutils-9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 1501 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_ipk)
NOTE: Running task 1502 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_deb)
NOTE: Running task 1503 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_rpm)
NOTE: Running task 1504 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_qa)
NOTE: recipe findutils-4.10.0-r0: task do_package_write_ipk: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_deb: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_qa: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_ipk unihash changed to d38e16aa4e1a9d99e07760ffd185cf8fc2fe913adbb690751b116e0e334d5c57
NOTE: recipe findutils-4.10.0-r0: task do_package_qa: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_qa unihash changed to 63f30130ba4a13a9400330c1cbc9711e7fe2e70f1b77943835837af2433ba4f2
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_deb unihash changed to d9ddb0eeef1261356d5e021ae094ea4606a1e9dd09475ee7a55917a428dfc276
NOTE: recipe findutils-4.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_rpm unihash changed to 4b3ebe9bd8c3f6e41596f368c309f56eb6dd551df175497fea8f4bbb518d7f5f
NOTE: recipe git-2.54.0-r0: task do_configure: Succeeded
NOTE: Running task 1505 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_compile)
NOTE: recipe git-2.54.0-r0: task do_compile: Started
NOTE: recipe git-2.54.0-r0: task do_compile: Succeeded
NOTE: Running task 1506 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_install)
NOTE: recipe git-2.54.0-r0: task do_install: Started
NOTE: recipe git-2.54.0-r0: task do_install: Succeeded
NOTE: Running task 1507 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_package)
NOTE: Running task 1508 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_populate_sysroot)
NOTE: recipe git-2.54.0-r0: task do_populate_sysroot: Started
NOTE: recipe git-2.54.0-r0: task do_package: Started
NOTE: recipe git-2.54.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.54.0-r0: task do_package: Succeeded
NOTE: Running task 1509 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_packagedata)
NOTE: recipe git-2.54.0-r0: task do_packagedata: Started
NOTE: recipe git-2.54.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1510 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_create_spdx)
NOTE: Running task 1511 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_package_write_ipk)
NOTE: Running task 1512 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_package_write_deb)
NOTE: Running task 1513 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_package_write_rpm)
NOTE: Running task 1514 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_package_qa)
NOTE: recipe git-2.54.0-r0: task do_create_spdx: Started
NOTE: recipe git-2.54.0-r0: task do_package_write_ipk: Started
NOTE: recipe git-2.54.0-r0: task do_package_write_deb: Started
NOTE: recipe git-2.54.0-r0: task do_package_write_rpm: Started
NOTE: recipe git-2.54.0-r0: task do_package_qa: Started
NOTE: recipe git-2.54.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe git-2.54.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1515 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_create_package_spdx)
NOTE: recipe git-2.54.0-r0: task do_create_package_spdx: Started
NOTE: recipe git-2.54.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe git-2.54.0-r0: task do_package_qa: Succeeded
NOTE: recipe git-2.54.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe git-2.54.0-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 1516 of 1516 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.54.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1516 tasks of which 1482 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 55 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ar went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ka went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ta went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.11-r0 to 0:9.10-r0) [version-going-backwards]
ERROR: coreutils-9.10-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7585025762287522765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/git/git-bash-completion: PV changed from "2.53.0" to "2.54.0"
packages/x86-64-v3-poky-linux/git/git-bash-completion: PKGSIZE changed from 94695 to 94826 (+0%)
packages/x86-64-v3-poky-linux/git/git-bash-completion: PKGV changed from 2.53.0 [default] to 2.54.0 [default]
packages/x86-64-v3-poky-linux/git/git-dbg: PV changed from "2.53.0" to "2.54.0"
packages/x86-64-v3-poky-linux/git/git-dbg: PKGSIZE changed from 101210864 to 103299464 (+2%)
packages/x86-64-v3-poky-linux/git/git-dbg: PKGV changed from 2.53.0 [default] to 2.54.0 [default]
packages/x86-64-v3-poky-linux/git/git-dev: PV changed from "2.53.0" to "2.54.0"
packages/x86-64-v3-poky-linux/git/git-dev: PKGV changed from 2.53.0 [default] to 2.54.0 [default]
packages/x86-64-v3-poky-linux/git/git-doc: PV changed from "2.53.0" to "2.54.0"
packages/x86-64-v3-poky-linux/git/git-doc: PKGV changed from 2.53.0 [default] to 2.54.0 [default]
packages/x86-64-v3-poky-linux/git/git-locale: PV changed from "2.53.0" to "2.54.0"
packages/x86-64-v3-poky-linux/git/git-locale: PKGV changed from 2.53.0 [default] to 2.54.0 [default]
packages/x86-64-v3-poky-linux/git/git-perltools: PV changed from "2.53.0" to "2.54.0"
packages/x86-64-v3-poky-linux/git/git-perltools: PKGSIZE changed from 278983 to 280274 (+0%)
packages/x86-64-v3-poky-linux/git/git-perltools: PKGV changed from 2.53.0 [default] to 2.54.0 [default]
packages/x86-64-v3-poky-linux/git/git-src: FILELIST: directory renamed /usr/src/debug/git/2.53.0/negotiator -> /usr/src/debug/git/2.54.0/negotiator, directory renamed /usr/src/debug/git/2.53.0/compat/linux -> /usr/src/debug/git/2.54.0/compat/linux, directory renamed /usr/src/debug/git/2.53.0/compat -> /usr/src/debug/git/2.54.0/compat, directory renamed /usr/src/debug/git/2.53.0/sha1dc -> /usr/src/debug/git/2.54.0/sha1dc, directory renamed /usr/src/debug/git/2.53.0/xdiff -> /usr/src/debug/git/2.54.0/xdiff, directory renamed /usr/src/debug/git/2.53.0/sha256/block -> /usr/src/debug/git/2.54.0/sha256/block, directory renamed /usr/src/debug/git/2.53.0/compiler-tricks -> /usr/src/debug/git/2.54.0/compiler-tricks, directory renamed /usr/src/debug/git/2.53.0/refs -> /usr/src/debug/git/2.54.0/refs, directory renamed /usr/src/debug/git/2.53.0/trace2 -> /usr/src/debug/git/2.54.0/trace2, directory renamed /usr/src/debug/git/2.53.0/ewah -> /usr/src/debug/git/2.54.0/ewah, removed "/usr/src/debug/g
 it/2.53.0/bundle-uri.h /usr/src/debug/git/2.53.0/builtin/diff.c /usr/src/debug/git/2.53.0/bundle-uri.c /usr/src/debug/git/2.53.0/merge-blobs.c /usr/src/debug/git/2.53.0/dir-iterator.h /usr/src/debug/git/2.53.0/builtin/cat-file.c /usr/src/debug/git/2.53.0/dir-iterator.c /usr/src/debug/git/2.53.0/merge-blobs.h /usr/src/debug/git/2.53.0/cache-tree.h /usr/src/debug/git/2.53.0/git.c /usr/src/debug/git/2.53.0/builtin/update-server-info.c /usr/src/debug/git/2.53.0/cache-tree.c /usr/src/debug/git/2.53.0/builtin/diff-tree.c /usr/src/debug/git/2.53.0/builtin/read-tree.c /usr/src/debug/git/2.53.0/builtin/show-ref.c /usr/src/debug/git/2.53.0/builtin/mailinfo.c /usr/src/debug/git/2.53.0/prio-queue.h /usr/src/debug/git/2.53.0/diff-no-index.c /usr/src/debug/git/2.53.0/prio-queue.c /usr/src/debug/git/2.53.0/submodule-config.c /usr/src/debug/git/2.53.0/builtin/mv.c /usr/src/debug/git/2.53.0/submodule-config.h /usr/src/debug/git/2.53.0/replace-object.c /usr/src/debug/git/2.53.0/reftable/reftable-iter
 ator.h /usr/src/debug/git/2.53.0/replace-object.h /usr/src/debug/git/2.53.0/builtin/log.c /usr/src/debug/git/2.53.0/transport-internal.h /usr/src/debug/git/2.53.0/grep.c /usr/src/debug/git/2.53.0/grep.h /usr/src/debug/git/2.53.0/pack.h /usr/src/debug/git/2.53.0/builtin/merge-index.c /usr/src/debug/git/2.53.0/commit-graph.c /usr/src/debug/git/2.53.0/commit-graph.h /usr/src/debug/git/2.53.0/diagnose.h /usr/src/debug/git/2.53.0/diagnose.c /usr/src/debug/git/2.53.0/builtin/pack-redundant.c /usr/src/debug/git/2.53.0/notes-utils.h /usr/src/debug/git/2.53.0/builtin/multi-pack-index.c /usr/src/debug/git/2.53.0/notes-utils.c /usr/src/debug/git/2.53.0/hex-ll.c /usr/src/debug/git/2.53.0/builtin/bugreport.c /usr/src/debug/git/2.53.0/tmp-objdir.c /usr/src/debug/git/2.53.0/write-or-die.c /usr/src/debug/git/2.53.0/parse.c /usr/src/debug/git/2.53.0/write-or-die.h /usr/src/debug/git/2.53.0/reftable/reftable-error.h /usr/src/debug/git/2.53.0/tmp-objdir.h /usr/src/debug/git/2.53.0/pack-revindex.c /usr
 /src/debug/git/2.53.0/pack-revindex.h /usr/src/debug/git/2.53.0/csum-file.h /usr/src/debug/git/2.53.0/read-cache-ll.h /usr/src/debug/git/2.53.0/csum-file.c /usr/src/debug/git/2.53.0/editor.h /usr/src/debug/git/2.53.0/builtin/push.c /usr/src/debug/git/2.53.0/builtin/diff-files.c /usr/src/debug/git/2.53.0/sha1dc_git.h /usr/src/debug/git/2.53.0/thread-utils.h /usr/src/debug/git/2.53.0/line-range.h /usr/src/debug/git/2.53.0/builtin/credential-store.c /usr/src/debug/git/2.53.0/thread-utils.c /usr/src/debug/git/2.53.0/sha1dc_git.c /usr/src/debug/git/2.53.0/date.c /usr/src/debug/git/2.53.0/archive-tar.c /usr/src/debug/git/2.53.0/builtin/upload-pack.c /usr/src/debug/git/2.53.0/builtin/verify-pack.c /usr/src/debug/git/2.53.0/date.h /usr/src/debug/git/2.53.0/reftable/reftable-merged.h /usr/src/debug/git/2.53.0/builtin/fsck.c /usr/src/debug/git/2.53.0/object-file.h /usr/src/debug/git/2.53.0/json-writer.h /usr/src/debug/git/2.53.0/json-writer.c /usr/src/debug/git/2.53.0/builtin/patch-id.c /usr/
 src/debug/git/2.53.0/object-file.c /usr/src/debug/git/2.53.0/reftable/iter.h /usr/src/debug/git/2.53.0/reftable/tree.h /usr/src/debug/git/2.53.0/line-range.c /usr/src/debug/git/2.53.0/builtin/checkout-index.c /usr/src/debug/git/2.53.0/reftable/fsck.c /usr/src/debug/git/2.53.0/reftable/iter.c /usr/src/debug/git/2.53.0/reftable/tree.c /usr/src/debug/git/2.53.0/ws.c /usr/src/debug/git/2.53.0/parse-options.c /usr/src/debug/git/2.53.0/parse-options.h /usr/src/debug/git/2.53.0/ws.h /usr/src/debug/git/2.53.0/builtin/revert.c /usr/src/debug/git/2.53.0/builtin/bisect.c /usr/src/debug/git/2.53.0/builtin/branch.c /usr/src/debug/git/2.53.0/builtin/bundle.c /usr/src/debug/git/2.53.0/builtin/column.c /usr/src/debug/git/2.53.0/builtin/commit.c /usr/src/debug/git/2.53.0/builtin/config.c /usr/src/debug/git/2.53.0/builtin/mktree.c /usr/src/debug/git/2.53.0/builtin/rebase.c /usr/src/debug/git/2.53.0/builtin/reflog.c /usr/src/debug/git/2.53.0/pack-mtimes.c /usr/src/debug/git/2.53.0/loose.h /usr/src/deb
 ug/git/2.53.0/pack-mtimes.h /usr/src/debug/git/2.53.0/imap-send.c /usr/src/debug/git/2.53.0/odb/streaming.c /usr/src/debug/git/2.53.0/builtin/prune-packed.c /usr/src/debug/git/2.53.0/odb/streaming.h /usr/src/debug/git/2.53.0/builtin/credential-cache--daemon.c /usr/src/debug/git/2.53.0/resolve-undo.h /usr/src/debug/git/2.53.0/resolve-undo.c /usr/src/debug/git/2.53.0/patch-ids.c /usr/src/debug/git/2.53.0/promisor-remote.c /usr/src/debug/git/2.53.0/quote.c /usr/src/debug/git/2.53.0/promisor-remote.h /usr/src/debug/git/2.53.0/patch-ids.h /usr/src/debug/git/2.53.0/diff-delta.c /usr/src/debug/git/2.53.0/builtin/repo.c /usr/src/debug/git/2.53.0/symlinks.c /usr/src/debug/git/2.53.0/symlinks.h /usr/src/debug/git/2.53.0/combine-diff.c /usr/src/debug/git/2.53.0/rebase-interactive.c /usr/src/debug/git/2.53.0/builtin/difftool.c /usr/src/debug/git/2.53.0/tag.c /usr/src/debug/git/2.53.0/rebase-interactive.h /usr/src/debug/git/2.53.0/builtin/submodule--helper.c /usr/src/debug/git/2.53.0/tag.h /usr/
 src/debug/git/2.53.0/reachable.h /usr/src/debug/git/2.53.0/reachable.c /usr/src/debug/git/2.53.0/unicode-width.h /usr/src/debug/git/2.53.0/upload-pack.h /usr/src/debug/git/2.53.0/upload-pack.c /usr/src/debug/git/2.53.0/versioncmp.h /usr/src/debug/git/2.53.0/pager.h /usr/src/debug/git/2.53.0/parse.h /usr/src/debug/git/2.53.0/quote.h /usr/src/debug/git/2.53.0/alias.h /usr/src/debug/git/2.53.0/alloc.h /usr/src/debug/git/2.53.0/apply.h /usr/src/debug/git/2.53.0/blame.h /usr/src/debug/git/2.53.0/alias.c /usr/src/debug/git/2.53.0/alloc.c /usr/src/debug/git/2.53.0/apply.c /usr/src/debug/git/2.53.0/blame.c /usr/src/debug/git/2.53.0/reftable/basics.h /usr/src/debug/git/2.53.0/bloom.c /usr/src/debug/git/2.53.0/color.c /usr/src/debug/git/2.53.0/ctype.c /usr/src/debug/git/2.53.0/versioncmp.c /usr/src/debug/git/2.53.0/editor.c /usr/src/debug/git/2.53.0/reftable/basics.c /usr/src/debug/git/2.53.0/stable-qsort.c /usr/src/debug/git/2.53.0/builtin/rev-list.c /usr/src/debug/git/2.53.0/tree.c /usr/src
 /debug/git/2.53.0/levenshtein.c /usr/src/debug/git/2.53.0/tree.h /usr/src/debug/git/2.53.0/levenshtein.h /usr/src/debug/git/2.53.0/rebase.h /usr/src/debug/git/2.53.0/list-objects.h /usr/src/debug/git/2.53.0/pack-objects.h /usr/src/debug/git/2.53.0/environment.c /usr/src/debug/git/2.53.0/builtin/checkout.c /usr/src/debug/git/2.53.0/list-objects.c /usr/src/debug/git/2.53.0/pack-objects.c /usr/src/debug/git/2.53.0/environment.h /usr/src/debug/git/2.53.0/notes-merge.c /usr/src/debug/git/2.53.0/builtin/add.c /usr/src/debug/git/2.53.0/builtin/tag.c /usr/src/debug/git/2.53.0/builtin/merge-ours.c /usr/src/debug/git/2.53.0/notes-merge.h /usr/src/debug/git/2.53.0/mailinfo.c /usr/src/debug/git/2.53.0/object-file-convert.h /usr/src/debug/git/2.53.0/statinfo.c /usr/src/debug/git/2.53.0/hex.h /usr/src/debug/git/2.53.0/object-file-convert.c /usr/src/debug/git/2.53.0/mailinfo.h /usr/src/debug/git/2.53.0/hex.c /usr/src/debug/git/2.53.0/statinfo.h /usr/src/debug/git/2.53.0/builtin/verify-tag.c /usr/s
 rc/debug/git/2.53.0/repository.c /usr/src/debug/git/2.53.0/progress.h /usr/src/debug/git/2.53.0/credential.h /usr/src/debug/git/2.53.0/repository.h /usr/src/debug/git/2.53.0/credential.c /usr/src/debug/git/2.53.0/reftable/reftable-blocksource.h /usr/src/debug/git/2.53.0/progress.c /usr/src/debug/git/2.53.0/diff-merges.h /usr/src/debug/git/2.53.0/diff-merges.c /usr/src/debug/git/2.53.0/line-log.h /usr/src/debug/git/2.53.0/repack-geometry.c /usr/src/debug/git/2.53.0/shallow.h /usr/src/debug/git/2.53.0/hook-list.h /usr/src/debug/git/2.53.0/pack-bitmap-write.c /usr/src/debug/git/2.53.0/shallow.c /usr/src/debug/git/2.53.0/common-exit.c /usr/src/debug/git/2.53.0/builtin/commit-tree.c /usr/src/debug/git/2.53.0/builtin/for-each-ref.c /usr/src/debug/git/2.53.0/remote-curl.c /usr/src/debug/git/2.53.0/builtin/show-branch.c /usr/src/debug/git/2.53.0/delta-islands.h /usr/src/debug/git/2.53.0/builtin/help.c /usr/src/debug/git/2.53.0/delta-islands.c /usr/src/debug/git/2.53.0/reftable/reftable-writ
 er.h /usr/src/debug/git/2.53.0/builtin/remote-ext.c /usr/src/debug/git/2.53.0/builtin/pull.c /usr/src/debug/git/2.53.0/reftable/reftable-fsck.h /usr/src/debug/git/2.53.0/chunk-format.c /usr/src/debug/git/2.53.0/builtin/ls-remote.c /usr/src/debug/git/2.53.0/chunk-format.h /usr/src/debug/git/2.53.0/gpg-interface.c /usr/src/debug/git/2.53.0/gpg-interface.h /usr/src/debug/git/2.53.0/repack-midx.c /usr/src/debug/git/2.53.0/builtin/annotate.c /usr/src/debug/git/2.53.0/builtin/sparse-checkout.c /usr/src/debug/git/2.53.0/path-walk.h /usr/src/debug/git/2.53.0/tree-walk.h /usr/src/debug/git/2.53.0/chdir-notify.c /usr/src/debug/git/2.53.0/path-walk.c /usr/src/debug/git/2.53.0/tree-walk.c /usr/src/debug/git/2.53.0/chdir-notify.h /usr/src/debug/git/2.53.0/connected.h /usr/src/debug/git/2.53.0/connected.c /usr/src/debug/git/2.53.0/builtin/grep.c /usr/src/debug/git/2.53.0/midx-write.c /usr/src/debug/git/2.53.0/pack-write.c /usr/src/debug/git/2.53.0/match-trees.c /usr/src/debug/git/2.53.0/refspec.c
  /usr/src/debug/git/2.53.0/match-trees.h /usr/src/debug/git/2.53.0/refspec.h /usr/src/debug/git/2.53.0/copy.h /usr/src/debug/git/2.53.0/builtin/check-mailmap.c /usr/src/debug/git/2.53.0/help.c /usr/src/debug/git/2.53.0/builtin/checkout--worker.c /usr/src/debug/git/2.53.0/copy.c /usr/src/debug/git/2.53.0/builtin/credential-cache.c /usr/src/debug/git/2.53.0/help.h /usr/src/debug/git/2.53.0/ref-filter.h /usr/src/debug/git/2.53.0/archive.h /usr/src/debug/git/2.53.0/builtin/refs.c /usr/src/debug/git/2.53.0/fmt-merge-msg.c /usr/src/debug/git/2.53.0/oidtree.h /usr/src/debug/git/2.53.0/sparse-index.c /usr/src/debug/git/2.53.0/archive.c /usr/src/debug/git/2.53.0/oidtree.c /usr/src/debug/git/2.53.0/ref-filter.c /usr/src/debug/git/2.53.0/sparse-index.h /usr/src/debug/git/2.53.0/fmt-merge-msg.h /usr/src/debug/git/2.53.0/builtin/ls-files.c /usr/src/debug/git/2.53.0/string-list.c /usr/src/debug/git/2.53.0/reftable/system.h /usr/src/debug/git/2.53.0/http-fetch.c /usr/src/debug/git/2.53.0/config-li
 st.h /usr/src/debug/git/2.53.0/string-list.h /usr/src/debug/git/2.53.0/builtin/merge-base.c /usr/src/debug/git/2.53.0/builtin/var.c /usr/src/debug/git/2.53.0/reftable/system.c /usr/src/debug/git/2.53.0/simple-ipc.h /usr/src/debug/git/2.53.0/reflog-walk.h /usr/src/debug/git/2.53.0/sh-i18n--envsubst.c /usr/src/debug/git/2.53.0/builtin/diff-index.c /usr/src/debug/git/2.53.0/builtin/show-index.c /usr/src/debug/git/2.53.0/reflog-walk.c /usr/src/debug/git/2.53.0/builtin/update-ref.c /usr/src/debug/git/2.53.0/builtin/merge-recursive.c /usr/src/debug/git/2.53.0/mem-pool.h /usr/src/debug/git/2.53.0/protocol.h /usr/src/debug/git/2.53.0/mem-pool.c /usr/src/debug/git/2.53.0/protocol.c /usr/src/debug/git/2.53.0/builtin/update-index.c /usr/src/debug/git/2.53.0/revision.h /usr/src/debug/git/2.53.0/revision.c /usr/src/debug/git/2.53.0/pack-check.c /usr/src/debug/git/2.53.0/sane-ctype.h /usr/src/debug/git/2.53.0/midx.c /usr/src/debug/git/2.53.0/diff.h /usr/src/debug/git/2.53.0/diff.c /usr/src/debug/
 git/2.53.0/midx.h /usr/src/debug/git/2.53.0/builtin/backfill.c /usr/src/debug/git/2.53.0/archive-zip.c /usr/src/debug/git/2.53.0/builtin/diff-pairs.c /usr/src/debug/git/2.53.0/pkt-line.c /usr/src/debug/git/2.53.0/daemon.c /usr/src/debug/git/2.53.0/blob.c /usr/src/debug/git/2.53.0/ls-refs.c /usr/src/debug/git/2.53.0/pkt-line.h /usr/src/debug/git/2.53.0/ls-refs.h /usr/src/debug/git/2.53.0/blob.h /usr/src/debug/git/2.53.0/reftable/block.h /usr/src/debug/git/2.53.0/reftable/stack.h /usr/src/debug/git/2.53.0/reftable/table.h /usr/src/debug/git/2.53.0/reftable/error.c /usr/src/debug/git/2.53.0/reftable/stack.c /usr/src/debug/git/2.53.0/reftable/table.c /usr/src/debug/git/2.53.0/builtin/fmt-merge-msg.c /usr/src/debug/git/2.53.0/reftable/block.c /usr/src/debug/git/2.53.0/advice.h /usr/src/debug/git/2.53.0/fetch-pack.h /usr/src/debug/git/2.53.0/diff-lib.c /usr/src/debug/git/2.53.0/url.h /usr/src/debug/git/2.53.0/git-zlib.c /usr/src/debug/git/2.53.0/fetch-pack.c /usr/src/debug/git/2.53.0/url.
 c /usr/src/debug/git/2.53.0/git-zlib.h /usr/src/debug/git/2.53.0/run-command.c /usr/src/debug/git/2.53.0/urlmatch.h /usr/src/debug/git/2.53.0/urlmatch.c /usr/src/debug/git/2.53.0/run-command.h /usr/src/debug/git/2.53.0/sequencer.c /usr/src/debug/git/2.53.0/diffcore-break.c /usr/src/debug/git/2.53.0/diffcore-delta.c /usr/src/debug/git/2.53.0/diffcore-order.c /usr/src/debug/git/2.53.0/reftable/blocksource.c /usr/src/debug/git/2.53.0/sequencer.h /usr/src/debug/git/2.53.0/reftable/blocksource.h /usr/src/debug/git/2.53.0/builtin/worktree.c /usr/src/debug/git/2.53.0/odb.h /usr/src/debug/git/2.53.0/lockfile.h /usr/src/debug/git/2.53.0/packfile.h /usr/src/debug/git/2.53.0/tempfile.h /usr/src/debug/git/2.53.0/server-info.h /usr/src/debug/git/2.53.0/lockfile.c /usr/src/debug/git/2.53.0/packfile.c /usr/src/debug/git/2.53.0/odb.c /usr/src/debug/git/2.53.0/tempfile.c /usr/src/debug/git/2.53.0/server-info.c /usr/src/debug/git/2.53.0/pack-bitmap.h /usr/src/debug/git/2.53.0/builtin/fast-import.c /u
 sr/src/debug/git/2.53.0/http-push.c /usr/src/debug/git/2.53.0/pack-bitmap.c /usr/src/debug/git/2.53.0/reftable/reftable-table.h /usr/src/debug/git/2.53.0/iterator.h /usr/src/debug/git/2.53.0/cbtree.h /usr/src/debug/git/2.53.0/sigchain.c /usr/src/debug/git/2.53.0/pack-refs.c /usr/src/debug/git/2.53.0/common-init.c /usr/src/debug/git/2.53.0/common-init.h /usr/src/debug/git/2.53.0/pack-refs.h /usr/src/debug/git/2.53.0/sigchain.h /usr/src/debug/git/2.53.0/hash.c /usr/src/debug/git/2.53.0/range-diff.c /usr/src/debug/git/2.53.0/builtin/rev-parse.c /usr/src/debug/git/2.53.0/builtin/check-ignore.c /usr/src/debug/git/2.53.0/range-diff.h /usr/src/debug/git/2.53.0/hash.h /usr/src/debug/git/2.53.0/parallel-checkout.h /usr/src/debug/git/2.53.0/builtin/fast-export.c /usr/src/debug/git/2.53.0/fsmonitor-ll.h /usr/src/debug/git/2.53.0/exec-cmd.c /usr/src/debug/git/2.53.0/parallel-checkout.c /usr/src/debug/git/2.53.0/exec-cmd.h /usr/src/debug/git/2.53.0/bloom.h /usr/src/debug/git/2.53.0/transport-hel
 per.c /usr/src/debug/git/2.53.0/khash.h /usr/src/debug/git/2.53.0/kwset.h /usr/src/debug/git/2.53.0/color.h /usr/src/debug/git/2.53.0/attr.c /usr/src/debug/git/2.53.0/delta.h /usr/src/debug/git/2.53.0/entry.h /usr/src/debug/git/2.53.0/graph.h /usr/src/debug/git/2.53.0/ident.h /usr/src/debug/git/2.53.0/attr.h /usr/src/debug/git/2.53.0/builtin/merge.c /usr/src/debug/git/2.53.0/wildmatch.h /usr/src/debug/git/2.53.0/diffcore-rename.c /usr/src/debug/git/2.53.0/fetch-negotiator.c /usr/src/debug/git/2.53.0/diffcore-rotate.c /usr/src/debug/git/2.53.0/fetch-negotiator.h /usr/src/debug/git/2.53.0/add-patch.c /usr/src/debug/git/2.53.0/wildmatch.c /usr/src/debug/git/2.53.0/entry.c /usr/src/debug/git/2.53.0/graph.c /usr/src/debug/git/2.53.0/ident.c /usr/src/debug/git/2.53.0/usage.c /usr/src/debug/git/2.53.0/kwset.c /usr/src/debug/git/2.53.0/loose.c /usr/src/debug/git/2.53.0/merge.c /usr/src/debug/git/2.53.0/notes.c /usr/src/debug/git/2.53.0/pager.c /usr/src/debug/git/2.53.0/notes-cache.c /usr/sr
 c/debug/git/2.53.0/add-interactive.h /usr/src/debug/git/2.53.0/builtin/count-objects.c /usr/src/debug/git/2.53.0/notes-cache.h /usr/src/debug/git/2.53.0/builtin/archive.c /usr/src/debug/git/2.53.0/builtin/ls-tree.c /usr/src/debug/git/2.53.0/add-interactive.c /usr/src/debug/git/2.53.0/builtin/replace.c /usr/src/debug/git/2.53.0/diffcore-pickaxe.c /usr/src/debug/git/2.53.0/http-walker.c /usr/src/debug/git/2.53.0/reftable/reftable-block.h /usr/src/debug/git/2.53.0/reftable/reftable-stack.h /usr/src/debug/git/2.53.0/fsmonitor-ipc.c /usr/src/debug/git/2.53.0/path.h /usr/src/debug/git/2.53.0/advice.c /usr/src/debug/git/2.53.0/builtin/commit-graph.c /usr/src/debug/git/2.53.0/fsmonitor-ipc.h /usr/src/debug/git/2.53.0/git-compat-util.h /usr/src/debug/git/2.53.0/path.c /usr/src/debug/git/2.53.0/builtin/unpack-file.c /usr/src/debug/git/2.53.0/builtin/upload-archive.c /usr/src/debug/git/2.53.0/tar.h /usr/src/debug/git/2.53.0/builtin/shortlog.c /usr/src/debug/git/2.53.0/parse-options-cb.c /usr/s
 rc/debug/git/2.53.0/protocol-caps.c /usr/src/debug/git/2.53.0/split-index.h /usr/src/debug/git/2.53.0/protocol-caps.h /usr/src/debug/git/2.53.0/split-index.c /usr/src/debug/git/2.53.0/list.h /usr/src/debug/git/2.53.0/reftable/reftable-basics.h /usr/src/debug/git/2.53.0/merge-ort.h /usr/src/debug/git/2.53.0/reftable/pq.c /usr/src/debug/git/2.53.0/transport.h /usr/src/debug/git/2.53.0/wt-status.h /usr/src/debug/git/2.53.0/builtin/receive-pack.c /usr/src/debug/git/2.53.0/repack-filtered.c /usr/src/debug/git/2.53.0/reftable/pq.h /usr/src/debug/git/2.53.0/merge-ort.c /usr/src/debug/git/2.53.0/transport.c /usr/src/debug/git/2.53.0/wt-status.c /usr/src/debug/git/2.53.0/builtin/fetch-pack.c /usr/src/debug/git/2.53.0/builtin/index-pack.c /usr/src/debug/git/2.53.0/common-main.c /usr/src/debug/git/2.53.0/builtin/verify-commit.c /usr/src/debug/git/2.53.0/cbtree.c /usr/src/debug/git/2.53.0/column.c /usr/src/debug/git/2.53.0/commit.c /usr/src/debug/git/2.53.0/config.c /usr/src/debug/git/2.53.0/re
 ftable/writer.h /usr/src/debug/git/2.53.0/reftable/writer.c /usr/src/debug/git/2.53.0/checkout.h /usr/src/debug/git/2.53.0/checkout.c /usr/src/debug/git/2.53.0/xdiff-interface.h /usr/src/debug/git/2.53.0/hash-lookup.h /usr/src/debug/git/2.53.0/pathspec.h /usr/src/debug/git/2.53.0/refs.h /usr/src/debug/git/2.53.0/xdiff-interface.c /usr/src/debug/git/2.53.0/pathspec.c /usr/src/debug/git/2.53.0/hash-lookup.c /usr/src/debug/git/2.53.0/refs.c /usr/src/debug/git/2.53.0/log-tree.h /usr/src/debug/git/2.53.0/worktree.h /usr/src/debug/git/2.53.0/diffcore.h /usr/src/debug/git/2.53.0/log-tree.c /usr/src/debug/git/2.53.0/worktree.c /usr/src/debug/git/2.53.0/builtin/merge-tree.c /usr/src/debug/git/2.53.0/builtin/write-tree.c /usr/src/debug/git/2.53.0/decorate.c /usr/src/debug/git/2.53.0/reset.h /usr/src/debug/git/2.53.0/builtin/check-attr.c /usr/src/debug/git/2.53.0/decorate.h /usr/src/debug/git/2.53.0/commit-reach.h /usr/src/debug/git/2.53.0/commit-reach.c /usr/src/debug/git/2.53.0/utf8.h /usr/s
 rc/debug/git/2.53.0/utf8.c /usr/src/debug/git/2.53.0/builtin/rm.c /usr/src/debug/git/2.53.0/userdiff.c /usr/src/debug/git/2.53.0/command-list.h /usr/src/debug/git/2.53.0/builtin/remote-fd.c /usr/src/debug/git/2.53.0/userdiff.h /usr/src/debug/git/2.53.0/hex-ll.h /usr/src/debug/git/2.53.0/merge.h /usr/src/debug/git/2.53.0/list-objects-filter.h /usr/src/debug/git/2.53.0/list-objects-filter.c /usr/src/debug/git/2.53.0/patch-delta.c /usr/src/debug/git/2.53.0/linear-assignment.h /usr/src/debug/git/2.53.0/connect.h /usr/src/debug/git/2.53.0/convert.h /usr/src/debug/git/2.53.0/gettext.h /usr/src/debug/git/2.53.0/linear-assignment.c /usr/src/debug/git/2.53.0/connect.c /usr/src/debug/git/2.53.0/builtin/hook.c /usr/src/debug/git/2.53.0/convert.c /usr/src/debug/git/2.53.0/gettext.c /usr/src/debug/git/2.53.0/base85.h /usr/src/debug/git/2.53.0/bisect.h /usr/src/debug/git/2.53.0/branch.h /usr/src/debug/git/2.53.0/bundle.h /usr/src/debug/git/2.53.0/version.c /usr/src/debug/git/2.53.0/builtin.h /usr
 /src/debug/git/2.53.0/version.h /usr/src/debug/git/2.53.0/submodule.c /usr/src/debug/git/2.53.0/hashmap.h /usr/src/debug/git/2.53.0/mailmap.h /usr/src/debug/git/2.53.0/reset.c /usr/src/debug/git/2.53.0/list-objects-filter-options.h /usr/src/debug/git/2.53.0/hashmap.c /usr/src/debug/git/2.53.0/mailmap.c /usr/src/debug/git/2.53.0/submodule.h /usr/src/debug/git/2.53.0/list-objects-filter-options.c /usr/src/debug/git/2.53.0/http.c /usr/src/debug/git/2.53.0/builtin/gc.c /usr/src/debug/git/2.53.0/fsmonitor.c /usr/src/debug/git/2.53.0/builtin/fsmonitor--daemon.c /usr/src/debug/git/2.53.0/http.h /usr/src/debug/git/2.53.0/fsmonitor.h /usr/src/debug/git/2.53.0/abspath.c /usr/src/debug/git/2.53.0/tree-diff.c /usr/src/debug/git/2.53.0/abspath.h /usr/src/debug/git/2.53.0/builtin/stripspace.c /usr/src/debug/git/2.53.0/fsmonitor-settings.c /usr/src/debug/git/2.53.0/sideband.h /usr/src/debug/git/2.53.0/builtin/credential.c /usr/src/debug/git/2.53.0/fsmonitor-settings.h /usr/src/debug/git/2.53.0/sid
 eband.c /usr/src/debug/git/2.53.0/serve.h /usr/src/debug/git/2.53.0/setup.h /usr/src/debug/git/2.53.0/prune-packed.c /usr/src/debug/git/2.53.0/prune-packed.h /usr/src/debug/git/2.53.0/builtin/symbolic-ref.c /usr/src/debug/git/2.53.0/reftable/merged.h /usr/src/debug/git/2.53.0/reftable/record.h /usr/src/debug/git/2.53.0/builtin/hash-object.c /usr/src/debug/git/2.53.0/builtin/last-modified.c /usr/src/debug/git/2.53.0/notes.h /usr/src/debug/git/2.53.0/reftable/merged.c /usr/src/debug/git/2.53.0/reftable/record.c /usr/src/debug/git/2.53.0/builtin/mailsplit.c /usr/src/debug/git/2.53.0/name-hash.h /usr/src/debug/git/2.53.0/repo-settings.c /usr/src/debug/git/2.53.0/name-hash.c /usr/src/debug/git/2.53.0/builtin/am.c /usr/src/debug/git/2.53.0/repo-settings.h /usr/src/debug/git/2.53.0/builtin/check-ref-format.c /usr/src/debug/git/2.53.0/send-pack.h /usr/src/debug/git/2.53.0/repack-promisor.c /usr/src/debug/git/2.53.0/http-backend.c /usr/src/debug/git/2.53.0/send-pack.c /usr/src/debug/git/2.53
 .0/builtin/describe.c /usr/src/debug/git/2.53.0/serve.c /usr/src/debug/git/2.53.0/setup.c /usr/src/debug/git/2.53.0/shell.c /usr/src/debug/git/2.53.0/trailer.h /usr/src/debug/git/2.53.0/preload-index.c /usr/src/debug/git/2.53.0/wrapper.h /usr/src/debug/git/2.53.0/preload-index.h /usr/src/debug/git/2.53.0/trailer.c /usr/src/debug/git/2.53.0/wrapper.c /usr/src/debug/git/2.53.0/builtin/unpack-objects.c /usr/src/debug/git/2.53.0/builtin/send-pack.c /usr/src/debug/git/2.53.0/oid-array.c /usr/src/debug/git/2.53.0/read-cache.c /usr/src/debug/git/2.53.0/fsck.c /usr/src/debug/git/2.53.0/oid-array.h /usr/src/debug/git/2.53.0/read-cache.h /usr/src/debug/git/2.53.0/fsck.h /usr/src/debug/git/2.53.0/trace2.h /usr/src/debug/git/2.53.0/column.h /usr/src/debug/git/2.53.0/commit.h /usr/src/debug/git/2.53.0/config.h /usr/src/debug/git/2.53.0/hook.h /usr/src/debug/git/2.53.0/object.h /usr/src/debug/git/2.53.0/oidmap.h /usr/src/debug/git/2.53.0/oidset.h /usr/src/debug/git/2.53.0/pretty.h /usr/src/debug/
 git/2.53.0/prompt.h /usr/src/debug/git/2.53.0/hook.c /usr/src/debug/git/2.53.0/base85.c /usr/src/debug/git/2.53.0/bisect.c /usr/src/debug/git/2.53.0/builtin/pack-refs.c /usr/src/debug/git/2.53.0/builtin/remote.c /usr/src/debug/git/2.53.0/builtin/repack.c /usr/src/debug/git/2.53.0/builtin/replay.c /usr/src/debug/git/2.53.0/builtin/rerere.c /usr/src/debug/git/2.53.0/trace.h /usr/src/debug/git/2.53.0/unix-socket.c /usr/src/debug/git/2.53.0/unix-socket.h /usr/src/debug/git/2.53.0/reftable/reftable-record.h /usr/src/debug/git/2.53.0/object-name.c /usr/src/debug/git/2.53.0/builtin/range-diff.c /usr/src/debug/git/2.53.0/builtin/pack-objects.c /usr/src/debug/git/2.53.0/object-name.h /usr/src/debug/git/2.53.0/branch.c /usr/src/debug/git/2.53.0/for-each-ref.h /usr/src/debug/git/2.53.0/bundle.c /usr/src/debug/git/2.53.0/object.c /usr/src/debug/git/2.53.0/oidmap.c /usr/src/debug/git/2.53.0/oidset.c /usr/src/debug/git/2.53.0/pretty.c /usr/src/debug/git/2.53.0/builtin/diagnose.c /usr/src/debug/gi
 t/2.53.0/prompt.c /usr/src/debug/git/2.53.0/rebase.c /usr/src/debug/git/2.53.0/builtin/mktag.c /usr/src/debug/git/2.53.0/builtin/notes.c /usr/src/debug/git/2.53.0/builtin/prune.c /usr/src/debug/git/2.53.0/builtin/reset.c /usr/src/debug/git/2.53.0/builtin/stash.c /usr/src/debug/git/2.53.0/builtin/apply.c /usr/src/debug/git/2.53.0/builtin/blame.c /usr/src/debug/git/2.53.0/builtin/clean.c /usr/src/debug/git/2.53.0/builtin/clone.c /usr/src/debug/git/2.53.0/builtin/fetch.c /usr/src/debug/git/2.53.0/merge-ort-wrappers.c /usr/src/debug/git/2.53.0/dir.h /usr/src/debug/git/2.53.0/builtin/init-db.c /usr/src/debug/git/2.53.0/merge-ort-wrappers.h /usr/src/debug/git/2.53.0/dir.c /usr/src/debug/git/2.53.0/builtin/get-tar-commit-id.c /usr/src/debug/git/2.53.0/builtin/name-rev.c /usr/src/debug/git/2.53.0/pseudo-merge.c /usr/src/debug/git/2.53.0/unpack-trees.c /usr/src/debug/git/2.53.0/pseudo-merge.h /usr/src/debug/git/2.53.0/repack-cruft.c /usr/src/debug/git/2.53.0/unpack-trees.h /usr/src/debug/git
 /2.53.0/builtin/interpret-trailers.c /usr/src/debug/git/2.53.0/varint.h /usr/src/debug/git/2.53.0/strbuf.h /usr/src/debug/git/2.53.0/strmap.h /usr/src/debug/git/2.53.0/strvec.h /usr/src/debug/git/2.53.0/walker.h /usr/src/debug/git/2.53.0/reflog.h /usr/src/debug/git/2.53.0/remote.h /usr/src/debug/git/2.53.0/repack.h /usr/src/debug/git/2.53.0/rerere.h /usr/src/debug/git/2.53.0/shortlog.h /usr/src/debug/git/2.53.0/merge-ll.h /usr/src/debug/git/2.53.0/remote.c /usr/src/debug/git/2.53.0/repack.c /usr/src/debug/git/2.53.0/rerere.c /usr/src/debug/git/2.53.0/scalar.c /usr/src/debug/git/2.53.0/strbuf.c /usr/src/debug/git/2.53.0/strmap.c /usr/src/debug/git/2.53.0/strvec.c /usr/src/debug/git/2.53.0/walker.c /usr/src/debug/git/2.53.0/reflog.c /usr/src/debug/git/2.53.0/varint.c /usr/src/debug/git/2.53.0/line-log.c /usr/src/debug/git/2.53.0/merge-ll.c /usr/src/debug/git/2.53.0/trace.c /usr/src/debug/git/2.53.0/trace2.c /usr/src/debug/git/2.53.0/sub-process.h /usr/src/debug/git/2.53.0/builtin/merg
 e-file.c /usr/src/debug/git/2.53.0/sub-process.c /usr/src/debug/git/2.53.0/builtin/for-each-repo.c", added "/usr/src/debug/git/2.54.0/bundle-uri.h /usr/src/debug/git/2.54.0/builtin/diff.c /usr/src/debug/git/2.54.0/bundle-uri.c /usr/src/debug/git/2.54.0/merge-blobs.c /usr/src/debug/git/2.54.0/dir-iterator.h /usr/src/debug/git/2.54.0/builtin/cat-file.c /usr/src/debug/git/2.54.0/dir-iterator.c /usr/src/debug/git/2.54.0/merge-blobs.h /usr/src/debug/git/2.54.0/cache-tree.h /usr/src/debug/git/2.54.0/git.c /usr/src/debug/git/2.54.0/builtin/update-server-info.c /usr/src/debug/git/2.54.0/cache-tree.c /usr/src/debug/git/2.54.0/builtin/diff-tree.c /usr/src/debug/git/2.54.0/builtin/read-tree.c /usr/src/debug/git/2.54.0/builtin/show-ref.c /usr/src/debug/git/2.54.0/builtin/mailinfo.c /usr/src/debug/git/2.54.0/prio-queue.h /usr/src/debug/git/2.54.0/diff-no-index.c /usr/src/debug/git/2.54.0/prio-queue.c /usr/src/debug/git/2.54.0/submodule-config.c /usr/src/debug/git/2.54.0/builtin/mv.c /usr/src/deb
 ug/git/2.54.0/submodule-config.h /usr/src/debug/git/2.54.0/replace-object.c /usr/src/debug/git/2.54.0/reftable/reftable-iterator.h /usr/src/debug/git/2.54.0/replace-object.h /usr/src/debug/git/2.54.0/builtin/log.c /usr/src/debug/git/2.54.0/transport-internal.h /usr/src/debug/git/2.54.0/grep.c /usr/src/debug/git/2.54.0/grep.h /usr/src/debug/git/2.54.0/pack.h /usr/src/debug/git/2.54.0/builtin/merge-index.c /usr/src/debug/git/2.54.0/commit-graph.c /usr/src/debug/git/2.54.0/commit-graph.h /usr/src/debug/git/2.54.0/diagnose.h /usr/src/debug/git/2.54.0/diagnose.c /usr/src/debug/git/2.54.0/builtin/pack-redundant.c /usr/src/debug/git/2.54.0/notes-utils.h /usr/src/debug/git/2.54.0/builtin/multi-pack-index.c /usr/src/debug/git/2.54.0/notes-utils.c /usr/src/debug/git/2.54.0/hex-ll.c /usr/src/debug/git/2.54.0/builtin/bugreport.c /usr/src/debug/git/2.54.0/tmp-objdir.c /usr/src/debug/git/2.54.0/write-or-die.c /usr/src/debug/git/2.54.0/parse.c /usr/src/debug/git/2.54.0/write-or-die.h /usr/src/debu
 g/git/2.54.0/reftable/reftable-error.h /usr/src/debug/git/2.54.0/tmp-objdir.h /usr/src/debug/git/2.54.0/pack-revindex.c /usr/src/debug/git/2.54.0/pack-revindex.h /usr/src/debug/git/2.54.0/csum-file.h /usr/src/debug/git/2.54.0/read-cache-ll.h /usr/src/debug/git/2.54.0/csum-file.c /usr/src/debug/git/2.54.0/editor.h /usr/src/debug/git/2.54.0/builtin/push.c /usr/src/debug/git/2.54.0/builtin/diff-files.c /usr/src/debug/git/2.54.0/sha1dc_git.h /usr/src/debug/git/2.54.0/thread-utils.h /usr/src/debug/git/2.54.0/builtin/credential-store.c /usr/src/debug/git/2.54.0/thread-utils.c /usr/src/debug/git/2.54.0/sha1dc_git.c /usr/src/debug/git/2.54.0/date.c /usr/src/debug/git/2.54.0/archive-tar.c /usr/src/debug/git/2.54.0/builtin/upload-pack.c /usr/src/debug/git/2.54.0/builtin/verify-pack.c /usr/src/debug/git/2.54.0/date.h /usr/src/debug/git/2.54.0/reftable/reftable-merged.h /usr/src/debug/git/2.54.0/builtin/fsck.c /usr/src/debug/git/2.54.0/object-file.h /usr/src/debug/git/2.54.0/json-writer.h /usr/
 src/debug/git/2.54.0/json-writer.c /usr/src/debug/git/2.54.0/builtin/patch-id.c /usr/src/debug/git/2.54.0/object-file.c /usr/src/debug/git/2.54.0/reftable/iter.h /usr/src/debug/git/2.54.0/reftable/tree.h /usr/src/debug/git/2.54.0/line-range.c /usr/src/debug/git/2.54.0/builtin/checkout-index.c /usr/src/debug/git/2.54.0/reftable/fsck.c /usr/src/debug/git/2.54.0/reftable/iter.c /usr/src/debug/git/2.54.0/reftable/tree.c /usr/src/debug/git/2.54.0/ws.c /usr/src/debug/git/2.54.0/parse-options.c /usr/src/debug/git/2.54.0/parse-options.h /usr/src/debug/git/2.54.0/ws.h /usr/src/debug/git/2.54.0/builtin/revert.c /usr/src/debug/git/2.54.0/builtin/bisect.c /usr/src/debug/git/2.54.0/builtin/branch.c /usr/src/debug/git/2.54.0/builtin/bundle.c /usr/src/debug/git/2.54.0/builtin/column.c /usr/src/debug/git/2.54.0/builtin/commit.c /usr/src/debug/git/2.54.0/builtin/config.c /usr/src/debug/git/2.54.0/builtin/mktree.c /usr/src/debug/git/2.54.0/builtin/rebase.c /usr/src/debug/git/2.54.0/builtin/reflog.c /
 usr/src/debug/git/2.54.0/pack-mtimes.c /usr/src/debug/git/2.54.0/loose.h /usr/src/debug/git/2.54.0/pack-mtimes.h /usr/src/debug/git/2.54.0/imap-send.c /usr/src/debug/git/2.54.0/odb/streaming.c /usr/src/debug/git/2.54.0/builtin/prune-packed.c /usr/src/debug/git/2.54.0/odb/streaming.h /usr/src/debug/git/2.54.0/builtin/credential-cache--daemon.c /usr/src/debug/git/2.54.0/resolve-undo.h /usr/src/debug/git/2.54.0/resolve-undo.c /usr/src/debug/git/2.54.0/patch-ids.c /usr/src/debug/git/2.54.0/promisor-remote.c /usr/src/debug/git/2.54.0/quote.c /usr/src/debug/git/2.54.0/promisor-remote.h /usr/src/debug/git/2.54.0/patch-ids.h /usr/src/debug/git/2.54.0/diff-delta.c /usr/src/debug/git/2.54.0/builtin/repo.c /usr/src/debug/git/2.54.0/symlinks.c /usr/src/debug/git/2.54.0/symlinks.h /usr/src/debug/git/2.54.0/combine-diff.c /usr/src/debug/git/2.54.0/rebase-interactive.c /usr/src/debug/git/2.54.0/builtin/difftool.c /usr/src/debug/git/2.54.0/tag.c /usr/src/debug/git/2.54.0/rebase-interactive.h /usr/s
 rc/debug/git/2.54.0/builtin/submodule--helper.c /usr/src/debug/git/2.54.0/tag.h /usr/src/debug/git/2.54.0/reachable.h /usr/src/debug/git/2.54.0/reachable.c /usr/src/debug/git/2.54.0/unicode-width.h /usr/src/debug/git/2.54.0/upload-pack.h /usr/src/debug/git/2.54.0/upload-pack.c /usr/src/debug/git/2.54.0/versioncmp.h /usr/src/debug/git/2.54.0/pager.h /usr/src/debug/git/2.54.0/parse.h /usr/src/debug/git/2.54.0/quote.h /usr/src/debug/git/2.54.0/alias.h /usr/src/debug/git/2.54.0/alloc.h /usr/src/debug/git/2.54.0/apply.h /usr/src/debug/git/2.54.0/blame.h /usr/src/debug/git/2.54.0/alias.c /usr/src/debug/git/2.54.0/alloc.c /usr/src/debug/git/2.54.0/apply.c /usr/src/debug/git/2.54.0/blame.c /usr/src/debug/git/2.54.0/reftable/basics.h /usr/src/debug/git/2.54.0/bloom.c /usr/src/debug/git/2.54.0/color.c /usr/src/debug/git/2.54.0/ctype.c /usr/src/debug/git/2.54.0/versioncmp.c /usr/src/debug/git/2.54.0/editor.c /usr/src/debug/git/2.54.0/reftable/basics.c /usr/src/debug/git/2.54.0/stable-qsort.c /
 usr/src/debug/git/2.54.0/builtin/rev-list.c /usr/src/debug/git/2.54.0/tree.c /usr/src/debug/git/2.54.0/levenshtein.c /usr/src/debug/git/2.54.0/tree.h /usr/src/debug/git/2.54.0/levenshtein.h /usr/src/debug/git/2.54.0/reflog.h /usr/src/debug/git/2.54.0/list-objects.h /usr/src/debug/git/2.54.0/pack-objects.h /usr/src/debug/git/2.54.0/environment.c /usr/src/debug/git/2.54.0/builtin/checkout.c /usr/src/debug/git/2.54.0/list-objects.c /usr/src/debug/git/2.54.0/pack-objects.c /usr/src/debug/git/2.54.0/environment.h /usr/src/debug/git/2.54.0/notes-merge.c /usr/src/debug/git/2.54.0/builtin/add.c /usr/src/debug/git/2.54.0/builtin/tag.c /usr/src/debug/git/2.54.0/builtin/merge-ours.c /usr/src/debug/git/2.54.0/notes-merge.h /usr/src/debug/git/2.54.0/mailinfo.c /usr/src/debug/git/2.54.0/object-file-convert.h /usr/src/debug/git/2.54.0/statinfo.c /usr/src/debug/git/2.54.0/hex.h /usr/src/debug/git/2.54.0/object-file-convert.c /usr/src/debug/git/2.54.0/mailinfo.h /usr/src/debug/git/2.54.0/hex.c /usr/
 src/debug/git/2.54.0/statinfo.h /usr/src/debug/git/2.54.0/builtin/verify-tag.c /usr/src/debug/git/2.54.0/repository.c /usr/src/debug/git/2.54.0/progress.h /usr/src/debug/git/2.54.0/credential.h /usr/src/debug/git/2.54.0/repository.h /usr/src/debug/git/2.54.0/credential.c /usr/src/debug/git/2.54.0/reftable/reftable-blocksource.h /usr/src/debug/git/2.54.0/progress.c /usr/src/debug/git/2.54.0/diff-merges.h /usr/src/debug/git/2.54.0/diff-merges.c /usr/src/debug/git/2.54.0/line-log.h /usr/src/debug/git/2.54.0/repack-geometry.c /usr/src/debug/git/2.54.0/shallow.h /usr/src/debug/git/2.54.0/hook-list.h /usr/src/debug/git/2.54.0/pack-bitmap-write.c /usr/src/debug/git/2.54.0/shallow.c /usr/src/debug/git/2.54.0/common-exit.c /usr/src/debug/git/2.54.0/builtin/commit-tree.c /usr/src/debug/git/2.54.0/builtin/for-each-ref.c /usr/src/debug/git/2.54.0/remote-curl.c /usr/src/debug/git/2.54.0/builtin/show-branch.c /usr/src/debug/git/2.54.0/delta-islands.h /usr/src/debug/git/2.54.0/builtin/help.c /usr/
 src/debug/git/2.54.0/delta-islands.c /usr/src/debug/git/2.54.0/reftable/reftable-writer.h /usr/src/debug/git/2.54.0/builtin/remote-ext.c /usr/src/debug/git/2.54.0/builtin/pull.c /usr/src/debug/git/2.54.0/reftable/reftable-fsck.h /usr/src/debug/git/2.54.0/chunk-format.c /usr/src/debug/git/2.54.0/builtin/ls-remote.c /usr/src/debug/git/2.54.0/chunk-format.h /usr/src/debug/git/2.54.0/gpg-interface.c /usr/src/debug/git/2.54.0/gpg-interface.h /usr/src/debug/git/2.54.0/repack-midx.c /usr/src/debug/git/2.54.0/builtin/annotate.c /usr/src/debug/git/2.54.0/builtin/sparse-checkout.c /usr/src/debug/git/2.54.0/path-walk.h /usr/src/debug/git/2.54.0/tree-walk.h /usr/src/debug/git/2.54.0/chdir-notify.c /usr/src/debug/git/2.54.0/path-walk.c /usr/src/debug/git/2.54.0/tree-walk.c /usr/src/debug/git/2.54.0/chdir-notify.h /usr/src/debug/git/2.54.0/connected.h /usr/src/debug/git/2.54.0/connected.c /usr/src/debug/git/2.54.0/builtin/grep.c /usr/src/debug/git/2.54.0/midx-write.c /usr/src/debug/git/2.54.0/pac
 k-write.c /usr/src/debug/git/2.54.0/match-trees.c /usr/src/debug/git/2.54.0/refspec.c /usr/src/debug/git/2.54.0/match-trees.h /usr/src/debug/git/2.54.0/refspec.h /usr/src/debug/git/2.54.0/copy.h /usr/src/debug/git/2.54.0/builtin/check-mailmap.c /usr/src/debug/git/2.54.0/rebase.c /usr/src/debug/git/2.54.0/help.c /usr/src/debug/git/2.54.0/builtin/checkout--worker.c /usr/src/debug/git/2.54.0/copy.c /usr/src/debug/git/2.54.0/builtin/credential-cache.c /usr/src/debug/git/2.54.0/help.h /usr/src/debug/git/2.54.0/ref-filter.h /usr/src/debug/git/2.54.0/archive.h /usr/src/debug/git/2.54.0/builtin/refs.c /usr/src/debug/git/2.54.0/fmt-merge-msg.c /usr/src/debug/git/2.54.0/oidtree.h /usr/src/debug/git/2.54.0/sparse-index.c /usr/src/debug/git/2.54.0/archive.c /usr/src/debug/git/2.54.0/oidtree.c /usr/src/debug/git/2.54.0/ref-filter.c /usr/src/debug/git/2.54.0/sparse-index.h /usr/src/debug/git/2.54.0/fmt-merge-msg.h /usr/src/debug/git/2.54.0/builtin/ls-files.c /usr/src/debug/git/2.54.0/string-list.
 c /usr/src/debug/git/2.54.0/reftable/system.h /usr/src/debug/git/2.54.0/http-fetch.c /usr/src/debug/git/2.54.0/config-list.h /usr/src/debug/git/2.54.0/string-list.h /usr/src/debug/git/2.54.0/builtin/merge-base.c /usr/src/debug/git/2.54.0/builtin/var.c /usr/src/debug/git/2.54.0/reftable/system.c /usr/src/debug/git/2.54.0/simple-ipc.h /usr/src/debug/git/2.54.0/reflog-walk.h /usr/src/debug/git/2.54.0/sh-i18n--envsubst.c /usr/src/debug/git/2.54.0/builtin/diff-index.c /usr/src/debug/git/2.54.0/builtin/show-index.c /usr/src/debug/git/2.54.0/reflog-walk.c /usr/src/debug/git/2.54.0/builtin/update-ref.c /usr/src/debug/git/2.54.0/builtin/merge-recursive.c /usr/src/debug/git/2.54.0/mem-pool.h /usr/src/debug/git/2.54.0/protocol.h /usr/src/debug/git/2.54.0/mem-pool.c /usr/src/debug/git/2.54.0/protocol.c /usr/src/debug/git/2.54.0/builtin/update-index.c /usr/src/debug/git/2.54.0/revision.h /usr/src/debug/git/2.54.0/revision.c /usr/src/debug/git/2.54.0/pack-check.c /usr/src/debug/git/2.54.0/sane-ct
 ype.h /usr/src/debug/git/2.54.0/diff.h /usr/src/debug/git/2.54.0/midx.c /usr/src/debug/git/2.54.0/diff.c /usr/src/debug/git/2.54.0/midx.h /usr/src/debug/git/2.54.0/builtin/backfill.c /usr/src/debug/git/2.54.0/archive-zip.c /usr/src/debug/git/2.54.0/builtin/diff-pairs.c /usr/src/debug/git/2.54.0/pkt-line.c /usr/src/debug/git/2.54.0/daemon.c /usr/src/debug/git/2.54.0/blob.c /usr/src/debug/git/2.54.0/ls-refs.c /usr/src/debug/git/2.54.0/pkt-line.h /usr/src/debug/git/2.54.0/ls-refs.h /usr/src/debug/git/2.54.0/blob.h /usr/src/debug/git/2.54.0/reftable/block.h /usr/src/debug/git/2.54.0/reftable/stack.h /usr/src/debug/git/2.54.0/reftable/table.h /usr/src/debug/git/2.54.0/reftable/error.c /usr/src/debug/git/2.54.0/reftable/stack.c /usr/src/debug/git/2.54.0/reftable/table.c /usr/src/debug/git/2.54.0/builtin/fmt-merge-msg.c /usr/src/debug/git/2.54.0/reftable/block.c /usr/src/debug/git/2.54.0/advice.h /usr/src/debug/git/2.54.0/fetch-pack.h /usr/src/debug/git/2.54.0/diff-lib.c /usr/src/debug/git
 /2.54.0/url.h /usr/src/debug/git/2.54.0/git-zlib.c /usr/src/debug/git/2.54.0/fetch-pack.c /usr/src/debug/git/2.54.0/url.c /usr/src/debug/git/2.54.0/git-zlib.h /usr/src/debug/git/2.54.0/run-command.c /usr/src/debug/git/2.54.0/urlmatch.h /usr/src/debug/git/2.54.0/urlmatch.c /usr/src/debug/git/2.54.0/run-command.h /usr/src/debug/git/2.54.0/sequencer.c /usr/src/debug/git/2.54.0/diffcore-break.c /usr/src/debug/git/2.54.0/diffcore-delta.c /usr/src/debug/git/2.54.0/diffcore-order.c /usr/src/debug/git/2.54.0/reftable/blocksource.c /usr/src/debug/git/2.54.0/sequencer.h /usr/src/debug/git/2.54.0/reftable/blocksource.h /usr/src/debug/git/2.54.0/builtin/worktree.c /usr/src/debug/git/2.54.0/odb.h /usr/src/debug/git/2.54.0/lockfile.h /usr/src/debug/git/2.54.0/packfile.h /usr/src/debug/git/2.54.0/tempfile.h /usr/src/debug/git/2.54.0/server-info.h /usr/src/debug/git/2.54.0/lockfile.c /usr/src/debug/git/2.54.0/packfile.c /usr/src/debug/git/2.54.0/odb.c /usr/src/debug/git/2.54.0/tempfile.c /usr/src/d
 ebug/git/2.54.0/server-info.c /usr/src/debug/git/2.54.0/pack-bitmap.h /usr/src/debug/git/2.54.0/builtin/fast-import.c /usr/src/debug/git/2.54.0/http-push.c /usr/src/debug/git/2.54.0/pack-bitmap.c /usr/src/debug/git/2.54.0/reftable/reftable-table.h /usr/src/debug/git/2.54.0/iterator.h /usr/src/debug/git/2.54.0/cbtree.h /usr/src/debug/git/2.54.0/sigchain.c /usr/src/debug/git/2.54.0/column.h /usr/src/debug/git/2.54.0/pack-refs.c /usr/src/debug/git/2.54.0/common-init.c /usr/src/debug/git/2.54.0/common-init.h /usr/src/debug/git/2.54.0/pack-refs.h /usr/src/debug/git/2.54.0/sigchain.h /usr/src/debug/git/2.54.0/hash.c /usr/src/debug/git/2.54.0/range-diff.c /usr/src/debug/git/2.54.0/builtin/rev-parse.c /usr/src/debug/git/2.54.0/builtin/check-ignore.c /usr/src/debug/git/2.54.0/range-diff.h /usr/src/debug/git/2.54.0/hash.h /usr/src/debug/git/2.54.0/parallel-checkout.h /usr/src/debug/git/2.54.0/builtin/fast-export.c /usr/src/debug/git/2.54.0/fsmonitor-ll.h /usr/src/debug/git/2.54.0/exec-cmd.c /
 usr/src/debug/git/2.54.0/parallel-checkout.c /usr/src/debug/git/2.54.0/exec-cmd.h /usr/src/debug/git/2.54.0/bloom.h /usr/src/debug/git/2.54.0/transport-helper.c /usr/src/debug/git/2.54.0/khash.h /usr/src/debug/git/2.54.0/kwset.h /usr/src/debug/git/2.54.0/color.h /usr/src/debug/git/2.54.0/attr.c /usr/src/debug/git/2.54.0/delta.h /usr/src/debug/git/2.54.0/entry.h /usr/src/debug/git/2.54.0/graph.h /usr/src/debug/git/2.54.0/ident.h /usr/src/debug/git/2.54.0/attr.h /usr/src/debug/git/2.54.0/builtin/merge.c /usr/src/debug/git/2.54.0/add-patch.h /usr/src/debug/git/2.54.0/diffcore-rename.c /usr/src/debug/git/2.54.0/fetch-negotiator.c /usr/src/debug/git/2.54.0/diffcore-rotate.c /usr/src/debug/git/2.54.0/wildmatch.h /usr/src/debug/git/2.54.0/fetch-negotiator.h /usr/src/debug/git/2.54.0/add-patch.c /usr/src/debug/git/2.54.0/wildmatch.c /usr/src/debug/git/2.54.0/entry.c /usr/src/debug/git/2.54.0/graph.c /usr/src/debug/git/2.54.0/ident.c /usr/src/debug/git/2.54.0/usage.c /usr/src/debug/git/2.54.
 0/kwset.c /usr/src/debug/git/2.54.0/loose.c /usr/src/debug/git/2.54.0/merge.c /usr/src/debug/git/2.54.0/notes.c /usr/src/debug/git/2.54.0/pager.c /usr/src/debug/git/2.54.0/notes-cache.c /usr/src/debug/git/2.54.0/add-interactive.h /usr/src/debug/git/2.54.0/builtin/count-objects.c /usr/src/debug/git/2.54.0/notes-cache.h /usr/src/debug/git/2.54.0/builtin/archive.c /usr/src/debug/git/2.54.0/builtin/ls-tree.c /usr/src/debug/git/2.54.0/add-interactive.c /usr/src/debug/git/2.54.0/builtin/replace.c /usr/src/debug/git/2.54.0/diffcore-pickaxe.c /usr/src/debug/git/2.54.0/http-walker.c /usr/src/debug/git/2.54.0/reftable/reftable-block.h /usr/src/debug/git/2.54.0/reftable/reftable-stack.h /usr/src/debug/git/2.54.0/fsmonitor-ipc.c /usr/src/debug/git/2.54.0/path.h /usr/src/debug/git/2.54.0/advice.c /usr/src/debug/git/2.54.0/builtin/commit-graph.c /usr/src/debug/git/2.54.0/fsmonitor-ipc.h /usr/src/debug/git/2.54.0/git-compat-util.h /usr/src/debug/git/2.54.0/path.c /usr/src/debug/git/2.54.0/builtin/
 unpack-file.c /usr/src/debug/git/2.54.0/builtin/upload-archive.c /usr/src/debug/git/2.54.0/tar.h /usr/src/debug/git/2.54.0/builtin/shortlog.c /usr/src/debug/git/2.54.0/reftable/reftable-system.h /usr/src/debug/git/2.54.0/parse-options-cb.c /usr/src/debug/git/2.54.0/protocol-caps.c /usr/src/debug/git/2.54.0/split-index.h /usr/src/debug/git/2.54.0/protocol-caps.h /usr/src/debug/git/2.54.0/builtin/history.c /usr/src/debug/git/2.54.0/split-index.c /usr/src/debug/git/2.54.0/list.h /usr/src/debug/git/2.54.0/reftable/reftable-basics.h /usr/src/debug/git/2.54.0/merge-ort.h /usr/src/debug/git/2.54.0/reftable/pq.c /usr/src/debug/git/2.54.0/transport.h /usr/src/debug/git/2.54.0/wt-status.h /usr/src/debug/git/2.54.0/builtin/receive-pack.c /usr/src/debug/git/2.54.0/repack-filtered.c /usr/src/debug/git/2.54.0/reftable/pq.h /usr/src/debug/git/2.54.0/merge-ort.c /usr/src/debug/git/2.54.0/transport.c /usr/src/debug/git/2.54.0/wt-status.c /usr/src/debug/git/2.54.0/builtin/fetch-pack.c /usr/src/debug/
 git/2.54.0/builtin/index-pack.c /usr/src/debug/git/2.54.0/common-main.c /usr/src/debug/git/2.54.0/builtin/verify-commit.c /usr/src/debug/git/2.54.0/cbtree.c /usr/src/debug/git/2.54.0/column.c /usr/src/debug/git/2.54.0/commit.c /usr/src/debug/git/2.54.0/config.c /usr/src/debug/git/2.54.0/reftable/writer.h /usr/src/debug/git/2.54.0/reftable/writer.c /usr/src/debug/git/2.54.0/checkout.h /usr/src/debug/git/2.54.0/checkout.c /usr/src/debug/git/2.54.0/xdiff-interface.h /usr/src/debug/git/2.54.0/hash-lookup.h /usr/src/debug/git/2.54.0/pathspec.h /usr/src/debug/git/2.54.0/refs.h /usr/src/debug/git/2.54.0/xdiff-interface.c /usr/src/debug/git/2.54.0/pathspec.c /usr/src/debug/git/2.54.0/hash-lookup.c /usr/src/debug/git/2.54.0/refs.c /usr/src/debug/git/2.54.0/log-tree.h /usr/src/debug/git/2.54.0/worktree.h /usr/src/debug/git/2.54.0/diffcore.h /usr/src/debug/git/2.54.0/log-tree.c /usr/src/debug/git/2.54.0/worktree.c /usr/src/debug/git/2.54.0/builtin/merge-tree.c /usr/src/debug/git/2.54.0/builtin
 /write-tree.c /usr/src/debug/git/2.54.0/decorate.c /usr/src/debug/git/2.54.0/reset.h /usr/src/debug/git/2.54.0/builtin/check-attr.c /usr/src/debug/git/2.54.0/decorate.h /usr/src/debug/git/2.54.0/commit-reach.h /usr/src/debug/git/2.54.0/commit-reach.c /usr/src/debug/git/2.54.0/utf8.h /usr/src/debug/git/2.54.0/utf8.c /usr/src/debug/git/2.54.0/builtin/rm.c /usr/src/debug/git/2.54.0/userdiff.c /usr/src/debug/git/2.54.0/command-list.h /usr/src/debug/git/2.54.0/builtin/remote-fd.c /usr/src/debug/git/2.54.0/userdiff.h /usr/src/debug/git/2.54.0/hex-ll.h /usr/src/debug/git/2.54.0/merge.h /usr/src/debug/git/2.54.0/list-objects-filter.h /usr/src/debug/git/2.54.0/list-objects-filter.c /usr/src/debug/git/2.54.0/patch-delta.c /usr/src/debug/git/2.54.0/linear-assignment.h /usr/src/debug/git/2.54.0/connect.h /usr/src/debug/git/2.54.0/convert.h /usr/src/debug/git/2.54.0/gettext.h /usr/src/debug/git/2.54.0/linear-assignment.c /usr/src/debug/git/2.54.0/connect.c /usr/src/debug/git/2.54.0/builtin/hook.
 c /usr/src/debug/git/2.54.0/convert.c /usr/src/debug/git/2.54.0/gettext.c /usr/src/debug/git/2.54.0/base85.h /usr/src/debug/git/2.54.0/bisect.h /usr/src/debug/git/2.54.0/branch.h /usr/src/debug/git/2.54.0/bundle.h /usr/src/debug/git/2.54.0/version.c /usr/src/debug/git/2.54.0/builtin.h /usr/src/debug/git/2.54.0/version.h /usr/src/debug/git/2.54.0/submodule.c /usr/src/debug/git/2.54.0/hashmap.h /usr/src/debug/git/2.54.0/mailmap.h /usr/src/debug/git/2.54.0/reset.c /usr/src/debug/git/2.54.0/list-objects-filter-options.h /usr/src/debug/git/2.54.0/hashmap.c /usr/src/debug/git/2.54.0/mailmap.c /usr/src/debug/git/2.54.0/submodule.h /usr/src/debug/git/2.54.0/list-objects-filter-options.c /usr/src/debug/git/2.54.0/http.c /usr/src/debug/git/2.54.0/builtin/gc.c /usr/src/debug/git/2.54.0/fsmonitor.c /usr/src/debug/git/2.54.0/builtin/fsmonitor--daemon.c /usr/src/debug/git/2.54.0/http.h /usr/src/debug/git/2.54.0/fsmonitor.h /usr/src/debug/git/2.54.0/abspath.c /usr/src/debug/git/2.54.0/tree-diff.c 
 /usr/src/debug/git/2.54.0/abspath.h /usr/src/debug/git/2.54.0/builtin/stripspace.c /usr/src/debug/git/2.54.0/fsmonitor-settings.c /usr/src/debug/git/2.54.0/sideband.h /usr/src/debug/git/2.54.0/builtin/credential.c /usr/src/debug/git/2.54.0/fsmonitor-settings.h /usr/src/debug/git/2.54.0/sideband.c /usr/src/debug/git/2.54.0/serve.h /usr/src/debug/git/2.54.0/setup.h /usr/src/debug/git/2.54.0/merge-ll.h /usr/src/debug/git/2.54.0/prune-packed.c /usr/src/debug/git/2.54.0/prune-packed.h /usr/src/debug/git/2.54.0/builtin/symbolic-ref.c /usr/src/debug/git/2.54.0/reftable/merged.h /usr/src/debug/git/2.54.0/reftable/record.h /usr/src/debug/git/2.54.0/builtin/hash-object.c /usr/src/debug/git/2.54.0/builtin/last-modified.c /usr/src/debug/git/2.54.0/notes.h /usr/src/debug/git/2.54.0/reftable/merged.c /usr/src/debug/git/2.54.0/reftable/record.c /usr/src/debug/git/2.54.0/builtin/mailsplit.c /usr/src/debug/git/2.54.0/name-hash.h /usr/src/debug/git/2.54.0/repo-settings.c /usr/src/debug/git/2.54.0/nam
 e-hash.c /usr/src/debug/git/2.54.0/builtin/am.c /usr/src/debug/git/2.54.0/repo-settings.h /usr/src/debug/git/2.54.0/builtin/check-ref-format.c /usr/src/debug/git/2.54.0/send-pack.h /usr/src/debug/git/2.54.0/repack-promisor.c /usr/src/debug/git/2.54.0/http-backend.c /usr/src/debug/git/2.54.0/send-pack.c /usr/src/debug/git/2.54.0/builtin/describe.c /usr/src/debug/git/2.54.0/serve.c /usr/src/debug/git/2.54.0/setup.c /usr/src/debug/git/2.54.0/shell.c /usr/src/debug/git/2.54.0/trailer.h /usr/src/debug/git/2.54.0/preload-index.c /usr/src/debug/git/2.54.0/wrapper.h /usr/src/debug/git/2.54.0/preload-index.h /usr/src/debug/git/2.54.0/trailer.c /usr/src/debug/git/2.54.0/wrapper.c /usr/src/debug/git/2.54.0/builtin/unpack-objects.c /usr/src/debug/git/2.54.0/builtin/send-pack.c /usr/src/debug/git/2.54.0/oid-array.c /usr/src/debug/git/2.54.0/read-cache.c /usr/src/debug/git/2.54.0/fsck.c /usr/src/debug/git/2.54.0/oid-array.h /usr/src/debug/git/2.54.0/read-cache.h /usr/src/debug/git/2.54.0/fsck.h /
 usr/src/debug/git/2.54.0/trace2.h /usr/src/debug/git/2.54.0/commit.h /usr/src/debug/git/2.54.0/config.h /usr/src/debug/git/2.54.0/object.h /usr/src/debug/git/2.54.0/hook.h /usr/src/debug/git/2.54.0/oidmap.h /usr/src/debug/git/2.54.0/oidset.h /usr/src/debug/git/2.54.0/pretty.h /usr/src/debug/git/2.54.0/prompt.h /usr/src/debug/git/2.54.0/rebase.h /usr/src/debug/git/2.54.0/hook.c /usr/src/debug/git/2.54.0/base85.c /usr/src/debug/git/2.54.0/bisect.c /usr/src/debug/git/2.54.0/builtin/pack-refs.c /usr/src/debug/git/2.54.0/builtin/remote.c /usr/src/debug/git/2.54.0/builtin/repack.c /usr/src/debug/git/2.54.0/builtin/replay.c /usr/src/debug/git/2.54.0/builtin/rerere.c /usr/src/debug/git/2.54.0/trace.h /usr/src/debug/git/2.54.0/unix-socket.c /usr/src/debug/git/2.54.0/unix-socket.h /usr/src/debug/git/2.54.0/reftable/reftable-record.h /usr/src/debug/git/2.54.0/object-name.c /usr/src/debug/git/2.54.0/builtin/range-diff.c /usr/src/debug/git/2.54.0/builtin/pack-objects.c /usr/src/debug/git/2.54.0/
 object-name.h /usr/src/debug/git/2.54.0/varint.c /usr/src/debug/git/2.54.0/branch.c /usr/src/debug/git/2.54.0/for-each-ref.h /usr/src/debug/git/2.54.0/bundle.c /usr/src/debug/git/2.54.0/object.c /usr/src/debug/git/2.54.0/oidmap.c /usr/src/debug/git/2.54.0/oidset.c /usr/src/debug/git/2.54.0/pretty.c /usr/src/debug/git/2.54.0/builtin/diagnose.c /usr/src/debug/git/2.54.0/prompt.c /usr/src/debug/git/2.54.0/builtin/mktag.c /usr/src/debug/git/2.54.0/builtin/notes.c /usr/src/debug/git/2.54.0/builtin/prune.c /usr/src/debug/git/2.54.0/builtin/reset.c /usr/src/debug/git/2.54.0/builtin/stash.c /usr/src/debug/git/2.54.0/builtin/apply.c /usr/src/debug/git/2.54.0/builtin/blame.c /usr/src/debug/git/2.54.0/builtin/clean.c /usr/src/debug/git/2.54.0/builtin/clone.c /usr/src/debug/git/2.54.0/builtin/fetch.c /usr/src/debug/git/2.54.0/merge-ort-wrappers.c /usr/src/debug/git/2.54.0/dir.h /usr/src/debug/git/2.54.0/builtin/init-db.c /usr/src/debug/git/2.54.0/merge-ort-wrappers.h /usr/src/debug/git/2.54.0/d
 ir.c /usr/src/debug/git/2.54.0/builtin/get-tar-commit-id.c /usr/src/debug/git/2.54.0/odb/source-files.c /usr/src/debug/git/2.54.0/builtin/name-rev.c /usr/src/debug/git/2.54.0/odb/source-files.h /usr/src/debug/git/2.54.0/pseudo-merge.c /usr/src/debug/git/2.54.0/unpack-trees.c /usr/src/debug/git/2.54.0/odb/source.c /usr/src/debug/git/2.54.0/pseudo-merge.h /usr/src/debug/git/2.54.0/repack-cruft.c /usr/src/debug/git/2.54.0/odb/source.h /usr/src/debug/git/2.54.0/unpack-trees.h /usr/src/debug/git/2.54.0/builtin/interpret-trailers.c /usr/src/debug/git/2.54.0/varint.h /usr/src/debug/git/2.54.0/strbuf.h /usr/src/debug/git/2.54.0/strmap.h /usr/src/debug/git/2.54.0/strvec.h /usr/src/debug/git/2.54.0/line-range.h /usr/src/debug/git/2.54.0/walker.h /usr/src/debug/git/2.54.0/remote.h /usr/src/debug/git/2.54.0/repack.h /usr/src/debug/git/2.54.0/replay.h /usr/src/debug/git/2.54.0/rerere.h /usr/src/debug/git/2.54.0/shortlog.h /usr/src/debug/git/2.54.0/remote.c /usr/src/debug/git/2.54.0/repack.c /usr
 /src/debug/git/2.54.0/replay.c /usr/src/debug/git/2.54.0/rerere.c /usr/src/debug/git/2.54.0/scalar.c /usr/src/debug/git/2.54.0/strbuf.c /usr/src/debug/git/2.54.0/strmap.c /usr/src/debug/git/2.54.0/strvec.c /usr/src/debug/git/2.54.0/walker.c /usr/src/debug/git/2.54.0/reflog.c /usr/src/debug/git/2.54.0/line-log.c /usr/src/debug/git/2.54.0/merge-ll.c /usr/src/debug/git/2.54.0/trace.c /usr/src/debug/git/2.54.0/trace2.c /usr/src/debug/git/2.54.0/sub-process.h /usr/src/debug/git/2.54.0/builtin/merge-file.c /usr/src/debug/git/2.54.0/sub-process.c /usr/src/debug/git/2.54.0/builtin/for-each-repo.c"
packages/x86-64-v3-poky-linux/git/git-src: PV changed from "2.53.0" to "2.54.0"
packages/x86-64-v3-poky-linux/git/git-src: PKGSIZE changed from 10211944 to 10436431 (+2%)
packages/x86-64-v3-poky-linux/git/git-src: PKGV changed from 2.53.0 [default] to 2.54.0 [default]
packages/x86-64-v3-poky-linux/git/git-staticdev: PV changed from "2.53.0" to "2.54.0"
packages/x86-64-v3-poky-linux/git/git-staticdev: PKGV changed from 2.53.0 [default] to 2.54.0 [default]
packages/x86-64-v3-poky-linux/git/git-tk: PV changed from "2.53.0" to "2.54.0"
packages/x86-64-v3-poky-linux/git/git-tk: PKGV changed from 2.53.0 [default] to 2.54.0 [default]
packages/x86-64-v3-poky-linux/git/git: FILELIST: added "/usr/libexec/git-core/git-history"
packages/x86-64-v3-poky-linux/git/git: PV changed from "2.53.0" to "2.54.0"
packages/x86-64-v3-poky-linux/git/git: PKGSIZE changed from 25029720 to 25421004 (+2%)
packages/x86-64-v3-poky-linux/git/git: PKGV changed from 2.53.0 [default] to 2.54.0 [default]
packages/x86-64-v3-poky-linux/git/gitweb: PV changed from "2.53.0" to "2.54.0"
packages/x86-64-v3-poky-linux/git/gitweb: PKGSIZE changed from 313828 to 314965 (+0%)
packages/x86-64-v3-poky-linux/git/gitweb: PKGV changed from 2.53.0 [default] to 2.54.0 [default]
packages/x86-64-v3-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.53.0.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.54.0.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"
packages/x86-64-v3-poky-linux/git: PV changed from "2.53.0" to "2.54.0"
packages/x86-64-v3-poky-linux/git: PKGV changed from 2.53.0 [default] to 2.54.0 [default]

--===============7585025762287522765==--

