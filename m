Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83F3CD37BA
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:47 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2363.1762384580621705410
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=rdcL5Opc;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=SGItmpaR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019a564eef7a-d7ab55c0-8ebb-410f-a107-745e934df987-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384605;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4Yj3UOy0LoHh6GeCe/dJLfHkPG3TTl4Nqm7BVeDb+2c=;
	b=rdcL5Opchk2HS2lCpguryteI5w8uQh0S9/VY4xPvEiaCNZA0WqvEB/yNxUc7HKZb
	3XeK7h/XzBxHFkNddeJGKy4yeOo2rmYt2pA5Q2M9YDjIj6Oltg9wHrjzEikw3n0gy6F
	lr9EQn56zMhSWDQXvb/YJBRjqZmmWXoToTMvAk4c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384605;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4Yj3UOy0LoHh6GeCe/dJLfHkPG3TTl4Nqm7BVeDb+2c=;
	b=SGItmpaRoq7nelQkQ9D3b4raTRVQZ6Og2k1sCfoR8k0MON338scW0EtQVpeAUDhU
	nNqx+y3vHqUjkgkMnnfz8jES/runYu21e70o2KOboRAkTcemcj9JVDaLDjrbshkSfnZ
	VwT3Pmo0WkTRnHcTFJkv1VdmPqmoISsRCliNwxp0=
Content-Type: multipart/mixed; boundary="===============5637928034830165028=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dos2unix: upgrading to 7.5.3 SUCCEEDED
Message-ID: <0101019a564eef7a-d7ab55c0-8ebb-410f-a107-745e934df987-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225913

--===============5637928034830165028==
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
From 663a8b63e671826fb2f0d648a445338a0b8b7aea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 22:30:22 +0000
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


