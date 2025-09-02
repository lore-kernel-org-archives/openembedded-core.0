Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6847CCAC597
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:43 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.89998.1756850186586502230
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LyfDYYxw;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Gm+fmdgV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101990c6e9443-71369298-6ff0-41a8-b883-7ea836577a82-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850197;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RzCpfmDuksNFGDCZuK9jDMmccRm5XwUlRWXvQmBRcQc=;
	b=LyfDYYxwHdLckA+2BtnURPFK7SjCwNmGdAZ17WFAPiOolDy4ocMYvoSQf7xuBGuo
	OBJtBLI8hkR0UU5oFrj2WnvUA4DPeZDEOpMbsLwL+fwWRrTgIHjE8OmIKWSBZKcEg6r
	pltc28DTKVxmvOFDRKSWZLqg3Xq4yvVfyg/JniDA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850197;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RzCpfmDuksNFGDCZuK9jDMmccRm5XwUlRWXvQmBRcQc=;
	b=Gm+fmdgVTGB5wBOAnrFAt9OIzCr8DmGywPON2ilzkzKdlVizzaprQLm1DzDWSKwr
	5c4lXK2voaGaHRjrl9DI8STWK61PSYjGUX0A5Okm6Bi5He5mt4nzIfhfc3YzvDDvK85
	02bVjhzOqJRnJZaH7rBZlVg3UORy9YUhGqmglExQ=
Content-Type: multipart/mixed; boundary="===============6168141899512297647=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.20.0 FAILED
Message-ID: <010101990c6e9443-71369298-6ff0-41a8-b883-7ea836577a82-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222804

--===============6168141899512297647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gtk4* to *4.20.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.18.6-4.20.0.patch
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
From b26d8cdc59d36ad310304a459825b963583a76b4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 19:48:54 +0000
Subject: [PATCH] gtk4: upgrade 4.18.6 -> 4.20.0

