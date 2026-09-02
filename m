Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0930C624D8
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:31:49 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5727.1788327108198148387
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FMvqjZTG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AoEhI3v3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a0609a1ad1-463c6045-6755-467c-9091-dc08a2de12a4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788327107;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dIiO/bOyS2umhUIE2HWTGUHCENMsE0dhsx1zmZI1uA8=;
	b=FMvqjZTGWzSWtnkr6X8L+azWarDLeCJPms90bsjrYJdgmf2+4e3aXELHUp7hEjeq
	rpaoQY0PAK5Ve5vVZAibJSkVNmWwjwhe/kDsLMEz5invadIPVVqrlAqsSasHmi9znal
	eAjQ+I9LjZrzWbvbDUjVdUdQqb95UxRdiv1kIpjM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788327107;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dIiO/bOyS2umhUIE2HWTGUHCENMsE0dhsx1zmZI1uA8=;
	b=AoEhI3v3nxQdIeF+FZ5QV0XrFXVHEYNoVedYyZEm42F5Ww8+Nr0olKGp1L6BQ65U
	rQ1dP/rZ62BqGh/kT2BUTUwmb9yKUNnmjUiq9Jq0dj7rJKd8irf5+pZ+Nt+ksl87ZvL
	+gzPbLO63o+t1S1SYIh2dDemGkPC4yniXdjtmzoE=
Content-Type: multipart/mixed; boundary="===============8591733739696079563=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 10.2.2 FAILED
Message-ID: <010101a0609a1ad1-463c6045-6755-467c-9091-dc08a2de12a4-000000@us-west-2.amazonses.com>
Date: Wed, 2 Sep 2026 05:31:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244883

--===============8591733739696079563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-scm* to *10.2.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-setuptools-scm-upgrade-10.2.1-10.2.2.patch
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
From 706c2b7866bc6d9a1f081a9f875f3b7c11608909 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 2 Sep 2026 05:10:15 +0000
Subject: [PATCH] python3-setuptools-scm: upgrade 10.2.1 -> 10.2.2

Source: CHANGELOG.md

## 10.2.2 (2026-09-01)

### Miscellaneous

