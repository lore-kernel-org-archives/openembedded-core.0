Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA7AD21684
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:14 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.11804.1728994557069446800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=X03OaGNA;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=USj3m1Nv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010192901b5469-8baaf807-bafa-4f47-9437-1748b039d12a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994563;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JAP0ku4U5DfXI/uAJ2KVnE3dc8zSckw3lLIEMkdG1Yc=;
	b=X03OaGNADGwcPw9CJmD4aJ+4ns6OUdsE4p6QysRggCOibH6XoxJssy5/Rm604sjC
	haglDPS/p3j8RH88HaF1epaNICMSHHzJggbrw9Rvy4IVbUXwQGGHmhEhODUfgZOlolZ
	bmU/xJioKY2zyflblw+7FAo1S+WZH9zjDFgK6gDQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994563;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JAP0ku4U5DfXI/uAJ2KVnE3dc8zSckw3lLIEMkdG1Yc=;
	b=USj3m1NvLc51om7rjBYdgYaL/18Lmr8Jx1rZKRYOEFCLyiZ6WehlLzl3kWhFMjB5
	Od3uJNsT+S4borFfegbKP3iAOeAcsEr0Z4zkndXE2MB2Ck07OrsCZvDNgYFur5nqvHV
	oyVC+QZtej7daIYs3Ax2wnL675LTv3HZvfG9zPIA=
Content-Type: multipart/mixed; boundary="===============0557414038814703646=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libarchive: upgrading to 3.7.7 SUCCEEDED
Message-ID: <01010192901b5469-8baaf807-bafa-4f47-9437-1748b039d12a-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:16:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205864

--===============0557414038814703646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libarchive* to *3.7.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libarchive-upgrade-3.7.6-3.7.7.patch
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
From 5f8bbca486eef37229a035cdac70977a427dd237 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 09:46:14 +0000
Subject: [PATCH] libarchive: upgrade 3.7.6 -> 3.7.7

