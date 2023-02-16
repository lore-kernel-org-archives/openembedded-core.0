Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A1FC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:45 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.10297.1676508397856080454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NiPMkkBW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018657affb70-3b95d234-7704-4b79-b68d-07d2941430b9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sXL8cvi+LAyZtLut4BRf8zJ0VRnQjxkMM3PTWtqdGug=;
	b=NiPMkkBW46rMwoiJb26xuiZvNXOGgYMUuxKmF3EvT05vVxii9i5YTQ0NJUri4BuW
	EdUO65dANvNvHwqyJg4fJT+bN/2w/zLklQIh3v8w9pntlM967JSgjTPyPs8raATbfeV
	+4Ao+w7Jgqk2hbgoUolmyDenPSqZODCfmv1Wb53U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sXL8cvi+LAyZtLut4BRf8zJ0VRnQjxkMM3PTWtqdGug=;
	b=Lcr0NCyBueWD6kw2kaCnvjhtfCDZ+U6AgQsh+rRIIeEqH7GTZo4a5uQzCzn6TJyR
	ryEy+DXUVa8Q+Ls6hlkrSrfmGP2/rayNvxViPXDd6WCKB3Z1rN6MZNvRyiWZ3wkQdbs
	dBWfC2ifgvd0MCGpmxzDwXHjLamkPwc5WniYVvCk=
Content-Type: multipart/mixed; boundary="===============6012704990423664514=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust: upgrading to 1.67.1 FAILED
Message-ID: <0101018657affb70-3b95d234-7704-4b79-b68d-07d2941430b9-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177256