- The `pkginfo` workdir discovery entry point moved to vcs-versioning; `vcs-versioning>=2.3.2` is now required (the workspace pin carries a `.dev0` suffix so in-tree builds resolve, matching the existing convention). `setuptools_scm._integration._discover.discover_pkginfo` remains as a re-export. ([#1507](https://github.com/pypa/setuptools-scm/issues/1507))
- Stop shipping a per-package `uv.lock` in the sdist. It could not be generated correctly whenever `setuptools-scm` required an unreleased `vcs-versioning`, which broke the release proposal workflow. ([#1509](https://github.com/pypa/setuptools-scm/issues/1509))
---
 ...etuptools-scm_10.2.1.bb => python3-setuptools-scm_10.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_10.2.1.bb => python3-setuptools-scm_10.2.2.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb b/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb
index 608c0ba47f..d6f23321d0 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "4fa7dd82cf8c800df59c9a288c90299b1657ff1ecfc3f5cc00287c5dbf5e27a9"
+SRC_URI[sha256sum] = "36b5dcef6bbeee0bc76b7756d1b574b3762e2138611a4f18e898f22f1aaee462"
 
 PYPI_PACKAGE = "setuptools_scm"
 
-- 
2.47.1


--===============8591733739696079563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-setuptools-scm-changelog.txt"

Changelog for python3-setuptools-scm: 10.2.1 -> 10.2.2
Source: CHANGELOG.md

## 10.2.2 (2026-09-01)

### Miscellaneous

- The `pkginfo` workdir discovery entry point moved to vcs-versioning; `vcs-versioning>=2.3.2` is now required (the workspace pin carries a `.dev0` suffix so in-tree builds resolve, matching the existing convention). `setuptools_scm._integration._discover.discover_pkginfo` remains as a re-export. ([#1507](https://github.com/pypa/setuptools-scm/issues/1507))
- Stop shipping a per-package `uv.lock` in the sdist. It could not be generated correctly whenever `setuptools-scm` required an unreleased `vcs-versioning`, which broke the release proposal workflow. ([#1509](https://github.com/pypa/setuptools-scm/issues/1509))

--===============8591733739696079563==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-scm-upgrade-10.2.1-10.2.2.patch"

RnJvbSA3MDZjMmI3ODY2YmM2ZDlhMWYwODFhOWY4NzVmM2I3YzExNjA4OTA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMiBTZXAgMjAyNiAwNToxMDoxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29scy1zY206IHVwZ3JhZGUgMTAuMi4xIC0+IDEwLjIuMgoKU291cmNlOiBD
SEFOR0VMT0cubWQKCiMjIDEwLjIuMiAoMjAyNi0wOS0wMSkKCiMjIyBNaXNjZWxsYW5lb3VzCgot
IFRoZSBgcGtnaW5mb2Agd29ya2RpciBkaXNjb3ZlcnkgZW50cnkgcG9pbnQgbW92ZWQgdG8gdmNz
LXZlcnNpb25pbmc7IGB2Y3MtdmVyc2lvbmluZz49Mi4zLjJgIGlzIG5vdyByZXF1aXJlZCAodGhl
IHdvcmtzcGFjZSBwaW4gY2FycmllcyBhIGAuZGV2MGAgc3VmZml4IHNvIGluLXRyZWUgYnVpbGRz
IHJlc29sdmUsIG1hdGNoaW5nIHRoZSBleGlzdGluZyBjb252ZW50aW9uKS4gYHNldHVwdG9vbHNf
c2NtLl9pbnRlZ3JhdGlvbi5fZGlzY292ZXIuZGlzY292ZXJfcGtnaW5mb2AgcmVtYWlucyBhcyBh
IHJlLWV4cG9ydC4gKFsjMTUwN10oaHR0cHM6Ly9naXRodWIuY29tL3B5cGEvc2V0dXB0b29scy1z
Y20vaXNzdWVzLzE1MDcpKQotIFN0b3Agc2hpcHBpbmcgYSBwZXItcGFja2FnZSBgdXYubG9ja2Ag
aW4gdGhlIHNkaXN0LiBJdCBjb3VsZCBub3QgYmUgZ2VuZXJhdGVkIGNvcnJlY3RseSB3aGVuZXZl
ciBgc2V0dXB0b29scy1zY21gIHJlcXVpcmVkIGFuIHVucmVsZWFzZWQgYHZjcy12ZXJzaW9uaW5n
YCwgd2hpY2ggYnJva2UgdGhlIHJlbGVhc2UgcHJvcG9zYWwgd29ya2Zsb3cuIChbIzE1MDldKGh0
dHBzOi8vZ2l0aHViLmNvbS9weXBhL3NldHVwdG9vbHMtc2NtL2lzc3Vlcy8xNTA5KSkKLS0tCiAu
Li5ldHVwdG9vbHMtc2NtXzEwLjIuMS5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtc2NtXzEwLjIu
Mi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNldHVwdG9v
bHMtc2NtXzEwLjIuMS5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtc2NtXzEwLjIuMi5iYn0gKDg5
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0
dXB0b29scy1zY21fMTAuMi4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNldHVwdG9vbHMtc2NtXzEwLjIuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDg5JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1zY21f
MTAuMi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c2V0dXB0b29scy1zY21fMTAuMi4yLmJiCmluZGV4IDYwOGMwYmE0N2YuLmQ2ZjIzMzIxZDAgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xz
LXNjbV8xMC4yLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHMtc2NtXzEwLjIuMi5iYgpAQCAtNiw3ICs2LDcgQEAgYXJndW1lbnQgb3IgaW4g
YSBTQ00gbWFuYWdlZCBmaWxlLiIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRTttZDU9ODM4YzM2NmY2OWI3MmM1ZGYwNWM5NmRmZjc5YjM1ZjIiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0ZmE3ZGQ4MmNmOGM4MDBkZjU5YzlhMjg4YzkwMjk5YjE2
NTdmZjFlY2ZjM2Y1Y2MwMDI4N2M1ZGJmNWUyN2E5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM2
YjVkY2VmNmJiZWVlMGJjNzZiNzc1NmQxYjU3NGIzNzYyZTIxMzg2MTFhNGYxOGU4OThmMjJmMWFh
ZWU0NjIiCiAKIFBZUElfUEFDS0FHRSA9ICJzZXR1cHRvb2xzX3NjbSIKIAotLSAKMi40Ny4xCgo=

--===============8591733739696079563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1986 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-b47e680cd1ea6aa29fd27fbc722f575dbddd52f0"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:b47e680cd1ea6aa29fd27fbc722f575dbddd52f0"
meta-yocto-bsp       
meta-poky            = "master:6ce984c0a3a68c2fdc3c32bc185b6729d09e7829"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 584 Local 557 Mirrors 0 Missed 27 Current 213 (95% match, 96% complete)
done.
Removing 4 stale sstate objects for arch x86-64-v3...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 281 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 315 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 339 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 365 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.165.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 373 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 376 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.15.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 407 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 421 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.98.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hypothesis-6.165.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-vcs-versioning-native-2.3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 264 of 2085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_recipe_qa)
NOTE: recipe python3-pip-native-26.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 293 of 2085 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_recipe_qa)
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 455 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 456 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_package_setscene)
NOTE: recipe python3-hypothesis-6.165.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-setuptools-scm-native-10.2.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pip-native-26.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 457 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 458 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 460 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 462 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 463 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 465 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 467 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.165.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 469 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 471 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_recipe_qa_setscene)
NOTE: Running task 370 of 2085 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_fetch)
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.165.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-vcs-versioning-native-2.3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pip-native-26.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.2.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 371 of 2085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Started
NOTE: Running task 372 of 2085 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_fetch)
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 373 of 2085 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_unpack)
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pip-native-26.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.165.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 472 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-vcs-versioning-native-2.3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 377 of 2085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_fetch)
NOTE: Running task 385 of 2085 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.165.10.bb:do_fetch)
NOTE: Running setscene task 473 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 474 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_fetch: Started
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Started
NOTE: Running setscene task 480 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-setuptools-scm-native-10.2.2-r0: task do_fetch: Started
NOTE: Running setscene task 523 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libstd-rs-1.98.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/cargo_1.98.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 529 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-vcs-versioning-native-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.2.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 531 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 533 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.1.bb:do_recipe_qa_setscene)
NOTE: Running task 428 of 2085 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_unpack)
NOTE: Running task 429 of 2085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_unpack)
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.165.10-r0: task do_fetch: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_fetch: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 431 of 2085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.15.0.bb:do_fetch)
NOTE: recipe glibc-2.44+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_fetch: Succeeded
NOTE: recipe libstd-rs-1.98.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_unpack: Started
NOTE: Running task 432 of 2085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_unpack)
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 535 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_spdx_setscene)
NOTE: recipe cargo-native-1.98.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-vcs-versioning-native-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.2.2-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 536 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 433 of 2085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_patch)
NOTE: recipe libstd-rs-1.98.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 540 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-vcs-versioning-native-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_package_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 569 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_unpack: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 571 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.2.2-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.165.10-r0: task do_fetch: Succeeded
NOTE: Running task 455 of 2085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_patch)
NOTE: Running task 456 of 2085 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.165.10.bb:do_unpack)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 573 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-scm-native-10.2.2-r0: task do_patch: Succeeded
NOTE: Running task 457 of 2085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_fetch: Started
NOTE: Running setscene task 576 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cargo-native-1.98.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust_1.98.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/cargo_1.98.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 605 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgit2/libgit2_1.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 607 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-hypothesis-6.165.10-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ca-certificates-native-20260816-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-native-3.14.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgit2-native-1.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.44+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe rust-native-1.98.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-native-1.98.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_patch: Succeeded
NOTE: Running task 498 of 2085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_rust_gen_targets)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-native-3.14.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 616 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe cargo-native-1.98.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 663 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-2.44+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 668 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ca-certificates-native-20260816-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 670 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libgit2-native-1.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_rust_gen_targets: Succeeded
NOTE: Running setscene task 672 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 673 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libssh2/libssh2_1.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 674 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgit2/libgit2_1.9.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-native-3.14.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-native-20260816-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-native-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgit2-native-1.9.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssh2-native-1.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hypothesis-6.165.10-r0: task do_unpack: Succeeded
NOTE: recipe python3-native-3.14.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-native-20260816-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgit2-native-1.9.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 706 of 2085 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_create_recipe_spdx)
NOTE: recipe libssh2-native-1.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-native-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libssh2/libssh2_1.11.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 717 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libssh2-native-1.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-native-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssh2-native-1.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-native-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 721 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 722 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-native-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-native-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 730 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-native-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-native-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rust-native-1.98.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust_1.98.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 735 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 736 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patchelf/patchelf_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 737 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust-source_1.98.0.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-native-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flex-native-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-source-1.98.0-1.98.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-native-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe patchelf-native-0.19.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-native-22.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-source-1.98.0-1.98.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rust-native-1.98.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe rust-native-1.98.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-native-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe patchelf-native-0.19.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patchelf/patchelf_git.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-native-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flex-native-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe patchelf-native-0.19.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe patchelf-native-0.19.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 748 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-build-native-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-native-26.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-installer-native-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 762 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe llvm-native-22.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-tblgen-native_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_recipe_qa_setscene)
NOTE: recipe llvm-tblgen-native-22.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-native-2.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-native-22.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe llvm-native-22.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe llvm-tblgen-native-22.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-tblgen-native_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 774 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-project-source.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-native-2.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe llvm-project-source-22.1.8-22.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe llvm-tblgen-native-22.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe llvm-project-source-22.1.8-22.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe llvm-tblgen-native-22.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pkgconf-native-3.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-native-2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_fetch: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 818 of 2085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.15.0.bb:do_unpack)
NOTE: recipe libxml2-native-2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pkgconf-native-3.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 790 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/m4/m4-native_1.4.21.bb:do_populate_sysroot_setscene)
NOTE: recipe m4-native-1.4.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_unpack: Started
NOTE: recipe pkgconf-native-3.0.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe m4-native-1.4.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 797 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/m4/m4-native_1.4.21.bb:do_recipe_qa_setscene)
NOTE: recipe pkgconf-native-3.0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe m4-native-1.4.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnu-config-native-20260629+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe m4-native-1.4.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnu-config-native-20260629+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 797 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_recipe_qa_setscene)
NOTE: recipe gnu-config-native-20260629+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnu-config-native-20260629+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1627 of 2085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1675 of 2085 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.165.10.bb:do_patch)
NOTE: Running task 1754 of 2085 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_patch)
NOTE: Running task 1819 of 2085 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1846 of 2085 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_patch)
NOTE: recipe python3-setuptools-scm-native-10.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.165.10-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_patch: Succeeded
NOTE: Running task 2029 of 2085 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.165.10-r0: task do_patch: Succeeded
NOTE: Running task 2030 of 2085 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_populate_lic)
NOTE: Running task 2031 of 2085 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.165.10.bb:do_rust_gen_targets)
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_populate_lic: Started
NOTE: recipe python3-hypothesis-6.165.10-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-hypothesis-6.165.10-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2034 of 2085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_configure)
NOTE: recipe python3-setuptools-scm-native-10.2.2-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2035 of 2085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_compile)
NOTE: Running task 2036 of 2085 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_configure)
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-native-10.2.2-r0: task do_compile: Started
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2037 of 2085 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_compile)
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_compile: Started
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 2038 of 2085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.15.0.bb:do_patch)
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_patch: Started
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_patch: Succeeded
NOTE: Running task 2039 of 2085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.15.0.bb:do_rust_gen_targets)
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_rust_gen_targets: Succeeded
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| failed to load discovery EP egg-info
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/vcs_versioning/_worktree_discovery.py", line 57, in _load_discovery_factories
|     factory: DiscoveryFactory = ep.load()
|                                 ~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/recipe-sysroot-native/usr/lib/python3.14/importlib/metadata/__init__.py", line 179, in load
|     module = import_module(match.group('module'))
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/recipe-sysroot-native/usr/lib/python3.14/importlib/__init__.py", line 88, in import_module
|     return _bootstrap._gcd_import(name[level:], package, level)
|            ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "<frozen importlib._bootstrap>", line 1406, in _gcd_import
|   File "<frozen importlib._bootstrap>", line 1371, in _find_and_load
|   File "<frozen importlib._bootstrap>", line 1342, in _find_and_load_unlocked
|   File "<frozen importlib._bootstrap>", line 938, in _load_unlocked
|   File "<frozen importlib._bootstrap_external>", line 759, in exec_module
|   File "<frozen importlib._bootstrap>", line 491, in _call_with_frames_removed
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/sources/setuptools_scm-10.2.2/src/setuptools_scm/_integration/_discover.py", line 19, in <module>
|     from vcs_versioning._fallback_workdir import discover_pkginfo as discover_pkginfo
| ImportError: cannot import name 'discover_pkginfo' from 'vcs_versioning._fallback_workdir' (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/vcs_versioning/_fallback_workdir.py)
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
|     main()
|     ~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
|     json_out["return_val"] = hook(**hook_input["kwargs"])
|                              ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
|     return hook(config_settings)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 333, in get_requires_for_build_wheel
|     return self._get_build_requires(config_settings, requirements=[])
|            ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 301, in _get_build_requires
|     self.run_setup()
|     ~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 317, in run_setup
|     exec(code, locals())  # noqa: S102 # exec is intentional here
|     ~~~~^^^^^^^^^^^^^^^^
|   File "<string>", line 49, in <module>
|   File "<string>", line 36, in _package_version
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/sources/setuptools_scm-10.2.2/src/setuptools_scm/_get_version.py", line 59, in get_version
|     return _get_version_public(
|         root=root,
|     ...<18 lines>...
|         _env=env,
|     )
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/vcs_versioning/_get_version_impl.py", line 339, in get_version
|     _version_missing(config)
|     ~~~~~~~~~~~~~~~~^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/vcs_versioning/_get_version_impl.py", line 263, in _version_missing
|     raise LookupError(error_msg)
| LookupError: setuptools-scm was unable to detect version for /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/sources.
| 
| Make sure you're either building from a fully intact git repository or PyPI tarballs. Most other sources (such as GitHub's tarballs, a git checkout without the .git folder) don't contain the necessary metadata and will not work.
| 
| For example, if you're using pip, instead of https://github.com/user/proj/archive/master.zip use git+https://github.com/user/proj.git#egg=proj
| 
| Alternatively, set the version with the environment variable SETUPTOOLS_SCM_PRETEND_VERSION_FOR_${NORMALIZED_DIST_NAME} as described in https://setuptools-scm.readthedocs.io/en/latest/config/
| 
| TIP pass --env-dir and --sdist-extract-dir to keep the build environment and sources, then see https://build.pypa.io/en/stable/how-to/troubleshooting.html#debug-a-failed-build for help debugging a failed build
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/temp/run.do_compile.887964:155 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/sources/setuptools_scm-10.2.2'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/temp/run.do_compile.887964, line 155
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/temp/run.do_compile.887964, line 150
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/temp/run.do_compile.887964, line 159
NOTE: recipe python3-setuptools-scm-native-10.2.2-r0: task do_compile: Failed
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| failed to load discovery EP egg-info
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/vcs_versioning/_worktree_discovery.py", line 57, in _load_discovery_factories
|     factory: DiscoveryFactory = ep.load()
|                                 ~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/recipe-sysroot-native/usr/lib/python3.14/importlib/metadata/__init__.py", line 179, in load
|     module = import_module(match.group('module'))
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/recipe-sysroot-native/usr/lib/python3.14/importlib/__init__.py", line 88, in import_module
|     return _bootstrap._gcd_import(name[level:], package, level)
|            ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "<frozen importlib._bootstrap>", line 1406, in _gcd_import
|   File "<frozen importlib._bootstrap>", line 1371, in _find_and_load
|   File "<frozen importlib._bootstrap>", line 1342, in _find_and_load_unlocked
|   File "<frozen importlib._bootstrap>", line 938, in _load_unlocked
|   File "<frozen importlib._bootstrap_external>", line 759, in exec_module
|   File "<frozen importlib._bootstrap>", line 491, in _call_with_frames_removed
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/sources/setuptools_scm-10.2.2/src/setuptools_scm/_integration/_discover.py", line 19, in <module>
|     from vcs_versioning._fallback_workdir import discover_pkginfo as discover_pkginfo
| ImportError: cannot import name 'discover_pkginfo' from 'vcs_versioning._fallback_workdir' (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/vcs_versioning/_fallback_workdir.py)
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
|     main()
|     ~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
|     json_out["return_val"] = hook(**hook_input["kwargs"])
|                              ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
|     return hook(config_settings)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 333, in get_requires_for_build_wheel
|     return self._get_build_requires(config_settings, requirements=[])
|            ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 301, in _get_build_requires
|     self.run_setup()
|     ~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 317, in run_setup
|     exec(code, locals())  # noqa: S102 # exec is intentional here
|     ~~~~^^^^^^^^^^^^^^^^
|   File "<string>", line 49, in <module>
|   File "<string>", line 36, in _package_version
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/sources/setuptools_scm-10.2.2/src/setuptools_scm/_get_version.py", line 59, in get_version
|     return _get_version_public(
|         root=root,
|     ...<18 lines>...
|         _env=env,
|     )
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/vcs_versioning/_get_version_impl.py", line 339, in get_version
|     _version_missing(config)
|     ~~~~~~~~~~~~~~~~^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/vcs_versioning/_get_version_impl.py", line 263, in _version_missing
|     raise LookupError(error_msg)
| LookupError: setuptools-scm was unable to detect version for /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/sources.
| 
| Make sure you're either building from a fully intact git repository or PyPI tarballs. Most other sources (such as GitHub's tarballs, a git checkout without the .git folder) don't contain the necessary metadata and will not work.
| 
| For example, if you're using pip, instead of https://github.com/user/proj/archive/master.zip use git+https://github.com/user/proj.git#egg=proj
| 
| Alternatively, set the version with the environment variable SETUPTOOLS_SCM_PRETEND_VERSION_FOR_${NORMALIZED_DIST_NAME} as described in https://setuptools-scm.readthedocs.io/en/latest/config/
| 
| TIP pass --env-dir and --sdist-extract-dir to keep the build environment and sources, then see https://build.pypa.io/en/stable/how-to/troubleshooting.html#debug-a-failed-build for help debugging a failed build
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/temp/run.do_compile.888063:152 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/sources/setuptools_scm-10.2.2'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/temp/run.do_compile.888063, line 152
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/temp/run.do_compile.888063, line 147
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/temp/run.do_compile.888063, line 164
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2040 tasks of which 2007 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260902050955.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260902050955.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/temp/log.do_compile.887964
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/temp/log.do_compile.888063
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-scm-native-10.2.2-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/temp/run.do_compile.887964' failed with exit code 1
ERROR: python3-setuptools-scm-10.2.2-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/temp/run.do_compile.888063' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.2/temp/log.do_compile.887964
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_compile) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.2/temp/log.do_compile.888063
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_compile) failed with exit code '1'

--===============8591733739696079563==--

