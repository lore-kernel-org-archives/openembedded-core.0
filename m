Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDD1C3DA66
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:30 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.18376.1718475799414397576
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CYmPGv3b;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=G7YKt8Ka;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101901d23b878-d15ba1d8-13b9-4878-9fe4-cc159f6df67a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475798;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZQn85IFQ7pz1VOF2NWVeXhM8V2zo3/Ozfra3Gkekri4=;
	b=CYmPGv3b33DZk7SnvnJGBWlEVkVGqht22/KbtnH7iUfAfEx1q/EtbcadtybCzICK
	gtj+ScvFYRTW2jvbkxAiD40V4X6VRSbglU71VklAY8Rx1Fv80kk5s+aENkjpAy0t5mG
	5wupOJio2kneH0LFxjNC4hkMJCMd45L3Dy5woLDc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475798;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZQn85IFQ7pz1VOF2NWVeXhM8V2zo3/Ozfra3Gkekri4=;
	b=G7YKt8Kaml+z8yBKIrK/Q3exyDedXVIebprZvzI3Wb2FsN4XErO1xWVf1kjvInw7
	VErps5XOkY7BiQ4Iigw2E4nHCU8mlQCKDmW4lKI5Qf4OiMn53DIyHXYMpWIX7BtmncR
	8Ls4C4EUu7qkIAMQCiUY74uCO/jqMyQ1agq5M4Pk=
Content-Type: multipart/mixed; boundary="===============7422985401578457110=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 18.1.7 SUCCEEDED
Message-ID: <010101901d23b878-d15ba1d8-13b9-4878-9fe4-cc159f6df67a-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200693

--===============7422985401578457110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *llvm* to *18.1.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-llvm-upgrade-18.1.6-18.1.7.patch
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
From c92cc2cda8c9a9203d665eb090d40b414e9320e3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 09:28:15 +0000
Subject: [PATCH] llvm: upgrade 18.1.6 -> 18.1.7

