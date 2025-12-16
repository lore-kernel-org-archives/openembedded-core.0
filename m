Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B2CD5E398
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:53 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17179.1765872132136240971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fHttoVaL;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=EdK6tatD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019b262ef531-b73467ad-4784-4688-bb05-568d3a1d96be-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JGKhxD+k7o7EuRcQ5WxxlNysOAP1HUdZG1X/UKArKJE=;
	b=fHttoVaL4ne/xFHPyPOD/l5D7ZwMB11W5v8l4jhutf5xlgLTuHZAHxp2V99qVB5J
	0pHe3sn3j+YC2HdnWnXuVnvlcM7uaL0chOSuszJ8LonImJ2vC+lQiO9/hiLhD4GKxYZ
	j6/HCdfsiYUwUfPBe3K7XT0mjmF/Znxh6GiDwe6Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JGKhxD+k7o7EuRcQ5WxxlNysOAP1HUdZG1X/UKArKJE=;
	b=EdK6tatD0rwkMcCDNKsgGye53/pi3hT6GFTMR5ruSSBh9JVTH4jVj+43rEKzW9Y2
	krw4+ntIWnEuyL/dgCz5t/swqdpH1iIPVVAOGAGb74ZeizWCTkPMRjeOoLGaHiY1Ze9
	/zikEeBzLRQgh9TRDYdv43FUHT9GXl3VxmpZd5Pk=
Content-Type: multipart/mixed; boundary="===============5474863038973384511=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] p11-kit: upgrading to 0.25.10 FAILED
Message-ID: <0101019b262ef531-b73467ad-4784-4688-bb05-568d3a1d96be-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227920

--===============5474863038973384511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *p11-kit* to *0.25.10* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-p11-kit-upgrade-0.25.5-0.25.10.patch
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
From 0fc007cccd267053052aa512568876f00fcf21a7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 07:47:47 +0000
Subject: [PATCH] p11-kit: upgrade 0.25.5 -> 0.25.10

