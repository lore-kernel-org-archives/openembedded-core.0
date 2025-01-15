Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D7AC02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:20 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.17860.1736936760080810099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=AOXfUjTd;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=R6YWUbaA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010194697fcd29-cb8eeeb6-d129-4760-9e49-e2e8dfbfa13b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936770;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ui0QG813u+/U7KwIrYDsMT6q/llXR1iC07rcKpJzUgA=;
	b=AOXfUjTdulcG4CWyhWYgIllbrSh7DoIwYAzUP21/2yfu1XQiz0bbs9+WtdjmR/qx
	BKjI8E74jY/dECcHAqkvqNWN4jssP4vx5gvPfPKywI10Uwd7Jf9tx1eV6eeQsiUkift
	wvkfiUHDUNGre4BoxjKa1zaqfIntNrtqWo0EBbMo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936770;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ui0QG813u+/U7KwIrYDsMT6q/llXR1iC07rcKpJzUgA=;
	b=R6YWUbaAqzmodSzx8d1wD3eA6q9YXQ8+2KMomxUJ5Vvnvhi0ZbFKxNoAZorv7evJ
	Rp/qEe51JL/LoBmDNf+I1bMLr4cifSA9zWRldY/61NgPxnpzvzeJqWreZvwvh2hofZQ
	83AqpN9PJM5Ld1olb7yr+hZ8yOaeXi+/Tif1XR6o=
Content-Type: multipart/mixed; boundary="===============6587720374667879250=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-typogrify: upgrading to 2.1.0 FAILED
Message-ID: <01010194697fcd29-cb8eeeb6-d129-4760-9e49-e2e8dfbfa13b-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209849

