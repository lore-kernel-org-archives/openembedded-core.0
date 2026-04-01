Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E07107639D
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:04 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14743.1775054158428791199
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=P1S7rLE+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NEsuvMbr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019d4978f7aa-71142a4b-eac1-4c73-adb3-dfc7258a4fb6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054157;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0ftYzXQnHMgWYD+aNngjhcmAvmiQpF4TWMwcG45X4lk=;
	b=P1S7rLE+QIca8d7fMKjufM71TTjAR2nedZhAkuacHTmRtUusT2RJpPTfegKYalYG
	tZ+ji5pGTOs7rAFPAOy8D/8QCjOGlKaoTD2mC3ocebSNLHz24RFz3ls64pLWDIcm09j
	pUrn+4g5yPYOJeRJkiEbS1Qy5uo5Oh5VGxK/LORg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054157;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0ftYzXQnHMgWYD+aNngjhcmAvmiQpF4TWMwcG45X4lk=;
	b=NEsuvMbrcci+vLMGCJm9hP2UpL3byytWU3b1bpO6AyWGW933hXS+EBEYsZbr1zbk
	eEEHEoDJbOaIw8+4jtfdLhyeMhasjmAhxfH3stsEHXyYwGcgEs6kIbscADcyNfwW+a1
	i2+Q9LlzIcRdJHqy5mjeeI+5xStWP2E3iAWkTshQ=
Content-Type: multipart/mixed; boundary="===============6440980131596487041=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>, Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap-ng,libcap-ng-python: upgrading to 0.9.2,0.9.2 SUCCEEDED
Message-ID: <0101019d4978f7aa-71142a4b-eac1-4c73-adb3-dfc7258a4fb6-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:35:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234362

--===============6440980131596487041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libcap-ng,libcap-ng-python* to *0.9.2,0.9.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcap-ng-libcap-ng-python-upgrade-0.9.1-0.9.2-0.9.1.patch
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
From 5accc1fbf976de9693b79bc08bb3078f6c9fb309 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 06:37:15 +0000
Subject: [PATCH] libcap-ng,libcap-ng-python: upgrade 0.9.1 -> 0.9.2,0.9.1 ->
 0.9.2

---
 .../{libcap-ng-python_0.9.1.bb => libcap-ng-python_0.9.2.bb}    | 0
 meta/recipes-support/libcap-ng/libcap-ng.inc                    | 2 +-
 .../libcap-ng/{libcap-ng_0.9.1.bb => libcap-ng_0.9.2.bb}        | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.9.1.bb => libcap-ng-python_0.9.2.bb} (100%)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.9.1.bb => libcap-ng_0.9.2.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.2.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.9.2.bb
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 9d65c889bd..6452206971 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 SRC_URI = "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "427ed6d2c2b16e9b48f12953e55febfead3ef2e2"
+SRCREV = "8f73eec4ff303f24f51eadb09be7e1d040e5ffdd"
 
 inherit lib_package autotools pkgconfig
 
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.9.2.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.9.2.bb
-- 
2.47.1