---
 .../p11-kit/{p11-kit_0.25.5.bb => p11-kit_0.25.10.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.25.5.bb => p11-kit_0.25.10.bb} (97%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb
similarity index 97%
rename from meta/recipes-support/p11-kit/p11-kit_0.25.5.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.25.10.bb
index 1c982a2aab..8bfe9c08ad 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb
@@ -12,7 +12,7 @@ DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''
 
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https \
            "
-SRCREV = "0dd113361057e477f40ff4d8788f3e7e400af5f9"
+SRCREV = "90dba4ded391c6232a78ee14db0da76efda7b1c3"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
-- 
2.47.1


--===============5474863038973384511==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-p11-kit-upgrade-0.25.5-0.25.10.patch"

RnJvbSAwZmMwMDdjY2NkMjY3MDUzMDUyYWE1MTI1Njg4NzZmMDBmY2YyMWE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDc6NDc6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
MTEta2l0OiB1cGdyYWRlIDAuMjUuNSAtPiAwLjI1LjEwCgotLS0KIC4uLi9wMTEta2l0L3twMTEt
a2l0XzAuMjUuNS5iYiA9PiBwMTEta2l0XzAuMjUuMTAuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L3AxMS1raXQve3AxMS1raXRfMC4yNS41LmJiID0+IHAxMS1raXRfMC4y
NS4xMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9wMTEta2l0
L3AxMS1raXRfMC4yNS41LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDExLWtpdC9wMTEta2l0
XzAuMjUuMTAuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvcDExLWtpdC9wMTEta2l0XzAuMjUuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvcDExLWtpdC9wMTEta2l0XzAuMjUuMTAuYmIKaW5kZXggMWM5ODJhMmFhYi4uOGJm
ZTljMDhhZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDExLWtpdC9wMTEta2l0
XzAuMjUuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9wMTEta2l0L3AxMS1raXRfMC4y
NS4xMC5iYgpAQCAtMTIsNyArMTIsNyBAQCBERVBFTkRTOmFwcGVuZCA9ICIke0AnIGdsaWItMi4w
JyBpZiBkLmdldFZhcignR1RLRE9DX0VOQUJMRUQnKSA9PSAnVHJ1ZScgZWxzZSAnJwogCiBTUkNf
VVJJID0gImdpdHNtOi8vZ2l0aHViLmNvbS9wMTEtZ2x1ZS9wMTEta2l0O2JyYW5jaD1tYXN0ZXI7
cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiMGRkMTEzMzYxMDU3ZTQ3
N2Y0MGZmNGQ4Nzg4ZjNlN2U0MDBhZjVmOSIKK1NSQ1JFViA9ICI5MGRiYTRkZWQzOTFjNjIzMmE3
OGVlMTRkYjBkYTc2ZWZkYTdiMWMzIgogCiBQQUNLQUdFQ09ORklHID8/PSAiIgogUEFDS0FHRUNP
TkZJR1ttYW5wYWdlc10gPSAiLURtYW49dHJ1ZSwtRG1hbj1mYWxzZSxsaWJ4c2x0LW5hdGl2ZSIK
LS0gCjIuNDcuMQoK

--===============5474863038973384511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-0c9bab36af7a6c004dacbc954a952b682b40d369"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:0c9bab36af7a6c004dacbc954a952b682b40d369"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 87 Local 77 Mirrors 0 Missed 10 Current 320 (88% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 357 of 407 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_populate_lic_setscene)
NOTE: Running task 1109 of 1189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_write_config)
NOTE: recipe p11-kit-0.25.10-r0: task do_populate_lic_setscene: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_write_config: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_write_config: Succeeded
NOTE: recipe p11-kit-0.25.10-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 407 of 407 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_recipe_qa_setscene)
NOTE: recipe p11-kit-0.25.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1170 of 1189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_fetch)
NOTE: recipe p11-kit-0.25.10-r0: task do_fetch: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_fetch: Succeeded
NOTE: Running task 1171 of 1189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_unpack)
NOTE: Running task 1172 of 1189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe p11-kit-0.25.10-r0: task do_unpack: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe p11-kit-0.25.10-r0: task do_unpack: Succeeded
NOTE: Running task 1173 of 1189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_patch)
NOTE: Running task 1174 of 1189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_collect_spdx_deps)
NOTE: recipe p11-kit-0.25.10-r0: task do_patch: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_patch: Succeeded
NOTE: Running task 1175 of 1189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_deploy_source_date_epoch)
NOTE: recipe p11-kit-0.25.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe p11-kit-0.25.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_deploy_source_date_epoch unihash changed to c850d0d7844f6da3fe169426f709be67556aae3f7616a22dd71c0fbf84b42f14
NOTE: Setscene tasks completed
NOTE: Running task 1177 of 1189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_configure)
NOTE: recipe p11-kit-0.25.10-r0: task do_configure: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_configure: Succeeded
NOTE: Running task 1178 of 1189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_compile)
NOTE: recipe p11-kit-0.25.10-r0: task do_compile: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_compile: Succeeded
NOTE: Running task 1179 of 1189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_install)
NOTE: recipe p11-kit-0.25.10-r0: task do_install: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_install: Succeeded
NOTE: Running task 1180 of 1189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_package)
NOTE: Running task 1181 of 1189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.25.10-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_package: Started
NOTE: recipe p11-kit-0.25.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe p11-kit-0.25.10-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 1181 tasks of which 1169 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216074709.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216074709.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/p11-kit/0.25.10/temp/log.do_package.368765
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: p11-kit-0.25.10-r0 do_package: QA Issue: p11-kit: Files/directories were installed but not shipped in any package:
  /usr/share/zsh
  /usr/share/zsh/site-functions
  /usr/share/zsh/site-functions/_trust
  /usr/share/zsh/site-functions/_p11-kit
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
p11-kit: 4 installed and not shipped files. [installed-vs-shipped]
ERROR: p11-kit-0.25.10-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/p11-kit/0.25.10/temp/log.do_package.368765
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb:do_package) failed with exit code '1'

--===============5474863038973384511==--

