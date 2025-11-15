Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572E6CEBF83
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:41 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12119.1763224719787781609
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fNXDwAc4;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IZsrAtVt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019a886212f4-12d0d964-38b7-4d34-982d-0188b513f0e2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iKacL57mlQeFWDMFlgop/0GDBe4acFroyYFFYXVUwzo=;
	b=fNXDwAc498E46koFz+W24Fz4m9Nyz6DtSuBYhGPiNwQP8v8ZHFh3s1ofpF25vOma
	+UjVNvWhmHzB2LF/J23+AvHNhl+AvndCEQiuQTbu9RMr3KTk/JDo2xyOJhTaiWk+pYL
	HYxlkGbS7k5XMgbXfggVaLx2ixslO1j3ITWnHlBs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iKacL57mlQeFWDMFlgop/0GDBe4acFroyYFFYXVUwzo=;
	b=IZsrAtVtNL3VALGmX7GWQLdCmAL/A73/eVboeEsJgIK04peLmktnGwLIKXK9iyIM
	Mk4FO5qo0ygYIF0M8VuuuPKiBJSE6Kj14pJlpH+I8VcpDZyVNW4frQt2ycmxL1vPKjB
	pQKBlO51m3NrSuCwePc3DG15GFXDrPKci3j6xPx0=
Content-Type: multipart/mixed; boundary="===============2296229701025346669=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alex Stewart <alex.stewart@ni.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] opkg: upgrading to 0.9.0 FAILED
Message-ID: <0101019a886212f4-12d0d964-38b7-4d34-982d-0188b513f0e2-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226338

--===============2296229701025346669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *opkg* to *0.9.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-opkg-upgrade-0.8.0-0.9.0.patch
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
From 15a924fd3a4b6d73820ce6b1d2901e7e85713917 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 09:43:31 +0000
Subject: [PATCH] opkg: upgrade 0.8.0 -> 0.9.0

---
 ...opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch | 4 ++--
 meta/recipes-devtools/opkg/{opkg_0.8.0.bb => opkg_0.9.0.bb}   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/opkg/{opkg_0.8.0.bb => opkg_0.9.0.bb} (97%)

diff --git a/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch b/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
index 98daf746ec..96948a8451 100644
--- a/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
+++ b/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
@@ -1,4 +1,4 @@
-From 82b29dcfe3033d8285890bf46e58f464d9944196 Mon Sep 17 00:00:00 2001
+From 9fc5826707984ab91d27c5974f66f85b5f869c49 Mon Sep 17 00:00:00 2001
 From: Jonathan Liu <net147@gmail.com>
 Date: Mon, 21 Sep 2015 20:23:23 +1000
 Subject: [PATCH] opkg_conf: create opkg.lock in /run instead of /var/run