--===============6440980131596487041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dbg: RRECOMMENDS: added "libatomic-dbg"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dbg: PKGSIZE changed from 177848 to 231768 (+30%)
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dev: RRECOMMENDS: added "libatomic-dev"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python: RDEPENDS: added "libatomic (['>= 15.2.0'])"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python: PKGSIZE changed from 93469 to 109831 (+18%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bin: PKGSIZE changed from 55416 to 96456 (+74%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dbg: PKGSIZE changed from 170608 to 323912 (+90%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-doc: PKGSIZE changed from 26708 to 36000 (+35%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-src: PKGSIZE changed from 79439 to 185652 (+134%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng: FILELIST: added "/etc/bash_completion.d/libcap-ng.bash_completion"
Changes to packages/x86_64-linux/libcap-ng-native (sysroot):
  /etc was added
  /etc/bash_completion.d was added
  /etc/bash_completion.d/libcap-ng.bash_completion was added

--===============6440980131596487041==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcap-ng-libcap-ng-python-upgrade-0.9.1-0.9.2-0.9.1.patch"

RnJvbSA1YWNjYzFmYmY5NzZkZTk2OTNiNzliYzA4YmIzMDc4ZjZjOWZiMzA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAwNjozNzoxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmNhcC1uZyxsaWJjYXAtbmctcHl0aG9uOiB1cGdyYWRlIDAuOS4xIC0+IDAuOS4yLDAuOS4xIC0+
CiAwLjkuMgoKLS0tCiAuLi4ve2xpYmNhcC1uZy1weXRob25fMC45LjEuYmIgPT4gbGliY2FwLW5n
LXB5dGhvbl8wLjkuMi5iYn0gICAgfCAwCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcv
bGliY2FwLW5nLmluYyAgICAgICAgICAgICAgICAgICAgfCAyICstCiAuLi4vbGliY2FwLW5nL3ts
aWJjYXAtbmdfMC45LjEuYmIgPT4gbGliY2FwLW5nXzAuOS4yLmJifSAgICAgICAgfCAwCiAzIGZp
bGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL3tsaWJjYXAtbmctcHl0aG9uXzAuOS4xLmJiID0+IGxp
YmNhcC1uZy1weXRob25fMC45LjIuYmJ9ICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYmNhcC1uZy97bGliY2FwLW5nXzAuOS4xLmJiID0+IGxpYmNhcC1uZ18wLjkuMi5iYn0g
KDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNh
cC1uZy1weXRob25fMC45LjEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGli
Y2FwLW5nLXB5dGhvbl8wLjkuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZy1weXRob25fMC45LjEuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmctcHl0aG9u
XzAuOS4yLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGli
Y2FwLW5nLmluYyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmcuaW5j
CmluZGV4IDlkNjVjODg5YmQuLjY0NTIyMDY5NzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmcuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmNhcC1uZy9saWJjYXAtbmcuaW5jCkBAIC04LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT05NGQ1NWQ1MTJhOWJhMzZjYWE5YjdkZjA3OWJhZTE5ZiBc
CiAJCSAgICBmaWxlOi8vQ09QWUlORy5MSUI7bWQ1PWUzZWRhMDFkOTgxNWY4ZDI0YWFlMmRiZDg5
YjY4YjA2IgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vc3RldmVncnViYi9saWJjYXAt
bmcuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXI7dGFnPXYke1BWfSIKLVNSQ1JFViA9
ICI0MjdlZDZkMmMyYjE2ZTliNDhmMTI5NTNlNTVmZWJmZWFkM2VmMmUyIgorU1JDUkVWID0gIjhm
NzNlZWM0ZmYzMDNmMjRmNTFlYWRiMDliZTdlMWQwNDBlNWZmZGQiCiAKIGluaGVyaXQgbGliX3Bh
Y2thZ2UgYXV0b3Rvb2xzIHBrZ2NvbmZpZwogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJjYXAtbmcvbGliY2FwLW5nXzAuOS4xLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliY2FwLW5nL2xpYmNhcC1uZ18wLjkuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZ18wLjkuMS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZ18wLjkuMi5i
YgotLSAKMi40Ny4xCgo=

--===============6440980131596487041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libcap-ng-python: SRC_URI changed from "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v0.9.1" to "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v0.9.2"
packages/x86-64-v3-poky-linux/libcap-ng-python: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-bin: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-bin: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dbg: RRECOMMENDS: added "libatomic-dbg"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dbg: PKGSIZE changed from 177848 to 231768 (+30%)
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dbg: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dbg: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dev: RRECOMMENDS: added "libatomic-dev"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dev: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dev: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-doc: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-doc: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-locale: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-locale: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-src: PKGSIZE changed from 170406 to 185974 (+9%)
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-src: FILELIST: directory renamed /usr/src/debug/libcap-ng-python/0.9.1/bindings/python3 -> /usr/src/debug/libcap-ng-python/0.9.2/bindings/python3
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-src: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-src: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-staticdev: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-staticdev: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python: PKGSIZE changed from 93469 to 109831 (+18%)
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python: RDEPENDS: added "libatomic (['>= 15.2.0'])"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/libcap-ng: SRC_URI changed from "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v0.9.1" to "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v0.9.2"
packages/x86-64-v3-poky-linux/libcap-ng: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/libcap-ng: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bin: PKGSIZE changed from 55416 to 96456 (+74%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bin: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bin: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dbg: PKGSIZE changed from 170608 to 323912 (+90%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dbg: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dbg: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dev: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dev: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-doc: PKGSIZE changed from 26708 to 36000 (+35%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-doc: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-doc: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-locale: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-locale: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-src: PKGSIZE changed from 79439 to 185652 (+134%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-src: FILELIST: directory renamed /usr/src/debug/libcap-ng/0.9.1/src -> /usr/src/debug/libcap-ng/0.9.2/src, removed "/usr/src/debug/libcap-ng/0.9.1/utils/filecap.c /usr/src/debug/libcap-ng/0.9.1/utils/netcap.c /usr/src/debug/libcap-ng/0.9.1/utils/proc-llist.c /usr/src/debug/libcap-ng/0.9.1/utils/proc-llist.h /usr/src/debug/libcap-ng/0.9.1/utils/pscap.c", added "/usr/src/debug/libcap-ng/0.9.2/utils/netcap-advanced.h /usr/src/debug/libcap-ng/0.9.2/utils/filecap.c /usr/src/debug/libcap-ng/0.9.2/utils/netcap-advanced.c /usr/src/debug/libcap-ng/0.9.2/utils/netcap.c /usr/src/debug/libcap-ng/0.9.2/utils/proc-sanitize.h /usr/src/debug/libcap-ng/0.9.2/utils/proc-llist.c /usr/src/debug/libcap-ng/0.9.2/utils/proc-llist.h /usr/src/debug/libcap-ng/0.9.2/utils/proc-sanitize.c /usr/src/debug/libcap-ng/0.9.2/utils/pscap.c"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-src: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-src: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-staticdev: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-staticdev: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng: PKGSIZE changed from 44962 to 42269 (-6%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng: FILELIST: added "/etc/bash_completion.d/libcap-ng.bash_completion"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng: PV changed from "0.9.1" to "0.9.2"
Changes to packages/x86_64-linux/libcap-ng-native (sysroot):
  /etc was added
  /etc/bash_completion.d was added
  /etc/bash_completion.d/libcap-ng.bash_completion was added

--===============6440980131596487041==--

