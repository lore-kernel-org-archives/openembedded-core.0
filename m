Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81D6CA9EBB
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 06:50:24 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2373.1791528618981423066
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 23:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Sz7Qb2rl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NUuglzm/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a11f6d48cd-00abac37-f5cd-447c-9ab1-700a0cb333c5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791528618;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=56/W6iebt7j4zHn1jpDnjZxveoddoHorDks+XODvIw4=;
	b=Sz7Qb2rltgOhsOrB0XUYAOFxyLb1h+zj0H1TgFODippwQNlgsUx50MibNmT3AA+7
	lJz0u4RTDbrqkk+oYsjBePpy++oqKrrekeS8FXZSZjJTnkzim7jlZ0Zm1MwCy+XJwTa
	Vc/GjhZ7qXNsPJpW2Bh+lZyuyQCOMHvnheEWYNks=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791528618;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=56/W6iebt7j4zHn1jpDnjZxveoddoHorDks+XODvIw4=;
	b=NUuglzm/7owx13/Sla5NpcyZH/H14KrY8R2Vr0rPsGUsij7FPSFN9Qgde84CQLL0
	PR55ePzuTYf0tlwxGvcrgPAwxsGJs8HhHmQjhFx7YJthOZvN6SDkMdxLGgNXGAnzlEq
	phsftPeKich7Ao9fSvroj3NdxjTkUcY7s8VXqiqs=
Content-Type: multipart/mixed; boundary="===============2096518505607423643=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-binary-native: upgrading to 1.27.2 SUCCEEDED
Message-ID: <010101a11f6d48cd-00abac37-f5cd-447c-9ab1-700a0cb333c5-000000@us-west-2.amazonses.com>
Date: Fri, 9 Oct 2026 06:50:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.09-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 06:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247458

--===============2096518505607423643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-binary-native* to *1.27.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-go-binary-native-upgrade-1.27.1-1.27.2.patch
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
From a6f7a3515601823b9b1ce743f9d44d78124a7db7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 9 Oct 2026 05:23:34 +0000
Subject: [PATCH] go-binary-native: upgrade 1.27.1 -> 1.27.2

---
 ...{go-binary-native_1.27.1.bb => go-binary-native_1.27.2.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.27.1.bb => go-binary-native_1.27.2.bb} (80%)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.27.1.bb b/meta/recipes-devtools/go/go-binary-native_1.27.2.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.27.1.bb
rename to meta/recipes-devtools/go/go-binary-native_1.27.2.bb
index f909581e49..4e5f585eee 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.27.1.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.27.2.bb
@@ -9,9 +9,7 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "63d339f0da5ab53635a56f2490a7984dfe12dfcff22ad749f63edaf590168445"
-SRC_URI[go_linux_arm64.sha256sum] = "3450b45a3f9ee8568792736a5c5e70a1f2e9b36c35a8f74958c03e51d7d92bec"
-SRC_URI[go_linux_ppc64le.sha256sum] = "ad1ff83c24f783c2d4a025852b928a05c199e8742a14a5482d88de0293d2bd0d"
+SRC_URI[go_linux_amd64.sha256sum] = "ecbadb99091a3f46e31f5f934b068b1864eafa7995211b39eaddf76996045fe5"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
-- 
2.47.1


--===============2096518505607423643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86_64-linux/go-binary-native (sysroot):
  /usr/lib/go/src/cmd/compile/internal/test/issue_81478_test.go was added
  /usr/lib/go/src/cmd/go/internal/modfetch/fetch_test.go was added
  /usr/lib/go/src/crypto/internal/fips140/mlkem/cast_test.go was added
  /usr/lib/go/src/net/http/http1_transport_test.go was added
  /usr/lib/go/test/fixedbugs/issue81089.go was added
  /usr/lib/go/test/fixedbugs/issue81240.go was added
  /usr/lib/go/test/fixedbugs/issue81242.go was added
  /usr/lib/go/test/fixedbugs/issue81612.go was added
  /usr/lib/go/test/fixedbugs/issue81687.go was added

