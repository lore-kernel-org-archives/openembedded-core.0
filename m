Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A47C63707
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:38 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web12.873.1667349632828606595
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=juP/HS4j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018435c85f1e-97d17001-f2fa-4690-94a1-3f8b872a7377-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=m0kUgwDO3WD66dWRYG2rVex8VmdC+8amj11uaGeI6xI=;
	b=juP/HS4jDEOb3Ckn1NV0WlLfvFfRHZF3MmIhg/CDUFGsGCeZBGjiYTK4mqyfw9E9
	Od3F9r0gpZJb5nTt+6o72RPrdxp2PdAmOobiHUD0BcTULGu5BjDBkeIpnSp5Wg7RgQq
	cKDdVHBkZS/LqPcVAIU8Gx5Hl+bqu/rZ7KsbA+tE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=m0kUgwDO3WD66dWRYG2rVex8VmdC+8amj11uaGeI6xI=;
	b=EEt7JacHEURv3CR+GVXwopEKFMlxi+UF+jsfOZc6Rtg5x9qpOrqhYFYHvqtxoUDo
	/1xkOHf1RmX9S1xAnE76xlPsBtHjsCM3MKURKAgH7uqDb+KwhHSJdDPl+oYRw0mTc0B
	Yf3eqjWlkFnuumXKyrDV7Dbg0jDzgue7xCwwahHI=
Content-Type: multipart/mixed; boundary="===============5171576189739918640=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 1cd716180cfb6ef0c1fc54702460ef49e5115791
 SUCCEEDED
Message-ID: <0101018435c85f1e-97d17001-f2fa-4690-94a1-3f8b872a7377-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172478

--===============5171576189739918640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *1cd716180cfb6ef0c1fc54702460ef49e5115791* has Succeeded.

Next steps:
    - apply the patch: git am 0001-piglit-upgrade-to-latest-revision.patch
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
--===============5171576189739918640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+80465078a0" to "1.0+gitrAUTOINC+1cd716180c"
packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+80465078a0 [default] to 1.0+gitrAUTOINC+1cd716180c [default]
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+80465078a0" to "1.0+gitrAUTOINC+1cd716180c"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+80465078a0 to 1.0+gitr0+1cd716180c
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+80465078a0" to "1.0+gitrAUTOINC+1cd716180c"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+80465078a0 to 1.0+gitr0+1cd716180c
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+80465078a0" to "1.0+gitrAUTOINC+1cd716180c"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+80465078a0 to 1.0+gitr0+1cd716180c
packages/core2-32-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+80465078a0-r0'])", added "piglit (['= 1.0+gitr0+1cd716180c-r0'])"
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+80465078a0" to "1.0+gitrAUTOINC+1cd716180c"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+80465078a0 to 1.0+gitr0+1cd716180c
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+80465078a0" to "1.0+gitrAUTOINC+1cd716180c"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+80465078a0 to 1.0+gitr0+1cd716180c
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+80465078a0" to "1.0+gitrAUTOINC+1cd716180c"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+80465078a0 to 1.0+gitr0+1cd716180c
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+80465078a0" to "1.0+gitrAUTOINC+1cd716180c"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+80465078a0 to 1.0+gitr0+1cd716180c
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+80465078a0-r0'])", added "piglit-dev (['= 1.0+gitr0+1cd716180c-r0'])"
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+80465078a0" to "1.0+gitrAUTOINC+1cd716180c"
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2048119895 to 2048190259 (+0%)
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+80465078a0 to 1.0+gitr0+1cd716180c
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/ext_debug_label-object-label_gl /usr/lib/piglit/bin/ext_debug_label-object-label_gles2 /usr/lib/piglit/bin/ext_debug_label-object-label_gles3"

