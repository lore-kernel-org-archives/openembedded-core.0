Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2707C48295
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:14 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.2093.1706810404801875450
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cgajzh5e;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ByJ1lsPr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018d65d3fd9d-f360ae8e-e46c-46f3-a9a0-b61af2d13970-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bA2kMdYlFfVd8lxi6DKonEDSWrLJDDkTsuXpqBeUieI=;
	b=cgajzh5eUFoXTcAvuhor/kEUDUitxdfNzwbKgNEZlhahPwvvq0UXrK2jbulAtFl8
	xF4kW7vqi5vcKnpHxusECCkBgCqCCnc5tgzP/o0/EbOWXBsN6koLsdecDTaPXMGFzJL
	f2Ocz51EsFEgSu1O/Oe2Eix9gYSGZut0Ys+93foY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bA2kMdYlFfVd8lxi6DKonEDSWrLJDDkTsuXpqBeUieI=;
	b=ByJ1lsPrrNKwA/Ig0P9iIXX1jwG9ebLFCxfg8RZRN9KGTJNKHkAXl2AUy9L8T3/F
	Ck95yB8GALvnIJzNa2dqDQPlqJB8R3GslTOevo9ieYFKLf+WhOfT7I6WEPKR0iHxfUo
	28emcD9FL0yyeWVK4e93ig+O9qqnoxaHLWOlDnPI=
Content-Type: multipart/mixed; boundary="===============6989415333211316792=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dos2unix: upgrading to 7.5.2 SUCCEEDED
Message-ID: <0101018d65d3fd9d-f360ae8e-e46c-46f3-a9a0-b61af2d13970-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194718

--===============6989415333211316792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dos2unix* to *7.5.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dos2unix-upgrade-7.5.1-7.5.2.patch
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
From 5d6f974a4d7f2a81909967ca4f583680c379abc5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 17:33:07 +0000
Subject: [PATCH] dos2unix: upgrade 7.5.1 -> 7.5.2

