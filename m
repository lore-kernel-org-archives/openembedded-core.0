Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E1DC4829C
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:15 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.2094.1706810405005668227
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JZnF+kXx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XJM6tZwN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018d65d3fc0a-c70c2732-790a-4be8-9557-dd11f257cc70-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nQy051D4oxYZ+QyDLcgslBefpm5Qcf93ZePH53GPaVo=;
	b=JZnF+kXxk1q6Cr+9sE8qK0mM8Vv62JclkZsykLzsjWAoUgWe47sh/86qTlJG2a/J
	YFKI9ntGhPdsFv2TyGtLR5/PyVfSzwRRWty4CUWJC56S9hxCbZLRjEs4z4rqj+6tdcI
	71W3TD5142M2p9Qu+I9zGn3lZr3H94/RutfPlGjM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nQy051D4oxYZ+QyDLcgslBefpm5Qcf93ZePH53GPaVo=;
	b=XJM6tZwNNCEuZGx3tdXSNV2JHkiu6Beqr9kPtoMwg72+NkjuByeVsiAugwlJuXT2
	A19j9NUFfapiIcKfBqzl/j/Z975b5b8Gi1Hd+q2FjTcN8snDbPWl2iKnaFH/traV9Hu
	C5caQlB07UapKF7Ro2eGmSgAQTjTcR7YB0bjLg4A=
Content-Type: multipart/mixed; boundary="===============2839784596386320989=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 7a93ae5d3c90cb5d1d8d775a8cd9d30bc745f658
 SUCCEEDED
Message-ID: <0101018d65d3fc0a-c70c2732-790a-4be8-9557-dd11f257cc70-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194709

--===============2839784596386320989==
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
ZXIKClJlZ2FyZHMsClRoZSBVcGdyYWRlIEhlbHBlcgoKLS0gPjggLS0KRnJvbSAyZmQwMTQyZDU5
MzNkMmMxNDRlYzk0ZTc4MWYyMDM5OTFlMjhlZDlkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpG
cm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+CkRhdGU6IFRodSwgMSBG
ZWIgMjAyNCAxNToyNTo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB1enpsZXM6IHVwZ3JhZGUg
dG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxl
c19naXQuYmIgfCAyMyArKysrKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDIx
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMv
cHV6emxlc19naXQuYmIKaW5kZXggYWI0YjIzOTRiOC4uNjEwMTYzNWY1NiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xLDggKzEsMjcgQEAKKyMgRklYTUU6
IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9v
bCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRo
ZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNF
TlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUg
Y29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdM
aWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5n
ZXM6CisjCisjIC0tLSBMSUNFTkNFCisjICsrKyBMSUNFTkNFCisjIEBAIC0xLDQgKzEsNCBAQAor
IyAtVGhpcyBzb2Z0d2FyZSBpcyBjb3B5cmlnaHQgKGMpIDIwMDQtMjAyMyBTaW1vbiBUYXRoYW0u
CisjICtUaGlzIHNvZnR3YXJlIGlzIGNvcHlyaWdodCAoYykgMjAwNC0yMDI0IFNpbW9uIFRhdGhh
bS4KKyMgIAorIyAgUG9ydGlvbnMgY29weXJpZ2h0IFJpY2hhcmQgQm91bHRvbiwgSmFtZXMgSGFy
dmV5LCBNaWtlIFBpbm5hLCBKb25hcworIyAgS8O2bGtlciwgRGFyaXVzeiBPbHN6ZXdza2ksIE1p
Y2hhZWwgU2NoaWVybCwgTGFtYnJvcyBMYW1icm91LCBCZXJuZAorIyAKKyMKKwogU1VNTUFSWSA9
ICJTaW1vbiBUYXRoYW0ncyBQb3J0YWJsZSBQdXp6bGUgQ29sbGVjdGlvbiIKIERFU0NSSVBUSU9O
ID0gIkNvbGxlY3Rpb24gb2Ygc21hbGwgY29tcHV0ZXIgcHJvZ3JhbXMgd2hpY2ggaW1wbGVtZW50
IG9uZS1wbGF5ZXIgcHV6emxlIGdhbWVzLiIKIEhPTUVQQUdFID0gImh0dHA6Ly93d3cuY2hpYXJr
LmdyZWVuZW5kLm9yZy51ay9+c2d0YXRoYW0vcHV6emxlcy8iCiBMSUNFTlNFID0gIk1JVCIKLUxJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOQ0U7bWQ1PTkyZDJiN2EyZmM5NmI1ZjdmMTcx
MDFkZjdkYjFmZWZhIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5DRTttZDU9MTkx
NTQyYjMyMzc3YmRlMjU0ZTk3OTllMGE0NmYxOGIiCiAKICMgZ3RrIHN1cHBvcnQgaW5jbHVkZXMg
YSBidW5jaCBvZiB4MTEgaGVhZGVycwogUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0gIngxMSIK
QEAgLTEwLDcgKzI5LDcgQEAgUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0gIngxMSIKIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0LnRhcnRhcnVzLm9yZy9zaW1vbi9wdXp6bGVzLmdpdDticmFuY2g9bWFp
bjtwcm90b2NvbD1odHRwcyIKIAogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIxIgotU1JDUkVW
ID0gIjA4MzY1ZmIyNjBhZTZlMzI0NDJkZDlmMTk2ZTY1ZDEzZmFjYjRiMzMiCitTUkNSRVYgPSAi
N2E5M2FlNWQzYzkwY2I1ZDFkOGQ3NzVhOGNkOWQzMGJjNzQ1ZjY1OCIKIFBFID0gIjIiCiBQViA9
ICIwLjArZ2l0IgogCi0tIAoyLjQyLjAKCg==

