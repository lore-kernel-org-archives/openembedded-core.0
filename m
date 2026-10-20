Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1940.1792480402927037329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 00:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JrLrtENC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rYxBmwna;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a1582859d1-23541e08-f63a-4776-baa6-0d0d3b6942c4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792480402;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vBLWdIBdWI6wK5cCXAqCe3ZRcklz7hvNgG9Zh7xxciI=;
	b=JrLrtENC3CKusE9nVxLXd1U/fl0GQd2BacOlQRllAK4FOG45L79JxLT+ZXg4f5uW
	AMGc/82HXTvW0xC9rF31z89MVQa5KNsqmSa0AWCurQ8vZ4iGvi7sCFCm6aaBgVvZKTt
	PrMBcIP4Ve9nH5ZUe7eNu1/ojEXI7wV6vaVMPsNY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792480402;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vBLWdIBdWI6wK5cCXAqCe3ZRcklz7hvNgG9Zh7xxciI=;
	b=rYxBmwnaaxRA2o6z11vk/OQhd5rPy3jLZqVpsc2OHumzLdgjGHWk4MaYc7WuBCWZ
	wd+t25wXgvwLPhC1NfinGwV8NJa+uiZZXwEcF9+f3rKjN2qco0Wc9Xdmrfgn6zQbLMD
	Rs4h8o82uVCjAjvKwLdPMMqc7NDTJagpn7PgQR+M=
Content-Type: multipart/mixed; boundary="===============6214564087785879024=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-binary-native: upgrading to 1.27.3 SUCCEEDED
Message-ID: <010101a1582859d1-23541e08-f63a-4776-baa6-0d0d3b6942c4-000000@us-west-2.amazonses.com>
Date: Tue, 20 Oct 2026 07:13:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.20-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248224

--===============6214564087785879024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-binary-native* to *1.27.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-go-binary-native-upgrade-1.27.2-1.27.3.patch
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
From aba61be4c4ff2e05cc0600008d7c0088451104da Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 20 Oct 2026 06:11:37 +0000
Subject: [PATCH] go-binary-native: upgrade 1.27.2 -> 1.27.3

---
 ...{go-binary-native_1.27.2.bb => go-binary-native_1.27.3.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.27.2.bb => go-binary-native_1.27.3.bb} (80%)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.27.2.bb b/meta/recipes-devtools/go/go-binary-native_1.27.3.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.27.2.bb
rename to meta/recipes-devtools/go/go-binary-native_1.27.3.bb
index 19482f79c4..6c1427f5ff 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.27.2.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.27.3.bb
@@ -9,9 +9,7 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "ecbadb99091a3f46e31f5f934b068b1864eafa7995211b39eaddf76996045fe5"
-SRC_URI[go_linux_arm64.sha256sum] = "94f3e30b8e374bc285e7dadc11e0865726b9bc6e85b841ccceaabc0214c6b7c8"
-SRC_URI[go_linux_ppc64le.sha256sum] = "059d5f01b1607a724ea5ae87c5589041a51c577a6f3f20099e49d00f31c803fa"
+SRC_URI[go_linux_amd64.sha256sum] = "65efbc80fdc1fa2cd2631cad5b481777a68e8725f34e89f50fc6ac714e379b40"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
-- 
2.47.1


--===============6214564087785879024==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-binary-native-upgrade-1.27.2-1.27.3.patch"

RnJvbSBhYmE2MWJlNGM0ZmYyZTA1Y2MwNjAwMDA4ZDdjMDA4ODQ1MTEwNGRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjAgT2N0IDIwMjYgMDY6MTE6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
by1iaW5hcnktbmF0aXZlOiB1cGdyYWRlIDEuMjcuMiAtPiAxLjI3LjMKCi0tLQogLi4ue2dvLWJp
bmFyeS1uYXRpdmVfMS4yNy4yLmJiID0+IGdvLWJpbmFyeS1uYXRpdmVfMS4yNy4zLmJifSB8IDQg
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby97Z28tYmluYXJ5LW5hdGl2ZV8xLjI3LjIuYmIg
PT4gZ28tYmluYXJ5LW5hdGl2ZV8xLjI3LjMuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRpdmVfMS4yNy4yLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRpdmVfMS4yNy4zLmJiCnNpbWlsYXJpdHkgaW5k
ZXggODAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1iaW5hcnktbmF0
aXZlXzEuMjcuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFy
eS1uYXRpdmVfMS4yNy4zLmJiCmluZGV4IDE5NDgyZjc5YzQuLjZjMTQyN2Y1ZmYgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1iaW5hcnktbmF0aXZlXzEuMjcuMi5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tYmluYXJ5LW5hdGl2ZV8xLjI3LjMuYmIK
QEAgLTksOSArOSw3IEBAIFBST1ZJREVTID0gImdvLW5hdGl2ZSIKIAogIyBDaGVja3N1bXMgYXZh
aWxhYmxlIGF0IGh0dHBzOi8vZ28uZGV2L2RsLwogU1JDX1VSSSA9ICJodHRwczovL2RsLmdvb2ds
ZS5jb20vZ28vZ28ke1BWfS4ke0JVSUxEX0dPT1N9LSR7QlVJTERfR09BUkNIfS50YXIuZ3o7bmFt
ZT1nb18ke0JVSUxEX0dPVFVQTEV9IgotU1JDX1VSSVtnb19saW51eF9hbWQ2NC5zaGEyNTZzdW1d
ID0gImVjYmFkYjk5MDkxYTNmNDZlMzFmNWY5MzRiMDY4YjE4NjRlYWZhNzk5NTIxMWIzOWVhZGRm
NzY5OTYwNDVmZTUiCi1TUkNfVVJJW2dvX2xpbnV4X2FybTY0LnNoYTI1NnN1bV0gPSAiOTRmM2Uz
MGI4ZTM3NGJjMjg1ZTdkYWRjMTFlMDg2NTcyNmI5YmM2ZTg1Yjg0MWNjY2VhYWJjMDIxNGM2Yjdj
OCIKLVNSQ19VUklbZ29fbGludXhfcHBjNjRsZS5zaGEyNTZzdW1dID0gIjA1OWQ1ZjAxYjE2MDdh
NzI0ZWE1YWU4N2M1NTg5MDQxYTUxYzU3N2E2ZjNmMjAwOTllNDlkMDBmMzFjODAzZmEiCitTUkNf
VVJJW2dvX2xpbnV4X2FtZDY0LnNoYTI1NnN1bV0gPSAiNjVlZmJjODBmZGMxZmEyY2QyNjMxY2Fk
NWI0ODE3NzdhNjhlODcyNWYzNGU4OWY1MGZjNmFjNzE0ZTM3OWI0MCIKIAogVVBTVFJFQU1fQ0hF
Q0tfVVJJID0gImh0dHBzOi8vZ29sYW5nLm9yZy9kbC8iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9
ICJnbyg/UDxwdmVyPlxkKyhcLlxkKykrKVwubGludXgiCi0tIAoyLjQ3LjEKCg==

--===============6214564087785879024==--
