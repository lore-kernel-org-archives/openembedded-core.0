Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A842C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 05:42:16 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2329.1783489329758162832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 22:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=rijeJ724;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OsEX9epW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019f403f7732-512335d6-f2c0-4764-9f44-66392a2861cb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783489329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pXzEKAOpyoW2AC3aRytVuPIX2nKHcbMPcg22ZnfE+Ro=;
	b=rijeJ72403xaxLU3HdsZlaALSFUmCbOih1uksdIx/SGKt3+OllI64KrzvMXnD5o1
	O9+8MoauNMem2znV+VosTDLKab9hlHc17oIZCSUvia4OqXbRNK+lVGrQrfqWetuc9cF
	u0jox3uDiDuSaEFq89Q4MgB5HORU42WcgRbLWL0Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783489329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pXzEKAOpyoW2AC3aRytVuPIX2nKHcbMPcg22ZnfE+Ro=;
	b=OsEX9epWgp/nXAIEsG50X8rzqLGUPjYy4Pc9XzutpsDbmIRv0IRXe1y96KLXNlD2
	4adoftdde+ExcDrQCYpnR4H+i8tPEoJjJU6Sbp6m228xx0qICjfJbu7ok4Mrij4QRq6
	16nGVsy5htbeADzATSzQbYhql8gO2c/02/YlXnp8=
Content-Type: multipart/mixed; boundary="===============0181368210594935347=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-binary-native: upgrading to 1.26.5 SUCCEEDED
Message-ID: <0101019f403f7732-512335d6-f2c0-4764-9f44-66392a2861cb-000000@us-west-2.amazonses.com>
Date: Wed, 8 Jul 2026 05:42:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.08-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 05:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240424

--===============0181368210594935347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-binary-native* to *1.26.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-go-binary-native-upgrade-1.26.4-1.26.5.patch
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
From 6848c0932b0c0a8047a0141b4564bf24c23a94e2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 8 Jul 2026 05:11:27 +0000
Subject: [PATCH] go-binary-native: upgrade 1.26.4 -> 1.26.5

---
 ...{go-binary-native_1.26.4.bb => go-binary-native_1.26.5.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.4.bb => go-binary-native_1.26.5.bb} (80%)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.26.4.bb b/meta/recipes-devtools/go/go-binary-native_1.26.5.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.26.4.bb
rename to meta/recipes-devtools/go/go-binary-native_1.26.5.bb
index 3757b9f6a5..b78c758fb0 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.26.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.26.5.bb
@@ -9,9 +9,7 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "1153d3d50e0ac764b447adfe05c2bcf08e889d42a02e0fe0259bd47f6733ad7f"
-SRC_URI[go_linux_arm64.sha256sum] = "ef758ae7c6cf9267c9c0ef080b8965f453d89ab2d25d9eb22de4405925238768"
-SRC_URI[go_linux_ppc64le.sha256sum] = "53f49b8c7eace2d30389327b4a516b13321f90377fdf5929a6b63174609bc22e"
+SRC_URI[go_linux_amd64.sha256sum] = "5c2c3b16caefa1d968a94c1daca04a7ca301a496d9b086e17ad77bb81393f053"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
-- 
2.47.1


--===============0181368210594935347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/go-binary-native (sysroot):
  /usr/lib/go/test/fixedbugs/issue79186.go was added
  /usr/lib/go/test/fixedbugs/issue80004.go was added

--===============0181368210594935347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86_64-linux/go-binary-native (sysroot):
  /usr/lib/go/test/fixedbugs/issue79186.go was added
  /usr/lib/go/test/fixedbugs/issue80004.go was added

--===============0181368210594935347==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-binary-native-upgrade-1.26.4-1.26.5.patch"

RnJvbSA2ODQ4YzA5MzJiMGMwYTgwNDdhMDE0MWI0NTY0YmYyNGMyM2E5NGUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgOCBKdWwgMjAyNiAwNToxMToyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdv
LWJpbmFyeS1uYXRpdmU6IHVwZ3JhZGUgMS4yNi40IC0+IDEuMjYuNQoKLS0tCiAuLi57Z28tYmlu
YXJ5LW5hdGl2ZV8xLjI2LjQuYmIgPT4gZ28tYmluYXJ5LW5hdGl2ZV8xLjI2LjUuYmJ9IHwgNCAr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL3tnby1iaW5hcnktbmF0aXZlXzEuMjYuNC5iYiA9
PiBnby1iaW5hcnktbmF0aXZlXzEuMjYuNS5iYn0gKDgwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ28vZ28tYmluYXJ5LW5hdGl2ZV8xLjI2LjQuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ28vZ28tYmluYXJ5LW5hdGl2ZV8xLjI2LjUuYmIKc2ltaWxhcml0eSBpbmRl
eCA4MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRp
dmVfMS4yNi40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tYmluYXJ5
LW5hdGl2ZV8xLjI2LjUuYmIKaW5kZXggMzc1N2I5ZjZhNS4uYjc4Yzc1OGZiMCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRpdmVfMS4yNi40LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1iaW5hcnktbmF0aXZlXzEuMjYuNS5iYgpA
QCAtOSw5ICs5LDcgQEAgUFJPVklERVMgPSAiZ28tbmF0aXZlIgogCiAjIENoZWNrc3VtcyBhdmFp
bGFibGUgYXQgaHR0cHM6Ly9nby5kZXYvZGwvCiBTUkNfVVJJID0gImh0dHBzOi8vZGwuZ29vZ2xl
LmNvbS9nby9nbyR7UFZ9LiR7QlVJTERfR09PU30tJHtCVUlMRF9HT0FSQ0h9LnRhci5nejtuYW1l
PWdvXyR7QlVJTERfR09UVVBMRX0iCi1TUkNfVVJJW2dvX2xpbnV4X2FtZDY0LnNoYTI1NnN1bV0g
PSAiMTE1M2QzZDUwZTBhYzc2NGI0NDdhZGZlMDVjMmJjZjA4ZTg4OWQ0MmEwMmUwZmUwMjU5YmQ0
N2Y2NzMzYWQ3ZiIKLVNSQ19VUklbZ29fbGludXhfYXJtNjQuc2hhMjU2c3VtXSA9ICJlZjc1OGFl
N2M2Y2Y5MjY3YzljMGVmMDgwYjg5NjVmNDUzZDg5YWIyZDI1ZDllYjIyZGU0NDA1OTI1MjM4NzY4
IgotU1JDX1VSSVtnb19saW51eF9wcGM2NGxlLnNoYTI1NnN1bV0gPSAiNTNmNDliOGM3ZWFjZTJk
MzAzODkzMjdiNGE1MTZiMTMzMjFmOTAzNzdmZGY1OTI5YTZiNjMxNzQ2MDliYzIyZSIKK1NSQ19V
UklbZ29fbGludXhfYW1kNjQuc2hhMjU2c3VtXSA9ICI1YzJjM2IxNmNhZWZhMWQ5NjhhOTRjMWRh
Y2EwNGE3Y2EzMDFhNDk2ZDliMDg2ZTE3YWQ3N2JiODEzOTNmMDUzIgogCiBVUFNUUkVBTV9DSEVD
S19VUkkgPSAiaHR0cHM6Ly9nb2xhbmcub3JnL2RsLyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0g
ImdvKD9QPHB2ZXI+XGQrKFwuXGQrKSspXC5saW51eCIKLS0gCjIuNDcuMQoK

--===============0181368210594935347==--

