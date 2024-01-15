Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D231BC47DD8
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:33:58 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.88849.1705340029609555607
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N6uLSOgC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UoebW4FY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018d0e2fd007-b565fd81-f38f-4fa2-bb17-4d01311f912e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zXKYlJnbs7kv7om28Sj3/Gr2+GwGdFDAbdg2I0gL9Vk=;
	b=N6uLSOgCXcitMbAP7ms3lSE6Kf13LyzLnwx0y8z05YHfBONlpWtxniz0GF+tuDA2
	G8OQhEHBAG75FkgyrqibBEjAQq+ekohgRPEItElnahtCark8CP+IOudmz43iX/94AY+
	lof5XUCcbgxuyTr5saHP6vGYMorL4LYJmmkuKDy4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zXKYlJnbs7kv7om28Sj3/Gr2+GwGdFDAbdg2I0gL9Vk=;
	b=UoebW4FYm79YGh45RQKwX/8IYaz5O8sKrOI0UX9H7uU9MbLY1ezmTdSnbxUwuKo8
	paWV/x3rytJZXH4JeZkAsjxLBJ5Gf4NrKxZ6iIFQjxl3JmJ9TQehODjRH/St4RThXHa
	vfgq0Qr9Xah9MQiI0uXOpyJPkggElKjnLgAw/Yh8=
Content-Type: multipart/mixed; boundary="===============2609455148466447728=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 7a93ae5d3c90cb5d1d8d775a8cd9d30bc745f658
 SUCCEEDED
Message-ID: <0101018d0e2fd007-b565fd81-f38f-4fa2-bb17-4d01311f912e-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193775

