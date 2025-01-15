Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7266FC02196
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:08 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.17867.1736936767952238247
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Dv1xQqbe;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=CnPVubtW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010194697fbf49-84e3116d-f9d9-4d9b-a028-7a971c07c089-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936767;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mVRoSsoOuMDtD6oaxyk1DxujVJ2iMvlUQCMoACNm7xY=;
	b=Dv1xQqbegXMtaSTmfYFMpGtvVgUyH9X0B8KVHnSDvR1q9QQyQhRM/luGTT53ctIn
	eUjMePQLghnX44X81XXpkJw3hFY6WO1adMlMYN4WJlffBF9T9U7fV21ysqlbU9paqk5
	cRBIfiYOAaLLnfT2NLHfVcIy/l2FbvGuOQYF9E/w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936767;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mVRoSsoOuMDtD6oaxyk1DxujVJ2iMvlUQCMoACNm7xY=;
	b=CnPVubtWEKhxGjuTVpjzXupLRF28Hkjt/+xoxhZaFdcm+xgSb+A8BoDEgUSDP3Wp
	pL3ZLSS2calw1Ldi4EEbNj4qbt47vxvZd0fbMK69PvrZEnFHdW6F9Kygcsr393AUvUL
	HJisnuMxD4jtj4nFkmhryOhpevylNNKGDYG/SlAk=
Content-Type: multipart/mixed; boundary="===============5163347402972499136=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 19.1.7 SUCCEEDED
Message-ID: <01010194697fbf49-84e3116d-f9d9-4d9b-a028-7a971c07c089-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209838

--===============5163347402972499136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *llvm* to *19.1.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-llvm-upgrade-19.1.6-19.1.7.patch
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
From 2fd323f7614c50040f4a58c5e9b1bae49ed03ee1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 07:23:36 +0000
Subject: [PATCH] llvm: upgrade 19.1.6 -> 19.1.7

