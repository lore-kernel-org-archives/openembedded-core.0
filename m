Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99E0C0219B
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:12 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.42624.1738416047960102175
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:21:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Fhjxq62I;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=rhDynXAA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010194c1ac00ae-f4e7c045-13c6-4971-857a-98deb9451dd9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=g/dITmy84DBJK4tlRqMGcve5/y54fSpJtpT/pJaw2yI=;
	b=Fhjxq62IEwq3jeWCrzHK9g4jL5rsG8TZ08nx2Nn0D1X1wuzga/E39pmlcq6XgNdK
	aRc2pRAt245HOM++UEnWwtI1qPmPFPtgLFdTSx9PrcLkvHPqwGsQ76JZjSL6d4AQM2E
	rUfWEfKZ6nia33Il0AgP3f/Z/C+3Uer+eOWwO3j8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=g/dITmy84DBJK4tlRqMGcve5/y54fSpJtpT/pJaw2yI=;
	b=rhDynXAAGhhCb1W0fLAbWwAHZVQsuORtUqwhDEc1fa2PkKpERmFlNt+wNcizYNsO
	9dtr6HZFP2ab+yqnDhW+XYB5+8hnuQ1JjGgmwkIYAhBXxHVnCWcxsF02sF1M8kazu2E
	yW+bufyACAvQvFKMDubK15LxQ+ImFb6NV9DtUT9A=
Content-Type: multipart/mixed; boundary="===============7237726154680942902=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libsecret: upgrading to 0.21.6 FAILED
Message-ID: <01010194c1ac00ae-f4e7c045-13c6-4971-857a-98deb9451dd9-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:21:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210571

--===============7237726154680942902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsecret* to *0.21.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libsecret-upgrade-0.21.4-0.21.6.patch
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
From 777a1380f995bd9e148ca6df753c29f633833465 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 11:12:07 +0000
Subject: [PATCH] libsecret: upgrade 0.21.4 -> 0.21.6

---
 .../0001-meson-add-option-to-disable-pam-tests.patch       | 7 ++-----
 .../libsecret/{libsecret_0.21.4.bb => libsecret_0.21.6.bb} | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.21.4.bb => libsecret_0.21.6.bb} (92%)

diff --git a/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-disable-pam-tests.patch b/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-disable-pam-tests.patch
index 1bd49bbc38..da5ed1fd32 100644
--- a/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-disable-pam-tests.patch
+++ b/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-disable-pam-tests.patch
@@ -1,4 +1,4 @@
-From b90ecbdb4b91961a77a7cbb3a9b6a57128e2194b Mon Sep 17 00:00:00 2001
+From a9fd7dcddf8bc64646f2945ab564357c23111541 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Tue, 3 Dec 2024 15:58:17 +0100
 Subject: [PATCH] meson: add option to disable pam tests
@@ -12,7 +12,7 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  2 files changed, 24 insertions(+), 21 deletions(-)
 
 diff --git a/meson_options.txt b/meson_options.txt
-index 936eff8..8fa2a4e 100644
+index 936eff8..2ae14f2 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -8,3 +8,4 @@ option('bashcompdir', type: 'string', value: '', description: 'Override default
@@ -75,6 +75,3 @@ index 8413b58..5155329 100644
 +    },
 +  )
 +endif
--- 
-2.47.0
-
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb b/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb
similarity index 92%
rename from meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.21.6.bb
index d356681252..f986e3ad71 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb
@@ -14,7 +14,7 @@ inherit gnomebase gi-docgen vala gobject-introspection manpages
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
 SRC_URI += "file://0001-meson-add-option-to-disable-pam-tests.patch"
-SRC_URI[archive.sha256sum] = "163d08d783be6d4ab9a979ceb5a4fecbc1d9660d3c34168c581301cd53912b20"
+SRC_URI[archive.sha256sum] = "747b8c175be108c880d3adfb9c3537ea66e520e4ad2dccf5dce58003aeeca090"
 
 EXTRA_OEMESON += "-Dpam-tests=false"
 
-- 
2.44.1


