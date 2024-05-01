Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA24C27C54
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:21 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1137.1714579216787751702
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=V3xkHp26;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=DmBokj0b;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018f34e29734-4f4cfd0d-1e76-4fab-905e-f631c2eb7a33-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wbGq9LqRhxny1ScVHCv867ox6q5DLkFESvgpNy8vgJs=;
	b=V3xkHp26u7fBFuUR7r4WlafdoamxtyMwYdBebsJeNU3mldUIVbbL69i8XjXj7eup
	zZxG4ttEzppvWWV5l15+zxshz0uV297o0quyULro51IrJLI/Ah2YIj8Vq75vP0MbloB
	kK3+VbRjP5q+/EiO32H/oGXzpVAvbux0yNzrzGzM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wbGq9LqRhxny1ScVHCv867ox6q5DLkFESvgpNy8vgJs=;
	b=DmBokj0bBpb1EDAsb5tiQVfOCq1BP8pCcJRh3zY3LwZE52pklfzKckHECvSJDyCC
	VyWH7fwc05L9U1OoaAQUSa94xZRJDwiKWa07WLFCA02Sdt2nLwZDZMsnunwqv1R/pWG
	ZYbwBEqEU6JbQzUpViYI8RxA4bXd4s09WhHu5v2M=
Content-Type: multipart/mixed; boundary="===============4492416995725106711=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-devtools: upgrading to 1.24.3 FAILED
Message-ID: <0101018f34e29734-4f4cfd0d-1e76-4fab-905e-f631c2eb7a33-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198856

--===============4492416995725106711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gst-devtools* to *1.24.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.22.11-1.24.3.patch
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
From 7c6cce685e64a0714fe5b9c9783ee7c308a32e51 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 13:36:49 +0000
Subject: [PATCH] gst-devtools: upgrade 1.22.11 -> 1.24.3

---
 .../0001-connect-has-a-different-signature-on-musl.patch       | 3 +--
 .../{gst-devtools_1.22.11.bb => gst-devtools_1.24.3.bb}        | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.11.bb => gst-devtools_1.24.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index 21e30d6d46..f6d898fff0 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 0c73b8131efba63c5cd37ea8c7551434c3b57304 Mon Sep 17 00:00:00 2001
+From 326aaf36e174aa62cd971b72052c37a93e6da9cd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
@@ -11,7 +11,6 @@ typcasted to struct sockaddr_in* type inside the function before use
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  validate/plugins/fault_injection/socket_interposer.c | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb
index 2be406192f..9df802afe9 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "07766425ecb5bf857ab5ad3962321c55cd89f9386b720843f9df71c0a455eb9b"
+SRC_URI[sha256sum] = "b91114a2fd958f42acf441186e87e2bec93538ef35a9f8248111197360ffb237"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.44.0


--===============4492416995725106711==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.22.11-1.24.3.patch"

RnJvbSA3YzZjY2U2ODVlNjRhMDcxNGZlNWI5Yzk3ODNlZTdjMzA4YTMyZTUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAxMzozNjo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dC1kZXZ0b29sczogdXBncmFkZSAxLjIyLjExIC0+IDEuMjQuMwoKLS0tCiAuLi4vMDAwMS1jb25u
ZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaCAgICAgICB8IDMgKy0t
CiAuLi4ve2dzdC1kZXZ0b29sc18xLjIyLjExLmJiID0+IGdzdC1kZXZ0b29sc18xLjI0LjMuYmJ9
ICAgICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0LWRl
dnRvb2xzXzEuMjIuMTEuYmIgPT4gZ3N0LWRldnRvb2xzXzEuMjQuMy5iYn0gKDk1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzLzAw
MDEtY29ubmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzLzAwMDEtY29ubmVjdC1o
YXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2gKaW5kZXggMjFlMzBkNmQ0Ni4u
ZjZkODk4ZmZmMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdC1kZXZ0b29scy8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1t
dXNsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2
dG9vbHMvMDAwMS1jb25uZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMGM3M2I4MTMxZWZiYTYzYzVjZDM3ZWE4Yzc1NTE0MzRj
M2I1NzMwNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzI2YWFmMzZlMTc0YWE2MmNk
OTcxYjcyMDUyYzM3YTkzZTZkYTljZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTdW4sIDkgU2VwIDIwMTggMTc6Mzg6
MTAgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gY29ubmVjdCBoYXMgYSBkaWZmZXJlbnQgc2lnbmF0
dXJlIG9uIG11c2wKQEAgLTExLDcgKzExLDYgQEAgdHlwY2FzdGVkIHRvIHN0cnVjdCBzb2NrYWRk
cl9pbiogdHlwZSBpbnNpZGUgdGhlIGZ1bmN0aW9uIGJlZm9yZSB1c2UKIFVwc3RyZWFtLVN0YXR1
czogUGVuZGluZwogCiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
PgotCiAtLS0KICB2YWxpZGF0ZS9wbHVnaW5zL2ZhdWx0X2luamVjdGlvbi9zb2NrZXRfaW50ZXJw
b3Nlci5jIHwgNyArKysrKystCiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdC1kZXZ0b29sc18xLjIyLjExLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdC1kZXZ0b29sc18xLjI0LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18xLjIyLjEx
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRv
b2xzXzEuMjQuMy5iYgppbmRleCAyYmU0MDYxOTJmLi45ZGY4MDJhZmU5IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzXzEuMjIuMTEuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18xLjI0
LjMuYmIKQEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVl
ZGVza3RvcC5vcmcvc3JjL2dzdC1kZXZ0b29scy9nc3QtZGV2dG9vbHMtJHtQVn0KICAgICAgICAg
ICAgZmlsZTovLzAwMDEtY29ubmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wu
cGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwNzc2NjQyNWVj
YjViZjg1N2FiNWFkMzk2MjMyMWM1NWNkODlmOTM4NmI3MjA4NDNmOWRmNzFjMGE0NTVlYjliIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gImI5MTExNGEyZmQ5NThmNDJhY2Y0NDExODZlODdlMmJlYzkz
NTM4ZWYzNWE5ZjgyNDgxMTExOTczNjBmZmIyMzciCiAKIERFUEVORFMgPSAianNvbi1nbGliIGds
aWItMi4wIGdsaWItMi4wLW5hdGl2ZSBnc3RyZWFtZXIxLjAgZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
YmFzZSIKIFJSRUNPTU1FTkRTOiR7UE59ID0gImdpdCIKLS0gCjIuNDQuMAoK