@@ -17,7 +17,7 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
-index 3fa6ca9..b12672e 100644
+index eec4e81..907521c 100644
 --- a/libopkg/opkg_conf.h
 +++ b/libopkg/opkg_conf.h
 @@ -42,7 +42,7 @@ extern "C" {
diff --git a/meta/recipes-devtools/opkg/opkg_0.8.0.bb b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
similarity index 97%
rename from meta/recipes-devtools/opkg/opkg_0.8.0.bb
rename to meta/recipes-devtools/opkg/opkg_0.9.0.bb
index 12e2edf7e3..27b5b8fbb3 100644
--- a/meta/recipes-devtools/opkg/opkg_0.8.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "582a4c9e220cce0b7d08a0915c95db9f24ae43ad372ed5d42d5ec5f6cd413f0c"
+SRC_URI[sha256sum] = "440ef321862e01f83da4d02884a0cbb4d9d7b32f82faa81a6a85493f0c89d0f5"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
-- 
2.47.1


--===============2296229701025346669==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-opkg-upgrade-0.8.0-0.9.0.patch"

RnJvbSAxNWE5MjRmZDNhNGI2ZDczODIwY2U2YjFkMjkwMWU3ZTg1NzEzOTE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDk6NDM6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
cGtnOiB1cGdyYWRlIDAuOC4wIC0+IDAuOS4wCgotLS0KIC4uLm9wa2dfY29uZi1jcmVhdGUtb3Br
Zy5sb2NrLWluLXJ1bi1pbnN0ZWFkLW9mLXZhci1ydW4ucGF0Y2ggfCA0ICsrLS0KIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9vcGtnL3tvcGtnXzAuOC4wLmJiID0+IG9wa2dfMC45LjAuYmJ9ICAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3BrZy97b3BrZ18wLjguMC5iYiA9PiBvcGtnXzAu
OS4wLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9vcGtnL29w
a2cvMDAwMS1vcGtnX2NvbmYtY3JlYXRlLW9wa2cubG9jay1pbi1ydW4taW5zdGVhZC1vZi12YXIt
cnVuLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29wa2cvb3BrZy8wMDAxLW9wa2dfY29u
Zi1jcmVhdGUtb3BrZy5sb2NrLWluLXJ1bi1pbnN0ZWFkLW9mLXZhci1ydW4ucGF0Y2gKaW5kZXgg
OThkYWY3NDZlYy4uOTY5NDhhODQ1MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L29wa2cvb3BrZy8wMDAxLW9wa2dfY29uZi1jcmVhdGUtb3BrZy5sb2NrLWluLXJ1bi1pbnN0ZWFk
LW9mLXZhci1ydW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29wa2cvb3BrZy8w
MDAxLW9wa2dfY29uZi1jcmVhdGUtb3BrZy5sb2NrLWluLXJ1bi1pbnN0ZWFkLW9mLXZhci1ydW4u
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDgyYjI5ZGNmZTMwMzNkODI4NTg5MGJmNDZlNThm
NDY0ZDk5NDQxOTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDlmYzU4MjY3MDc5ODRh
YjkxZDI3YzU5NzRmNjZmODViNWY4NjljNDkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBKb25hdGhhbiBMaXUgPG5ldDE0N0BnbWFpbC5jb20+CiBEYXRlOiBNb24sIDIxIFNlcCAyMDE1
IDIwOjIzOjIzICsxMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIG9wa2dfY29uZjogY3JlYXRlIG9wa2cu
bG9jayBpbiAvcnVuIGluc3RlYWQgb2YgL3Zhci9ydW4KQEAgLTE3LDcgKzE3LDcgQEAgU2lnbmVk
LW9mZi1ieTogSm9uYXRoYW4gTGl1IDxuZXQxNDdAZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbGlib3BrZy9v
cGtnX2NvbmYuaCBiL2xpYm9wa2cvb3BrZ19jb25mLmgKLWluZGV4IDNmYTZjYTkuLmIxMjY3MmUg
MTAwNjQ0CitpbmRleCBlZWM0ZTgxLi45MDc1MjFjIDEwMDY0NAogLS0tIGEvbGlib3BrZy9vcGtn
X2NvbmYuaAogKysrIGIvbGlib3BrZy9vcGtnX2NvbmYuaAogQEAgLTQyLDcgKzQyLDcgQEAgZXh0
ZXJuICJDIiB7CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3BrZy9vcGtnXzAu
OC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29wa2cvb3BrZ18wLjkuMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3BrZy9vcGtn
XzAuOC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3BrZy9vcGtnXzAuOS4w
LmJiCmluZGV4IDEyZTJlZGY3ZTMuLjI3YjViOGZiYjMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9vcGtnL29wa2dfMC44LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L29wa2cvb3BrZ18wLjkuMC5iYgpAQCAtMTgsNyArMTgsNyBAQCBTUkNfVVJJID0gImh0dHA6Ly9k
b3dubG9hZHMueW9jdG9wcm9qZWN0Lm9yZy9yZWxlYXNlcy8ke0JQTn0vJHtCUE59LSR7UFZ9LnRh
ci5negogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNTgyYTRjOWUyMjBjY2UwYjdkMDhhMDkxNWM5NWRiOWYyNGFlNDNh
ZDM3MmVkNWQ0MmQ1ZWM1ZjZjZDQxM2YwYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0NDBlZjMy
MTg2MmUwMWY4M2RhNGQwMjg4NGEwY2JiNGQ5ZDdiMzJmODJmYWE4MWE2YTg1NDkzZjBjODlkMGY1
IgogCiAjIFRoaXMgbmVlZHMgdG8gYmUgYmVmb3JlIHB0ZXN0IGluaGVyaXQsIG90aGVyd2lzZSBh
bGwgcHRlc3QgZmlsZXMgZW5kIHBhY2thZ2VkCiAjIGluIGxpYm9wa2cgcGFja2FnZSBpZiBPUEtH
TElCRElSID09IGxpYmRpciwgYmVjYXVzZSBkZWZhdWx0Ci0tIAoyLjQ3LjEKCg==

--===============2296229701025346669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1946 entries from dependency cache.
Parsing recipes...done.
Parsing of 947 .bb files complete (946 cached, 1 parsed). 1944 targets, 47 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-45a4baa5de6e7ffad7edb574e93aadc30b1ee6a6"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:45a4baa5de6e7ffad7edb574e93aadc30b1ee6a6"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 309 Local 296 Mirrors 0 Missed 13 Current 461 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 716 of 770 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg/opkg_0.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-1_0.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-1_0.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1500 of 2103 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg/opkg_0.9.0.bb:do_fetch)
NOTE: recipe opkg-1_0.9.0-r0: task do_fetch: Started
NOTE: recipe opkg-1_0.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 2082 of 2103 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg/opkg_0.9.0.bb:do_unpack)
NOTE: Running task 2083 of 2103 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg/opkg_0.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-1_0.9.0-r0: task do_unpack: Started
NOTE: recipe opkg-1_0.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-1_0.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 2084 of 2103 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg/opkg_0.9.0.bb:do_patch)
NOTE: Running task 2085 of 2103 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg/opkg_0.9.0.bb:do_collect_spdx_deps)
NOTE: recipe opkg-1_0.9.0-r0: task do_patch: Started
NOTE: recipe opkg-1_0.9.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe opkg-1_0.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe opkg-1_0.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-1_0.9.0-r0: task do_patch: Succeeded
NOTE: Running task 2086 of 2103 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg/opkg_0.9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2087 of 2103 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg/opkg_0.9.0.bb:do_populate_lic)
NOTE: recipe opkg-1_0.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-1_0.9.0-r0: task do_populate_lic: Started
NOTE: recipe opkg-1_0.9.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg/opkg_0.9.0.bb:do_populate_lic unihash changed to 177c68e2243105542ca96dc8d4bd17498673444476875df89e83da29ea250215
NOTE: recipe opkg-1_0.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg/opkg_0.9.0.bb:do_deploy_source_date_epoch unihash changed to bb74ce2b4f1f519fff5944841722acb53288e7e278a5c17797582b2f398cb1c4
NOTE: Setscene tasks completed
NOTE: Running task 2088 of 2103 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg/opkg_0.9.0.bb:do_configure)
NOTE: recipe opkg-1_0.9.0-r0: task do_configure: Started
NOTE: recipe opkg-1_0.9.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2088 tasks of which 2080 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115094317.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115094317.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg/opkg_0.9.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/opkg/0.9.0/temp/log.do_configure.2042700
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: opkg-1_0.9.0-r0 do_configure: no configure script found at ../sources/opkg-0.9.0/configure
ERROR: opkg-1_0.9.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/opkg/0.9.0/temp/run.do_configure.2042700' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/opkg/0.9.0/temp/log.do_configure.2042700
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg/opkg_0.9.0.bb:do_configure) failed with exit code '1'

--===============2296229701025346669==--

