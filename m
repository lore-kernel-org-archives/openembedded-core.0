Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57099C7EE23
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.30010.1675272855416563684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=juP9/ga8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101860e0b23c9-9115f49d-7c71-4fc2-b2f6-cfd46d82ba32-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vxsw9FcCKNEuBBANX/EuF0/aISt6gdCEKY5kvMVCtlY=;
	b=juP9/ga8TELaJmpI/8qD3Vi5uzJn4eW9JpYDyu6WtieFJKYEBLiEtkcfMYD/l44B
	+mwGrKNmQWXmdHxEXkuV+Ur5Ek8AYehwQ7YP7CdlLu46AX8/JwQazM+T9JbB3Zo9ZkV
	sexvuVzzVPhzh4J2BG97T8VbQGCoGoJnyPFrJZTM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vxsw9FcCKNEuBBANX/EuF0/aISt6gdCEKY5kvMVCtlY=;
	b=EfaJHGJB2ZlUevzjkeSfD440dlyOu/E+ACgXu1/icEU1DP87Wo2gMRjYkruJGvFt
	jKYgZvHrCpHMsXOmaG4WKwdAOzuQjxvv/lonmqXrijGXImVGc1Ae/2DQKx6MpqxSeUG
	euMCJNwnoVqqgoYXZjdEVc2wRoRsfH1ndANqmTMI=
Content-Type: multipart/mixed; boundary="===============8200200185425393130=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] igt-gpu-tools: upgrading to 1.27.1 FAILED
Message-ID: <010101860e0b23c9-9115f49d-7c71-4fc2-b2f6-cfd46d82ba32-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176616

--===============8200200185425393130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *igt-gpu-tools* to *1.27.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-igt-gpu-tools-upgrade-1.26-1.27.1.patch
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
--===============8200200185425393130==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-igt-gpu-tools-upgrade-1.26-1.27.1.patch"

RnJvbSBlYWVmY2NlMTRiZWFkYzhiOTYwMzVhNmY2ZGQ1NjQxNDliZTJjZmRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNTowNjoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGln
dC1ncHUtdG9vbHM6IHVwZ3JhZGUgMS4yNiAtPiAxLjI3LjEKCi0tLQogLi4ubi5idWlsZC1maXgt
bWVzb24tMC42MC1jb21wYXRpYmlsaXR5LnBhdGNoIHwgMjQgLS0tLS0tLS0tLS0tLS0tLS0tLQog
Li4uL2lndC1ncHUtdG9vbHMvaWd0LWdwdS10b29sc19naXQuYmIgICAgICAgIHwgIDggKysrLS0t
LQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1n
cHUtdG9vbHMvMDAwMS1saWItbWVzb24uYnVpbGQtZml4LW1lc29uLTAuNjAtY29tcGF0aWJpbGl0
eS5wYXRjaAoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9pZ3QtZ3B1LXRvb2xz
L2lndC1ncHUtdG9vbHMvMDAwMS1saWItbWVzb24uYnVpbGQtZml4LW1lc29uLTAuNjAtY29tcGF0
aWJpbGl0eS5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1n
cHUtdG9vbHMvMDAwMS1saWItbWVzb24uYnVpbGQtZml4LW1lc29uLTAuNjAtY29tcGF0aWJpbGl0
eS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZTdjNzgyMDU1Yi4uMDAwMDAw
MDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaWd0LWdwdS10b29scy9pZ3QtZ3B1LXRv
b2xzLzAwMDEtbGliLW1lc29uLmJ1aWxkLWZpeC1tZXNvbi0wLjYwLWNvbXBhdGliaWxpdHkucGF0
Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwyNCArMCwwIEBACi1Gcm9tIGI5YTE5YWE0YmRiMjE3NTFj
MDRjMGUzYmE4YTllMmUzNWExMGM5NTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgotRGF0ZTogTW9uLCAyNSBPY3Qg
MjAyMSAxODoxODoxNSArMDIwMAotU3ViamVjdDogW1BBVENIXSBsaWIvbWVzb24uYnVpbGQ6IGZp
eCBtZXNvbiAwLjYwIGNvbXBhdGliaWxpdHkKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBb
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzLy0vY29tbWl0
Lzk2MzkxN2EzNTY1NDY2ODMyYTNiMmZjMjJlOTI4NWQzNGEwYmY5NDRdCi1TaWduZWQtb2ZmLWJ5
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgotLS0tCi0gbGliL21lc29u
LmJ1aWxkIHwgMiArLQotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQotCi1kaWZmIC0tZ2l0IGEvbGliL21lc29uLmJ1aWxkIGIvbGliL21lc29uLmJ1aWxkCi1p
bmRleCA5OTI5NTIwZS4uMWE1MjU1ODcgMTAwNjQ0Ci0tLS0gYS9saWIvbWVzb24uYnVpbGQKLSsr
KyBiL2xpYi9tZXNvbi5idWlsZAotQEAgLTE1Miw3ICsxNTIsNyBAQCBsaWJfdmVyc2lvbiA9IHZj
c190YWcoaW5wdXQgOiAndmVyc2lvbi5oLmluJywgb3V0cHV0IDogJ3ZlcnNpb24uaCcsCi0gCi0g
bGliX2ludGVybWVkaWF0ZXMgPSBbXQotIGZvcmVhY2ggZjogbGliX3NvdXJjZXMKLS0gICAgbmFt
ZSA9IGYudW5kZXJzY29yaWZ5KGYpCi0rICAgIG5hbWUgPSBmLnVuZGVyc2NvcmlmeSgpCi0gICAg
IGxpYiA9IHN0YXRpY19saWJyYXJ5KCdpZ3QtJyArIG5hbWUsCi0gCVsgZiwgbGliX3ZlcnNpb24g
XSwKLSAJaW5jbHVkZV9kaXJlY3RvcmllczogaW5jLApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2lndC1ncHUtdG9vbHMvaWd0LWdwdS10b29sc19naXQuYmIgYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvaWd0LWdwdS10b29scy9pZ3QtZ3B1LXRvb2xzX2dpdC5iYgppbmRleCBiYjJm
OTU2NGQyLi5hYjAxZmVmMzljIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaWd0
LWdwdS10b29scy9pZ3QtZ3B1LXRvb2xzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvaWd0LWdwdS10b29scy9pZ3QtZ3B1LXRvb2xzX2dpdC5iYgpAQCAtOSwxMiArOSwxMCBAQCBM
SUNFTlNFID0gIk1JVCIKIAogaW5oZXJpdCBtZXNvbiBwa2djb25maWcKIAotU1JDUkVWID0gIjIw
M2RlZjA0NmI0NjZmYjJkYTY3ZjlmMTU1NTJkODRlMWMwYjQxZjIiCi1QViA9ICIxLjI2IgorU1JD
UkVWID0gIjJiMjllOGFjMDdmYmNmYWRjNDhiOWQ2MGU0ZDczNmE2ZTNiMjg5YWIiCitQViA9ICIx
LjI3LjEiCiAKLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0
LWdwdS10b29scy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciBcCi0gICAgICAgICAg
IGZpbGU6Ly8wMDAxLWxpYi1tZXNvbi5idWlsZC1maXgtbWVzb24tMC42MC1jb21wYXRpYmlsaXR5
LnBhdGNoIFwKLSAgICAgICAgICAgIgorU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVy
IgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM3LjMKCg==

