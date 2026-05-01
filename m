Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FD1CD484F
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:58 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15634.1777645554479136303
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TaOROGyw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pyPflgbp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019de3ee890a-c162bedb-8f16-48ce-ba32-43daa6c46b2e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ygL2NZcmnMDKmbMZQInRpdcbpTYb4ktumn7NIbElMfc=;
	b=TaOROGyw+gtxIjXfKlqV4LYUs/OXd6btbuckOyJSOA/OukORdqLsadXDIB54OkjG
	+2Kfr8kDNlektbz+KB/1XJ6eKHBtNgJtadR9456/yt2rqX584/Ok5QZhtQ+Th1S0zeH
	nilRoIC3EgqmqaYkZiyQMj9qNLXx3AZIOGcVL8ng=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ygL2NZcmnMDKmbMZQInRpdcbpTYb4ktumn7NIbElMfc=;
	b=pyPflgbpU+Sngo4G+tFwF3wGztAA+Y1Zdv5iAPXvzW8fxRoso4ljzzrlgSAjQVJs
	CrnX7nhpIb2qndJKgdaWcs93v/U5bpnciNrzI8ElYUI4j7ezFE1Fq9CjsB6vSFjmvVa
	x3an+AAA9IWS7xxwJ1yUskSWREGKLnKTq2SBiI+4=
Content-Type: multipart/mixed; boundary="===============5701086189842326334=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] boost-build-native: upgrading to 1.91.0 SUCCEEDED
Message-ID: <0101019de3ee890a-c162bedb-8f16-48ce-ba32-43daa6c46b2e-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236290

--===============5701086189842326334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *boost-build-native* to *1.91.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-boost-build-native-upgrade-1.90.0-1.91.0.patch
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
From 1ee3fa0556a6019f91876e90359bdc509f688c93 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 13:16:37 +0000
Subject: [PATCH] boost-build-native: upgrade 1.90.0 -> 1.91.0

---
 ...oost-build-native_1.90.0.bb => boost-build-native_1.91.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/boost/{boost-build-native_1.90.0.bb => boost-build-native_1.91.0.bb} (92%)

diff --git a/meta/recipes-support/boost/boost-build-native_1.90.0.bb b/meta/recipes-support/boost/boost-build-native_1.91.0.bb
similarity index 92%
rename from meta/recipes-support/boost/boost-build-native_1.90.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.91.0.bb
index 911de72bc1..c276cf436d 100644
--- a/meta/recipes-support/boost/boost-build-native_1.90.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.91.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master;tag=boost-${PV}"
-SRCREV = "be69c44857e34fae250aa1321808a05c1d88bfde"
+SRCREV = "85252c9d6a3817daca23ddae94ce16c7be4d2c12"
 PE = "1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "boost-(?P<pver>(\d+(\.\d+)+))"
-- 
2.47.1


--===============5701086189842326334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/boost-build-native (sysroot):
  /usr/share/b2/src/tools/features/contracts-feature.jam was added
  /usr/share/b2/src/tools/vcpkg.jam was added

--===============5701086189842326334==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-boost-build-native-upgrade-1.90.0-1.91.0.patch"

RnJvbSAxZWUzZmEwNTU2YTYwMTlmOTE4NzZlOTAzNTliZGM1MDlmNjg4YzkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMzoxNjozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJv
b3N0LWJ1aWxkLW5hdGl2ZTogdXBncmFkZSAxLjkwLjAgLT4gMS45MS4wCgotLS0KIC4uLm9vc3Qt
YnVpbGQtbmF0aXZlXzEuOTAuMC5iYiA9PiBib29zdC1idWlsZC1uYXRpdmVfMS45MS4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2Jvb3N0L3tib29zdC1idWlsZC1uYXRpdmVfMS45MC4w
LmJiID0+IGJvb3N0LWJ1aWxkLW5hdGl2ZV8xLjkxLjAuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9vc3QtYnVpbGQtbmF0aXZlXzEuOTAuMC5iYiBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jvb3N0L2Jvb3N0LWJ1aWxkLW5hdGl2ZV8xLjkxLjAuYmIK
c2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9v
c3QvYm9vc3QtYnVpbGQtbmF0aXZlXzEuOTAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvYm9vc3QvYm9vc3QtYnVpbGQtbmF0aXZlXzEuOTEuMC5iYgppbmRleCA5MTFkZTcyYmMx
Li5jMjc2Y2Y0MzZkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29z
dC1idWlsZC1uYXRpdmVfMS45MC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jvb3N0
L2Jvb3N0LWJ1aWxkLW5hdGl2ZV8xLjkxLjAuYmIKQEAgLTcsNyArNyw3IEBAIExJQ0VOU0UgPSAi
QlNMLTEuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT1lNDIy
NGNjYWVjYjE0ZDk0MmM3MWQzMWJlZjIwZDc4YyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIu
Y29tL2Jvb3N0b3JnL2J1aWxkO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXI7dGFnPWJvb3N0
LSR7UFZ9IgotU1JDUkVWID0gImJlNjljNDQ4NTdlMzRmYWUyNTBhYTEzMjE4MDhhMDVjMWQ4OGJm
ZGUiCitTUkNSRVYgPSAiODUyNTJjOWQ2YTM4MTdkYWNhMjNkZGFlOTRjZTE2YzdiZTRkMmMxMiIK
IFBFID0gIjEiCiAKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gImJvb3N0LSg/UDxwdmVy
PihcZCsoXC5cZCspKykpIgotLSAKMi40Ny4xCgo=

--===============5701086189842326334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86_64-linux/boost-build-native (sysroot):
  /usr/share/b2/src/tools/features/contracts-feature.jam was added
  /usr/share/b2/src/tools/vcpkg.jam was added

--===============5701086189842326334==--