--===============2839784596386320989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+08365fb260-r0'])", added "puzzles (['= 2:0.0+git0+7a93ae5d3c-r0'])"
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+08365fb260-r0'])", added "puzzles-dev (['= 2:0.0+git0+7a93ae5d3c-r0'])"
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c

--===============2839784596386320989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1849 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1849 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-ffb6caa18583d46597c7dbe73cf5f5a367690502"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ffb6caa18583d46597c7dbe73cf5f5a367690502"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 407 Local 395 Mirrors 0 Missed 12 Current 650 (97% match, 98% complete)
Removing 10 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2584 of 2925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 2906 of 2925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 2907 of 2925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 2908 of 2925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: Running task 2909 of 2925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Succeeded
NOTE: Running task 2910 of 2925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2911 of 2925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2912 of 2925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2913 of 2925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Succeeded
NOTE: Running task 2914 of 2925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Succeeded
NOTE: Running task 2915 of 2925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Succeeded
NOTE: Running task 2916 of 2925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2917 of 2925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot unihash changed to 8bd50a2067682d7cf4feba21f40efed44602576ff9719e4601f5cc2577d1217f
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Succeeded
NOTE: Running task 2918 of 2925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2918 tasks of which 2904 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201152306.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201152306.txt [-s server]
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/puzzles/0.0+git/temp/log.do_packagedata.2075396
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata) failed with exit code '1'

