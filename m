Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3799.1794377110835906280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 22:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MoZ+BcyW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WhttLc76;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a1c935d20a-edde8125-33f5-4c38-a1d0-a46db7a46e02-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794377110;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=XrWtJuRvDaSUqm3fnRekpUHBQ8tuGGgpkeRsg51GvFY=;
	b=MoZ+BcyWOYIo+xWVy6n0x6/pMJz+x0W8d6s7YfM5x7SMu4pkrMKz3DAuclX8Pybk
	7TifvXu3NHOiH4UQmu+zPRin1qI8RTBK6W8k/07AmmHZPSjC33B4BFT0pwGwUaQZVse
	wEMPAhvDwMEhZNNx6KQO0TzWAdDpnfkZbjy0ZR5s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794377110;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=XrWtJuRvDaSUqm3fnRekpUHBQ8tuGGgpkeRsg51GvFY=;
	b=WhttLc76eNuwns0zAQPi/jyniunESxOtCaMhxaNvjNyi2iHDAWZzfDrXmTREhaF5
	0twQEKdRjSnRnatP4uy2HSeRkHtlJhfDXp4jTcJG3dPyyfrm+vkAvLxhHJIX73d1JF4
	JP+jAVq1Cy3cVnHobyfwrLHKFHerUpN6O2D2I3IE=
Content-Type: multipart/mixed; boundary="===============5286013664818259441=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.73 SUCCEEDED
Message-ID: <010101a1c935d20a-edde8125-33f5-4c38-a1d0-a46db7a46e02-000000@us-west-2.amazonses.com>
Date: Wed, 11 Nov 2026 06:05:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249959

--===============5286013664818259441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.73* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.72-2.73.patch
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
From 2383eca9f1607cc51eb5a8180757cb0e52bb008d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 11 Nov 2026 05:36:22 +0000
Subject: [PATCH] repo: upgrade 2.72 -> 2.73

