Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7050CAC5B7
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:48 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.30922.1757937279454211387
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=wfjZn61A;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=axm+s6YN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101994d3a1d36-841ca935-7342-4550-891c-74de250e2ac9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937278;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BNWGCdpqZPOCN4Zt3JpXw4T0Rzcrz4VDHy3soA+FjRA=;
	b=wfjZn61AIVlpg4+Z+ilHcWkdMUxE+4rGjoO236ckK67Dp1KPVWG9y/5rjniu8Sup
	AG1+0HRoP96l43CCIKzhDQxlwSlUFTtOBusI41sCe/9pjsUnBJQRob2e+xuJFLlSOju
	x3q1lxHK/Mx3wSIfDECf20+0PwEKVLqvRpjsIu3U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937278;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BNWGCdpqZPOCN4Zt3JpXw4T0Rzcrz4VDHy3soA+FjRA=;
	b=axm+s6YNKsnh43rykWBuCsn7bR515xlmkZ3Fj6MU5GSiQwEmCrZRfmnaXs9VvLlB
	wsVrwDnKYGfJdpMJIbUhRv4/gYKhNiAF1uyOkeGZc3gb1WErIKyF20k7SFyYhlep4iO
	kGQyYrqbFsr4igcgeyO5tCL+jn68mXWSMJlk/8xc=
Content-Type: multipart/mixed; boundary="===============6151369090909122978=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-binary-native: upgrading to 1.25.1 SUCCEEDED
Message-ID: <010101994d3a1d36-841ca935-7342-4550-891c-74de250e2ac9-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223418

--===============6151369090909122978==
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
From a31e1e5a7d0e9015f13ae9104075988a9c5b03fe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 07:51:05 +0000
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


--===============6151369090909122978==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-binary-native-upgrade-1.25.0-1.25.1.patch"

RnJvbSBhMzFlMWU1YTdkMGU5MDE1ZjEzYWU5MTA0MDc1OTg4YTljNWIwM2ZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMDc6NTE6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
by1iaW5hcnktbmF0aXZlOiB1cGdyYWRlIDEuMjUuMCAtPiAxLjI1LjEKCi0tLQogLi4ue2dvLWJp
bmFyeS1uYXRpdmVfMS4yNS4wLmJiID0+IGdvLWJpbmFyeS1uYXRpdmVfMS4yNS4xLmJifSB8IDQg
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby97Z28tYmluYXJ5LW5hdGl2ZV8xLjI1LjAuYmIg
PT4gZ28tYmluYXJ5LW5hdGl2ZV8xLjI1LjEuYmJ9ICg3OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRpdmVfMS4yNS4wLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRpdmVfMS4yNS4xLmJiCnNpbWlsYXJpdHkgaW5k
ZXggNzklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1iaW5hcnktbmF0
aXZlXzEuMjUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFy
eS1uYXRpdmVfMS4yNS4xLmJiCmluZGV4IDJiOWFkMTlkNzAuLjFjZDNkZGIyNWUgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1iaW5hcnktbmF0aXZlXzEuMjUuMC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tYmluYXJ5LW5hdGl2ZV8xLjI1LjEuYmIK
QEAgLTksOSArOSw3IEBAIFBST1ZJREVTID0gImdvLW5hdGl2ZSIKIAogIyBDaGVja3N1bXMgYXZh
aWxhYmxlIGF0IGh0dHBzOi8vZ28uZGV2L2RsLwogU1JDX1VSSSA9ICJodHRwczovL2RsLmdvb2ds
ZS5jb20vZ28vZ28ke1BWfS4ke0JVSUxEX0dPT1N9LSR7QlVJTERfR09BUkNIfS50YXIuZ3o7bmFt
ZT1nb18ke0JVSUxEX0dPVFVQTEV9IgotU1JDX1VSSVtnb19saW51eF9hbWQ2NC5zaGEyNTZzdW1d
ID0gIjI4NTJhZjBjYjIwYTEzMTM5YjM0NDg5OTJlNjliODY4ZTUwZWQwZjhhMWU1OTQwZWUxZGU5
ZTE5YTEyM2I2MTMiCi1TUkNfVVJJW2dvX2xpbnV4X2FybTY0LnNoYTI1NnN1bV0gPSAiMDVkZTc1
ZDY5OTRhMjc4MzY5OTgxNWVlNTUzYmQ1YTkzMjdkOGI3OTk5MWRlMzZlMzhiNjY4NjI3ODJmNTRh
ZSIKLVNSQ19VUklbZ29fbGludXhfcHBjNjRsZS5zaGEyNTZzdW1dID0gIjBmMThhODllNzU3NmNm
MmM1ZmEwYjQ4N2ExNjM1ZDliY2JmODQzZGY1ZjExMGU5OTgyYzY0ZGY1MmE5ODNhZDAiCitTUkNf
VVJJW2dvX2xpbnV4X2FtZDY0LnNoYTI1NnN1bV0gPSAiNzcxNmEwZDk0MGEwZjZhZThlMWYzYjNm
NGYzNjI5OWRjNTNlMzFiMTY4NDBkYmQxNzEyNTQzMTJjNDFjYTEyZSIKIAogVVBTVFJFQU1fQ0hF
Q0tfVVJJID0gImh0dHBzOi8vZ29sYW5nLm9yZy9kbC8iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9
ICJnbyg/UDxwdmVyPlxkKyhcLlxkKykrKVwubGludXgiCi0tIAoyLjQ3LjEKCg==

--===============6151369090909122978==--

