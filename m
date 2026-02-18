Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E53C531D6
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:48 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1414.1771440096633008302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=4Dr761jK;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YBC6kn6k;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c720ec5f6-8ae46777-3b7e-46c5-8ba3-c82106bd8312-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440096;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qWn/y/CzGPqhZkmZkwazHi+51EFWqdpAx2Cflc1nCFY=;
	b=4Dr761jKfcqE+bgowKrN4QI7BZZaoQF/zEWlf7ULOReEwhe3WiKHjDAD3uDwVi30
	YJJpi2/qBRbcuyEcOpB2MRDvFVfhUUM7UKv/sN641Gz5Nil5PbtaM2MXCjB10lup3tV
	FDHE4bEyeRqC8vOH4OiNHalHnPcULDDPUknJiLF8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440096;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qWn/y/CzGPqhZkmZkwazHi+51EFWqdpAx2Cflc1nCFY=;
	b=YBC6kn6kxzwsNO0I4ENC4R6eQ4ypVH5iNLeYfyzD1JnQCSYu+nVygXzffQjnZVzd
	3blE72/KRq++DQO/b6Y5tmSgJ/Tl//jLayaDQ9zizFbn1zdLhDPNvLpaGvXIl9AcRQF
	akQBxjP1r1GytcP4iaqQ4KYhb1sDCkXnZ7GS1jzw=
Content-Type: multipart/mixed; boundary="===============4318856130015958488=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>, Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap-ng-python,libcap-ng: upgrading to 0.9.1,0.9.1 SUCCEEDED
Message-ID: <0101019c720ec5f6-8ae46777-3b7e-46c5-8ba3-c82106bd8312-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231330

--===============4318856130015958488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libcap-ng-python,libcap-ng* to *0.9.1,0.9.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcap-ng-python-libcap-ng-upgrade-0.9-0.9.1-0.9-0.9.patch
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
From 4e9c720e86fa5fab585d6d8d837a65503798aa31 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 11:20:30 +0000
Subject: [PATCH] libcap-ng-python,libcap-ng: upgrade 0.9 -> 0.9.1,0.9 -> 0.9.1

---
 .../{libcap-ng-python_0.9.bb => libcap-ng-python_0.9.1.bb}      | 0
 meta/recipes-support/libcap-ng/libcap-ng.inc                    | 2 +-
 .../libcap-ng/{libcap-ng_0.9.bb => libcap-ng_0.9.1.bb}          | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.9.bb => libcap-ng-python_0.9.1.bb} (100%)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.9.bb => libcap-ng_0.9.1.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.9.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 632527eb12..9d65c889bd 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 SRC_URI = "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "6ab1fe90fc24fcc1ed4ced635eb20166bcf00023"
+SRCREV = "427ed6d2c2b16e9b48f12953e55febfead3ef2e2"
 
 inherit lib_package autotools pkgconfig
 
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.9.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb
-- 
2.47.1


--===============4318856130015958488==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcap-ng-python-libcap-ng-upgrade-0.9-0.9.1-0.9-0.9.patch"

RnJvbSA0ZTljNzIwZTg2ZmE1ZmFiNTg1ZDZkOGQ4MzdhNjU1MDM3OThhYTMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTE6MjA6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJjYXAtbmctcHl0aG9uLGxpYmNhcC1uZzogdXBncmFkZSAwLjkgLT4gMC45LjEsMC45IC0+IDAu
OS4xCgotLS0KIC4uLi97bGliY2FwLW5nLXB5dGhvbl8wLjkuYmIgPT4gbGliY2FwLW5nLXB5dGhv
bl8wLjkuMS5iYn0gICAgICB8IDAKIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJj
YXAtbmcuaW5jICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9saWJjYXAtbmcve2xpYmNh
cC1uZ18wLjkuYmIgPT4gbGliY2FwLW5nXzAuOS4xLmJifSAgICAgICAgICB8IDAKIDMgZmlsZXMg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9saWJjYXAtbmcve2xpYmNhcC1uZy1weXRob25fMC45LmJiID0+IGxpYmNhcC1u
Zy1weXRob25fMC45LjEuYmJ9ICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmNhcC1uZy97bGliY2FwLW5nXzAuOS5iYiA9PiBsaWJjYXAtbmdfMC45LjEuYmJ9ICgxMDAlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmctcHl0
aG9uXzAuOS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmctcHl0
aG9uXzAuOS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nLXB5dGhvbl8wLjkuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmctcHl0aG9uXzAuOS4xLmJiCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nLmluYyBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmcuaW5jCmluZGV4IDYzMjUy
N2ViMTIuLjlkNjVjODg5YmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNh
cC1uZy9saWJjYXAtbmcuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9s
aWJjYXAtbmcuaW5jCkBAIC04LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9D
T1BZSU5HO21kNT05NGQ1NWQ1MTJhOWJhMzZjYWE5YjdkZjA3OWJhZTE5ZiBcCiAJCSAgICBmaWxl
Oi8vQ09QWUlORy5MSUI7bWQ1PWUzZWRhMDFkOTgxNWY4ZDI0YWFlMmRiZDg5YjY4YjA2IgogCiBT
UkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vc3RldmVncnViYi9saWJjYXAtbmcuZ2l0O3Byb3Rv
Y29sPWh0dHBzO2JyYW5jaD1tYXN0ZXI7dGFnPXYke1BWfSIKLVNSQ1JFViA9ICI2YWIxZmU5MGZj
MjRmY2MxZWQ0Y2VkNjM1ZWIyMDE2NmJjZjAwMDIzIgorU1JDUkVWID0gIjQyN2VkNmQyYzJiMTZl
OWI0OGYxMjk1M2U1NWZlYmZlYWQzZWYyZTIiCiAKIGluaGVyaXQgbGliX3BhY2thZ2UgYXV0b3Rv
b2xzIHBrZ2NvbmZpZwogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAt
bmcvbGliY2FwLW5nXzAuOS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJj
YXAtbmdfMC45LjEuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmdfMC45LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nXzAuOS4xLmJiCi0tIAoyLjQ3LjEKCg==