style: use `import progress` everywhere
style: use `import wrapper` everywhere
style: use `import git_trace2_event_log_base` everywhere
style: use `import git_trace2_event_log` everywhere
style: use `import git_superproject` everywhere
style: use `import event_log` everywhere
style: use `import manifest_xml` everywhere
sync: don't read target tree after reprojectcmd
sync: verify fetchcmd postconditions without reading objects
sync: skip shallow bloat check when using fetchcmd
style: use `import git_config` everywhere
Adding sparse checkout functionality
style: use `import color` everywhere
style: use `import test_manifest_xml` everywhere
style: use `import pager` everywhere
style: use `import editor` everywhere
style: use `import io` everywhere
style: use `import collections` everywhere
style: use `import urllib.xxx` everywhere
style: use `import types` everywhere
flake8: enable flake8-import-restrictions
flake8: fix nested import checks
event_log: only record events when --event-log is specified
git_refs, project: skip redundant git calls on unborn HEAD and warm refs
git_config, project: keep config cache coherent and skip init templates
project: trace fetchcmd and reprojectcmd executions
---
 meta/recipes-devtools/repo/{repo_2.72.bb => repo_2.73.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.72.bb => repo_2.73.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.72.bb b/meta/recipes-devtools/repo/repo_2.73.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.72.bb
rename to meta/recipes-devtools/repo/repo_2.73.bb
index 10e9208ebf..3b5ff064f7 100644
--- a/meta/recipes-devtools/repo/repo_2.72.bb
+++ b/meta/recipes-devtools/repo/repo_2.73.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "365629015667e04739f59070e745548a728549c8"
+SRCREV = "d7c431b9968d928373fe9b463a51d304d3b2c48a"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============5286013664818259441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="repo-changelog.txt"

style: use `import progress` everywhere
style: use `import wrapper` everywhere
style: use `import git_trace2_event_log_base` everywhere
style: use `import git_trace2_event_log` everywhere
style: use `import git_superproject` everywhere
style: use `import event_log` everywhere
style: use `import manifest_xml` everywhere
sync: don't read target tree after reprojectcmd
sync: verify fetchcmd postconditions without reading objects
sync: skip shallow bloat check when using fetchcmd
style: use `import git_config` everywhere
Adding sparse checkout functionality
style: use `import color` everywhere
style: use `import test_manifest_xml` everywhere
style: use `import pager` everywhere
style: use `import editor` everywhere
style: use `import io` everywhere
style: use `import collections` everywhere
style: use `import urllib.xxx` everywhere
style: use `import types` everywhere
flake8: enable flake8-import-restrictions
flake8: fix nested import checks
event_log: only record events when --event-log is specified
git_refs, project: skip redundant git calls on unborn HEAD and warm refs
git_config, project: keep config cache coherent and skip init templates
project: trace fetchcmd and reprojectcmd executions

--===============5286013664818259441==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.72-2.73.patch"

RnJvbSAyMzgzZWNhOWYxNjA3Y2M1MWViNWE4MTgwNzU3Y2IwZTUyYmIwMDhkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTEgTm92IDIwMjYgMDU6MzY6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuNzIgLT4gMi43MwoKc3R5bGU6IHVzZSBgaW1wb3J0IHByb2dyZXNzYCBl
dmVyeXdoZXJlCnN0eWxlOiB1c2UgYGltcG9ydCB3cmFwcGVyYCBldmVyeXdoZXJlCnN0eWxlOiB1
c2UgYGltcG9ydCBnaXRfdHJhY2UyX2V2ZW50X2xvZ19iYXNlYCBldmVyeXdoZXJlCnN0eWxlOiB1
c2UgYGltcG9ydCBnaXRfdHJhY2UyX2V2ZW50X2xvZ2AgZXZlcnl3aGVyZQpzdHlsZTogdXNlIGBp
bXBvcnQgZ2l0X3N1cGVycHJvamVjdGAgZXZlcnl3aGVyZQpzdHlsZTogdXNlIGBpbXBvcnQgZXZl
bnRfbG9nYCBldmVyeXdoZXJlCnN0eWxlOiB1c2UgYGltcG9ydCBtYW5pZmVzdF94bWxgIGV2ZXJ5
d2hlcmUKc3luYzogZG9uJ3QgcmVhZCB0YXJnZXQgdHJlZSBhZnRlciByZXByb2plY3RjbWQKc3lu
YzogdmVyaWZ5IGZldGNoY21kIHBvc3Rjb25kaXRpb25zIHdpdGhvdXQgcmVhZGluZyBvYmplY3Rz
CnN5bmM6IHNraXAgc2hhbGxvdyBibG9hdCBjaGVjayB3aGVuIHVzaW5nIGZldGNoY21kCnN0eWxl
OiB1c2UgYGltcG9ydCBnaXRfY29uZmlnYCBldmVyeXdoZXJlCkFkZGluZyBzcGFyc2UgY2hlY2tv
dXQgZnVuY3Rpb25hbGl0eQpzdHlsZTogdXNlIGBpbXBvcnQgY29sb3JgIGV2ZXJ5d2hlcmUKc3R5
bGU6IHVzZSBgaW1wb3J0IHRlc3RfbWFuaWZlc3RfeG1sYCBldmVyeXdoZXJlCnN0eWxlOiB1c2Ug
YGltcG9ydCBwYWdlcmAgZXZlcnl3aGVyZQpzdHlsZTogdXNlIGBpbXBvcnQgZWRpdG9yYCBldmVy
eXdoZXJlCnN0eWxlOiB1c2UgYGltcG9ydCBpb2AgZXZlcnl3aGVyZQpzdHlsZTogdXNlIGBpbXBv
cnQgY29sbGVjdGlvbnNgIGV2ZXJ5d2hlcmUKc3R5bGU6IHVzZSBgaW1wb3J0IHVybGxpYi54eHhg
IGV2ZXJ5d2hlcmUKc3R5bGU6IHVzZSBgaW1wb3J0IHR5cGVzYCBldmVyeXdoZXJlCmZsYWtlODog
ZW5hYmxlIGZsYWtlOC1pbXBvcnQtcmVzdHJpY3Rpb25zCmZsYWtlODogZml4IG5lc3RlZCBpbXBv
cnQgY2hlY2tzCmV2ZW50X2xvZzogb25seSByZWNvcmQgZXZlbnRzIHdoZW4gLS1ldmVudC1sb2cg
aXMgc3BlY2lmaWVkCmdpdF9yZWZzLCBwcm9qZWN0OiBza2lwIHJlZHVuZGFudCBnaXQgY2FsbHMg
b24gdW5ib3JuIEhFQUQgYW5kIHdhcm0gcmVmcwpnaXRfY29uZmlnLCBwcm9qZWN0OiBrZWVwIGNv
bmZpZyBjYWNoZSBjb2hlcmVudCBhbmQgc2tpcCBpbml0IHRlbXBsYXRlcwpwcm9qZWN0OiB0cmFj
ZSBmZXRjaGNtZCBhbmQgcmVwcm9qZWN0Y21kIGV4ZWN1dGlvbnMKLS0tCiBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcmVwby97cmVwb18yLjcyLmJiID0+IHJlcG9fMi43My5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcmVwby97cmVwb18yLjcyLmJiID0+IHJlcG9fMi43My5iYn0gKDk0JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNzIuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNzMuYmIKc2ltaWxhcml0eSBpbmRleCA5
NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjcyLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNzMuYmIKaW5kZXggMTBl
OTIwOGViZi4uM2I1ZmYwNjRmNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Jl
cG8vcmVwb18yLjcyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi43
My5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIAogU1JDX1VSSSA9ICJnaXQ6
Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9aHR0cHM7YnJh
bmNoPW1haW47dGFnPXYke1BWfSBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICIzNjU2MjkwMTU2
NjdlMDQ3MzlmNTkwNzBlNzQ1NTQ4YTcyODU0OWM4IgorU1JDUkVWID0gImQ3YzQzMWI5OTY4ZDky
ODM3M2ZlOWI0NjNhNTFkMzA0ZDNiMmM0OGEiCiAKIE1JUlJPUlMgKz0gImdpdDovL2dlcnJpdC5n
b29nbGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdCBnaXQ6Ly9naXRodWIuY29tL0dlcnJpdENvZGVS
ZXZpZXcvZ2l0LXJlcG8uZ2l0IgogCi0tIAoyLjQ3LjEKCg==

--===============5286013664818259441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2004 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-863b49a5f7e55591657c53c97b7df415545b9789"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:863b49a5f7e55591657c53c97b7df415545b9789"
meta-yocto-bsp       
meta-poky            = "master:8becfabefdf5df564aafe2d07d10e4b05fbaedb1"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 524 Local 500 Mirrors 0 Missed 24 Current 234 (95% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 281 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/repo/repo_2.73.bb:do_populate_lic_setscene)
NOTE: Running setscene task 325 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_qa_setscene)
NOTE: Running setscene task 336 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 345 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 346 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 368 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 379 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 399 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 402 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe repo-2.73-r0: task do_populate_lic_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe findutils-4.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.44.0-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.56.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe repo-2.73-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe git-2.56.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 404 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 405 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 407 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.10-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 408 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 413 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 417 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 422 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 434 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe git-2.56.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 828 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/repo/repo_2.73.bb:do_recipe_qa)
NOTE: recipe curl-8.23.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe findutils-4.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.56.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 907 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_fetch)
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe repo-2.73-r0: task do_recipe_qa: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 446 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zlib-1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 447 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe expat-2.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 448 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe openssl-4.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 449 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 451 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 452 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe git-2.56.0-r0: task do_fetch: Started
NOTE: recipe git-2.56.0-r0: task do_fetch: Succeeded
NOTE: Running task 908 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_unpack)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe repo-2.73-r0: task do_recipe_qa: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 909 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/repo/repo_2.73.bb:do_fetch)
NOTE: recipe openssl-4.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.56.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zlib-1.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe repo-2.73-r0: task do_fetch: Started
NOTE: recipe expat-2.10.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 454 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 455 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 456 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 470 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe repo-2.73-r0: task do_fetch: Succeeded
NOTE: Running task 930 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/repo/repo_2.73.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 488 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_packagedata_setscene)
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 496 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe repo-2.73-r0: task do_unpack: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 508 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe git-2.56.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 524 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.197-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1047 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_patch)
NOTE: Running setscene task 527 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 535 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 537 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_packagedata_setscene)
NOTE: Running task 1089 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/repo/repo_2.73.bb:do_create_recipe_spdx)
NOTE: Running task 1094 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.56.0-r0: task do_patch: Started
NOTE: Running setscene task 541 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe repo-2.73-r0: task do_create_recipe_spdx: Started
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe git-2.56.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1099 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe elfutils-0.197-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running setscene task 555 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 562 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe expat-2.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 570 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 575 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 581 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe git-2.56.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 583 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.73-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1143 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1144 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.56.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 594 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 599 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1204 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe curl-8.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running setscene task 634 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_packagedata_setscene)
NOTE: recipe repo-2.73-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 636 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1210 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/repo/repo_2.73.bb:do_patch)
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running setscene task 641 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: Running task 1217 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.73-r0: task do_patch: Started
NOTE: recipe openssl-4.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 661 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe repo-2.73-r0: task do_patch: Succeeded
NOTE: Running task 1244 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1245 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/repo/repo_2.73.bb:do_deploy_source_date_epoch)
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 681 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe repo-2.73-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running setscene task 687 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1273 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe repo-2.73-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe zlib-1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1320 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 728 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 732 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 735 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 736 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 747 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1747 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/repo/repo_2.73.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1748 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.73-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.73-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1884 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/repo/repo_2.73.bb:do_configure)
NOTE: recipe repo-2.73-r0: task do_configure: Started
NOTE: recipe repo-2.73-r0: task do_configure: Succeeded
NOTE: Running task 1885 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/repo/repo_2.73.bb:do_compile)
NOTE: recipe git-2.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1886 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_configure)
NOTE: recipe repo-2.73-r0: task do_compile: Started
NOTE: recipe git-2.56.0-r0: task do_configure: Started
NOTE: recipe repo-2.73-r0: task do_compile: Succeeded
NOTE: Running task 1887 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/repo/repo_2.73.bb:do_install)
NOTE: recipe repo-2.73-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1888 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe repo-2.73-r0: task do_install: Succeeded
NOTE: Running task 1889 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/repo/repo_2.73.bb:do_package)
NOTE: Running task 1890 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/repo/repo_2.73.bb:do_populate_sysroot)
NOTE: recipe repo-2.73-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.73-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7e86448afe1b3e8fcf2e9f542240cb9b328cc75e1ab3c65f36609a2d1377b4f7
NOTE: recipe repo-2.73-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.73-r0: task do_package: Succeeded
NOTE: Running task 1897 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/repo/repo_2.73.bb:do_packagedata)
NOTE: recipe repo-2.73-r0: task do_packagedata: Started
NOTE: recipe repo-2.73-r0: task do_packagedata: Succeeded
NOTE: Running task 1898 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/repo/repo_2.73.bb:do_create_spdx)
NOTE: recipe repo-2.73-r0: task do_create_spdx: Started
NOTE: recipe repo-2.73-r0: task do_create_spdx: Succeeded
NOTE: recipe git-2.56.0-r0: task do_configure: Succeeded
NOTE: Running task 1899 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_compile)
NOTE: recipe git-2.56.0-r0: task do_compile: Started
NOTE: recipe git-2.56.0-r0: task do_compile: Succeeded
NOTE: Running task 1900 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_install)
NOTE: recipe git-2.56.0-r0: task do_install: Started
NOTE: recipe git-2.56.0-r0: task do_install: Succeeded
NOTE: Running task 1901 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_package)
NOTE: Running task 1902 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_populate_sysroot)
NOTE: recipe git-2.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe git-2.56.0-r0: task do_package: Started
NOTE: recipe git-2.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.56.0-r0: task do_package: Succeeded
NOTE: Running task 1903 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_packagedata)
NOTE: recipe git-2.56.0-r0: task do_packagedata: Started
NOTE: recipe git-2.56.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1903 tasks of which 1869 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261111053540.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261111053540.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/git/2.56.0/temp/log.do_packagedata.1133875
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: git-2.56.0-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.56.1-r0 to 0:2.56.0-r0) [version-going-backwards]
ERROR: git-2.56.0-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.56.1-r0 to 0:2.56.0-r0) [version-going-backwards]
ERROR: git-2.56.0-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.56.1-r0 to 0:2.56.0-r0) [version-going-backwards]
ERROR: git-2.56.0-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.56.1-r0 to 0:2.56.0-r0) [version-going-backwards]
ERROR: git-2.56.0-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.56.1-r0 to 0:2.56.0-r0) [version-going-backwards]
ERROR: git-2.56.0-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.56.1-r0 to 0:2.56.0-r0) [version-going-backwards]
ERROR: git-2.56.0-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.56.1-r0 to 0:2.56.0-r0) [version-going-backwards]
ERROR: git-2.56.0-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.56.1-r0 to 0:2.56.0-r0) [version-going-backwards]
ERROR: git-2.56.0-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.56.1-r0 to 0:2.56.0-r0) [version-going-backwards]
ERROR: git-2.56.0-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.56.1-r0 to 0:2.56.0-r0) [version-going-backwards]
ERROR: git-2.56.0-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.56.1-r0 to 0:2.56.0-r0) [version-going-backwards]
ERROR: git-2.56.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/git/2.56.0/temp/log.do_packagedata.1133875
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.56.0.bb:do_packagedata) failed with exit code '1'

