Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B70C88E6A
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 05:40:45 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13648.1789364441909641572
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 22:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BV7VgfsU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ra3y1RK1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a09e6e9cc9-baaa5c57-e0b1-4cb0-a2fe-048831a3da85-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789364444;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YGhQHGY7l4yAfqZ/di8IfCBrAIdLsE7TXY+IjNz6KyA=;
	b=BV7VgfsU7ooTFSYdplv9ZqX79/S2znsVeZp5oLfr7tVS2DpBVdL9VeLyqPxH7ryJ
	d46O0SICoY05Ix4GblZ7NhDtBf9rvK3dk/+TpPtB37VREVF7lHG3pbUgzzYA/yETQKl
	iW00VQZ70ot6w08jqrTihKs3V/a8P4dVl5AHWUZg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789364444;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YGhQHGY7l4yAfqZ/di8IfCBrAIdLsE7TXY+IjNz6KyA=;
	b=Ra3y1RK1am+Zt1MkqV+KfdVz9ADqnO2iba5URyDL/yzmQC9ou2TjS/P807P2KqSL
	01/4OUA0QVF6iiG73QrIg/nk0aUiI2KA3++EDgCat9HMdEEyPSTpIX5iGP3voLUCs2J
	4iMqZtk/Ty+Qm4HoiKEAj+5yKQ38CZ1rfE51EuOM=
Content-Type: multipart/mixed; boundary="===============3454352168539454798=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 10.3.0 FAILED
Message-ID: <010101a09e6e9cc9-baaa5c57-e0b1-4cb0-a2fe-048831a3da85-000000@us-west-2.amazonses.com>
Date: Mon, 14 Sep 2026 05:40:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.14-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245751

--===============3454352168539454798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-scm* to *10.3.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-setuptools-scm-upgrade-10.2.3-10.3.0.patch
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
From bb33fd6622b820b335070674453f04449d2d10a5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 14 Sep 2026 05:19:39 +0000
Subject: [PATCH] python3-setuptools-scm: upgrade 10.2.3 -> 10.3.0

Source: CHANGELOG.md

## 10.3.0 (2026-09-12)

### Deprecated

