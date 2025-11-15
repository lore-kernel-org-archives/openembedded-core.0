Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADAFCEB2F6
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:40 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11930.1763224714250013416
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MkUJ+e4Q;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=joiMlWAm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019a8862043c-c6132cb4-37b7-44c0-8de5-5a85922d8691-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nRgHR8qDumNxUmk9NlsE/3FNumUlLUQabtufySTs3Dw=;
	b=MkUJ+e4QignsSeUOyp99pRHXU/QI3iDB+pWeMWG588y/7cTtPtjz/oqV0UEG3sMk
	A47AYHCouvoApTWDttD0WFjEdjFWiGBmK2R9CoRM26tKr7n0R/wk1D4QQRA7itNgVxR
	qZrGEINecI2nMSIjLbKczV4giNsgcPCyTOj/eUTE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nRgHR8qDumNxUmk9NlsE/3FNumUlLUQabtufySTs3Dw=;
	b=joiMlWAmLHUQk5zsAz1tcRGKN8EtsaLZKeB55Wq5jsJBj+fPDYIsAnSk+96Rpk9Q
	4YNixxnacKf9xutyJKQU5Op9ZhZsw7MX0+TJ4bTZRr7r+KIyGLKKQG6PNt7WsSQ70au
	xRxFqfFSlqF3hl+GNfJiH5UNQYNmBTrhFzjbP2Ws=
Content-Type: multipart/mixed; boundary="===============3687225184207361559=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202508.01^{} FAILED
Message-ID: <0101019a8862043c-c6132cb4-37b7-44c0-8de5-5a85922d8691-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226327

--===============3687225184207361559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202508.01^{}* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ovmf-upgrade-edk2-stable202508-edk2-stable202508.01.patch
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
From 50060597606143a289ded6a46814cdb2adc97535 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 08:38:29 +0000
Subject: [PATCH] ovmf: upgrade edk2-stable202508 -> edk2-stable202508.01^{}

---
 .../ovmf/0001-ovmf-update-path-to-native-BaseTools.patch    | 2 +-
 ...aseTools-makefile-adjust-to-build-in-under-bitbake.patch | 2 +-
 meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch     | 2 +-
 meta/recipes-core/ovmf/ovmf/0004-reproducible.patch         | 2 +-
 meta/recipes-core/ovmf/ovmf_git.bb                          | 6 +++---
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
index 890e586210..b43b1cdc14 100644
--- a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch
@@ -1,4 +1,4 @@
-From 0f859c6de2914cd984f8a0dd61471b91a2371bfa Mon Sep 17 00:00:00 2001
+From d2ff2a708b237d57d6ac033c55d8c910f4177e3e Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Thu, 9 Jun 2016 02:23:01 -0700
 Subject: [PATCH] ovmf: update path to native BaseTools
diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
index 4a55528571..5b698536c3 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
@@ -1,4 +1,4 @@
-From 9dbd082516fdd7100f99f0f389b8eef5ececab19 Mon Sep 17 00:00:00 2001
+From 02eec79efa96ee5e5be1a640d1c4000a9f2b4400 Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Fri, 26 Jul 2019 17:34:26 -0400
 Subject: [PATCH] BaseTools: makefile: adjust to build in under bitbake
diff --git a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
index 1e79c23ae9..8c97490c5f 100644
--- a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
+++ b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
@@ -1,4 +1,4 @@
-From eb6db21ed0a845dce149d17acf8673d5188adea4 Mon Sep 17 00:00:00 2001
+From d317079270e9948474bca478a42d8329f297c596 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:56:28 +0200
 Subject: [PATCH] debug prefix map
diff --git a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
index 73f242321e..094f481c68 100644
--- a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
+++ b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
@@ -1,4 +1,4 @@
-From 0d22e07cd9cc35ede04c01d3141068db744d7677 Mon Sep 17 00:00:00 2001
+From 6650bef8a8136f9ab18839649461d8aa4e79ef4e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:57:30 +0200
 Subject: [PATCH] reproducible
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 577310a678..652551865f 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -20,15 +20,15 @@ PACKAGECONFIG[tpm] = "-D TPM_ENABLE=TRUE,-D TPM_ENABLE=FALSE,,"
 #see https://src.fedoraproject.org/rpms/edk2/blob/rawhide/f/0032-Basetools-turn-off-gcc12-warning.patch
 BUILD_CFLAGS += "-Wno-error=stringop-overflow"
 
-SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https;tag=${PV} \
+SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=stable/202508;protocol=https;tag=${PV} \
            file://0001-ovmf-update-path-to-native-BaseTools.patch \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
            file://0003-debug-prefix-map.patch \
            file://0004-reproducible.patch \
            "
 
-PV = "edk2-stable202508"
-SRCREV = "d46aa46c8361194521391aa581593e556c707c6e"
+PV = "edk2-stable202508.01^{}"
+SRCREV = "3d244c3b364bd4e21261380662186d064659161c"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
 CVE_PRODUCT = "edk2"
-- 
2.47.1


--===============3687225184207361559==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ovmf-upgrade-edk2-stable202508-edk2-stable202508.01.patch"

RnJvbSA1MDA2MDU5NzYwNjE0M2EyODlkZWQ2YTQ2ODE0Y2RiMmFkYzk3NTM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDg6Mzg6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
dm1mOiB1cGdyYWRlIGVkazItc3RhYmxlMjAyNTA4IC0+IGVkazItc3RhYmxlMjAyNTA4LjAxXnt9
CgotLS0KIC4uLi9vdm1mLzAwMDEtb3ZtZi11cGRhdGUtcGF0aC10by1uYXRpdmUtQmFzZVRvb2xz
LnBhdGNoICAgIHwgMiArLQogLi4uYXNlVG9vbHMtbWFrZWZpbGUtYWRqdXN0LXRvLWJ1aWxkLWlu
LXVuZGVyLWJpdGJha2UucGF0Y2ggfCAyICstCiBtZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYv
MDAwMy1kZWJ1Zy1wcmVmaXgtbWFwLnBhdGNoICAgICB8IDIgKy0KIG1ldGEvcmVjaXBlcy1jb3Jl
L292bWYvb3ZtZi8wMDA0LXJlcHJvZHVjaWJsZS5wYXRjaCAgICAgICAgIHwgMiArLQogbWV0YS9y
ZWNpcGVzLWNvcmUvb3ZtZi9vdm1mX2dpdC5iYiAgICAgICAgICAgICAgICAgICAgICAgICAgfCA2
ICsrKy0tLQogNSBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAwMDEtb3ZtZi11cGRh
dGUtcGF0aC10by1uYXRpdmUtQmFzZVRvb2xzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvb3Zt
Zi9vdm1mLzAwMDEtb3ZtZi11cGRhdGUtcGF0aC10by1uYXRpdmUtQmFzZVRvb2xzLnBhdGNoCmlu
ZGV4IDg5MGU1ODYyMTAuLmI0M2IxY2RjMTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3Jl
L292bWYvb3ZtZi8wMDAxLW92bWYtdXBkYXRlLXBhdGgtdG8tbmF0aXZlLUJhc2VUb29scy5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAwMS1vdm1mLXVwZGF0ZS1wYXRo
LXRvLW5hdGl2ZS1CYXNlVG9vbHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDBmODU5YzZk
ZTI5MTRjZDk4NGY4YTBkZDYxNDcxYjkxYTIzNzFiZmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGQyZmYyYTcwOGIyMzdkNTdkNmFjMDMzYzU1ZDhjOTEwZjQxNzdlM2UgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNhcmRvIE5lcmkgPHJpY2FyZG8ubmVyaS1jYWxkZXJv
bkBsaW51eC5pbnRlbC5jb20+CiBEYXRlOiBUaHUsIDkgSnVuIDIwMTYgMDI6MjM6MDEgLTA3MDAK
IFN1YmplY3Q6IFtQQVRDSF0gb3ZtZjogdXBkYXRlIHBhdGggdG8gbmF0aXZlIEJhc2VUb29scwpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAwMDItQmFzZVRvb2xzLW1h
a2VmaWxlLWFkanVzdC10by1idWlsZC1pbi11bmRlci1iaXRiYWtlLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWNvcmUvb3ZtZi9vdm1mLzAwMDItQmFzZVRvb2xzLW1ha2VmaWxlLWFkanVzdC10by1idWls
ZC1pbi11bmRlci1iaXRiYWtlLnBhdGNoCmluZGV4IDRhNTU1Mjg1NzEuLjViNjk4NTM2YzMgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDAyLUJhc2VUb29scy1tYWtl
ZmlsZS1hZGp1c3QtdG8tYnVpbGQtaW4tdW5kZXItYml0YmFrZS5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9vdm1mL292bWYvMDAwMi1CYXNlVG9vbHMtbWFrZWZpbGUtYWRqdXN0LXRvLWJ1
aWxkLWluLXVuZGVyLWJpdGJha2UucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDlkYmQwODI1
MTZmZGQ3MTAwZjk5ZjBmMzg5YjhlZWY1ZWNlY2FiMTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDAyZWVjNzllZmE5NmVlNWU1YmUxYTY0MGQxYzQwMDBhOWYyYjQ0MDAgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNhcmRvIE5lcmkgPHJpY2FyZG8ubmVyaS1jYWxkZXJv
bkBsaW51eC5pbnRlbC5jb20+CiBEYXRlOiBGcmksIDI2IEp1bCAyMDE5IDE3OjM0OjI2IC0wNDAw
CiBTdWJqZWN0OiBbUEFUQ0hdIEJhc2VUb29sczogbWFrZWZpbGU6IGFkanVzdCB0byBidWlsZCBp
biB1bmRlciBiaXRiYWtlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYv
MDAwMy1kZWJ1Zy1wcmVmaXgtbWFwLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1m
LzAwMDMtZGVidWctcHJlZml4LW1hcC5wYXRjaAppbmRleCAxZTc5YzIzYWU5Li44Yzk3NDkwYzVm
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAwMy1kZWJ1Zy1wcmVm
aXgtbWFwLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDAzLWRlYnVn
LXByZWZpeC1tYXAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGViNmRiMjFlZDBhODQ1ZGNl
MTQ5ZDE3YWNmODY3M2Q1MTg4YWRlYTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQz
MTcwNzkyNzBlOTk0ODQ3NGJjYTQ3OGE0MmQ4MzI5ZjI5N2M1OTYgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4K
IERhdGU6IE1vbiwgMTQgSnVuIDIwMjEgMTk6NTY6MjggKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0g
ZGVidWcgcHJlZml4IG1hcApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1m
LzAwMDQtcmVwcm9kdWNpYmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAw
MDQtcmVwcm9kdWNpYmxlLnBhdGNoCmluZGV4IDczZjI0MjMyMWUuLjA5NGY0ODFjNjggMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDA0LXJlcHJvZHVjaWJsZS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAwNC1yZXByb2R1Y2libGUucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDBkMjJlMDdjZDljYzM1ZWRlMDRjMDFkMzE0MTA2OGRi
NzQ0ZDc2NzcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDY2NTBiZWY4YTgxMzZmOWFi
MTg4Mzk2NDk0NjFkOGFhNGU3OWVmNGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMTQg
SnVuIDIwMjEgMTk6NTc6MzAgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gcmVwcm9kdWNpYmxlCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWZfZ2l0LmJiIGIvbWV0YS9yZWNp
cGVzLWNvcmUvb3ZtZi9vdm1mX2dpdC5iYgppbmRleCA1NzczMTBhNjc4Li42NTI1NTE4NjVmIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWZfZ2l0LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1jb3JlL292bWYvb3ZtZl9naXQuYmIKQEAgLTIwLDE1ICsyMCwxNSBAQCBQQUNLQUdF
Q09ORklHW3RwbV0gPSAiLUQgVFBNX0VOQUJMRT1UUlVFLC1EIFRQTV9FTkFCTEU9RkFMU0UsLCIK
ICNzZWUgaHR0cHM6Ly9zcmMuZmVkb3JhcHJvamVjdC5vcmcvcnBtcy9lZGsyL2Jsb2IvcmF3aGlk
ZS9mLzAwMzItQmFzZXRvb2xzLXR1cm4tb2ZmLWdjYzEyLXdhcm5pbmcucGF0Y2gKIEJVSUxEX0NG
TEFHUyArPSAiLVduby1lcnJvcj1zdHJpbmdvcC1vdmVyZmxvdyIKIAotU1JDX1VSSSA9ICJnaXRz
bTovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazIuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9
aHR0cHM7dGFnPSR7UFZ9IFwKK1NSQ19VUkkgPSAiZ2l0c206Ly9naXRodWIuY29tL3RpYW5vY29y
ZS9lZGsyLmdpdDticmFuY2g9c3RhYmxlLzIwMjUwODtwcm90b2NvbD1odHRwczt0YWc9JHtQVn0g
XAogICAgICAgICAgICBmaWxlOi8vMDAwMS1vdm1mLXVwZGF0ZS1wYXRoLXRvLW5hdGl2ZS1CYXNl
VG9vbHMucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1CYXNlVG9vbHMtbWFrZWZpbGUt
YWRqdXN0LXRvLWJ1aWxkLWluLXVuZGVyLWJpdGJha2UucGF0Y2ggXAogICAgICAgICAgICBmaWxl
Oi8vMDAwMy1kZWJ1Zy1wcmVmaXgtbWFwLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDQt
cmVwcm9kdWNpYmxlLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1QViA9ICJlZGsyLXN0YWJsZTIw
MjUwOCIKLVNSQ1JFViA9ICJkNDZhYTQ2YzgzNjExOTQ1MjEzOTFhYTU4MTU5M2U1NTZjNzA3YzZl
IgorUFYgPSAiZWRrMi1zdGFibGUyMDI1MDguMDFee30iCitTUkNSRVYgPSAiM2QyNDRjM2IzNjRi
ZDRlMjEyNjEzODA2NjIxODZkMDY0NjU5MTYxYyIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VY
ID0gIig/UDxwdmVyPmVkazItc3RhYmxlLiopIgogCiBDVkVfUFJPRFVDVCA9ICJlZGsyIgotLSAK
Mi40Ny4xCgo=

