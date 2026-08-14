Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A010C5DF6E
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 06:36:47 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7565.1786689400944790736
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 23:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FLO0DL//;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QhhWjJ5W;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019ffefcac84-330e340f-70cb-4c0e-9479-f9b9dff6625b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786689400;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uzNfM7UgYX11iiM8hQvu9TFFuqUFezN0s8ywe7dq4Ww=;
	b=FLO0DL//+xqL+hVj7i5RYslT9Y9ugxDU03/20xFH5Vq94fhUtEV31oZU+UtsbgGN
	f5UsXi7HLijuQMOBcPrjeTHuEcy4PnSHYkSwxODztaGIAbIcPMX3hpGah54asGpAPzK
	yVmXXdY4Y8Q1m2hKFz+L7oeUKfkBxFQp7I02i2PM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786689400;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uzNfM7UgYX11iiM8hQvu9TFFuqUFezN0s8ywe7dq4Ww=;
	b=QhhWjJ5Wkbq5RCnbtOjHe9A7z7q5hR65lyqAC493bVPCjgD/f2zLcb7FLx7dgg3j
	LbKxRRxYDT/NlpZdWpXF48d0yPZhrVqmz29GkunBMWK9r5QmbLpw2vq5kpZolms6q7p
	vtHwdoWBvZFW6JCTtrUqj5usJ2e3XEvNF/Ovo7pc=
Content-Type: multipart/mixed; boundary="===============6598681899195813433=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-binary-native: upgrading to 1.26.6 SUCCEEDED
Message-ID: <0101019ffefcac84-330e340f-70cb-4c0e-9479-f9b9dff6625b-000000@us-west-2.amazonses.com>
Date: Fri, 14 Aug 2026 06:36:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.14-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 06:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243408

--===============6598681899195813433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-binary-native* to *1.26.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-go-binary-native-upgrade-1.26.5-1.26.6.patch
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
From 8ef377a41bf2a9ed494d14743ea3766521fc015f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 14 Aug 2026 05:17:07 +0000
Subject: [PATCH] go-binary-native: upgrade 1.26.5 -> 1.26.6

---
 ...{go-binary-native_1.26.5.bb => go-binary-native_1.26.6.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.5.bb => go-binary-native_1.26.6.bb} (80%)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.26.5.bb b/meta/recipes-devtools/go/go-binary-native_1.26.6.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.26.5.bb
rename to meta/recipes-devtools/go/go-binary-native_1.26.6.bb
index 97a8270be2..330b33149c 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.26.5.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.26.6.bb
@@ -9,9 +9,7 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "5c2c3b16caefa1d968a94c1daca04a7ca301a496d9b086e17ad77bb81393f053"
-SRC_URI[go_linux_arm64.sha256sum] = "fe4789e92b1f33358680864bbe8704289e7bb5fc207d80623c308935bd696d49"
-SRC_URI[go_linux_ppc64le.sha256sum] = "c5d60e2b303bb612f20cd82786594b64874e73b35134025e27d3390bf284ae43"
+SRC_URI[go_linux_amd64.sha256sum] = "708effb774be8237570d0add163225abbdfaf4fca28b2611df167beba4feef89"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
-- 
2.47.1


--===============6598681899195813433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/go-binary-native (sysroot):
  /usr/lib/go/test/fixedbugs/issue79874.go was added
  /usr/lib/go/test/fixedbugs/issue80097.go was added
  /usr/lib/go/test/fixedbugs/issue80127.go was added
  /usr/lib/go/test/fixedbugs/issue80188.go was added
  /usr/lib/go/test/fixedbugs/issue80517_1.go was added
  /usr/lib/go/test/fixedbugs/issue80517_2.go was added
  /usr/lib/go/test/fixedbugs/issue80517_3.go was added
  /usr/lib/go/test/fixedbugs/issue80577.go was added

--===============6598681899195813433==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-binary-native-upgrade-1.26.5-1.26.6.patch"

