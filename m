Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC5FC36005
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:20 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.10351.1742048287062527983
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cEh2U91O;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=nKOBWHkL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101959a2b6d76-afe27336-aa21-4c9f-8d07-d51f7c05b8ce-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6dvSQMEdH+eApFsiyw7Zfcce7gcLU9IUWs6S0ip6JoQ=;
	b=cEh2U91O1RTB//bNIwn0NjUAhhstq55Kv2GcC3u7HwJS7f582Iyrhz4QkWCWLLq0
	m/fSg5fg7zUK+6wr8Dv7MUCec1v4m+Judy7/gTy7XHbzidsBXqRQNschkwlrv9HgML+
	GdoUuCZh/XWSHKJ9NGznvKv3pT8t0wigBjDSObBE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6dvSQMEdH+eApFsiyw7Zfcce7gcLU9IUWs6S0ip6JoQ=;
	b=nKOBWHkLpyGcQ8+A/MyX1zqjRdPeSC69HZrnOdXJk2strNangxhIex/FDXIAW6NX
	OHuvUpmK/fkHX1PoPdP7/nMB6W6VtemJ1eVjrmnYpGkh0lupDWHE1z2MlDRq5dbwbxE
	vEPVWzbPJu47yQTJiX4MuqCchrFJ4Ros/yoCCj/Q=
Content-Type: multipart/mixed; boundary="===============2289547451857955927=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dhcpcd: upgrading to 10.2.2 SUCCEEDED
Message-ID: <010101959a2b6d76-afe27336-aa21-4c9f-8d07-d51f7c05b8ce-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212886

--===============2289547451857955927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dhcpcd* to *10.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dhcpcd-upgrade-10.1.0-10.2.2.patch
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
From e910e9166dc7068ad15176050459acf82b00a7d1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 07:08:57 +0000
Subject: [PATCH] dhcpcd: upgrade 10.1.0 -> 10.2.2

---
 .../{dhcpcd_10.1.0.bb => dhcpcd_10.2.2.bb}    | 24 +++++++++++++--
 ...mprove-the-sitation-of-working-with-.patch |  5 +---
 ...-conflict-error-when-enable-multilib.patch |  4 +--
 ...llow-the-__NR_rt_sigprocmask-syscall.patch | 30 -------------------
 ...e-INCLUDEDIR-to-prevent-build-issues.patch |  4 +--
 5 files changed, 26 insertions(+), 41 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.1.0.bb => dhcpcd_10.2.2.bb} (73%)
 delete mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.2.bb
similarity index 73%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.2.bb
index 99b72852bf..4d123d6208 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.2.bb
@@ -1,3 +1,22 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,4 +1,4 @@
+# -Copyright (c) 2006-2024 Roy Marples <roy@marples.name>
+# +Copyright (c) 2006-2025 Roy Marples <roy@marples.name>
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 SECTION = "console/network"
 SUMMARY = "dhcpcd - a DHCP client"
 DESCRIPTION = "dhcpcd runs on your machine and silently configures your \
@@ -7,7 +26,7 @@ DESCRIPTION = "dhcpcd runs on your machine and silently configures your \
 HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d296c4bec306f351e676705aaf237c8c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4dda5beb433a809f2e0aeffbf9da3d91"
 
 SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
@@ -15,10 +34,9 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://dhcpcd.service \
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
-           file://0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch \
            "
 
-SRCREV = "57c3506a5622e199cf0e3fc1ef26a71cdedc9521"
+SRCREV = "f6983c18dbf7989f43a2838beeaf62a54c53ff1d"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
index 8d1ed6671a..4f687b0292 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
@@ -1,4 +1,4 @@
-From 02acc4d875ee81e6fd19ef66d69c9f55b4b4a7e7 Mon Sep 17 00:00:00 2001
+From 33710a648a805d96abf49d5adf6ca55b89f9c858 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 9 Nov 2022 16:33:18 +0800
 Subject: [PATCH] 20-resolv.conf: improve the sitation of working with systemd
