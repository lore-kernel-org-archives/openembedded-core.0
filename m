Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC00C8300C
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:18 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.24029.1677681915559959995
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZHoqek4U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101869da2741f-aeac1912-b8f1-4111-9e00-273b854c50a9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vYpLBwHwfxc730hl1NFy8kZGygLHUYuISLlbqaA092E=;
	b=ZHoqek4U0Rl6XaaRrqHNaXZd/yarJW7/5qX/Fpo4ounDKXJmbFNaHi4wyD0J8Tm/
	nUZGV9S17hUgce9r3SC8JPUKlaWk3kveQyFpUlgkE7fnO+HhqmPWxyUkFVKemMJ+4wd
	1TtaB32p7Wf26f/wBSvumhOJgDuCXwFA8+hvOFLU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vYpLBwHwfxc730hl1NFy8kZGygLHUYuISLlbqaA092E=;
	b=Q77cVQWCOBZ91xS5OlgCjjnBfcNaWyKXdGWDhfyMkL7hCTcwL45wcm9SJ+JQoMyA
	6BM9mf1EhpJyJX2H6coDcqqmXfPGloGa/6MIXbtcumTdcYvduGzh4NuIpoFG/i6LJiT
	tNmwyuX3eCxR3LWXFUoMf/+ZbhDAm7mtncathNZc=
Content-Type: multipart/mixed; boundary="===============5364139313790770239=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 0f4a875b05feb44426a2d43146f5e3c6ea5f8038
 SUCCEEDED
Message-ID: <010101869da2741f-aeac1912-b8f1-4111-9e00-273b854c50a9-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177920

--===============5364139313790770239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *0f4a875b05feb44426a2d43146f5e3c6ea5f8038* has Succeeded.

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
--===============5364139313790770239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+590d81bb5f" to "1.0+gitrAUTOINC+0f4a875b05"
packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+590d81bb5f [default] to 1.0+gitrAUTOINC+0f4a875b05 [default]
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+590d81bb5f" to "1.0+gitrAUTOINC+0f4a875b05"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+590d81bb5f to 1.0+gitr0+0f4a875b05
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+590d81bb5f" to "1.0+gitrAUTOINC+0f4a875b05"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+590d81bb5f to 1.0+gitr0+0f4a875b05
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+590d81bb5f" to "1.0+gitrAUTOINC+0f4a875b05"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+590d81bb5f to 1.0+gitr0+0f4a875b05
packages/core2-32-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+590d81bb5f-r0'])", added "piglit (['= 1.0+gitr0+0f4a875b05-r0'])"
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+590d81bb5f" to "1.0+gitrAUTOINC+0f4a875b05"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+590d81bb5f to 1.0+gitr0+0f4a875b05
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+590d81bb5f" to "1.0+gitrAUTOINC+0f4a875b05"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+590d81bb5f to 1.0+gitr0+0f4a875b05
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+590d81bb5f" to "1.0+gitrAUTOINC+0f4a875b05"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+590d81bb5f to 1.0+gitr0+0f4a875b05
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+590d81bb5f-r0'])", added "piglit-dev (['= 1.0+gitr0+0f4a875b05-r0'])"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+590d81bb5f" to "1.0+gitrAUTOINC+0f4a875b05"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+590d81bb5f to 1.0+gitr0+0f4a875b05
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+590d81bb5f" to "1.0+gitrAUTOINC+0f4a875b05"
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/glsl-1.10/preprocessor/unary-op-minus-define.shader_test"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+590d81bb5f to 1.0+gitr0+0f4a875b05
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2048227639 to 2048227971 (+0%)

