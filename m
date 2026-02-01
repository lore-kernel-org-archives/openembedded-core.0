Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B28E65286
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:13:09 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29199.1769951579225600102
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:13:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LkUFbmR/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=XKYERNRA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019c1955d334-e2d4d46f-9556-4588-9d7c-e8d95504e385-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951581;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eQ0nSN7d6HUI91QdhCUYSc8KhCC/pcuFqNcjIretx2s=;
	b=LkUFbmR/N5lg84VReXRgHJPv4yS1S4vmPQae8aqrM6pJlSRtWVNVnXD+UbdWTRka
	rfif0rI25jPHDB5srzoXj/5QVyR8bis7dBa0/9EWB786djympOsUU01sfZ9O3RbmPpa
	EvAUq+e4H6CJSNdnFNQufoMt5bdjGm/JWqgYBgFc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951581;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eQ0nSN7d6HUI91QdhCUYSc8KhCC/pcuFqNcjIretx2s=;
	b=XKYERNRASigQdnAQw4lUBNfIDTss7Ut3Q/wO/xyGIpNlYfcZ/OAFjQmDievqYCQl
	mYrtCpPnzTClmPlXaXFIJ3Do9ZCuyn5+57E6+ecuFQcZWjXs4kI1WnAmW6zYYDHi3dO
	Vbi2pbN9uDZGX64XiF2h1flWmZWvztWrh0uQPU6g=
Content-Type: multipart/mixed; boundary="===============7798735599414828971=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dos2unix: upgrading to 7.5.4 SUCCEEDED
Message-ID: <0101019c1955d334-e2d4d46f-9556-4588-9d7c-e8d95504e385-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:13:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230328

--===============7798735599414828971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dos2unix* to *7.5.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dos2unix-upgrade-7.5.3-7.5.4.patch
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
From 7c11fd2db4c0e344c12e80034c65d4f8295aaeaa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 12:58:36 +0000
Subject: [PATCH] dos2unix: upgrade 7.5.3 -> 7.5.4