--===============5286013664818259441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/repo: PKGV changed from 2.72 [default] to 2.73 [default]
packages/x86-64-v3-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.72" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.73"
packages/x86-64-v3-poky-linux/repo: PV changed from "2.72" to "2.73"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PKGV changed from 2.72 [default] to 2.73 [default]
packages/x86-64-v3-poky-linux/repo/repo-dbg: PV changed from "2.72" to "2.73"
packages/x86-64-v3-poky-linux/repo/repo-dev: PKGV changed from 2.72 [default] to 2.73 [default]
packages/x86-64-v3-poky-linux/repo/repo-dev: PV changed from "2.72" to "2.73"
packages/x86-64-v3-poky-linux/repo/repo-doc: PKGV changed from 2.72 [default] to 2.73 [default]
packages/x86-64-v3-poky-linux/repo/repo-doc: PV changed from "2.72" to "2.73"
packages/x86-64-v3-poky-linux/repo/repo-locale: PKGV changed from 2.72 [default] to 2.73 [default]
packages/x86-64-v3-poky-linux/repo/repo-locale: PV changed from "2.72" to "2.73"
packages/x86-64-v3-poky-linux/repo/repo-src: PKGV changed from 2.72 [default] to 2.73 [default]
packages/x86-64-v3-poky-linux/repo/repo-src: PV changed from "2.72" to "2.73"
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PKGV changed from 2.72 [default] to 2.73 [default]
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PV changed from "2.72" to "2.73"
packages/x86-64-v3-poky-linux/repo/repo: PKGV changed from 2.72 [default] to 2.73 [default]
packages/x86-64-v3-poky-linux/repo/repo: PV changed from "2.72" to "2.73"

--===============5286013664818259441==--