--===============4318856130015958488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bin: PKGSIZE changed from 61600 to 55416 (-10%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bin: FILELIST: removed "/usr/bin/captest"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-doc: FILELIST: removed "/usr/share/man/man8/captest.8"
Changes to packages/x86_64-linux/libcap-ng-native (sysroot):
  /usr/bin/captest was removed

--===============4318856130015958488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libcap-ng-python: SRC_URI changed from "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v0.9" to "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v0.9.1"
packages/x86-64-v3-poky-linux/libcap-ng-python: PKGV changed from 0.9 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python: PV changed from "0.9" to "0.9.1"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-bin: PKGV changed from 0.9 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-bin: PV changed from "0.9" to "0.9.1"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dbg: PKGSIZE changed from 165696 to 165704 (+0%)
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dbg: PKGV changed from 0.9 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dbg: PV changed from "0.9" to "0.9.1"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dev: PKGV changed from 0.9 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dev: PV changed from "0.9" to "0.9.1"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-doc: PKGV changed from 0.9 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-doc: PV changed from "0.9" to "0.9.1"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-locale: PKGV changed from 0.9 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-locale: PV changed from "0.9" to "0.9.1"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-src: PKGSIZE changed from 170448 to 170406 (-0%)
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-src: FILELIST: directory renamed /usr/src/debug/libcap-ng-python/0.9/bindings/python3 -> /usr/src/debug/libcap-ng-python/0.9.1/bindings/python3
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-src: PKGV changed from 0.9 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-src: PV changed from "0.9" to "0.9.1"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-staticdev: PKGV changed from 0.9 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-staticdev: PV changed from "0.9" to "0.9.1"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python: PKGV changed from 0.9 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python: PV changed from "0.9" to "0.9.1"
packages/x86-64-v3-poky-linux/libcap-ng: SRC_URI changed from "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v0.9" to "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v0.9.1"
packages/x86-64-v3-poky-linux/libcap-ng: PKGV changed from 0.9 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/libcap-ng: PV changed from "0.9" to "0.9.1"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bin: PKGSIZE changed from 61600 to 55416 (-10%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bin: FILELIST: removed "/usr/bin/captest"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bin: PKGV changed from 0.9 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bin: PV changed from "0.9" to "0.9.1"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dbg: PKGSIZE changed from 177536 to 160440 (-10%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dbg: FILELIST: removed "/usr/bin/.debug/captest"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dbg: PKGV changed from 0.9 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dbg: PV changed from "0.9" to "0.9.1"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dev: PKGSIZE changed from 5239 to 5199 (-1%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dev: PKGV changed from 0.9 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dev: PV changed from "0.9" to "0.9.1"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-doc: PKGSIZE changed from 28596 to 26708 (-7%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-doc: FILELIST: removed "/usr/share/man/man8/captest.8"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-doc: PKGV changed from 0.9 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-doc: PV changed from "0.9" to "0.9.1"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-locale: PKGV changed from 0.9 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-locale: PV changed from "0.9" to "0.9.1"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-src: PKGSIZE changed from 80906 to 79439 (-2%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-src: FILELIST: directory renamed /usr/src/debug/libcap-ng/0.9/src -> /usr/src/debug/libcap-ng/0.9.1/src, removed "/usr/src/debug/libcap-ng/0.9/utils/captest.c /usr/src/debug/libcap-ng/0.9/utils/proc-llist.h /usr/src/debug/libcap-ng/0.9/utils/netcap.c /usr/src/debug/libcap-ng/0.9/utils/pscap.c /usr/src/debug/libcap-ng/0.9/utils/proc-llist.c /usr/src/debug/libcap-ng/0.9/utils/filecap.c", added "/usr/src/debug/libcap-ng/0.9.1/utils/pscap.c /usr/src/debug/libcap-ng/0.9.1/utils/filecap.c /usr/src/debug/libcap-ng/0.9.1/utils/netcap.c /usr/src/debug/libcap-ng/0.9.1/utils/proc-llist.c /usr/src/debug/libcap-ng/0.9.1/utils/proc-llist.h"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-src: PKGV changed from 0.9 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-src: PV changed from "0.9" to "0.9.1"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-staticdev: PKGV changed from 0.9 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-staticdev: PV changed from "0.9" to "0.9.1"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng: PKGSIZE changed from 40794 to 40866 (+0%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng: PKGV changed from 0.9 [default] to 0.9.1 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng: PV changed from "0.9" to "0.9.1"
Changes to packages/x86_64-linux/libcap-ng-native (sysroot):
  /usr/bin/captest was removed

--===============4318856130015958488==--