--===============3687225184207361559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1944 entries from dependency cache.
Parsing recipes...done.
Parsing of 947 .bb files complete (946 cached, 1 parsed). 1944 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-62700fe8021dc365da4fac94bc9a4adb325cea36"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:62700fe8021dc365da4fac94bc9a4adb325cea36"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 167 Local 151 Mirrors 0 Missed 16 Current 375 (90% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 534 of 542 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 536 of 542 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_recipe_qa_setscene)
NOTE: recipe ovmf-edk2-stable202508.01^{}-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ovmf-native-edk2-stable202508.01^{}-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ovmf-edk2-stable202508.01^{}-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1656 of 1689 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_fetch)
NOTE: recipe ovmf-native-edk2-stable202508.01^{}-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1658 of 1689 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_fetch)
NOTE: recipe ovmf-edk2-stable202508.01^{}-r0: task do_fetch: Started
NOTE: recipe ovmf-native-edk2-stable202508.01^{}-r0: task do_fetch: Started
NOTE: recipe ovmf-edk2-stable202508.01^{}-r0: task do_fetch: Succeeded
NOTE: Running task 1659 of 1689 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_unpack)
NOTE: recipe ovmf-edk2-stable202508.01^{}-r0: task do_unpack: Started
NOTE: recipe ovmf-native-edk2-stable202508.01^{}-r0: task do_fetch: Succeeded
NOTE: Running task 1660 of 1689 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_unpack)
NOTE: Running task 1661 of 1689 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe ovmf-native-edk2-stable202508.01^{}-r0: task do_unpack: Started
NOTE: recipe ovmf-native-edk2-stable202508.01^{}-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ovmf-native-edk2-stable202508.01^{}-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ovmf-edk2-stable202508.01^{}-r0: task do_unpack: Succeeded
NOTE: Running task 1662 of 1689 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_patch)
NOTE: recipe ovmf-edk2-stable202508.01^{}-r0: task do_patch: Started
NOTE: recipe ovmf-edk2-stable202508.01^{}-r0: task do_patch: Failed
NOTE: recipe ovmf-native-edk2-stable202508.01^{}-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1662 tasks of which 1656 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115083723.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115083723.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ovmf/edk2-stable202508.01^{}/temp/log.do_patch.3786991
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: ovmf-edk2-stable202508.01^{}-r0 do_patch: Applying patch '0001-ovmf-update-path-to-native-BaseTools.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ovmf/edk2-stable202508.01^{}/sources/ovmf-edk2-stable202508.01^{}'
CmdError("quilt --quiltrc '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ovmf/edk2-stable202508.01^{}/recipe-sysroot-native/etc/quiltrc' push", 0, 'stdout: Usage: quilt [--trace[=verbose]] [--quiltrc=XX] command [-h] ...
       quilt --version
Commands are:

Global options:

--trace
\tRuns the command in bash trace mode (-x). For internal debugging.

--quiltrc file
\tUse the specified configuration file instead of ~/.quiltrc (or
\t/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ovmf/edk2-stable202508.01^{}/recipe-sysroot-native/etc/quilt.quiltrc if ~/.quiltrc does not exist).  See the pdf
\tdocumentation for details about its possible contents.  The
\tspecial value "-" causes quilt not to read any configuration
\tfile.

--version
\tPrint the version number and exit immediately.

stderr: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ovmf/edk2-stable202508.01^{}/recipe-sysroot-native/usr/bin/quilt: line 46: column: command not found
/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ovmf/edk2-stable202508.01^{}/recipe-sysroot-native/usr/bin/quilt: line 46: column: command not found
')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ovmf/edk2-stable202508.01^{}/temp/log.do_patch.3786991
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_patch) failed with exit code '1'

--===============3687225184207361559==--

