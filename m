Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138E6C5B549
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:01 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.11253.1747312304889040180
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Q39jyki4;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=PDz9xoOy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010196d3edfcfe-61419adb-75e4-450d-8a23-a9b2ab9b6911-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312311;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LrmVqI3gx4hL2oanUJdknEcolhmk8UdfM7JVtKB5liQ=;
	b=Q39jyki4Nssvm0all4/gOaYsuhIagQQ3RUNz6yrU/z0zQVNxhQe9PdnIYcn+/Rzz
	cTWfJlYWcQu7cDCWu6gFsz/jW4L0sWsabXYxtadqBuLlBhugT1VDF3zx9i/G+QtCmMC
	3RtBVtler3AaW8vfLJ7YfQZOiXU3vlM55K69tlWo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312311;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LrmVqI3gx4hL2oanUJdknEcolhmk8UdfM7JVtKB5liQ=;
	b=PDz9xoOyKAq5J+SDWfFFj0Zs8c56MU7nG5pCU4zGb/JuNdWnh0Vi2lhmHGTWw0mM
	/vHpvhtC8GF9cgUmcAWwkQZeg+K2gSvRbWJDmxqq1FFtPZVPlCc/yMpGiwijW5rkwFm
	+ooSbIptLM1jkC/Oxj48Z3LHvO7AxWQEg/2fR11Y=
Content-Type: multipart/mixed; boundary="===============1528007038953851605=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-binary-native: upgrading to 1.24.3 SUCCEEDED
Message-ID: <01010196d3edfcfe-61419adb-75e4-450d-8a23-a9b2ab9b6911-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216600

--===============1528007038953851605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-binary-native* to *1.24.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-go-binary-native-upgrade-1.24.2-1.24.3.patch
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
From 5712ccbaae18ecc9cb7bdfcca6e9531ea6e8b3ce Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 07:42:31 +0000
Subject: [PATCH] go-binary-native: upgrade 1.24.2 -> 1.24.3

---
 ...{go-binary-native_1.24.2.bb => go-binary-native_1.24.3.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.24.2.bb => go-binary-native_1.24.3.bb} (78%)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.24.2.bb b/meta/recipes-devtools/go/go-binary-native_1.24.3.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.24.2.bb
rename to meta/recipes-devtools/go/go-binary-native_1.24.3.bb
index 690b8546cb..b88aa238f9 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.24.2.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.24.3.bb
@@ -9,9 +9,7 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "68097bd680839cbc9d464a0edce4f7c333975e27a90246890e9f1078c7e702ad"
-SRC_URI[go_linux_arm64.sha256sum] = "756274ea4b68fa5535eb9fe2559889287d725a8da63c6aae4d5f23778c229f4b"
-SRC_URI[go_linux_ppc64le.sha256sum] = "5fff857791d541c71d8ea0171c73f6f99770d15ff7e2ad979104856d01f36563"
+SRC_URI[go_linux_amd64.sha256sum] = "3333f6ea53afa971e9078895eaa4ac7204a8c6b5c68c10e6bc9a33e8e391bdd8"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
-- 
2.47.1


--===============1528007038953851605==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-binary-native-upgrade-1.24.2-1.24.3.patch"

RnJvbSA1NzEyY2NiYWFlMThlY2M5Y2I3YmRmY2NhNmU5NTMxZWE2ZThiM2NlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDc6NDI6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
by1iaW5hcnktbmF0aXZlOiB1cGdyYWRlIDEuMjQuMiAtPiAxLjI0LjMKCi0tLQogLi4ue2dvLWJp
bmFyeS1uYXRpdmVfMS4yNC4yLmJiID0+IGdvLWJpbmFyeS1uYXRpdmVfMS4yNC4zLmJifSB8IDQg
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby97Z28tYmluYXJ5LW5hdGl2ZV8xLjI0LjIuYmIg
PT4gZ28tYmluYXJ5LW5hdGl2ZV8xLjI0LjMuYmJ9ICg3OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRpdmVfMS4yNC4yLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRpdmVfMS4yNC4zLmJiCnNpbWlsYXJpdHkgaW5k
ZXggNzglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1iaW5hcnktbmF0
aXZlXzEuMjQuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFy
eS1uYXRpdmVfMS4yNC4zLmJiCmluZGV4IDY5MGI4NTQ2Y2IuLmI4OGFhMjM4ZjkgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1iaW5hcnktbmF0aXZlXzEuMjQuMi5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tYmluYXJ5LW5hdGl2ZV8xLjI0LjMuYmIK
QEAgLTksOSArOSw3IEBAIFBST1ZJREVTID0gImdvLW5hdGl2ZSIKIAogIyBDaGVja3N1bXMgYXZh
aWxhYmxlIGF0IGh0dHBzOi8vZ28uZGV2L2RsLwogU1JDX1VSSSA9ICJodHRwczovL2RsLmdvb2ds
ZS5jb20vZ28vZ28ke1BWfS4ke0JVSUxEX0dPT1N9LSR7QlVJTERfR09BUkNIfS50YXIuZ3o7bmFt
ZT1nb18ke0JVSUxEX0dPVFVQTEV9IgotU1JDX1VSSVtnb19saW51eF9hbWQ2NC5zaGEyNTZzdW1d
ID0gIjY4MDk3YmQ2ODA4MzljYmM5ZDQ2NGEwZWRjZTRmN2MzMzM5NzVlMjdhOTAyNDY4OTBlOWYx
MDc4YzdlNzAyYWQiCi1TUkNfVVJJW2dvX2xpbnV4X2FybTY0LnNoYTI1NnN1bV0gPSAiNzU2Mjc0
ZWE0YjY4ZmE1NTM1ZWI5ZmUyNTU5ODg5Mjg3ZDcyNWE4ZGE2M2M2YWFlNGQ1ZjIzNzc4YzIyOWY0
YiIKLVNSQ19VUklbZ29fbGludXhfcHBjNjRsZS5zaGEyNTZzdW1dID0gIjVmZmY4NTc3OTFkNTQx
YzcxZDhlYTAxNzFjNzNmNmY5OTc3MGQxNWZmN2UyYWQ5NzkxMDQ4NTZkMDFmMzY1NjMiCitTUkNf
VVJJW2dvX2xpbnV4X2FtZDY0LnNoYTI1NnN1bV0gPSAiMzMzM2Y2ZWE1M2FmYTk3MWU5MDc4ODk1
ZWFhNGFjNzIwNGE4YzZiNWM2OGMxMGU2YmM5YTMzZThlMzkxYmRkOCIKIAogVVBTVFJFQU1fQ0hF
Q0tfVVJJID0gImh0dHBzOi8vZ29sYW5nLm9yZy9kbC8iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9
ICJnbyg/UDxwdmVyPlxkKyhcLlxkKykrKVwubGludXgiCi0tIAoyLjQ3LjEKCg==

--===============1528007038953851605==--