--===============6012704990423664514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rust* to *1.67.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-rust-upgrade-1.67.0-1.67.1.patch
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
--===============6012704990423664514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1693 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (891 cached, 4 parsed). 1693 targets, 38 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-c2c8a267c0f2a5ae5ca6d20edf991b52bd5df293"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c2c8a267c0f2a5ae5ca6d20edf991b52bd5df293"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 40 Local 19 Mirrors 0 Missed 21 Current 138 (47% match, 88% complete)
Removing 1 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86...done.
Removing 4 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 417 of 745 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.67.0.bb:do_fetch)
NOTE: Running task 447 of 745 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.1.bb:do_fetch)
NOTE: Running task 611 of 745 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.67.0.bb:do_fetch)
NOTE: Running task 643 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_fetch)
NOTE: Running task 664 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.67.0.bb:do_fetch)
NOTE: Running task 670 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.1.bb:do_fetch)
NOTE: recipe rust-llvm-1.67.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.67.0-r0: task do_fetch: Started
NOTE: recipe rust-1.67.1-r0: task do_fetch: Started
WARNING: libstd-rs-1.67.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.67.0-src.tar.xz
Cleaning and trying again.
WARNING: libstd-rs-1.67.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.67.0-src.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.67.0-src.tar.xz_bad-checksum_9ef8cf88a1d35d319808daf2f193aadca9ed9bcae1d4d5db8946a448c9432c6d
NOTE: recipe rust-llvm-native-1.67.0-r0: task do_fetch: Started
NOTE: recipe rust-native-1.67.1-r0: task do_fetch: Started
NOTE: recipe cargo-native-1.67.0-r0: task do_fetch: Started
NOTE: recipe rust-1.67.1-r0: task do_fetch: Succeeded
NOTE: Running task 675 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.1.bb:do_unpack)
NOTE: recipe rust-native-1.67.1-r0: task do_fetch: Succeeded
NOTE: Running task 676 of 745 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.1.bb:do_unpack)
NOTE: recipe rust-1.67.1-r0: task do_unpack: Started
NOTE: recipe rust-native-1.67.1-r0: task do_unpack: Started
WARNING: libstd-rs-1.67.0-r0 do_fetch: Checksum failure encountered with download of https://static.rust-lang.org/dist/rustc-1.67.0-src.tar.xz;name=rust - will attempt other sources if available
NOTE: recipe rust-1.67.1-r0: task do_unpack: Succeeded
NOTE: Running task 677 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.1.bb:do_patch)
NOTE: Running task 678 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.1.bb:do_rust_setup_snapshot)
NOTE: recipe rust-1.67.1-r0: task do_patch: Started
NOTE: recipe rust-1.67.1-r0: task do_rust_setup_snapshot: Started
NOTE: recipe rust-1.67.1-r0: task do_patch: Succeeded
NOTE: Running task 679 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 680 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.1.bb:do_rust_gen_targets)
NOTE: Running task 681 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.1.bb:do_populate_lic)
NOTE: recipe rust-1.67.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-1.67.1-r0: task do_rust_gen_targets: Started
NOTE: recipe rust-1.67.1-r0: task do_populate_lic: Started
NOTE: recipe rust-1.67.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe rust-1.67.1-r0: task do_populate_lic: Succeeded
NOTE: recipe rust-1.67.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rust-1.67.1-r0: task do_rust_setup_snapshot: Succeeded
NOTE: recipe rust-native-1.67.1-r0: task do_unpack: Succeeded
NOTE: Running task 682 of 745 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.1.bb:do_patch)
NOTE: Running task 683 of 745 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.1.bb:do_rust_setup_snapshot)
NOTE: recipe rust-native-1.67.1-r0: task do_patch: Started
NOTE: recipe rust-native-1.67.1-r0: task do_rust_setup_snapshot: Started
NOTE: recipe rust-native-1.67.1-r0: task do_patch: Succeeded
NOTE: Running task 684 of 745 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 685 of 745 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.1.bb:do_rust_gen_targets)
NOTE: recipe rust-native-1.67.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-native-1.67.1-r0: task do_rust_gen_targets: Started
NOTE: recipe rust-native-1.67.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe rust-native-1.67.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rust-native-1.67.1-r0: task do_rust_setup_snapshot: Succeeded
WARNING: libstd-rs-1.67.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.67.0-src.tar.xz
Cleaning and trying again.
WARNING: libstd-rs-1.67.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.67.0-src.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.67.0-src.tar.xz_bad-checksum_9ef8cf88a1d35d319808daf2f193aadca9ed9bcae1d4d5db8946a448c9432c6d
NOTE: recipe libstd-rs-1.67.0-r0: task do_fetch: Failed
WARNING: rust-llvm-native-1.67.0-r0 do_fetch: Checksum failure encountered with download of https://static.rust-lang.org/dist/rustc-1.67.0-src.tar.xz;name=rust - will attempt other sources if available
WARNING: rust-llvm-native-1.67.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.67.0-src.tar.xz
Cleaning and trying again.
WARNING: rust-llvm-native-1.67.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.67.0-src.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.67.0-src.tar.xz_bad-checksum_9ef8cf88a1d35d319808daf2f193aadca9ed9bcae1d4d5db8946a448c9432c6d
NOTE: recipe rust-llvm-native-1.67.0-r0: task do_fetch: Failed
WARNING: cargo-native-1.67.0-r0 do_fetch: Checksum failure encountered with download of https://static.rust-lang.org/dist/rustc-1.67.0-src.tar.xz;name=rust - will attempt other sources if available
WARNING: cargo-native-1.67.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.67.0-src.tar.xz
Cleaning and trying again.
WARNING: cargo-native-1.67.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.67.0-src.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.67.0-src.tar.xz_bad-checksum_9ef8cf88a1d35d319808daf2f193aadca9ed9bcae1d4d5db8946a448c9432c6d
NOTE: recipe cargo-native-1.67.0-r0: task do_fetch: Failed
WARNING: rust-llvm-1.67.0-r0 do_fetch: Checksum failure encountered with download of https://static.rust-lang.org/dist/rustc-1.67.0-src.tar.xz;name=rust - will attempt other sources if available
WARNING: rust-llvm-1.67.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.67.0-src.tar.xz
Cleaning and trying again.
WARNING: rust-llvm-1.67.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.67.0-src.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.67.0-src.tar.xz_bad-checksum_9ef8cf88a1d35d319808daf2f193aadca9ed9bcae1d4d5db8946a448c9432c6d
NOTE: recipe rust-llvm-1.67.0-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 685 tasks of which 668 didn't need to be rerun and 4 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 15 seconds

