Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA23C02196
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.42625.1738416048125297131
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=gFIQ5OpD;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=H3UHv48m;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010194c1abeec7-37801b56-056e-492e-adb5-e9ac2e91e1fb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416058;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=U9ehIVKLbe4sa5gbpwudLUFX53Z30+gMQIUJD/gvK6s=;
	b=gFIQ5OpDt4tasFvnnaGQC0hxxT8xhpiXZL6y/BXrUnMDYEb/eIAzVu/nI5ZJiul6
	oiMvqgm1ykA9yZj6YYY7VkL+8ruSvcNzmaFyxNTtElVOcvACuK+uleLKK+TlJalbKjV
	3TX/oKegb75+nl9Zn8kK2bjPrvex5X5G3IiZscxU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416058;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=U9ehIVKLbe4sa5gbpwudLUFX53Z30+gMQIUJD/gvK6s=;
	b=H3UHv48mMkSI8qrt9+IGXI98kmHDYuT+8G83UP3eTGJT8QypAFEcUWBxrohvUtzd
	HPjcC/9I6c9GObSSo3YZ7jG8vwe/U9P3QDwR17RqeChlax72URP3vPJVwcNAXq9EWYE
	8HsWldNLLP3i9jlyioJ0HsgjcUv8ePkFsk4KlifI=
Content-Type: multipart/mixed; boundary="===============2532005485620183868=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lzip: upgrading to 1.25 SUCCEEDED
Message-ID: <01010194c1abeec7-37801b56-056e-492e-adb5-e9ac2e91e1fb-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210557

--===============2532005485620183868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lzip* to *1.25* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lzip-upgrade-1.24.1-1.25.patch
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
From dd376ffb5a34e435f09b18a6df567b8dec6564f6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 09:33:29 +0000
Subject: [PATCH] lzip: upgrade 1.24.1 -> 1.25

---
 .../lzip/{lzip_1.24.1.bb => lzip_1.25.bb}     | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lzip/{lzip_1.24.1.bb => lzip_1.25.bb} (56%)

diff --git a/meta/recipes-extended/lzip/lzip_1.24.1.bb b/meta/recipes-extended/lzip/lzip_1.25.bb
similarity index 56%
rename from meta/recipes-extended/lzip/lzip_1.24.1.bb
rename to meta/recipes-extended/lzip/lzip_1.25.bb
index 6eda012734..b2973b590d 100644
--- a/meta/recipes-extended/lzip/lzip_1.24.1.bb
+++ b/meta/recipes-extended/lzip/lzip_1.25.bb
@@ -1,14 +1,37 @@
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
+# @@ -1,8 +1,7 @@
+#                      GNU GENERAL PUBLIC LICENSE
+#                         Version 2, June 1991
+#  
+# - Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+# - 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+# + Copyright (C) 1989, 1991 Free Software Foundation, Inc. <http://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# 
+#
+
 SUMMARY = "Lossless data compressor based on the LZMA algorithm"
 HOMEPAGE = "http://lzip.nongnu.org/lzip.html"
 DESCRIPTION = "Lzip is a lossless data compressor with a user interface similar to the one of gzip or bzip2. Lzip uses a simplified form of the Lempel-Ziv-Markov chain-Algorithm (LZMA) stream format, chosen to maximize safety and interoperability."
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=cca7f74ec83b7a9ce7ccd195aad471bd \
                     file://decoder.cc;beginline=3;endline=16;md5=18c279060cd0be128188404b45837f88 \
                     "
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
-SRC_URI[sha256sum] = "30c9cb6a0605f479c496c376eb629a48b0a1696d167e3c1e090c5defa481b162"
+SRC_URI[sha256sum] = "09418a6d8fb83f5113f5bd856e09703df5d37bae0308c668d0f346e3d3f0a56f"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
-- 
2.44.1


