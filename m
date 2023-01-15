Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56194C71130
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:31 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.145719.1673805743817699384
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jge5iORk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010185b698c838-83a57d85-e609-4f6b-97f5-28cfda584fae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=moQU+MBdnyLZqWXLlA/igVLppftRtZdE+XxHQR7/3Xc=;
	b=jge5iORkhJ3zUPGrgckMh3tB/JwtQc/nIwmWpyME97eVOyU0+tLONBB+GvHEyZuv
	u472O3t79j92phzSMGrauHaH+x2T/2TW61gCXIIf0FeQuUfae9GopHBjfmIabeGrWjT
	cUIzkWkSSvvzNb4MWGZCqic3gbmuBsMGYM7tkgrk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=moQU+MBdnyLZqWXLlA/igVLppftRtZdE+XxHQR7/3Xc=;
	b=gIySQ4y0lU7xRIsfBdYRWVqvs0nG3GVvVJzP3FQHaLV7e3bFmo+GGyfnuoXe+Ir/
	mLV5tzlP5kzJb7ffBpqdnVtSVWpjC3yUS5fhoshdLqOW1jEsGoayC4o8FMesHl+vZsq
	WTDILexr2EqisY4hcTsmIpljwdXSxSoE00Vartmw=
Content-Type: multipart/mixed; boundary="===============5161237053812814364=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] igt-gpu-tools: upgrading to 1.27 FAILED
Message-ID: <01010185b698c838-83a57d85-e609-4f6b-97f5-28cfda584fae-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175933

--===============5161237053812814364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *igt-gpu-tools* to *1.27* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-igt-gpu-tools-upgrade-1.26-1.27.patch
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
--===============5161237053812814364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1696 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1696 targets, 41 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:63ab34e49a451389494d405cbb213e27c13658c8"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 217 Local 210 Mirrors 0 Missed 7 Current 385 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1805 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_fetch)
NOTE: Running task 2000 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_write_config)
NOTE: recipe igt-gpu-tools-1.27-r0: task do_fetch: Started
NOTE: recipe igt-gpu-tools-1.27-r0: task do_write_config: Started
NOTE: recipe igt-gpu-tools-1.27-r0: task do_fetch: Succeeded
NOTE: Running task 2090 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_unpack)
NOTE: Running task 2091 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe igt-gpu-tools-1.27-r0: task do_write_config: Succeeded
NOTE: recipe igt-gpu-tools-1.27-r0: task do_unpack: Started
NOTE: recipe igt-gpu-tools-1.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe igt-gpu-tools-1.27-r0: task do_unpack: Succeeded
NOTE: Running task 2092 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_patch)
NOTE: recipe igt-gpu-tools-1.27-r0: task do_patch: Started
NOTE: recipe igt-gpu-tools-1.27-r0: task do_patch: Succeeded
NOTE: Running task 2093 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2094 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_populate_lic)
NOTE: recipe igt-gpu-tools-1.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe igt-gpu-tools-1.27-r0: task do_populate_lic: Started
NOTE: recipe igt-gpu-tools-1.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe igt-gpu-tools-1.27-r0: task do_populate_lic: Succeeded
NOTE: recipe igt-gpu-tools-1.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2095 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_configure)
NOTE: recipe igt-gpu-tools-1.27-r0: task do_configure: Started
NOTE: recipe igt-gpu-tools-1.27-r0: task do_configure: Succeeded
NOTE: Running task 2096 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_compile)
NOTE: recipe igt-gpu-tools-1.27-r0: task do_compile: Started
NOTE: recipe igt-gpu-tools-1.27-r0: task do_compile: Succeeded
NOTE: Running task 2097 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_install)
NOTE: recipe igt-gpu-tools-1.27-r0: task do_install: Started
NOTE: recipe igt-gpu-tools-1.27-r0: task do_install: Succeeded
NOTE: Running task 2098 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_package)
NOTE: Running task 2099 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_populate_sysroot)
NOTE: recipe igt-gpu-tools-1.27-r0: task do_package: Started
NOTE: recipe igt-gpu-tools-1.27-r0: task do_populate_sysroot: Started
NOTE: recipe igt-gpu-tools-1.27-r0: task do_populate_sysroot: Succeeded
NOTE: recipe igt-gpu-tools-1.27-r0: task do_package: Succeeded
NOTE: Running task 2100 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_packagedata)
NOTE: recipe igt-gpu-tools-1.27-r0: task do_packagedata: Started
NOTE: recipe igt-gpu-tools-1.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2101 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_package_write_rpm)
NOTE: Running task 2102 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_package_qa)
NOTE: recipe igt-gpu-tools-1.27-r0: task do_package_write_rpm: Started
NOTE: recipe igt-gpu-tools-1.27-r0: task do_package_qa: Started
NOTE: recipe igt-gpu-tools-1.27-r0: task do_package_qa: Failed
NOTE: recipe igt-gpu-tools-1.27-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 2102 tasks of which 2087 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_package_qa
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: igt-gpu-tools-1.27-r0 do_package_qa: QA Issue: /usr/bin/code_cov_parse_info contained in package igt-gpu-tools requires /usr/bin/perl, but no providers found in RDEPENDS:igt-gpu-tools? [file-rdeps]
ERROR: igt-gpu-tools-1.27-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/igt-gpu-tools/1.27-r0/temp/log.do_package_qa.2363819
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb:do_package_qa) failed with exit code '1'

--===============5161237053812814364==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-igt-gpu-tools-upgrade-1.26-1.27.patch"