--===============7237726154680942902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (918 cached, 1 parsed). 1874 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:cb67f8d83dd347b7451d52f8569d5cd932081cd9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 188 Local 176 Mirrors 0 Missed 12 Current 359 (93% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 449 of 547 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 474 of 547 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_create_spdx_setscene)
NOTE: Running task 1122 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_recipe_qa)
NOTE: Running task 1132 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_write_config)
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsecret-0.21.6-r0: task do_recipe_qa: Started
NOTE: recipe libsecret-0.21.6-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 515 of 547 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libsecret-0.21.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1265 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsecret-0.21.6-r0: task do_fetch: Started
NOTE: recipe libsecret-0.21.6-r0: task do_fetch: Succeeded
NOTE: Running task 1266 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1528 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsecret-0.21.6-r0: task do_unpack: Started
NOTE: recipe libsecret-0.21.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.6-r0: task do_unpack: Succeeded
NOTE: Running task 1553 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_patch)
NOTE: Running task 1554 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_collect_spdx_deps)
NOTE: recipe libsecret-0.21.6-r0: task do_patch: Started
NOTE: recipe libsecret-0.21.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsecret-0.21.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_patch: Succeeded
NOTE: Running task 1555 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1556 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_populate_lic)
NOTE: recipe libsecret-0.21.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsecret-0.21.6-r0: task do_populate_lic: Started
NOTE: recipe libsecret-0.21.6-r0: task do_populate_lic: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1557 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_configure)
NOTE: recipe libsecret-0.21.6-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.6-r0: task do_configure: Succeeded
NOTE: Running task 1558 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_compile)
NOTE: recipe libsecret-0.21.6-r0: task do_compile: Started
NOTE: recipe libsecret-0.21.6-r0: task do_compile: Succeeded
NOTE: Running task 1559 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_install)
NOTE: recipe libsecret-0.21.6-r0: task do_install: Started
NOTE: recipe libsecret-0.21.6-r0: task do_install: Succeeded
NOTE: Running task 1560 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_package)
NOTE: Running task 1561 of 1569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_populate_sysroot)
NOTE: recipe libsecret-0.21.6-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.21.6-r0: task do_package: Started
NOTE: recipe libsecret-0.21.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 1561 tasks of which 1547 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250201111142.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250201111142.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libsecret/0.21.6/temp/log.do_package.3494383
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libsecret-0.21.6-r0 do_package: QA Issue: libsecret: Files/directories were installed but not shipped in any package:
  /usr/share/bash-completion
  /usr/share/bash-completion/completions
  /usr/share/bash-completion/completions/secret-tool
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libsecret: 3 installed and not shipped files. [installed-vs-shipped]
ERROR: libsecret-0.21.6-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libsecret/0.21.6/temp/log.do_package.3494383
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_package) failed with exit code '1'

--===============7237726154680942902==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsecret-upgrade-0.21.4-0.21.6.patch"

