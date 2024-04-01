Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0620CD13C9
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:32 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1997.1711994601991325208
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IFdleVPc;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=hoNhOryw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018e9ad47e0b-57ee193c-2b82-48e2-b106-76762a8c9309-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LFPuCGQxMJQUXjvAYIls5l3e0DFV78DRSYhZNl2E1xE=;
	b=IFdleVPcFtA8c9Q0uGzW06IjhQZfd+dkei1LTFioSDOscq6omaGdHtEjmozzaf8I
	ViHT1osIP3f5I9s51ZsFsuWm9O+ZwpA86nnL/NCqhT87YkRiBXJGCxIMftJcXVMwpRH
	b5Jm0YE1YALy2CIYc8e2PilkGJ89ACXtp9HLqdkk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LFPuCGQxMJQUXjvAYIls5l3e0DFV78DRSYhZNl2E1xE=;
	b=hoNhOrywJCqIMa6WKKqSKcyd2q2JHwTBVyRpaqaX7WwZW85wvENFRhywaCuyB6ka
	U86sOYVB4qmJfkq+yC9O3dy8YfxLS2Uneoavox/BsdX3eYtuNePW2ZT4LZwM1myipVC
	F5+tlt4+P9Kg8Ogl274XmyTxgheHfG/d6t5z0xfs=
Content-Type: multipart/mixed; boundary="===============7313616707152000065=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 2.2.0 SUCCEEDED
Message-ID: <0101018e9ad47e0b-57ee193c-2b82-48e2-b106-76762a8c9309-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197728

--===============7313616707152000065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pkgconf* to *2.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-2.1.1-2.2.0.patch
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
From 3147a9f92b82e0e205862d0d9c5516a6b6067827 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 07:33:44 +0000
Subject: [PATCH] pkgconf: upgrade 2.1.1 -> 2.2.0

---
 .../pkgconf/{pkgconf_2.1.1.bb => pkgconf_2.2.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_2.1.1.bb => pkgconf_2.2.0.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.1.1.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.2.0.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_2.1.1.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.2.0.bb
index 33d69451bb..e98458ea55 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.1.1.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.2.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "3a224f2accf091b77a5781316e27b9ee3ba82c083cc2e539e08940b68a44fec5"
+SRC_URI[sha256sum] = "b06ff63a83536aa8c2f6422fa80ad45e4833f590266feb14eaddfe1d4c853c69"
 
 inherit autotools
 
-- 
2.42.0


--===============7313616707152000065==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-2.1.1-2.2.0.patch"

RnJvbSAzMTQ3YTlmOTJiODJlMGUyMDU4NjJkMGQ5YzU1MTZhNmI2MDY3ODI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwNzozMzo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBr
Z2NvbmY6IHVwZ3JhZGUgMi4xLjEgLT4gMi4yLjAKCi0tLQogLi4uL3BrZ2NvbmYve3BrZ2NvbmZf
Mi4xLjEuYmIgPT4gcGtnY29uZl8yLjIuMC5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3BrZ2NvbmYve3BrZ2NvbmZfMi4xLjEuYmIgPT4gcGtnY29uZl8yLjIuMC5i
Yn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2dj
b25mXzIuMS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8yLjIu
MC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGtnY29uZi9wa2djb25mXzIuMS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGtnY29uZi9wa2djb25mXzIuMi4wLmJiCmluZGV4IDMzZDY5NDUxYmIuLmU5ODQ1OGVhNTUg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMi4xLjEu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8yLjIuMC5iYgpA
QCAtMjAsNyArMjAsNyBAQCBTUkNfVVJJID0gIlwKICAgICBmaWxlOi8vcGtnLWNvbmZpZy1uYXRp
dmUuaW4gXAogICAgIGZpbGU6Ly9wa2ctY29uZmlnLWVzZGsuaW4gXAogIgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjNhMjI0ZjJhY2NmMDkxYjc3YTU3ODEzMTZlMjdiOWVlM2JhODJjMDgzY2MyZTUz
OWUwODk0MGI2OGE0NGZlYzUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjA2ZmY2M2E4MzUzNmFh
OGMyZjY0MjJmYTgwYWQ0NWU0ODMzZjU5MDI2NmZlYjE0ZWFkZGZlMWQ0Yzg1M2M2OSIKIAogaW5o
ZXJpdCBhdXRvdG9vbHMKIAotLSAKMi40Mi4wCgo=

--===============7313616707152000065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/pkgconf/pkgconf: FILELIST: removed "/usr/lib/libpkgconf.so.4.0.0 /usr/lib/libpkgconf.so.4", added "/usr/lib/libpkgconf.so.5.0.0 /usr/lib/libpkgconf.so.5"
Changes to packages/core2-64-poky-linux/pkgconf (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.4.0.0 to libpkgconf.so.5.0.0
  /usr/lib/libpkgconf.so.4.0.0 moved to /usr/lib/libpkgconf.so.5.0.0
  /usr/lib/libpkgconf.so.4 moved to /usr/lib/libpkgconf.so.5

--===============7313616707152000065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-2.1.1.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-2.2.0.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/core2-64-poky-linux/pkgconf: PV changed from "2.1.1" to "2.2.0"
packages/core2-64-poky-linux/pkgconf: PKGV changed from 2.1.1 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: FILELIST: removed "/usr/lib/.debug/libpkgconf.so.4.0.0", added "/usr/lib/.debug/libpkgconf.so.5.0.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 315272 to 315040 (-0%)
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PV changed from "2.1.1" to "2.2.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 2.1.1 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 24495 to 24378 (-0%)
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PV changed from "2.1.1" to "2.2.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 2.1.1 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: PV changed from "2.1.1" to "2.2.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 2.1.1 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-locale: PV changed from "2.1.1" to "2.2.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 2.1.1 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 274832 to 275510 (+0%)
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PV changed from "2.1.1" to "2.2.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PKGV changed from 2.1.1 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "2.1.1" to "2.2.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 2.1.1 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf: FILELIST: removed "/usr/lib/libpkgconf.so.4.0.0 /usr/lib/libpkgconf.so.4", added "/usr/lib/libpkgconf.so.5.0.0 /usr/lib/libpkgconf.so.5"
packages/core2-64-poky-linux/pkgconf/pkgconf: PV changed from "2.1.1" to "2.2.0"
packages/core2-64-poky-linux/pkgconf/pkgconf: PKGV changed from 2.1.1 [default] to 2.2.0 [default]
Changes to packages/core2-64-poky-linux/pkgconf (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.4.0.0 to libpkgconf.so.5.0.0
  /usr/lib/libpkgconf.so.4.0.0 moved to /usr/lib/libpkgconf.so.5.0.0
  /usr/lib/libpkgconf.so.4 moved to /usr/lib/libpkgconf.so.5

--===============7313616707152000065==--