--===============2096518505607423643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/go-binary-native (sysroot):
  /usr/lib/go/src/cmd/compile/internal/test/issue_81478_test.go was added
  /usr/lib/go/src/cmd/go/internal/modfetch/fetch_test.go was added
  /usr/lib/go/src/crypto/internal/fips140/mlkem/cast_test.go was added
  /usr/lib/go/src/net/http/http1_transport_test.go was added
  /usr/lib/go/test/fixedbugs/issue81089.go was added
  /usr/lib/go/test/fixedbugs/issue81240.go was added
  /usr/lib/go/test/fixedbugs/issue81242.go was added
  /usr/lib/go/test/fixedbugs/issue81612.go was added
  /usr/lib/go/test/fixedbugs/issue81687.go was added

--===============2096518505607423643==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-binary-native-upgrade-1.27.1-1.27.2.patch"

RnJvbSBhNmY3YTM1MTU2MDE4MjNiOWIxY2U3NDNmOWQ0NGQ3ODEyNGE3ZGI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgOSBPY3QgMjAyNiAwNToyMzozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdv
LWJpbmFyeS1uYXRpdmU6IHVwZ3JhZGUgMS4yNy4xIC0+IDEuMjcuMgoKLS0tCiAuLi57Z28tYmlu
YXJ5LW5hdGl2ZV8xLjI3LjEuYmIgPT4gZ28tYmluYXJ5LW5hdGl2ZV8xLjI3LjIuYmJ9IHwgNCAr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL3tnby1iaW5hcnktbmF0aXZlXzEuMjcuMS5iYiA9
PiBnby1iaW5hcnktbmF0aXZlXzEuMjcuMi5iYn0gKDgwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ28vZ28tYmluYXJ5LW5hdGl2ZV8xLjI3LjEuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ28vZ28tYmluYXJ5LW5hdGl2ZV8xLjI3LjIuYmIKc2ltaWxhcml0eSBpbmRl
eCA4MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRp
dmVfMS4yNy4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tYmluYXJ5
LW5hdGl2ZV8xLjI3LjIuYmIKaW5kZXggZjkwOTU4MWU0OS4uNGU1ZjU4NWVlZSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRpdmVfMS4yNy4xLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1iaW5hcnktbmF0aXZlXzEuMjcuMi5iYgpA
QCAtOSw5ICs5LDcgQEAgUFJPVklERVMgPSAiZ28tbmF0aXZlIgogCiAjIENoZWNrc3VtcyBhdmFp
bGFibGUgYXQgaHR0cHM6Ly9nby5kZXYvZGwvCiBTUkNfVVJJID0gImh0dHBzOi8vZGwuZ29vZ2xl
LmNvbS9nby9nbyR7UFZ9LiR7QlVJTERfR09PU30tJHtCVUlMRF9HT0FSQ0h9LnRhci5nejtuYW1l
PWdvXyR7QlVJTERfR09UVVBMRX0iCi1TUkNfVVJJW2dvX2xpbnV4X2FtZDY0LnNoYTI1NnN1bV0g
PSAiNjNkMzM5ZjBkYTVhYjUzNjM1YTU2ZjI0OTBhNzk4NGRmZTEyZGZjZmYyMmFkNzQ5ZjYzZWRh
ZjU5MDE2ODQ0NSIKLVNSQ19VUklbZ29fbGludXhfYXJtNjQuc2hhMjU2c3VtXSA9ICIzNDUwYjQ1
YTNmOWVlODU2ODc5MjczNmE1YzVlNzBhMWYyZTliMzZjMzVhOGY3NDk1OGMwM2U1MWQ3ZDkyYmVj
IgotU1JDX1VSSVtnb19saW51eF9wcGM2NGxlLnNoYTI1NnN1bV0gPSAiYWQxZmY4M2MyNGY3ODNj
MmQ0YTAyNTg1MmI5MjhhMDVjMTk5ZTg3NDJhMTRhNTQ4MmQ4OGRlMDI5M2QyYmQwZCIKK1NSQ19V
UklbZ29fbGludXhfYW1kNjQuc2hhMjU2c3VtXSA9ICJlY2JhZGI5OTA5MWEzZjQ2ZTMxZjVmOTM0
YjA2OGIxODY0ZWFmYTc5OTUyMTFiMzllYWRkZjc2OTk2MDQ1ZmU1IgogCiBVUFNUUkVBTV9DSEVD
S19VUkkgPSAiaHR0cHM6Ly9nb2xhbmcub3JnL2RsLyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0g
ImdvKD9QPHB2ZXI+XGQrKFwuXGQrKSspXC5saW51eCIKLS0gCjIuNDcuMQoK

--===============2096518505607423643==--

