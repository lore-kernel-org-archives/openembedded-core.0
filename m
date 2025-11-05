Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A79CD37BC
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:47 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2367.1762384582598409796
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=zx9ZolNY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NOgC7JOU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019a564eec89-143ab5a4-9cac-4246-a0c9-7042becf214c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384604;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Twx+AxsbTbAeajY65Ww9Gqy+9+UXgXoyLqU+4bdoK5Q=;
	b=zx9ZolNYF4Iapl2FSHm9hNafbzQZJcjn0g806odO/td4ay9f7VlvwWwDbS2IJhen
	u/wh5Do1CFNRINT5xT/ynwWhwL6TWBQ4JSK+PIZTLxuQ6+o5F+W0IU2MUN3fjTmX06g
	lcHWvs1eyVXmlkNxsamXBS9tkrxfqMPUk8bWA/N4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384604;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Twx+AxsbTbAeajY65Ww9Gqy+9+UXgXoyLqU+4bdoK5Q=;
	b=NOgC7JOUKJ3yh70VLQiuVH2HDeKHtouAzGZJgIMHJ6K0gyHvkBfgw94vByulK8AM
	61AE6r0WI/LJ9wsGyhnsjUyiI3QMBwCvLNBJP1WYQvootjjq4F3AoA6ya4WhxOtWcWm
	prpjOXDA3IM1jUT25EIc0PgIvjZZFambOs5QwSpo=
Content-Type: multipart/mixed; boundary="===============8272824291354756548=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] at-spi2-core: upgrading to 2.58.1 FAILED
Message-ID: <0101019a564eec89-143ab5a4-9cac-4246-a0c9-7042becf214c-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225911

--===============8272824291354756548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *at-spi2-core* to *2.58.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-at-spi2-core-upgrade-2.56.4-2.58.1.patch
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
From d11abf2f25e79f50fe9612503667ca1d5962a28e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 22:08:00 +0000
Subject: [PATCH] at-spi2-core: upgrade 2.56.4 -> 2.58.1

---
 .../atk/{at-spi2-core_2.56.4.bb => at-spi2-core_2.58.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.56.4.bb => at-spi2-core_2.58.1.bb} (95%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.56.4.bb b/meta/recipes-support/atk/at-spi2-core_2.58.1.bb
similarity index 95%
rename from meta/recipes-support/atk/at-spi2-core_2.56.4.bb
rename to meta/recipes-support/atk/at-spi2-core_2.58.1.bb
index 90df892461..2d14c54606 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.56.4.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.58.1.bb
@@ -13,7 +13,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "dbe35b951499e1d6f1fb552c2e0a09cea7cba2adf6c2eba0b2c85b6c094a3a02"
+SRC_URI[sha256sum] = "7f374a6a38cd70ff4b32c9d3a0310bfa804d946fed4c9e69a7d49facdcb95e9c"
 
 DEPENDS = " \
 	dbus \
-- 
2.47.1


--===============8272824291354756548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1947 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (947 cached, 1 parsed). 1945 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-7a9635f5b6f4c5178979807744f6de50b197de00"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:7a9635f5b6f4c5178979807744f6de50b197de00"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 271 Local 261 Mirrors 0 Missed 10 Current 487 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 491 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 600 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 611 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 617 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 630 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1321 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_write_config)
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.58.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 645 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.58.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 646 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.58.1-r0: task do_write_config: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 657 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.58.1-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.58.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1515 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe at-spi2-core-2.58.1-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_fetch: Succeeded
NOTE: Running task 1976 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_unpack)
NOTE: Running task 2042 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.58.1-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_unpack: Succeeded
NOTE: Running task 2097 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_patch)
NOTE: Running task 2098 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.58.1-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.58.1-r0: task do_patch: Succeeded
NOTE: Running task 2101 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_configure)
NOTE: recipe at-spi2-core-2.58.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.58.1-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_configure: Succeeded
NOTE: Running task 2102 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_compile)
NOTE: recipe at-spi2-core-2.58.1-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_compile: Succeeded
NOTE: Running task 2103 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_install)
NOTE: recipe at-spi2-core-2.58.1-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_install: Succeeded
NOTE: Running task 2104 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_package)
NOTE: Running task 2105 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.58.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.58.1-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 2105 tasks of which 2094 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105220735.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105220735.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/at-spi2-core/2.58.1/temp/log.do_package.4099856
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: at-spi2-core-2.58.1-r0 do_package: QA Issue: at-spi2-core: Files/directories were installed but not shipped in any package:
  /usr/lib/python3.13
  /usr/lib/python3.13/site-packages
  /usr/lib/python3.13/site-packages/gi
  /usr/lib/python3.13/site-packages/gi/overrides
  /usr/lib/python3.13/site-packages/gi/overrides/Atspi.py
  /usr/lib/python3.13/site-packages/gi/overrides/__pycache__
  /usr/lib/python3.13/site-packages/gi/overrides/__pycache__/Atspi.cpython-313.pyc
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
at-spi2-core: 7 installed and not shipped files. [installed-vs-shipped]
ERROR: at-spi2-core-2.58.1-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/at-spi2-core/2.58.1/temp/log.do_package.4099856
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_package) failed with exit code '1'

--===============8272824291354756548==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-at-spi2-core-upgrade-2.56.4-2.58.1.patch"

RnJvbSBkMTFhYmYyZjI1ZTc5ZjUwZmU5NjEyNTAzNjY3Y2ExZDU5NjJhMjhlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMjowODowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGF0
LXNwaTItY29yZTogdXBncmFkZSAyLjU2LjQgLT4gMi41OC4xCgotLS0KIC4uLi9hdGsve2F0LXNw
aTItY29yZV8yLjU2LjQuYmIgPT4gYXQtc3BpMi1jb3JlXzIuNTguMS5iYn0gICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2F0ay97YXQtc3BpMi1jb3JlXzIuNTYuNC5iYiA9PiBhdC1zcGky
LWNvcmVfMi41OC4xLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2F0ay9hdC1zcGkyLWNvcmVfMi41Ni40LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXRrL2F0
LXNwaTItY29yZV8yLjU4LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLXN1cHBvcnQvYXRrL2F0LXNwaTItY29yZV8yLjU2LjQuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9hdC1zcGkyLWNvcmVfMi41OC4xLmJiCmluZGV4IDkwZGY4
OTI0NjEuLjJkMTRjNTQ2MDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9h
dC1zcGkyLWNvcmVfMi41Ni40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9hdC1z
cGkyLWNvcmVfMi41OC4xLmJiCkBAIC0xMyw3ICsxMyw3IEBAIE1BSl9WRVIgPSAiJHtAb2UudXRp
bHMudHJpbV92ZXJzaW9uKCIke1BWfSIsIDIpfSIKIAogU1JDX1VSSSA9ICIke0dOT01FX01JUlJP
Un0vJHtCUE59LyR7TUFKX1ZFUn0vJHtCUE59LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImRiZTM1Yjk1MTQ5OWUxZDZmMWZiNTUyYzJlMGEwOWNlYTdjYmEyYWRmNmMyZWJh
MGIyYzg1YjZjMDk0YTNhMDIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2YzNzRhNmEzOGNkNzBm
ZjRiMzJjOWQzYTAzMTBiZmE4MDRkOTQ2ZmVkNGM5ZTY5YTdkNDlmYWNkY2I5NWU5YyIKIAogREVQ
RU5EUyA9ICIgXAogCWRidXMgXAotLSAKMi40Ny4xCgo=

--===============8272824291354756548==--

