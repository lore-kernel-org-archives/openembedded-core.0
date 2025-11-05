Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99711CD342C
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:24 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2348.1762384575357205704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=oK9mtoTo;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HQrLYQN0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019a564e77a1-8fe5c7d6-922d-4a48-ab3c-442786391e0d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PO2loKfAUJbfgSDLVIhMUAZOPL8xOEptXFzzp40Thp8=;
	b=oK9mtoToVd/C/9J2ofb2y00fRTlySFWwk/+hZCEpCelK4nPy7c/cQMfEf9E+M8GR
	+xYVDLlIWz5o5QZ9WUyfuJQGscBe161aBblvBLuRtfZ6wsuXrvSXVLwFP+FPu2j+rUI
	tLIdn7HOth4sas0KjtSIff8p9nl8zYtE5LImov5Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PO2loKfAUJbfgSDLVIhMUAZOPL8xOEptXFzzp40Thp8=;
	b=HQrLYQN06rrm9XCS2tBFpHU8iq/SvD5Iv6yvnRc6+5c4XDrsUZD4pwNWccYfgBC5
	8B1LMldlPfRvTlXavZt7BquvWaHSbK2iJwIorExgC8KeK0AcJ+xLcT5PT0VxtqAxCSE
	78bcPzYMBV2ppuK8K/iCOiSiOzA7RpMDWHTECvHE=
Content-Type: multipart/mixed; boundary="===============5791727862806852102=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.14.3 SUCCEEDED
Message-ID: <0101019a564e77a1-8fe5c7d6-922d-4a48-ab3c-442786391e0d-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225795

--===============5791727862806852102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lttng-modules* to *2.14.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lttng-modules-upgrade-2.14.2-2.14.3.patch
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
From a98bb8409ef782a5fae4b2111c0ce9fd53b111d6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 13:53:43 +0000
Subject: [PATCH] lttng-modules: upgrade 2.14.2 -> 2.14.3

---
 ...d-change-missing-CONFIG_TRACEPOINTS-to-warn.patch | 12 ++++++------
 ...tng-modules_2.14.2.bb => lttng-modules_2.14.3.bb} |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.14.2.bb => lttng-modules_2.14.3.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
index 1854d9a944..fdc19b5dbd 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
@@ -1,4 +1,4 @@
-From 60d423945bd4f4c4b7bfc6f29da9231152d05690 Mon Sep 17 00:00:00 2001
+From 60eb642ba86bb42ca17cf06e2d334becd0389f1b Mon Sep 17 00:00:00 2001
 From: Bruce Ashfield <bruce.ashfield@gmail.com>
 Date: Sat, 15 May 2021 10:26:38 -0400
 Subject: [PATCH] src/Kbuild: change missing CONFIG_TRACEPOINTS to warning
@@ -19,10 +19,10 @@ Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
  src/Kbuild | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
 
-Index: lttng-modules-2.14.0/src/Kbuild
-===================================================================
---- lttng-modules-2.14.0.orig/src/Kbuild
-+++ lttng-modules-2.14.0/src/Kbuild
+diff --git a/src/Kbuild b/src/Kbuild
+index f33d0d5..a26cd74 100644
+--- a/src/Kbuild
++++ b/src/Kbuild
 @@ -3,10 +3,13 @@
  
  ifdef CONFIG_LOCALVERSION	# Check if dot-config is included.
@@ -38,7 +38,7 @@ Index: lttng-modules-2.14.0/src/Kbuild
  TOP_LTTNG_MODULES_DIR := $(shell dirname $(lastword $(MAKEFILE_LIST)))/..
  
  lttng_check_linux_version = $(shell pwd)/include/linux/version.h
-@@ -168,3 +171,5 @@
+@@ -168,3 +171,5 @@ obj-$(CONFIG_LTTNG) += tests/
  obj-$(CONFIG_LTTNG_SYSCALLS_EXTRACTOR) += lttng-syscalls-extractor.o
  
  # vim:syntax=make
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.14.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.14.3.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-modules_2.14.2.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.14.3.bb
index c9c0b17291..6a1bd6a27d 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.14.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.14.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
                 "
-SRC_URI[sha256sum] = "a581dd44ea61af869a935e71498d4273be59944d56f906135c6451d6548742a5"
+SRC_URI[sha256sum] = "35a1875ad96e8b4b6aa8729f59af350bfc788ba65c6856deaa84d33acc0f28c2"
 
 export INSTALL_MOD_DIR = "kernel/lttng-modules"
 
-- 
2.47.1


--===============5791727862806852102==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lttng-modules-upgrade-2.14.2-2.14.3.patch"