Summary: 4 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_fetch
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.67.0.bb:do_fetch
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.67.0.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.67.0.bb:do_fetch
Summary: There were 15 WARNING messages.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libstd-rs-1.67.0-r0 do_fetch: Checksum failure fetching https://static.rust-lang.org/dist/rustc-1.67.0-src.tar.xz;name=rust
ERROR: libstd-rs-1.67.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.67.0-src.tar.xz\' has sha256 checksum \'9ef8cf88a1d35d319808daf2f193aadca9ed9bcae1d4d5db8946a448c9432c6d\' when \'77e0615011f887d9533d5374bf9c15c590c3caf32bbb035b392d1c2ae502a682\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[rust.sha256sum] = "9ef8cf88a1d35d319808daf2f193aadca9ed9bcae1d4d5db8946a448c9432c6d"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://static.rust-lang.org/dist/rustc-1.67.0-src.tar.xz;name=rust')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libstd-rs/1.67.0-r0/temp/log.do_fetch.3142290
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_fetch) failed with exit code '1'
ERROR: rust-llvm-native-1.67.0-r0 do_fetch: Checksum failure fetching https://static.rust-lang.org/dist/rustc-1.67.0-src.tar.xz;name=rust
ERROR: rust-llvm-native-1.67.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.67.0-src.tar.xz\' has sha256 checksum \'9ef8cf88a1d35d319808daf2f193aadca9ed9bcae1d4d5db8946a448c9432c6d\' when \'77e0615011f887d9533d5374bf9c15c590c3caf32bbb035b392d1c2ae502a682\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[rust.sha256sum] = "9ef8cf88a1d35d319808daf2f193aadca9ed9bcae1d4d5db8946a448c9432c6d"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://static.rust-lang.org/dist/rustc-1.67.0-src.tar.xz;name=rust')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/rust-llvm-native/1.67.0-r0/temp/log.do_fetch.3142287
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.67.0.bb:do_fetch) failed with exit code '1'
ERROR: cargo-native-1.67.0-r0 do_fetch: Checksum failure fetching https://static.rust-lang.org/dist/rustc-1.67.0-src.tar.xz;name=rust
ERROR: cargo-native-1.67.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.67.0-src.tar.xz\' has sha256 checksum \'9ef8cf88a1d35d319808daf2f193aadca9ed9bcae1d4d5db8946a448c9432c6d\' when \'77e0615011f887d9533d5374bf9c15c590c3caf32bbb035b392d1c2ae502a682\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[rust.sha256sum] = "9ef8cf88a1d35d319808daf2f193aadca9ed9bcae1d4d5db8946a448c9432c6d"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://static.rust-lang.org/dist/rustc-1.67.0-src.tar.xz;name=rust')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/cargo-native/1.67.0-r0/temp/log.do_fetch.3142289
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.67.0.bb:do_fetch) failed with exit code '1'
ERROR: rust-llvm-1.67.0-r0 do_fetch: Checksum failure fetching https://static.rust-lang.org/dist/rustc-1.67.0-src.tar.xz;name=rust
ERROR: rust-llvm-1.67.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/rustc-1.67.0-src.tar.xz\' has sha256 checksum \'9ef8cf88a1d35d319808daf2f193aadca9ed9bcae1d4d5db8946a448c9432c6d\' when \'77e0615011f887d9533d5374bf9c15c590c3caf32bbb035b392d1c2ae502a682\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[rust.sha256sum] = "9ef8cf88a1d35d319808daf2f193aadca9ed9bcae1d4d5db8946a448c9432c6d"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://static.rust-lang.org/dist/rustc-1.67.0-src.tar.xz;name=rust')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rust-llvm/1.67.0-r0/temp/log.do_fetch.3142291
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.67.0.bb:do_fetch) failed with exit code '1'

--===============6012704990423664514==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rust-upgrade-1.67.0-1.67.1.patch"

