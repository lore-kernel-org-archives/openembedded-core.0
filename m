Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E2CC44502
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 05:32:53 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63291.1782970364255243660
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 22:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ebvThdAf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=M+zwwnVy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019f2150ad92-30c9fba1-36bb-4c1b-8356-89405bde10dd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782970363;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=uEGID8vz0cIAiSmJ1YqP0IaXd5P07Vn6Y91SCbgqnyk=;
	b=ebvThdAfCPQ1DDO4pJWV8t/1Mxfv4Z83ESxfG3L4dXx2Ejt7WUks+iy8JTjVTVTw
	6ZdElQOr1uAwXrySQz8O1hsbRrfAYHd7u1GiTsHwzt3Ib7eqT9nf2RdOTeI6XQMF3fh
	4dNQ0JzIiO6zefm+p3oinVaJnMHuASOWMgof/u9U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782970363;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=uEGID8vz0cIAiSmJ1YqP0IaXd5P07Vn6Y91SCbgqnyk=;
	b=M+zwwnVyAfkYa9Vkyis8VSa/+a8s1somG6IKMJeAoxWD/pOBNWUPAioHgwpaXWlx
	/vAZXo8AcARk1eMoLuuTI9l25gY7shpdCuIHyWvN1g/fKv2Lg2VSzohfWcq8BUhQShj
	coqwTmRiaBDZf9EL5GZaT1S0jjDwrfmOZCvOz/fA=
Content-Type: multipart/mixed; boundary="===============4143230221292663327=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] erofs-utils: upgrading to 1.9.2 SUCCEEDED
Message-ID: <0101019f2150ad92-30c9fba1-36bb-4c1b-8356-89405bde10dd-000000@us-west-2.amazonses.com>
Date: Thu, 2 Jul 2026 05:32:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 05:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240014

--===============4143230221292663327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *erofs-utils* to *1.9.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-erofs-utils-upgrade-1.9.1-1.9.2.patch
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
From fe84ea3114d8e9f489d570a52b78f855c4b01315 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 2 Jul 2026 05:20:13 +0000
Subject: [PATCH] erofs-utils: upgrade 1.9.1 -> 1.9.2

