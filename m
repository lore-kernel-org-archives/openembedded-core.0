Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C034C52D71
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:32 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.18633.1718475801583810133
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZbO1twHK;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=CgDATtjb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101901d23bfd8-dfafde49-7ffa-4591-af2e-1aa005c82f64-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475801;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NvG8OUKOBMmbIrxkalvjfiSv53RSsaEzqdJ8jvZ/jcA=;
	b=ZbO1twHKTiITEbuAhcI7cI5jjprGrqydR6Cl4Uhm1a1up8BoMSxEW9U8yq1S5dK+
	+XBiNGYLws+oHtcUSIQXic/Fu/voCijLMbRegHRMCzN4k5SYc4pXMRZ8Q9d5BvRVTsj
	TuVfH/4r1DotPLX7ujH2eUtqaUEBN21G7ka97zoA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475801;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NvG8OUKOBMmbIrxkalvjfiSv53RSsaEzqdJ8jvZ/jcA=;
	b=CgDATtjbF0rYWatpXY/tyZte21O16H1V0AA4e7bLTVhCVbU1ljEGVZ3zLXo5PTvR
	QNmQoEanvqeXqC7KaWbg6CUgyQul9en4YFKvLPrJNbzBZE3MBqY7pJqaIHoAueWhAnF
	6GlFD5z8yg5iGFt7Q2k3HK5PQ2hZau7v+0OihxuI=
Content-Type: multipart/mixed; boundary="===============6005267393558461666=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libjitterentropy: upgrading to 3.5.0 SUCCEEDED
Message-ID: <010101901d23bfd8-dfafde49-7ffa-4591-af2e-1aa005c82f64-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200767

--===============6005267393558461666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libjitterentropy* to *3.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libjitterentropy-upgrade-3.4.1-3.5.0.patch
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
From 86b4ebc4152e9255e222b42c43c004fefd2816b2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 17:41:17 +0000
Subject: [PATCH] libjitterentropy: upgrade 3.4.1 -> 3.5.0

