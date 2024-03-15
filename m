Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD1BC54E6A
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:12 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.1264.1710522010477660274
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ShOU+Cvh;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VGw2ldZD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018e430e87c7-38ef629f-bd83-4cc4-aa46-c930190f3ab6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522009;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3BlD5BM8imJMlPUx4t+FFJjrIVG5cAF7FQ3qzZHQGtw=;
	b=ShOU+Cvhf/aevgpseQpDBc/tE0Fk62mkMDCllquQS+LyLNVAfaH4XmYlaf5PQhN/
	GO4A2ZgAjng6l+O3YqcDM8N5V7eT+6PNbzFTG51AgMJ4TIu36vng19/pmZFSqNeymxA
	sbUr9u8Gi+FJmhWWPwb7Wfrai9/cqSev1zLbLKsc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522009;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3BlD5BM8imJMlPUx4t+FFJjrIVG5cAF7FQ3qzZHQGtw=;
	b=VGw2ldZD46ki5HvWBiWWB4W9OtZwl+hz/irc2lulQmc5OqxHgxt6fNSSL64yVqmN
	Fys7GDRnl10/aO6nArTYaZC5p7sXUFVNin5RApBuA9b8iAss2/n9yTiQX+m9YB1z3uv
	i4qfirfdgDfJ9jTnQGTv0RmCPXd2FMdQhHrnFzxw=
Content-Type: multipart/mixed; boundary="===============3619640996192927816=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 6.8.0 FAILED
Message-ID: <0101018e430e87c7-38ef629f-bd83-4cc4-aa46-c930190f3ab6-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197147

--===============3619640996192927816==
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
From ef85d1a8e39b1bbe80b2ff54e2b3e1c292119ad4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 05:08:13 +0000
Subject: [PATCH] iproute2: upgrade 6.7.0 -> 6.8.0

---
 .../iproute2/0001-libc-compat.h-add-musl-workaround.patch      | 3 +--
 .../iproute2/{iproute2_6.7.0.bb => iproute2_6.8.0.bb}          | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.7.0.bb => iproute2_6.8.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
index 74e3de1ce9..47fe3d884b 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
@@ -1,4 +1,4 @@
-From c25f8d1f7a6203dfeb10b39f80ffd314bb84a58d Mon Sep 17 00:00:00 2001
+From 6cf14e2254251a238257a42d5602078a35595bd6 Mon Sep 17 00:00:00 2001
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


--===============3619640996192927816==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-6.7.0-6.8.0.patch"