---
 ...fs-utils_1.9.1.bb => erofs-utils_1.9.2.bb} | 44 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.9.1.bb => erofs-utils_1.9.2.bb} (30%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.1.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.2.bb
similarity index 30%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.9.1.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.9.2.bb
index 03bb718b44..f4570afd0d 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.1.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.2.bb
@@ -1,11 +1,51 @@
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
+# @@ -1,15 +1,15 @@
+# -erofs-utils uses two different license patterns:
+# +erofs-utils uses two different licensing patterns:
+#  
+# - - most liberofs files in `lib` and `include` directories
+# -   use GPL-2.0+ OR Apache-2.0 dual license;
+# + - Most liberofs files in the `lib` and `include` directories
+# +   use a dual GPL-2.0+ OR MIT license whenever possible.
+#  
+# - - all other files use GPL-2.0+ license, unless
+# -   explicitly stated otherwise.
+# + - All other files use the MIT license unless explicitly stated
+# +   otherwise.
+#  
+# -Relevant licenses can be found in the LICENSES directory.
+# +The relevant licenses can be found in the LICENSES directory.
+#  
+# -This model is selected to emphasize that
+# -files in `lib` and `include` directory are designed to be included into
+# -3rd-party applications, while all other files, are intended to be used
+# -"as is", as part of their intended scenarios, with no intention to
+# -support 3rd-party integration use cases.
+# +This model was chosen to maximize the ability of erofs-utils to
+# +integrate with various ecosystems.
+# +
+# +However, liberofs uses a GPL-2.0+ OR MIT dual license because some
+# +parts should be shared with the Linux kernel.
+# 
+#
+
 SUMMARY = "Tools for erofs filesystems"
 # liberofs also available under Apache 2.0
 LICENSE = "GPL-2.0-or-later"
 SECTION = "base"
-LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
+LIC_FILES_CHKSUM = "file://COPYING;md5=63afa010baddc7d0905f9c31ac759f51"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "d3fbccba6e409c100843563b416c47cd82c87ca0"
+SRCREV = "30711d4b2e234fe3e8aaeb779ade4cb609b0d920"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https;tag=v${PV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
-- 
2.47.1


--===============4143230221292663327==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-erofs-utils-upgrade-1.9.1-1.9.2.patch"

RnJvbSBmZTg0ZWEzMTE0ZDhlOWY0ODlkNTcwYTUyYjc4Zjg1NWM0YjAxMzE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMiBKdWwgMjAyNiAwNToyMDoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVy
b2ZzLXV0aWxzOiB1cGdyYWRlIDEuOS4xIC0+IDEuOS4yCgotLS0KIC4uLmZzLXV0aWxzXzEuOS4x
LmJiID0+IGVyb2ZzLXV0aWxzXzEuOS4yLmJifSB8IDQ0ICsrKysrKysrKysrKysrKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy97ZXJvZnMtdXRpbHNfMS45LjEuYmIgPT4g
ZXJvZnMtdXRpbHNfMS45LjIuYmJ9ICgzMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzXzEuOS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzXzEuOS4yLmJiCnNpbWlsYXJpdHkgaW5kZXgg
MzAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9lcm9mcy11
dGlsc18xLjkuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxz
L2Vyb2ZzLXV0aWxzXzEuOS4yLmJiCmluZGV4IDAzYmI3MThiNDQuLmY0NTcwYWZkMGQgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9lcm9mcy11dGlsc18xLjku
MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZXJvZnMtdXRpbHNf
MS45LjIuYmIKQEAgLTEsMTEgKzEsNTEgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VN
IHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZv
bGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGlj
ZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwg
YW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdM
aWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJp
Z2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBDT1BZSU5H
CisjICsrKyBDT1BZSU5HCisjIEBAIC0xLDE1ICsxLDE1IEBACisjIC1lcm9mcy11dGlscyB1c2Vz
IHR3byBkaWZmZXJlbnQgbGljZW5zZSBwYXR0ZXJuczoKKyMgK2Vyb2ZzLXV0aWxzIHVzZXMgdHdv
IGRpZmZlcmVudCBsaWNlbnNpbmcgcGF0dGVybnM6CisjICAKKyMgLSAtIG1vc3QgbGliZXJvZnMg
ZmlsZXMgaW4gYGxpYmAgYW5kIGBpbmNsdWRlYCBkaXJlY3RvcmllcworIyAtICAgdXNlIEdQTC0y
LjArIE9SIEFwYWNoZS0yLjAgZHVhbCBsaWNlbnNlOworIyArIC0gTW9zdCBsaWJlcm9mcyBmaWxl
cyBpbiB0aGUgYGxpYmAgYW5kIGBpbmNsdWRlYCBkaXJlY3RvcmllcworIyArICAgdXNlIGEgZHVh
bCBHUEwtMi4wKyBPUiBNSVQgbGljZW5zZSB3aGVuZXZlciBwb3NzaWJsZS4KKyMgIAorIyAtIC0g
YWxsIG90aGVyIGZpbGVzIHVzZSBHUEwtMi4wKyBsaWNlbnNlLCB1bmxlc3MKKyMgLSAgIGV4cGxp
Y2l0bHkgc3RhdGVkIG90aGVyd2lzZS4KKyMgKyAtIEFsbCBvdGhlciBmaWxlcyB1c2UgdGhlIE1J
VCBsaWNlbnNlIHVubGVzcyBleHBsaWNpdGx5IHN0YXRlZAorIyArICAgb3RoZXJ3aXNlLgorIyAg
CisjIC1SZWxldmFudCBsaWNlbnNlcyBjYW4gYmUgZm91bmQgaW4gdGhlIExJQ0VOU0VTIGRpcmVj
dG9yeS4KKyMgK1RoZSByZWxldmFudCBsaWNlbnNlcyBjYW4gYmUgZm91bmQgaW4gdGhlIExJQ0VO
U0VTIGRpcmVjdG9yeS4KKyMgIAorIyAtVGhpcyBtb2RlbCBpcyBzZWxlY3RlZCB0byBlbXBoYXNp
emUgdGhhdAorIyAtZmlsZXMgaW4gYGxpYmAgYW5kIGBpbmNsdWRlYCBkaXJlY3RvcnkgYXJlIGRl
c2lnbmVkIHRvIGJlIGluY2x1ZGVkIGludG8KKyMgLTNyZC1wYXJ0eSBhcHBsaWNhdGlvbnMsIHdo
aWxlIGFsbCBvdGhlciBmaWxlcywgYXJlIGludGVuZGVkIHRvIGJlIHVzZWQKKyMgLSJhcyBpcyIs
IGFzIHBhcnQgb2YgdGhlaXIgaW50ZW5kZWQgc2NlbmFyaW9zLCB3aXRoIG5vIGludGVudGlvbiB0
bworIyAtc3VwcG9ydCAzcmQtcGFydHkgaW50ZWdyYXRpb24gdXNlIGNhc2VzLgorIyArVGhpcyBt
b2RlbCB3YXMgY2hvc2VuIHRvIG1heGltaXplIHRoZSBhYmlsaXR5IG9mIGVyb2ZzLXV0aWxzIHRv
CisjICtpbnRlZ3JhdGUgd2l0aCB2YXJpb3VzIGVjb3N5c3RlbXMuCisjICsKKyMgK0hvd2V2ZXIs
IGxpYmVyb2ZzIHVzZXMgYSBHUEwtMi4wKyBPUiBNSVQgZHVhbCBsaWNlbnNlIGJlY2F1c2Ugc29t
ZQorIyArcGFydHMgc2hvdWxkIGJlIHNoYXJlZCB3aXRoIHRoZSBMaW51eCBrZXJuZWwuCisjIAor
IworCiBTVU1NQVJZID0gIlRvb2xzIGZvciBlcm9mcyBmaWxlc3lzdGVtcyIKICMgbGliZXJvZnMg
YWxzbyBhdmFpbGFibGUgdW5kZXIgQXBhY2hlIDIuMAogTElDRU5TRSA9ICJHUEwtMi4wLW9yLWxh
dGVyIgogU0VDVElPTiA9ICJiYXNlIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlO
RzttZDU9NzMwMDFkODA0ZWExZTNkODQzNjVmNjUyMjQyY2NhMjAiCitMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT02M2FmYTAxMGJhZGRjN2QwOTA1ZjljMzFhYzc1OWY1MSIK
IEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3hpYW5nL2Vyb2ZzLXV0aWxzLmdpdC90cmVlL1JFQURNRSIKIAotU1JDUkVWID0gImQzZmJj
Y2JhNmU0MDljMTAwODQzNTYzYjQxNmM0N2NkODJjODdjYTAiCitTUkNSRVYgPSAiMzA3MTFkNGIy
ZTIzNGZlM2U4YWFlYjc3OWFkZTRjYjYwOWIwZDkyMCIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hpYW5nL2Vyb2ZzLXV0aWxzLmdpdDti
cmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzO3RhZz12JHtQVn0iCiAKIFVQU1RSRUFNX0NIRUNL
X0dJVFRBR1JFR0VYID0gInYoP1A8cHZlcj4oXGQrKFwuXGQrKSspKSIKLS0gCjIuNDcuMQoK

--===============4143230221292663327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-dbg: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-dbg: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-dbg: PKGSIZE changed from 2700648 to 2744216 (+2%)
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-dev: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-dev: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-doc: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-doc: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-doc: PKGSIZE changed from 26007 to 26383 (+1%)
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-locale: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-locale: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-src: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-src: FILELIST: directory renamed /usr/src/debug/erofs-utils/1.9.1/include -> /usr/src/debug/erofs-utils/1.9.2/include, directory renamed /usr/src/debug/erofs-utils/1.9.1/include/erofs -> /usr/src/debug/erofs-utils/1.9.2/include/erofs, directory renamed /usr/src/debug/erofs-utils/1.9.1/lib/remotes -> /usr/src/debug/erofs-utils/1.9.2/lib/remotes, directory renamed /usr/src/debug/erofs-utils/1.9.1/mount -> /usr/src/debug/erofs-utils/1.9.2/mount, directory renamed /usr/src/debug/erofs-utils/1.9.1/dump -> /usr/src/debug/erofs-utils/1.9.2/dump, directory renamed /usr/src/debug/erofs-utils/1.9.1/fsck -> /usr/src/debug/erofs-utils/1.9.2/fsck, directory renamed /usr/src/debug/erofs-utils/1.9.1/lib/backends -> /usr/src/debug/erofs-utils/1.9.2/lib/backends, directory renamed /usr/src/debug/erofs-utils/1.9.1/mkfs -> /usr/src/debug/erofs-utils/1.9.2/mkfs, removed "/usr/src/debug/erofs-utils/1.9.1/lib/exclude.c /usr/src/debug/erofs-utils/1.9.1/
 lib/dedupe.c /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_nbd.h /usr/src/debug/erofs-utils/1.9.1/lib/metabox.c /usr/src/debug/erofs-utils/1.9.1/lib/xxhash.c /usr/src/debug/erofs-utils/1.9.1/lib/kite_deflate.c /usr/src/debug/erofs-utils/1.9.1/lib/compress.c /usr/src/debug/erofs-utils/1.9.1/lib/rebuild.c /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_rebuild.h /usr/src/debug/erofs-utils/1.9.1/lib/importer.c /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_compress.h /usr/src/debug/erofs-utils/1.9.1/lib/dedupe_ext.c /usr/src/debug/erofs-utils/1.9.1/lib/data.c /usr/src/debug/erofs-utils/1.9.1/lib/xattr.c /usr/src/debug/erofs-utils/1.9.1/lib/workqueue.c /usr/src/debug/erofs-utils/1.9.1/lib/compress_hints.c /usr/src/debug/erofs-utils/1.9.1/lib/global.c /usr/src/debug/erofs-utils/1.9.1/lib/vmdk.c /usr/src/debug/erofs-utils/1.9.1/lib/compressor.h /usr/src/debug/erofs-utils/1.9.1/lib/namei.c /usr/src/debug/erofs-utils/1.9.1/lib/base64.c /usr/src/debug/erofs-utils/1.9.1/lib/diskbuf.c /usr/src/de
 bug/erofs-utils/1.9.1/lib/compressor.c /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_base64.h /usr/src/debug/erofs-utils/1.9.1/lib/cache.c /usr/src/debug/erofs-utils/1.9.1/lib/dir.c /usr/src/debug/erofs-utils/1.9.1/lib/fragments.c /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_fragments.h /usr/src/debug/erofs-utils/1.9.1/lib/tar.c /usr/src/debug/erofs-utils/1.9.1/lib/decompress.c /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_oci.h /usr/src/debug/erofs-utils/1.9.1/lib/config.c /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_uuid.h /usr/src/debug/erofs-utils/1.9.1/lib/rolling_hash.h /usr/src/debug/erofs-utils/1.9.1/lib/block_list.c /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_gzran.h /usr/src/debug/erofs-utils/1.9.1/lib/gzran.c /usr/src/debug/erofs-utils/1.9.1/lib/uuid.c /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_cache.h /usr/src/debug/erofs-utils/1.9.1/lib/compressor_deflate.c /usr/src/debug/erofs-utils/1.9.1/lib/inode.c /usr/src/debug/erofs-utils/1.9.1/lib/compressor_lz4.c /usr/src
 /debug/erofs-utils/1.9.1/lib/liberofs_metabox.h /usr/src/debug/erofs-utils/1.9.1/lib/io.c /usr/src/debug/erofs-utils/1.9.1/lib/compressor_lz4hc.c /usr/src/debug/erofs-utils/1.9.1/lib/uuid_unparse.c /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_xxhash.h /usr/src/debug/erofs-utils/1.9.1/lib/hashmap.c /usr/src/debug/erofs-utils/1.9.1/lib/blobchunk.c /usr/src/debug/erofs-utils/1.9.1/lib/bitops.c /usr/src/debug/erofs-utils/1.9.1/lib/sha256.h /usr/src/debug/erofs-utils/1.9.1/lib/zmap.c /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_private.h /usr/src/debug/erofs-utils/1.9.1/lib/super.c /usr/src/debug/erofs-utils/1.9.1/lib/sha256.c", added "/usr/src/debug/erofs-utils/1.9.2/lib/exclude.c /usr/src/debug/erofs-utils/1.9.2/lib/dedupe.c /usr/src/debug/erofs-utils/1.9.2/lib/liberofs_nbd.h /usr/src/debug/erofs-utils/1.9.2/lib/metabox.c /usr/src/debug/erofs-utils/1.9.2/lib/xxhash.c /usr/src/debug/erofs-utils/1.9.2/lib/kite_deflate.c /usr/src/debug/erofs-utils/1.9.2/lib/liberofs_ublk.h /usr/src/debu
 g/erofs-utils/1.9.2/lib/compress.c /usr/src/debug/erofs-utils/1.9.2/lib/rebuild.c /usr/src/debug/erofs-utils/1.9.2/lib/liberofs_rebuild.h /usr/src/debug/erofs-utils/1.9.2/lib/importer.c /usr/src/debug/erofs-utils/1.9.2/lib/liberofs_compress.h /usr/src/debug/erofs-utils/1.9.2/lib/dedupe_ext.c /usr/src/debug/erofs-utils/1.9.2/lib/data.c /usr/src/debug/erofs-utils/1.9.2/lib/xattr.c /usr/src/debug/erofs-utils/1.9.2/lib/workqueue.c /usr/src/debug/erofs-utils/1.9.2/lib/compress_hints.c /usr/src/debug/erofs-utils/1.9.2/lib/global.c /usr/src/debug/erofs-utils/1.9.2/lib/vmdk.c /usr/src/debug/erofs-utils/1.9.2/lib/compressor.h /usr/src/debug/erofs-utils/1.9.2/lib/namei.c /usr/src/debug/erofs-utils/1.9.2/lib/base64.c /usr/src/debug/erofs-utils/1.9.2/lib/diskbuf.c /usr/src/debug/erofs-utils/1.9.2/lib/compressor.c /usr/src/debug/erofs-utils/1.9.2/lib/liberofs_base64.h /usr/src/debug/erofs-utils/1.9.2/lib/cache.c /usr/src/debug/erofs-utils/1.9.2/lib/dir.c /usr/src/debug/erofs-utils/1.9.2/lib/frag
 ments.c /usr/src/debug/erofs-utils/1.9.2/lib/liberofs_fragments.h /usr/src/debug/erofs-utils/1.9.2/lib/tar.c /usr/src/debug/erofs-utils/1.9.2/lib/decompress.c /usr/src/debug/erofs-utils/1.9.2/lib/liberofs_oci.h /usr/src/debug/erofs-utils/1.9.2/lib/config.c /usr/src/debug/erofs-utils/1.9.2/lib/liberofs_uuid.h /usr/src/debug/erofs-utils/1.9.2/lib/rolling_hash.h /usr/src/debug/erofs-utils/1.9.2/lib/block_list.c /usr/src/debug/erofs-utils/1.9.2/lib/liberofs_gzran.h /usr/src/debug/erofs-utils/1.9.2/lib/gzran.c /usr/src/debug/erofs-utils/1.9.2/lib/uuid.c /usr/src/debug/erofs-utils/1.9.2/lib/liberofs_cache.h /usr/src/debug/erofs-utils/1.9.2/lib/compressor_deflate.c /usr/src/debug/erofs-utils/1.9.2/lib/inode.c /usr/src/debug/erofs-utils/1.9.2/lib/compressor_lz4.c /usr/src/debug/erofs-utils/1.9.2/lib/liberofs_metabox.h /usr/src/debug/erofs-utils/1.9.2/lib/io.c /usr/src/debug/erofs-utils/1.9.2/lib/compressor_lz4hc.c /usr/src/debug/erofs-utils/1.9.2/lib/liberofs_s3.h /usr/src/debug/erofs-utils
 /1.9.2/lib/liberofs_sha256.h /usr/src/debug/erofs-utils/1.9.2/lib/uuid_unparse.c /usr/src/debug/erofs-utils/1.9.2/lib/liberofs_xxhash.h /usr/src/debug/erofs-utils/1.9.2/lib/hashmap.c /usr/src/debug/erofs-utils/1.9.2/lib/blobchunk.c /usr/src/debug/erofs-utils/1.9.2/lib/bitops.c /usr/src/debug/erofs-utils/1.9.2/lib/zmap.c /usr/src/debug/erofs-utils/1.9.2/lib/liberofs_private.h /usr/src/debug/erofs-utils/1.9.2/lib/super.c /usr/src/debug/erofs-utils/1.9.2/lib/sha256.c"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-src: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-src: PKGSIZE changed from 766826 to 805226 (+5%)
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-staticdev: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-staticdev: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils: PKGSIZE changed from 748416 to 764832 (+2%)
packages/x86-64-v3-poky-linux/erofs-utils: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/erofs-utils: SRC_URI changed from "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https;tag=v1.9.1" to "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https;tag=v1.9.2"
packages/x86-64-v3-poky-linux/erofs-utils: PV changed from "1.9.1" to "1.9.2"

--===============4143230221292663327==--

