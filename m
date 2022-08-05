Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B314C3276B
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:38 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web12.3948.1659679408739976094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GeqMzCD/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 010101826c99fe99-94f80549-f39b-4b62-b792-d0a824434b87-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=e4oxz7buTiuXNuGPskYlMPi/2P4aSZGKURhObOhDuE4=;
	b=GeqMzCD/KpubdSphzC6y8BbhSYwKNjAIwP7A6Rbfqe1PbMHoeh38rauKb9OkAe56
	1ynipWK0RbMayyBoGsbJGkwBruksHXS/Wp9vrVoJvk/yaqtZVIhnTRsQCivHmdVTvVE
	PmurdeRMsuDavXvpm7w9P09qlb35XpH/UJiVRzY8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=e4oxz7buTiuXNuGPskYlMPi/2P4aSZGKURhObOhDuE4=;
	b=fh9I9ThLy3WL6BX7BN7/trR7trEM28dDtvpK79aXOomGw2R8ugt2Wp/+JfbCL/0D
	dfpals7+XH/fJitlRsnd2Nc8SDCfnXoOLSs+0t7G/VszdxEZnxOOsG0R6otDElwiSmO
	dMWasznNar3vvIiQnZ+WeH6TLwr7l7i/muZcezyA=
Content-Type: multipart/mixed; boundary="===============6888585336737854905=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libstd-rs: upgrading to 1.62.1 FAILED
Message-ID: 
 <010101826c99fe99-94f80549-f39b-4b62-b792-d0a824434b87-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:27 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168903

--===============6888585336737854905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libstd-rs* to *1.62.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libstd-rs-upgrade-1.62.0-1.62.1.patch
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
--===============6888585336737854905==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libstd-rs-upgrade-1.62.0-1.62.1.patch"

RnJvbSA5ZjVhMzgxNzM0ZmY2NTMxZmQ2MzcyZWZjY2ViNDA0NWYzNWIzNDhhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNCBBdWcgMjAyMiAyMzoyNToxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnN0ZC1yczogdXBncmFkZSAxLjYyLjAgLT4gMS42Mi4xCgotLS0KIC4uLi9ydXN0L3tsaWJzdGQt
cnNfMS42Mi4wLmJiID0+IGxpYnN0ZC1yc18xLjYyLjEuYmJ9ICAgICAgICAgICB8IDAKIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydXN0L3J1c3Qtc291cmNlLmluYyAgICAgICAgICAgICAgICAgICAg
ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC97bGlic3RkLXJzXzEuNjIuMC5iYiA9
PiBsaWJzdGQtcnNfMS42Mi4xLmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVzdC9saWJzdGQtcnNfMS42Mi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1c3QvbGlic3RkLXJzXzEuNjIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvbGlic3RkLXJzXzEuNjIuMC5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvbGlic3RkLXJzXzEuNjIuMS5iYgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1zb3VyY2UuaW5jIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1zb3VyY2UuaW5jCmluZGV4IGZkYTI2NTM0ZTguLjA4
OTYwMjBiNmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0L3J1c3Qtc291
cmNlLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0LXNvdXJjZS5pbmMK
QEAgLTEsNSArMSw1IEBACiBTUkNfVVJJICs9ICJodHRwczovL3N0YXRpYy5ydXN0LWxhbmcub3Jn
L2Rpc3QvcnVzdGMtJHtQVn0tc3JjLnRhci54ejtuYW1lPXJ1c3QiCi1TUkNfVVJJW3J1c3Quc2hh
MjU2c3VtXSA9ICI2YzAwZWYxMTVjODk0YzI2NDVlNjBiNTA0OWE0ZjVkYWNmMWRjMGM5OTNmMzA3
NGY3YWU0ZmRmNGM3NTVkZDVlIgorU1JDX1VSSVtydXN0LnNoYTI1NnN1bV0gPSAiMDIwNjZhOTNj
MmY2NTk2Y2MwNDZhODk3ZDU3MTZjODZlMzYwN2MxY2QwZjU0ZGI5YTg2N2FlOGM4MjY1MDcyZSIK
IAogUlVTVFNSQyA9ICIke1dPUktESVJ9L3J1c3RjLSR7UFZ9LXNyYyIKIAotLSAKMi4zMS4xCgo=