RnJvbSBhOThiYjg0MDllZjc4MmE1ZmFlNGIyMTExYzBjZTlmZDUzYjExMWQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxMzo1Mzo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx0
dG5nLW1vZHVsZXM6IHVwZ3JhZGUgMi4xNC4yIC0+IDIuMTQuMwoKLS0tCiAuLi5kLWNoYW5nZS1t
aXNzaW5nLUNPTkZJR19UUkFDRVBPSU5UUy10by13YXJuLnBhdGNoIHwgMTIgKysrKysrLS0tLS0t
CiAuLi50bmctbW9kdWxlc18yLjE0LjIuYmIgPT4gbHR0bmctbW9kdWxlc18yLjE0LjMuYmJ9IHwg
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcve2x0dG5nLW1vZHVsZXNfMi4xNC4yLmJi
ID0+IGx0dG5nLW1vZHVsZXNfMi4xNC4zLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlcy8wMDAxLXNyYy1LYnVpbGQtY2hhbmdlLW1p
c3NpbmctQ09ORklHX1RSQUNFUE9JTlRTLXRvLXdhcm4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2Vy
bmVsL2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAwMS1zcmMtS2J1aWxkLWNoYW5nZS1taXNzaW5nLUNP
TkZJR19UUkFDRVBPSU5UUy10by13YXJuLnBhdGNoCmluZGV4IDE4NTRkOWE5NDQuLmZkYzE5YjVk
YmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlcy8w
MDAxLXNyYy1LYnVpbGQtY2hhbmdlLW1pc3NpbmctQ09ORklHX1RSQUNFUE9JTlRTLXRvLXdhcm4u
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzLzAwMDEt
c3JjLUtidWlsZC1jaGFuZ2UtbWlzc2luZy1DT05GSUdfVFJBQ0VQT0lOVFMtdG8td2Fybi5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNjBkNDIzOTQ1YmQ0ZjRjNGI3YmZjNmYyOWRhOTIzMTE1
MmQwNTY5MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjBlYjY0MmJhODZiYjQyY2Ex
N2NmMDZlMmQzMzRiZWNkMDM4OWYxYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEJy
dWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDE1IE1h
eSAyMDIxIDEwOjI2OjM4IC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNyYy9LYnVpbGQ6IGNoYW5n
ZSBtaXNzaW5nIENPTkZJR19UUkFDRVBPSU5UUyB0byB3YXJuaW5nCkBAIC0xOSwxMCArMTksMTAg
QEAgU2lnbmVkLW9mZi1ieTogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNv
bT4KICBzcmMvS2J1aWxkIHwgNyArKysrKystCiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQogCi1JbmRleDogbHR0bmctbW9kdWxlcy0yLjE0LjAvc3JjL0ti
dWlsZAotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQotLS0tIGx0dG5nLW1vZHVsZXMtMi4xNC4wLm9yaWcvc3JjL0tidWls
ZAotKysrIGx0dG5nLW1vZHVsZXMtMi4xNC4wL3NyYy9LYnVpbGQKK2RpZmYgLS1naXQgYS9zcmMv
S2J1aWxkIGIvc3JjL0tidWlsZAoraW5kZXggZjMzZDBkNS4uYTI2Y2Q3NCAxMDA2NDQKKy0tLSBh
L3NyYy9LYnVpbGQKKysrKyBiL3NyYy9LYnVpbGQKIEBAIC0zLDEwICszLDEzIEBACiAgCiAgaWZk
ZWYgQ09ORklHX0xPQ0FMVkVSU0lPTgkjIENoZWNrIGlmIGRvdC1jb25maWcgaXMgaW5jbHVkZWQu
CkBAIC0zOCw3ICszOCw3IEBAIEluZGV4OiBsdHRuZy1tb2R1bGVzLTIuMTQuMC9zcmMvS2J1aWxk
CiAgVE9QX0xUVE5HX01PRFVMRVNfRElSIDo9ICQoc2hlbGwgZGlybmFtZSAkKGxhc3R3b3JkICQo
TUFLRUZJTEVfTElTVCkpKS8uLgogIAogIGx0dG5nX2NoZWNrX2xpbnV4X3ZlcnNpb24gPSAkKHNo
ZWxsIHB3ZCkvaW5jbHVkZS9saW51eC92ZXJzaW9uLmgKLUBAIC0xNjgsMyArMTcxLDUgQEAKK0BA
IC0xNjgsMyArMTcxLDUgQEAgb2JqLSQoQ09ORklHX0xUVE5HKSArPSB0ZXN0cy8KICBvYmotJChD
T05GSUdfTFRUTkdfU1lTQ0FMTFNfRVhUUkFDVE9SKSArPSBsdHRuZy1zeXNjYWxscy1leHRyYWN0
b3IubwogIAogICMgdmltOnN5bnRheD1tYWtlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2Vy
bmVsL2x0dG5nL2x0dG5nLW1vZHVsZXNfMi4xNC4yLmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9s
dHRuZy9sdHRuZy1tb2R1bGVzXzIuMTQuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXNfMi4xNC4yLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXNfMi4xNC4zLmJi
CmluZGV4IGM5YzBiMTcyOTEuLjZhMWJkNmEyN2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1r
ZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlc18yLjE0LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtl
cm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzXzIuMTQuMy5iYgpAQCAtMTUsNyArMTUsNyBAQCBTUkNf
VVJJID0gImh0dHBzOi8vbHR0bmcub3JnL2ZpbGVzLyR7QlBOfS8ke0JQTn0tJHtQVn0udGFyLmJ6
MiBcCiAjIFVzZSA6YXBwZW5kIGhlcmUgc28gdGhhdCB0aGUgcGF0Y2ggaXMgYXBwbGllZCBhbHNv
IHdoZW4gdXNpbmcgZGV2dXBzdHJlYW0KIFNSQ19VUkk6YXBwZW5kID0gIiBmaWxlOi8vMDAwMS1z
cmMtS2J1aWxkLWNoYW5nZS1taXNzaW5nLUNPTkZJR19UUkFDRVBPSU5UUy10by13YXJuLnBhdGNo
IFwKICAgICAgICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTU4MWRkNDRlYTYx
YWY4NjlhOTM1ZTcxNDk4ZDQyNzNiZTU5OTQ0ZDU2ZjkwNjEzNWM2NDUxZDY1NDg3NDJhNSIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICIzNWExODc1YWQ5NmU4YjRiNmFhODcyOWY1OWFmMzUwYmZjNzg4
YmE2NWM2ODU2ZGVhYTg0ZDMzYWNjMGYyOGMyIgogCiBleHBvcnQgSU5TVEFMTF9NT0RfRElSID0g
Imtlcm5lbC9sdHRuZy1tb2R1bGVzIgogCi0tIAoyLjQ3LjEKCg==