---
 .../libarchive/{libarchive_3.7.6.bb => libarchive_3.7.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.7.6.bb => libarchive_3.7.7.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.6.bb b/meta/recipes-extended/libarchive/libarchive_3.7.7.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.7.6.bb
rename to meta/recipes-extended/libarchive/libarchive_3.7.7.bb
index a1cb34415e..0a0a6b374b 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.6.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.7.bb
@@ -33,7 +33,7 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "b4071807367b15b72777c2eaac80f42c8ea2d20212ab279514a19fe1f6f96ef4"
+SRC_URI[sha256sum] = "4cc540a3e9a1eebdefa1045d2e4184831100667e6d7d5b315bb1cbc951f8ddff"
 
 CVE_STATUS[CVE-2023-30571] = "upstream-wontfix: upstream has documented that reported function is not thread-safe"
 
-- 
2.44.1


--===============0557414038814703646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libarchive/libarchive: FILELIST: removed "/usr/lib/libarchive.so.13.7.6", added "/usr/lib/libarchive.so.13.7.7"
Changes to packages/core2-64-poky-linux/libarchive (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.7.6 to libarchive.so.13.7.7
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.7.6 to libarchive.so.13.7.7
  /usr/lib/libarchive.so.13.7.6 moved to /usr/lib/libarchive.so.13.7.7
Changes to packages/x86_64-linux/libarchive-native (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.7.6 to libarchive.so.13.7.7
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.7.6 to libarchive.so.13.7.7
  /usr/lib/libarchive.so.13.7.6 moved to /usr/lib/libarchive.so.13.7.7

--===============0557414038814703646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9422342 to 9620507 (+2%)
packages/core2-64-poky-linux/libarchive/bsdcpio: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-64-poky-linux/libarchive/bsdcpio: PV changed from "3.7.6" to "3.7.7"
packages/core2-64-poky-linux/libarchive/bsdtar: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-64-poky-linux/libarchive/bsdtar: PV changed from "3.7.6" to "3.7.7"
packages/core2-64-poky-linux/libarchive: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-64-poky-linux/libarchive: PV changed from "3.7.6" to "3.7.7"
packages/core2-64-poky-linux/libarchive: SRC_URI changed from "https://libarchive.org/downloads/libarchive-3.7.6.tar.gz" to "https://libarchive.org/downloads/libarchive-3.7.7.tar.gz"
packages/core2-64-poky-linux/libarchive/libarchive-dbg: PKGSIZE changed from 2959296 to 2961160 (+0%)
packages/core2-64-poky-linux/libarchive/libarchive-dbg: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-64-poky-linux/libarchive/libarchive-dbg: FILELIST: removed "/usr/lib/.debug/libarchive.so.13.7.6", added "/usr/lib/.debug/libarchive.so.13.7.7"
packages/core2-64-poky-linux/libarchive/libarchive-dbg: PV changed from "3.7.6" to "3.7.7"
packages/core2-64-poky-linux/libarchive/libarchive-dev: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-64-poky-linux/libarchive/libarchive-dev: PV changed from "3.7.6" to "3.7.7"
packages/core2-64-poky-linux/libarchive/libarchive-doc: PKGSIZE changed from 378215 to 373178 (-1%)
packages/core2-64-poky-linux/libarchive/libarchive-doc: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-64-poky-linux/libarchive/libarchive-doc: PV changed from "3.7.6" to "3.7.7"
packages/core2-64-poky-linux/libarchive/libarchive-locale: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-64-poky-linux/libarchive/libarchive-locale: PV changed from "3.7.6" to "3.7.7"
packages/core2-64-poky-linux/libarchive/libarchive-src: PKGSIZE changed from 3611145 to 3592025 (-1%)
packages/core2-64-poky-linux/libarchive/libarchive-src: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-64-poky-linux/libarchive/libarchive-src: PV changed from "3.7.6" to "3.7.7"
packages/core2-64-poky-linux/libarchive/libarchive-staticdev: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-64-poky-linux/libarchive/libarchive-staticdev: PV changed from "3.7.6" to "3.7.7"
packages/core2-64-poky-linux/libarchive/libarchive: PKGSIZE changed from 821428 to 825524 (+0%)
packages/core2-64-poky-linux/libarchive/libarchive: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-64-poky-linux/libarchive/libarchive: FILELIST: removed "/usr/lib/libarchive.so.13.7.6", added "/usr/lib/libarchive.so.13.7.7"
packages/core2-64-poky-linux/libarchive/libarchive: PV changed from "3.7.6" to "3.7.7"
Changes to packages/core2-64-poky-linux/libarchive (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.7.6 to libarchive.so.13.7.7
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.7.6 to libarchive.so.13.7.7
  /usr/lib/libarchive.so.13.7.6 moved to /usr/lib/libarchive.so.13.7.7
Changes to packages/x86_64-linux/libarchive-native (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.7.6 to libarchive.so.13.7.7
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.7.6 to libarchive.so.13.7.7
  /usr/lib/libarchive.so.13.7.6 moved to /usr/lib/libarchive.so.13.7.7

--===============0557414038814703646==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libarchive-upgrade-3.7.6-3.7.7.patch"

RnJvbSA1ZjhiYmNhNDg2ZWVmMzcyMjlhMDM1Y2RhYzcwOTc3YTQyN2RkMjM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDk6NDY6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJhcmNoaXZlOiB1cGdyYWRlIDMuNy42IC0+IDMuNy43CgotLS0KIC4uLi9saWJhcmNoaXZlL3ts
aWJhcmNoaXZlXzMuNy42LmJiID0+IGxpYmFyY2hpdmVfMy43LjcuYmJ9ICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL3tsaWJhcmNoaXZlXzMuNy42LmJiID0+IGxpYmFy
Y2hpdmVfMy43LjcuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjcuNi5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
aWJhcmNoaXZlL2xpYmFyY2hpdmVfMy43LjcuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjcuNi5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8z
LjcuNy5iYgppbmRleCBhMWNiMzQ0MTVlLi4wYTBhNmIzNzRiIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlXzMuNy42LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmVfMy43LjcuYmIKQEAgLTMzLDcg
KzMzLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2xpYmFyY2hpdmUub3JnL2Rvd25sb2Fkcy9saWJh
cmNoaXZlLSR7UFZ9LnRhci5neiIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHA6Ly9saWJh
cmNoaXZlLm9yZy8iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiNDA3MTgwNzM2N2IxNWI3Mjc3
N2MyZWFhYzgwZjQyYzhlYTJkMjAyMTJhYjI3OTUxNGExOWZlMWY2Zjk2ZWY0IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjRjYzU0MGEzZTlhMWVlYmRlZmExMDQ1ZDJlNDE4NDgzMTEwMDY2N2U2ZDdk
NWIzMTViYjFjYmM5NTFmOGRkZmYiCiAKIENWRV9TVEFUVVNbQ1ZFLTIwMjMtMzA1NzFdID0gInVw
c3RyZWFtLXdvbnRmaXg6IHVwc3RyZWFtIGhhcyBkb2N1bWVudGVkIHRoYXQgcmVwb3J0ZWQgZnVu
Y3Rpb24gaXMgbm90IHRocmVhZC1zYWZlIgogCi0tIAoyLjQ0LjEKCg==

--===============0557414038814703646==--

