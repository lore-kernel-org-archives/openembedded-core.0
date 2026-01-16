Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9996D44C4C
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:52 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1474.1768526746643274091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UkPjsrGf;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=FzKp+zBJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019bc4689143-8acda0ab-370d-410d-a6d4-be160a2b9d31-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+6ZxML7IKQ5CMHUngfwOhhbybxvhRctkPFA/IBiMasI=;
	b=UkPjsrGfnfHs83+isjmmNNef0acH3RhQLeioezB40Ztt+lkLfl604VMQ3IbEUVYq
	5b9qOIl+2MZyYwJ1TWPIl8owiE0CEEUW7CB8xi5ZaIVipUimB0r9G4qi0p7TkpdRtfC
	cKp/JkwKDJJ36QInhLug2wHTlMQUdiBdEXqzQTTc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+6ZxML7IKQ5CMHUngfwOhhbybxvhRctkPFA/IBiMasI=;
	b=FzKp+zBJcpcelj+C4MlE8s9wbNXGqmTL8T/JNErmLEAA5u17i7gf5rjARS6Zp+nC
	mjLQJYrMy7VZCXJx6a/fCjgpY4cdfTL8PAG0FOEXiQlc/eHFg2EZOEz5tk/zSyhM49J
	8ErVsDX7EFY+3D3OnrZeH6tUKgo+KYYroD5vsEHY=
Content-Type: multipart/mixed; boundary="===============1393022159818603714=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-binary-native: upgrading to 1.25.6 SUCCEEDED
Message-ID: <0101019bc4689143-8acda0ab-370d-410d-a6d4-be160a2b9d31-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229460

--===============1393022159818603714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-binary-native* to *1.25.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-go-binary-native-upgrade-1.25.5-1.25.6.patch
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
From 40a5a446a878f74cfd025f6ce7999da768298def Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 20:29:23 +0000
Subject: [PATCH] go-binary-native: upgrade 1.25.5 -> 1.25.6

---
 ...{go-binary-native_1.25.5.bb => go-binary-native_1.25.6.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.5.bb => go-binary-native_1.25.6.bb} (79%)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.25.5.bb b/meta/recipes-devtools/go/go-binary-native_1.25.6.bb
similarity index 79%
rename from meta/recipes-devtools/go/go-binary-native_1.25.5.bb
rename to meta/recipes-devtools/go/go-binary-native_1.25.6.bb
index 5ecbca6d17..400355dc15 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.25.5.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.25.6.bb
@@ -9,9 +9,7 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "9e9b755d63b36acf30c12a9a3fc379243714c1c6d3dd72861da637f336ebb35b"
-SRC_URI[go_linux_arm64.sha256sum] = "b00b694903d126c588c378e72d3545549935d3982635ba3f7a964c9fa23fe3b9"
-SRC_URI[go_linux_ppc64le.sha256sum] = "f0904b647b5b8561efc5d48bb59a34f2b7996afab83ccd41c93b1aeb2c0067e4"
+SRC_URI[go_linux_amd64.sha256sum] = "f022b6aad78e362bcba9b0b94d09ad58c5a70c6ba3b7582905fababf5fe0181a"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
-- 
2.47.1


--===============1393022159818603714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/go-binary-native (sysroot):
  /usr/lib/go/test/fixedbugs/issue76950.go was added

--===============1393022159818603714==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-binary-native-upgrade-1.25.5-1.25.6.patch"

RnJvbSA0MGE1YTQ0NmE4NzhmNzRjZmQwMjVmNmNlNzk5OWRhNzY4Mjk4ZGVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjA6Mjk6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
by1iaW5hcnktbmF0aXZlOiB1cGdyYWRlIDEuMjUuNSAtPiAxLjI1LjYKCi0tLQogLi4ue2dvLWJp
bmFyeS1uYXRpdmVfMS4yNS41LmJiID0+IGdvLWJpbmFyeS1uYXRpdmVfMS4yNS42LmJifSB8IDQg
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby97Z28tYmluYXJ5LW5hdGl2ZV8xLjI1LjUuYmIg
PT4gZ28tYmluYXJ5LW5hdGl2ZV8xLjI1LjYuYmJ9ICg3OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRpdmVfMS4yNS41LmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRpdmVfMS4yNS42LmJiCnNpbWlsYXJpdHkgaW5k
ZXggNzklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1iaW5hcnktbmF0
aXZlXzEuMjUuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFy
eS1uYXRpdmVfMS4yNS42LmJiCmluZGV4IDVlY2JjYTZkMTcuLjQwMDM1NWRjMTUgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1iaW5hcnktbmF0aXZlXzEuMjUuNS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tYmluYXJ5LW5hdGl2ZV8xLjI1LjYuYmIK
QEAgLTksOSArOSw3IEBAIFBST1ZJREVTID0gImdvLW5hdGl2ZSIKIAogIyBDaGVja3N1bXMgYXZh
aWxhYmxlIGF0IGh0dHBzOi8vZ28uZGV2L2RsLwogU1JDX1VSSSA9ICJodHRwczovL2RsLmdvb2ds
ZS5jb20vZ28vZ28ke1BWfS4ke0JVSUxEX0dPT1N9LSR7QlVJTERfR09BUkNIfS50YXIuZ3o7bmFt
ZT1nb18ke0JVSUxEX0dPVFVQTEV9IgotU1JDX1VSSVtnb19saW51eF9hbWQ2NC5zaGEyNTZzdW1d
ID0gIjllOWI3NTVkNjNiMzZhY2YzMGMxMmE5YTNmYzM3OTI0MzcxNGMxYzZkM2RkNzI4NjFkYTYz
N2YzMzZlYmIzNWIiCi1TUkNfVVJJW2dvX2xpbnV4X2FybTY0LnNoYTI1NnN1bV0gPSAiYjAwYjY5
NDkwM2QxMjZjNTg4YzM3OGU3MmQzNTQ1NTQ5OTM1ZDM5ODI2MzViYTNmN2E5NjRjOWZhMjNmZTNi
OSIKLVNSQ19VUklbZ29fbGludXhfcHBjNjRsZS5zaGEyNTZzdW1dID0gImYwOTA0YjY0N2I1Yjg1
NjFlZmM1ZDQ4YmI1OWEzNGYyYjc5OTZhZmFiODNjY2Q0MWM5M2IxYWViMmMwMDY3ZTQiCitTUkNf
VVJJW2dvX2xpbnV4X2FtZDY0LnNoYTI1NnN1bV0gPSAiZjAyMmI2YWFkNzhlMzYyYmNiYTliMGI5
NGQwOWFkNThjNWE3MGM2YmEzYjc1ODI5MDVmYWJhYmY1ZmUwMTgxYSIKIAogVVBTVFJFQU1fQ0hF
Q0tfVVJJID0gImh0dHBzOi8vZ29sYW5nLm9yZy9kbC8iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9
ICJnbyg/UDxwdmVyPlxkKyhcLlxkKykrKVwubGludXgiCi0tIAoyLjQ3LjEKCg==

--===============1393022159818603714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86_64-linux/go-binary-native (sysroot):
  /usr/lib/go/test/fixedbugs/issue76950.go was added

--===============1393022159818603714==--

