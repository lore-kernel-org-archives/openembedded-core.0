Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA56CEDD9B
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:17 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12138.1763224745079703698
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=A+djds4T;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=c0ktSZyL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019a88629076-0c1dd183-45b6-4ed3-be4f-303160744417-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224752;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eHdGnGKFpKr7coZMqzW2gwWE4ntgsTH5qmtgjAVhhIw=;
	b=A+djds4T/Ik/+Sz3U1UDSBNYFRQjF9nsLQ34rbAKlxlWaHUm78EP+1fTo4881F05
	WEKXEcZXM98ds9BgWHrHiV1eQOQjj3HJBlaHNct0WoB+HL8ttlSu6m/g60I7IQ1Hgwn
	OLOqyu8vMgx3gLFGpBGrqPCT+VVfB0P+LAU4Q54Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224752;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eHdGnGKFpKr7coZMqzW2gwWE4ntgsTH5qmtgjAVhhIw=;
	b=c0ktSZyLSiipMkEloT9IhqTxJfsjMlFsvLclwZzGe4lwID6/fY06JiQYQbsOzA9+
	kuWlT7tZmbeQUev45H7Sc+z6giQBFWJr2FHG1cQwOUn2NL4n4Bjz70Z0AMtK1UPNZv1
	OqUG1jMYDZhI0w1IfOU6x4Tpd434Xz3tAitpcEzo=
Content-Type: multipart/mixed; boundary="===============2937674403632639144=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dos2unix: upgrading to 7.5.3 SUCCEEDED
Message-ID: <0101019a88629076-0c1dd183-45b6-4ed3-be4f-303160744417-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226447

--===============2937674403632639144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dos2unix* to *7.5.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dos2unix-upgrade-7.5.2-7.5.3.patch
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
From d4b032c899717f90accaefc0d4c47dab1de8bb3f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 15:51:15 +0000
Subject: [PATCH] dos2unix: upgrade 7.5.2 -> 7.5.3