---
 ...tcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch | 4 ++--
 .../llvm/0007-llvm-allow-env-override-of-exe-path.patch  | 9 ++++-----
 .../llvm/{llvm_19.1.6.bb => llvm_19.1.7.bb}              | 4 +++-
 3 files changed, 9 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/llvm/{llvm_19.1.6.bb => llvm_19.1.7.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
index a5c53b6657..587ceffbed 100644
--- a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -1,4 +1,4 @@
-From 3b30a9bda88374e8f03bf96e972aee5bd214b98b Mon Sep 17 00:00:00 2001
+From c1008a5e021ac7cf188cc02e8295d0922683c822 Mon Sep 17 00:00:00 2001
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
index add38b3bb4..dbaa51e50a 100644
--- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
+++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
@@ -1,4 +1,4 @@
-From 588a8694c6540e31140c7e242bfb5e279d6ca08c Mon Sep 17 00:00:00 2001
+From 4932bc2bc69159450bd5248450530f9d015df02c Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/llvm/llvm_19.1.6.bb b/meta/recipes-devtools/llvm/llvm_19.1.7.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_19.1.6.bb
rename to meta/recipes-devtools/llvm/llvm_19.1.7.bb
index 003676a652..012493228e 100644
--- a/meta/recipes-devtools/llvm/llvm_19.1.6.bb
+++ b/meta/recipes-devtools/llvm/llvm_19.1.7.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "e3f79317adaa9196d2cfffe1c869d7c100b7540832bc44fe0d3f44a12861fa34"
+SRC_URI[sha256sum] = "82401fea7b79d0078043f7598b835284d6650a75b93e64b6f761ea7b63097501"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
@@ -177,3 +177,5 @@ FILES:${PN}-staticdev += "\
 INSANE_SKIP:${PN}-libllvm += "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PV = "19.1.7"
-- 
2.44.1


--===============5163347402972499136==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-llvm-upgrade-19.1.6-19.1.7.patch"

RnJvbSAyZmQzMjNmNzYxNGM1MDA0MGY0YTU4YzVlOWIxYmFlNDllZDAzZWUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDc6MjM6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
bHZtOiB1cGdyYWRlIDE5LjEuNiAtPiAxOS4xLjcKCi0tLQogLi4udGNoZXJFbWl0dGVyLXNvcnQt
Q2xhc3NJbmZvLWxpc3RzLWJ5LW5hbWUtYXMtd2UucGF0Y2ggfCA0ICsrLS0KIC4uLi9sbHZtLzAw
MDctbGx2bS1hbGxvdy1lbnYtb3ZlcnJpZGUtb2YtZXhlLXBhdGgucGF0Y2ggIHwgOSArKysrLS0t
LS0KIC4uLi9sbHZtL3tsbHZtXzE5LjEuNi5iYiA9PiBsbHZtXzE5LjEuNy5iYn0gICAgICAgICAg
ICAgIHwgNCArKystCiAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS97bGx2bV8xOS4xLjYuYmIg
PT4gbGx2bV8xOS4xLjcuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2xsdm0vbGx2bS8wMDAxLUFzbU1hdGNoZXJFbWl0dGVyLXNvcnQtQ2xhc3NJbmZvLWxpc3Rz
LWJ5LW5hbWUtYXMtd2UucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9sbHZtLzAw
MDEtQXNtTWF0Y2hlckVtaXR0ZXItc29ydC1DbGFzc0luZm8tbGlzdHMtYnktbmFtZS1hcy13ZS5w
YXRjaAppbmRleCBhNWM1M2I2NjU3Li41ODdjZWZmYmVkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbGx2bS9sbHZtLzAwMDEtQXNtTWF0Y2hlckVtaXR0ZXItc29ydC1DbGFzc0lu
Zm8tbGlzdHMtYnktbmFtZS1hcy13ZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bGx2bS9sbHZtLzAwMDEtQXNtTWF0Y2hlckVtaXR0ZXItc29ydC1DbGFzc0luZm8tbGlzdHMtYnkt
bmFtZS1hcy13ZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2IzMGE5YmRhODgzNzRlOGYw
M2JmOTZlOTcyYWVlNWJkMjE0Yjk4YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzEw
MDhhNWUwMjFhYzdjZjE4OGNjMDJlODI5NWQwOTIyNjgzYzgyMiBNb24gU2VwIDE3IDAwOjAwOjAw
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
LWVudi1vdmVycmlkZS1vZi1leGUtcGF0aC5wYXRjaAppbmRleCBhZGQzOGIzYmI0Li5kYmFhNTFl
NTBhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9sbHZtLzAwMDctbGx2
bS1hbGxvdy1lbnYtb3ZlcnJpZGUtb2YtZXhlLXBhdGgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2xsdm0vbGx2bS8wMDA3LWxsdm0tYWxsb3ctZW52LW92ZXJyaWRlLW9mLWV4ZS1w
YXRoLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1ODhhODY5NGM2NTQwZTMxMTQwYzdlMjQy
YmZiNWUyNzlkNmNhMDhjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0OTMyYmMyYmM2
OTE1OTQ1MGJkNTI0ODQ1MDUzMGY5ZDAxNWRmMDJjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
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
dnRvb2xzL2xsdm0vbGx2bV8xOS4xLjYuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9s
bHZtXzE5LjEuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbGx2bS9sbHZtXzE5LjEuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2xsdm0vbGx2bV8xOS4xLjcuYmIKaW5kZXggMDAzNjc2YTY1Mi4uMDEyNDkzMjI4ZSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xsdm0vbGx2bV8xOS4xLjYuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xsdm0vbGx2bV8xOS4xLjcuYmIKQEAgLTI3LDcgKzI3
LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QvcmVs
ZWFzZXMvZG93bmxvYWQvbGx2bW9yZy0ke1BWfS8KICAgICAgICAgICAgZmlsZTovLzAwMDEtQXNt
TWF0Y2hlckVtaXR0ZXItc29ydC1DbGFzc0luZm8tbGlzdHMtYnktbmFtZS1hcy13ZS5wYXRjaDtz
dHJpcGxldmVsPTIgXAogICAgICAgICAgICBmaWxlOi8vbGx2bS1jb25maWcgXAogICAgICAgICAg
ICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTNmNzkzMTdhZGFhOTE5NmQyY2ZmZmUxYzg2OWQ3
YzEwMGI3NTQwODMyYmM0NGZlMGQzZjQ0YTEyODYxZmEzNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI4MjQwMWZlYTdiNzlkMDA3ODA0M2Y3NTk4YjgzNTI4NGQ2NjUwYTc1YjkzZTY0YjZmNzYxZWE3
YjYzMDk3NTAxIgogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9sbHZt
L2xsdm0tcHJvamVjdCIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImxsdm1vcmctKD9QPHB2ZXI+
XGQrKFwuXGQrKSspIgogCkBAIC0xNzcsMyArMTc3LDUgQEAgRklMRVM6JHtQTn0tc3RhdGljZGV2
ICs9ICJcCiBJTlNBTkVfU0tJUDoke1BOfS1saWJsbHZtICs9ICJkZXYtc28iCiAKIEJCQ0xBU1NF
WFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKKworUFYgPSAiMTkuMS43IgotLSAKMi40NC4xCgo=

--===============5163347402972499136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/llvm: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm: SRC_URI changed from "https://github.com/llvm/llvm-project/releases/download/llvmorg-19.1.6/llvm-project-19.1.6.src.tar.xz file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 file://llvm-config" to "https://github.com/llvm/llvm-project/releases/download/llvmorg-19.1.7/llvm-project-19.1.7.src.tar.xz file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 file://llvm-config"
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-dbg: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-dbg: PKGSIZE changed from 56113416 to 56113640 (+0%)
packages/core2-64-poky-linux/llvm/llvm-dbg: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-dev: FILES: removed "/usr/lib/libLLVM-19.1.6.so", added "/usr/lib/libLLVM-19.1.7.so"
packages/core2-64-poky-linux/llvm/llvm-dev: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-dev: PKGSIZE changed from 26271252 to 26271414 (+0%)
packages/core2-64-poky-linux/llvm/llvm-dev: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-doc: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-doc: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-libllvm: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-libllvm: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-liblto: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-liblto: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-locale: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-locale: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-src: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-src: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-staticdev: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGSIZE changed from 226447312 to 226448896 (+0%)
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config19.1.6 moved to /usr/bin/crossscripts/llvm-config19.1.7
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config19.1.6 to llvm-config19.1.7
  /usr/bin/llvm-config19.1.6 moved to /usr/bin/llvm-config19.1.7
  /usr/bin/llvm-tblgen19.1.6 moved to /usr/bin/llvm-tblgen19.1.7

--===============5163347402972499136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config19.1.6 moved to /usr/bin/crossscripts/llvm-config19.1.7
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config19.1.6 to llvm-config19.1.7
  /usr/bin/llvm-config19.1.6 moved to /usr/bin/llvm-config19.1.7
  /usr/bin/llvm-tblgen19.1.6 moved to /usr/bin/llvm-tblgen19.1.7

--===============5163347402972499136==--