--===============8200200185425393130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1697 targets, 41 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:1122b9da4944ed6f65be61574e38d3f07322cdfc"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 174 Local 167 Mirrors 0 Missed 7 Current 428 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1805 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_fetch)
NOTE: Running task 2000 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_write_config)
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_fetch: Started
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_write_config: Started
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_fetch: Succeeded
NOTE: Running task 2090 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_unpack)
NOTE: Running task 2091 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_write_config: Succeeded
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_unpack: Started
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_unpack: Succeeded
NOTE: Running task 2092 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_patch)
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_patch: Started
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_patch: Succeeded
NOTE: Running task 2093 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2094 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_populate_lic)
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_populate_lic: Started
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_populate_lic: Succeeded
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2095 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_configure)
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_configure: Started
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_configure: Succeeded
NOTE: Running task 2096 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_compile)
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_compile: Started
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_compile: Succeeded
NOTE: Running task 2097 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_install)
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_install: Started
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_install: Succeeded
NOTE: Running task 2098 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_package)
NOTE: Running task 2099 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_populate_sysroot)
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_package: Started
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_populate_sysroot: Started
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_package: Succeeded
NOTE: Running task 2100 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_packagedata)
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_packagedata: Started
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2101 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_package_write_rpm)
NOTE: Running task 2102 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_package_qa)
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_package_write_rpm: Started
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_package_qa: Started
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_package_qa: Failed
NOTE: recipe igt-gpu-tools-1.27.1-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 2102 tasks of which 2087 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_package_qa
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: igt-gpu-tools-1.27.1-r0 do_package_qa: QA Issue: /usr/bin/code_cov_parse_info contained in package igt-gpu-tools requires /usr/bin/perl, but no providers found in RDEPENDS:igt-gpu-tools? [file-rdeps]
ERROR: igt-gpu-tools-1.27.1-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/igt-gpu-tools/1.27.1-r0/temp/log.do_package_qa.3932940
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_package_qa) failed with exit code '1'

--===============8200200185425393130==--

