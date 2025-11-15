Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B309CEBF80
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:41 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11938.1763224720703099286
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=soXYQaFN;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=BTEFAmVJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019a886212cd-dbb84103-eb06-477e-8990-f2f6d48dec97-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NPFZrd+enMSuToQJ9NYsctnq2fYedPDq6+ZlxBwopXg=;
	b=soXYQaFNtcTAQX68K8Bieyrsani2jY3oYPRSEldlRdsVGR6px8+yVQbPVBiROnKB
	6h+urKk9y/meEIjg4a5W04xbfaLENBNiYboeBjp1SK+bmLotzjGLLpF30VA7sL/N3BC
	EVSFi/k6t3C2hhh58lEhsjLc5PgYClF48p9q6oCk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NPFZrd+enMSuToQJ9NYsctnq2fYedPDq6+ZlxBwopXg=;
	b=BTEFAmVJ7bEEGbXUq5u6nXo8EqKswp2l2vclbxkAbKoeaZhuA2g5jnU51haMIICg
	gZWjukCmet76FSzvwSrXxMorBqbJVjoSXE7EdP4BOTBRXLmYS7ESOdYGWwQWXaqOb6g
	GYOq8QJ/QifztLXu5xRYvj1r7O6s9zwLB2gGsN/0=
Content-Type: multipart/mixed; boundary="===============6918367917759422144=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-binary-native: upgrading to 1.25.4 SUCCEEDED
Message-ID: <0101019a886212cd-dbb84103-eb06-477e-8990-f2f6d48dec97-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226341

--===============6918367917759422144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-binary-native* to *1.25.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-go-binary-native-upgrade-1.25.3-1.25.4.patch
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
From 36b8f6f334a787a3eeb9f6c346bbfbc5cace7e23 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 09:25:28 +0000
Subject: [PATCH] go-binary-native: upgrade 1.25.3 -> 1.25.4

---
 ...{go-binary-native_1.25.3.bb => go-binary-native_1.25.4.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.3.bb => go-binary-native_1.25.4.bb} (79%)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.25.3.bb b/meta/recipes-devtools/go/go-binary-native_1.25.4.bb
similarity index 79%
rename from meta/recipes-devtools/go/go-binary-native_1.25.3.bb
rename to meta/recipes-devtools/go/go-binary-native_1.25.4.bb
index b1d9522cb6..15c38ff0dc 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.25.3.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.25.4.bb
@@ -9,9 +9,7 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "0335f314b6e7bfe08c3d0cfaa7c19db961b7b99fb20be62b0a826c992ad14e0f"
-SRC_URI[go_linux_arm64.sha256sum] = "1d42ebc84999b5e2069f5e31b67d6fc5d67308adad3e178d5a2ee2c9ff2001f5"
-SRC_URI[go_linux_ppc64le.sha256sum] = "68d1a08bf3567f330717d821b266a0be1c5080bd05dc238b5a43a24ca0c47d7c"
+SRC_URI[go_linux_amd64.sha256sum] = "9fa5ffeda4170de60f67f3aa0f824e426421ba724c21e133c1e35d6159ca1bec"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
-- 
2.47.1


--===============6918367917759422144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86_64-linux/go-binary-native (sysroot):
  /usr/lib/go/test/fixedbugs/issue76008.go was added
  /usr/lib/go/src/crypto/internal/fips140/subtle/xor_mips64x.s was removed
  /usr/lib/go/src/crypto/internal/fips140/subtle/xor_mipsx.s was removed

--===============6918367917759422144==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-binary-native-upgrade-1.25.3-1.25.4.patch"

RnJvbSAzNmI4ZjZmMzM0YTc4N2EzZWViOWY2YzM0NmJiZmJjNWNhY2U3ZTIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDk6MjU6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
by1iaW5hcnktbmF0aXZlOiB1cGdyYWRlIDEuMjUuMyAtPiAxLjI1LjQKCi0tLQogLi4ue2dvLWJp
bmFyeS1uYXRpdmVfMS4yNS4zLmJiID0+IGdvLWJpbmFyeS1uYXRpdmVfMS4yNS40LmJifSB8IDQg
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby97Z28tYmluYXJ5LW5hdGl2ZV8xLjI1LjMuYmIg
PT4gZ28tYmluYXJ5LW5hdGl2ZV8xLjI1LjQuYmJ9ICg3OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRpdmVfMS4yNS4zLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRpdmVfMS4yNS40LmJiCnNpbWlsYXJpdHkgaW5k
ZXggNzklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1iaW5hcnktbmF0
aXZlXzEuMjUuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFy
eS1uYXRpdmVfMS4yNS40LmJiCmluZGV4IGIxZDk1MjJjYjYuLjE1YzM4ZmYwZGMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1iaW5hcnktbmF0aXZlXzEuMjUuMy5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tYmluYXJ5LW5hdGl2ZV8xLjI1LjQuYmIK
QEAgLTksOSArOSw3IEBAIFBST1ZJREVTID0gImdvLW5hdGl2ZSIKIAogIyBDaGVja3N1bXMgYXZh
aWxhYmxlIGF0IGh0dHBzOi8vZ28uZGV2L2RsLwogU1JDX1VSSSA9ICJodHRwczovL2RsLmdvb2ds
ZS5jb20vZ28vZ28ke1BWfS4ke0JVSUxEX0dPT1N9LSR7QlVJTERfR09BUkNIfS50YXIuZ3o7bmFt
ZT1nb18ke0JVSUxEX0dPVFVQTEV9IgotU1JDX1VSSVtnb19saW51eF9hbWQ2NC5zaGEyNTZzdW1d
ID0gIjAzMzVmMzE0YjZlN2JmZTA4YzNkMGNmYWE3YzE5ZGI5NjFiN2I5OWZiMjBiZTYyYjBhODI2
Yzk5MmFkMTRlMGYiCi1TUkNfVVJJW2dvX2xpbnV4X2FybTY0LnNoYTI1NnN1bV0gPSAiMWQ0MmVi
Yzg0OTk5YjVlMjA2OWY1ZTMxYjY3ZDZmYzVkNjczMDhhZGFkM2UxNzhkNWEyZWUyYzlmZjIwMDFm
NSIKLVNSQ19VUklbZ29fbGludXhfcHBjNjRsZS5zaGEyNTZzdW1dID0gIjY4ZDFhMDhiZjM1Njdm
MzMwNzE3ZDgyMWIyNjZhMGJlMWM1MDgwYmQwNWRjMjM4YjVhNDNhMjRjYTBjNDdkN2MiCitTUkNf
VVJJW2dvX2xpbnV4X2FtZDY0LnNoYTI1NnN1bV0gPSAiOWZhNWZmZWRhNDE3MGRlNjBmNjdmM2Fh
MGY4MjRlNDI2NDIxYmE3MjRjMjFlMTMzYzFlMzVkNjE1OWNhMWJlYyIKIAogVVBTVFJFQU1fQ0hF
Q0tfVVJJID0gImh0dHBzOi8vZ29sYW5nLm9yZy9kbC8iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9
ICJnbyg/UDxwdmVyPlxkKyhcLlxkKykrKVwubGludXgiCi0tIAoyLjQ3LjEKCg==

--===============6918367917759422144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/go-binary-native (sysroot):
  /usr/lib/go/test/fixedbugs/issue76008.go was added
  /usr/lib/go/src/crypto/internal/fips140/subtle/xor_mips64x.s was removed
  /usr/lib/go/src/crypto/internal/fips140/subtle/xor_mipsx.s was removed

--===============6918367917759422144==--

