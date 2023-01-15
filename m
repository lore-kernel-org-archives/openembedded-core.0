Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8CA9C71140
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:31 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.145709.1673805743065565087
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AnoBICHK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010185b698c653-fe2db0c1-1173-418c-ac3a-640e4b239655-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Wm83iPh6kCpyrx3IrMJuDYa5Yp0uUj2FHl3gLtJSGcg=;
	b=AnoBICHKiQ9taf5XnL2kX8aVpQWY6SdbT5gJlvmntzvrO5HKdgKPwX0/RidBzIQs
	ODfFNbAdiPPeqLUfBWLD61w8l+HCiNeX6VPOVNJCFtIbQ/l8dko5yufE8ZbybtfDK/E
	CcrjJcYlS9CFAOhovtrxwaVmL4OyjWESZhwcoibo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Wm83iPh6kCpyrx3IrMJuDYa5Yp0uUj2FHl3gLtJSGcg=;
	b=Yhts2ZxaJN14NAW/UV438yRvRarMC+w7POrGeqxAp/KDlz6NAQu/UoVPBbdd8x4R
	sCC/W4yyzdjKVm4WT4ZpnH0V2y/DBG/jl42CbAPulQN+twShDADDRsxWTFQMQAs4Lfx
	6kszaBkUzQCaen/lVJzEqv+DoNbUTKqWT9f2j73A=
Content-Type: multipart/mixed; boundary="===============0440505553558695424=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust: upgrading to 1.66.1 FAILED
Message-ID: <01010185b698c653-fe2db0c1-1173-418c-ac3a-640e4b239655-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175920

