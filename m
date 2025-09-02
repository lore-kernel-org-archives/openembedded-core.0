Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D0A2CAC582
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:54 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.90012.1756850203777327087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XnAWtpu/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=li7vZpZJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101990c6eaae7-d7a0160b-d9b8-46de-b410-e46bbbd033bc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850203;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=D/RJ53cJ7EJbVAG+y/I8lq2lKPOYewfGPrwU/J1qRDo=;
	b=XnAWtpu/BXOWFNaOlOVr1p0aZ91OrnctQrRAGcc3Q7APFjckXRCK+eAXxA2sbu0I
	ttZFfFikOQ6YkX9S4+apwKf0/7fV0QEmApcYmpzAglQfPvEansb2HbrU16WUAN8EJbn
	jXTTUwIAgzDsW6TxrXn+rT56Gn+uJmsXHGhAC00I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850203;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=D/RJ53cJ7EJbVAG+y/I8lq2lKPOYewfGPrwU/J1qRDo=;
	b=li7vZpZJeA5qZ97lyRgpGy2y3uXrAOOKYKpSsugS3bWRftwYO1zaFnp2G057a/BA
	zmyy7HFIDXdg5qwF/FT5g39OvQtX89t/OUz53ThpWJoR67rIGx0DU7P9T4qbHraeV+F
	RZpVheEb+RCwtl2hrN/iKxpbfJZWOvX2WzePYSug=
Content-Type: multipart/mixed; boundary="===============7051872757498435980=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] boost-build-native: upgrading to 1.89.0 SUCCEEDED
Message-ID: <010101990c6eaae7-d7a0160b-d9b8-46de-b410-e46bbbd033bc-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222824

--===============7051872757498435980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *boost-build-native* to *1.89.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-boost-build-native-upgrade-1.87.0-1.89.0.patch
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
From 2213b930cfa9df4a5b37e11c2abff8cf284c1dd9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 21:15:09 +0000
Subject: [PATCH] boost-build-native: upgrade 1.87.0 -> 1.89.0

---
 ...oost-build-native_1.87.0.bb => boost-build-native_1.89.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/boost/{boost-build-native_1.87.0.bb => boost-build-native_1.89.0.bb} (92%)

diff --git a/meta/recipes-support/boost/boost-build-native_1.87.0.bb b/meta/recipes-support/boost/boost-build-native_1.89.0.bb
similarity index 92%
rename from meta/recipes-support/boost/boost-build-native_1.87.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.89.0.bb
index 5b914b6f88..c6304e3417 100644
--- a/meta/recipes-support/boost/boost-build-native_1.87.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.89.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master"
-SRCREV = "4a52d8c06635435b64e31a56eaf7ca5dc912a71d"
+SRCREV = "be69c44857e34fae250aa1321808a05c1d88bfde"
 PE = "1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "boost-(?P<pver>(\d+(\.\d+)+))"
-- 
2.47.1


--===============7051872757498435980==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-boost-build-native-upgrade-1.87.0-1.89.0.patch"

RnJvbSAyMjEzYjkzMGNmYTlkZjRhNWIzN2UxMWMyYWJmZjhjZjI4NGMxZGQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAyMToxNTowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJv
b3N0LWJ1aWxkLW5hdGl2ZTogdXBncmFkZSAxLjg3LjAgLT4gMS44OS4wCgotLS0KIC4uLm9vc3Qt
YnVpbGQtbmF0aXZlXzEuODcuMC5iYiA9PiBib29zdC1idWlsZC1uYXRpdmVfMS44OS4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2Jvb3N0L3tib29zdC1idWlsZC1uYXRpdmVfMS44Ny4w
LmJiID0+IGJvb3N0LWJ1aWxkLW5hdGl2ZV8xLjg5LjAuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9vc3QtYnVpbGQtbmF0aXZlXzEuODcuMC5iYiBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jvb3N0L2Jvb3N0LWJ1aWxkLW5hdGl2ZV8xLjg5LjAuYmIK
c2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9v
c3QvYm9vc3QtYnVpbGQtbmF0aXZlXzEuODcuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvYm9vc3QvYm9vc3QtYnVpbGQtbmF0aXZlXzEuODkuMC5iYgppbmRleCA1YjkxNGI2Zjg4
Li5jNjMwNGUzNDE3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29z
dC1idWlsZC1uYXRpdmVfMS44Ny4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jvb3N0
L2Jvb3N0LWJ1aWxkLW5hdGl2ZV8xLjg5LjAuYmIKQEAgLTcsNyArNyw3IEBAIExJQ0VOU0UgPSAi
QlNMLTEuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT1lNDIy
NGNjYWVjYjE0ZDk0MmM3MWQzMWJlZjIwZDc4YyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIu
Y29tL2Jvb3N0b3JnL2J1aWxkO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIiCi1TUkNSRVYg
PSAiNGE1MmQ4YzA2NjM1NDM1YjY0ZTMxYTU2ZWFmN2NhNWRjOTEyYTcxZCIKK1NSQ1JFViA9ICJi
ZTY5YzQ0ODU3ZTM0ZmFlMjUwYWExMzIxODA4YTA1YzFkODhiZmRlIgogUEUgPSAiMSIKIAogVVBT
VFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiYm9vc3QtKD9QPHB2ZXI+KFxkKyhcLlxkKykrKSki
Ci0tIAoyLjQ3LjEKCg==

--===============7051872757498435980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86_64-linux/boost-build-native (sysroot):
  /usr/share/b2/src/tools/cc.jam was added
  /usr/share/b2/src/tools/ibmcxx.jam was added
  /usr/share/b2/src/tools/vacpp.jam was removed
  /usr/share/b2/src/tools/xlcpp.jam was removed

--===============7051872757498435980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/boost-build-native (sysroot):
  /usr/share/b2/src/tools/cc.jam was added
  /usr/share/b2/src/tools/ibmcxx.jam was added
  /usr/share/b2/src/tools/vacpp.jam was removed
  /usr/share/b2/src/tools/xlcpp.jam was removed

--===============7051872757498435980==--