---
 ...tcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch | 4 ++--
 .../llvm/0007-llvm-allow-env-override-of-exe-path.patch  | 9 ++++-----
 .../llvm/{llvm_18.1.6.bb => llvm_18.1.7.bb}              | 4 +++-
 3 files changed, 9 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/llvm/{llvm_18.1.6.bb => llvm_18.1.7.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
index a5c53b6657..5dec276023 100644
--- a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -1,4 +1,4 @@
-From 3b30a9bda88374e8f03bf96e972aee5bd214b98b Mon Sep 17 00:00:00 2001
+From dbd4a602b0976538c0757b9946fd2915b657d22c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 27 Nov 2020 10:11:08 +0000
 Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-index 73724e662f9e..1ca9c73415db 100644
+index 73724e662..1ca9c7341 100644
 --- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 +++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 @@ -361,7 +361,10 @@ public:
diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
index add38b3bb4..7c5827bad1 100644
--- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
+++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
@@ -1,4 +1,4 @@
-From 588a8694c6540e31140c7e242bfb5e279d6ca08c Mon Sep 17 00:00:00 2001
+From 09524adce4663077da566924fb27f6e0b66722fa Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/llvm/llvm_18.1.6.bb b/meta/recipes-devtools/llvm/llvm_18.1.7.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_18.1.6.bb
rename to meta/recipes-devtools/llvm/llvm_18.1.7.bb
index 189f5b1146..7072650c72 100644
--- a/meta/recipes-devtools/llvm/llvm_18.1.6.bb
+++ b/meta/recipes-devtools/llvm/llvm_18.1.7.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "bd4b4cb6374bcd5fc5a3ba60cb80425d29da34f316b8821abc12c0db225cf6b4"
+SRC_URI[sha256sum] = "74446ab6943f686391954cbda0d77ae92e8a60c432eff437b8666e121d748ec4"
 
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
@@ -175,3 +175,5 @@ FILES:${PN}-staticdev += "\
 INSANE_SKIP:${PN}-libllvm += "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PV = "18.1.7"
-- 
2.44.0


--===============7422985401578457110==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-llvm-upgrade-18.1.6-18.1.7.patch"

RnJvbSBjOTJjYzJjZGE4YzlhOTIwM2Q2NjVlYjA5MGQ0MGI0MTRlOTMyMGUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMDk6Mjg6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
bHZtOiB1cGdyYWRlIDE4LjEuNiAtPiAxOC4xLjcKCi0tLQogLi4udGNoZXJFbWl0dGVyLXNvcnQt
Q2xhc3NJbmZvLWxpc3RzLWJ5LW5hbWUtYXMtd2UucGF0Y2ggfCA0ICsrLS0KIC4uLi9sbHZtLzAw
MDctbGx2bS1hbGxvdy1lbnYtb3ZlcnJpZGUtb2YtZXhlLXBhdGgucGF0Y2ggIHwgOSArKysrLS0t
LS0KIC4uLi9sbHZtL3tsbHZtXzE4LjEuNi5iYiA9PiBsbHZtXzE4LjEuNy5iYn0gICAgICAgICAg
ICAgIHwgNCArKystCiAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS97bGx2bV8xOC4xLjYuYmIg
PT4gbGx2bV8xOC4xLjcuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2xsdm0vbGx2bS8wMDAxLUFzbU1hdGNoZXJFbWl0dGVyLXNvcnQtQ2xhc3NJbmZvLWxpc3Rz
LWJ5LW5hbWUtYXMtd2UucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9sbHZtLzAw
MDEtQXNtTWF0Y2hlckVtaXR0ZXItc29ydC1DbGFzc0luZm8tbGlzdHMtYnktbmFtZS1hcy13ZS5w
YXRjaAppbmRleCBhNWM1M2I2NjU3Li41ZGVjMjc2MDIzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbGx2bS9sbHZtLzAwMDEtQXNtTWF0Y2hlckVtaXR0ZXItc29ydC1DbGFzc0lu
Zm8tbGlzdHMtYnktbmFtZS1hcy13ZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bGx2bS9sbHZtLzAwMDEtQXNtTWF0Y2hlckVtaXR0ZXItc29ydC1DbGFzc0luZm8tbGlzdHMtYnkt
bmFtZS1hcy13ZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2IzMGE5YmRhODgzNzRlOGYw
M2JmOTZlOTcyYWVlNWJkMjE0Yjk4YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZGJk
NGE2MDJiMDk3NjUzOGMwNzU3Yjk5NDZmZDI5MTViNjU3ZDIyYyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgog
RGF0ZTogRnJpLCAyNyBOb3YgMjAyMCAxMDoxMTowOCArMDAwMAogU3ViamVjdDogW1BBVENIXSBB
c21NYXRjaGVyRW1pdHRlcjogc29ydCBDbGFzc0luZm8gbGlzdHMgYnkgbmFtZSBhcyB3ZWxsCkBA
IC0xNCw3ICsxNCw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4Lmth
bmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2xsdm0vdXRpbHMvVGFibGVHZW4vQXNtTWF0Y2hlckVt
aXR0ZXIuY3BwIGIvbGx2bS91dGlscy9UYWJsZUdlbi9Bc21NYXRjaGVyRW1pdHRlci5jcHAKLWlu
ZGV4IDczNzI0ZTY2MmY5ZS4uMWNhOWM3MzQxNWRiIDEwMDY0NAoraW5kZXggNzM3MjRlNjYyLi4x
Y2E5YzczNDEgMTAwNjQ0CiAtLS0gYS9sbHZtL3V0aWxzL1RhYmxlR2VuL0FzbU1hdGNoZXJFbWl0
dGVyLmNwcAogKysrIGIvbGx2bS91dGlscy9UYWJsZUdlbi9Bc21NYXRjaGVyRW1pdHRlci5jcHAK
IEBAIC0zNjEsNyArMzYxLDEwIEBAIHB1YmxpYzoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9sbHZtL2xsdm0vMDAwNy1sbHZtLWFsbG93LWVudi1vdmVycmlkZS1vZi1leGUtcGF0
aC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm0vMDAwNy1sbHZtLWFsbG93
LWVudi1vdmVycmlkZS1vZi1leGUtcGF0aC5wYXRjaAppbmRleCBhZGQzOGIzYmI0Li43YzU4Mjdi
YWQxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9sbHZtLzAwMDctbGx2
bS1hbGxvdy1lbnYtb3ZlcnJpZGUtb2YtZXhlLXBhdGgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2xsdm0vbGx2bS8wMDA3LWxsdm0tYWxsb3ctZW52LW92ZXJyaWRlLW9mLWV4ZS1w
YXRoLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1ODhhODY5NGM2NTQwZTMxMTQwYzdlMjQy
YmZiNWUyNzlkNmNhMDhjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwOTUyNGFkY2U0
NjYzMDc3ZGE1NjY5MjRmYjI3ZjZlMGI2NjcyMmZhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
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
dnRvb2xzL2xsdm0vbGx2bV8xOC4xLjYuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9s
bHZtXzE4LjEuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbGx2bS9sbHZtXzE4LjEuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2xsdm0vbGx2bV8xOC4xLjcuYmIKaW5kZXggMTg5ZjViMTE0Ni4uNzA3MjY1MGM3MiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xsdm0vbGx2bV8xOC4xLjYuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xsdm0vbGx2bV8xOC4xLjcuYmIKQEAgLTI3LDcgKzI3
LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QvcmVs
ZWFzZXMvZG93bmxvYWQvbGx2bW9yZy0ke1BWfS8KICAgICAgICAgICAgZmlsZTovLzAwMDEtQXNt
TWF0Y2hlckVtaXR0ZXItc29ydC1DbGFzc0luZm8tbGlzdHMtYnktbmFtZS1hcy13ZS5wYXRjaDtz
dHJpcGxldmVsPTIgXAogICAgICAgICAgICBmaWxlOi8vbGx2bS1jb25maWcgXAogICAgICAgICAg
ICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmQ0YjRjYjYzNzRiY2Q1ZmM1YTNiYTYwY2I4MDQy
NWQyOWRhMzRmMzE2Yjg4MjFhYmMxMmMwZGIyMjVjZjZiNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI3NDQ0NmFiNjk0M2Y2ODYzOTE5NTRjYmRhMGQ3N2FlOTJlOGE2MGM0MzJlZmY0MzdiODY2NmUx
MjFkNzQ4ZWM0IgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL2xs
dm0vbGx2bS1wcm9qZWN0IgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAibGx2bW9yZy0oP1A8cHZl
cj5cZCsoXC5cZCspKykiCkBAIC0xNzUsMyArMTc1LDUgQEAgRklMRVM6JHtQTn0tc3RhdGljZGV2
ICs9ICJcCiBJTlNBTkVfU0tJUDoke1BOfS1saWJsbHZtICs9ICJkZXYtc28iCiAKIEJCQ0xBU1NF
WFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKKworUFYgPSAiMTguMS43IgotLSAKMi40NC4wCgo=

--===============7422985401578457110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config18.1.6 moved to /usr/bin/crossscripts/llvm-config18.1.7
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config18.1.6 to llvm-config18.1.7
  /usr/bin/llvm-config18.1.6 moved to /usr/bin/llvm-config18.1.7
  /usr/bin/llvm-tblgen18.1.6 moved to /usr/bin/llvm-tblgen18.1.7

--===============7422985401578457110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/llvm: PV changed from "18.1.6" to "18.1.7"
packages/core2-64-poky-linux/llvm: PKGV changed from 18.1.6 [default] to 18.1.7 [default]
packages/core2-64-poky-linux/llvm: SRC_URI changed from "https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.6/llvm-project-18.1.6.src.tar.xz file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 file://llvm-config" to "https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.7/llvm-project-18.1.7.src.tar.xz file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 file://llvm-config"
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PV changed from "18.1.6" to "18.1.7"
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PKGV changed from 18.1.6 [default] to 18.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-dbg: PV changed from "18.1.6" to "18.1.7"
packages/core2-64-poky-linux/llvm/llvm-dbg: PKGV changed from 18.1.6 [default] to 18.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-dev: PV changed from "18.1.6" to "18.1.7"
packages/core2-64-poky-linux/llvm/llvm-dev: PKGV changed from 18.1.6 [default] to 18.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-dev: FILES: removed "/usr/lib/libLLVM-18.1.6.so", added "/usr/lib/libLLVM-18.1.7.so"
packages/core2-64-poky-linux/llvm/llvm-doc: PV changed from "18.1.6" to "18.1.7"
packages/core2-64-poky-linux/llvm/llvm-doc: PKGV changed from 18.1.6 [default] to 18.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-libllvm: PV changed from "18.1.6" to "18.1.7"
packages/core2-64-poky-linux/llvm/llvm-libllvm: PKGV changed from 18.1.6 [default] to 18.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-liblto: PV changed from "18.1.6" to "18.1.7"
packages/core2-64-poky-linux/llvm/llvm-liblto: PKGV changed from 18.1.6 [default] to 18.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PV changed from "18.1.6" to "18.1.7"
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PKGV changed from 18.1.6 [default] to 18.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PV changed from "18.1.6" to "18.1.7"
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PKGV changed from 18.1.6 [default] to 18.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-locale: PV changed from "18.1.6" to "18.1.7"
packages/core2-64-poky-linux/llvm/llvm-locale: PKGV changed from 18.1.6 [default] to 18.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-src: PV changed from "18.1.6" to "18.1.7"
packages/core2-64-poky-linux/llvm/llvm-src: PKGV changed from 18.1.6 [default] to 18.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-staticdev: PV changed from "18.1.6" to "18.1.7"
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGV changed from 18.1.6 [default] to 18.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGSIZE changed from 3937663022 to 3937663262 (+0%)
packages/core2-64-poky-linux/llvm/llvm: PV changed from "18.1.6" to "18.1.7"
packages/core2-64-poky-linux/llvm/llvm: PKGV changed from 18.1.6 [default] to 18.1.7 [default]
Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config18.1.6 moved to /usr/bin/crossscripts/llvm-config18.1.7
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config18.1.6 to llvm-config18.1.7
  /usr/bin/llvm-config18.1.6 moved to /usr/bin/llvm-config18.1.7
  /usr/bin/llvm-tblgen18.1.6 moved to /usr/bin/llvm-tblgen18.1.7

--===============7422985401578457110==--