--===============5171576189739918640==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSAyNmMzNGFkMGUyZTkxZGVlMWMzN2NiZDQwMDJiMWJmZDJlZThjODJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxNjozNDo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBp
Z2xpdDogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3BpZ2xpdC9waWdsaXRfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWds
aXRfZ2l0LmJiCmluZGV4IGM5Y2Y1Nzk1ZTkuLjhkNjZkZjRlMDkgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKQEAgLTE0LDcgKzE0LDcgQEAgU1JDX1VSSSA9
ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvcGlnbGl0LmdpdDtwcm90b2NvbD1o
dHRwczticmFuY2g9bWEKICAgICAgICAgICAgIgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIx
IgogCi1TUkNSRVYgPSAiODA0NjUwNzhhMGFlOGYxMjQxMWRiNjY4NTBlZTE0ZjAxNzk2MmZhNyIK
K1NSQ1JFViA9ICIxY2Q3MTYxODBjZmI2ZWYwYzFmYzU0NzAyNDYwZWY0OWU1MTE1NzkxIgogIyAo
d2hlbiBQViBnb2VzIGFib3ZlIDEuMCByZW1vdmUgdGhlIHRyYWlsaW5nIHIpCiBQViA9ICIxLjAr
Z2l0ciR7U1JDUFZ9IgogCi0tIAoyLjMxLjEKCg==

--===============5171576189739918640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+80465078a0 to 1.0+gitr0+1cd716180c
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+80465078a0 to 1.0+gitr0+1cd716180c
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+80465078a0 to 1.0+gitr0+1cd716180c
packages/core2-32-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+80465078a0-r0'])", added "piglit (['= 1.0+gitr0+1cd716180c-r0'])"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+80465078a0 to 1.0+gitr0+1cd716180c
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+80465078a0 to 1.0+gitr0+1cd716180c
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+80465078a0 to 1.0+gitr0+1cd716180c
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+80465078a0-r0'])", added "piglit-dev (['= 1.0+gitr0+1cd716180c-r0'])"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+80465078a0 to 1.0+gitr0+1cd716180c
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/ext_debug_label-object-label_gl /usr/lib/piglit/bin/ext_debug_label-object-label_gles3 /usr/lib/piglit/bin/ext_debug_label-object-label_gles2"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+80465078a0 to 1.0+gitr0+1cd716180c

--===============5171576189739918640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:db6173205488869283fae08471dd4e34c307d67d"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 44 Local 19 Mirrors 0 Missed 25 Current 505 (43% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 509 of 549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running task 1485 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1545 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1618 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1688 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1690 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1691 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_fetch)
NOTE: Running task 1789 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: Running task 1878 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1879 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 1880 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1881 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1882 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1883 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1884 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1885 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_unpack)
NOTE: Running task 1888 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1907 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe python3-mako-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1908 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1909 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: Running task 1910 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_unpack: Succeeded
NOTE: Running task 1911 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1912 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1913 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1914 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1915 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1916 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1917 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1918 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: Running task 1919 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1920 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_populate_lic: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1921 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to d752c98a788a47a93c744aa78ecda1417312f9a6827fcfb1b8193c915874986a
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1922 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1923 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_install)
NOTE: recipe python3-mako-1.2.2-r0: task do_install: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 1924 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_package)
NOTE: recipe python3-mako-1.2.2-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1925 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1926 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 1927 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.2-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1928 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1929 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe python3-mako-1.2.2-r0: task do_packagedata: Failed
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1929 tasks of which 1890 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-mako/1.2.2-r0/temp/log.do_packagedata.1801779
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_packagedata) failed with exit code '1'

