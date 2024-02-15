Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BCEC54E52
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:32 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.20184.1708018347012599836
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MJcMOo+L;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pZc3mRGg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018dadd3a9fc-082d9383-8007-4d39-9758-1632e5859160-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hq/h3BFBFQlBu5YyVTcVxiHyKQObGKRNUBpZq9bq2z4=;
	b=MJcMOo+LCUyFnn7XT0lz5N0QGEtpX0VjkYf3/yJX5K5vNmE6ZJp5kF2TyhjF/ra7
	8vxGXytNw1f5qRO+5yvgq6aGEf105YPiJIW4SNbLYzvATrXgjsmh6eg4oEAU6gzymCL
	Bi4rEWNfwrOW0LkSp//NRobL0BQ8/VJhvMELjUPA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hq/h3BFBFQlBu5YyVTcVxiHyKQObGKRNUBpZq9bq2z4=;
	b=pZc3mRGgRLVtHaiIAr2Arnx8QktLUtcWnKqp4SVRv9eHSud0u06Tit180n5W+XJF
	ApdkHCtkGD3pNpAdJI4HXh+HAx5l+DTdTHusD0dKEyTLn/Ui62Bbpn1ZDHLTvPIAFPs
	jukcHV4wV4ING8eitqDmD4+4t9R1WLkaStk0T4E8=
Content-Type: multipart/mixed; boundary="===============1763078436443967692=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpciaccess: upgrading to 0.18 FAILED
Message-ID: <0101018dadd3a9fc-082d9383-8007-4d39-9758-1632e5859160-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195652

--===============1763078436443967692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpciaccess* to *0.18* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libpciaccess-upgrade-0.17-0.18.patch
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
From f38a2472c1bdba08ddf377e0174f9717cbb19965 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 14:18:37 +0000
Subject: [PATCH] libpciaccess: upgrade 0.17 -> 0.18

---
 ...pwrite-pread-instead-of-64bit-versio.patch | 39 -------------------
 ...pciaccess_0.17.bb => libpciaccess_0.18.bb} | 28 +++++++++++--
 2 files changed, 24 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.17.bb => libpciaccess_0.18.bb} (24%)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess/0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch b/meta/recipes-graphics/xorg-lib/libpciaccess/0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch
deleted file mode 100644
index 512a473e20..0000000000
--- a/meta/recipes-graphics/xorg-lib/libpciaccess/0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From d20ff4f2e4feaafa6a6191b9cae3815b85617943 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 11 Nov 2022 11:15:58 -0800
-Subject: [PATCH] linux_sysfs: Use pwrite/pread instead of 64bit versions
-
-pread64/pwrite64 are aliased to pread/pwrite when largefile support is
-enabled e.g. using _FILE_OFFSET_BITS=64 macro
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/merge_requests/26]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/linux_sysfs.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/linux_sysfs.c b/src/linux_sysfs.c
-index d62f48c..20c800e 100644
---- a/src/linux_sysfs.c
-+++ b/src/linux_sysfs.c
-@@ -462,7 +462,7 @@ pci_device_linux_sysfs_read( struct pci_device * dev, void * data,
- 
- 
-     while ( temp_size > 0 ) {
--	const ssize_t bytes = pread64( fd, data_bytes, temp_size, offset );
-+	const ssize_t bytes = pread( fd, data_bytes, temp_size, offset );
- 
- 	/* If zero bytes were read, then we assume it's the end of the
- 	 * config file.
-@@ -522,7 +522,7 @@ pci_device_linux_sysfs_write( struct pci_device * dev, const void * data,
- 
- 
-     while ( temp_size > 0 ) {
--	const ssize_t bytes = pwrite64( fd, data_bytes, temp_size, offset );
-+	const ssize_t bytes = pwrite( fd, data_bytes, temp_size, offset );
- 
- 	/* If zero bytes were written, then we assume it's the end of the
- 	 * config file.
--- 
-2.38.1
-
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb
similarity index 24%
rename from meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb
rename to meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb
index 54bdb08976..d275076043 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb
@@ -1,3 +1,25 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -2,7 +2,7 @@
+#  (C) Copyright Eric Anholt 2006
+#  (C) Copyright Mark Kettenis 2011
+#  (C) Copyright Robert Millan 2012
+# -Copyright (c) 2007, 2008, 2009, 2011, 2012, 2013 Oracle and/or its affiliates.
+# +Copyright (c) 2007, 2008, 2009, 2011, 2012, 2016 Oracle and/or its affiliates.
+#  Copyright 2009, 2012 Red Hat, Inc.
+#  All Rights Reserved.
+#  
+# 
+#
+
 SUMMARY = "Generic PCI access library for X"
 
 DESCRIPTION = "libpciaccess provides functionality for X to access the \
@@ -5,12 +27,10 @@ PCI bus and devices in a platform-independent way."
 
 require xorg-lib-common.inc
 
-SRC_URI += "file://0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch"
-
-SRC_URI[sha256sum] = "74283ba3c974913029e7a547496a29145b07ec51732bbb5b5c58d5025ad95b73"
+SRC_URI[sha256sum] = "5461b0257d495254346f52a9c329b44b346262663675d3fecdb204a7e7c262a9"
 
 LICENSE = "MIT & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=277aada5222b9a22fbf3471ff3687068"
+LIC_FILES_CHKSUM = "file://COPYING;md5=54c978968e565218eea36cf03ef24352"
 
 REQUIRED_DISTRO_FEATURES = ""
 
-- 
2.42.0


--===============1763078436443967692==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpciaccess-upgrade-0.17-0.18.patch"

RnJvbSBmMzhhMjQ3MmMxYmRiYTA4ZGRmMzc3ZTAxNzRmOTcxN2NiYjE5OTY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTQ6MTg6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwY2lhY2Nlc3M6IHVwZ3JhZGUgMC4xNyAtPiAwLjE4CgotLS0KIC4uLnB3cml0ZS1wcmVhZC1p
bnN0ZWFkLW9mLTY0Yml0LXZlcnNpby5wYXRjaCB8IDM5IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4u
LnBjaWFjY2Vzc18wLjE3LmJiID0+IGxpYnBjaWFjY2Vzc18wLjE4LmJifSB8IDI4ICsrKysrKysr
KysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0p
CiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnBj
aWFjY2Vzcy8wMDAxLWxpbnV4X3N5c2ZzLVVzZS1wd3JpdGUtcHJlYWQtaW5zdGVhZC1vZi02NGJp
dC12ZXJzaW8ucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve2xp
YnBjaWFjY2Vzc18wLjE3LmJiID0+IGxpYnBjaWFjY2Vzc18wLjE4LmJifSAoMjQlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJwY2lhY2Nlc3MvMDAwMS1s
aW51eF9zeXNmcy1Vc2UtcHdyaXRlLXByZWFkLWluc3RlYWQtb2YtNjRiaXQtdmVyc2lvLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnBjaWFjY2Vzcy8wMDAxLWxpbnV4
X3N5c2ZzLVVzZS1wd3JpdGUtcHJlYWQtaW5zdGVhZC1vZi02NGJpdC12ZXJzaW8ucGF0Y2gKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDUxMmE0NzNlMjAuLjAwMDAwMDAwMDAKLS0tIGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnBjaWFjY2Vzcy8wMDAxLWxpbnV4X3N5
c2ZzLVVzZS1wd3JpdGUtcHJlYWQtaW5zdGVhZC1vZi02NGJpdC12ZXJzaW8ucGF0Y2gKKysrIC9k
ZXYvbnVsbApAQCAtMSwzOSArMCwwIEBACi1Gcm9tIGQyMGZmNGYyZTRmZWFhZmE2YTYxOTFiOWNh
ZTM4MTViODU2MTc5NDMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPgotRGF0ZTogRnJpLCAxMSBOb3YgMjAyMiAxMToxNTo1OCAtMDgw
MAotU3ViamVjdDogW1BBVENIXSBsaW51eF9zeXNmczogVXNlIHB3cml0ZS9wcmVhZCBpbnN0ZWFk
IG9mIDY0Yml0IHZlcnNpb25zCi0KLXByZWFkNjQvcHdyaXRlNjQgYXJlIGFsaWFzZWQgdG8gcHJl
YWQvcHdyaXRlIHdoZW4gbGFyZ2VmaWxlIHN1cHBvcnQgaXMKLWVuYWJsZWQgZS5nLiB1c2luZyBf
RklMRV9PRkZTRVRfQklUUz02NCBtYWNybwotCi1VcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBb
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3hvcmcvbGliL2xpYnBjaWFjY2Vzcy8tL21l
cmdlX3JlcXVlc3RzLzI2XQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4KLS0tLQotIHNyYy9saW51eF9zeXNmcy5jIHwgNCArKy0tCi0gMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL3NyYy9saW51
eF9zeXNmcy5jIGIvc3JjL2xpbnV4X3N5c2ZzLmMKLWluZGV4IGQ2MmY0OGMuLjIwYzgwMGUgMTAw
NjQ0Ci0tLS0gYS9zcmMvbGludXhfc3lzZnMuYwotKysrIGIvc3JjL2xpbnV4X3N5c2ZzLmMKLUBA
IC00NjIsNyArNDYyLDcgQEAgcGNpX2RldmljZV9saW51eF9zeXNmc19yZWFkKCBzdHJ1Y3QgcGNp
X2RldmljZSAqIGRldiwgdm9pZCAqIGRhdGEsCi0gCi0gCi0gICAgIHdoaWxlICggdGVtcF9zaXpl
ID4gMCApIHsKLS0JY29uc3Qgc3NpemVfdCBieXRlcyA9IHByZWFkNjQoIGZkLCBkYXRhX2J5dGVz
LCB0ZW1wX3NpemUsIG9mZnNldCApOwotKwljb25zdCBzc2l6ZV90IGJ5dGVzID0gcHJlYWQoIGZk
LCBkYXRhX2J5dGVzLCB0ZW1wX3NpemUsIG9mZnNldCApOwotIAotIAkvKiBJZiB6ZXJvIGJ5dGVz
IHdlcmUgcmVhZCwgdGhlbiB3ZSBhc3N1bWUgaXQncyB0aGUgZW5kIG9mIHRoZQotIAkgKiBjb25m
aWcgZmlsZS4KLUBAIC01MjIsNyArNTIyLDcgQEAgcGNpX2RldmljZV9saW51eF9zeXNmc193cml0
ZSggc3RydWN0IHBjaV9kZXZpY2UgKiBkZXYsIGNvbnN0IHZvaWQgKiBkYXRhLAotIAotIAotICAg
ICB3aGlsZSAoIHRlbXBfc2l6ZSA+IDAgKSB7Ci0tCWNvbnN0IHNzaXplX3QgYnl0ZXMgPSBwd3Jp
dGU2NCggZmQsIGRhdGFfYnl0ZXMsIHRlbXBfc2l6ZSwgb2Zmc2V0ICk7Ci0rCWNvbnN0IHNzaXpl
X3QgYnl0ZXMgPSBwd3JpdGUoIGZkLCBkYXRhX2J5dGVzLCB0ZW1wX3NpemUsIG9mZnNldCApOwot
IAotIAkvKiBJZiB6ZXJvIGJ5dGVzIHdlcmUgd3JpdHRlbiwgdGhlbiB3ZSBhc3N1bWUgaXQncyB0
aGUgZW5kIG9mIHRoZQotIAkgKiBjb25maWcgZmlsZS4KLS0tIAotMi4zOC4xCi0KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJwY2lhY2Nlc3NfMC4xNy5iYiBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJwY2lhY2Nlc3NfMC4xOC5iYgpzaW1p
bGFyaXR5IGluZGV4IDI0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1s
aWIvbGlicGNpYWNjZXNzXzAuMTcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWxpYi9saWJwY2lhY2Nlc3NfMC4xOC5iYgppbmRleCA1NGJkYjA4OTc2Li5kMjc1MDc2MDQz
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlicGNpYWNjZXNz
XzAuMTcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnBjaWFjY2Vz
c18wLjE4LmJiCkBAIC0xLDMgKzEsMjUgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VN
IHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZv
bGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGlj
ZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwg
YW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdM
aWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJp
Z2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBDT1BZSU5H
CisjICsrKyBDT1BZSU5HCisjIEBAIC0yLDcgKzIsNyBAQAorIyAgKEMpIENvcHlyaWdodCBFcmlj
IEFuaG9sdCAyMDA2CisjICAoQykgQ29weXJpZ2h0IE1hcmsgS2V0dGVuaXMgMjAxMQorIyAgKEMp
IENvcHlyaWdodCBSb2JlcnQgTWlsbGFuIDIwMTIKKyMgLUNvcHlyaWdodCAoYykgMjAwNywgMjAw
OCwgMjAwOSwgMjAxMSwgMjAxMiwgMjAxMyBPcmFjbGUgYW5kL29yIGl0cyBhZmZpbGlhdGVzLgor
IyArQ29weXJpZ2h0IChjKSAyMDA3LCAyMDA4LCAyMDA5LCAyMDExLCAyMDEyLCAyMDE2IE9yYWNs
ZSBhbmQvb3IgaXRzIGFmZmlsaWF0ZXMuCisjICBDb3B5cmlnaHQgMjAwOSwgMjAxMiBSZWQgSGF0
LCBJbmMuCisjICBBbGwgUmlnaHRzIFJlc2VydmVkLgorIyAgCisjIAorIworCiBTVU1NQVJZID0g
IkdlbmVyaWMgUENJIGFjY2VzcyBsaWJyYXJ5IGZvciBYIgogCiBERVNDUklQVElPTiA9ICJsaWJw
Y2lhY2Nlc3MgcHJvdmlkZXMgZnVuY3Rpb25hbGl0eSBmb3IgWCB0byBhY2Nlc3MgdGhlIFwKQEAg
LTUsMTIgKzI3LDEwIEBAIFBDSSBidXMgYW5kIGRldmljZXMgaW4gYSBwbGF0Zm9ybS1pbmRlcGVu
ZGVudCB3YXkuIgogCiByZXF1aXJlIHhvcmctbGliLWNvbW1vbi5pbmMKIAotU1JDX1VSSSArPSAi
ZmlsZTovLzAwMDEtbGludXhfc3lzZnMtVXNlLXB3cml0ZS1wcmVhZC1pbnN0ZWFkLW9mLTY0Yml0
LXZlcnNpby5wYXRjaCIKLQotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc0MjgzYmEzYzk3NDkxMzAy
OWU3YTU0NzQ5NmEyOTE0NWIwN2VjNTE3MzJiYmI1YjVjNThkNTAyNWFkOTViNzMiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNTQ2MWIwMjU3ZDQ5NTI1NDM0NmY1MmE5YzMyOWI0NGIzNDYyNjI2NjM2
NzVkM2ZlY2RiMjA0YTdlN2MyNjJhOSIKIAogTElDRU5TRSA9ICJNSVQgJiBNSVQiCi1MSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0yNzdhYWRhNTIyMmI5YTIyZmJmMzQ3MWZm
MzY4NzA2OCIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTU0Yzk3ODk2
OGU1NjUyMThlZWEzNmNmMDNlZjI0MzUyIgogCiBSRVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMgPSAi
IgogCi0tIAoyLjQyLjAKCg==

--===============1763078436443967692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1860 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (913 cached, 1 parsed). 1857 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-3a94e22a3ba787cf79e93ae9bd5b715036d3cedc"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3a94e22a3ba787cf79e93ae9bd5b715036d3cedc"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 116 Local 104 Mirrors 0 Missed 12 Current 185 (89% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 205 of 301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: Running task 612 of 911 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_recipe_qa)
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpciaccess-0.18-r0: task do_recipe_qa: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 265 of 301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 267 of 301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18-r0: task do_recipe_qa: Succeeded
NOTE: Running task 661 of 911 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 269 of 301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libpciaccess-0.18-r0: task do_fetch: Succeeded
NOTE: Running task 662 of 911 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 271 of 301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18-r0: task do_unpack: Succeeded
NOTE: Running task 663 of 911 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_patch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 275 of 301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_create_spdx_setscene)
NOTE: recipe libpciaccess-0.18-r0: task do_patch: Started
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpciaccess-0.18-r0: task do_patch: Succeeded
NOTE: Running task 671 of 911 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 672 of 911 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_populate_lic)
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 282 of 301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 284 of 301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.18-r0: task do_populate_lic: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18-r0: task do_populate_lic: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpciaccess-0.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 296 of 301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 298 of 301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 301 of 301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 889 of 911 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 898 of 911 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_collect_spdx_deps)
NOTE: recipe libpciaccess-0.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpciaccess-0.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 899 of 911 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_configure)
NOTE: recipe libpciaccess-0.18-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.18-r0: task do_configure: Succeeded
NOTE: Running task 900 of 911 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_compile)
NOTE: recipe libpciaccess-0.18-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75
| make: *** No targets specified and no makefile found.  Stop.
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpciaccess/0.18/temp/run.do_compile.3808481:182 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpciaccess/0.18/temp/run.do_compile.3808481, line 182
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpciaccess/0.18/temp/run.do_compile.3808481, line 166
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpciaccess/0.18/temp/run.do_compile.3808481, line 161
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpciaccess/0.18/temp/run.do_compile.3808481, line 156
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpciaccess/0.18/temp/run.do_compile.3808481, line 151
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpciaccess/0.18/temp/run.do_compile.3808481, line 195
NOTE: recipe libpciaccess-0.18-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 900 tasks of which 890 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215141823.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215141823.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libpciaccess-0.18-r0 do_compile: oe_runmake failed
ERROR: libpciaccess-0.18-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpciaccess/0.18/temp/run.do_compile.3808481', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpciaccess/0.18/temp/log.do_compile.3808481
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_compile) failed with exit code '1'

--===============1763078436443967692==--