RnJvbSA3NzdhMTM4MGY5OTViZDllMTQ4Y2E2ZGY3NTNjMjlmNjMzODMzNDY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAxMToxMjowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNlY3JldDogdXBncmFkZSAwLjIxLjQgLT4gMC4yMS42CgotLS0KIC4uLi8wMDAxLW1lc29uLWFk
ZC1vcHRpb24tdG8tZGlzYWJsZS1wYW0tdGVzdHMucGF0Y2ggICAgICAgfCA3ICsrLS0tLS0KIC4u
Li9saWJzZWNyZXQve2xpYnNlY3JldF8wLjIxLjQuYmIgPT4gbGlic2VjcmV0XzAuMjEuNi5iYn0g
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvbGlic2VjcmV0L3tsaWJzZWNyZXRfMC4yMS40LmJi
ID0+IGxpYnNlY3JldF8wLjIxLjYuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWdub21lL2xpYnNlY3JldC9saWJzZWNyZXQvMDAwMS1tZXNvbi1hZGQtb3B0aW9uLXRvLWRpc2Fi
bGUtcGFtLXRlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnNlY3JldC9saWJzZWNy
ZXQvMDAwMS1tZXNvbi1hZGQtb3B0aW9uLXRvLWRpc2FibGUtcGFtLXRlc3RzLnBhdGNoCmluZGV4
IDFiZDQ5YmJjMzguLmRhNWVkMWZkMzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9s
aWJzZWNyZXQvbGlic2VjcmV0LzAwMDEtbWVzb24tYWRkLW9wdGlvbi10by1kaXNhYmxlLXBhbS10
ZXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlic2VjcmV0L2xpYnNlY3JldC8w
MDAxLW1lc29uLWFkZC1vcHRpb24tdG8tZGlzYWJsZS1wYW0tdGVzdHMucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGI5MGVjYmRiNGI5MTk2MWE3N2E3Y2JiM2E5YjZhNTcxMjhlMjE5NGIgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGE5ZmQ3ZGNkZGY4YmM2NDY0NmYyOTQ1YWI1NjQz
NTdjMjMxMTE1NDEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNYXJrdXMgVm9sayA8
Zl9sX2tAdC1vbmxpbmUuZGU+CiBEYXRlOiBUdWUsIDMgRGVjIDIwMjQgMTU6NTg6MTcgKzAxMDAK
IFN1YmplY3Q6IFtQQVRDSF0gbWVzb246IGFkZCBvcHRpb24gdG8gZGlzYWJsZSBwYW0gdGVzdHMK
QEAgLTEyLDcgKzEyLDcgQEAgU2lnbmVkLW9mZi1ieTogTWFya3VzIFZvbGsgPGZfbF9rQHQtb25s
aW5lLmRlPgogIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbl9vcHRpb25zLnR4dCBiL21lc29uX29wdGlvbnMudHh0
Ci1pbmRleCA5MzZlZmY4Li44ZmEyYTRlIDEwMDY0NAoraW5kZXggOTM2ZWZmOC4uMmFlMTRmMiAx
MDA2NDQKIC0tLSBhL21lc29uX29wdGlvbnMudHh0CiArKysgYi9tZXNvbl9vcHRpb25zLnR4dAog
QEAgLTgsMyArOCw0IEBAIG9wdGlvbignYmFzaGNvbXBkaXInLCB0eXBlOiAnc3RyaW5nJywgdmFs
dWU6ICcnLCBkZXNjcmlwdGlvbjogJ092ZXJyaWRlIGRlZmF1bHQKQEAgLTc1LDYgKzc1LDMgQEAg
aW5kZXggODQxM2I1OC4uNTE1NTMyOSAxMDA2NDQKICsgICAgfSwKICsgICkKICtlbmRpZgotLS0g
Ci0yLjQ3LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnNlY3JldC9saWJz
ZWNyZXRfMC4yMS40LmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnNlY3JldC9saWJzZWNyZXRf
MC4yMS42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1n
bm9tZS9saWJzZWNyZXQvbGlic2VjcmV0XzAuMjEuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWdub21lL2xpYnNlY3JldC9saWJzZWNyZXRfMC4yMS42LmJiCmluZGV4IGQzNTY2ODEyNTIuLmY5
ODZlM2FkNzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJzZWNyZXQvbGlic2Vj
cmV0XzAuMjEuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlic2VjcmV0L2xpYnNlY3Jl
dF8wLjIxLjYuYmIKQEAgLTE0LDcgKzE0LDcgQEAgaW5oZXJpdCBnbm9tZWJhc2UgZ2ktZG9jZ2Vu
IHZhbGEgZ29iamVjdC1pbnRyb3NwZWN0aW9uIG1hbnBhZ2VzCiBERVBFTkRTICs9ICJnbGliLTIu
MCBsaWJnY3J5cHQgZ2V0dGV4dC1uYXRpdmUiCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLW1l
c29uLWFkZC1vcHRpb24tdG8tZGlzYWJsZS1wYW0tdGVzdHMucGF0Y2giCi1TUkNfVVJJW2FyY2hp
dmUuc2hhMjU2c3VtXSA9ICIxNjNkMDhkNzgzYmU2ZDRhYjlhOTc5Y2ViNWE0ZmVjYmMxZDk2NjBk
M2MzNDE2OGM1ODEzMDFjZDUzOTEyYjIwIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAi
NzQ3YjhjMTc1YmUxMDhjODgwZDNhZGZiOWMzNTM3ZWE2NmU1MjBlNGFkMmRjY2Y1ZGNlNTgwMDNh
ZWVjYTA5MCIKIAogRVhUUkFfT0VNRVNPTiArPSAiLURwYW0tdGVzdHM9ZmFsc2UiCiAKLS0gCjIu
NDQuMQoK

--===============7237726154680942902==--