---
 ...opy_3.4.1.bb => libjitterentropy_3.5.0.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.4.1.bb => libjitterentropy_3.5.0.bb} (56%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.5.0.bb
similarity index 56%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.5.0.bb
index 6cef8c068c..489bbe0c6f 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.5.0.bb
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
+# -Copyright (C) 2017 - 2022, Stephan Mueller <smueller@chronox.de>
+# +Copyright (C) 2017 - 2024, Stephan Mueller <smueller@chronox.de>
+#  
+#  Redistribution and use in source and binary forms, with or without
+#  modification, are permitted provided that the following conditions
+# 
+#
+
 SUMMARY = "Hardware RNG based on CPU timing jitter"
 DESCRIPTION = "The Jitter RNG provides a noise source using the CPU execution timing jitter. \
 It does not depend on any system resource other than a high-resolution time \
@@ -5,12 +24,12 @@ stamp. It is a small-scale, yet fast entropy source that is viable in almost \
 all environments and on a lot of CPU architectures."
 HOMEPAGE = "http://www.chronox.de/jent.html"
 LICENSE = "GPL-2.0-or-later | BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=64a87180908540620ce364b5e69b3b03 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=18a5cada7ee95e61db4180f0cb4a69cf \
                     file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
 SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https"
-SRCREV = "4544e11320138ac02797af81766f4476a71bb09f"
+SRCREV = "48b2ffc128af776ff3658a70e5d7bb4a82180189"
 S = "${WORKDIR}/git"
 
 do_configure[noexec] = "1"
-- 
2.44.0


--===============6005267393558461666==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libjitterentropy-upgrade-3.4.1-3.5.0.patch"

RnJvbSA4NmI0ZWJjNDE1MmU5MjU1ZTIyMmI0MmM0M2MwMDRmZWZkMjgxNmIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMTc6NDE6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJqaXR0ZXJlbnRyb3B5OiB1cGdyYWRlIDMuNC4xIC0+IDMuNS4wCgotLS0KIC4uLm9weV8zLjQu
MS5iYiA9PiBsaWJqaXR0ZXJlbnRyb3B5XzMuNS4wLmJifSB8IDIzICsrKysrKysrKysrKysrKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmppdHRlcmVudHJvcHkve2xpYmppdHRlcmVudHJv
cHlfMy40LjEuYmIgPT4gbGliaml0dGVyZW50cm9weV8zLjUuMC5iYn0gKDU2JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJqaXR0ZXJlbnRyb3B5L2xpYmppdHRlcmVudHJv
cHlfMy40LjEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJqaXR0ZXJlbnRyb3B5L2xpYmpp
dHRlcmVudHJvcHlfMy41LjAuYmIKc2ltaWxhcml0eSBpbmRleCA1NiUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGliaml0dGVyZW50cm9weS9saWJqaXR0ZXJlbnRyb3B5XzMuNC4x
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJqaXR0ZXJlbnRyb3B5L2xpYmpp
dHRlcmVudHJvcHlfMy41LjAuYmIKaW5kZXggNmNlZjhjMDY4Yy4uNDg5YmJlMGM2ZiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaml0dGVyZW50cm9weS9saWJqaXR0ZXJlbnRy
b3B5XzMuNC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmppdHRlcmVudHJvcHkv
bGliaml0dGVyZW50cm9weV8zLjUuMC5iYgpAQCAtMSwzICsxLDIyIEBACisjIEZJWE1FOiB0aGUg
TElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBn
cmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xk
IGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2
YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1p
dCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5z
ZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgor
IworIyAtLS0gTElDRU5TRQorIyArKysgTElDRU5TRQorIyBAQCAtMSw0ICsxLDQgQEAKKyMgLUNv
cHlyaWdodCAoQykgMjAxNyAtIDIwMjIsIFN0ZXBoYW4gTXVlbGxlciA8c211ZWxsZXJAY2hyb25v
eC5kZT4KKyMgK0NvcHlyaWdodCAoQykgMjAxNyAtIDIwMjQsIFN0ZXBoYW4gTXVlbGxlciA8c211
ZWxsZXJAY2hyb25veC5kZT4KKyMgIAorIyAgUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3Vy
Y2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0CisjICBtb2RpZmljYXRpb24sIGFy
ZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMKKyMgCisj
CisKIFNVTU1BUlkgPSAiSGFyZHdhcmUgUk5HIGJhc2VkIG9uIENQVSB0aW1pbmcgaml0dGVyIgog
REVTQ1JJUFRJT04gPSAiVGhlIEppdHRlciBSTkcgcHJvdmlkZXMgYSBub2lzZSBzb3VyY2UgdXNp
bmcgdGhlIENQVSBleGVjdXRpb24gdGltaW5nIGppdHRlci4gXAogSXQgZG9lcyBub3QgZGVwZW5k
IG9uIGFueSBzeXN0ZW0gcmVzb3VyY2Ugb3RoZXIgdGhhbiBhIGhpZ2gtcmVzb2x1dGlvbiB0aW1l
IFwKQEAgLTUsMTIgKzI0LDEyIEBAIHN0YW1wLiBJdCBpcyBhIHNtYWxsLXNjYWxlLCB5ZXQgZmFz
dCBlbnRyb3B5IHNvdXJjZSB0aGF0IGlzIHZpYWJsZSBpbiBhbG1vc3QgXAogYWxsIGVudmlyb25t
ZW50cyBhbmQgb24gYSBsb3Qgb2YgQ1BVIGFyY2hpdGVjdHVyZXMuIgogSE9NRVBBR0UgPSAiaHR0
cDovL3d3dy5jaHJvbm94LmRlL2plbnQuaHRtbCIKIExJQ0VOU0UgPSAiR1BMLTIuMC1vci1sYXRl
ciB8IEJTRC0zLUNsYXVzZSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1
PTY0YTg3MTgwOTA4NTQwNjIwY2UzNjRiNWU2OWIzYjAzIFwKK0xJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PTE4YTVjYWRhN2VlOTVlNjFkYjQxODBmMGNiNGE2OWNmIFwKICAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0UuZ3BsdjI7bWQ1PWViNzIzYjYxNTM5ZmVl
ZjAxM2RlNDc2ZTY4YjVjNTBhIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0Uu
YnNkO21kNT02NmE1Y2VkYWY2MmM0YjI2MzcwMjVmMDQ5ZjliODI2ZiBcCiAgICAgICAgICAgICAg
ICAgICAgICIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9zbXVlbGxlckREL2ppdHRlcmVu
dHJvcHktbGlicmFyeS5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyIKLVNSQ1JFViA9
ICI0NTQ0ZTExMzIwMTM4YWMwMjc5N2FmODE3NjZmNDQ3NmE3MWJiMDlmIgorU1JDUkVWID0gIjQ4
YjJmZmMxMjhhZjc3NmZmMzY1OGE3MGU1ZDdiYjRhODIxODAxODkiCiBTID0gIiR7V09SS0RJUn0v
Z2l0IgogCiBkb19jb25maWd1cmVbbm9leGVjXSA9ICIxIgotLSAKMi40NC4wCgo=

--===============6005267393558461666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libjitterentropy/libjitterentropy: PKGSIZE changed from 34809 to 38905 (+12%)
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy: FILELIST: removed "/usr/lib/libjitterentropy.so.3.4.1", added "/usr/lib/libjitterentropy.so.3.5.0"
Changes to packages/core2-64-poky-linux/libjitterentropy (sysroot):
  /usr/lib/libjitterentropy.so.3 changed symlink target from libjitterentropy.so.3.4.1 to libjitterentropy.so.3.5.0
  /usr/lib/libjitterentropy.so.3.4.1 moved to /usr/lib/libjitterentropy.so.3.5.0

--===============6005267393558461666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libjitterentropy: PV changed from "3.4.1" to "3.5.0"
packages/core2-64-poky-linux/libjitterentropy: PKGV changed from 3.4.1 [default] to 3.5.0 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dbg: PV changed from "3.4.1" to "3.5.0"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dbg: FILELIST: removed "/usr/lib/.debug/libjitterentropy.so.3.4.1", added "/usr/lib/.debug/libjitterentropy.so.3.5.0"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dbg: PKGV changed from 3.4.1 [default] to 3.5.0 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dbg: PKGSIZE changed from 44568 to 45440 (+2%)
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dev: PV changed from "3.4.1" to "3.5.0"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dev: PKGV changed from 3.4.1 [default] to 3.5.0 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dev: PKGSIZE changed from 29072 to 31648 (+9%)
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-doc: PV changed from "3.4.1" to "3.5.0"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-doc: PKGV changed from 3.4.1 [default] to 3.5.0 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-doc: PKGSIZE changed from 4204 to 4203 (-0%)
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-locale: PV changed from "3.4.1" to "3.5.0"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-locale: PKGV changed from 3.4.1 [default] to 3.5.0 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-src: PV changed from "3.4.1" to "3.5.0"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-src: PKGV changed from 3.4.1 [default] to 3.5.0 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-src: PKGSIZE changed from 109257 to 115505 (+6%)
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-staticdev: PV changed from "3.4.1" to "3.5.0"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-staticdev: PKGV changed from 3.4.1 [default] to 3.5.0 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy: PV changed from "3.4.1" to "3.5.0"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy: FILELIST: removed "/usr/lib/libjitterentropy.so.3.4.1", added "/usr/lib/libjitterentropy.so.3.5.0"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy: PKGV changed from 3.4.1 [default] to 3.5.0 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy: PKGSIZE changed from 34809 to 38905 (+12%)
Changes to packages/core2-64-poky-linux/libjitterentropy (sysroot):
  /usr/lib/libjitterentropy.so.3 changed symlink target from libjitterentropy.so.3.4.1 to libjitterentropy.so.3.5.0
  /usr/lib/libjitterentropy.so.3.4.1 moved to /usr/lib/libjitterentropy.so.3.5.0

--===============6005267393558461666==--