--===============0440505553558695424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rust* to *1.66.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-rust-upgrade-1.66.0-1.66.1.patch
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
--===============0440505553558695424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1696 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (894 cached, 4 parsed). 1696 targets, 41 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:ed6608cb71b8bc24234293ae7c8d1ad54fe5b57a"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 36 Local 15 Mirrors 0 Missed 21 Current 142 (41% match, 88% complete)
Removing 2 stale sstate objects for arch qemux86...done.
Removing 1 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 417 of 745 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb:do_fetch)
NOTE: Running task 453 of 745 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.66.1.bb:do_fetch)
NOTE: Running task 611 of 745 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.66.0.bb:do_fetch)
NOTE: Running task 643 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb:do_fetch)
NOTE: Running task 664 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb:do_fetch)
NOTE: Running task 670 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.66.1.bb:do_fetch)
NOTE: recipe rust-llvm-1.66.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.66.0-r0: task do_fetch: Started
NOTE: recipe rust-1.66.1-r0: task do_fetch: Started
WARNING: libstd-rs-1.66.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.66.0-src.tar.xz
Cleaning and trying again.
WARNING: libstd-rs-1.66.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.66.0-src.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.66.0-src.tar.xz_bad-checksum_0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c
NOTE: recipe rust-llvm-native-1.66.0-r0: task do_fetch: Started
NOTE: recipe rust-native-1.66.1-r0: task do_fetch: Started
NOTE: recipe cargo-native-1.66.0-r0: task do_fetch: Started
NOTE: recipe rust-1.66.1-r0: task do_fetch: Succeeded
NOTE: Running task 675 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.66.1.bb:do_unpack)
NOTE: recipe rust-native-1.66.1-r0: task do_fetch: Succeeded
NOTE: Running task 676 of 745 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.66.1.bb:do_unpack)
NOTE: recipe rust-1.66.1-r0: task do_unpack: Started
NOTE: recipe rust-native-1.66.1-r0: task do_unpack: Started
WARNING: libstd-rs-1.66.0-r0 do_fetch: Checksum failure encountered with download of https://static.rust-lang.org/dist/rustc-1.66.0-src.tar.xz;name=rust - will attempt other sources if available
WARNING: libstd-rs-1.66.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.66.0-src.tar.xz
Cleaning and trying again.
WARNING: libstd-rs-1.66.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.66.0-src.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.66.0-src.tar.xz_bad-checksum_0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c
NOTE: recipe libstd-rs-1.66.0-r0: task do_fetch: Failed
WARNING: rust-llvm-native-1.66.0-r0 do_fetch: Checksum failure encountered with download of https://static.rust-lang.org/dist/rustc-1.66.0-src.tar.xz;name=rust - will attempt other sources if available
WARNING: rust-llvm-native-1.66.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.66.0-src.tar.xz
Cleaning and trying again.
WARNING: rust-llvm-native-1.66.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.66.0-src.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.66.0-src.tar.xz_bad-checksum_0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c
NOTE: recipe rust-llvm-native-1.66.0-r0: task do_fetch: Failed
WARNING: rust-llvm-1.66.0-r0 do_fetch: Checksum failure encountered with download of https://static.rust-lang.org/dist/rustc-1.66.0-src.tar.xz;name=rust - will attempt other sources if available
WARNING: rust-llvm-1.66.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.66.0-src.tar.xz
Cleaning and trying again.
WARNING: rust-llvm-1.66.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.66.0-src.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.66.0-src.tar.xz_bad-checksum_0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c
NOTE: recipe rust-llvm-1.66.0-r0: task do_fetch: Failed
WARNING: cargo-native-1.66.0-r0 do_fetch: Checksum failure encountered with download of https://static.rust-lang.org/dist/rustc-1.66.0-src.tar.xz;name=rust - will attempt other sources if available
NOTE: recipe rust-1.66.1-r0: task do_unpack: Succeeded
WARNING: cargo-native-1.66.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.66.0-src.tar.xz
Cleaning and trying again.
WARNING: cargo-native-1.66.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.66.0-src.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.66.0-src.tar.xz_bad-checksum_0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c
NOTE: recipe cargo-native-1.66.0-r0: task do_fetch: Failed
NOTE: recipe rust-native-1.66.1-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 676 tasks of which 668 didn't need to be rerun and 4 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 4 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb:do_fetch
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb:do_fetch
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.66.0.bb:do_fetch
Summary: There were 15 WARNING messages.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libstd-rs-1.66.0-r0 do_fetch: Checksum failure fetching https://static.rust-lang.org/dist/rustc-1.66.0-src.tar.xz;name=rust
ERROR: libstd-rs-1.66.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.66.0-src.tar.xz\' has sha256 checksum \'0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c\' when \'07ac4e6c93e0d8ecfaf3b86c4c78bbbde3f5be675f0334e7fb343cb4a0b81ebe\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[rust.sha256sum] = "0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://static.rust-lang.org/dist/rustc-1.66.0-src.tar.xz;name=rust')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libstd-rs/1.66.0-r0/temp/log.do_fetch.6226
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb:do_fetch) failed with exit code '1'
ERROR: rust-llvm-native-1.66.0-r0 do_fetch: Checksum failure fetching https://static.rust-lang.org/dist/rustc-1.66.0-src.tar.xz;name=rust
ERROR: rust-llvm-native-1.66.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.66.0-src.tar.xz\' has sha256 checksum \'0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c\' when \'07ac4e6c93e0d8ecfaf3b86c4c78bbbde3f5be675f0334e7fb343cb4a0b81ebe\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[rust.sha256sum] = "0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://static.rust-lang.org/dist/rustc-1.66.0-src.tar.xz;name=rust')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/rust-llvm-native/1.66.0-r0/temp/log.do_fetch.6223
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb:do_fetch) failed with exit code '1'
ERROR: rust-llvm-1.66.0-r0 do_fetch: Checksum failure fetching https://static.rust-lang.org/dist/rustc-1.66.0-src.tar.xz;name=rust
ERROR: rust-llvm-1.66.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.66.0-src.tar.xz\' has sha256 checksum \'0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c\' when \'07ac4e6c93e0d8ecfaf3b86c4c78bbbde3f5be675f0334e7fb343cb4a0b81ebe\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[rust.sha256sum] = "0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://static.rust-lang.org/dist/rustc-1.66.0-src.tar.xz;name=rust')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rust-llvm/1.66.0-r0/temp/log.do_fetch.6227
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb:do_fetch) failed with exit code '1'
ERROR: cargo-native-1.66.0-r0 do_fetch: Checksum failure fetching https://static.rust-lang.org/dist/rustc-1.66.0-src.tar.xz;name=rust
ERROR: cargo-native-1.66.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.66.0-src.tar.xz\' has sha256 checksum \'0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c\' when \'07ac4e6c93e0d8ecfaf3b86c4c78bbbde3f5be675f0334e7fb343cb4a0b81ebe\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[rust.sha256sum] = "0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://static.rust-lang.org/dist/rustc-1.66.0-src.tar.xz;name=rust')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/cargo-native/1.66.0-r0/temp/log.do_fetch.6225
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.66.0.bb:do_fetch) failed with exit code '1'