- Emit a ``DeprecationWarning`` when the ``setuptools.file_finders`` entry point is invoked for a project that does not configure setuptools-scm. The entry point will be removed in a future major release. ([#1407](https://github.com/pypa/setuptools-scm/issues/1407))

### Fixed

- Run the `setuptools.file_finders` hook inside a setuptools-scm override context. It previously resolved settings under the `VCS_VERSIONING` prefix only, so documented variables such as `SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT` and `SETUPTOOLS_SCM_HG_COMMAND` were ignored when finding files.

  When version inference has already run and found no SCM checkout, the `egg_info` mixin now tells the file finders so, rather than letting `walk_revctrl()` re-probe every backend for a repository known to be absent. ([#1212](https://github.com/pypa/setuptools-scm/issues/1212))
---
 ...etuptools-scm_10.2.3.bb => python3-setuptools-scm_10.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_10.2.3.bb => python3-setuptools-scm_10.3.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb b/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb
index 0af4bd24f5..f3d5a233b8 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "f179ed3e2a63cf5823e5ee9aa9ca08386219400443a0553224d72dde3f206b44"
+SRC_URI[sha256sum] = "7177457a181c3af30c1a524e6f919960665f9f153a39fe04906fe543c7eb5f80"
 
 PYPI_PACKAGE = "setuptools_scm"
 
-- 
2.47.1


--===============3454352168539454798==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-scm-upgrade-10.2.3-10.3.0.patch"

RnJvbSBiYjMzZmQ2NjIyYjgyMGIzMzUwNzA2NzQ0NTNmMDQ0NDlkMmQxMGE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTQgU2VwIDIwMjYgMDU6MTk6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHMtc2NtOiB1cGdyYWRlIDEwLjIuMyAtPiAxMC4zLjAKClNvdXJjZTog
Q0hBTkdFTE9HLm1kCgojIyAxMC4zLjAgKDIwMjYtMDktMTIpCgojIyMgRGVwcmVjYXRlZAoKLSBF
bWl0IGEgYGBEZXByZWNhdGlvbldhcm5pbmdgYCB3aGVuIHRoZSBgYHNldHVwdG9vbHMuZmlsZV9m
aW5kZXJzYGAgZW50cnkgcG9pbnQgaXMgaW52b2tlZCBmb3IgYSBwcm9qZWN0IHRoYXQgZG9lcyBu
b3QgY29uZmlndXJlIHNldHVwdG9vbHMtc2NtLiBUaGUgZW50cnkgcG9pbnQgd2lsbCBiZSByZW1v
dmVkIGluIGEgZnV0dXJlIG1ham9yIHJlbGVhc2UuIChbIzE0MDddKGh0dHBzOi8vZ2l0aHViLmNv
bS9weXBhL3NldHVwdG9vbHMtc2NtL2lzc3Vlcy8xNDA3KSkKCiMjIyBGaXhlZAoKLSBSdW4gdGhl
IGBzZXR1cHRvb2xzLmZpbGVfZmluZGVyc2AgaG9vayBpbnNpZGUgYSBzZXR1cHRvb2xzLXNjbSBv
dmVycmlkZSBjb250ZXh0LiBJdCBwcmV2aW91c2x5IHJlc29sdmVkIHNldHRpbmdzIHVuZGVyIHRo
ZSBgVkNTX1ZFUlNJT05JTkdgIHByZWZpeCBvbmx5LCBzbyBkb2N1bWVudGVkIHZhcmlhYmxlcyBz
dWNoIGFzIGBTRVRVUFRPT0xTX1NDTV9TVUJQUk9DRVNTX1RJTUVPVVRgIGFuZCBgU0VUVVBUT09M
U19TQ01fSEdfQ09NTUFORGAgd2VyZSBpZ25vcmVkIHdoZW4gZmluZGluZyBmaWxlcy4KCiAgV2hl
biB2ZXJzaW9uIGluZmVyZW5jZSBoYXMgYWxyZWFkeSBydW4gYW5kIGZvdW5kIG5vIFNDTSBjaGVj
a291dCwgdGhlIGBlZ2dfaW5mb2AgbWl4aW4gbm93IHRlbGxzIHRoZSBmaWxlIGZpbmRlcnMgc28s
IHJhdGhlciB0aGFuIGxldHRpbmcgYHdhbGtfcmV2Y3RybCgpYCByZS1wcm9iZSBldmVyeSBiYWNr
ZW5kIGZvciBhIHJlcG9zaXRvcnkga25vd24gdG8gYmUgYWJzZW50LiAoWyMxMjEyXShodHRwczov
L2dpdGh1Yi5jb20vcHlwYS9zZXR1cHRvb2xzLXNjbS9pc3N1ZXMvMTIxMikpCi0tLQogLi4uZXR1
cHRvb2xzLXNjbV8xMC4yLjMuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzLXNjbV8xMC4zLjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zZXR1cHRvb2xzLXNj
bV8xMC4yLjMuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzLXNjbV8xMC4zLjAuYmJ9ICg4OSUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9v
bHMtc2NtXzEwLjIuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
ZXR1cHRvb2xzLXNjbV8xMC4zLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtc2NtXzEwLjIu
My5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMtc2NtXzEwLjMuMC5iYgppbmRleCAwYWY0YmQyNGY1Li5mM2Q1YTIzM2I4IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1zY21f
MTAuMi4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1
cHRvb2xzLXNjbV8xMC4zLjAuYmIKQEAgLTYsNyArNiw3IEBAIGFyZ3VtZW50IG9yIGluIGEgU0NN
IG1hbmFnZWQgZmlsZS4iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0U7bWQ1PTgzOGMzNjZmNjliNzJjNWRmMDVjOTZkZmY3OWIzNWYyIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZjE3OWVkM2UyYTYzY2Y1ODIzZTVlZTlhYTljYTA4Mzg2MjE5NDAw
NDQzYTA1NTMyMjRkNzJkZGUzZjIwNmI0NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3MTc3NDU3
YTE4MWMzYWYzMGMxYTUyNGU2ZjkxOTk2MDY2NWY5ZjE1M2EzOWZlMDQ5MDZmZTU0M2M3ZWI1Zjgw
IgogCiBQWVBJX1BBQ0tBR0UgPSAic2V0dXB0b29sc19zY20iCiAKLS0gCjIuNDcuMQoK

--===============3454352168539454798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1990 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-2937ced86b511b8663d4a1bad96aac280f165f1d"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:2937ced86b511b8663d4a1bad96aac280f165f1d"
meta-yocto-bsp       
meta-poky            = "master:7e41504cd63b099b214f10d92cfdaf358ab98c5f"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 460 Local 433 Mirrors 0 Missed 27 Current 340 (94% match, 96% complete)
done.
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 4 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 480 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 491 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 596 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 697 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 698 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 713 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.15.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 725 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 727 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-vcs-versioning-native-2.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pip-native-26.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 740 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 741 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_package_setscene)
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pip-native-26.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 742 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 744 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 746 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 747 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 749 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 750 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 754 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 755 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pip-native-26.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-vcs-versioning-native-2.3.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-vcs-versioning-native-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pip-native-26.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.3.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 758 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 760 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-vcs-versioning-native-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.98.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/cargo_1.98.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1305 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_recipe_qa)
NOTE: Running task 1314 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_fetch)
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1365 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.15.0.bb:do_fetch)
NOTE: recipe libstd-rs-1.98.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 1412 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb:do_fetch)
NOTE: recipe cargo-native-1.98.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-vcs-versioning-native-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.98.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1523 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_recipe_qa)
NOTE: recipe python3-setuptools-scm-native-10.3.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-packaging-26.3-r0: task do_package_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_fetch: Succeeded
NOTE: Running task 1658 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_fetch)
NOTE: Running task 1666 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_unpack)
NOTE: recipe python3-setuptools-scm-10.3.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_fetch: Started
NOTE: Running task 1881 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Succeeded
NOTE: recipe cargo-native-1.98.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1894 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_unpack)
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_unpack: Started
NOTE: Running setscene task 775 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/cargo_1.98.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 777 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust_1.98.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgit2/libgit2_1.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_unpack: Succeeded
NOTE: Running task 1914 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_patch)
NOTE: recipe python3-setuptools-scm-10.3.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_fetch: Succeeded
NOTE: Running task 1915 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb:do_unpack)
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Started
NOTE: recipe ca-certificates-native-20260816-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgit2-native-1.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-native-1.98.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.3.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe rust-native-1.98.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1916 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_fetch)
NOTE: recipe python3-packaging-26.3-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 780 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1917 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_patch)
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_unpack: Started
NOTE: recipe cargo-native-1.98.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-10.3.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1920 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_fetch)
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Started
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.3.0-r0: task do_fetch: Started
NOTE: recipe ca-certificates-native-20260816-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgit2-native-1.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 784 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgit2/libgit2_1.9.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 785 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libssh2/libssh2_1.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-scm-native-10.3.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_patch: Succeeded
NOTE: Running task 1921 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_unpack)
NOTE: Running task 1922 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1923 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_rust_gen_targets)
NOTE: recipe python3-setuptools-scm-10.3.0-r0: task do_fetch: Started
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1933 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_unpack)
NOTE: Running task 1936 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe ca-certificates-native-20260816-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Succeeded
NOTE: recipe libgit2-native-1.9.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssh2-native-1.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.3.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-native-10.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-10.3.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-native-10.3.0-r0: task do_unpack: Succeeded
NOTE: recipe ca-certificates-native-20260816-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-setuptools-scm-10.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 1953 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_patch)
NOTE: recipe libgit2-native-1.9.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1960 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_patch)
NOTE: recipe libssh2-native-1.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libssh2/libssh2_1.11.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-scm-10.3.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-native-10.3.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_unpack: Succeeded
NOTE: Running task 1961 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb:do_patch)
NOTE: recipe libssh2-native-1.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_patch: Started
NOTE: recipe libssh2-native-1.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_patch: Succeeded
NOTE: Running task 1977 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb:do_rust_gen_targets)
NOTE: Running task 1979 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-scm-native-10.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1980 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1981 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_populate_lic)
NOTE: recipe python3-setuptools-scm-10.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-10.3.0-r0: task do_populate_lic: Started
NOTE: recipe python3-setuptools-scm-native-10.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1982 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_configure)
NOTE: recipe python3-setuptools-scm-native-10.3.0-r0: task do_configure: Started
NOTE: recipe rust-native-1.98.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 789 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust-source_1.98.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 790 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust_1.98.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 792 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patchelf/patchelf_git.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-scm-native-10.3.0-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rust-source-1.98.1-1.98.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1985 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_compile)
NOTE: Running task 1986 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_configure)
NOTE: recipe rust-source-1.98.1-1.98.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe patchelf-native-0.19.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-native-23.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.98.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-10.3.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-native-10.3.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-scm-10.3.0-r0: task do_populate_lic: Succeeded
NOTE: recipe rust-native-1.98.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe patchelf-native-0.19.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patchelf/patchelf_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-scm-10.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1995 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_compile)
NOTE: recipe patchelf-native-0.19.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-10.3.0-r0: task do_compile: Started
NOTE: recipe patchelf-native-0.19.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe llvm-native-23.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 796 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-tblgen-native_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_recipe_qa_setscene)
NOTE: recipe llvm-tblgen-native-23.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_fetch: Succeeded
NOTE: recipe llvm-native-23.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2009 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.15.0.bb:do_unpack)
NOTE: recipe llvm-native-23.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe llvm-tblgen-native-23.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-project-source.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 800 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-tblgen-native_git.bb:do_recipe_qa_setscene)
NOTE: recipe llvm-project-source-23.1.1-23.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe llvm-tblgen-native-23.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe llvm-project-source-23.1.1-23.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe llvm-tblgen-native-23.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_unpack: Started
NOTE: Setscene tasks completed
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
|     main()
|     ~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
|     json_out["return_val"] = hook(**hook_input["kwargs"])
|                              ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
|     return hook(config_settings)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 333, in get_requires_for_build_wheel
|     return self._get_build_requires(config_settings, requirements=[])
|            ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 301, in _get_build_requires
|     self.run_setup()
|     ~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 317, in run_setup
|     exec(code, locals())  # noqa: S102 # exec is intentional here
|     ~~~~^^^^^^^^^^^^^^^^
|   File "<string>", line 49, in <module>
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/__init__.py", line 117, in setup
|     return distutils.core.setup(**attrs)  # type: ignore[return-value]
|            ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/_distutils/core.py", line 130, in setup
|     _setup_distribution = dist = klass(attrs)
|                                  ~~~~~^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/dist.py", line 321, in __init__
|     _Distribution.__init__(self, dist_attrs)
|     ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/_distutils/dist.py", line 338, in __init__
|     self.finalize_options()
|     ~~~~~~~~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/dist.py", line 789, in finalize_options
|     for ep in sorted(loaded, key=by_order):
|               ~~~~~~^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/dist.py", line 788, in <genexpr>
|     loaded = (e.load() for e in filtered)
|               ~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/recipe-sysroot-native/usr/lib/python3.14/importlib/metadata/__init__.py", line 179, in load
|     module = import_module(match.group('module'))
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/recipe-sysroot-native/usr/lib/python3.14/importlib/__init__.py", line 88, in import_module
|     return _bootstrap._gcd_import(name[level:], package, level)
|            ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "<frozen importlib._bootstrap>", line 1406, in _gcd_import
|   File "<frozen importlib._bootstrap>", line 1371, in _find_and_load
|   File "<frozen importlib._bootstrap>", line 1342, in _find_and_load_unlocked
|   File "<frozen importlib._bootstrap>", line 938, in _load_unlocked
|   File "<frozen importlib._bootstrap_external>", line 759, in exec_module
|   File "<frozen importlib._bootstrap>", line 491, in _call_with_frames_removed
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/sources/setuptools_scm-10.3.0/src/setuptools_scm/_integration/setuptools.py", line 18, in <module>
|     from .egg_info import ScmEggInfoMixin
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/sources/setuptools_scm-10.3.0/src/setuptools_scm/_integration/egg_info.py", line 26, in <module>
|     from vcs_versioning._file_finders import scm_search_known_failed
| ImportError: cannot import name 'scm_search_known_failed' from 'vcs_versioning._file_finders' (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/vcs_versioning/_file_finders/__init__.py)
| 
| TIP pass --env-dir and --sdist-extract-dir to keep the build environment and sources, then see https://build.pypa.io/en/stable/how-to/troubleshooting.html#debug-a-failed-build for help debugging a failed build
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/temp/run.do_compile.3294718:155 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/sources/setuptools_scm-10.3.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/temp/run.do_compile.3294718, line 155
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/temp/run.do_compile.3294718, line 150
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/temp/run.do_compile.3294718, line 159
NOTE: recipe python3-setuptools-scm-native-10.3.0-r0: task do_compile: Failed
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
|     main()
|     ~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
|     json_out["return_val"] = hook(**hook_input["kwargs"])
|                              ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
|     return hook(config_settings)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 333, in get_requires_for_build_wheel
|     return self._get_build_requires(config_settings, requirements=[])
|            ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 301, in _get_build_requires
|     self.run_setup()
|     ~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 317, in run_setup
|     exec(code, locals())  # noqa: S102 # exec is intentional here
|     ~~~~^^^^^^^^^^^^^^^^
|   File "<string>", line 49, in <module>
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/__init__.py", line 117, in setup
|     return distutils.core.setup(**attrs)  # type: ignore[return-value]
|            ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/_distutils/core.py", line 130, in setup
|     _setup_distribution = dist = klass(attrs)
|                                  ~~~~~^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/dist.py", line 321, in __init__
|     _Distribution.__init__(self, dist_attrs)
|     ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/_distutils/dist.py", line 338, in __init__
|     self.finalize_options()
|     ~~~~~~~~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/dist.py", line 789, in finalize_options
|     for ep in sorted(loaded, key=by_order):
|               ~~~~~~^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/dist.py", line 788, in <genexpr>
|     loaded = (e.load() for e in filtered)
|               ~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/recipe-sysroot-native/usr/lib/python3.14/importlib/metadata/__init__.py", line 179, in load
|     module = import_module(match.group('module'))
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/recipe-sysroot-native/usr/lib/python3.14/importlib/__init__.py", line 88, in import_module
|     return _bootstrap._gcd_import(name[level:], package, level)
|            ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "<frozen importlib._bootstrap>", line 1406, in _gcd_import
|   File "<frozen importlib._bootstrap>", line 1371, in _find_and_load
|   File "<frozen importlib._bootstrap>", line 1342, in _find_and_load_unlocked
|   File "<frozen importlib._bootstrap>", line 938, in _load_unlocked
|   File "<frozen importlib._bootstrap_external>", line 759, in exec_module
|   File "<frozen importlib._bootstrap>", line 491, in _call_with_frames_removed
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/sources/setuptools_scm-10.3.0/src/setuptools_scm/_integration/setuptools.py", line 18, in <module>
|     from .egg_info import ScmEggInfoMixin
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/sources/setuptools_scm-10.3.0/src/setuptools_scm/_integration/egg_info.py", line 26, in <module>
|     from vcs_versioning._file_finders import scm_search_known_failed
| ImportError: cannot import name 'scm_search_known_failed' from 'vcs_versioning._file_finders' (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/vcs_versioning/_file_finders/__init__.py)
| 
| TIP pass --env-dir and --sdist-extract-dir to keep the build environment and sources, then see https://build.pypa.io/en/stable/how-to/troubleshooting.html#debug-a-failed-build for help debugging a failed build
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/temp/run.do_compile.3294850:152 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/sources/setuptools_scm-10.3.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/temp/run.do_compile.3294850, line 152
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/temp/run.do_compile.3294850, line 147
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/temp/run.do_compile.3294850, line 164
NOTE: recipe python3-setuptools-scm-10.3.0-r0: task do_compile: Failed
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 2050 tasks of which 2019 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260914051922.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260914051922.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/temp/log.do_compile.3294718
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/temp/log.do_compile.3294850
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-scm-native-10.3.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/temp/run.do_compile.3294718' failed with exit code 1
ERROR: python3-setuptools-scm-10.3.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/temp/run.do_compile.3294850' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.0/temp/log.do_compile.3294718
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_compile) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.0/temp/log.do_compile.3294850
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.0.bb:do_compile) failed with exit code '1'

--===============3454352168539454798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-setuptools-scm-changelog.txt"

Changelog for python3-setuptools-scm: 10.2.3 -> 10.3.0
Source: CHANGELOG.md

## 10.3.0 (2026-09-12)

### Deprecated

- Emit a ``DeprecationWarning`` when the ``setuptools.file_finders`` entry point is invoked for a project that does not configure setuptools-scm. The entry point will be removed in a future major release. ([#1407](https://github.com/pypa/setuptools-scm/issues/1407))

### Fixed

- Run the `setuptools.file_finders` hook inside a setuptools-scm override context. It previously resolved settings under the `VCS_VERSIONING` prefix only, so documented variables such as `SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT` and `SETUPTOOLS_SCM_HG_COMMAND` were ignored when finding files.

  When version inference has already run and found no SCM checkout, the `egg_info` mixin now tells the file finders so, rather than letting `walk_revctrl()` re-probe every backend for a repository known to be absent. ([#1212](https://github.com/pypa/setuptools-scm/issues/1212))

--===============3454352168539454798==--

