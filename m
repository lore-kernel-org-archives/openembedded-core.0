Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27491CCD187
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:23 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.17914.1759325528936938531
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Tc3K/D7S;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=qRP+Kjll;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101999ff9441f-e8260db0-9c60-4621-b5ac-b53ee1723df6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325537;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dFGivEpW2by1FwZ1R8zzQ/mMb/hvQAbhwUBUyLs5Dzk=;
	b=Tc3K/D7SDGPPb/JdZC3Xw4XsGxjSBYNtncH4pPBLgID/prGbU0zQKElFARqdeY8D
	Xq63IcbfvNG+2OktZ1ihfyGfgl7Jn2O9SYUD5YT1kbUDJbnjqfX2YDEqGvKv1CiU2Xc
	WQtrCyCABmpX9RZ9llUjOLQAGHjvNivxnxzE9RoM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325537;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dFGivEpW2by1FwZ1R8zzQ/mMb/hvQAbhwUBUyLs5Dzk=;
	b=qRP+KjllUHdPUKJftRlfw1xZxRjygyjpFMiMAQG6l09VLl6enSsHkZdmCJSAY1M2
	p3LQpw8G2VOLWuzPXbohIhxkDioUuTD8A6qLuGrGtdwsjI75UMSp3121ztpsjtNUDsd
	QfvSwynYJkPWGvfxiZUHsDgj+3vnB7nLs7LQ3UMs=
Content-Type: multipart/mixed; boundary="===============7747638078689439075=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-binary-native: upgrading to 1.25.1 SUCCEEDED
Message-ID: <010101999ff9441f-e8260db0-9c60-4621-b5ac-b53ee1723df6-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224231

--===============7747638078689439075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-binary-native* to *1.25.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-go-binary-native-upgrade-1.25.0-1.25.1.patch
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
From 06109a7e827fa62eeaf40da4a80bfb27615eefea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 08:35:48 +0000
Subject: [PATCH] go-binary-native: upgrade 1.25.0 -> 1.25.1

---
 ...{go-binary-native_1.25.0.bb => go-binary-native_1.25.1.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.0.bb => go-binary-native_1.25.1.bb} (79%)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.25.0.bb b/meta/recipes-devtools/go/go-binary-native_1.25.1.bb
similarity index 79%
rename from meta/recipes-devtools/go/go-binary-native_1.25.0.bb
rename to meta/recipes-devtools/go/go-binary-native_1.25.1.bb
index 2b9ad19d70..1cd3ddb25e 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.25.0.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.25.1.bb
@@ -9,9 +9,7 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "2852af0cb20a13139b3448992e69b868e50ed0f8a1e5940ee1de9e19a123b613"
-SRC_URI[go_linux_arm64.sha256sum] = "05de75d6994a2783699815ee553bd5a9327d8b79991de36e38b66862782f54ae"
-SRC_URI[go_linux_ppc64le.sha256sum] = "0f18a89e7576cf2c5fa0b487a1635d9bcbf843df5f110e9982c64df52a983ad0"
+SRC_URI[go_linux_amd64.sha256sum] = "7716a0d940a0f6ae8e1f3b3f4f36299dc53e31b16840dbd171254312c41ca12e"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
-- 
2.47.1


--===============7747638078689439075==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-binary-native-upgrade-1.25.0-1.25.1.patch"

RnJvbSAwNjEwOWE3ZTgyN2ZhNjJlZWFmNDBkYTRhODBiZmIyNzYxNWVlZmVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAwODozNTo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdv
LWJpbmFyeS1uYXRpdmU6IHVwZ3JhZGUgMS4yNS4wIC0+IDEuMjUuMQoKLS0tCiAuLi57Z28tYmlu
YXJ5LW5hdGl2ZV8xLjI1LjAuYmIgPT4gZ28tYmluYXJ5LW5hdGl2ZV8xLjI1LjEuYmJ9IHwgNCAr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL3tnby1iaW5hcnktbmF0aXZlXzEuMjUuMC5iYiA9
PiBnby1iaW5hcnktbmF0aXZlXzEuMjUuMS5iYn0gKDc5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ28vZ28tYmluYXJ5LW5hdGl2ZV8xLjI1LjAuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ28vZ28tYmluYXJ5LW5hdGl2ZV8xLjI1LjEuYmIKc2ltaWxhcml0eSBpbmRl
eCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRp
dmVfMS4yNS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tYmluYXJ5
LW5hdGl2ZV8xLjI1LjEuYmIKaW5kZXggMmI5YWQxOWQ3MC4uMWNkM2RkYjI1ZSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRpdmVfMS4yNS4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1iaW5hcnktbmF0aXZlXzEuMjUuMS5iYgpA
QCAtOSw5ICs5LDcgQEAgUFJPVklERVMgPSAiZ28tbmF0aXZlIgogCiAjIENoZWNrc3VtcyBhdmFp
bGFibGUgYXQgaHR0cHM6Ly9nby5kZXYvZGwvCiBTUkNfVVJJID0gImh0dHBzOi8vZGwuZ29vZ2xl
LmNvbS9nby9nbyR7UFZ9LiR7QlVJTERfR09PU30tJHtCVUlMRF9HT0FSQ0h9LnRhci5nejtuYW1l
PWdvXyR7QlVJTERfR09UVVBMRX0iCi1TUkNfVVJJW2dvX2xpbnV4X2FtZDY0LnNoYTI1NnN1bV0g
PSAiMjg1MmFmMGNiMjBhMTMxMzliMzQ0ODk5MmU2OWI4NjhlNTBlZDBmOGExZTU5NDBlZTFkZTll
MTlhMTIzYjYxMyIKLVNSQ19VUklbZ29fbGludXhfYXJtNjQuc2hhMjU2c3VtXSA9ICIwNWRlNzVk
Njk5NGEyNzgzNjk5ODE1ZWU1NTNiZDVhOTMyN2Q4Yjc5OTkxZGUzNmUzOGI2Njg2Mjc4MmY1NGFl
IgotU1JDX1VSSVtnb19saW51eF9wcGM2NGxlLnNoYTI1NnN1bV0gPSAiMGYxOGE4OWU3NTc2Y2Yy
YzVmYTBiNDg3YTE2MzVkOWJjYmY4NDNkZjVmMTEwZTk5ODJjNjRkZjUyYTk4M2FkMCIKK1NSQ19V
UklbZ29fbGludXhfYW1kNjQuc2hhMjU2c3VtXSA9ICI3NzE2YTBkOTQwYTBmNmFlOGUxZjNiM2Y0
ZjM2Mjk5ZGM1M2UzMWIxNjg0MGRiZDE3MTI1NDMxMmM0MWNhMTJlIgogCiBVUFNUUkVBTV9DSEVD
S19VUkkgPSAiaHR0cHM6Ly9nb2xhbmcub3JnL2RsLyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0g
ImdvKD9QPHB2ZXI+XGQrKFwuXGQrKSspXC5saW51eCIKLS0gCjIuNDcuMQoK

--===============7747638078689439075==--