--===============2609455148466447728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
ICpwdXp6bGVzKiB0byAqN2E5M2FlNWQzYzkwY2I1ZDFkOGQ3NzVhOGNkOWQzMGJjNzQ1ZjY1OCog
aGFzIFN1Y2NlZWRlZC4KCk5leHQgc3RlcHM6CiAgICAtIGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFt
IDAwMDEtcHV6emxlcy11cGdyYWRlLXRvLWxhdGVzdC1yZXZpc2lvbi5wYXRjaAogICAgLSBjaGVj
ayB0aGUgY2hhbmdlcyB0byB1cHN0cmVhbSBwYXRjaGVzIGFuZCBzdW1tYXJpemUgdGhlbSBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UsCiAgICAtIGNvbXBpbGUgYW4gaW1hZ2UgdGhhdCBjb250YWlucyB0
aGUgcGFja2FnZQogICAgLSBwZXJmb3JtIHNvbWUgYmFzaWMgc2FuaXR5IHRlc3RzCiAgICAtIGFt
ZW5kIHRoZSBwYXRjaCBhbmQgc2lnbiBpdCBvZmY6IGdpdCBjb21taXQgLXMgLS1yZXNldC1hdXRo
b3IgLS1hbWVuZAogICAgLSBzZW5kIGl0IHRvIHRoZSBhcHByb3ByaWF0ZSBtYWlsaW5nIGxpc3QK
CkFsdGVybmF0aXZlbHksIGlmIHlvdSBiZWxpZXZlIHRoZSByZWNpcGUgc2hvdWxkIG5vdCBiZSB1
cGdyYWRlZCBhdCB0aGlzIHRpbWUsCnlvdSBjYW4gZmlsbCBSRUNJUEVfTk9fVVBEQVRFX1JFQVNP
TiBpbiByZXNwZWN0aXZlIHJlY2lwZSBmaWxlIHNvIHRoYXQKYXV0b21hdGljIHVwZ3JhZGVzIHdv
dWxkIG5vIGxvbmdlciBiZSBhdHRlbXB0ZWQuCgpQbGVhc2UgcmV2aWV3IHRoZSBhdHRhY2hlZCBm
aWxlcyBmb3IgZnVydGhlciBpbmZvcm1hdGlvbiBhbmQgYnVpbGQvdXBkYXRlIGZhaWx1cmVzLgpB
bnkgcHJvYmxlbSBwbGVhc2UgZmlsZSBhIGJ1ZyBhdCBodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJv
amVjdC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9kdWN0PUF1dG9tYXRlZCUyMFVwZGF0ZSUyMEhhbmRs
ZXIKClJlZ2FyZHMsClRoZSBVcGdyYWRlIEhlbHBlcgoKLS0gPjggLS0KRnJvbSBlNTNlOGQ2OTgy
YzA0NWE5YTVlZTAxZjM0MWI1MjlhMGU2YWE4NzZlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpG
cm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+CkRhdGU6IE1vbiwgMTUg
SmFuIDIwMjQgMTM6NTU6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBwdXp6bGVzOiB1cGdyYWRl
IHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0by9wdXp6bGVzL3B1enps
ZXNfZ2l0LmJiIHwgMjMgKysrKysrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
MSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1zYXRvL3B1enpsZXMvcHV6emxlc19naXQuYmIgYi9tZXRhL3JlY2lwZXMtc2F0by9wdXp6bGVz
L3B1enpsZXNfZ2l0LmJiCmluZGV4IGFiNGIyMzk0YjguLjYxMDE2MzVmNTYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19naXQuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgpAQCAtMSw4ICsxLDI3IEBACisjIEZJWE1F
OiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRv
b2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0
aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElD
RU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhl
IGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAn
TGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFu
Z2VzOgorIworIyAtLS0gTElDRU5DRQorIyArKysgTElDRU5DRQorIyBAQCAtMSw0ICsxLDQgQEAK
KyMgLVRoaXMgc29mdHdhcmUgaXMgY29weXJpZ2h0IChjKSAyMDA0LTIwMjMgU2ltb24gVGF0aGFt
LgorIyArVGhpcyBzb2Z0d2FyZSBpcyBjb3B5cmlnaHQgKGMpIDIwMDQtMjAyNCBTaW1vbiBUYXRo
YW0uCisjICAKKyMgIFBvcnRpb25zIGNvcHlyaWdodCBSaWNoYXJkIEJvdWx0b24sIEphbWVzIEhh
cnZleSwgTWlrZSBQaW5uYSwgSm9uYXMKKyMgIEvDtmxrZXIsIERhcml1c3ogT2xzemV3c2tpLCBN
aWNoYWVsIFNjaGllcmwsIExhbWJyb3MgTGFtYnJvdSwgQmVybmQKKyMgCisjCisKIFNVTU1BUlkg
PSAiU2ltb24gVGF0aGFtJ3MgUG9ydGFibGUgUHV6emxlIENvbGxlY3Rpb24iCiBERVNDUklQVElP
TiA9ICJDb2xsZWN0aW9uIG9mIHNtYWxsIGNvbXB1dGVyIHByb2dyYW1zIHdoaWNoIGltcGxlbWVu
dCBvbmUtcGxheWVyIHB1enpsZSBnYW1lcy4iCiBIT01FUEFHRSA9ICJodHRwOi8vd3d3LmNoaWFy
ay5ncmVlbmVuZC5vcmcudWsvfnNndGF0aGFtL3B1enpsZXMvIgogTElDRU5TRSA9ICJNSVQiCi1M
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTkNFO21kNT05MmQyYjdhMmZjOTZiNWY3ZjE3
MTAxZGY3ZGIxZmVmYSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOQ0U7bWQ1PTE5
MTU0MmIzMjM3N2JkZTI1NGU5Nzk5ZTBhNDZmMThiIgogCiAjIGd0ayBzdXBwb3J0IGluY2x1ZGVz
IGEgYnVuY2ggb2YgeDExIGhlYWRlcnMKIFJFUVVJUkVEX0RJU1RST19GRUFUVVJFUyA9ICJ4MTEi
CkBAIC0xMCw3ICsyOSw3IEBAIFJFUVVJUkVEX0RJU1RST19GRUFUVVJFUyA9ICJ4MTEiCiBTUkNf
VVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24vcHV6emxlcy5naXQ7YnJhbmNoPW1h
aW47cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIKLVNSQ1JF
ViA9ICIwODM2NWZiMjYwYWU2ZTMyNDQyZGQ5ZjE5NmU2NWQxM2ZhY2I0YjMzIgorU1JDUkVWID0g
IjdhOTNhZTVkM2M5MGNiNWQxZDhkNzc1YThjZDlkMzBiYzc0NWY2NTgiCiBQRSA9ICIyIgogUFYg
PSAiMC4wK2dpdCIKIAotLSAKMi40Mi4wCgo=