--===============5791727862806852102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-clock-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-clock-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-clock-plugin-test-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-clock-plugin-test-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-counter-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-counter-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-counter-client-percpu-32-modular-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-counter-client-percpu-32-modular-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-counter-client-percpu-64-modular-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-counter-client-percpu-64-modular-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-lib-ring-buffer-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-lib-ring-buffer-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-block-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-block-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-btrfs-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-btrfs-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-compaction-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-compaction-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-dma-fence-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-dma-fence-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-ext4-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-ext4-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-gpio-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-gpio-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-i2c-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-i2c-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-irq-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-irq-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-jbd2-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-jbd2-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-kmem-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-kmem-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-module-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-module-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-napi-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-napi-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-net-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-net-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-power-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-power-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-printk-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-printk-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-rcu-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-rcu-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-regmap-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-regmap-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-sched-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-sched-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-scsi-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-scsi-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-signal-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-signal-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-skb-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-skb-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-sock-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-sock-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-statedump-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-statedump-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-sunrpc-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-sunrpc-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-timer-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-timer-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-udp-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-udp-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-vmscan-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-vmscan-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-workqueue-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-workqueue-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-x86-irq-vectors-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-x86-irq-vectors-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-discard-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-discard-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-mmap-discard-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-mmap-discard-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-mmap-overwrite-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-mmap-overwrite-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-overwrite-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-overwrite-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-event-notifier-client-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-event-notifier-client-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-metadata-client-6.16.11-yocto-standard: PKGSIZE changed from 25352 to 25704 (+1%)
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-metadata-client-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-metadata-client-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-metadata-mmap-client-6.16.11-yocto-standard: PKGSIZE changed from 25368 to 25720 (+1%)
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-metadata-mmap-client-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-metadata-mmap-client-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-statedump-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-statedump-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-test-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-test-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-tracer-6.16.11-yocto-standard: PKGSIZE changed from 6885672 to 6884960 (-0%)
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-tracer-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-tracer-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-wrapper-6.16.11-yocto-standard: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-wrapper-6.16.11-yocto-standard: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules: SRC_URI changed from "https://lttng.org/files/lttng-modules/lttng-modules-2.14.2.tar.bz2 file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch" to "https://lttng.org/files/lttng-modules/lttng-modules-2.14.3.tar.bz2 file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-dbg: PKGSIZE changed from 74512624 to 74514904 (+0%)
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-dbg: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-dbg: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-dev: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-dev: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-doc: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-doc: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-locale: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-locale: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-src: PKGSIZE changed from 2202578 to 2202486 (-0%)
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-src: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-src: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-staticdev: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-staticdev: PV changed from "2.14.2" to "2.14.3"
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules: PKGV changed from 2.14.2 [default] to 2.14.3 [default]
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules: PV changed from "2.14.2" to "2.14.3"

--===============5791727862806852102==--

