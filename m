Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B200C624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:31:49 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5726.1788327104276800076
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OAD+R4Vm;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DsZMh8mK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a0609a0bc8-4c12eed4-c4a7-4ae6-bcf2-d44d7297c181-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788327103;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qZ7sa8OZ9mgvVR0C+k99JdKqM65orP2HLWgHe1wHf5w=;
	b=OAD+R4VmsXJG0XsAwJuKf6XiNkt+Iu1xtoL8A/hCqWlm1bVDRn1Uktkc8ttMTfiv
	zzcbfYg3juet9NnEwHpV1vHCX7ecyWtw8t1cmbMZmKDmWTZp3lKSXEwoxF8HJ56KyWI
	YFiMVC046g8MZDKhYWvP3CQgK60PseBEyqqkco+s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788327103;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qZ7sa8OZ9mgvVR0C+k99JdKqM65orP2HLWgHe1wHf5w=;
	b=DsZMh8mKQtE79tfXGcxld2ZatCCL1rsMDIzeKJ5Ovac130jMUfGrEDtde9ta3hPS
	B2W3UlZ0BNF8o32K/GQ1AOnTaSYtgqTUGLWPqiKQRsT5DBRXcoOZ9Yr9bjWdi/ZkdOe
	GwakOVNxLpjLxN+eE5pNCPLiUgdvWXXhPtyF9QsQ=
Content-Type: multipart/mixed; boundary="===============5196746470180716075=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-binary-native: upgrading to 1.27.1 SUCCEEDED
Message-ID: <010101a0609a0bc8-4c12eed4-c4a7-4ae6-bcf2-d44d7297c181-000000@us-west-2.amazonses.com>
Date: Wed, 2 Sep 2026 05:31:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244879

--===============5196746470180716075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-binary-native* to *1.27.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-go-binary-native-upgrade-1.27.0-1.27.1.patch
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
From 52b9050930e41dc2d953a52407b935cfdce762c7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 2 Sep 2026 05:07:30 +0000
Subject: [PATCH] go-binary-native: upgrade 1.27.0 -> 1.27.1

---
 ...{go-binary-native_1.27.0.bb => go-binary-native_1.27.1.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.27.0.bb => go-binary-native_1.27.1.bb} (80%)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.27.0.bb b/meta/recipes-devtools/go/go-binary-native_1.27.1.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.27.0.bb
rename to meta/recipes-devtools/go/go-binary-native_1.27.1.bb
index 0f6c3bc96e..e9da258e2e 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.27.0.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.27.1.bb
@@ -9,9 +9,7 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "675c26c449cbb18fc24b74650de1eabbae6e16f64326fd85a283fb3b58280685"
-SRC_URI[go_linux_arm64.sha256sum] = "51798d2c42d0e1c6ed7fd9f48728b4193abac9e8aad6dbac2fe96a81f5909bda"
-SRC_URI[go_linux_ppc64le.sha256sum] = "068085e257a6014c036c723ca62943edbf48fd168b8d00a6d39527d10b656255"
+SRC_URI[go_linux_amd64.sha256sum] = "63d339f0da5ab53635a56f2490a7984dfe12dfcff22ad749f63edaf590168445"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
-- 
2.47.1


--===============5196746470180716075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86_64-linux/go-binary-native (sysroot):
  /usr/lib/go/test/fixedbugs/issue80976.go was added
  /usr/lib/go/test/fixedbugs/issue81165.go was added

--===============5196746470180716075==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-binary-native-upgrade-1.27.0-1.27.1.patch"

RnJvbSA1MmI5MDUwOTMwZTQxZGMyZDk1M2E1MjQwN2I5MzVjZmRjZTc2MmM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMiBTZXAgMjAyNiAwNTowNzozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdv
LWJpbmFyeS1uYXRpdmU6IHVwZ3JhZGUgMS4yNy4wIC0+IDEuMjcuMQoKLS0tCiAuLi57Z28tYmlu
YXJ5LW5hdGl2ZV8xLjI3LjAuYmIgPT4gZ28tYmluYXJ5LW5hdGl2ZV8xLjI3LjEuYmJ9IHwgNCAr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL3tnby1iaW5hcnktbmF0aXZlXzEuMjcuMC5iYiA9
PiBnby1iaW5hcnktbmF0aXZlXzEuMjcuMS5iYn0gKDgwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ28vZ28tYmluYXJ5LW5hdGl2ZV8xLjI3LjAuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ28vZ28tYmluYXJ5LW5hdGl2ZV8xLjI3LjEuYmIKc2ltaWxhcml0eSBpbmRl
eCA4MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRp
dmVfMS4yNy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tYmluYXJ5
LW5hdGl2ZV8xLjI3LjEuYmIKaW5kZXggMGY2YzNiYzk2ZS4uZTlkYTI1OGUyZSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRpdmVfMS4yNy4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1iaW5hcnktbmF0aXZlXzEuMjcuMS5iYgpA
QCAtOSw5ICs5LDcgQEAgUFJPVklERVMgPSAiZ28tbmF0aXZlIgogCiAjIENoZWNrc3VtcyBhdmFp
bGFibGUgYXQgaHR0cHM6Ly9nby5kZXYvZGwvCiBTUkNfVVJJID0gImh0dHBzOi8vZGwuZ29vZ2xl
LmNvbS9nby9nbyR7UFZ9LiR7QlVJTERfR09PU30tJHtCVUlMRF9HT0FSQ0h9LnRhci5nejtuYW1l
PWdvXyR7QlVJTERfR09UVVBMRX0iCi1TUkNfVVJJW2dvX2xpbnV4X2FtZDY0LnNoYTI1NnN1bV0g
PSAiNjc1YzI2YzQ0OWNiYjE4ZmMyNGI3NDY1MGRlMWVhYmJhZTZlMTZmNjQzMjZmZDg1YTI4M2Zi
M2I1ODI4MDY4NSIKLVNSQ19VUklbZ29fbGludXhfYXJtNjQuc2hhMjU2c3VtXSA9ICI1MTc5OGQy
YzQyZDBlMWM2ZWQ3ZmQ5ZjQ4NzI4YjQxOTNhYmFjOWU4YWFkNmRiYWMyZmU5NmE4MWY1OTA5YmRh
IgotU1JDX1VSSVtnb19saW51eF9wcGM2NGxlLnNoYTI1NnN1bV0gPSAiMDY4MDg1ZTI1N2E2MDE0
YzAzNmM3MjNjYTYyOTQzZWRiZjQ4ZmQxNjhiOGQwMGE2ZDM5NTI3ZDEwYjY1NjI1NSIKK1NSQ19V
UklbZ29fbGludXhfYW1kNjQuc2hhMjU2c3VtXSA9ICI2M2QzMzlmMGRhNWFiNTM2MzVhNTZmMjQ5
MGE3OTg0ZGZlMTJkZmNmZjIyYWQ3NDlmNjNlZGFmNTkwMTY4NDQ1IgogCiBVUFNUUkVBTV9DSEVD
S19VUkkgPSAiaHR0cHM6Ly9nb2xhbmcub3JnL2RsLyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0g
ImdvKD9QPHB2ZXI+XGQrKFwuXGQrKSspXC5saW51eCIKLS0gCjIuNDcuMQoK

--===============5196746470180716075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/go-binary-native (sysroot):
  /usr/lib/go/test/fixedbugs/issue80976.go was added
  /usr/lib/go/test/fixedbugs/issue81165.go was added

--===============5196746470180716075==--