--===============5637928034830165028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dbg: PKGV changed from 7.5.2 [default] to 7.5.3 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dbg: PV changed from "7.5.2" to "7.5.3"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dbg: PKGSIZE changed from 265712 to 265736 (+0%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dev: PKGV changed from 7.5.2 [default] to 7.5.3 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dev: PV changed from "7.5.2" to "7.5.3"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PKGV changed from 7.5.2 [default] to 7.5.3 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PV changed from "7.5.2" to "7.5.3"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PKGSIZE changed from 203400 to 205825 (+1%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-locale: PKGV changed from 7.5.2 [default] to 7.5.3 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-locale: PV changed from "7.5.2" to "7.5.3"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PKGV changed from 7.5.2 [default] to 7.5.3 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PV changed from "7.5.2" to "7.5.3"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PKGSIZE changed from 202322 to 202090 (-0%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-staticdev: PKGV changed from 7.5.2 [default] to 7.5.3 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-staticdev: PV changed from "7.5.2" to "7.5.3"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix: PKGV changed from 7.5.2 [default] to 7.5.3 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix: PV changed from "7.5.2" to "7.5.3"
packages/x86-64-v3-poky-linux/dos2unix: PKGV changed from 7.5.2 [default] to 7.5.3 [default]
packages/x86-64-v3-poky-linux/dos2unix: PV changed from "7.5.2" to "7.5.3"

--===============5637928034830165028==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dos2unix-upgrade-7.5.2-7.5.3.patch"

RnJvbSA2NjNhOGI2M2U2NzE4MjZmYjJmMGQ2NDhhNDQ1MzM4YTBiOGI3YWVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMjozMDoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRv
czJ1bml4OiB1cGdyYWRlIDcuNS4yIC0+IDcuNS4zCgotLS0KIC4uLi97ZG9zMnVuaXhfNy41LjIu
YmIgPT4gZG9zMnVuaXhfNy41LjMuYmJ9ICB8IDI2ICsrKysrKysrKysrKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2RvczJ1bml4L3tkb3MydW5peF83LjUuMi5iYiA9PiBkb3MydW5peF83
LjUuMy5iYn0gKDU1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5p
eC9kb3MydW5peF83LjUuMi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RvczJ1bml4L2RvczJ1
bml4XzcuNS4zLmJiCnNpbWlsYXJpdHkgaW5kZXggNTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2RvczJ1bml4L2RvczJ1bml4XzcuNS4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kb3MydW5peC9kb3MydW5peF83LjUuMy5iYgppbmRleCBjMzgwM2Y0NTdiLi45
ODY1NDI0ZmY3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC9kb3My
dW5peF83LjUuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC9kb3MydW5p
eF83LjUuMy5iYgpAQCAtMSwzICsxLDI1IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NV
TSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBm
b2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxp
Y2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQs
IGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAn
TGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHly
aWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlO
Ry50eHQKKyMgKysrIENPUFlJTkcudHh0CisjIEBAIC0yLDcgKzIsNyBAQAorIyAgU2VlIGFsc28g
aHR0cHM6Ly93d3cuZnJlZWJzZC5vcmcvY29weXJpZ2h0L2ZyZWVic2QtbGljZW5zZS5odG1sCisj
ICAtLS0tLS0tLQorIyAgCisjIC1Db3B5cmlnaHQgKEMpIDIwMDktMjAyNCAgRXJ3aW4gV2F0ZXJs
YW5kZXIKKyMgK0NvcHlyaWdodCAoQykgMjAwOS0yMDI1ICBFcndpbiBXYXRlcmxhbmRlcgorIyAg
Q29weXJpZ2h0IChDKSAxOTk4IENocmlzdGlhbiBXdXJsbAorIyAgQ29weXJpZ2h0IChDKSAxOTk4
IEJlcm5kIEpvaGFubmVzIFd1ZWJiZW4KKyMgIENvcHlyaWdodCAoQykgMTk5NC0xOTk1IEJlbmph
bWluIExpbi4KKyMgCisjCisKIFNVTU1BUlkgPSAiQ29udmVydCB0ZXh0IGZpbGUgbGluZSBlbmRp
bmdzIGJldHdlZW4gQ1JMRiBhbmQgTEYiCiBERVNDUklQVElPTiA9ICJUaGUgRG9zMnVuaXggcGFj
a2FnZSBpbmNsdWRlcyB1dGlsaXRpZXMgZG9zMnVuaXggYW5kIFwKIHVuaXgyZG9zIHRvIGNvbnZl
cnQgcGxhaW4gdGV4dCBmaWxlcyBpbiBET1Mgb3IgTWFjIGZvcm1hdCB0byBVbml4IFwKQEAgLTYs
MTIgKzI4LDEyIEBAIEhPTUVQQUdFID0gImh0dHA6Ly93YXRlcmxhbi5ob21lLnhzNGFsbC5ubC9k
b3MydW5peC5odG1sIgogU0VDVElPTiA9ICJzdXBwb3J0IgogCiBMSUNFTlNFID0gIkJTRC0yLUNs
YXVzZSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkcudHh0O21kNT00OWVjNzRl
MDEzOTcxMjM5OGI5ZGRiMDZkODI0OTI5YSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NP
UFlJTkcudHh0O21kNT0wODAyZmYyNTdiZmViOWJiMDdhZTRlNGRlMDRlMzIyMyIKIAogU1JDX1VS
SSA9ICJnaXQ6Ly9naXQuY29kZS5zZi5uZXQvcC9kb3MydW5peC9kb3MydW5peDticmFuY2g9bWFz
dGVyO3Byb3RvY29sPWh0dHBzIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiZG9zMnVu
aXgtKD9QPHB2ZXI+KFxkKyhcLlxkKykrKSkiCiAKLVNSQ1JFViA9ICJjMTZhMGIzMWE2NGM3ZWI2
YjJkNzY5NjBlNTE0NDczMmI1N2YyOTkzIgorU1JDUkVWID0gIjlkZjQ0NDQ3OTQ3YTdiMzExYzYy
ZWEwMzgzYmU5NDA4MGVkY2FmODUiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9LyR7QlB9L2RvczJ1bml4
IgogCi0tIAoyLjQ3LjEKCg==

--===============5637928034830165028==--