--===============2609455148466447728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1850 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (913 cached, 1 parsed). 1850 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-2e908cdb9b167ad5e049e49599366877626b15c7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:2e908cdb9b167ad5e049e49599366877626b15c7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 407 Local 395 Mirrors 0 Missed 12 Current 650 (97% match, 98% complete)
Removing 10 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2580 of 2921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 2902 of 2921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 2903 of 2921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 2904 of 2921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: Running task 2905 of 2921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Succeeded
NOTE: Running task 2906 of 2921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2907 of 2921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2908 of 2921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2909 of 2921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Succeeded
NOTE: Running task 2910 of 2921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Succeeded
NOTE: Running task 2911 of 2921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Succeeded
NOTE: Running task 2912 of 2921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2913 of 2921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot unihash changed to a6aa76b712a10505f1196d9d7445236da777a5b5b6af133ffc91f0b8987118db
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Succeeded
NOTE: Running task 2914 of 2921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2914 tasks of which 2900 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240115135121.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240115135121.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-src went backwards which would break package feeds (from 2:0.0+git0+08365fb260-r0 to 2:0.0+git0+7a93ae5d3c-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-dbg went backwards which would break package feeds (from 2:0.0+git0+08365fb260-r0 to 2:0.0+git0+7a93ae5d3c-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-staticdev went backwards which would break package feeds (from 2:0.0+git0+08365fb260-r0 to 2:0.0+git0+7a93ae5d3c-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-dev went backwards which would break package feeds (from 2:0.0+git0+08365fb260-r0 to 2:0.0+git0+7a93ae5d3c-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-doc went backwards which would break package feeds (from 2:0.0+git0+08365fb260-r0 to 2:0.0+git0+7a93ae5d3c-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-locale went backwards which would break package feeds (from 2:0.0+git0+08365fb260-r0 to 2:0.0+git0+7a93ae5d3c-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles went backwards which would break package feeds (from 2:0.0+git0+08365fb260-r0 to 2:0.0+git0+7a93ae5d3c-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/puzzles/0.0+git/temp/log.do_packagedata.198352
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata) failed with exit code '1'

--===============2609455148466447728==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSBlNTNlOGQ2OTgyYzA0NWE5YTVlZTAxZjM0MWI1MjlhMGU2YWE4NzZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMTM6NTU6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMjMgKysrKysrKysrKysrKysrKysrKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19naXQuYmIgYi9tZXRhL3JlY2lw
ZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCmluZGV4IGFiNGIyMzk0YjguLjYxMDE2MzVm
NTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19naXQuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgpAQCAtMSw4ICsx
LDI3IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVw
ZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZl
cmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNl
IHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNo
YW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcu
CisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicp
CisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5DRQorIyArKysgTElDRU5DRQorIyBA
QCAtMSw0ICsxLDQgQEAKKyMgLVRoaXMgc29mdHdhcmUgaXMgY29weXJpZ2h0IChjKSAyMDA0LTIw
MjMgU2ltb24gVGF0aGFtLgorIyArVGhpcyBzb2Z0d2FyZSBpcyBjb3B5cmlnaHQgKGMpIDIwMDQt
MjAyNCBTaW1vbiBUYXRoYW0uCisjICAKKyMgIFBvcnRpb25zIGNvcHlyaWdodCBSaWNoYXJkIEJv
dWx0b24sIEphbWVzIEhhcnZleSwgTWlrZSBQaW5uYSwgSm9uYXMKKyMgIEvDtmxrZXIsIERhcml1
c3ogT2xzemV3c2tpLCBNaWNoYWVsIFNjaGllcmwsIExhbWJyb3MgTGFtYnJvdSwgQmVybmQKKyMg
CisjCisKIFNVTU1BUlkgPSAiU2ltb24gVGF0aGFtJ3MgUG9ydGFibGUgUHV6emxlIENvbGxlY3Rp
b24iCiBERVNDUklQVElPTiA9ICJDb2xsZWN0aW9uIG9mIHNtYWxsIGNvbXB1dGVyIHByb2dyYW1z
IHdoaWNoIGltcGxlbWVudCBvbmUtcGxheWVyIHB1enpsZSBnYW1lcy4iCiBIT01FUEFHRSA9ICJo
dHRwOi8vd3d3LmNoaWFyay5ncmVlbmVuZC5vcmcudWsvfnNndGF0aGFtL3B1enpsZXMvIgogTElD
RU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTkNFO21kNT05MmQy
YjdhMmZjOTZiNWY3ZjE3MTAxZGY3ZGIxZmVmYSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOQ0U7bWQ1PTE5MTU0MmIzMjM3N2JkZTI1NGU5Nzk5ZTBhNDZmMThiIgogCiAjIGd0ayBz
dXBwb3J0IGluY2x1ZGVzIGEgYnVuY2ggb2YgeDExIGhlYWRlcnMKIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCkBAIC0xMCw3ICsyOSw3IEBAIFJFUVVJUkVEX0RJU1RST19GRUFUVVJF
UyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24vcHV6emxl
cy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNLX0NPTU1J
VFMgPSAiMSIKLVNSQ1JFViA9ICIwODM2NWZiMjYwYWU2ZTMyNDQyZGQ5ZjE5NmU2NWQxM2ZhY2I0
YjMzIgorU1JDUkVWID0gIjdhOTNhZTVkM2M5MGNiNWQxZDhkNzc1YThjZDlkMzBiYzc0NWY2NTgi
CiBQRSA9ICIyIgogUFYgPSAiMC4wK2dpdCIKIAotLSAKMi40Mi4wCgo=

--===============2609455148466447728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+08365fb260-r0'])", added "puzzles (['= 2:0.0+git0+7a93ae5d3c-r0'])"
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+08365fb260-r0'])", added "puzzles-dev (['= 2:0.0+git0+7a93ae5d3c-r0'])"
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c

--===============2609455148466447728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+08365fb260-r0'])", added "puzzles (['= 2:0.0+git0+7a93ae5d3c-r0'])"
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3838531 to 3838603 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+08365fb260-r0'])", added "puzzles-dev (['= 2:0.0+git0+7a93ae5d3c-r0'])"
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c

--===============2609455148466447728==--

