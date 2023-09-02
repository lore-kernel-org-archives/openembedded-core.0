Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB923EE49B3
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:14 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.5687.1693650554209950401
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dd/yrwkb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TjEjOSmu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018a5570890b-bd0cc114-a5c7-4a77-890a-bc0fb3fddae6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aeaXU/2OdYHjFC+4BFhKQEC5w8VJpGO4WGy5q7emMX0=;
	b=dd/yrwkbnbWIVYurF0hKZGnSPX5G4dVPIO5yM8yQetjOOUP5RorKzNOV63fydqi+
	M2eJHi3iYVmuNhrHGAyEe3qpM+zZZHR5n/fupOslZeDsNdjKKar+qc8Us+IN57uTQmU
	hRqNa5Cn8xvYRVHyxM3IVu+OzcmPxiXj69KhcBpU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aeaXU/2OdYHjFC+4BFhKQEC5w8VJpGO4WGy5q7emMX0=;
	b=TjEjOSmu73bLINfJLNvNUL2CxvEaP460YcA9yILgBeqiZLZTLwOu2ImdcOWW1vlv
	IOhYSWrIx7lam2fiSYpImoeXpEDzckY6ZhsUCPUq0YZbny7SuqrFIcIY7IqRe/G0Eqn
	v2xTCvkxm8aEai1dSljLalQ62IO/M8plGrD5OvsE=
Content-Type: multipart/mixed; boundary="===============1894537412370400592=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-rust: upgrading to 1.7.0 FAILED
Message-ID: <0101018a5570890b-bd0cc114-a5c7-4a77-890a-bc0fb3fddae6-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187085

--===============1894537412370400592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools-rust* to *1.7.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-setuptools-rust-upgrade-1.6.0-1.7.0.patch
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
From ad6b9d010b6a09841ee6fd93016f910f025f0c54 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 16:02:19 +0000
Subject: [PATCH] python3-setuptools-rust: upgrade 1.6.0 -> 1.7.0

---
 ...etuptools-rust_1.6.0.bb => python3-setuptools-rust_1.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.6.0.bb => python3-setuptools-rust_1.7.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb
index f1da4b50e7..58532712b4 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 SRC_URI = "${PYPI_SRC_URI} \
            https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "c86e734deac330597998bfbc08da45187e6b27837e23bd91eadb320732392262"
+SRC_URI[sha256sum] = "c7100999948235a38ae7e555fe199aa66c253dc384b125f5d85473bf81eae3a3"
 
 inherit cargo pypi python_setuptools_build_meta
 
-- 
2.39.2


--===============1894537412370400592==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-rust-upgrade-1.6.0-1.7.0.patch"

RnJvbSBhZDZiOWQwMTBiNmEwOTg0MWVlNmZkOTMwMTZmOTEwZjAyNWYwYzU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAxNjowMjoxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29scy1ydXN0OiB1cGdyYWRlIDEuNi4wIC0+IDEuNy4wCgotLS0KIC4uLmV0
dXB0b29scy1ydXN0XzEuNi4wLmJiID0+IHB5dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuNy4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2V0dXB0b29scy1y
dXN0XzEuNi4wLmJiID0+IHB5dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuNy4wLmJifSAoOTIlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRv
b2xzLXJ1c3RfMS42LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c2V0dXB0b29scy1ydXN0XzEuNy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLXJ1c3RfMS42
LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1
cHRvb2xzLXJ1c3RfMS43LjAuYmIKaW5kZXggZjFkYTRiNTBlNy4uNTg1MzI3MTJiNCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtcnVz
dF8xLjYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0
dXB0b29scy1ydXN0XzEuNy4wLmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTAxMWNkOTJlNzAyZGQ5ZTZiMWEyNjE1N2I2ZmQ1M2Y1Igog
U1JDX1VSSSA9ICIke1BZUElfU1JDX1VSSX0gXAogICAgICAgICAgICBodHRwczovL2ZpbGVzLnB5
dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvNjcvMDgvZTFhYTJjNTgyYzYyYWM3NmU0ZDYwZjhlNDU0
YmQzYmJhOTMzNzgxYTA2YTg4YjRlMzg3OTc0NDU4MjJhL3NldHVwdG9vbHMtcnVzdC0ke1BWfS50
YXIuZ3ogXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzg2ZTczNGRlYWMz
MzA1OTc5OThiZmJjMDhkYTQ1MTg3ZTZiMjc4MzdlMjNiZDkxZWFkYjMyMDczMjM5MjI2MiIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJjNzEwMDk5OTk0ODIzNWEzOGFlN2U1NTVmZTE5OWFhNjZjMjUz
ZGMzODRiMTI1ZjVkODU0NzNiZjgxZWFlM2EzIgogCiBpbmhlcml0IGNhcmdvIHB5cGkgcHl0aG9u
X3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi0tIAoyLjM5LjIKCg==