RnJvbSBlZjg1ZDFhOGUzOWIxYmJlODBiMmZmNTRlMmIzZTFjMjkyMTE5YWQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMDU6MDg6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
cHJvdXRlMjogdXBncmFkZSA2LjcuMCAtPiA2LjguMAoKLS0tCiAuLi4vaXByb3V0ZTIvMDAwMS1s
aWJjLWNvbXBhdC5oLWFkZC1tdXNsLXdvcmthcm91bmQucGF0Y2ggICAgICB8IDMgKy0tCiAuLi4v
aXByb3V0ZTIve2lwcm91dGUyXzYuNy4wLmJiID0+IGlwcm91dGUyXzYuOC4wLmJifSAgICAgICAg
ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIve2lwcm91dGUyXzYu
Ny4wLmJiID0+IGlwcm91dGUyXzYuOC4wLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTIvMDAwMS1saWJjLWNvbXBhdC5oLWFk
ZC1tdXNsLXdvcmthcm91bmQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91
dGUyL2lwcm91dGUyLzAwMDEtbGliYy1jb21wYXQuaC1hZGQtbXVzbC13b3JrYXJvdW5kLnBhdGNo
CmluZGV4IDc0ZTNkZTFjZTkuLjQ3ZmUzZDg4NGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTIvMDAwMS1saWJjLWNvbXBhdC5oLWFkZC1tdXNs
LXdvcmthcm91bmQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRl
Mi9pcHJvdXRlMi8wMDAxLWxpYmMtY29tcGF0LmgtYWRkLW11c2wtd29ya2Fyb3VuZC5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gYzI1ZjhkMWY3YTYyMDNkZmViMTBiMzlmODBmZmQzMTRiYjg0
YTU4ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNmNmMTRlMjI1NDI1MWEyMzgyNTdh
NDJkNTYwMjA3OGEzNTU5NWJkNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEJhcnVj
aCBTaWFjaCA8YmFydWNoQHRrb3MuY28uaWw+CiBEYXRlOiBUaHUsIDIyIERlYyAyMDE2IDE1OjI2
OjMwICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxpYmMtY29tcGF0Lmg6IGFkZCBtdXNsIHdvcmth
cm91bmQKQEAgLTE0LDcgKzE0LDYgQEAgaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJv
b3QvdHJlZS9wYWNrYWdlL2lwcm91dGUyLzAwMDEtQWRkLXRoZS1tdXNsLXdvcmsKIAogU2lnbmVk
LW9mZi1ieTogQmFydWNoIFNpYWNoIDxiYXJ1Y2hAdGtvcy5jby5pbD4KIFNpZ25lZC1vZmYtYnk6
IE1heGluIEIuIEpvaG4gPG1heGluLmpvaG5AaW50ZWwuY29tPgotCiAtLS0KICBpbmNsdWRlL3Vh
cGkvbGludXgvbGliYy1jb21wYXQuaCB8IDQgKysrLQogIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi43LjAuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2lwcm91dGUyL2lwcm91dGUyXzYuOC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi43LjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJf
Ni44LjAuYmIKaW5kZXggNjQwYjMwMTNmMS4uNjVhN2MxYzM3MiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMl82LjcuMC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzYuOC4wLmJiCkBAIC0xNSw3
ICsxNSw3IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC91dGlscy9uZXQv
JHtCUE59LyR7QlB9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWxpYmMtY29tcGF0
LmgtYWRkLW11c2wtd29ya2Fyb3VuZC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImZmOTQyZGQ5ODI4ZDdkMWY4NjdmNjFmZTcyY2U0MzMwNzhjMzFlNWQ4ZTRh
NzhlMjBmMDJjYjU4OTJlODg0MWQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDNhNmNjYTNkNzFh
OTA4ZDFmMTVmN2I0OTViZTJiOGZlODUxZjk0MTQ1OGRjNDY2NDkwMGQ3ZjQ1ZmNmNjhjZSIKIAog
aW5oZXJpdCB1cGRhdGUtYWx0ZXJuYXRpdmVzIGJhc2gtY29tcGxldGlvbiBwa2djb25maWcKIAot
LSAKMi40Mi4wCgo=

--===============3619640996192927816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1877 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-8cd77bf69db3a6b1ad1d0f99b371b7d841a4f0f5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8cd77bf69db3a6b1ad1d0f99b371b7d841a4f0f5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 278 Local 265 Mirrors 0 Missed 13 Current 376 (95% match, 98% complete)
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
NOTE: recipe iproute2-6.8.0-r0: task do_patch: Started
NOTE: recipe iproute2-6.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe iproute2-6.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1801 of 1815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1802 of 1815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_populate_lic)
NOTE: recipe iproute2-6.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iproute2-6.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.8.0-r0: task do_populate_lic: Started
NOTE: recipe iproute2-6.8.0-r0: task do_populate_lic: Succeeded
NOTE: recipe iproute2-6.8.0-r0: task do_deploy_source_date_epoch: Succeeded
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
NOTE: recipe iproute2-6.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe iproute2-6.8.0-r0: task do_package: Started
NOTE: recipe iproute2-6.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe iproute2-6.8.0-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 1807 tasks of which 1794 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240315050739.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240315050739.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_package
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: iproute2-6.8.0-r0 do_package: QA Issue: iproute2: Files/directories were installed but not shipped in any package:
  /usr/lib/tc
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
iproute2: 1 installed and not shipped files. [installed-vs-shipped]
ERROR: iproute2-6.8.0-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/iproute2/6.8.0/temp/log.do_package.1203183
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb:do_package) failed with exit code '1'

--===============3619640996192927816==--