---
 meta/recipes-gnome/gtk+/{gtk4_4.18.6.bb => gtk4_4.20.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.18.6.bb => gtk4_4.20.0.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb b/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.20.0.bb
index 2d24468dcc..10e720ffac 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb
@@ -38,7 +38,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e1817c650ddc3261f9a8345b3b22a26a5d80af154630dedc03cc7becefffd0fa"
+SRC_URI[sha256sum] = "79e51e62f7f0cff32904569b0cebc96297d0ebfafa6de8172073c69ce0391a98"
 
 S = "${UNPACKDIR}/gtk-${PV}"
 
-- 
2.47.1


--===============6168141899512297647==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.18.6-4.20.0.patch"

RnJvbSBiMjZkOGNkYzU5ZDM2YWQzMTAzMDRhNDU5ODI1Yjk2MzU4M2E3NmI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxOTo0ODo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGd0
azQ6IHVwZ3JhZGUgNC4xOC42IC0+IDQuMjAuMAoKLS0tCiBtZXRhL3JlY2lwZXMtZ25vbWUvZ3Rr
Ky97Z3RrNF80LjE4LjYuYmIgPT4gZ3RrNF80LjIwLjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdu
b21lL2d0aysve2d0azRfNC4xOC42LmJiID0+IGd0azRfNC4yMC4wLmJifSAoOTglKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xOC42LmJiIGIvbWV0YS9yZWNp
cGVzLWdub21lL2d0aysvZ3RrNF80LjIwLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2d0aysvZ3RrNF80LjE4LjYuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMC4wLmJiCmluZGV4IDJkMjQ0NjhkY2MuLjEw
ZTcyMGZmYWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xOC42
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMC4wLmJiCkBAIC0zOCw3
ICszOCw3IEBAIE1BSl9WRVIgPSAiJHtAb2UudXRpbHMudHJpbV92ZXJzaW9uKCIke1BWfSIsIDIp
fSIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImd0ay0oP1A8cHZlcj5cZCtcLihcZCpbMDI0Njhd
KSsoXC5cZCspKylcLnRhci54eiIKIAogU1JDX1VSSSA9ICJodHRwOi8vZnRwLmdub21lLm9yZy9w
dWIvZ25vbWUvc291cmNlcy9ndGsvJHtNQUpfVkVSfS9ndGstJHtQVn0udGFyLnh6IgotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImUxODE3YzY1MGRkYzMyNjFmOWE4MzQ1YjNiMjJhMjZhNWQ4MGFmMTU0
NjMwZGVkYzAzY2M3YmVjZWZmZmQwZmEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzllNTFlNjJm
N2YwY2ZmMzI5MDQ1NjliMGNlYmM5NjI5N2QwZWJmYWZhNmRlODE3MjA3M2M2OWNlMDM5MWE5OCIK
IAogUyA9ICIke1VOUEFDS0RJUn0vZ3RrLSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============6168141899512297647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1941 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1940 targets, 45 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-badf8146d16e4e121eed3af3500217e8cd81987e"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:badf8146d16e4e121eed3af3500217e8cd81987e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 572 Local 559 Mirrors 0 Missed 13 Current 1041 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3725 of 4409 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb:do_recipe_qa)
NOTE: recipe gtk4-4.20.0-r0: task do_recipe_qa: Started
NOTE: Running task 4092 of 4409 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb:do_write_config)
NOTE: recipe gtk4-4.20.0-r0: task do_write_config: Started
NOTE: recipe gtk4-4.20.0-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.20.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 4390 of 4409 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb:do_fetch)
NOTE: recipe gtk4-4.20.0-r0: task do_fetch: Started
NOTE: recipe gtk4-4.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 4391 of 4409 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb:do_unpack)
NOTE: Running task 4392 of 4409 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.20.0-r0: task do_unpack: Started
NOTE: recipe gtk4-4.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 4393 of 4409 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb:do_patch)
NOTE: Running task 4394 of 4409 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.20.0-r0: task do_patch: Started
NOTE: recipe gtk4-4.20.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk4-4.20.0-r0: task do_patch: Succeeded
NOTE: Running task 4395 of 4409 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 4396 of 4409 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb:do_populate_lic)
NOTE: recipe gtk4-4.20.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.20.0-r0: task do_populate_lic: Started
NOTE: recipe gtk4-4.20.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gtk4-4.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 4397 of 4409 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb:do_configure)
NOTE: recipe gtk4-4.20.0-r0: task do_configure: Started
NOTE: recipe gtk4-4.20.0-r0: task do_configure: Succeeded
NOTE: Running task 4398 of 4409 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb:do_compile)
NOTE: recipe gtk4-4.20.0-r0: task do_compile: Started
NOTE: recipe gtk4-4.20.0-r0: task do_compile: Succeeded
NOTE: Running task 4399 of 4409 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb:do_install)
NOTE: recipe gtk4-4.20.0-r0: task do_install: Started
NOTE: recipe gtk4-4.20.0-r0: task do_install: Succeeded
NOTE: Running task 4400 of 4409 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb:do_package)
NOTE: Running task 4401 of 4409 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.20.0-r0: task do_package: Started
NOTE: recipe gtk4-4.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.20.0-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 4401 tasks of which 4387 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250902194745.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250902194745.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gtk4/4.20.0/temp/log.do_package.935350
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gtk4-4.20.0-r0 do_package: QA Issue: gtk4: Files/directories were installed but not shipped in any package:
  /usr/share/bash-completion
  /usr/share/bash-completion/completions
  /usr/share/bash-completion/completions/gtk4-image-tool
  /usr/share/bash-completion/completions/gtk4-path-tool
  /usr/share/bash-completion/completions/gtk4-builder-tool
  /usr/share/bash-completion/completions/gtk4-rendernode-tool
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
gtk4: 6 installed and not shipped files. [installed-vs-shipped]
ERROR: gtk4-4.20.0-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gtk4/4.20.0/temp/log.do_package.935350
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb:do_package) failed with exit code '1'

--===============6168141899512297647==--