--===============6587720374667879250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpweXRob24zLXR5cG9ncmlmeSogdG8gKjIuMS4wKiBoYXMgRmFpbGVkKGRvX2NvbXBpbGUp
LgoKRGV0YWlsZWQgZXJyb3IgaW5mb3JtYXRpb246Cgpkb19jb21waWxlIGZhaWxlZAoKCgpOZXh0
IHN0ZXBzOgogICAgLSBhcHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLXB5dGhvbjMtdHlwb2dy
aWZ5LXVwZ3JhZGUtMi4wLjctMi4xLjAucGF0Y2gKICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8g
dXBzdHJlYW0gcGF0Y2hlcyBhbmQgc3VtbWFyaXplIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdl
LAogICAgLSBjb21waWxlIGFuIGltYWdlIHRoYXQgY29udGFpbnMgdGhlIHBhY2thZ2UKICAgIC0g
cGVyZm9ybSBzb21lIGJhc2ljIHNhbml0eSB0ZXN0cwogICAgLSBhbWVuZCB0aGUgcGF0Y2ggYW5k
IHNpZ24gaXQgb2ZmOiBnaXQgY29tbWl0IC1zIC0tcmVzZXQtYXV0aG9yIC0tYW1lbmQKICAgIC0g
c2VuZCBpdCB0byB0aGUgYXBwcm9wcmlhdGUgbWFpbGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5LCBp
ZiB5b3UgYmVsaWV2ZSB0aGUgcmVjaXBlIHNob3VsZCBub3QgYmUgdXBncmFkZWQgYXQgdGhpcyB0
aW1lLAp5b3UgY2FuIGZpbGwgUkVDSVBFX05PX1VQREFURV9SRUFTT04gaW4gcmVzcGVjdGl2ZSBy
ZWNpcGUgZmlsZSBzbyB0aGF0CmF1dG9tYXRpYyB1cGdyYWRlcyB3b3VsZCBubyBsb25nZXIgYmUg
YXR0ZW1wdGVkLgoKUGxlYXNlIHJldmlldyB0aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIg
aW5mb3JtYXRpb24gYW5kIGJ1aWxkL3VwZGF0ZSBmYWlsdXJlcy4KQW55IHByb2JsZW0gcGxlYXNl
IGZpbGUgYSBidWcgYXQgaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1
Zy5jZ2k/cHJvZHVjdD1BdXRvbWF0ZWQlMjBVcGRhdGUlMjBIYW5kbGVyCgpSZWdhcmRzLApUaGUg
VXBncmFkZSBIZWxwZXIKCi0tID44IC0tCkZyb20gNzQzYzBkMTA0NGY4MDYzNDg0YjI2NDFkMTUx
MWMwMmE4Y2Y4NTQwMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxw
ZXIgPGF1aEB5b2N0b3Byb2plY3Qub3JnPgpEYXRlOiBXZWQsIDE1IEphbiAyMDI1IDA3OjU3OjE0
ICswMDAwClN1YmplY3Q6IFtQQVRDSF0gcHl0aG9uMy10eXBvZ3JpZnk6IHVwZ3JhZGUgMi4wLjcg
LT4gMi4xLjAKCi0tLQogLi4uZnlfMi4wLjcuYmIgPT4gcHl0aG9uMy10eXBvZ3JpZnlfMi4xLjAu
YmJ9IHwgMjUgKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi97cHl0aG9uMy10eXBvZ3JpZnlfMi4wLjcuYmIgPT4gcHl0aG9uMy10eXBvZ3JpZnlfMi4xLjAu
YmJ9ICgyNiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXR5cG9ncmlmeV8yLjAuNy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy10eXBvZ3JpZnlfMi4xLjAuYmIKc2ltaWxhcml0eSBpbmRleCAyNiUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXR5cG9ncmlmeV8yLjAuNy5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXR5cG9ncmlmeV8y
LjEuMC5iYgppbmRleCA4YmEyNzg4YzliLi4wNjM1NWVhMTM3IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHlwb2dyaWZ5XzIuMC43LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10eXBvZ3JpZnlfMi4xLjAuYmIKQEAg
LTEsMTIgKzEsMzMgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZl
IGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0
aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0Lgor
IyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6
ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0
ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVw
ZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFLnR4dAorIyArKysg
TElDRU5TRS50eHQKKyMgQEAgLTEsNSArMSw1IEBACisjIC1Db3B5cmlnaHQgKGMpIDIwMDcsIENo
cmlzdGlhbiBNZXR0cworIyAtVXBkYXRlcyBjb3B5cmlnaHQgKGMpIDIwMTQsIEp1c3RpbiBNYXll
cgorIyArQ29weXJpZ2h0IChjKSAyMDE04oCTcHJlc2VudCwgSnVzdGluIE1heWVyCisjICtDb3B5
cmlnaHQgKGMpIDIwMDfigJMyMDEzLCBDaHJpc3RpYW4gTWV0dHMKKyMgIEFsbCByaWdodHMgcmVz
ZXJ2ZWQuCisjICAKKyMgIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5h
cnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAorIyAKKyMKKwogU1VNTUFSWSA9ICJGaWx0ZXJzIHRv
IGVuaGFuY2Ugd2ViIHR5cG9ncmFwaHksIGluY2x1ZGluZyBzdXBwb3J0IGZvciBEamFuZ28gJiBK
aW5qYSB0ZW1wbGF0ZXMiCiBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vbWludGNoYW9z
L3R5cG9ncmlmeSIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIgotTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTEyYmM3OTJkNmY1NDE1ZGJmNDIxZjNmZDE4M2M2ZGQy
IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PWI4NTU4ZWJjYzY4
MjA3OGMxYTQ0ZDAyMjc1NzMwMDZkIgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAogUFlQ
SV9QQUNLQUdFID0gInR5cG9ncmlmeSIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4YmU0NjY4Y2Rh
NDM0MTYzY2UyMjlkODdjYTI3M2ExMTkyMmNiMTYxNGNiMzU5OTcwYjdkYzk2ZWVkMTNjYjM4Igor
U1JDX1VSSVtzaGEyNTZzdW1dID0gImYwYWEwMDRlOTgwMzJhNmU2YmU0YzlkYTY1ZTdlYjcxNTBl
MzZjYTNiZjUwOGFkYmNkYTgyYjRkMDAzZTYxZWUiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZl
IG5hdGl2ZXNkayIKIAotLSAKMi40NC4xCgo=

--===============6587720374667879250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1876 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (918 cached, 1 parsed). 1874 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:afa67b530d0245be4d34d06ad233a409c64c8277"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 297 Local 285 Mirrors 0 Missed 12 Current 358 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1449 of 1863 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_recipe_qa)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1843 of 1863 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_fetch)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_fetch: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1844 of 1863 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_unpack)
NOTE: Running task 1845 of 1863 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_unpack: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1846 of 1863 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_patch)
NOTE: Running task 1847 of 1863 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_patch: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1848 of 1863 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1849 of 1863 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_check_backend)
NOTE: Running task 1850 of 1863 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_populate_lic)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_check_backend: Started
WARNING: python3-typogrify-2.1.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with hatchling.build, use the correct class [pep517-backend]
NOTE: recipe python3-typogrify-2.1.0-r0: task do_populate_lic: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_check_backend: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1851 of 1863 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_configure)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_configure: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1852 of 1863 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_compile)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typogrify/2.1.0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typogrify/2.1.0/typogrify-2.1.0/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typogrify/2.1.0/temp/run.do_compile.3265136:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typogrify/2.1.0/temp/run.do_compile.3265136, line 180
| 	#2: setuptools3_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typogrify/2.1.0/temp/run.do_compile.3265136, line 170
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typogrify/2.1.0/temp/run.do_compile.3265136, line 152
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typogrify/2.1.0/temp/run.do_compile.3265136, line 184
NOTE: recipe python3-typogrify-2.1.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1852 tasks of which 1841 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250115075700.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250115075700.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typogrify/2.1.0/temp/log.do_compile.3265136
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-typogrify-2.1.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-typogrify-2.1.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typogrify/2.1.0/temp/run.do_compile.3265136' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typogrify/2.1.0/temp/log.do_compile.3265136
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_compile) failed with exit code '1'