--===============6888585336737854905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1659 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (879 cached, 9 parsed). 1659 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-06ed31b18558577cb3f94c46e08aa5704acdc026"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:06ed31b18558577cb3f94c46e08aa5704acdc026"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 34 Local 19 Mirrors 0 Missed 15 Current 137 (55% match, 91% complete)
Removing 6 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 409 of 728 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.0.bb:do_fetch)
NOTE: Running task 439 of 728 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.0.bb:do_fetch)
NOTE: Running task 611 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.62.0.bb:do_fetch)
NOTE: Running task 614 of 728 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_fetch)
NOTE: Running task 652 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.1.bb:do_fetch)
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_fetch: Started
NOTE: recipe rust-native-1.62.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.62.1-r0: task do_fetch: Started
WARNING: rust-cross-core2-32-glibc-1.62.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz
Cleaning and trying again.
WARNING: rust-cross-core2-32-glibc-1.62.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz_bad-checksum_6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e
NOTE: recipe libstd-rs-1.62.1-r0: task do_fetch: Succeeded
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_fetch: Started
NOTE: recipe cargo-native-1.62.0-r0: task do_fetch: Started
NOTE: Running task 673 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.1.bb:do_unpack)
NOTE: recipe libstd-rs-1.62.1-r0: task do_unpack: Started
WARNING: rust-cross-core2-32-glibc-1.62.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz
Cleaning and trying again.
WARNING: rust-cross-core2-32-glibc-1.62.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz_bad-checksum_6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e
WARNING: rust-cross-core2-32-glibc-1.62.0-r0 do_fetch: Checksum failure encountered with download of https://static.rust-lang.org/dist/rustc-1.62.0-src.tar.xz;name=rust - will attempt other sources if available
WARNING: rust-cross-core2-32-glibc-1.62.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz
Cleaning and trying again.
WARNING: rust-cross-core2-32-glibc-1.62.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz_bad-checksum_6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e
NOTE: recipe rust-cross-core2-32-glibc-1.62.0-r0: task do_fetch: Failed
NOTE: recipe libstd-rs-1.62.1-r0: task do_unpack: Succeeded
WARNING: rust-llvm-native-1.62.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz
Cleaning and trying again.
WARNING: rust-llvm-native-1.62.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz_bad-checksum_6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e
WARNING: rust-llvm-native-1.62.0-r0 do_fetch: Checksum failure encountered with download of https://static.rust-lang.org/dist/rustc-1.62.0-src.tar.xz;name=rust - will attempt other sources if available
WARNING: rust-llvm-native-1.62.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz
Cleaning and trying again.
WARNING: rust-llvm-native-1.62.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz_bad-checksum_6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e
NOTE: recipe rust-llvm-native-1.62.0-r0: task do_fetch: Failed
WARNING: cargo-native-1.62.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz
Cleaning and trying again.
WARNING: cargo-native-1.62.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz_bad-checksum_6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e
WARNING: cargo-native-1.62.0-r0 do_fetch: Checksum failure encountered with download of https://static.rust-lang.org/dist/rustc-1.62.0-src.tar.xz;name=rust - will attempt other sources if available
WARNING: cargo-native-1.62.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz
Cleaning and trying again.
WARNING: cargo-native-1.62.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz_bad-checksum_6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e
NOTE: recipe cargo-native-1.62.0-r0: task do_fetch: Failed
WARNING: rust-native-1.62.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz
Cleaning and trying again.
WARNING: rust-native-1.62.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz_bad-checksum_6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e
WARNING: rust-native-1.62.0-r0 do_fetch: Checksum failure encountered with download of https://static.rust-lang.org/dist/rustc-1.62.0-src.tar.xz;name=rust - will attempt other sources if available
WARNING: rust-native-1.62.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz
Cleaning and trying again.
WARNING: rust-native-1.62.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz_bad-checksum_6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e
NOTE: recipe rust-native-1.62.0-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 673 tasks of which 667 didn't need to be rerun and 4 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 4 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.62.0.bb:do_fetch
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.0.bb:do_fetch
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_fetch
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.0.bb:do_fetch
Summary: There were 23 WARNING messages.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: rust-cross-core2-32-glibc-1.62.0-r0 do_fetch: Checksum failure fetching https://static.rust-lang.org/dist/rustc-1.62.0-src.tar.xz;name=rust
ERROR: rust-cross-core2-32-glibc-1.62.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz\' has sha256 checksum \'6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e\' when \'02066a93c2f6596cc046a897d5716c86e3607c1cd0f54db9a867ae8c8265072e\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[rust.sha256sum] = "6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://static.rust-lang.org/dist/rustc-1.62.0-src.tar.xz;name=rust')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/rust-cross-core2-32-glibc/1.62.0-r0/temp/log.do_fetch.2369970
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.62.0.bb:do_fetch) failed with exit code '1'
ERROR: rust-llvm-native-1.62.0-r0 do_fetch: Checksum failure fetching https://static.rust-lang.org/dist/rustc-1.62.0-src.tar.xz;name=rust
ERROR: rust-llvm-native-1.62.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz\' has sha256 checksum \'6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e\' when \'02066a93c2f6596cc046a897d5716c86e3607c1cd0f54db9a867ae8c8265072e\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[rust.sha256sum] = "6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://static.rust-lang.org/dist/rustc-1.62.0-src.tar.xz;name=rust')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/rust-llvm-native/1.62.0-r0/temp/log.do_fetch.2369968
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.62.0.bb:do_fetch) failed with exit code '1'
ERROR: cargo-native-1.62.0-r0 do_fetch: Checksum failure fetching https://static.rust-lang.org/dist/rustc-1.62.0-src.tar.xz;name=rust
ERROR: cargo-native-1.62.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz\' has sha256 checksum \'6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e\' when \'02066a93c2f6596cc046a897d5716c86e3607c1cd0f54db9a867ae8c8265072e\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[rust.sha256sum] = "6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://static.rust-lang.org/dist/rustc-1.62.0-src.tar.xz;name=rust')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/cargo-native/1.62.0-r0/temp/log.do_fetch.2369971
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.62.0.bb:do_fetch) failed with exit code '1'
ERROR: rust-native-1.62.0-r0 do_fetch: Checksum failure fetching https://static.rust-lang.org/dist/rustc-1.62.0-src.tar.xz;name=rust
ERROR: rust-native-1.62.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.62.0-src.tar.xz\' has sha256 checksum \'6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e\' when \'02066a93c2f6596cc046a897d5716c86e3607c1cd0f54db9a867ae8c8265072e\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[rust.sha256sum] = "6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://static.rust-lang.org/dist/rustc-1.62.0-src.tar.xz;name=rust')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/rust-native/1.62.0-r0/temp/log.do_fetch.2369969
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.62.0.bb:do_fetch) failed with exit code '1'

--===============6888585336737854905==--