--===============5364139313790770239==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSBiNWY2MjcyYzlkMmNlNDhkY2IyODg4MjJhOTM1ODMyNWU3Yjk2MzdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAxMzo0ODoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBp
Z2xpdDogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3BpZ2xpdC9waWdsaXRfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWds
aXRfZ2l0LmJiCmluZGV4IGVkYmNhNjk0MTMuLmM1NTM3MTU0YWUgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKQEAgLTEzLDcgKzEzLDcgQEAgU1JDX1VSSSA9
ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvcGlnbGl0LmdpdDtwcm90b2NvbD1o
dHRwczticmFuY2g9bWEKICAgICAgICAgICAgIgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIx
IgogCi1TUkNSRVYgPSAiNTkwZDgxYmI1ZmEyMTkzNTMxMDQ5ODAxMDhlOWYxYWEyYjFkMWI2YiIK
K1NSQ1JFViA9ICIwZjRhODc1YjA1ZmViNDQ0MjZhMmQ0MzE0NmY1ZTNjNmVhNWY4MDM4IgogIyAo
d2hlbiBQViBnb2VzIGFib3ZlIDEuMCByZW1vdmUgdGhlIHRyYWlsaW5nIHIpCiBQViA9ICIxLjAr
Z2l0ciR7U1JDUFZ9IgogCi0tIAoyLjM5LjIKCg==

--===============5364139313790770239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (894 cached, 1 parsed). 1697 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-cad3a2e80b0782d7c22d73eee312e28e089a1113"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cad3a2e80b0782d7c22d73eee312e28e089a1113"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 168 Local 161 Mirrors 0 Missed 7 Current 384 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1648 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_fetch: Succeeded
NOTE: Running task 1950 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1951 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_unpack: Succeeded
NOTE: Running task 1952 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_patch: Succeeded
NOTE: Running task 1953 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1954 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1955 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_populate_lic: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1956 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_configure: Succeeded
NOTE: Running task 1957 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_compile: Succeeded
NOTE: Running task 1958 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_install: Succeeded
NOTE: Running task 1959 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1960 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_package: Succeeded
NOTE: Running task 1961 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0f4a875b05-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1961 tasks of which 1948 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: piglit-1.0+gitrAUTOINC+0f4a875b05-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+590d81bb5f-r0 to 0:1.0+gitr0+0f4a875b05-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0f4a875b05-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+590d81bb5f-r0 to 0:1.0+gitr0+0f4a875b05-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0f4a875b05-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+590d81bb5f-r0 to 0:1.0+gitr0+0f4a875b05-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0f4a875b05-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+590d81bb5f-r0 to 0:1.0+gitr0+0f4a875b05-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0f4a875b05-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+590d81bb5f-r0 to 0:1.0+gitr0+0f4a875b05-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0f4a875b05-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+590d81bb5f-r0 to 0:1.0+gitr0+0f4a875b05-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0f4a875b05-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+590d81bb5f-r0 to 0:1.0+gitr0+0f4a875b05-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0f4a875b05-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+590d81bb5f-r0 to 0:1.0+gitr0+0f4a875b05-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0f4a875b05-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/piglit/1.0+gitrAUTOINC+0f4a875b05-r0/temp/log.do_packagedata.2574456
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============5364139313790770239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+590d81bb5f to 1.0+gitr0+0f4a875b05
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+590d81bb5f to 1.0+gitr0+0f4a875b05
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+590d81bb5f to 1.0+gitr0+0f4a875b05
packages/core2-32-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+590d81bb5f-r0'])", added "piglit (['= 1.0+gitr0+0f4a875b05-r0'])"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+590d81bb5f to 1.0+gitr0+0f4a875b05
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+590d81bb5f to 1.0+gitr0+0f4a875b05
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+590d81bb5f to 1.0+gitr0+0f4a875b05
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+590d81bb5f-r0'])", added "piglit-dev (['= 1.0+gitr0+0f4a875b05-r0'])"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+590d81bb5f to 1.0+gitr0+0f4a875b05
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+590d81bb5f to 1.0+gitr0+0f4a875b05
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/glsl-1.10/preprocessor/unary-op-minus-define.shader_test"

--===============5364139313790770239==--