--===============5171576189739918640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1665 targets, 49 skipped, 0 masked, 0 errors.
Removing 72 recipes from the core2-32 sysroot...done.
Removing 81 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:db6173205488869283fae08471dd4e34c307d67d"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 333 Local 300 Mirrors 0 Missed 33 Current 188 (90% match, 93% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 190 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 191 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 192 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 193 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 194 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 221 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 223 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 224 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 234 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 235 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_populate_sysroot_setscene)
NOTE: Running task 807 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 809 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_fetch)
NOTE: Running task 812 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 815 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_fetch)
NOTE: Running task 827 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 838 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_write_config)
NOTE: Running task 839 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 841 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 842 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_fetch)
NOTE: Running task 848 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_write_config)
NOTE: Running task 875 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_fetch: Started
NOTE: Running task 908 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.37-r0: task do_write_config: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 909 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 910 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_write_config: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_fetch: Succeeded
NOTE: Running task 911 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_unpack)
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: Running task 912 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.37-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 913 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_unpack: Started
NOTE: Running setscene task 249 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 250 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 251 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.3.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_write_config: Succeeded
NOTE: Running task 914 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: recipe python3-mako-1.2.2-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 259 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: Running task 923 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 264 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 266 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 267 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-mako-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 268 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: Running task 932 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 274 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 277 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 281 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 283 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 285 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_patch: Started
NOTE: Running task 938 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 949 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_patch)
NOTE: Running task 950 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_patch: Started
NOTE: Running task 955 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 978 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 304 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running task 987 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 307 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 312 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 314 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 316 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 319 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 324 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1013 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 326 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 331 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe python3-mako-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 338 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 342 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 346 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 347 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 349 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 357 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 359 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 362 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 370 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 373 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1065 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: Running task 1066 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 376 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 380 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 381 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_setscene)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 387 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running task 1092 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 392 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 393 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 396 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_packagedata_setscene)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 404 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 405 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 409 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 417 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1105 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1106 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1107 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 424 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 425 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 428 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_populate_lic: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running setscene task 432 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running task 1116 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 438 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_populate_lic: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to d752c98a788a47a93c744aa78ecda1417312f9a6827fcfb1b8193c915874986a
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 465 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 474 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 491 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 498 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 500 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 503 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 508 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 514 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 518 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 519 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1679 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1689 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1698 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1744 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1805 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1806 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1807 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe python3-mako-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_configure: Started
NOTE: Running task 1808 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1809 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1810 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe python3-mako-1.2.2-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_configure: Succeeded
NOTE: Running task 1811 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_compile)
NOTE: recipe xkeyboard-config-2.37-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_compile: Succeeded
NOTE: Running task 1812 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_install)
NOTE: recipe xkeyboard-config-2.37-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1813 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_install)
NOTE: recipe python3-mako-1.2.2-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1814 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 1815 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_package)
NOTE: recipe python3-mako-1.2.2-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_install: Succeeded
NOTE: Running task 1816 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_populate_sysroot)
NOTE: Running task 1817 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_package)
NOTE: recipe xkeyboard-config-2.37-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1818 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1819 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1820 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1821 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: Running task 1822 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_configure: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 1823 of 1854 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.2-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_packagedata: Failed
NOTE: recipe libxkbcommon-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_package: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1823 tasks of which 1766 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-mako/1.2.2-r0/temp/log.do_packagedata.1996716
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_packagedata) failed with exit code '1'

--===============5171576189739918640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:db6173205488869283fae08471dd4e34c307d67d"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 44 Local 19 Mirrors 0 Missed 25 Current 501 (43% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 505 of 545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running task 1475 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1535 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1607 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1676 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1678 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1680 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_fetch)
NOTE: Running task 1775 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: Running task 1864 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1865 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 1866 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1867 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1868 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1869 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1870 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1871 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_unpack)
NOTE: Running task 1874 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1893 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe python3-mako-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1894 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1895 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1896 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: Running task 1897 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1898 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_configure)
NOTE: Running task 1899 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_unpack: Succeeded
NOTE: Running task 1900 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1901 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1902 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1903 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_patch: Succeeded
NOTE: Running task 1904 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1905 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1906 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1907 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to d752c98a788a47a93c744aa78ecda1417312f9a6827fcfb1b8193c915874986a
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1908 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1909 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_install)
NOTE: recipe python3-mako-1.2.2-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 1910 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_package)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1911 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe python3-mako-1.2.2-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1912 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 1913 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.2-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1914 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1915 of 1940 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_packagedata: Failed
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1915 tasks of which 1876 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-mako/1.2.2-r0/temp/log.do_packagedata.1860554
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_packagedata) failed with exit code '1'