---
 .../{dos2unix_7.5.1.bb => dos2unix_7.5.2.bb}  | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.5.1.bb => dos2unix_7.5.2.bb} (55%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.1.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.2.bb
similarity index 55%
rename from meta/recipes-support/dos2unix/dos2unix_7.5.1.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.5.2.bb
index acf49f0483..43cd7854af 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.1.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.2.bb
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
+# -Copyright (C) 2009-2023  Erwin Waterlander
+# +Copyright (C) 2009-2024  Erwin Waterlander
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
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=37f72246ce2aa2fce9482c10b1f2b502"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=49ec74e0139712398b9ddb06d824929a"
 
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "9675e7aea32653e1c10ef027eb55d89f3c48ec1f"
+SRCREV = "c16a0b31a64c7eb6b2d76960e5144732b57f2993"
 
 S = "${WORKDIR}/git/dos2unix"
 
-- 
2.42.0


--===============6989415333211316792==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dos2unix-upgrade-7.5.1-7.5.2.patch"

RnJvbSA1ZDZmOTc0YTRkN2YyYTgxOTA5OTY3Y2E0ZjU4MzY4MGMzNzlhYmM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxNzozMzowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRv
czJ1bml4OiB1cGdyYWRlIDcuNS4xIC0+IDcuNS4yCgotLS0KIC4uLi97ZG9zMnVuaXhfNy41LjEu
YmIgPT4gZG9zMnVuaXhfNy41LjIuYmJ9ICB8IDI2ICsrKysrKysrKysrKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2RvczJ1bml4L3tkb3MydW5peF83LjUuMS5iYiA9PiBkb3MydW5peF83
LjUuMi5iYn0gKDU1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5p
eC9kb3MydW5peF83LjUuMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RvczJ1bml4L2RvczJ1
bml4XzcuNS4yLmJiCnNpbWlsYXJpdHkgaW5kZXggNTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2RvczJ1bml4L2RvczJ1bml4XzcuNS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kb3MydW5peC9kb3MydW5peF83LjUuMi5iYgppbmRleCBhY2Y0OWYwNDgzLi40
M2NkNzg1NGFmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC9kb3My
dW5peF83LjUuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC9kb3MydW5p
eF83LjUuMi5iYgpAQCAtMSwzICsxLDI1IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NV
TSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBm
b2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxp
Y2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQs
IGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAn
TGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHly
aWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlO
Ry50eHQKKyMgKysrIENPUFlJTkcudHh0CisjIEBAIC0yLDcgKzIsNyBAQAorIyAgU2VlIGFsc28g
aHR0cHM6Ly93d3cuZnJlZWJzZC5vcmcvY29weXJpZ2h0L2ZyZWVic2QtbGljZW5zZS5odG1sCisj
ICAtLS0tLS0tLQorIyAgCisjIC1Db3B5cmlnaHQgKEMpIDIwMDktMjAyMyAgRXJ3aW4gV2F0ZXJs
YW5kZXIKKyMgK0NvcHlyaWdodCAoQykgMjAwOS0yMDI0ICBFcndpbiBXYXRlcmxhbmRlcgorIyAg
Q29weXJpZ2h0IChDKSAxOTk4IENocmlzdGlhbiBXdXJsbAorIyAgQ29weXJpZ2h0IChDKSAxOTk4
IEJlcm5kIEpvaGFubmVzIFd1ZWJiZW4KKyMgIENvcHlyaWdodCAoQykgMTk5NC0xOTk1IEJlbmph
bWluIExpbi4KKyMgCisjCisKIFNVTU1BUlkgPSAiQ29udmVydCB0ZXh0IGZpbGUgbGluZSBlbmRp
bmdzIGJldHdlZW4gQ1JMRiBhbmQgTEYiCiBERVNDUklQVElPTiA9ICJUaGUgRG9zMnVuaXggcGFj
a2FnZSBpbmNsdWRlcyB1dGlsaXRpZXMgZG9zMnVuaXggYW5kIFwKIHVuaXgyZG9zIHRvIGNvbnZl
cnQgcGxhaW4gdGV4dCBmaWxlcyBpbiBET1Mgb3IgTWFjIGZvcm1hdCB0byBVbml4IFwKQEAgLTYs
MTIgKzI4LDEyIEBAIEhPTUVQQUdFID0gImh0dHA6Ly93YXRlcmxhbi5ob21lLnhzNGFsbC5ubC9k
b3MydW5peC5odG1sIgogU0VDVElPTiA9ICJzdXBwb3J0IgogCiBMSUNFTlNFID0gIkJTRC0yLUNs
YXVzZSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkcudHh0O21kNT0zN2Y3MjI0
NmNlMmFhMmZjZTk0ODJjMTBiMWYyYjUwMiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NP
UFlJTkcudHh0O21kNT00OWVjNzRlMDEzOTcxMjM5OGI5ZGRiMDZkODI0OTI5YSIKIAogU1JDX1VS
SSA9ICJnaXQ6Ly9naXQuY29kZS5zZi5uZXQvcC9kb3MydW5peC9kb3MydW5peDticmFuY2g9bWFz
dGVyO3Byb3RvY29sPWh0dHBzIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiZG9zMnVu
aXgtKD9QPHB2ZXI+KFxkKyhcLlxkKykrKSkiCiAKLVNSQ1JFViA9ICI5Njc1ZTdhZWEzMjY1M2Ux
YzEwZWYwMjdlYjU1ZDg5ZjNjNDhlYzFmIgorU1JDUkVWID0gImMxNmEwYjMxYTY0YzdlYjZiMmQ3
Njk2MGU1MTQ0NzMyYjU3ZjI5OTMiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQvZG9zMnVuaXgiCiAK
LS0gCjIuNDIuMAoK

--===============6989415333211316792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dos2unix/dos2unix-dbg: PV changed from "7.5.1" to "7.5.2"
packages/core2-64-poky-linux/dos2unix/dos2unix-dbg: PKGSIZE changed from 236112 to 238512 (+1%)
packages/core2-64-poky-linux/dos2unix/dos2unix-dbg: PKGV changed from 7.5.1 [default] to 7.5.2 [default]
packages/core2-64-poky-linux/dos2unix/dos2unix-dev: PV changed from "7.5.1" to "7.5.2"
packages/core2-64-poky-linux/dos2unix/dos2unix-dev: PKGV changed from 7.5.1 [default] to 7.5.2 [default]
packages/core2-64-poky-linux/dos2unix/dos2unix-doc: PV changed from "7.5.1" to "7.5.2"
packages/core2-64-poky-linux/dos2unix/dos2unix-doc: PKGSIZE changed from 198556 to 203398 (+2%)
packages/core2-64-poky-linux/dos2unix/dos2unix-doc: PKGV changed from 7.5.1 [default] to 7.5.2 [default]
packages/core2-64-poky-linux/dos2unix/dos2unix-locale: PV changed from "7.5.1" to "7.5.2"
packages/core2-64-poky-linux/dos2unix/dos2unix-locale: PKGV changed from 7.5.1 [default] to 7.5.2 [default]
packages/core2-64-poky-linux/dos2unix/dos2unix-src: PV changed from "7.5.1" to "7.5.2"
packages/core2-64-poky-linux/dos2unix/dos2unix-src: PKGSIZE changed from 201035 to 202322 (+1%)
packages/core2-64-poky-linux/dos2unix/dos2unix-src: PKGV changed from 7.5.1 [default] to 7.5.2 [default]
packages/core2-64-poky-linux/dos2unix/dos2unix-staticdev: PV changed from "7.5.1" to "7.5.2"
packages/core2-64-poky-linux/dos2unix/dos2unix-staticdev: PKGV changed from 7.5.1 [default] to 7.5.2 [default]
packages/core2-64-poky-linux/dos2unix/dos2unix: PV changed from "7.5.1" to "7.5.2"
packages/core2-64-poky-linux/dos2unix/dos2unix: PKGV changed from 7.5.1 [default] to 7.5.2 [default]
packages/core2-64-poky-linux/dos2unix: PV changed from "7.5.1" to "7.5.2"
packages/core2-64-poky-linux/dos2unix: PKGV changed from 7.5.1 [default] to 7.5.2 [default]

--===============6989415333211316792==--