--===============1894537412370400592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1806 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-8fb827f8d1a698386849b63c79deabf582ffaa2d"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8fb827f8d1a698386849b63c79deabf582ffaa2d"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 225 Local 214 Mirrors 0 Missed 11 Current 487 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1437 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb:do_recipe_qa)
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1999 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb:do_fetch)
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 2000 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb:do_unpack)
NOTE: Running task 2001 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 2002 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb:do_patch)
NOTE: Running task 2003 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 2004 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2005 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb:do_rust_create_wrappers)
NOTE: Running task 2006 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb:do_rust_gen_targets)
NOTE: Running task 2007 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb:do_populate_lic)
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_populate_lic: Started
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2008 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb:do_configure)
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2009 of 2018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb:do_compile)
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/recipe-sysroot-native/usr/lib/python3.11/site-packages/pyproject_hooks/_in_process/_in_process.py", line 353, in <module>
|     main()
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/recipe-sysroot-native/usr/lib/python3.11/site-packages/pyproject_hooks/_in_process/_in_process.py", line 335, in main
|     json_out['return_val'] = hook(**hook_input['kwargs'])
|                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/recipe-sysroot-native/usr/lib/python3.11/site-packages/pyproject_hooks/_in_process/_in_process.py", line 118, in get_requires_for_build_wheel
|     return hook(config_settings)
|            ^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/build_meta.py", line 355, in get_requires_for_build_wheel
|     return self._get_build_requires(config_settings, requirements=['wheel'])
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/build_meta.py", line 325, in _get_build_requires
|     self.run_setup()
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/build_meta.py", line 341, in run_setup
|     exec(code, locals())
|   File "<string>", line 1, in <module>
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/__init__.py", line 107, in setup
|     return distutils.core.setup(**attrs)
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/_distutils/core.py", line 147, in setup
|     _setup_distribution = dist = klass(attrs)
|                                  ^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/dist.py", line 485, in __init__
|     _Distribution.__init__(
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/_distutils/dist.py", line 283, in __init__
|     self.finalize_options()
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/dist.py", line 925, in finalize_options
|     for ep in sorted(loaded, key=by_order):
|               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/dist.py", line 924, in <lambda>
|     loaded = map(lambda e: e.load(), filtered)
|                            ^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/recipe-sysroot-native/usr/lib/python3.11/importlib/metadata/__init__.py", line 202, in load
|     module = import_module(match.group('module'))
|              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/recipe-sysroot-native/usr/lib/python3.11/importlib/__init__.py", line 126, in import_module
|     return _bootstrap._gcd_import(name[level:], package, level)
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "<frozen importlib._bootstrap>", line 1204, in _gcd_import
|   File "<frozen importlib._bootstrap>", line 1176, in _find_and_load
|   File "<frozen importlib._bootstrap>", line 1126, in _find_and_load_unlocked
|   File "<frozen importlib._bootstrap>", line 241, in _call_with_frames_removed
|   File "<frozen importlib._bootstrap>", line 1204, in _gcd_import
|   File "<frozen importlib._bootstrap>", line 1176, in _find_and_load
|   File "<frozen importlib._bootstrap>", line 1147, in _find_and_load_unlocked
|   File "<frozen importlib._bootstrap>", line 690, in _load_unlocked
|   File "<frozen importlib._bootstrap_external>", line 940, in exec_module
|   File "<frozen importlib._bootstrap>", line 241, in _call_with_frames_removed
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/setuptools-rust-1.7.0/setuptools_rust/__init__.py", line 1, in <module>
|     from .build import build_rust
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/setuptools-rust-1.7.0/setuptools_rust/build.py", line 22, in <module>
|     from semantic_version import Version
| ModuleNotFoundError: No module named 'semantic_version'
| 
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/temp/run.do_compile.1582477:183 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/dist /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/setuptools-rust-1.7.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/temp/run.do_compile.1582477, line 183
| 	#2: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/temp/run.do_compile.1582477, line 159
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/temp/run.do_compile.1582477, line 194
NOTE: recipe python3-setuptools-rust-1.7.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2009 tasks of which 1997 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-setuptools-rust-1.7.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/temp/run.do_compile.1582477', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-rust/1.7.0/temp/log.do_compile.1582477
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb:do_compile) failed with exit code '1'

--===============1894537412370400592==--

