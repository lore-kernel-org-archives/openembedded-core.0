Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FD2CCF9EC
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:36 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.18072.1759325536079836896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KCjaPTsq;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=lsl7w1sT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101999ff988ba-04f79185-9897-4ccb-af5b-d5ca0bb80026-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=92vKtOz6IxjYa7xFUzL7qTGMr7jvkHtBy+OdyxJw8lY=;
	b=KCjaPTsqtjw7pLgxWLDQWWBO4V24BjJWeInB2xDzEOaYLqgLCC+2ANNkrQQjqhwP
	aUyK20FICXEjyFNF72j6AqDci1Kxa6klsHoPObyYKNx7vyOO6ExrrP+GQb0pncVgPtd
	qTOms3DVcN+Krzca7zBbK46xoyLY6Xf/RFwKE+wU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=92vKtOz6IxjYa7xFUzL7qTGMr7jvkHtBy+OdyxJw8lY=;
	b=lsl7w1sTpsW9FunaE7c6Vpuz70/NMcTvU8Zp3ZKNnsHUINCkLucj/RWfh08QpMPd
	RClV1KUamQl5bW8dhWd6SMw+ZIleJSkr5uNAwrQT2KtNucBXWbjEORPaIRLKV6UKZ+S
	nHntg9+l9AI1Ee8orqokg8/PReODWBmhj2PiZevE=
Content-Type: multipart/mixed; boundary="===============3525213365347793371=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] at-spi2-core: upgrading to 2.58.0 FAILED
Message-ID: <010101999ff988ba-04f79185-9897-4ccb-af5b-d5ca0bb80026-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224294

--===============3525213365347793371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *at-spi2-core* to *2.58.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-at-spi2-core-upgrade-2.56.4-2.58.0.patch
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
From 4fccf3c795e6be4bfe3d8b4f2cd4df022926ebd1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 13:04:24 +0000
Subject: [PATCH] at-spi2-core: upgrade 2.56.4 -> 2.58.0

---
 .../atk/{at-spi2-core_2.56.4.bb => at-spi2-core_2.58.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.56.4.bb => at-spi2-core_2.58.0.bb} (95%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.56.4.bb b/meta/recipes-support/atk/at-spi2-core_2.58.0.bb
similarity index 95%
rename from meta/recipes-support/atk/at-spi2-core_2.56.4.bb
rename to meta/recipes-support/atk/at-spi2-core_2.58.0.bb
index 90df892461..3a37712fc3 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.56.4.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.58.0.bb
@@ -13,7 +13,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "dbe35b951499e1d6f1fb552c2e0a09cea7cba2adf6c2eba0b2c85b6c094a3a02"
+SRC_URI[sha256sum] = "dfdd3300da2783a21969ffade2889817fb7c1906a4ef92497eba65969b3dab5a"
 
 DEPENDS = " \
 	dbus \
-- 
2.47.1


--===============3525213365347793371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1941 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1939 targets, 43 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-3cf4a5d3e3cba105e53927a58248afc6a8e89ed3"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3cf4a5d3e3cba105e53927a58248afc6a8e89ed3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 270 Local 260 Mirrors 0 Missed 10 Current 488 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 552 of 758 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 646 of 758 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 648 of 758 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 663 of 758 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1384 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_write_config)
NOTE: recipe at-spi2-core-2.58.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.58.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 679 of 758 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 680 of 758 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.58.0-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.58.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 726 of 758 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: Running task 1566 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_fetch)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_fetch: Succeeded
NOTE: Running task 1567 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_unpack)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe at-spi2-core-2.58.0-r0: task do_unpack: Started
NOTE: Running task 2042 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.58.0-r0: task do_unpack: Succeeded
NOTE: Running task 2097 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_patch)
NOTE: Running task 2098 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.58.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.58.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.58.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2101 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.58.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_configure: Succeeded
NOTE: Running task 2102 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.58.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_compile: Succeeded
NOTE: Running task 2103 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_install)
NOTE: recipe at-spi2-core-2.58.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_install: Succeeded
NOTE: Running task 2104 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_package)
NOTE: Running task 2105 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.58.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.58.0-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 2105 tasks of which 2094 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001130357.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001130357.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/at-spi2-core/2.58.0/temp/log.do_package.230437
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: at-spi2-core-2.58.0-r0 do_package: QA Issue: at-spi2-core: Files/directories were installed but not shipped in any package:
  /usr/lib/python3.13
  /usr/lib/python3.13/site-packages
  /usr/lib/python3.13/site-packages/gi
  /usr/lib/python3.13/site-packages/gi/overrides
  /usr/lib/python3.13/site-packages/gi/overrides/Atspi.py
  /usr/lib/python3.13/site-packages/gi/overrides/__pycache__
  /usr/lib/python3.13/site-packages/gi/overrides/__pycache__/Atspi.cpython-313.pyc
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
at-spi2-core: 7 installed and not shipped files. [installed-vs-shipped]
ERROR: at-spi2-core-2.58.0-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/at-spi2-core/2.58.0/temp/log.do_package.230437
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_package) failed with exit code '1'

--===============3525213365347793371==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-at-spi2-core-upgrade-2.56.4-2.58.0.patch"

RnJvbSA0ZmNjZjNjNzk1ZTZiZTRiZmUzZDhiNGYyY2Q0ZGYwMjI5MjZlYmQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAxMzowNDoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGF0
LXNwaTItY29yZTogdXBncmFkZSAyLjU2LjQgLT4gMi41OC4wCgotLS0KIC4uLi9hdGsve2F0LXNw
aTItY29yZV8yLjU2LjQuYmIgPT4gYXQtc3BpMi1jb3JlXzIuNTguMC5iYn0gICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2F0ay97YXQtc3BpMi1jb3JlXzIuNTYuNC5iYiA9PiBhdC1zcGky
LWNvcmVfMi41OC4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2F0ay9hdC1zcGkyLWNvcmVfMi41Ni40LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXRrL2F0
LXNwaTItY29yZV8yLjU4LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLXN1cHBvcnQvYXRrL2F0LXNwaTItY29yZV8yLjU2LjQuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9hdC1zcGkyLWNvcmVfMi41OC4wLmJiCmluZGV4IDkwZGY4
OTI0NjEuLjNhMzc3MTJmYzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9h
dC1zcGkyLWNvcmVfMi41Ni40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9hdC1z
cGkyLWNvcmVfMi41OC4wLmJiCkBAIC0xMyw3ICsxMyw3IEBAIE1BSl9WRVIgPSAiJHtAb2UudXRp
bHMudHJpbV92ZXJzaW9uKCIke1BWfSIsIDIpfSIKIAogU1JDX1VSSSA9ICIke0dOT01FX01JUlJP
Un0vJHtCUE59LyR7TUFKX1ZFUn0vJHtCUE59LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImRiZTM1Yjk1MTQ5OWUxZDZmMWZiNTUyYzJlMGEwOWNlYTdjYmEyYWRmNmMyZWJh
MGIyYzg1YjZjMDk0YTNhMDIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGZkZDMzMDBkYTI3ODNh
MjE5NjlmZmFkZTI4ODk4MTdmYjdjMTkwNmE0ZWY5MjQ5N2ViYTY1OTY5YjNkYWI1YSIKIAogREVQ
RU5EUyA9ICIgXAogCWRidXMgXAotLSAKMi40Ny4xCgo=

--===============3525213365347793371==--

