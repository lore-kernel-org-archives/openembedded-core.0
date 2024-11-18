Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF72D6004C
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:00 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.4799.1731964615480050437
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=TB30GMx9;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ab67bYrR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101934122c958-8de0020a-2632-4127-bee3-4c1a3f0fe22e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964619;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q2S4RgnsESCMJ+UmbeJwOoUMfhmRoZh6yEgzIfokvGk=;
	b=TB30GMx9s6AD31OPsQ6IWsz2Pq3mButnvFwJTPxKK4UFaelwN3dXRTQl2xgrpmEl
	paGhUH8k59Sr71Y926atnZU47W7WxRhgAUZuIMncTA0roji7Tmn1yRqMey/OOc+1xYd
	gHaJ8wr5tvZa5MI003YyOd92Ei3iN9gjciCJ5WtI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964619;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q2S4RgnsESCMJ+UmbeJwOoUMfhmRoZh6yEgzIfokvGk=;
	b=ab67bYrRK6wV9tjrG/dFqa0zr7CxNSVlU4B5SSlUI9OwbCi7dk1kfX6nQG4rxj5q
	3SgIMtLbNQN0Wu7X9EKKvg6ibuAMSepBgq0YvgptFzLVsBTUsOu0kw6TrkEhjMhRp6k
	LmHIwf4HzO0vLlPL5J4R51U3y9E7N9HblDB14bEE=
Content-Type: multipart/mixed; boundary="===============4327364327068800655=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 19.1.3 SUCCEEDED
Message-ID: <010101934122c958-8de0020a-2632-4127-bee3-4c1a3f0fe22e-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207265

--===============4327364327068800655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *llvm* to *19.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-llvm-upgrade-19.1.2-19.1.3.patch
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
From b875c209600f9f980d9b2bb18bc238690d648d57 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 17:09:27 +0000
Subject: [PATCH] llvm: upgrade 19.1.2 -> 19.1.3

