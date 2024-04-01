Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB902CD344C
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:33 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.44634.1711994600987953228
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hTFLkEmw;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=u6GUHwuM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018e9ad47b15-f36ebcf9-6e6e-4c22-af58-334f94b59926-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hbVLkVyBCv0g5pZ4wO3zxdPYs+mZlyZlAIWwrwxpg+w=;
	b=hTFLkEmwCsuHv3qL0HKxFvrY087KmK6M9WbO8iL63jS5FIeA2aZnY25qv83nrknN
	mn2VFkOQ0fVs1e1dIa1Q5EOv+kwISHOwxIysKYNMjm3T2GWBl4zH178iZYTudsQuXvO
	BP9wKQ/Y0FBGxbo7BjDmEbYmQzetjzmGMmDIxKeo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hbVLkVyBCv0g5pZ4wO3zxdPYs+mZlyZlAIWwrwxpg+w=;
	b=u6GUHwuMk0OlPr/ZaE5kcocbs9aQwdgmtayevpDf1mD5vIR0eh52VUEHnArxXB5Q
	O6K3q02+exdtGwMTCv1d0E8xLBobiCJ5YCfEDomKFakG97/D0/HLp3oCiCiQfMB0+JV
	lUuPbEyVbtFftYGu2Jmd7Kf5LrOb7N2AvUL5QPUE=
Content-Type: multipart/mixed; boundary="===============5889177005951994005=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 6.8.0 FAILED
Message-ID: <0101018e9ad47b15-f36ebcf9-6e6e-4c22-af58-334f94b59926-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197695

--===============5889177005951994005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iproute2* to *6.8.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-iproute2-upgrade-6.7.0-6.8.0.patch
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
From ab5d18cfe1e15bf49690135afd1b9f7a335a39ac Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 05:44:51 +0000
Subject: [PATCH] iproute2: upgrade 6.7.0 -> 6.8.0

---
 .../iproute2/0001-libc-compat.h-add-musl-workaround.patch      | 3 +--
 .../iproute2/{iproute2_6.7.0.bb => iproute2_6.8.0.bb}          | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.7.0.bb => iproute2_6.8.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
index 74e3de1ce9..6a54990192 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
@@ -1,4 +1,4 @@
-From c25f8d1f7a6203dfeb10b39f80ffd314bb84a58d Mon Sep 17 00:00:00 2001
+From 20861962c9352828b825042c73e34a5d5717681c Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Thu, 22 Dec 2016 15:26:30 +0200
 Subject: [PATCH] libc-compat.h: add musl workaround
@@ -14,7 +14,6 @@ https://git.buildroot.net/buildroot/tree/package/iproute2/0001-Add-the-musl-work
 
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
-
 ---
  include/uapi/linux/libc-compat.h | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb
index 640b3013f1..65a7c1c372 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            "
 
-SRC_URI[sha256sum] = "ff942dd9828d7d1f867f61fe72ce433078c31e5d8e4a78e20f02cb5892e8841d"
+SRC_URI[sha256sum] = "03a6cca3d71a908d1f15f7b495be2b8fe851f941458dc4664900d7f45fcf68ce"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.42.0


--===============5889177005951994005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1874 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-a32985d309052f4ca43b3338a9e468f525c2a2e5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a32985d309052f4ca43b3338a9e468f525c2a2e5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 284 Local 271 Mirrors 0 Missed 13 Current 370 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1347 of 1815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_recipe_qa)
NOTE: recipe iproute2-6.8.0-r0: task do_recipe_qa: Started
NOTE: recipe iproute2-6.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1796 of 1815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_fetch)
NOTE: recipe iproute2-6.8.0-r0: task do_fetch: Started
NOTE: recipe iproute2-6.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1797 of 1815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_unpack)
NOTE: Running task 1798 of 1815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.8.0-r0: task do_unpack: Started
NOTE: recipe iproute2-6.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1799 of 1815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_patch)
NOTE: Running task 1800 of 1815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_collect_spdx_deps)
NOTE: recipe iproute2-6.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-6.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe iproute2-6.8.0-r0: task do_patch: Started
NOTE: recipe iproute2-6.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iproute2-6.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1801 of 1815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1802 of 1815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_populate_lic)
NOTE: recipe iproute2-6.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.8.0-r0: task do_populate_lic: Started
NOTE: recipe iproute2-6.8.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_populate_lic unihash changed to 8d655ba797d1de637f0285bed445f6823a1de1e4135e1812f9fb1783fe25c010
NOTE: recipe iproute2-6.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_deploy_source_date_epoch unihash changed to 9f7360aa32623f4ae4ecb20220044599da96fe4874fb8ac83016f0953f472966
NOTE: Setscene tasks completed
NOTE: Running task 1803 of 1815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_configure)
NOTE: recipe iproute2-6.8.0-r0: task do_configure: Started
NOTE: recipe iproute2-6.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1804 of 1815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_compile)
NOTE: recipe iproute2-6.8.0-r0: task do_compile: Started
NOTE: recipe iproute2-6.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1805 of 1815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_install)
NOTE: recipe iproute2-6.8.0-r0: task do_install: Started
NOTE: recipe iproute2-6.8.0-r0: task do_install: Succeeded
NOTE: Running task 1806 of 1815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_package)
NOTE: Running task 1807 of 1815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_populate_sysroot)
NOTE: recipe iproute2-6.8.0-r0: task do_package: Started
NOTE: recipe iproute2-6.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe iproute2-6.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe iproute2-6.8.0-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 1807 tasks of which 1794 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240401054358.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240401054358.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_package
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: iproute2-6.8.0-r0 do_package: QA Issue: iproute2: Files/directories were installed but not shipped in any package:
  /usr/lib/tc
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
iproute2: 1 installed and not shipped files. [installed-vs-shipped]
ERROR: iproute2-6.8.0-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/iproute2/6.8.0/temp/log.do_package.1625463
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_package) failed with exit code '1'