RnJvbSA4ZWYzNzdhNDFiZjJhOWVkNDk0ZDE0NzQzZWEzNzY2NTIxZmMwMTVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTQgQXVnIDIwMjYgMDU6MTc6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
by1iaW5hcnktbmF0aXZlOiB1cGdyYWRlIDEuMjYuNSAtPiAxLjI2LjYKCi0tLQogLi4ue2dvLWJp
bmFyeS1uYXRpdmVfMS4yNi41LmJiID0+IGdvLWJpbmFyeS1uYXRpdmVfMS4yNi42LmJifSB8IDQg
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby97Z28tYmluYXJ5LW5hdGl2ZV8xLjI2LjUuYmIg
PT4gZ28tYmluYXJ5LW5hdGl2ZV8xLjI2LjYuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRpdmVfMS4yNi41LmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRpdmVfMS4yNi42LmJiCnNpbWlsYXJpdHkgaW5k
ZXggODAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1iaW5hcnktbmF0
aXZlXzEuMjYuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFy
eS1uYXRpdmVfMS4yNi42LmJiCmluZGV4IDk3YTgyNzBiZTIuLjMzMGIzMzE0OWMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1iaW5hcnktbmF0aXZlXzEuMjYuNS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tYmluYXJ5LW5hdGl2ZV8xLjI2LjYuYmIK
QEAgLTksOSArOSw3IEBAIFBST1ZJREVTID0gImdvLW5hdGl2ZSIKIAogIyBDaGVja3N1bXMgYXZh
aWxhYmxlIGF0IGh0dHBzOi8vZ28uZGV2L2RsLwogU1JDX1VSSSA9ICJodHRwczovL2RsLmdvb2ds
ZS5jb20vZ28vZ28ke1BWfS4ke0JVSUxEX0dPT1N9LSR7QlVJTERfR09BUkNIfS50YXIuZ3o7bmFt
ZT1nb18ke0JVSUxEX0dPVFVQTEV9IgotU1JDX1VSSVtnb19saW51eF9hbWQ2NC5zaGEyNTZzdW1d
ID0gIjVjMmMzYjE2Y2FlZmExZDk2OGE5NGMxZGFjYTA0YTdjYTMwMWE0OTZkOWIwODZlMTdhZDc3
YmI4MTM5M2YwNTMiCi1TUkNfVVJJW2dvX2xpbnV4X2FybTY0LnNoYTI1NnN1bV0gPSAiZmU0Nzg5
ZTkyYjFmMzMzNTg2ODA4NjRiYmU4NzA0Mjg5ZTdiYjVmYzIwN2Q4MDYyM2MzMDg5MzViZDY5NmQ0
OSIKLVNSQ19VUklbZ29fbGludXhfcHBjNjRsZS5zaGEyNTZzdW1dID0gImM1ZDYwZTJiMzAzYmI2
MTJmMjBjZDgyNzg2NTk0YjY0ODc0ZTczYjM1MTM0MDI1ZTI3ZDMzOTBiZjI4NGFlNDMiCitTUkNf
VVJJW2dvX2xpbnV4X2FtZDY0LnNoYTI1NnN1bV0gPSAiNzA4ZWZmYjc3NGJlODIzNzU3MGQwYWRk
MTYzMjI1YWJiZGZhZjRmY2EyOGIyNjExZGYxNjdiZWJhNGZlZWY4OSIKIAogVVBTVFJFQU1fQ0hF
Q0tfVVJJID0gImh0dHBzOi8vZ29sYW5nLm9yZy9kbC8iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9
ICJnbyg/UDxwdmVyPlxkKyhcLlxkKykrKVwubGludXgiCi0tIAoyLjQ3LjEKCg==

--===============6598681899195813433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86_64-linux/go-binary-native (sysroot):
  /usr/lib/go/test/fixedbugs/issue79874.go was added
  /usr/lib/go/test/fixedbugs/issue80097.go was added
  /usr/lib/go/test/fixedbugs/issue80127.go was added
  /usr/lib/go/test/fixedbugs/issue80188.go was added
  /usr/lib/go/test/fixedbugs/issue80517_1.go was added
  /usr/lib/go/test/fixedbugs/issue80517_2.go was added
  /usr/lib/go/test/fixedbugs/issue80517_3.go was added
  /usr/lib/go/test/fixedbugs/issue80577.go was added

--===============6598681899195813433==--