RnJvbSBhMDM4ZWJmMzUzNzJjMTg0NTlkZTBjYzVkODFmOTNjNDhkZDY3ZDM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMTk6MDk6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
dXN0OiB1cGdyYWRlIDEuNjcuMCAtPiAxLjY3LjEKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1c3QvcnVzdC1zbmFwc2hvdC5pbmMgIHwgNDAgLS0tLS0tLS0tLS0tLS0tLS0tLQogbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1zb3VyY2UuaW5jICAgIHwgIDIgKy0KIC4uLi9ydXN0
L3tydXN0XzEuNjcuMC5iYiA9PiBydXN0XzEuNjcuMS5iYn0gICB8ICAyICsKIDMgZmlsZXMgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCA0MSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnVzdC97cnVzdF8xLjY3LjAuYmIgPT4gcnVzdF8xLjY3LjEuYmJ9ICg5OSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1zbmFwc2hvdC5p
bmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0LXNuYXBzaG90LmluYwppbmRleCBk
NTMxNzI3OWRiLi5hZmU5ZTk1NDhkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVzdC9ydXN0LXNuYXBzaG90LmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9y
dXN0LXNuYXBzaG90LmluYwpAQCAtNiw1MCArNiwxMCBAQAogCiBTTkFQU0hPVF9WRVJTSU9OID0g
IjEuNjYuMSIKIAotU1JDX1VSSVtjYXJnby1zbmFwc2hvdC1hYXJjaDY0LnNoYTI1NnN1bV0gPSAi
NjE3MzZhNmVjNjFhNGVhYTlhN2IzZjIxOWQ5ZjgxNjZhZTk3YzFhY2Q1NGI1ZTkwNGMxNWZiOGNh
ZmYwNjI1MCIKLVNSQ19VUklbcnVzdC1zdGQtc25hcHNob3QtYWFyY2g2NC5zaGEyNTZzdW1dID0g
IjlkOTZiYTZhNWEyNTUzMzljZDA0YWYwNzlkOTA2NzUzZDU2Yzg1NTAzYzcyNzI3OWMyMjdkMjRi
ZDQ5ODdlMjQiCi1TUkNfVVJJW3J1c3RjLXNuYXBzaG90LWFhcmNoNjQuc2hhMjU2c3VtXSA9ICJi
NGQ4NDI1OTRiYTExYTg0NzEyYzJkMWJiZjdmNzk0NWNmY2MyNDg1YzcyODYxYTIzYjQ4OGZlZmJh
NWM2YTQ1IgotCi1TUkNfVVJJW2NhcmdvLXNuYXBzaG90LWk2ODYuc2hhMjU2c3VtXSA9ICJmYjBj
MWFhOTIyYzRlNDFmZWFkOWQzNTA5MDc2OTMwOWNiNDU2NDhkNmY3N2NjYmU4ZDJiYTEyNWE3NWNj
MmFmIgotU1JDX1VSSVtydXN0LXN0ZC1zbmFwc2hvdC1pNjg2LnNoYTI1NnN1bV0gPSAiYjMyY2Ji
YjkwMDJmOGEyMGIzMDI4MjNhMmZmMTIyYTkxZjA3N2I1ZTFhN2JjMTM0MGRlNjkwZGVkODZiZjEw
YiIKLVNSQ19VUklbcnVzdGMtc25hcHNob3QtaTY4Ni5zaGEyNTZzdW1dID0gImUyYWI0NjRmNDNk
NjMxOWRkYjk3OTZjYmZhY2Q0NDRkYzQwZjNkMGU3NTAzZDY3MmMyM2VjYmUwZGFmMTFlMWMiCi0K
LVNSQ19VUklbY2FyZ28tc25hcHNob3QtbWlwcy5zaGEyNTZzdW1dID0gIjBmMDNkNmQzNWI2MDQ0
ZGM4MWE0ZDVlYjliZDQyYzlkMWU4YzBlODUzNjNmOTYwZmY5MjFlYmU0NjI5NGFlNDUiCi1TUkNf
VVJJW3J1c3Qtc3RkLXNuYXBzaG90LW1pcHMuc2hhMjU2c3VtXSA9ICJlNjAyOWI0Y2VjNWQ2YzA2
YzM0YTBkYmVjNjE0ZmEyNTJmZGM4Y2YzMTAxM2Q2ZTU2MTExMmNmOTBmNzQyNTY4IgotU1JDX1VS
SVtydXN0Yy1zbmFwc2hvdC1taXBzLnNoYTI1NnN1bV0gPSAiNjRhZDkyNTI1YWUxZjAxOGUwOGMw
NTVkNzg5MmUwZmM2MTM0MzdiZGU4Y2Y2MTRiMWMyYTg5ODY0ODgyOTBlNyIKLQotU1JDX1VSSVtj
YXJnby1zbmFwc2hvdC1taXBzZWwuc2hhMjU2c3VtXSA9ICI3NGQ3NTdhNDU2ZDJmYmI0MThjMjUz
ZGIyMDNjMGJiM2Y3MWQ3OTdlNGFiM2UyODA0YjZjNTk0YTE4ZTBmMTk5IgotU1JDX1VSSVtydXN0
LXN0ZC1zbmFwc2hvdC1taXBzZWwuc2hhMjU2c3VtXSA9ICI4YmZhM2Q2MDc5YzZkZjA0OTk3OGZl
NjFiMWNjYWY5OTJhZWNkMDA2ZTIzZGYyNDM5ZWNmYzg4M2JkOGJjMzFiIgotU1JDX1VSSVtydXN0
Yy1zbmFwc2hvdC1taXBzZWwuc2hhMjU2c3VtXSA9ICJmMjY3NGQ2MGNlNTJjNDkwNDhlOTgyM2Fm
NTdhYWUyNGJiNjcyMmU4OTk4NzgzODE5ZWM4ODQyMjJjYWVjY2YzIgotCi1TUkNfVVJJW2Nhcmdv
LXNuYXBzaG90LXBvd2VycGMuc2hhMjU2c3VtXSA9ICJmNzcxZmE0Mjk0YzhlMGQ1ZDBlNTgxMjlm
ZTlkNGUwOTEzNTY2ZGQ0MzUyM2I2ZjBhZjE5YTA4MDA0MDA0ZGY4IgotU1JDX1VSSVtydXN0LXN0
ZC1zbmFwc2hvdC1wb3dlcnBjLnNoYTI1NnN1bV0gPSAiNDE3YjEyYTliZjA5MGQ2OTQ1MTQ5Mzdj
ZDhjMzIxZWQ2MjVmMTU1MjQ4ZjYzYzBkZTgyMDdiMTdmYTRiMzViMSIKLVNSQ19VUklbcnVzdGMt
c25hcHNob3QtcG93ZXJwYy5zaGEyNTZzdW1dID0gImZmMTZkMDJjMTAwMDg2MTc1YjlmYmNmZmY0
ZDM3MDVmYjRmNWI1OGE2NTA2ZWM3NjY3ZGM4NmM1NmI4YmIzYzciCi0KLVNSQ19VUklbY2FyZ28t
c25hcHNob3QtcG93ZXJwYzY0LnNoYTI1NnN1bV0gPSAiOWE5MzNkMzllNmIwMjhlNzNkYjljYzA5
NTlhZjg0MTI4ODI0ZTBiMTE1NTRlM2EwMTcxY2FkNzYzNWEzNDNjNyIKLVNSQ19VUklbcnVzdC1z
dGQtc25hcHNob3QtcG93ZXJwYzY0LnNoYTI1NnN1bV0gPSAiNzA3NGM0ZWE5ZmNjNjgzY2ViMGFk
Y2NhNmJhMDc1NDRhMWQ5MWYwZTVkMmE0Y2YxNGM4MWViMTQzMTZlYmYzNSIKLVNSQ19VUklbcnVz
dGMtc25hcHNob3QtcG93ZXJwYzY0LnNoYTI1NnN1bV0gPSAiZjViZmY3OWQ1MTdlMmY3MjE4Mzk0
NjI4ODEzMzFiZGMxYjgzMjNhNDM0ZjRlYmUwNTI5ZjkzMjEzYWRiMmEyNCIKLQotU1JDX1VSSVtj
YXJnby1zbmFwc2hvdC1wb3dlcnBjNjRsZS5zaGEyNTZzdW1dID0gIjI5ZmEyZTAwM2Y0YmYzZTM3
YTNmYjUwNmQ1YjdhYjE5ZWI2NDEyYjU5NjZkODY1ZTA4MmIzNTQ2MzdkNWQ4NGEiCi1TUkNfVVJJ
W3J1c3Qtc3RkLXNuYXBzaG90LXBvd2VycGM2NGxlLnNoYTI1NnN1bV0gPSAiNGM2NGEwOWJlODcy
YjU4MzJiNTBkNjgxZmJlMjk2OTFiNmE1ZDNlMjNlZTU1MzUwMjBmYTIyYjhiNDUzYzc3MCIKLVNS
Q19VUklbcnVzdGMtc25hcHNob3QtcG93ZXJwYzY0bGUuc2hhMjU2c3VtXSA9ICIzYjQzMjJiNTE5
YjBmN2ZiY2Y4ODUxMWIyMDYxYmUxNDk5OTIxNTE3ZDgxMGQ3Njk2YmU1OGExNjQ2N2Q0NTg5Igot
Ci1TUkNfVVJJW2NhcmdvLXNuYXBzaG90LXJpc2N2NjRnYy5zaGEyNTZzdW1dID0gImYzNjJjZjU3
NWZkZTkyZjk4OGQ1YjFmZTE5ZmQ0NjNhMTkwNWQ4ZDJhMzg0NDE2ODAzNGRmNDliMWRmZmIxMGIi
Ci1TUkNfVVJJW3J1c3Qtc3RkLXNuYXBzaG90LXJpc2N2NjRnYy5zaGEyNTZzdW1dID0gIjc3NmVm
ZjZmNDUxODQ1ZTg4MjI0NzE0ZWU2ZGE3ODE5ZTM0ZjAxYjc2MjViZjkyNzM5NGMyYjkxZTVjODI0
M2MiCi1TUkNfVVJJW3J1c3RjLXNuYXBzaG90LXJpc2N2NjRnYy5zaGEyNTZzdW1dID0gIjg0YmVh
NzBkM2FjYjZhZjA0YWU0YzBmNDlmOTA0YmJhNGUyNjQ0YjkyYzU5OTZhYWNiYWZkNzYxMGRkMGUx
NDciCi0KLVNSQ19VUklbY2FyZ28tc25hcHNob3QtczM5MHguc2hhMjU2c3VtXSA9ICJmNjllYTA5
MWZhMWVlNDg3MWE0NmNiOWZhMWRhNWI4MWZhMjk4MDY4N2YzYmVkYmM0Njc3YTRhODJmOGRhMGMw
IgotU1JDX1VSSVtydXN0LXN0ZC1zbmFwc2hvdC1zMzkweC5zaGEyNTZzdW1dID0gIjUxZDE1Njdl
MWQyOGU0M2MyMTY1ODg2ZjVhNDk1NWRjZGFhNDFhYTVkZGNlYzVmYjA4MjAwNDkxZmQxZjYwNjIi
Ci1TUkNfVVJJW3J1c3RjLXNuYXBzaG90LXMzOTB4LnNoYTI1NnN1bV0gPSAiMjVhMDQ3ZGI4ZWMw
NjI3YmI3MDU0ZWFmZTZlZGNhNmNlNGM0NzNiMzBkNjc2NmIzMGNiZmYxYzUzNmQwNjczYiIKLQog
U1JDX1VSSVtjYXJnby1zbmFwc2hvdC14ODZfNjQuc2hhMjU2c3VtXSA9ICJhNjM2ZjgzZWIyMzI3
YTY2ZjQ4NGI5NTkyYWIzMDVjNjY0MmRmMTZmYzgwZDBkMWNiNzI3ZTc2NmE2MGRhOTA0IgogU1JD
X1VSSVtydXN0LXN0ZC1zbmFwc2hvdC14ODZfNjQuc2hhMjU2c3VtXSA9ICJjNWUyYzliMTYwYmQ4
ZDk5NTE0ZjEzY2ZiYzBlNDJhNzIyZmQ5Y2ExNGU2YWFjYTRiOWI3NzczMWE3YTQ4Mzc3IgogU1JD
X1VSSVtydXN0Yy1zbmFwc2hvdC14ODZfNjQuc2hhMjU2c3VtXSA9ICIyNDI4NTVlMjYyNjg2MGFl
ZGU2OTU3ZGM1NjQ4MWNjMDJhY2Y4Y2FkMTJmYTViYmJjYmQ5M2Y5YzUxZjBiM2FkIgogCi1TUkNf
VVJJW3J1c3Qtc3RkLXNuYXBzaG90LWk1ODYuc2hhMjU2c3VtXSA9ICI5MGViOGUyNDkwMjgzOTMw
ZTY4MmI3OTg0MmQ2NjRkNDg2NzQxNDU2MzM1M2Q1M2RhZmM0N2VjY2Y0NGFlYTE3IgotCi1TUkNf
VVJJW3J1c3Qtc3RkLXNuYXBzaG90LXNwYXJjNjQuc2hhMjU2c3VtXSA9ICIzYWVlMDNmYTYxYzI4
YmIyNDIwMjNlZmIwOWEyMmUzOGE3NmIwNzVjYzcyYmNhZDk4OTQ1NjBiZThiMjhhOTI3IgotCiBT
UkNfVVJJICs9ICIgXAogICAgICR7UlVTVF9ESVNUX1NFUlZFUn0vZGlzdC8ke1JVU1RfU1REX1NO
QVBTSE9UfS50YXIueHo7bmFtZT1ydXN0LXN0ZC1zbmFwc2hvdC0ke1JVU1RfQlVJTERfQVJDSH07
c3ViZGlyPXJ1c3Qtc25hcHNob3QtY29tcG9uZW50cyBcCiAgICAgJHtSVVNUX0RJU1RfU0VSVkVS
fS9kaXN0LyR7UlVTVENfU05BUFNIT1R9LnRhci54ejtuYW1lPXJ1c3RjLXNuYXBzaG90LSR7UlVT
VF9CVUlMRF9BUkNIfTtzdWJkaXI9cnVzdC1zbmFwc2hvdC1jb21wb25lbnRzIFwKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0L3J1c3Qtc291cmNlLmluYyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydXN0L3J1c3Qtc291cmNlLmluYwppbmRleCAyNjhlMTdiY2Y4Li45NDI5
NzhlNmJmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0LXNvdXJj
ZS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1zb3VyY2UuaW5jCkBA
IC03LDcgKzcsNyBAQCBTUkNfVVJJICs9ICJodHRwczovL3N0YXRpYy5ydXN0LWxhbmcub3JnL2Rp
c3QvcnVzdGMtJHtSVVNUX1ZFUlNJT059LXNyYy50YXIueHo7bgogICAgICAgICAgICAgZmlsZTov
LzAwMDEtRG8tbm90LXVzZS1MRlM2NC1vbi1saW51eC13aXRoLW11c2wucGF0Y2g7cGF0Y2hkaXI9
JHtSVVNUU1JDfSBcCiAgICAgICAgICAgICBmaWxlOi8vemxpYi1vZmY2NF90LnBhdGNoO3BhdGNo
ZGlyPSR7UlVTVFNSQ30gXAogIgotU1JDX1VSSVtydXN0LnNoYTI1NnN1bV0gPSAiOWVmOGNmODhh
MWQzNWQzMTk4MDhkYWYyZjE5M2FhZGNhOWVkOWJjYWUxZDRkNWRiODk0NmE0NDhjOTQzMmM2ZCIK
K1NSQ19VUklbcnVzdC5zaGEyNTZzdW1dID0gIjc3ZTA2MTUwMTFmODg3ZDk1MzNkNTM3NGJmOWMx
NWM1OTBjM2NhZjMyYmJiMDM1YjM5MmQxYzJhZTUwMmE2ODIiCiAKIFJVU1RTUkMgPSAiJHtXT1JL
RElSfS9ydXN0Yy0ke1JVU1RfVkVSU0lPTn0tc3JjIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnVzdC9ydXN0XzEuNjcuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dXN0L3J1c3RfMS42Ny4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTklCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydXN0L3J1c3RfMS42Ny4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnVzdC9ydXN0XzEuNjcuMS5iYgppbmRleCAyMTE4ZmFlYzhmLi4yODFkMTJh
ZTFkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0XzEuNjcuMC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0XzEuNjcuMS5iYgpAQCAtMzU1
LDMgKzM1NSw1IEBAIFJVU1RMSUJfREVQOmNsYXNzLW5hdGl2ZXNkayA9ICIiCiBJTlNBTkVfU0tJ
UDoke1BOfSA9ICJzdGF0aWNkZXYiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNk
ayIKKworUFYgPSAiMS42Ny4xIgotLSAKMi4zNy4zCgo=

--===============6012704990423664514==--

