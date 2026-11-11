Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3798.1794377110492844090
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 22:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Gj9nZ+vT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ago1PzGU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1c935d070-9ee5c35e-f3a8-40d0-9c54-645aa85878c4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794377109;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=d50k5ZZbh6p0t/ZFtH9LoKnSn/vbBRlOKYYjEgU3t3U=;
	b=Gj9nZ+vTnT7egIRg0pbaHHE0mfiqh0zaU9mn22xtfCRUtNHyc/Ge/lJwAQ4EC94e
	bBPRCNfH0abIwfWenAbFjz+LcUyA3z23ygt7El5m9ggVPzAhqleNxu2EbPjicsipAgc
	DbEH3SXDTu/I/luinrOKbn76k9pBDPp0uFe+Whwg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794377109;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=d50k5ZZbh6p0t/ZFtH9LoKnSn/vbBRlOKYYjEgU3t3U=;
	b=Ago1PzGU5MsnsEdWg3JJaMbKC3gmxwUxpzx6cFdyDA3TnxhrpHypb3nxQiF30uxQ
	jDCL4ZuAh3skIlrSm0NiOXizoODJWTYqfOFP1D9VVAyYNR08trttxIAGWCzPFaG09wl
	yCePsEY1rKIU7tiP4naZAHg80WOhYAQAzviOUF44=
Content-Type: multipart/mixed; boundary="===============1593845870481950523=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-binary-native: upgrading to 1.27.4 SUCCEEDED
Message-ID: <010101a1c935d070-9ee5c35e-f3a8-40d0-9c54-645aa85878c4-000000@us-west-2.amazonses.com>
Date: Wed, 11 Nov 2026 06:05:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.11-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249955

--===============1593845870481950523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-binary-native* to *1.27.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-go-binary-native-upgrade-1.27.3-1.27.4.patch
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
From a665e71d3ad9970ef55b2cbac808a4a7c5424534 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 11 Nov 2026 05:17:11 +0000
Subject: [PATCH] go-binary-native: upgrade 1.27.3 -> 1.27.4

---
 ...{go-binary-native_1.27.3.bb => go-binary-native_1.27.4.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.27.3.bb => go-binary-native_1.27.4.bb} (80%)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.27.3.bb b/meta/recipes-devtools/go/go-binary-native_1.27.4.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.27.3.bb
rename to meta/recipes-devtools/go/go-binary-native_1.27.4.bb
index c245af8fb8..1c7104d29a 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.27.3.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.27.4.bb
@@ -9,9 +9,7 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "65efbc80fdc1fa2cd2631cad5b481777a68e8725f34e89f50fc6ac714e379b40"
-SRC_URI[go_linux_arm64.sha256sum] = "a06e99309dbcbdca1a8ccd2282c3ee146e55930886e26b4f1193269587165f49"
-SRC_URI[go_linux_ppc64le.sha256sum] = "f180f01943865b7942ab3b4acbab6da6f0f669b61da999d004d16c537a49f7b5"
+SRC_URI[go_linux_amd64.sha256sum] = "7226736c2339719cda28fbf3a54d71aa63bcefe376e98cef00034268dab24840"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
-- 
2.47.1


--===============1593845870481950523==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-binary-native-upgrade-1.27.3-1.27.4.patch"

RnJvbSBhNjY1ZTcxZDNhZDk5NzBlZjU1YjJjYmFjODA4YTRhN2M1NDI0NTM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTEgTm92IDIwMjYgMDU6MTc6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
by1iaW5hcnktbmF0aXZlOiB1cGdyYWRlIDEuMjcuMyAtPiAxLjI3LjQKCi0tLQogLi4ue2dvLWJp
bmFyeS1uYXRpdmVfMS4yNy4zLmJiID0+IGdvLWJpbmFyeS1uYXRpdmVfMS4yNy40LmJifSB8IDQg
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby97Z28tYmluYXJ5LW5hdGl2ZV8xLjI3LjMuYmIg
PT4gZ28tYmluYXJ5LW5hdGl2ZV8xLjI3LjQuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRpdmVfMS4yNy4zLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRpdmVfMS4yNy40LmJiCnNpbWlsYXJpdHkgaW5k
ZXggODAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1iaW5hcnktbmF0
aXZlXzEuMjcuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFy
eS1uYXRpdmVfMS4yNy40LmJiCmluZGV4IGMyNDVhZjhmYjguLjFjNzEwNGQyOWEgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1iaW5hcnktbmF0aXZlXzEuMjcuMy5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tYmluYXJ5LW5hdGl2ZV8xLjI3LjQuYmIK
QEAgLTksOSArOSw3IEBAIFBST1ZJREVTID0gImdvLW5hdGl2ZSIKIAogIyBDaGVja3N1bXMgYXZh
aWxhYmxlIGF0IGh0dHBzOi8vZ28uZGV2L2RsLwogU1JDX1VSSSA9ICJodHRwczovL2RsLmdvb2ds
ZS5jb20vZ28vZ28ke1BWfS4ke0JVSUxEX0dPT1N9LSR7QlVJTERfR09BUkNIfS50YXIuZ3o7bmFt
ZT1nb18ke0JVSUxEX0dPVFVQTEV9IgotU1JDX1VSSVtnb19saW51eF9hbWQ2NC5zaGEyNTZzdW1d
ID0gIjY1ZWZiYzgwZmRjMWZhMmNkMjYzMWNhZDViNDgxNzc3YTY4ZTg3MjVmMzRlODlmNTBmYzZh
YzcxNGUzNzliNDAiCi1TUkNfVVJJW2dvX2xpbnV4X2FybTY0LnNoYTI1NnN1bV0gPSAiYTA2ZTk5
MzA5ZGJjYmRjYTFhOGNjZDIyODJjM2VlMTQ2ZTU1OTMwODg2ZTI2YjRmMTE5MzI2OTU4NzE2NWY0
OSIKLVNSQ19VUklbZ29fbGludXhfcHBjNjRsZS5zaGEyNTZzdW1dID0gImYxODBmMDE5NDM4NjVi
Nzk0MmFiM2I0YWNiYWI2ZGE2ZjBmNjY5YjYxZGE5OTlkMDA0ZDE2YzUzN2E0OWY3YjUiCitTUkNf
VVJJW2dvX2xpbnV4X2FtZDY0LnNoYTI1NnN1bV0gPSAiNzIyNjczNmMyMzM5NzE5Y2RhMjhmYmYz
YTU0ZDcxYWE2M2JjZWZlMzc2ZTk4Y2VmMDAwMzQyNjhkYWIyNDg0MCIKIAogVVBTVFJFQU1fQ0hF
Q0tfVVJJID0gImh0dHBzOi8vZ29sYW5nLm9yZy9kbC8iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9
ICJnbyg/UDxwdmVyPlxkKyhcLlxkKykrKVwubGludXgiCi0tIAoyLjQ3LjEKCg==

--===============1593845870481950523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/go-binary-native (sysroot):
  /usr/lib/go/src/cmd/compile/internal/types2/methodorder_test.go was added
  /usr/lib/go/test/fixedbugs/issue81863.go was added

--===============1593845870481950523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86_64-linux/go-binary-native (sysroot):
  /usr/lib/go/src/cmd/compile/internal/types2/methodorder_test.go was added
  /usr/lib/go/test/fixedbugs/issue81863.go was added

--===============1593845870481950523==--