--===============5889177005951994005==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-6.7.0-6.8.0.patch"

RnJvbSBhYjVkMThjZmUxZTE1YmY0OTY5MDEzNWFmZDFiOWY3YTMzNWEzOWFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwNTo0NDo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlw
cm91dGUyOiB1cGdyYWRlIDYuNy4wIC0+IDYuOC4wCgotLS0KIC4uLi9pcHJvdXRlMi8wMDAxLWxp
YmMtY29tcGF0LmgtYWRkLW11c2wtd29ya2Fyb3VuZC5wYXRjaCAgICAgIHwgMyArLS0KIC4uLi9p
cHJvdXRlMi97aXByb3V0ZTJfNi43LjAuYmIgPT4gaXByb3V0ZTJfNi44LjAuYmJ9ICAgICAgICAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi97aXByb3V0ZTJfNi43
LjAuYmIgPT4gaXByb3V0ZTJfNi44LjAuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMi8wMDAxLWxpYmMtY29tcGF0LmgtYWRk
LW11c2wtd29ya2Fyb3VuZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0
ZTIvaXByb3V0ZTIvMDAwMS1saWJjLWNvbXBhdC5oLWFkZC1tdXNsLXdvcmthcm91bmQucGF0Y2gK
aW5kZXggNzRlM2RlMWNlOS4uNmE1NDk5MDE5MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMi8wMDAxLWxpYmMtY29tcGF0LmgtYWRkLW11c2wt
d29ya2Fyb3VuZC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUy
L2lwcm91dGUyLzAwMDEtbGliYy1jb21wYXQuaC1hZGQtbXVzbC13b3JrYXJvdW5kLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBjMjVmOGQxZjdhNjIwM2RmZWIxMGIzOWY4MGZmZDMxNGJiODRh
NThkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyMDg2MTk2MmM5MzUyODI4YjgyNTA0
MmM3M2UzNGE1ZDU3MTc2ODFjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQmFydWNo
IFNpYWNoIDxiYXJ1Y2hAdGtvcy5jby5pbD4KIERhdGU6IFRodSwgMjIgRGVjIDIwMTYgMTU6MjY6
MzAgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliYy1jb21wYXQuaDogYWRkIG11c2wgd29ya2Fy
b3VuZApAQCAtMTQsNyArMTQsNiBAQCBodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9v
dC90cmVlL3BhY2thZ2UvaXByb3V0ZTIvMDAwMS1BZGQtdGhlLW11c2wtd29yawogCiBTaWduZWQt
b2ZmLWJ5OiBCYXJ1Y2ggU2lhY2ggPGJhcnVjaEB0a29zLmNvLmlsPgogU2lnbmVkLW9mZi1ieTog
TWF4aW4gQi4gSm9obiA8bWF4aW4uam9obkBpbnRlbC5jb20+Ci0KIC0tLQogIGluY2x1ZGUvdWFw
aS9saW51eC9saWJjLWNvbXBhdC5oIHwgNCArKystCiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9pcHJvdXRlMi9pcHJvdXRlMl82LjcuMC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvaXByb3V0ZTIvaXByb3V0ZTJfNi44LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMl82LjcuMC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMl82
LjguMC5iYgppbmRleCA2NDBiMzAxM2YxLi42NWE3YzFjMzcyIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzYuNy4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi44LjAuYmIKQEAgLTE1LDcg
KzE1LDcgQEAgU1JDX1VSSSA9ICIke0tFUk5FTE9SR19NSVJST1J9L2xpbnV4L3V0aWxzL25ldC8k
e0JQTn0vJHtCUH0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtbGliYy1jb21wYXQu
aC1hZGQtbXVzbC13b3JrYXJvdW5kLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiZmY5NDJkZDk4MjhkN2QxZjg2N2Y2MWZlNzJjZTQzMzA3OGMzMWU1ZDhlNGE3
OGUyMGYwMmNiNTg5MmU4ODQxZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwM2E2Y2NhM2Q3MWE5
MDhkMWYxNWY3YjQ5NWJlMmI4ZmU4NTFmOTQxNDU4ZGM0NjY0OTAwZDdmNDVmY2Y2OGNlIgogCiBp
bmhlcml0IHVwZGF0ZS1hbHRlcm5hdGl2ZXMgYmFzaC1jb21wbGV0aW9uIHBrZ2NvbmZpZwogCi0t
IAoyLjQyLjAKCg==

--===============5889177005951994005==--