--===============2839784596386320989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1850 targets, 46 skipped, 0 masked, 0 errors.
Removing 89 recipes from the core2-64 sysroot...done.
Removing 89 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-ffb6caa18583d46597c7dbe73cf5f5a367690502"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ffb6caa18583d46597c7dbe73cf5f5a367690502"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 654 Local 640 Mirrors 0 Missed 14 Current 356 (97% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 364 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 371 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 373 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 480 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_recipe_qa_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 482 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1389 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 1394 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 566 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 570 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 1458 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 577 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 580 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 581 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_populate_sysroot_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1460 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1466 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.3.bb:do_packagedata_setscene)
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 602 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 606 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 610 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 614 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 615 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 616 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 617 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 621 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 625 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 627 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 628 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-8.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 634 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 635 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 636 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 644 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 646 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 649 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 651 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 656 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 658 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 661 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 666 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 668 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 671 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 672 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 675 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 682 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 695 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 697 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 701 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 708 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 712 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 716 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 717 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 721 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 727 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 729 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 736 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 739 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 743 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 744 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 746 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 747 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 751 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 753 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 757 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 758 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 762 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 763 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 765 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 766 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 769 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libpng/1.6.40/temp/log.do_packagedata_setscene.2079126
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 772 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 773 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_package_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 774 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 778 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 779 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 783 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 784 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 786 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 789 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 790 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 793 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 795 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1688 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 800 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 804 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 805 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 807 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 810 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1713 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1714 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 812 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 815 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 817 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 818 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1740 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libpng-1.6.40-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 821 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 822 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1748 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 825 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 826 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 827 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 828 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 830 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 831 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 832 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 834 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 835 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 836 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 839 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 840 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 841 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 843 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 845 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 846 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 847 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 848 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 849 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 850 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 853 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 854 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 855 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 856 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 862 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 865 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 868 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 870 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 872 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 874 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 875 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 876 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 878 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 879 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 881 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 883 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 885 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 886 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 887 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 888 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 890 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 893 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 895 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 897 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 898 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 899 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 902 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 904 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1817 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 907 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 910 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 915 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 916 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 917 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 918 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 920 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 921 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 922 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 923 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 924 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 925 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 926 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 928 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 929 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 931 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 933 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: Running task 1853 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 938 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 940 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 943 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 946 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 947 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 948 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 950 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 953 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1894 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 955 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 956 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 958 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 960 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 961 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 966 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 968 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 970 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 971 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 973 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 975 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 976 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 978 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 979 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 981 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 983 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 984 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 985 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 989 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 990 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 992 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 997 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 998 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1000 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1003 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1005 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1006 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1008 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1010 of 1010 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2374 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2384 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata: Started
NOTE: Running task 2640 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 52c40a9b45d017fb150b0f32e9bc87916c5468e98536809e2807b648d05455a0 to hashserv.yocto.io:8686 ({'taskhash': '4470aba06e5a1da0fe3b13c257e09eace2e40f0e4d505256f96fad37fc1bc994', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '52c40a9b45d017fb150b0f32e9bc87916c5468e98536809e2807b648d05455a0'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 4470aba06e5a1da0fe3b13c257e09eace2e40f0e4d505256f96fad37fc1bc994 -> 52c40a9b45d017fb150b0f32e9bc87916c5468e98536809e2807b648d05455a0 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5009bfdce64be5968dd9927eeb08146bbc59582b45f2dbfd597d0d6515f565bd
NOTE: Running task 2768 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2785 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2786 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Succeeded
NOTE: Running task 2787 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Succeeded
NOTE: Running task 2788 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Succeeded
NOTE: Running task 2789 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2790 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Succeeded
NOTE: Running task 2791 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata unihash changed to 33a7ef54dd52d290d85463864ccd27f52406406b7f7f0680724947eb4958276a
NOTE: Setscene tasks completed
NOTE: Running task 2792 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_spdx)
NOTE: Running task 2793 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_ipk)
NOTE: Running task 2794 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_deb)
NOTE: Running task 2795 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2796 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+git-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_ipk: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_deb: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_ipk unihash changed to 033b83b6dd384c9a2473d38f8b4b9cf0c96ac30b991b7a19c850bdaeaab7d3da
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa unihash changed to 21428335f7443254df49f6512d606b089b4e063fd9ed9a93e7a7b67607d55378
NOTE: recipe puzzles-2_0.0+git-r0: task do_create_spdx: Succeeded
NOTE: Running task 2797 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_runtime_spdx)
NOTE: recipe puzzles-2_0.0+git-r0: task do_create_runtime_spdx: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_deb unihash changed to 67e791c691d9bedca43fd926e388be402ea4093d269b85236891184c5e490a36
NOTE: Running noexec task 2798 of 2798 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2798 tasks of which 2767 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: libpng-1.6.40-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-src went backwards which would break package feeds (from 0:1.6.41-r0 to 0:1.6.40-r0) [version-going-backwards]
ERROR: libpng-1.6.40-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-dbg went backwards which would break package feeds (from 0:1.6.41-r0 to 0:1.6.40-r0) [version-going-backwards]
ERROR: libpng-1.6.40-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-tools went backwards which would break package feeds (from 0:1.6.41-r0 to 0:1.6.40-r0) [version-going-backwards]
ERROR: libpng-1.6.40-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-staticdev went backwards which would break package feeds (from 0:1.6.41-r0 to 0:1.6.40-r0) [version-going-backwards]
ERROR: libpng-1.6.40-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-dev went backwards which would break package feeds (from 0:1.6.41-r0 to 0:1.6.40-r0) [version-going-backwards]
ERROR: libpng-1.6.40-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-doc went backwards which would break package feeds (from 0:1.6.41-r0 to 0:1.6.40-r0) [version-going-backwards]
ERROR: libpng-1.6.40-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-locale went backwards which would break package feeds (from 0:1.6.41-r0 to 0:1.6.40-r0) [version-going-backwards]
ERROR: libpng-1.6.40-r0 do_packagedata_setscene: QA Issue: Package version for package libpng went backwards which would break package feeds (from 0:1.6.41-r0 to 0:1.6.40-r0) [version-going-backwards]
ERROR: libpng-1.6.40-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2839784596386320989==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSAyZmQwMTQyZDU5MzNkMmMxNDRlYzk0ZTc4MWYyMDM5OTFlMjhlZDlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxNToyNTo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB1
enpsZXM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1zYXRv
L3B1enpsZXMvcHV6emxlc19naXQuYmIgfCAyMyArKysrKysrKysrKysrKysrKysrKystLQogMSBm
aWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBl
cy1zYXRvL3B1enpsZXMvcHV6emxlc19naXQuYmIKaW5kZXggYWI0YjIzOTRiOC4uNjEwMTYzNWY1
NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xLDggKzEs
MjcgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBk
YXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVy
ZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2Ug
dXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hh
bmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4K
KyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykK
KyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTkNFCisjICsrKyBMSUNFTkNFCisjIEBA
IC0xLDQgKzEsNCBAQAorIyAtVGhpcyBzb2Z0d2FyZSBpcyBjb3B5cmlnaHQgKGMpIDIwMDQtMjAy
MyBTaW1vbiBUYXRoYW0uCisjICtUaGlzIHNvZnR3YXJlIGlzIGNvcHlyaWdodCAoYykgMjAwNC0y
MDI0IFNpbW9uIFRhdGhhbS4KKyMgIAorIyAgUG9ydGlvbnMgY29weXJpZ2h0IFJpY2hhcmQgQm91
bHRvbiwgSmFtZXMgSGFydmV5LCBNaWtlIFBpbm5hLCBKb25hcworIyAgS8O2bGtlciwgRGFyaXVz
eiBPbHN6ZXdza2ksIE1pY2hhZWwgU2NoaWVybCwgTGFtYnJvcyBMYW1icm91LCBCZXJuZAorIyAK
KyMKKwogU1VNTUFSWSA9ICJTaW1vbiBUYXRoYW0ncyBQb3J0YWJsZSBQdXp6bGUgQ29sbGVjdGlv
biIKIERFU0NSSVBUSU9OID0gIkNvbGxlY3Rpb24gb2Ygc21hbGwgY29tcHV0ZXIgcHJvZ3JhbXMg
d2hpY2ggaW1wbGVtZW50IG9uZS1wbGF5ZXIgcHV6emxlIGdhbWVzLiIKIEhPTUVQQUdFID0gImh0
dHA6Ly93d3cuY2hpYXJrLmdyZWVuZW5kLm9yZy51ay9+c2d0YXRoYW0vcHV6emxlcy8iCiBMSUNF
TlNFID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOQ0U7bWQ1PTkyZDJi
N2EyZmM5NmI1ZjdmMTcxMDFkZjdkYjFmZWZhIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5DRTttZDU9MTkxNTQyYjMyMzc3YmRlMjU0ZTk3OTllMGE0NmYxOGIiCiAKICMgZ3RrIHN1
cHBvcnQgaW5jbHVkZXMgYSBidW5jaCBvZiB4MTEgaGVhZGVycwogUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIngxMSIKQEAgLTEwLDcgKzI5LDcgQEAgUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVT
ID0gIngxMSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnRhcnRhcnVzLm9yZy9zaW1vbi9wdXp6bGVz
LmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyIKIAogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlU
UyA9ICIxIgotU1JDUkVWID0gIjA4MzY1ZmIyNjBhZTZlMzI0NDJkZDlmMTk2ZTY1ZDEzZmFjYjRi
MzMiCitTUkNSRVYgPSAiN2E5M2FlNWQzYzkwY2I1ZDFkOGQ3NzVhOGNkOWQzMGJjNzQ1ZjY1OCIK
IFBFID0gIjIiCiBQViA9ICIwLjArZ2l0IgogCi0tIAoyLjQyLjAKCg==

--===============2839784596386320989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+08365fb260-r0'])", added "puzzles (['= 2:0.0+git0+7a93ae5d3c-r0'])"
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3838531 to 3838603 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+08365fb260-r0'])", added "puzzles-dev (['= 2:0.0+git0+7a93ae5d3c-r0'])"
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c

--===============2839784596386320989==--