--===============2532005485620183868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/lzip: SRC_URI changed from "https://download.savannah.gnu.org/releases/lzip/lzip-1.24.1.tar.gz" to "https://download.savannah.gnu.org/releases/lzip/lzip-1.25.tar.gz"
packages/core2-64-poky-linux/lzip: PV changed from "1.24.1" to "1.25"
packages/core2-64-poky-linux/lzip: PKGV changed from 1.24.1 [default] to 1.25 [default]
packages/core2-64-poky-linux/lzip/lzip-dbg: PKGSIZE changed from 1039616 to 1043448 (+0%)
packages/core2-64-poky-linux/lzip/lzip-dbg: PV changed from "1.24.1" to "1.25"
packages/core2-64-poky-linux/lzip/lzip-dbg: PKGV changed from 1.24.1 [default] to 1.25 [default]
packages/core2-64-poky-linux/lzip/lzip-dev: PV changed from "1.24.1" to "1.25"
packages/core2-64-poky-linux/lzip/lzip-dev: PKGV changed from 1.24.1 [default] to 1.25 [default]
packages/core2-64-poky-linux/lzip/lzip-doc: PKGSIZE changed from 72738 to 74842 (+3%)
packages/core2-64-poky-linux/lzip/lzip-doc: PV changed from "1.24.1" to "1.25"
packages/core2-64-poky-linux/lzip/lzip-doc: PKGV changed from 1.24.1 [default] to 1.25 [default]
packages/core2-64-poky-linux/lzip/lzip-locale: PV changed from "1.24.1" to "1.25"
packages/core2-64-poky-linux/lzip/lzip-locale: PKGV changed from 1.24.1 [default] to 1.25 [default]
packages/core2-64-poky-linux/lzip/lzip-src: PKGSIZE changed from 153934 to 153625 (-0%)
packages/core2-64-poky-linux/lzip/lzip-src: PV changed from "1.24.1" to "1.25"
packages/core2-64-poky-linux/lzip/lzip-src: PKGV changed from 1.24.1 [default] to 1.25 [default]
packages/core2-64-poky-linux/lzip/lzip-staticdev: PV changed from "1.24.1" to "1.25"
packages/core2-64-poky-linux/lzip/lzip-staticdev: PKGV changed from 1.24.1 [default] to 1.25 [default]
packages/core2-64-poky-linux/lzip/lzip: PKGSIZE changed from 130040 to 129992 (-0%)
packages/core2-64-poky-linux/lzip/lzip: PV changed from "1.24.1" to "1.25"
packages/core2-64-poky-linux/lzip/lzip: PKGV changed from 1.24.1 [default] to 1.25 [default]

--===============2532005485620183868==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lzip-upgrade-1.24.1-1.25.patch"