---
 .../{dos2unix_7.5.2.bb => dos2unix_7.5.3.bb}  | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.5.2.bb => dos2unix_7.5.3.bb} (55%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.2.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
similarity index 55%
rename from meta/recipes-support/dos2unix/dos2unix_7.5.2.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
index c3803f457b..9865424ff7 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.2.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
@@ -1,3 +1,25 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING.txt
+# +++ COPYING.txt
+# @@ -2,7 +2,7 @@
+#  See also https://www.freebsd.org/copyright/freebsd-license.html
+#  --------
+#  
+# -Copyright (C) 2009-2024  Erwin Waterlander
+# +Copyright (C) 2009-2025  Erwin Waterlander
+#  Copyright (C) 1998 Christian Wurll
+#  Copyright (C) 1998 Bernd Johannes Wuebben
+#  Copyright (C) 1994-1995 Benjamin Lin.
+# 
+#
+
 SUMMARY = "Convert text file line endings between CRLF and LF"
 DESCRIPTION = "The Dos2unix package includes utilities dos2unix and \
 unix2dos to convert plain text files in DOS or Mac format to Unix \
@@ -6,12 +28,12 @@ HOMEPAGE = "http://waterlan.home.xs4all.nl/dos2unix.html"
 SECTION = "support"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=49ec74e0139712398b9ddb06d824929a"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=0802ff257bfeb9bb07ae4e4de04e3223"
 
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "c16a0b31a64c7eb6b2d76960e5144732b57f2993"
+SRCREV = "9df44447947a7b311c62ea0383be94080edcaf85"
 
 S = "${UNPACKDIR}/${BP}/dos2unix"
 
-- 
2.47.1


--===============2937674403632639144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dbg: PKGV changed from 7.5.2 [default] to 7.5.3 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dbg: PKGSIZE changed from 265712 to 265736 (+0%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dbg: PV changed from "7.5.2" to "7.5.3"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dev: PKGV changed from 7.5.2 [default] to 7.5.3 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dev: PV changed from "7.5.2" to "7.5.3"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PKGV changed from 7.5.2 [default] to 7.5.3 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PKGSIZE changed from 203400 to 205825 (+1%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PV changed from "7.5.2" to "7.5.3"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-locale: PKGV changed from 7.5.2 [default] to 7.5.3 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-locale: PV changed from "7.5.2" to "7.5.3"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PKGV changed from 7.5.2 [default] to 7.5.3 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PKGSIZE changed from 202322 to 202090 (-0%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PV changed from "7.5.2" to "7.5.3"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-staticdev: PKGV changed from 7.5.2 [default] to 7.5.3 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-staticdev: PV changed from "7.5.2" to "7.5.3"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix: PKGV changed from 7.5.2 [default] to 7.5.3 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix: PV changed from "7.5.2" to "7.5.3"
packages/x86-64-v3-poky-linux/dos2unix: PKGV changed from 7.5.2 [default] to 7.5.3 [default]
packages/x86-64-v3-poky-linux/dos2unix: PV changed from "7.5.2" to "7.5.3"

--===============2937674403632639144==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dos2unix-upgrade-7.5.2-7.5.3.patch"

RnJvbSBkNGIwMzJjODk5NzE3ZjkwYWNjYWVmYzBkNGM0N2RhYjFkZThiYjNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTU6NTE6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
b3MydW5peDogdXBncmFkZSA3LjUuMiAtPiA3LjUuMwoKLS0tCiAuLi4ve2RvczJ1bml4XzcuNS4y
LmJiID0+IGRvczJ1bml4XzcuNS4zLmJifSAgfCAyNiArKysrKysrKysrKysrKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC97ZG9zMnVuaXhfNy41LjIuYmIgPT4gZG9zMnVuaXhf
Ny41LjMuYmJ9ICg1NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZG9zMnVu
aXgvZG9zMnVuaXhfNy41LjIuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC9kb3My
dW5peF83LjUuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDU1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kb3MydW5peC9kb3MydW5peF83LjUuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZG9zMnVuaXgvZG9zMnVuaXhfNy41LjMuYmIKaW5kZXggYzM4MDNmNDU3Yi4u
OTg2NTQyNGZmNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZG9zMnVuaXgvZG9z
MnVuaXhfNy41LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZG9zMnVuaXgvZG9zMnVu
aXhfNy41LjMuYmIKQEAgLTEsMyArMSwyNSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtT
VU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUg
Zm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBs
aWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVk
LCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEg
J0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5
cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJ
TkcudHh0CisjICsrKyBDT1BZSU5HLnR4dAorIyBAQCAtMiw3ICsyLDcgQEAKKyMgIFNlZSBhbHNv
IGh0dHBzOi8vd3d3LmZyZWVic2Qub3JnL2NvcHlyaWdodC9mcmVlYnNkLWxpY2Vuc2UuaHRtbAor
IyAgLS0tLS0tLS0KKyMgIAorIyAtQ29weXJpZ2h0IChDKSAyMDA5LTIwMjQgIEVyd2luIFdhdGVy
bGFuZGVyCisjICtDb3B5cmlnaHQgKEMpIDIwMDktMjAyNSAgRXJ3aW4gV2F0ZXJsYW5kZXIKKyMg
IENvcHlyaWdodCAoQykgMTk5OCBDaHJpc3RpYW4gV3VybGwKKyMgIENvcHlyaWdodCAoQykgMTk5
OCBCZXJuZCBKb2hhbm5lcyBXdWViYmVuCisjICBDb3B5cmlnaHQgKEMpIDE5OTQtMTk5NSBCZW5q
YW1pbiBMaW4uCisjIAorIworCiBTVU1NQVJZID0gIkNvbnZlcnQgdGV4dCBmaWxlIGxpbmUgZW5k
aW5ncyBiZXR3ZWVuIENSTEYgYW5kIExGIgogREVTQ1JJUFRJT04gPSAiVGhlIERvczJ1bml4IHBh
Y2thZ2UgaW5jbHVkZXMgdXRpbGl0aWVzIGRvczJ1bml4IGFuZCBcCiB1bml4MmRvcyB0byBjb252
ZXJ0IHBsYWluIHRleHQgZmlsZXMgaW4gRE9TIG9yIE1hYyBmb3JtYXQgdG8gVW5peCBcCkBAIC02
LDEyICsyOCwxMiBAQCBIT01FUEFHRSA9ICJodHRwOi8vd2F0ZXJsYW4uaG9tZS54czRhbGwubmwv
ZG9zMnVuaXguaHRtbCIKIFNFQ1RJT04gPSAic3VwcG9ydCIKIAogTElDRU5TRSA9ICJCU0QtMi1D
bGF1c2UiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HLnR4dDttZDU9NDllYzc0
ZTAxMzk3MTIzOThiOWRkYjA2ZDgyNDkyOWEiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9D
T1BZSU5HLnR4dDttZDU9MDgwMmZmMjU3YmZlYjliYjA3YWU0ZTRkZTA0ZTMyMjMiCiAKIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0LmNvZGUuc2YubmV0L3AvZG9zMnVuaXgvZG9zMnVuaXg7YnJhbmNoPW1h
c3Rlcjtwcm90b2NvbD1odHRwcyIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gImRvczJ1
bml4LSg/UDxwdmVyPihcZCsoXC5cZCspKykpIgogCi1TUkNSRVYgPSAiYzE2YTBiMzFhNjRjN2Vi
NmIyZDc2OTYwZTUxNDQ3MzJiNTdmMjk5MyIKK1NSQ1JFViA9ICI5ZGY0NDQ0Nzk0N2E3YjMxMWM2
MmVhMDM4M2JlOTQwODBlZGNhZjg1IgogCiBTID0gIiR7VU5QQUNLRElSfS8ke0JQfS9kb3MydW5p
eCIKIAotLSAKMi40Ny4xCgo=

--===============2937674403632639144==--

