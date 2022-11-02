Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB794C64EC6
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web08.876.1667349633334240739
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Yui07FtQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018435c855cb-3371176d-3eb8-4976-bdaa-12714718ad31-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dC7dPd7z6jRVUDwrqxcA8SdUoy+BsMBwadZAN3Bvq3I=;
	b=Yui07FtQivDDJ7Sm2vcKXHin5zMFKG+/ukOEJTfHg+0s9Y/x1NwR8My6TNtMmOBO
	gg7BTN8R4VWftnOWw62MuvwkFZN/tQtaAXB7fHhLhWa9kjtqJb3XO3xBiclBCFcMq6U
	5AtOfTDBGDyKfaQJOH6YIuoNks5e1C1sS9j2631c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dC7dPd7z6jRVUDwrqxcA8SdUoy+BsMBwadZAN3Bvq3I=;
	b=U9ASZYkULX/hkJUoGEp6TiE+gj01BRVrrZVbG/FtMCbf2sfRcYth72/rqVktVWw0
	U6okIW2L0MJSNspQ3foKQD/K1Jv3Y2IDAyogKh0YBHElVPxiHZ3i4WAIU6KvhhpQ767
	dXinHra29bmP7SP67WfB88SiTLY1yg/pzxQeLrAg=
Content-Type: multipart/mixed; boundary="===============4560827130737018016=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-bcrypt: upgrading to 4.0.1 FAILED
Message-ID: <0101018435c855cb-3371176d-3eb8-4976-bdaa-12714718ad31-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172425

--===============4560827130737018016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-bcrypt* to *4.0.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-bcrypt-upgrade-4.0.0-4.0.1.patch
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
--===============4560827130737018016==
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
meta-yocto-bsp       = "tmp-auh-upgrades:7b9d9998f6dd472ceee8bb1d3e62e5bceee6ad71"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 94 Local 87 Mirrors 0 Missed 7 Current 296 (92% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1009 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1477 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: Running task 1478 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1479 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1480 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1481 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_create_wrappers)
NOTE: Running task 1482 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: Running task 1483 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_populate_lic)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 1484 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1485 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1486 of 1495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| running bdist_wheel
| running build
| running build_py
| creating build
| creating build/lib.linux-x86_64-cpython-311
| creating build/lib.linux-x86_64-cpython-311/bcrypt
| copying src/bcrypt/__init__.py -> build/lib.linux-x86_64-cpython-311/bcrypt
| copying src/bcrypt/__about__.py -> build/lib.linux-x86_64-cpython-311/bcrypt
| running egg_info
| writing src/bcrypt.egg-info/PKG-INFO
| writing dependency_links to src/bcrypt.egg-info/dependency_links.txt
| writing requirements to src/bcrypt.egg-info/requires.txt
| writing top-level names to src/bcrypt.egg-info/top_level.txt
| reading manifest file 'src/bcrypt.egg-info/SOURCES.txt'
| reading manifest template 'MANIFEST.in'
| warning: no previously-included files found matching 'requirements.txt'
| warning: no previously-included files found matching 'release.py'
| warning: no previously-included files found matching 'mypy.ini'
| warning: no previously-included files matching '*' found under directory '.github'
| warning: no previously-included files matching '*' found under directory '.circleci'
| warning: no previously-included files found matching 'src/_bcrypt/target'
| warning: no previously-included files matching '*' found under directory 'src/_bcrypt/target'
| adding license file 'LICENSE'
| writing manifest file 'src/bcrypt.egg-info/SOURCES.txt'
| copying src/bcrypt/_bcrypt.pyi -> build/lib.linux-x86_64-cpython-311/bcrypt
| copying src/bcrypt/py.typed -> build/lib.linux-x86_64-cpython-311/bcrypt
| running build_ext
| running build_rust
| cargo rustc --lib --message-format=json-render-diagnostics --manifest-path src/_bcrypt/Cargo.toml --target i686-poky-linux-gnu --release -v --features pyo3/extension-module pyo3/abi3-py36 -- --crate-type cdylib
| error: failed to select a version for the requirement `sha2 = "^0.10.2"` (locked to 0.10.6)
| candidate versions found which didn't match: 0.10.2
| location searched: directory source `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.1-r0/cargo_home/bitbake` (which is replacing registry `crates-io`)
| required by package `bcrypt-pbkdf v0.8.1`
|     ... which satisfies dependency `bcrypt-pbkdf = "^0.8.1"` (locked to 0.8.1) of package `bcrypt-rust v0.1.0 (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.1-r0/bcrypt-4.0.1/src/_bcrypt)`
| perhaps a crate was updated and forgotten to be re-vendored?
| 
|     =============================DEBUG ASSISTANCE=============================
|     If you are seeing a compilation error please try the following steps to
|     successfully install bcrypt:
|     1) Upgrade to the latest pip and try again. This will fix errors for most
|        users. See: https://pip.pypa.io/en/stable/installing/#upgrading-pip
|     2) Ensure you have a recent Rust toolchain installed. bcrypt requires
|        rustc >= 1.56.0.
| 
|     Python: 3.11.0
|     platform: Linux-4.18.0-372.32.1.el8_6.x86_64-x86_64-with-glibc2.36
|     pip: 22.2.2
|     setuptools: 65.0.2
|     setuptools_rust: 1.5.2
|     rustc: 1.64.0
|     =============================DEBUG ASSISTANCE=============================
| 
| error: `cargo rustc --lib --message-format=json-render-diagnostics --manifest-path src/_bcrypt/Cargo.toml --target i686-poky-linux-gnu --release -v --features 'pyo3/extension-module pyo3/abi3-py36' -- --crate-type cdylib` failed with code 101
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.1-r0/temp/run.do_compile.2826916:186 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.1-r0/temp/run.do_compile.2826916, line 186
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.1-r0/temp/run.do_compile.2826916, line 176
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.1-r0/temp/run.do_compile.2826916, line 165
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.1-r0/temp/run.do_compile.2826916, line 190
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1486 tasks of which 1475 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-bcrypt-4.0.1-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-bcrypt-4.0.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.1-r0/temp/run.do_compile.2826916', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.1-r0/temp/log.do_compile.2826916
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile) failed with exit code '1'