---
 ...tcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch | 4 ++--
 .../llvm/0007-llvm-allow-env-override-of-exe-path.patch  | 9 ++++-----
 .../llvm/{llvm_19.1.2.bb => llvm_19.1.3.bb}              | 4 +++-
 3 files changed, 9 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/llvm/{llvm_19.1.2.bb => llvm_19.1.3.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
index a5c53b6657..61b7ccf222 100644
--- a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -1,4 +1,4 @@
-From 3b30a9bda88374e8f03bf96e972aee5bd214b98b Mon Sep 17 00:00:00 2001
+From 626a8f05aa83cedbd3fbdcdc1ab70ab17318e54d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 27 Nov 2020 10:11:08 +0000
 Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-index 73724e662f9e..1ca9c73415db 100644
+index 5035ef527..03fc84203 100644
 --- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 +++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 @@ -361,7 +361,10 @@ public:
diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
index add38b3bb4..4fd04510c0 100644
--- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
+++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
@@ -1,4 +1,4 @@
-From 588a8694c6540e31140c7e242bfb5e279d6ca08c Mon Sep 17 00:00:00 2001
+From 4cf88118d059a5001fa0c4046cc47b1088d94031 Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 19 May 2017 00:22:57 -0700
 Subject: [PATCH] llvm: allow env override of exe and libdir path
@@ -13,11 +13,11 @@ Upstream-Status: Inappropriate [OE-specific]
 Signed-off-by: Martin Kelly <mkelly@xevo.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- llvm/tools/llvm-config/llvm-config.cpp | 25 +++++++++++++++++++------
- 1 file changed, 19 insertions(+), 6 deletions(-)
+ llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
+ 1 file changed, 7 insertions(+)
 
 diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
-index e86eb2b44b10..7b2abf318dbe 100644
+index d5b76b1bb..6c28c34bc 100644
 --- a/llvm/tools/llvm-config/llvm-config.cpp
 +++ b/llvm/tools/llvm-config/llvm-config.cpp
 @@ -246,6 +246,13 @@ Typical components:\n\
@@ -34,4 +34,3 @@ index e86eb2b44b10..7b2abf318dbe 100644
    // This just needs to be some symbol in the binary; C++ doesn't
    // allow taking the address of ::main however.
    void *P = (void *)(intptr_t)GetExecutablePath;
- 
diff --git a/meta/recipes-devtools/llvm/llvm_19.1.2.bb b/meta/recipes-devtools/llvm/llvm_19.1.3.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_19.1.2.bb
rename to meta/recipes-devtools/llvm/llvm_19.1.3.bb
index 7128d1e71e..8c49e057f9 100644
--- a/meta/recipes-devtools/llvm/llvm_19.1.2.bb
+++ b/meta/recipes-devtools/llvm/llvm_19.1.3.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "3666f01fc52d8a0b0da83e107d74f208f001717824be0b80007f529453aa1e19"
+SRC_URI[sha256sum] = "324d483ff0b714c8ce7819a1b679dd9e4706cf91c6caf7336dc4ac0c1d3bf636"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
@@ -177,3 +177,5 @@ FILES:${PN}-staticdev += "\
 INSANE_SKIP:${PN}-libllvm += "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PV = "19.1.3"
-- 
2.44.1


--===============4327364327068800655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config19.1.2 moved to /usr/bin/crossscripts/llvm-config19.1.3
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config19.1.2 to llvm-config19.1.3
  /usr/bin/llvm-config19.1.2 moved to /usr/bin/llvm-config19.1.3
  /usr/bin/llvm-tblgen19.1.2 moved to /usr/bin/llvm-tblgen19.1.3

--===============4327364327068800655==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-llvm-upgrade-19.1.2-19.1.3.patch"

RnJvbSBiODc1YzIwOTYwMGY5Zjk4MGQ5YjJiYjE4YmMyMzg2OTBkNjQ4ZDU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMTc6MDk6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
bHZtOiB1cGdyYWRlIDE5LjEuMiAtPiAxOS4xLjMKCi0tLQogLi4udGNoZXJFbWl0dGVyLXNvcnQt
Q2xhc3NJbmZvLWxpc3RzLWJ5LW5hbWUtYXMtd2UucGF0Y2ggfCA0ICsrLS0KIC4uLi9sbHZtLzAw
MDctbGx2bS1hbGxvdy1lbnYtb3ZlcnJpZGUtb2YtZXhlLXBhdGgucGF0Y2ggIHwgOSArKysrLS0t
LS0KIC4uLi9sbHZtL3tsbHZtXzE5LjEuMi5iYiA9PiBsbHZtXzE5LjEuMy5iYn0gICAgICAgICAg
ICAgIHwgNCArKystCiAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS97bGx2bV8xOS4xLjIuYmIg
PT4gbGx2bV8xOS4xLjMuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2xsdm0vbGx2bS8wMDAxLUFzbU1hdGNoZXJFbWl0dGVyLXNvcnQtQ2xhc3NJbmZvLWxpc3Rz
LWJ5LW5hbWUtYXMtd2UucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9sbHZtLzAw
MDEtQXNtTWF0Y2hlckVtaXR0ZXItc29ydC1DbGFzc0luZm8tbGlzdHMtYnktbmFtZS1hcy13ZS5w
YXRjaAppbmRleCBhNWM1M2I2NjU3Li42MWI3Y2NmMjIyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbGx2bS9sbHZtLzAwMDEtQXNtTWF0Y2hlckVtaXR0ZXItc29ydC1DbGFzc0lu
Zm8tbGlzdHMtYnktbmFtZS1hcy13ZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bGx2bS9sbHZtLzAwMDEtQXNtTWF0Y2hlckVtaXR0ZXItc29ydC1DbGFzc0luZm8tbGlzdHMtYnkt
bmFtZS1hcy13ZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2IzMGE5YmRhODgzNzRlOGYw
M2JmOTZlOTcyYWVlNWJkMjE0Yjk4YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjI2
YThmMDVhYTgzY2VkYmQzZmJkY2RjMWFiNzBhYjE3MzE4ZTU0ZCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgog
RGF0ZTogRnJpLCAyNyBOb3YgMjAyMCAxMDoxMTowOCArMDAwMAogU3ViamVjdDogW1BBVENIXSBB
c21NYXRjaGVyRW1pdHRlcjogc29ydCBDbGFzc0luZm8gbGlzdHMgYnkgbmFtZSBhcyB3ZWxsCkBA
IC0xNCw3ICsxNCw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4Lmth
bmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2xsdm0vdXRpbHMvVGFibGVHZW4vQXNtTWF0Y2hlckVt
aXR0ZXIuY3BwIGIvbGx2bS91dGlscy9UYWJsZUdlbi9Bc21NYXRjaGVyRW1pdHRlci5jcHAKLWlu
ZGV4IDczNzI0ZTY2MmY5ZS4uMWNhOWM3MzQxNWRiIDEwMDY0NAoraW5kZXggNTAzNWVmNTI3Li4w
M2ZjODQyMDMgMTAwNjQ0CiAtLS0gYS9sbHZtL3V0aWxzL1RhYmxlR2VuL0FzbU1hdGNoZXJFbWl0
dGVyLmNwcAogKysrIGIvbGx2bS91dGlscy9UYWJsZUdlbi9Bc21NYXRjaGVyRW1pdHRlci5jcHAK
IEBAIC0zNjEsNyArMzYxLDEwIEBAIHB1YmxpYzoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9sbHZtL2xsdm0vMDAwNy1sbHZtLWFsbG93LWVudi1vdmVycmlkZS1vZi1leGUtcGF0
aC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm0vMDAwNy1sbHZtLWFsbG93
LWVudi1vdmVycmlkZS1vZi1leGUtcGF0aC5wYXRjaAppbmRleCBhZGQzOGIzYmI0Li40ZmQwNDUx
MGMwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9sbHZtLzAwMDctbGx2
bS1hbGxvdy1lbnYtb3ZlcnJpZGUtb2YtZXhlLXBhdGgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2xsdm0vbGx2bS8wMDA3LWxsdm0tYWxsb3ctZW52LW92ZXJyaWRlLW9mLWV4ZS1w
YXRoLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1ODhhODY5NGM2NTQwZTMxMTQwYzdlMjQy
YmZiNWUyNzlkNmNhMDhjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0Y2Y4ODExOGQw
NTlhNTAwMWZhMGM0MDQ2Y2M0N2IxMDg4ZDk0MDMxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogTWFydGluIEtlbGx5IDxta2VsbHlAeGV2by5jb20+CiBEYXRlOiBGcmksIDE5IE1heSAy
MDE3IDAwOjIyOjU3IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxsdm06IGFsbG93IGVudiBvdmVy
cmlkZSBvZiBleGUgYW5kIGxpYmRpciBwYXRoCkBAIC0xMywxMSArMTMsMTEgQEAgVXBzdHJlYW0t
U3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtPRS1zcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IE1hcnRp
biBLZWxseSA8bWtlbGx5QHhldm8uY29tPgogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KIC0tLQotIGxsdm0vdG9vbHMvbGx2bS1jb25maWcvbGx2bS1jb25maWcu
Y3BwIHwgMjUgKysrKysrKysrKysrKysrKysrKy0tLS0tLQotIDEgZmlsZSBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQorIGxsdm0vdG9vbHMvbGx2bS1jb25maWcvbGx2
bS1jb25maWcuY3BwIHwgNyArKysrKysrCisgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQogCiBkaWZmIC0tZ2l0IGEvbGx2bS90b29scy9sbHZtLWNvbmZpZy9sbHZtLWNvbmZpZy5jcHAg
Yi9sbHZtL3Rvb2xzL2xsdm0tY29uZmlnL2xsdm0tY29uZmlnLmNwcAotaW5kZXggZTg2ZWIyYjQ0
YjEwLi43YjJhYmYzMThkYmUgMTAwNjQ0CitpbmRleCBkNWI3NmIxYmIuLjZjMjhjMzRiYyAxMDA2
NDQKIC0tLSBhL2xsdm0vdG9vbHMvbGx2bS1jb25maWcvbGx2bS1jb25maWcuY3BwCiArKysgYi9s
bHZtL3Rvb2xzL2xsdm0tY29uZmlnL2xsdm0tY29uZmlnLmNwcAogQEAgLTI0Niw2ICsyNDYsMTMg
QEAgVHlwaWNhbCBjb21wb25lbnRzOlxuXApAQCAtMzQsNCArMzQsMyBAQCBpbmRleCBlODZlYjJi
NDRiMTAuLjdiMmFiZjMxOGRiZSAxMDA2NDQKICAgIC8vIFRoaXMganVzdCBuZWVkcyB0byBiZSBz
b21lIHN5bWJvbCBpbiB0aGUgYmluYXJ5OyBDKysgZG9lc24ndAogICAgLy8gYWxsb3cgdGFraW5n
IHRoZSBhZGRyZXNzIG9mIDo6bWFpbiBob3dldmVyLgogICAgdm9pZCAqUCA9ICh2b2lkICopKGlu
dHB0cl90KUdldEV4ZWN1dGFibGVQYXRoOwotIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2xsdm0vbGx2bV8xOS4xLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9s
bHZtXzE5LjEuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbGx2bS9sbHZtXzE5LjEuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2xsdm0vbGx2bV8xOS4xLjMuYmIKaW5kZXggNzEyOGQxZTcxZS4uOGM0OWUwNTdmOSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xsdm0vbGx2bV8xOS4xLjIuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xsdm0vbGx2bV8xOS4xLjMuYmIKQEAgLTI3LDcgKzI3
LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QvcmVs
ZWFzZXMvZG93bmxvYWQvbGx2bW9yZy0ke1BWfS8KICAgICAgICAgICAgZmlsZTovLzAwMDEtQXNt
TWF0Y2hlckVtaXR0ZXItc29ydC1DbGFzc0luZm8tbGlzdHMtYnktbmFtZS1hcy13ZS5wYXRjaDtz
dHJpcGxldmVsPTIgXAogICAgICAgICAgICBmaWxlOi8vbGx2bS1jb25maWcgXAogICAgICAgICAg
ICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzY2NmYwMWZjNTJkOGEwYjBkYTgzZTEwN2Q3NGYy
MDhmMDAxNzE3ODI0YmUwYjgwMDA3ZjUyOTQ1M2FhMWUxOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICIzMjRkNDgzZmYwYjcxNGM4Y2U3ODE5YTFiNjc5ZGQ5ZTQ3MDZjZjkxYzZjYWY3MzM2ZGM0YWMw
YzFkM2JmNjM2IgogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9sbHZt
L2xsdm0tcHJvamVjdCIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImxsdm1vcmctKD9QPHB2ZXI+
XGQrKFwuXGQrKSspIgogCkBAIC0xNzcsMyArMTc3LDUgQEAgRklMRVM6JHtQTn0tc3RhdGljZGV2
ICs9ICJcCiBJTlNBTkVfU0tJUDoke1BOfS1saWJsbHZtICs9ICJkZXYtc28iCiAKIEJCQ0xBU1NF
WFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKKworUFYgPSAiMTkuMS4zIgotLSAKMi40NC4xCgo=

--===============4327364327068800655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/llvm: SRC_URI changed from "https://github.com/llvm/llvm-project/releases/download/llvmorg-19.1.2/llvm-project-19.1.2.src.tar.xz file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 file://llvm-config" to "https://github.com/llvm/llvm-project/releases/download/llvmorg-19.1.3/llvm-project-19.1.3.src.tar.xz file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 file://llvm-config"
packages/core2-64-poky-linux/llvm: PKGV changed from 19.1.2 [default] to 19.1.3 [default]
packages/core2-64-poky-linux/llvm: PV changed from "19.1.2" to "19.1.3"
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PKGV changed from 19.1.2 [default] to 19.1.3 [default]
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PV changed from "19.1.2" to "19.1.3"
packages/core2-64-poky-linux/llvm/llvm-dbg: PKGV changed from 19.1.2 [default] to 19.1.3 [default]
packages/core2-64-poky-linux/llvm/llvm-dbg: PKGSIZE changed from 56111528 to 56111832 (+0%)
packages/core2-64-poky-linux/llvm/llvm-dbg: PV changed from "19.1.2" to "19.1.3"
packages/core2-64-poky-linux/llvm/llvm-dev: PKGV changed from 19.1.2 [default] to 19.1.3 [default]
packages/core2-64-poky-linux/llvm/llvm-dev: FILES: removed "/usr/lib/libLLVM-19.1.2.so", added "/usr/lib/libLLVM-19.1.3.so"
packages/core2-64-poky-linux/llvm/llvm-dev: PKGSIZE changed from 26269601 to 26270417 (+0%)
packages/core2-64-poky-linux/llvm/llvm-dev: PV changed from "19.1.2" to "19.1.3"
packages/core2-64-poky-linux/llvm/llvm-doc: PKGV changed from 19.1.2 [default] to 19.1.3 [default]
packages/core2-64-poky-linux/llvm/llvm-doc: PV changed from "19.1.2" to "19.1.3"
packages/core2-64-poky-linux/llvm/llvm-libllvm: PKGV changed from 19.1.2 [default] to 19.1.3 [default]
packages/core2-64-poky-linux/llvm/llvm-libllvm: PV changed from "19.1.2" to "19.1.3"
packages/core2-64-poky-linux/llvm/llvm-liblto: PKGV changed from 19.1.2 [default] to 19.1.3 [default]
packages/core2-64-poky-linux/llvm/llvm-liblto: PV changed from "19.1.2" to "19.1.3"
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PKGV changed from 19.1.2 [default] to 19.1.3 [default]
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PV changed from "19.1.2" to "19.1.3"
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PKGV changed from 19.1.2 [default] to 19.1.3 [default]
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PV changed from "19.1.2" to "19.1.3"
packages/core2-64-poky-linux/llvm/llvm-locale: PKGV changed from 19.1.2 [default] to 19.1.3 [default]
packages/core2-64-poky-linux/llvm/llvm-locale: PV changed from "19.1.2" to "19.1.3"
packages/core2-64-poky-linux/llvm/llvm-src: PKGV changed from 19.1.2 [default] to 19.1.3 [default]
packages/core2-64-poky-linux/llvm/llvm-src: PV changed from "19.1.2" to "19.1.3"
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGV changed from 19.1.2 [default] to 19.1.3 [default]
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGSIZE changed from 226436894 to 226438438 (+0%)
packages/core2-64-poky-linux/llvm/llvm-staticdev: PV changed from "19.1.2" to "19.1.3"
packages/core2-64-poky-linux/llvm/llvm: PKGV changed from 19.1.2 [default] to 19.1.3 [default]
packages/core2-64-poky-linux/llvm/llvm: PV changed from "19.1.2" to "19.1.3"
Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config19.1.2 moved to /usr/bin/crossscripts/llvm-config19.1.3
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config19.1.2 to llvm-config19.1.3
  /usr/bin/llvm-config19.1.2 moved to /usr/bin/llvm-config19.1.3
  /usr/bin/llvm-tblgen19.1.2 moved to /usr/bin/llvm-tblgen19.1.3

--===============4327364327068800655==--