--===============6587720374667879250==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-typogrify-upgrade-2.0.7-2.1.0.patch"

RnJvbSA3NDNjMGQxMDQ0ZjgwNjM0ODRiMjY0MWQxNTExYzAyYThjZjg1NDAxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDc6NTc6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXR5cG9ncmlmeTogdXBncmFkZSAyLjAuNyAtPiAyLjEuMAoKLS0tCiAuLi5meV8yLjAu
Ny5iYiA9PiBweXRob24zLXR5cG9ncmlmeV8yLjEuMC5iYn0gfCAyNSArKysrKysrKysrKysrKysr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXR5cG9ncmlmeV8yLjAu
Ny5iYiA9PiBweXRob24zLXR5cG9ncmlmeV8yLjEuMC5iYn0gKDI2JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHlwb2dyaWZ5XzIuMC43LmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXR5cG9ncmlmeV8yLjEuMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDI2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtdHlwb2dyaWZ5XzIuMC43LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHlwb2dyaWZ5XzIuMS4wLmJiCmluZGV4IDhiYTI3ODhjOWIu
LjA2MzU1ZWExMzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy10eXBvZ3JpZnlfMi4wLjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXR5cG9ncmlmeV8yLjEuMC5iYgpAQCAtMSwxMiArMSwzMyBAQAorIyBGSVhNRTog
dGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29s
IHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhl
IG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VO
U0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBj
b21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xp
Y2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdl
czoKKyMKKyMgLS0tIExJQ0VOU0UudHh0CisjICsrKyBMSUNFTlNFLnR4dAorIyBAQCAtMSw1ICsx
LDUgQEAKKyMgLUNvcHlyaWdodCAoYykgMjAwNywgQ2hyaXN0aWFuIE1ldHRzCisjIC1VcGRhdGVz
IGNvcHlyaWdodCAoYykgMjAxNCwgSnVzdGluIE1heWVyCisjICtDb3B5cmlnaHQgKGMpIDIwMTTi
gJNwcmVzZW50LCBKdXN0aW4gTWF5ZXIKKyMgK0NvcHlyaWdodCAoYykgMjAwN+KAkzIwMTMsIENo
cmlzdGlhbiBNZXR0cworIyAgQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgIAorIyAgUmVkaXN0cmli
dXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0
CisjIAorIworCiBTVU1NQVJZID0gIkZpbHRlcnMgdG8gZW5oYW5jZSB3ZWIgdHlwb2dyYXBoeSwg
aW5jbHVkaW5nIHN1cHBvcnQgZm9yIERqYW5nbyAmIEppbmphIHRlbXBsYXRlcyIKIEhPTUVQQUdF
ID0gImh0dHBzOi8vZ2l0aHViLmNvbS9taW50Y2hhb3MvdHlwb2dyaWZ5IgogTElDRU5TRSA9ICJC
U0QtMy1DbGF1c2UiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9
MTJiYzc5MmQ2ZjU0MTVkYmY0MjFmM2ZkMTgzYzZkZDIiCitMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9MSUNFTlNFLnR4dDttZDU9Yjg1NThlYmNjNjgyMDc4YzFhNDRkMDIyNzU3MzAwNmQiCiAK
IGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCiBQWVBJX1BBQ0tBR0UgPSAidHlwb2dyaWZ5Igot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjhiZTQ2NjhjZGE0MzQxNjNjZTIyOWQ4N2NhMjczYTExOTIy
Y2IxNjE0Y2IzNTk5NzBiN2RjOTZlZWQxM2NiMzgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjBh
YTAwNGU5ODAzMmE2ZTZiZTRjOWRhNjVlN2ViNzE1MGUzNmNhM2JmNTA4YWRiY2RhODJiNGQwMDNl
NjFlZSIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgogCi0tIAoyLjQ0LjEK
Cg==

--===============6587720374667879250==--

