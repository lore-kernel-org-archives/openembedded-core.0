Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CFFC3DA70
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:00 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.2109.1719853076103025611
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=J3eVfvZX;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JHj7n1AT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101906f3b4be4-71619c18-f45d-43d7-b396-9112d7bbfdfa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=K/iXNnnXcO2nmY9mP0GsLoUM/+AZwhKgJd+UrW10jH0=;
	b=J3eVfvZXJXwKrFfrTeXa3hOQxBtQo0mCG/wXNtsGey5pMmnIduxvkEBeU9ET81f1
	2wrmKZcBUeEuGYVk86ODEFADpITjwIBGQnhCWBleTv1xGLMOCfpoG8VM8UCSGdwqM/x
	ZEo+p6PjRSa8/BD9jHqdMiuSBoXl4Uyhs1ukRBeM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=K/iXNnnXcO2nmY9mP0GsLoUM/+AZwhKgJd+UrW10jH0=;
	b=JHj7n1ATcVr3tJObqa03ICwt+gBES/Y30MLq7rJo3e8w9zVfNaryjLvtYrmkEomj
	/QGaXiN6UQMaZ3YIhHhtQ1n+l9qiC3H5TdTlGr/i2cyYmBDRltbrnZmSup+TF8c2bCv
	2y1VFbEyhlE32gK8xgFf5XNCofh9RZzOfQ+ivTg0=
Content-Type: multipart/mixed; boundary="===============5415038099844774802=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2024.5 SUCCEEDED
Message-ID: <010101906f3b4be4-71619c18-f45d-43d7-b396-9112d7bbfdfa-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201337

--===============5415038099844774802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2024.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2024.4-2024.5.patch
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
From d48d6c068229638b13db5ff16834e14e10876549 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 08:32:03 +0000
Subject: [PATCH] python3-dtschema: upgrade 2024.4 -> 2024.5