--===============4492416995725106711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1876 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-0fa867bfca1e5b2433b819736ae627df63a8bc2c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0fa867bfca1e5b2433b819736ae627df63a8bc2c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 375 Local 363 Mirrors 0 Missed 12 Current 580 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2345 of 2646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb:do_recipe_qa)
NOTE: Running task 2474 of 2646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb:do_write_config)
NOTE: recipe gst-devtools-1.24.3-r0: task do_recipe_qa: Started
NOTE: recipe gst-devtools-1.24.3-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.24.3-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.24.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2627 of 2646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb:do_fetch)
NOTE: recipe gst-devtools-1.24.3-r0: task do_fetch: Started
NOTE: recipe gst-devtools-1.24.3-r0: task do_fetch: Succeeded
NOTE: Running task 2628 of 2646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb:do_unpack)
NOTE: Running task 2629 of 2646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.24.3-r0: task do_unpack: Started
NOTE: recipe gst-devtools-1.24.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.24.3-r0: task do_unpack: Succeeded
NOTE: Running task 2630 of 2646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb:do_patch)
NOTE: Running task 2631 of 2646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb:do_collect_spdx_deps)
NOTE: recipe gst-devtools-1.24.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gst-devtools-1.24.3-r0: task do_patch: Started
NOTE: recipe gst-devtools-1.24.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-devtools-1.24.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gst-devtools-1.24.3-r0: task do_patch: Succeeded
NOTE: Running task 2632 of 2646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2633 of 2646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb:do_populate_lic)
NOTE: recipe gst-devtools-1.24.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.24.3-r0: task do_populate_lic: Started
NOTE: recipe gst-devtools-1.24.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-devtools-1.24.3-r0: task do_populate_lic: Succeeded
NOTE: Running task 2634 of 2646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb:do_configure)
NOTE: recipe gst-devtools-1.24.3-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst
 reamer1.0-plugins-base_1.22.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo
 _git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'cracklib', 'libnsl2', 'libtirpc', 'libpam', 'texinfo-dummy-native', 'xz', 'gobject-introspection', 'json-glib', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxrandr', 'libxrender', 'libxshmfence', 'libxv', 'libxxf86vm', 'pixman', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'alsa-lib', 'gstrea
 mer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libtheora', 'libvorbis', 'bash-completion', 'fribidi', 'gdbm', 'icu', 'iso-codes', 'libcap-ng', 'libffi', 'libpcre2', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'gobject-introspection-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libcap-ng-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native
 ', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=enabled -Ddoc=disabled -Ddebug_viewer=disabled -Dtests=disabled -Dvalidate=enabled -Dnls=enabled -Dcairo=disabled...
| The Meson build system
| Version: 1.3.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.24.3/gst-devtools-1.24.3
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.24.3/build
| Build type: cross build
| Project name: gst-devtools
| Project version: 1.24.3
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.24.3/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.24.3/recipe-sysroot ld.bfd 2.42.0.20240216
| C compiler for the build machine: gcc (gcc 13.2.0 "gcc (GCC) 13.2.0")
| C linker for the build machine: gcc ld.bfd 2.42.0.20240216
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Compiler for C supports link arguments -Wl,-z,nodelete: YES
| Compiler for C supports arguments -fvisibility=hidden: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Found pkg-config: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.24.3/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Dependency gstreamer-1.0 found: NO found 1.22.11 but need: '>= 1.24.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-devtools-1.24.3/meson.build:82:10: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.24.3/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.24.3/temp/run.do_configure.3461292:176 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.24.3/temp/run.do_configure.3461292, line 176
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.24.3/temp/run.do_configure.3461292, line 165
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.24.3/temp/run.do_configure.3461292, line 154
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.24.3/temp/run.do_configure.3461292, line 189
NOTE: recipe gst-devtools-1.24.3-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2634 tasks of which 2624 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501133613.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501133613.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gst-devtools-1.24.3-r0 do_configure: meson failed
ERROR: gst-devtools-1.24.3-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.24.3/temp/run.do_configure.3461292', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.24.3/temp/log.do_configure.3461292
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb:do_configure) failed with exit code '1'

--===============4492416995725106711==--