--===============0440505553558695424==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rust-upgrade-1.66.0-1.66.1.patch"

RnJvbSA4YTlmN2JjZDkxNGE1NTMzMTIxYTY0NTNlODQzZjVlM2ZiNGY0M2UwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTM6Mzg6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
dXN0OiB1cGdyYWRlIDEuNjYuMCAtPiAxLjY2LjEKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1c3QvcnVzdC1zbmFwc2hvdC5pbmMgICAgICAgICAgICAgIHwgOCAtLS0tLS0tLQogbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1zb3VyY2UuaW5jICAgICAgICAgICAgICAgIHwgMiAr
LQogLi4uL3J1c3Qve3J1c3RfMS42Ni4wLmJiID0+IHJ1c3RfMS42Ni4xLmJifSAgICAgICAgICAg
ICAgIHwgMiArKwogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3Qve3J1c3RfMS42Ni4wLmJiID0+
IHJ1c3RfMS42Ni4xLmJifSAoOTklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydXN0L3J1c3Qtc25hcHNob3QuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVz
dC1zbmFwc2hvdC5pbmMKaW5kZXggNjQyMGJjZmY1NS4uZDgzM2JlNDcwMyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1zbmFwc2hvdC5pbmMKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1zbmFwc2hvdC5pbmMKQEAgLTE0LDE0ICsxNCw2IEBA
IFNSQ19VUklbcnVzdC1zdGQtc25hcHNob3QteDg2XzY0LnNoYTI1NnN1bV0gPSAiMmI1ODhjZDJk
NDk2ODhjMGMzM2I3NDY2NjE0MTIzZThmCiBTUkNfVVJJW3J1c3RjLXNuYXBzaG90LXg4Nl82NC5z
aGEyNTZzdW1dID0gIjYyYjg5Nzg2ZTE5NWZjNWE4YTI2MmY4MzExOGQ2Njg5ODMyYjI0MjI4Yzlk
MzAzY2JhOGFjMTRkYzFlOWFkYzgiCiBTUkNfVVJJW2NhcmdvLXNuYXBzaG90LXg4Nl82NC5zaGEy
NTZzdW1dID0gIjgyNTQ3YWFjYWY0MmZjM2MyOTcwZWMzMWI5Njc1MWRmYmViYTNkZmZlMWEwNDJh
Mzc4MGJkNjcwYzI5YTg5YmYiCiAKLVNSQ19VUklbcnVzdC1zdGQtc25hcHNob3QtYWFyY2g2NC5z
aGEyNTZzdW1dID0gIjczNWI2ODFjOGE2ZTYwOTI1Yzc2ZDZjYzg5OWU3OGI0Y2I0NTYyYWRhMjRh
MWYyNjViMjAyMWMxZmFhZDc4YWQiCi1TUkNfVVJJW3J1c3RjLXNuYXBzaG90LWFhcmNoNjQuc2hh
MjU2c3VtXSA9ICI2N2MzZDM1NDVmZDg5OGMxMzgzMDcxYzBmNjI5NjQ1MzU2NWUwZGExMDkwM2M1
MDY1MmQ3YmY2NzliNTNlOGEyIgotU1JDX1VSSVtjYXJnby1zbmFwc2hvdC1hYXJjaDY0LnNoYTI1
NnN1bV0gPSAiM2ZkNDgzYzBkNTg2NzNhYjY5ODYyODI0NDA4YzhhNDg2MTI4MjdkZGNkZWFhY2Ew
ZjhmYmU1Y2EwMjIxNGE0YyIKLQotU1JDX1VSSVtydXN0LXN0ZC1zbmFwc2hvdC1wb3dlcnBjNjRs
ZS5zaGEyNTZzdW1dID0gImNlMThiNDQzMDBmN2Q1ZDk0ODU2Y2VmNWIyNzBiYTAxMDA2MWZhZmE0
MTFiZWI5NzgyMjA3ZTI2Y2JhYjg4YTYiCi1TUkNfVVJJW3J1c3RjLXNuYXBzaG90LXBvd2VycGM2
NGxlLnNoYTI1NnN1bV0gPSAiYTZjZTdhYWRkMTBhM2ZkODRmZTQ3MTdhNTkzNzg0MjFhNjViMTAx
YjYxZjI3ZWVkOGIwOTMzNmI4ZGFmNjJjZiIKLVNSQ19VUklbY2FyZ28tc25hcHNob3QtcG93ZXJw
YzY0bGUuc2hhMjU2c3VtXSA9ICI5MzkzZGU5MTBkZjdjZDY5NDdlMzgwNDYwYTExNDRhYzIzNzNh
MzZjNzc2YzczNjdhODEyMTJhNTFhOTJkOWE3IgotCiBTUkNfVVJJICs9ICIgXAogICAgIGh0dHBz
Oi8vc3RhdGljLnJ1c3QtbGFuZy5vcmcvZGlzdC8ke1JVU1RfU1REX1NOQVBTSE9UfS50YXIueHo7
bmFtZT1ydXN0LXN0ZC1zbmFwc2hvdC0ke1JVU1RfQlVJTERfQVJDSH07c3ViZGlyPXJ1c3Qtc25h
cHNob3QtY29tcG9uZW50cyBcCiAgICAgaHR0cHM6Ly9zdGF0aWMucnVzdC1sYW5nLm9yZy9kaXN0
LyR7UlVTVENfU05BUFNIT1R9LnRhci54ejtuYW1lPXJ1c3RjLXNuYXBzaG90LSR7UlVTVF9CVUlM
RF9BUkNIfTtzdWJkaXI9cnVzdC1zbmFwc2hvdC1jb21wb25lbnRzIFwKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0L3J1c3Qtc291cmNlLmluYyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9ydXN0L3J1c3Qtc291cmNlLmluYwppbmRleCA2ZjFkZjQ1NjFiLi4yMmU5NzE3NGE5
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0LXNvdXJjZS5pbmMK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1zb3VyY2UuaW5jCkBAIC03LDcg
KzcsNyBAQCBTUkNfVVJJICs9ICJodHRwczovL3N0YXRpYy5ydXN0LWxhbmcub3JnL2Rpc3QvcnVz
dGMtJHtSVVNUX1ZFUlNJT059LXNyYy50YXIueHo7bgogICAgICAgICAgICAgZmlsZTovLzAwMDEt
RG8tbm90LXVzZS1MRlM2NC1vbi1saW51eC13aXRoLW11c2wucGF0Y2g7cGF0Y2hkaXI9JHtSVVNU
U1JDfSBcCiAgICAgICAgICAgICBmaWxlOi8vemxpYi1vZmY2NF90LnBhdGNoO3BhdGNoZGlyPSR7
UlVTVFNSQ30gXAogIgotU1JDX1VSSVtydXN0LnNoYTI1NnN1bV0gPSAiMGRjMTc2ZTM0ZmFlOTg3
MWY4NTVhNmJhNGNiMzBmYTE5ZDY5YzViNDQyOGQyOTI4MWEwNzQxOWM0OTUwNzE1YyIKK1NSQ19V
UklbcnVzdC5zaGEyNTZzdW1dID0gIjA3YWM0ZTZjOTNlMGQ4ZWNmYWYzYjg2YzRjNzhiYmJkZTNm
NWJlNjc1ZjAzMzRlN2ZiMzQzY2I0YTBiODFlYmUiCiAKIFJVU1RTUkMgPSAiJHtXT1JLRElSfS9y
dXN0Yy0ke1JVU1RfVkVSU0lPTn0tc3JjIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnVzdC9ydXN0XzEuNjYuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0L3J1
c3RfMS42Ni4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9ydXN0L3J1c3RfMS42Ni4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnVzdC9ydXN0XzEuNjYuMS5iYgppbmRleCBlYmE5MzNkZGVkLi5iMDFkMDRiMDE5IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0XzEuNjYuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0XzEuNjYuMS5iYgpAQCAtMjk1LDMgKzI5
NSw1IEBAIFJVU1RMSUJfREVQOmNsYXNzLW5hdGl2ZXNkayA9ICIiCiBJTlNBTkVfU0tJUDoke1BO
fSA9ICJzdGF0aWNkZXYiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKKwor
UFYgPSAiMS42Ni4xIgotLSAKMi4zNy4zCgo=

--===============0440505553558695424==--