---
 .../{dos2unix_7.5.3.bb => dos2unix_7.5.4.bb}  | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.5.3.bb => dos2unix_7.5.4.bb} (55%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.3.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.4.bb
similarity index 55%
rename from meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.5.4.bb
index ae69110c39..f4e481426c 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.4.bb
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
+# -Copyright (C) 2009-2025  Erwin Waterlander
+# +Copyright (C) 2009-2026  Erwin Waterlander
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
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=0802ff257bfeb9bb07ae4e4de04e3223"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af1174fd3d1a254eec3a4a1d1da170a9"
 
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "9df44447947a7b311c62ea0383be94080edcaf85"
+SRCREV = "dd37537e5fe03ac123aca9a9c944ef87fb998dcd"
 
 S = "${UNPACKDIR}/${BP}/dos2unix"
 
-- 
2.47.1


--===============7798735599414828971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: FILELIST: directory renamed /usr/share/doc/dos2unix-7.5.3 -> /usr/share/doc/dos2unix-7.5.4

--===============7798735599414828971==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dos2unix-upgrade-7.5.3-7.5.4.patch"

RnJvbSA3YzExZmQyZGI0YzBlMzQ0YzEyZTgwMDM0YzY1ZDRmODI5NWFhZWFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAxMjo1ODozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRv
czJ1bml4OiB1cGdyYWRlIDcuNS4zIC0+IDcuNS40CgotLS0KIC4uLi97ZG9zMnVuaXhfNy41LjMu
YmIgPT4gZG9zMnVuaXhfNy41LjQuYmJ9ICB8IDI2ICsrKysrKysrKysrKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2RvczJ1bml4L3tkb3MydW5peF83LjUuMy5iYiA9PiBkb3MydW5peF83
LjUuNC5iYn0gKDU1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5p
eC9kb3MydW5peF83LjUuMy5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RvczJ1bml4L2RvczJ1
bml4XzcuNS40LmJiCnNpbWlsYXJpdHkgaW5kZXggNTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2RvczJ1bml4L2RvczJ1bml4XzcuNS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kb3MydW5peC9kb3MydW5peF83LjUuNC5iYgppbmRleCBhZTY5MTEwYzM5Li5m
NGU0ODE0MjZjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC9kb3My
dW5peF83LjUuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC9kb3MydW5p
eF83LjUuNC5iYgpAQCAtMSwzICsxLDI1IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NV
TSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBm
b2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxp
Y2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQs
IGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAn
TGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHly
aWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlO
Ry50eHQKKyMgKysrIENPUFlJTkcudHh0CisjIEBAIC0yLDcgKzIsNyBAQAorIyAgU2VlIGFsc28g
aHR0cHM6Ly93d3cuZnJlZWJzZC5vcmcvY29weXJpZ2h0L2ZyZWVic2QtbGljZW5zZS5odG1sCisj
ICAtLS0tLS0tLQorIyAgCisjIC1Db3B5cmlnaHQgKEMpIDIwMDktMjAyNSAgRXJ3aW4gV2F0ZXJs
YW5kZXIKKyMgK0NvcHlyaWdodCAoQykgMjAwOS0yMDI2ICBFcndpbiBXYXRlcmxhbmRlcgorIyAg
Q29weXJpZ2h0IChDKSAxOTk4IENocmlzdGlhbiBXdXJsbAorIyAgQ29weXJpZ2h0IChDKSAxOTk4
IEJlcm5kIEpvaGFubmVzIFd1ZWJiZW4KKyMgIENvcHlyaWdodCAoQykgMTk5NC0xOTk1IEJlbmph
bWluIExpbi4KKyMgCisjCisKIFNVTU1BUlkgPSAiQ29udmVydCB0ZXh0IGZpbGUgbGluZSBlbmRp
bmdzIGJldHdlZW4gQ1JMRiBhbmQgTEYiCiBERVNDUklQVElPTiA9ICJUaGUgRG9zMnVuaXggcGFj
a2FnZSBpbmNsdWRlcyB1dGlsaXRpZXMgZG9zMnVuaXggYW5kIFwKIHVuaXgyZG9zIHRvIGNvbnZl
cnQgcGxhaW4gdGV4dCBmaWxlcyBpbiBET1Mgb3IgTWFjIGZvcm1hdCB0byBVbml4IFwKQEAgLTYs
MTIgKzI4LDEyIEBAIEhPTUVQQUdFID0gImh0dHA6Ly93YXRlcmxhbi5ob21lLnhzNGFsbC5ubC9k
b3MydW5peC5odG1sIgogU0VDVElPTiA9ICJzdXBwb3J0IgogCiBMSUNFTlNFID0gIkJTRC0yLUNs
YXVzZSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkcudHh0O21kNT0wODAyZmYy
NTdiZmViOWJiMDdhZTRlNGRlMDRlMzIyMyIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NP
UFlJTkcudHh0O21kNT1hZjExNzRmZDNkMWEyNTRlZWMzYTRhMWQxZGExNzBhOSIKIAogU1JDX1VS
SSA9ICJnaXQ6Ly9naXQuY29kZS5zZi5uZXQvcC9kb3MydW5peC9kb3MydW5peDticmFuY2g9bWFz
dGVyO3Byb3RvY29sPWh0dHBzIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiZG9zMnVu
aXgtKD9QPHB2ZXI+KFxkKyhcLlxkKykrKSkiCiAKLVNSQ1JFViA9ICI5ZGY0NDQ0Nzk0N2E3YjMx
MWM2MmVhMDM4M2JlOTQwODBlZGNhZjg1IgorU1JDUkVWID0gImRkMzc1MzdlNWZlMDNhYzEyM2Fj
YTlhOWM5NDRlZjg3ZmI5OThkY2QiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9LyR7QlB9L2RvczJ1bml4
IgogCi0tIAoyLjQ3LjEKCg==

--===============7798735599414828971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dbg: PKGV changed from 7.5.3 [default] to 7.5.4 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dbg: PKGSIZE changed from 265984 to 273464 (+3%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dbg: PV changed from "7.5.3" to "7.5.4"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dev: PKGV changed from 7.5.3 [default] to 7.5.4 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dev: PV changed from "7.5.3" to "7.5.4"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PKGV changed from 7.5.3 [default] to 7.5.4 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PKGSIZE changed from 205825 to 206544 (+0%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PV changed from "7.5.3" to "7.5.4"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: FILELIST: directory renamed /usr/share/doc/dos2unix-7.5.3 -> /usr/share/doc/dos2unix-7.5.4
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-locale: PKGV changed from 7.5.3 [default] to 7.5.4 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-locale: PV changed from "7.5.3" to "7.5.4"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PKGV changed from 7.5.3 [default] to 7.5.4 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PKGSIZE changed from 202090 to 202072 (-0%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PV changed from "7.5.3" to "7.5.4"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: FILELIST: directory renamed /usr/src/debug/dos2unix/7.5.3 -> /usr/src/debug/dos2unix/7.5.4
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-staticdev: PKGV changed from 7.5.3 [default] to 7.5.4 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-staticdev: PV changed from "7.5.3" to "7.5.4"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix: PKGV changed from 7.5.3 [default] to 7.5.4 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix: PKGSIZE changed from 110736 to 118928 (+7%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix: PV changed from "7.5.3" to "7.5.4"
packages/x86-64-v3-poky-linux/dos2unix: PKGV changed from 7.5.3 [default] to 7.5.4 [default]
packages/x86-64-v3-poky-linux/dos2unix: PV changed from "7.5.3" to "7.5.4"

--===============7798735599414828971==--