RnJvbSBkZDM3NmZmYjVhMzRlNDM1ZjA5YjE4YTZkZjU2N2I4ZGVjNjU2NGY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwOTozMzoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx6
aXA6IHVwZ3JhZGUgMS4yNC4xIC0+IDEuMjUKCi0tLQogLi4uL2x6aXAve2x6aXBfMS4yNC4xLmJi
ID0+IGx6aXBfMS4yNS5iYn0gICAgIHwgMjcgKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNo
YW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2x6aXAve2x6aXBfMS4yNC4xLmJiID0+IGx6aXBfMS4yNS5iYn0gKDU2JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHppcC9semlwXzEuMjQuMS5iYiBi
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9semlwL2x6aXBfMS4yNS5iYgpzaW1pbGFyaXR5IGluZGV4
IDU2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHppcC9semlwXzEuMjQuMS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x6aXAvbHppcF8xLjI1LmJiCmluZGV4
IDZlZGEwMTI3MzQuLmIyOTczYjU5MGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9semlwL2x6aXBfMS4yNC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9semlwL2x6
aXBfMS4yNS5iYgpAQCAtMSwxNCArMSwzNyBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtT
VU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUg
Zm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBs
aWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVk
LCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEg
J0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5
cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJ
TkcKKyMgKysrIENPUFlJTkcKKyMgQEAgLTEsOCArMSw3IEBACisjICAgICAgICAgICAgICAgICAg
ICAgIEdOVSBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjICAgICAgICAgICAgICAgICAgICAgICAg
IFZlcnNpb24gMiwgSnVuZSAxOTkxCisjICAKKyMgLSBDb3B5cmlnaHQgKEMpIDE5ODksIDE5OTEg
RnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuLAorIyAtIDUxIEZyYW5rbGluIFN0cmVldCwg
RmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EKKyMgKyBDb3B5cmlnaHQgKEMp
IDE5ODksIDE5OTEgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuIDxodHRwOi8vZnNmLm9y
Zy8+CisjICAgRXZlcnlvbmUgaXMgcGVybWl0dGVkIHRvIGNvcHkgYW5kIGRpc3RyaWJ1dGUgdmVy
YmF0aW0gY29waWVzCisjICAgb2YgdGhpcyBsaWNlbnNlIGRvY3VtZW50LCBidXQgY2hhbmdpbmcg
aXQgaXMgbm90IGFsbG93ZWQuCisjICAKKyMgCisjCisKIFNVTU1BUlkgPSAiTG9zc2xlc3MgZGF0
YSBjb21wcmVzc29yIGJhc2VkIG9uIHRoZSBMWk1BIGFsZ29yaXRobSIKIEhPTUVQQUdFID0gImh0
dHA6Ly9semlwLm5vbmdudS5vcmcvbHppcC5odG1sIgogREVTQ1JJUFRJT04gPSAiTHppcCBpcyBh
IGxvc3NsZXNzIGRhdGEgY29tcHJlc3NvciB3aXRoIGEgdXNlciBpbnRlcmZhY2Ugc2ltaWxhciB0
byB0aGUgb25lIG9mIGd6aXAgb3IgYnppcDIuIEx6aXAgdXNlcyBhIHNpbXBsaWZpZWQgZm9ybSBv
ZiB0aGUgTGVtcGVsLVppdi1NYXJrb3YgY2hhaW4tQWxnb3JpdGhtIChMWk1BKSBzdHJlYW0gZm9y
bWF0LCBjaG9zZW4gdG8gbWF4aW1pemUgc2FmZXR5IGFuZCBpbnRlcm9wZXJhYmlsaXR5LiIKIFNF
Q1RJT04gPSAiY29uc29sZS91dGlscyIKIExJQ0VOU0UgPSAiR1BMLTIuMC1vci1sYXRlciIKLUxJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTc2ZDZlMzAwZmZkOGZiOWQxOGJk
OWIxMzZhOWJiYTEzIFwKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWNj
YTdmNzRlYzgzYjdhOWNlN2NjZDE5NWFhZDQ3MWJkIFwKICAgICAgICAgICAgICAgICAgICAgZmls
ZTovL2RlY29kZXIuY2M7YmVnaW5saW5lPTM7ZW5kbGluZT0xNjttZDU9MThjMjc5MDYwY2QwYmUx
MjgxODg0MDRiNDU4MzdmODggXAogICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAi
JHtTQVZBTk5BSF9HTlVfTUlSUk9SfS9semlwL2x6aXAtJHtQVn0udGFyLmd6IgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjMwYzljYjZhMDYwNWY0NzljNDk2YzM3NmViNjI5YTQ4YjBhMTY5NmQxNjdl
M2MxZTA5MGM1ZGVmYTQ4MWIxNjIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDk0MThhNmQ4ZmI4
M2Y1MTEzZjViZDg1NmUwOTcwM2RmNWQzN2JhZTAzMDhjNjY4ZDBmMzQ2ZTNkM2YwYTU2ZiIKIAog
QiA9ICIke1dPUktESVJ9L2J1aWxkIgogZG9fY29uZmlndXJlW2NsZWFuZGlyc10gPSAiJHtCfSIK
LS0gCjIuNDQuMQoK

--===============2532005485620183868==--