--===============5171576189739918640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1664 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:db6173205488869283fae08471dd4e34c307d67d"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 185 Local 178 Mirrors 0 Missed 7 Current 364 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1622 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_fetch: Succeeded
NOTE: Running task 1940 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1941 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_unpack: Succeeded
NOTE: Running task 1942 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_patch: Succeeded
NOTE: Running task 1943 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1944 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1945 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1946 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_populate_lic: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_configure: Succeeded
NOTE: Running task 1947 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_compile: Succeeded
NOTE: Running task 1948 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_install: Started
Bitbake still alive (no events for 600s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_install: Succeeded
NOTE: Running task 1949 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1950 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_package: Succeeded
NOTE: Running task 1951 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1951 tasks of which 1938 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: piglit-1.0+gitrAUTOINC+1cd716180c-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+80465078a0-r0 to 0:1.0+gitr0+1cd716180c-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+1cd716180c-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+80465078a0-r0 to 0:1.0+gitr0+1cd716180c-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+1cd716180c-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+80465078a0-r0 to 0:1.0+gitr0+1cd716180c-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+1cd716180c-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+80465078a0-r0 to 0:1.0+gitr0+1cd716180c-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+1cd716180c-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+80465078a0-r0 to 0:1.0+gitr0+1cd716180c-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+1cd716180c-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+80465078a0-r0 to 0:1.0+gitr0+1cd716180c-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+1cd716180c-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+80465078a0-r0 to 0:1.0+gitr0+1cd716180c-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+1cd716180c-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+80465078a0-r0 to 0:1.0+gitr0+1cd716180c-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+1cd716180c-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/piglit/1.0+gitrAUTOINC+1cd716180c-r0/temp/log.do_packagedata.1654912
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============5171576189739918640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:db6173205488869283fae08471dd4e34c307d67d"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 44 Local 19 Mirrors 0 Missed 25 Current 505 (43% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 509 of 549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running task 1485 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1545 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1618 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1688 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1690 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1691 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_fetch)
NOTE: Running task 1789 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: Running task 1878 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1879 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 1880 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1881 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: Running task 1882 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1883 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: Running task 1884 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1885 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_unpack)
NOTE: Running task 1888 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1907 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1908 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_patch)
NOTE: recipe python3-mako-1.2.2-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1909 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1910 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1911 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1912 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_configure)
NOTE: Running task 1913 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_unpack: Succeeded
NOTE: Running task 1914 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1915 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_patch: Started
NOTE: Running task 1916 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1917 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_patch: Succeeded
NOTE: Running task 1918 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1919 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1920 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_generate_toolchain_file: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_populate_lic: Started
NOTE: Running task 1921 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to d752c98a788a47a93c744aa78ecda1417312f9a6827fcfb1b8193c915874986a
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1922 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1923 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_install)
NOTE: recipe python3-mako-1.2.2-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 1924 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_package)
NOTE: recipe python3-mako-1.2.2-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1925 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1926 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_package: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1927 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1928 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: Running task 1929 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_packagedata: Failed
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1929 tasks of which 1890 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-mako/1.2.2-r0/temp/log.do_packagedata.1920827
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_packagedata) failed with exit code '1'

--===============5171576189739918640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1664 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:db6173205488869283fae08471dd4e34c307d67d"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 43 Local 18 Mirrors 0 Missed 25 Current 506 (41% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 509 of 549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running task 1485 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1545 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1618 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1688 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1690 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1692 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_fetch)
NOTE: Running task 1789 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: Running task 1878 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 1879 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 1880 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1881 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1882 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1883 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1884 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1885 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_unpack)
NOTE: Running task 1888 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1907 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe python3-mako-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: Running task 1908 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_patch)
NOTE: recipe python3-mako-1.2.2-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1909 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1910 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1911 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1912 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: Running task 1913 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_unpack: Succeeded
NOTE: Running task 1914 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_configure: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1915 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_compile)
NOTE: Running task 1916 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.2-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1917 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1918 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_patch: Succeeded
NOTE: Running task 1919 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1920 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1921 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_populate_lic: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1922 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to d752c98a788a47a93c744aa78ecda1417312f9a6827fcfb1b8193c915874986a
NOTE: recipe piglit-1.0+gitrAUTOINC+1cd716180c-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1923 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_install)
NOTE: recipe python3-mako-1.2.2-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 1924 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_package)
NOTE: recipe python3-mako-1.2.2-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1925 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1926 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1927 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1928 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe python3-mako-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 1929 of 1954 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_packagedata: Failed
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1929 tasks of which 1890 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 9 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.2.3-r0 to 0:1.2.2-r0) [version-going-backwards]
ERROR: python3-mako-1.2.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-mako/1.2.2-r0/temp/log.do_packagedata.1750815
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_packagedata) failed with exit code '1'

--===============5171576189739918640==--