RnJvbSAzMDI0NmFiMGVmODJkMzU3YjQ0OGExYzVhNGNjOGU1ZTZmNWRiZDUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTU6MTE6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
Z3QtZ3B1LXRvb2xzOiB1cGdyYWRlIDEuMjYgLT4gMS4yNwoKLS0tCiAuLi5uLmJ1aWxkLWZpeC1t
ZXNvbi0wLjYwLWNvbXBhdGliaWxpdHkucGF0Y2ggfCAyNCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAu
Li4vaWd0LWdwdS10b29scy9pZ3QtZ3B1LXRvb2xzX2dpdC5iYiAgICAgICAgfCAgOCArKystLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pCiBkZWxl
dGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2lndC1ncHUtdG9vbHMvaWd0LWdw
dS10b29scy8wMDAxLWxpYi1tZXNvbi5idWlsZC1maXgtbWVzb24tMC42MC1jb21wYXRpYmlsaXR5
LnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2lndC1ncHUtdG9vbHMv
aWd0LWdwdS10b29scy8wMDAxLWxpYi1tZXNvbi5idWlsZC1maXgtbWVzb24tMC42MC1jb21wYXRp
YmlsaXR5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2lndC1ncHUtdG9vbHMvaWd0LWdw
dS10b29scy8wMDAxLWxpYi1tZXNvbi5idWlsZC1maXgtbWVzb24tMC42MC1jb21wYXRpYmlsaXR5
LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBlN2M3ODIwNTViLi4wMDAwMDAw
MDAwCi0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9v
bHMvMDAwMS1saWItbWVzb24uYnVpbGQtZml4LW1lc29uLTAuNjAtY29tcGF0aWJpbGl0eS5wYXRj
aAorKysgL2Rldi9udWxsCkBAIC0xLDI0ICswLDAgQEAKLUZyb20gYjlhMTlhYTRiZGIyMTc1MWMw
NGMwZTNiYThhOWUyZTM1YTEwYzk1MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEFs
ZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+Ci1EYXRlOiBNb24sIDI1IE9jdCAy
MDIxIDE4OjE4OjE1ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIGxpYi9tZXNvbi5idWlsZDogZml4
IG1lc29uIDAuNjAgY29tcGF0aWJpbGl0eQotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFto
dHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMvLS9jb21taXQv
OTYzOTE3YTM1NjU0NjY4MzJhM2IyZmMyMmU5Mjg1ZDM0YTBiZjk0NF0KLVNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+Ci0tLS0KLSBsaWIvbWVzb24u
YnVpbGQgfCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCi0KLWRpZmYgLS1naXQgYS9saWIvbWVzb24uYnVpbGQgYi9saWIvbWVzb24uYnVpbGQKLWlu
ZGV4IDk5Mjk1MjBlLi4xYTUyNTU4NyAxMDA2NDQKLS0tLSBhL2xpYi9tZXNvbi5idWlsZAotKysr
IGIvbGliL21lc29uLmJ1aWxkCi1AQCAtMTUyLDcgKzE1Miw3IEBAIGxpYl92ZXJzaW9uID0gdmNz
X3RhZyhpbnB1dCA6ICd2ZXJzaW9uLmguaW4nLCBvdXRwdXQgOiAndmVyc2lvbi5oJywKLSAKLSBs
aWJfaW50ZXJtZWRpYXRlcyA9IFtdCi0gZm9yZWFjaCBmOiBsaWJfc291cmNlcwotLSAgICBuYW1l
ID0gZi51bmRlcnNjb3JpZnkoZikKLSsgICAgbmFtZSA9IGYudW5kZXJzY29yaWZ5KCkKLSAgICAg
bGliID0gc3RhdGljX2xpYnJhcnkoJ2lndC0nICsgbmFtZSwKLSAJWyBmLCBsaWJfdmVyc2lvbiBd
LAotIAlpbmNsdWRlX2RpcmVjdG9yaWVzOiBpbmMsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvaWd0LWdwdS10b29scy9pZ3QtZ3B1LXRvb2xzX2dpdC5iYiBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHNfZ2l0LmJiCmluZGV4IGJiMmY5
NTY0ZDIuLjUzY2VkNzQ0M2YgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9pZ3Qt
Z3B1LXRvb2xzL2lndC1ncHUtdG9vbHNfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHNfZ2l0LmJiCkBAIC05LDEyICs5LDEwIEBAIExJ
Q0VOU0UgPSAiTUlUIgogCiBpbmhlcml0IG1lc29uIHBrZ2NvbmZpZwogCi1TUkNSRVYgPSAiMjAz
ZGVmMDQ2YjQ2NmZiMmRhNjdmOWYxNTU1MmQ4NGUxYzBiNDFmMiIKLVBWID0gIjEuMjYiCitTUkNS
RVYgPSAiMWU2ZDI0ZTZkZmE0MmIyMmY5NTBmN2Q1ZTQzNmI4ZjlhY2Y4NzQ3ZiIKK1BWID0gIjEu
MjciCiAKLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdw
dS10b29scy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciBcCi0gICAgICAgICAgIGZp
bGU6Ly8wMDAxLWxpYi1tZXNvbi5idWlsZC1maXgtbWVzb24tMC42MC1jb21wYXRpYmlsaXR5LnBh
dGNoIFwKLSAgICAgICAgICAgIgorU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL2RybS9pZ3QtZ3B1LXRvb2xzLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIgog
CiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM3LjMKCg==

--===============5161237053812814364==--