---
 .../{python3-dtschema_2024.4.bb => python3-dtschema_2024.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2024.4.bb => python3-dtschema_2024.5.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2024.4.bb b/meta/recipes-devtools/python/python3-dtschema_2024.5.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2024.4.bb
rename to meta/recipes-devtools/python/python3-dtschema_2024.5.bb
index 9583cd57b9..1eb24eca23 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2024.4.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2024.5.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "18dd1d34b4a5e451291e5444e9ceb4a6febc605871cdaef22673b6f80aa4a131"
+SRC_URI[sha256sum] = "ea259a9ba4d1e1eff44ac8d362950361e46750bdeaf30a437a7ed33159c35fd8"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.44.0


--===============5415038099844774802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2024.4.tar.gz;downloadfilename=dtschema-2024.4.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2024.5.tar.gz;downloadfilename=dtschema-2024.5.tar.gz"
packages/core2-64-poky-linux/python3-dtschema: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 359119 to 362571 (+1%)
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2024.4" to "2024.5"
Changes to packages/core2-64-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.12/site-packages/dtschema-2024.4.dist-info moved to /usr/lib/python3.12/site-packages/dtschema-2024.5.dist-info

--===============5415038099844774802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.12/site-packages/dtschema-2024.4.dist-info moved to /usr/lib/python3.12/site-packages/dtschema-2024.5.dist-info

--===============5415038099844774802==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2024.4-2024.5.patch"

RnJvbSBkNDhkNmMwNjgyMjk2MzhiMTNkYjVmZjE2ODM0ZTE0ZTEwODc2NTQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAwODozMjowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZHRzY2hlbWE6IHVwZ3JhZGUgMjAyNC40IC0+IDIwMjQuNQoKLS0tCiAuLi4ve3B5dGhv
bjMtZHRzY2hlbWFfMjAyNC40LmJiID0+IHB5dGhvbjMtZHRzY2hlbWFfMjAyNC41LmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWR0c2NoZW1hXzIwMjQuNC5i
YiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjQuNS5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyNC40LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjQuNS5iYgpzaW1p
bGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtZHRzY2hlbWFfMjAyNC40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyNC41LmJiCmluZGV4IDk1ODNjZDU3YjkuLjFl
YjI0ZWNhMjMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1kdHNjaGVtYV8yMDI0LjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWR0c2NoZW1hXzIwMjQuNS5iYgpAQCAtNyw3ICs3LDcgQEAgaW5oZXJpdCBweXBpIHB5
dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAogUFlQSV9QQUNLQUdFID0gImR0c2NoZW1hIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMThkZDFkMzRiNGE1ZTQ1MTI5MWU1NDQ0ZTljZWI0YTZm
ZWJjNjA1ODcxY2RhZWYyMjY3M2I2ZjgwYWE0YTEzMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJl
YTI1OWE5YmE0ZDFlMWVmZjQ0YWM4ZDM2Mjk1MDM2MWU0Njc1MGJkZWFmMzBhNDM3YTdlZDMzMTU5
YzM1ZmQ4IgogCiBERVBFTkRTICs9ICJweXRob24zLXNldHVwdG9vbHMtc2NtLW5hdGl2ZSIKIFJE
RVBFTkRTOiR7UE59ICs9ICJcCi0tIAoyLjQ0LjAKCg==

--===============5415038099844774802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1879 targets, 46 skipped, 0 masked, 0 errors.
Removing 38 recipes from the core2-64 sysroot...done.
Removing 94 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-ca2824161ea8a23479dc9c6d1d39732c1b4974b7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ca2824161ea8a23479dc9c6d1d39732c1b4974b7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 554 Local 540 Mirrors 0 Missed 14 Current 269 (97% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 275 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtc_1.7.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 276 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtc_1.7.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 277 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtc_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtc_1.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 287 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_populate_lic_setscene)
NOTE: Running setscene task 290 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 291 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 292 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 293 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 294 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 295 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 296 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 297 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 298 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 299 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 300 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-dtc-1.7.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-dtc-1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dtc-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dtc-1.7.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-ruamel-yaml-0.18.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-ruamel-yaml-0.18.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-ruamel-yaml-0.18.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-dtc-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 302 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_deb_setscene)
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 304 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-dtc-1.7.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 305 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-dtc-1.7.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-dtc-1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-ruamel-yaml-0.18.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 316 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtc_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-ruamel-yaml-0.18.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-ruamel-yaml-0.18.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-ruamel-yaml-0.18.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 411 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 412 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.35.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_packagedata_setscene)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 421 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata_setscene)
NOTE: recipe python3-dtc-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-idna-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-ruamel-yaml-0.18.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 422 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb:do_packagedata_setscene)
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-referencing-0.35.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dtc-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 426 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.19.2.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-ruamel-yaml-0.18.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 430 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-zipp-3.19.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 439 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-referencing-0.35.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-ruamel-yaml-0.18.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-zipp-3.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 471 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 472 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata_setscene)
NOTE: Running task 496 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_recipe_qa)
NOTE: recipe dtc-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 491 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_recipe_qa: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 513 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 514 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 529 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 533 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 592 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 537 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dtschema-2024.5-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 596 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_fetch: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 597 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_unpack)
NOTE: recipe gcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 553 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-dtschema-2024.5-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dtschema-2024.5-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 582 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: Running task 1191 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_patch)
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_patch: Started
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 612 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-dtschema-2024.5-r0: task do_patch: Succeeded
NOTE: Running setscene task 615 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 616 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 624 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 625 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 628 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 636 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 637 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1294 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1300 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: Running task 1373 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1464 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 687 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running setscene task 694 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1496 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 1517 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 733 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 738 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 739 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running task 1543 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/opkg-utils/0.6.3/temp/log.do_packagedata_setscene.1547272
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_package_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_package_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 771 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1589 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 781 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 784 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 789 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 793 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 796 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 805 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 813 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1629 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c8afda1b9ad17f0a32fe2282140fb9fbfb6a58c64c5c1f9fe1f3c72112aae711
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 818 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 821 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 823 of 823 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1854 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata)
NOTE: Running task 2035 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2289 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_collect_spdx_deps)
NOTE: recipe python3-dtschema-2024.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-dtschema-2024.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2313 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_configure)
NOTE: recipe python3-dtschema-2024.5-r0: task do_configure: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_configure: Succeeded
NOTE: Running task 2314 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_compile)
NOTE: recipe python3-dtschema-2024.5-r0: task do_compile: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_compile: Succeeded
NOTE: Running task 2315 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_install)
NOTE: recipe python3-dtschema-2024.5-r0: task do_install: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_install: Succeeded
NOTE: Running task 2316 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_package)
NOTE: Running task 2317 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_populate_sysroot)
NOTE: recipe python3-dtschema-2024.5-r0: task do_package: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-dtschema-2024.5-r0: task do_package: Succeeded
NOTE: Running task 2318 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_packagedata)
NOTE: recipe python3-dtschema-2024.5-r0: task do_packagedata: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_packagedata unihash changed to 851bd9b98b99a64eb482869cda094c4543d88f9434b39b4758fbca7ca5ccf905
NOTE: Setscene tasks completed
NOTE: Running task 2319 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_create_spdx)
NOTE: Running task 2320 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_package_write_ipk)
NOTE: Running task 2321 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_package_write_deb)
NOTE: Running task 2322 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_package_write_rpm)
NOTE: recipe python3-dtschema-2024.5-r0: task do_create_spdx: Started
NOTE: Running task 2323 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_package_qa)
NOTE: recipe python3-dtschema-2024.5-r0: task do_package_write_ipk: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_package_write_deb: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_package_qa: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2324 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_create_runtime_spdx)
NOTE: recipe python3-dtschema-2024.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-dtschema-2024.5-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_package_write_ipk unihash changed to 9bab8044121bb9a89e6513e32132b33215badad23e59012b76644afb227c28c1
NOTE: recipe python3-dtschema-2024.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-dtschema-2024.5-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_package_qa unihash changed to 9dd1652c4117b9d7856603a6ab72b13923f8c99730a7913fb2c20edb7e08c39c
NOTE: recipe python3-dtschema-2024.5-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_package_write_deb unihash changed to 535dd56149e725950fb238b8cc9b4b73a83c5687c82d51bc927c2f1ea30e5069
NOTE: recipe python3-dtschema-2024.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_package_write_rpm unihash changed to 6c7ce140876e35969d992c4aeab005ef54e4bc5f6aedbcc694fc37b4b06e37a6
NOTE: Running noexec task 2325 of 2325 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.5.bb:do_build)
NOTE: Tasks Summary: Attempted 2325 tasks of which 2295 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 7 ERROR messages, returning a non-zero exit code.
ERROR: opkg-utils-0.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-src went backwards which would break package feeds (from 0:0.7.0-r0 to 0:0.6.3-r0) [version-going-backwards]
ERROR: opkg-utils-0.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-dbg went backwards which would break package feeds (from 0:0.7.0-r0 to 0:0.6.3-r0) [version-going-backwards]
ERROR: opkg-utils-0.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package update-alternatives-opkg went backwards which would break package feeds (from 0:0.7.0-r0 to 0:0.6.3-r0) [version-going-backwards]
ERROR: opkg-utils-0.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-doc went backwards which would break package feeds (from 0:0.7.0-r0 to 0:0.6.3-r0) [version-going-backwards]
ERROR: opkg-utils-0.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-locale went backwards which would break package feeds (from 0:0.7.0-r0 to 0:0.6.3-r0) [version-going-backwards]
ERROR: opkg-utils-0.6.3-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils went backwards which would break package feeds (from 0:0.7.0-r0 to 0:0.6.3-r0) [version-going-backwards]
ERROR: opkg-utils-0.6.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5415038099844774802==--