@@ -77,6 +77,3 @@ index 7c29e276..becc019f 100644
  		"$resolvconf" -d "$ifname" -f
  	else
  		if [ -e "$resolv_conf_dir/$ifname" ]; then
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
index b958110ef1..484b84f94a 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
@@ -1,4 +1,4 @@
-From 1115784dfdf2e7095cf599f9becef705ac57f80e Mon Sep 17 00:00:00 2001
+From e9b1376c59b15e7b03611429187d9d89167154b5 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Fri, 10 Mar 2023 03:48:46 +0000
 Subject: [PATCH] dhcpcd.8: Fix conflict error when enable multilib.
@@ -29,7 +29,7 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/dhcpcd.8.in b/src/dhcpcd.8.in
-index 04bf7d90..9cf10d24 100644
+index 91fdde2c..b467dc3b 100644
 --- a/src/dhcpcd.8.in
 +++ b/src/dhcpcd.8.in
 @@ -826,7 +826,7 @@ Configuration file for dhcpcd.
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch b/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch
deleted file mode 100644
index 7058330165..0000000000
--- a/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From e9e40400003db2e4f12dba85acabbaf2212a520f Mon Sep 17 00:00:00 2001
-From: Scott Shambarger <devel@shambarger.net>
-Date: Sat, 7 Dec 2024 16:37:28 +0000
-Subject: [PATCH] linux: Allow the __NR_rt_sigprocmask syscall
-
-Fixes recent glibc changes to getrandom() used by arc4random().
-Fixes #421.
-
-Upstream-Status: Backport
-See details in https://github.com/NetworkConfiguration/dhcpcd/issues/421
-
-Signed-off-by: Scott Shambarger <devel@shambarger.net>
----
- src/privsep-linux.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index 8357904c9c9a..e3485a2efdfc 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -409,6 +409,9 @@ static struct sock_filter ps_seccomp_filter[] = {
- #ifdef __NR_recvmsg
- 	SECCOMP_ALLOW(__NR_recvmsg),
- #endif
-+#ifdef __NR_rt_sigprocmask
-+	SECCOMP_ALLOW(__NR_rt_sigprocmask),
-+#endif
- #ifdef __NR_rt_sigreturn
- 	SECCOMP_ALLOW(__NR_rt_sigreturn),
- #endif
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
index 8890c2d7dc..fd3fae7e7e 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
@@ -1,4 +1,4 @@
-From 69babef33b0ee4c60d8821797777b9affedd47da Mon Sep 17 00:00:00 2001
+From c2ebc32112e0cd29390b4dc951b65efae36d607b Mon Sep 17 00:00:00 2001
 From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
 Date: Sun, 13 Jan 2019 01:50:52 +0100
 Subject: [PATCH] remove INCLUDEDIR to prevent build issues
@@ -11,7 +11,7 @@ Signed-off-by: Stefano Cappa <stefano.cappa.ks89@gmail.com>
  1 file changed, 5 deletions(-)
 
 diff --git a/configure b/configure
-index 1a772b02..0f915b39 100755
+index a60da137..3673de8b 100755
 --- a/configure
 +++ b/configure
 @@ -26,7 +26,6 @@ BUILD=
-- 
2.44.1


--===============2289547451857955927==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dhcpcd-upgrade-10.1.0-10.2.2.patch"

RnJvbSBlOTEwZTkxNjZkYzcwNjhhZDE1MTc2MDUwNDU5YWNmODJiMDBhN2QxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDc6MDg6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aGNwY2Q6IHVwZ3JhZGUgMTAuMS4wIC0+IDEwLjIuMgoKLS0tCiAuLi4ve2RoY3BjZF8xMC4xLjAu
YmIgPT4gZGhjcGNkXzEwLjIuMi5iYn0gICAgfCAyNCArKysrKysrKysrKysrLS0KIC4uLm1wcm92
ZS10aGUtc2l0YXRpb24tb2Ytd29ya2luZy13aXRoLS5wYXRjaCB8ICA1ICstLS0KIC4uLi1jb25m
bGljdC1lcnJvci13aGVuLWVuYWJsZS1tdWx0aWxpYi5wYXRjaCB8ICA0ICstLQogLi4ubGxvdy10
aGUtX19OUl9ydF9zaWdwcm9jbWFzay1zeXNjYWxsLnBhdGNoIHwgMzAgLS0tLS0tLS0tLS0tLS0t
LS0tLQogLi4uZS1JTkNMVURFRElSLXRvLXByZXZlbnQtYnVpbGQtaXNzdWVzLnBhdGNoIHwgIDQg
Ky0tCiA1IGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL3tkaGNwY2RfMTAuMS4wLmJi
ID0+IGRoY3BjZF8xMC4yLjIuYmJ9ICg3MyUpCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1saW51eC1BbGxvdy10aGUtX19OUl9y
dF9zaWdwcm9jbWFzay1zeXNjYWxsLnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEwLjEuMC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvZGhjcGNkL2RoY3BjZF8xMC4yLjIuYmIKc2ltaWxhcml0eSBpbmRleCA3MyUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEwLjEuMC5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEwLjIuMi5i
YgppbmRleCA5OWI3Mjg1MmJmLi40ZDEyM2Q2MjA4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2RoY3BjZC9kaGNwY2RfMTAuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvZGhjcGNkL2RoY3BjZF8xMC4yLjIuYmIKQEAgLTEsMyArMSwyMiBAQAorIyBG
SVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdk
ZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdl
ZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhl
IExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisj
IHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBs
ZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUg
Y2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysrIExJQ0VOU0UKKyMgQEAgLTEsNCArMSw0
IEBACisjIC1Db3B5cmlnaHQgKGMpIDIwMDYtMjAyNCBSb3kgTWFycGxlcyA8cm95QG1hcnBsZXMu
bmFtZT4KKyMgK0NvcHlyaWdodCAoYykgMjAwNi0yMDI1IFJveSBNYXJwbGVzIDxyb3lAbWFycGxl
cy5uYW1lPgorIyAgQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgIAorIyAgUmVkaXN0cmlidXRpb24g
YW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0CisjIAor
IworCiBTRUNUSU9OID0gImNvbnNvbGUvbmV0d29yayIKIFNVTU1BUlkgPSAiZGhjcGNkIC0gYSBE
SENQIGNsaWVudCIKIERFU0NSSVBUSU9OID0gImRoY3BjZCBydW5zIG9uIHlvdXIgbWFjaGluZSBh
bmQgc2lsZW50bHkgY29uZmlndXJlcyB5b3VyIFwKQEAgLTcsNyArMjYsNyBAQCBERVNDUklQVElP
TiA9ICJkaGNwY2QgcnVucyBvbiB5b3VyIG1hY2hpbmUgYW5kIHNpbGVudGx5IGNvbmZpZ3VyZXMg
eW91ciBcCiBIT01FUEFHRSA9ICJodHRwOi8vcm95Lm1hcnBsZXMubmFtZS9wcm9qZWN0cy9kaGNw
Y2QvIgogCiBMSUNFTlNFID0gIkJTRC0yLUNsYXVzZSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0U7bWQ1PWQyOTZjNGJlYzMwNmYzNTFlNjc2NzA1YWFmMjM3YzhjIgorTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NGRkYTViZWI0MzNhODA5ZjJlMGFlZmZi
ZjlkYTNkOTEiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9OZXR3b3JrQ29uZmlndXJh
dGlvbi9kaGNwY2Q7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciBcCiAgICAgICAgICAgIGZp
bGU6Ly8wMDAxLXJlbW92ZS1JTkNMVURFRElSLXRvLXByZXZlbnQtYnVpbGQtaXNzdWVzLnBhdGNo
IFwKQEAgLTE1LDEwICszNCw5IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9OZXR3b3Jr
Q29uZmlndXJhdGlvbi9kaGNwY2Q7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hCiAgICAgICAgICAg
IGZpbGU6Ly9kaGNwY2Quc2VydmljZSBcCiAgICAgICAgICAgIGZpbGU6Ly9kaGNwY2RALnNlcnZp
Y2UgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3It
d2hlbi1lbmFibGUtbXVsdGlsaWIucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1saW51
eC1BbGxvdy10aGUtX19OUl9ydF9zaWdwcm9jbWFzay1zeXNjYWxsLnBhdGNoIFwKICAgICAgICAg
ICAgIgogCi1TUkNSRVYgPSAiNTdjMzUwNmE1NjIyZTE5OWNmMGUzZmMxZWYyNmE3MWNkZWRjOTUy
MSIKK1NSQ1JFViA9ICJmNjk4M2MxOGRiZjc5ODlmNDNhMjgzOGJlZWFmNjJhNTRjNTNmZjFkIgog
UyA9ICIke1dPUktESVJ9L2dpdCIKIAogaW5oZXJpdCBwa2djb25maWcgYXV0b3Rvb2xzLWJyb2tl
bnNlcCBzeXN0ZW1kIHVzZXJhZGQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvZGhjcGNkL2ZpbGVzLzAwMDEtMjAtcmVzb2x2LmNvbmYtaW1wcm92ZS10aGUtc2l0YXRpb24t
b2Ytd29ya2luZy13aXRoLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNk
L2ZpbGVzLzAwMDEtMjAtcmVzb2x2LmNvbmYtaW1wcm92ZS10aGUtc2l0YXRpb24tb2Ytd29ya2lu
Zy13aXRoLS5wYXRjaAppbmRleCA4ZDFlZDY2NzFhLi40ZjY4N2IwMjkyIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLTIwLXJlc29sdi5jb25m
LWltcHJvdmUtdGhlLXNpdGF0aW9uLW9mLXdvcmtpbmctd2l0aC0ucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS0yMC1yZXNvbHYuY29uZi1pbXBy
b3ZlLXRoZS1zaXRhdGlvbi1vZi13b3JraW5nLXdpdGgtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSAwMmFjYzRkODc1ZWU4MWU2ZmQxOWVmNjZkNjljOWY1NWI0YjRhN2U3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSAzMzcxMGE2NDhhODA1ZDk2YWJmNDlkNWFkZjZjYTU1Yjg5Zjlj
ODU4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5k
cml2ZXIuY29tPgogRGF0ZTogV2VkLCA5IE5vdiAyMDIyIDE2OjMzOjE4ICswODAwCiBTdWJqZWN0
OiBbUEFUQ0hdIDIwLXJlc29sdi5jb25mOiBpbXByb3ZlIHRoZSBzaXRhdGlvbiBvZiB3b3JraW5n
IHdpdGggc3lzdGVtZApAQCAtNzcsNiArNzcsMyBAQCBpbmRleCA3YzI5ZTI3Ni4uYmVjYzAxOWYg
MTAwNjQ0CiAgCQkiJHJlc29sdmNvbmYiIC1kICIkaWZuYW1lIiAtZgogIAllbHNlCiAgCQlpZiBb
IC1lICIkcmVzb2x2X2NvbmZfZGlyLyRpZm5hbWUiIF07IHRoZW4KLS0tIAotMi4xNy4xCi0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtZGhj
cGNkLjgtRml4LWNvbmZsaWN0LWVycm9yLXdoZW4tZW5hYmxlLW11bHRpbGliLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1kaGNwY2QuOC1GaXgtY29u
ZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUtbXVsdGlsaWIucGF0Y2gKaW5kZXggYjk1ODExMGVmMS4u
NDg0Yjg0Zjk0YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2Qv
ZmlsZXMvMDAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUtbXVsdGls
aWIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAw
MS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUtbXVsdGlsaWIucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDExMTU3ODRkZmRmMmU3MDk1Y2Y1OTlmOWJlY2VmNzA1YWM1
N2Y4MGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGU5YjEzNzZjNTliMTVlN2IwMzYx
MTQyOTE4N2Q5ZDg5MTY3MTU0YjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBMZWkg
TWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+CiBEYXRlOiBGcmksIDEwIE1hciAyMDIzIDAz
OjQ4OjQ2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRoY3BjZC44OiBGaXggY29uZmxpY3QgZXJy
b3Igd2hlbiBlbmFibGUgbXVsdGlsaWIuCkBAIC0yOSw3ICsyOSw3IEBAIFNpZ25lZC1vZmYtYnk6
IExlaSBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9kaGNwY2QuOC5p
biBiL3NyYy9kaGNwY2QuOC5pbgotaW5kZXggMDRiZjdkOTAuLjljZjEwZDI0IDEwMDY0NAoraW5k
ZXggOTFmZGRlMmMuLmI0NjdkYzNiIDEwMDY0NAogLS0tIGEvc3JjL2RoY3BjZC44LmluCiArKysg
Yi9zcmMvZGhjcGNkLjguaW4KIEBAIC04MjYsNyArODI2LDcgQEAgQ29uZmlndXJhdGlvbiBmaWxl
IGZvciBkaGNwY2QuCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3Bj
ZC9maWxlcy8wMDAxLWxpbnV4LUFsbG93LXRoZS1fX05SX3J0X3NpZ3Byb2NtYXNrLXN5c2NhbGwu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLWxpbnV4
LUFsbG93LXRoZS1fX05SX3J0X3NpZ3Byb2NtYXNrLXN5c2NhbGwucGF0Y2gKZGVsZXRlZCBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDcwNTgzMzAxNjUuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1saW51eC1BbGxvdy10aGUtX19OUl9y
dF9zaWdwcm9jbWFzay1zeXNjYWxsLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzAgKzAsMCBA
QAotRnJvbSBlOWU0MDQwMDAwM2RiMmU0ZjEyZGJhODVhY2FiYmFmMjIxMmE1MjBmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQotRnJvbTogU2NvdHQgU2hhbWJhcmdlciA8ZGV2ZWxAc2hhbWJhcmdl
ci5uZXQ+Ci1EYXRlOiBTYXQsIDcgRGVjIDIwMjQgMTY6Mzc6MjggKzAwMDAKLVN1YmplY3Q6IFtQ
QVRDSF0gbGludXg6IEFsbG93IHRoZSBfX05SX3J0X3NpZ3Byb2NtYXNrIHN5c2NhbGwKLQotRml4
ZXMgcmVjZW50IGdsaWJjIGNoYW5nZXMgdG8gZ2V0cmFuZG9tKCkgdXNlZCBieSBhcmM0cmFuZG9t
KCkuCi1GaXhlcyAjNDIxLgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0Ci1TZWUgZGV0YWls
cyBpbiBodHRwczovL2dpdGh1Yi5jb20vTmV0d29ya0NvbmZpZ3VyYXRpb24vZGhjcGNkL2lzc3Vl
cy80MjEKLQotU2lnbmVkLW9mZi1ieTogU2NvdHQgU2hhbWJhcmdlciA8ZGV2ZWxAc2hhbWJhcmdl
ci5uZXQ+Ci0tLS0KLSBzcmMvcHJpdnNlcC1saW51eC5jIHwgMyArKysKLSAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspCi0KLWRpZmYgLS1naXQgYS9zcmMvcHJpdnNlcC1saW51eC5jIGIv
c3JjL3ByaXZzZXAtbGludXguYwotaW5kZXggODM1NzkwNGM5YzlhLi5lMzQ4NWEyZWZkZmMgMTAw
NjQ0Ci0tLS0gYS9zcmMvcHJpdnNlcC1saW51eC5jCi0rKysgYi9zcmMvcHJpdnNlcC1saW51eC5j
Ci1AQCAtNDA5LDYgKzQwOSw5IEBAIHN0YXRpYyBzdHJ1Y3Qgc29ja19maWx0ZXIgcHNfc2VjY29t
cF9maWx0ZXJbXSA9IHsKLSAjaWZkZWYgX19OUl9yZWN2bXNnCi0gCVNFQ0NPTVBfQUxMT1coX19O
Ul9yZWN2bXNnKSwKLSAjZW5kaWYKLSsjaWZkZWYgX19OUl9ydF9zaWdwcm9jbWFzawotKwlTRUND
T01QX0FMTE9XKF9fTlJfcnRfc2lncHJvY21hc2spLAotKyNlbmRpZgotICNpZmRlZiBfX05SX3J0
X3NpZ3JldHVybgotIAlTRUNDT01QX0FMTE9XKF9fTlJfcnRfc2lncmV0dXJuKSwKLSAjZW5kaWYK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEt
cmVtb3ZlLUlOQ0xVREVESVItdG8tcHJldmVudC1idWlsZC1pc3N1ZXMucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLXJlbW92ZS1JTkNMVURFRElSLXRv
LXByZXZlbnQtYnVpbGQtaXNzdWVzLnBhdGNoCmluZGV4IDg4OTBjMmQ3ZGMuLmZkM2ZhZTdlN2Ug
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEt
cmVtb3ZlLUlOQ0xVREVESVItdG8tcHJldmVudC1idWlsZC1pc3N1ZXMucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1yZW1vdmUtSU5DTFVERURJ
Ui10by1wcmV2ZW50LWJ1aWxkLWlzc3Vlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNjli
YWJlZjMzYjBlZTRjNjBkODgyMTc5Nzc3N2I5YWZmZWRkNDdkYSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gYzJlYmMzMjExMmUwY2QyOTM5MGI0ZGM5NTFiNjVlZmFlMzZkNjA3YiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFN0ZWZhbm8gQ2FwcGEgPHN0ZWZhbm8uY2FwcGEu
a3M4OUBnbWFpbC5jb20+CiBEYXRlOiBTdW4sIDEzIEphbiAyMDE5IDAxOjUwOjUyICswMTAwCiBT
dWJqZWN0OiBbUEFUQ0hdIHJlbW92ZSBJTkNMVURFRElSIHRvIHByZXZlbnQgYnVpbGQgaXNzdWVz
CkBAIC0xMSw3ICsxMSw3IEBAIFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gQ2FwcGEgPHN0ZWZhbm8u
Y2FwcGEua3M4OUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pCiAK
IGRpZmYgLS1naXQgYS9jb25maWd1cmUgYi9jb25maWd1cmUKLWluZGV4IDFhNzcyYjAyLi4wZjkx
NWIzOSAxMDA3NTUKK2luZGV4IGE2MGRhMTM3Li4zNjczZGU4YiAxMDA3NTUKIC0tLSBhL2NvbmZp
Z3VyZQogKysrIGIvY29uZmlndXJlCiBAQCAtMjYsNyArMjYsNiBAQCBCVUlMRD0KLS0gCjIuNDQu
MQoK

--===============2289547451857955927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PKGSIZE changed from 1308736 to 1336424 (+2%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PV changed from "10.1.0" to "10.2.2"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PKGV changed from 10.1.0 [default] to 10.2.2 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dev: PV changed from "10.1.0" to "10.2.2"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dev: PKGV changed from 10.1.0 [default] to 10.2.2 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PKGSIZE changed from 65175 to 66983 (+3%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PV changed from "10.1.0" to "10.2.2"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PKGV changed from 10.1.0 [default] to 10.2.2 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-locale: PV changed from "10.1.0" to "10.2.2"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-locale: PKGV changed from 10.1.0 [default] to 10.2.2 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PKGSIZE changed from 1100903 to 1117821 (+2%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PV changed from "10.1.0" to "10.2.2"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PKGV changed from 10.1.0 [default] to 10.2.2 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-staticdev: PV changed from "10.1.0" to "10.2.2"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-staticdev: PKGV changed from 10.1.0 [default] to 10.2.2 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PKGSIZE changed from 432568 to 436664 (+1%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PV changed from "10.1.0" to "10.2.2"
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PKGV changed from 10.1.0 [default] to 10.2.2 [default]
packages/core2-64-poky-linux/dhcpcd: SRC_URI changed from "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch file://dhcpcd.service file://dhcpcd@.service file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch file://0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch" to "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch file://dhcpcd.service file://dhcpcd@.service file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch"
packages/core2-64-poky-linux/dhcpcd: PV changed from "10.1.0" to "10.2.2"
packages/core2-64-poky-linux/dhcpcd: PKGV changed from 10.1.0 [default] to 10.2.2 [default]

--===============2289547451857955927==--