--===============4560827130737018016==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-bcrypt-upgrade-4.0.0-4.0.1.patch"

RnJvbSA0ZTk1MzQwZjBiYzE2NDM1Zjc2MzJmZDQ2MjA4YTVhMjZhZTAxYWVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwOTowNDoyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYmNyeXB0OiB1cGdyYWRlIDQuMC4wIC0+IDQuMC4xCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtYmNyeXB0XzQuMC4wLmJiID0+IHB5dGhvbjMtYmNyeXB0XzQuMC4xLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtYmNyeXB0XzQuMC4wLmJiID0+IHB5
dGhvbjMtYmNyeXB0XzQuMC4xLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1iY3J5cHRfNC4wLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmNyeXB0XzQuMC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iY3J5cHRf
NC4wLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1i
Y3J5cHRfNC4wLjEuYmIKaW5kZXggYWM3OTVjYThhYi4uYjFlZDA1MzEzYiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJjcnlwdF80LjAuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmNyeXB0XzQuMC4xLmJiCkBA
IC01LDcgKzUsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2plY3QvYmNyeXB0
LyIKIAogREVQRU5EUyArPSAiJHtQWVRIT05fUE59LWNmZmktbmF0aXZlIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiYzU5YzE3MGZjOTIyNWZhYWQwNGRkZTFiYTYxZDg1YjQxMzk0NmU4Y2UyZTVm
NWY1ZmYzMGRmZDY3MjgzZjMxOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyN2QzNzU5MDNhYzgy
NjFjZmU0MDQ3ZjY3MDlkMTZmN2QxOGQzOWIxZWM5MmFhZjcyYWY5ODk1NTJhNjUwZWJkIgogCiBp
bmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHMzX3J1c3QgcHRlc3QKIAotLSAKMi4zMS4xCgo=

--===============4560827130737018016==--

