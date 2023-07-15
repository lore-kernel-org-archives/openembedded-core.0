Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE473C2FC01
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.6027.1689456454811309445
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PruN4pC9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101895b73a955-ed1d133c-450c-45c4-a9d3-ae4d362d2c7c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456454;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q+ZKZGnobyLI6/PAzUeG61JNU24Ze+vV4lVwe+U/72U=;
	b=PruN4pC9qAfvsy0mHgwvcQay7Be4v1/AyWuq+EoVewaAJj67Vi2Z6XQnRcNuA9Sb
	OkKM2bCw3rUqJbcoe9mYAbIBwBpyaWsA48qQYIOp6jpxV1qO7DEOWw9X00YCl6ykVXc
	2Z2wFM59aaCHgxDZGwr5B3k8ybdxNlpl20bjNmkA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456454;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q+ZKZGnobyLI6/PAzUeG61JNU24Ze+vV4lVwe+U/72U=;
	b=SS0VcRqDnRSG9g2aVDlAxonrsuyVSSc6iJMvetUhSLjDoYnC4BiacR+fBfuQuhv9
	sqlMijLvHSrBB6wEgrn4GfYSdaEBNZJFtHys9v+4rgcC3pjvhxVMsdppJDH/4MbcPq8
	OsGzRG8hM12OfG5arSuVefo0LzEPq4HVO62v9JaA=
Content-Type: multipart/mixed; boundary="===============6220034802670860615=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography: upgrading to 41.0.2 FAILED
Message-ID: <010101895b73a955-ed1d133c-450c-45c4-a9d3-ae4d362d2c7c-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184343

--===============6220034802670860615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography* to *41.0.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-cryptography-upgrade-41.0.1-41.0.2.patch
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
From 2d063f0652d527acf003dd2ec51fd0e2240222c1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 11:45:22 +0000
Subject: [PATCH] python3-cryptography: upgrade 41.0.1 -> 41.0.2

---
 .../python/python3-cryptography-crates.inc    | 53 -------------------
 ....0.1.bb => python3-cryptography_41.0.2.bb} |  2 +-
 2 files changed, 1 insertion(+), 54 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography_41.0.1.bb => python3-cryptography_41.0.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index 3b16e32399..452af435c7 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -57,56 +57,3 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_msvc/0.42.2 \
 "
 
-SRC_URI[Inflector-0.11.4.sha256sum] = "fe438c63458706e03479442743baae6c88256498e6431708f6dfc520a26515d3"
-SRC_URI[aliasable-0.1.3.sha256sum] = "250f629c0161ad8107cf89319e990051fae62832fd343083bea452d93e2205fd"
-SRC_URI[asn1-0.15.2.sha256sum] = "28c19b9324de5b815b6487e0f8098312791b09de0dbf3d5c2db1fe2d95bab973"
-SRC_URI[asn1_derive-0.15.2.sha256sum] = "a045c3ccad89f244a86bd1e6cf1a7bf645296e7692698b056399b6efd4639407"
-SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
-SRC_URI[base64-0.13.1.sha256sum] = "9e1b586273c5702936fe7b7d6896644d8be71e6314cfe09d3167c95f712589e8"
-SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[cc-1.0.79.sha256sum] = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
-SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
-SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
-SRC_URI[indoc-1.0.9.sha256sum] = "bfa799dd5ed20a7e349f3b4639aa80d74549c81716d9ec4f994c9b5815598306"
-SRC_URI[libc-0.2.144.sha256sum] = "2b00cc1c228a6782d0f076e7b232802e0c5689d41bb5df366f2a6b6621cfdfe1"
-SRC_URI[lock_api-0.4.9.sha256sum] = "435011366fe56583b16cf956f9df0095b405b82d76425bc8981c0e22e60ec4df"
-SRC_URI[memoffset-0.8.0.sha256sum] = "d61c719bcfbcf5d62b3a09efa6088de8c54bc0bfcd3ea7ae39fcc186108b8de1"
-SRC_URI[once_cell-1.17.2.sha256sum] = "9670a07f94779e00908f3e686eab508878ebb390ba6e604d3a284c00e8d0487b"
-SRC_URI[openssl-0.10.54.sha256sum] = "69b3f656a17a6cbc115b5c7a40c616947d213ba182135b014d6051b73ab6f019"
-SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-sys-0.9.88.sha256sum] = "c2ce0f250f34a308dcfdbb351f511359857d4ed2134ba715a4eadd46e1ffd617"
-SRC_URI[ouroboros-0.15.6.sha256sum] = "e1358bd1558bd2a083fed428ffeda486fbfb323e698cdda7794259d592ca72db"
-SRC_URI[ouroboros_macro-0.15.6.sha256sum] = "5f7d21ccd03305a674437ee1248f3ab5d4b1db095cf1caf49f1713ddf61956b7"
-SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
-SRC_URI[parking_lot_core-0.9.7.sha256sum] = "9069cbb9f99e3a5083476ccb29ceb1de18b9118cafa53e90c9551235de2b9521"
-SRC_URI[pem-1.1.1.sha256sum] = "a8835c273a76a90455d7344889b0964598e3316e2a79ede8e36f16bdcf2228b8"
-SRC_URI[pkg-config-0.3.27.sha256sum] = "26072860ba924cbfa98ea39c8c19b4dd6a4a25423dbdf219c1eca91aa0cf6964"
-SRC_URI[proc-macro-error-1.0.4.sha256sum] = "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
-SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] = "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
-SRC_URI[proc-macro2-1.0.59.sha256sum] = "6aeca18b86b413c660b781aa319e4e2648a3e6f9eadc9b47e9038e6fe9f3451b"
-SRC_URI[pyo3-0.18.3.sha256sum] = "e3b1ac5b3731ba34fdaa9785f8d74d17448cd18f30cf19e0c7e7b1fdb5272109"
-SRC_URI[pyo3-build-config-0.18.3.sha256sum] = "9cb946f5ac61bb61a5014924910d936ebd2b23b705f7a4a3c40b05c720b079a3"
-SRC_URI[pyo3-ffi-0.18.3.sha256sum] = "fd4d7c5337821916ea2a1d21d1092e8443cf34879e53a0ac653fbb98f44ff65c"
-SRC_URI[pyo3-macros-0.18.3.sha256sum] = "a9d39c55dab3fc5a4b25bbd1ac10a2da452c4aca13bb450f22818a002e29648d"
-SRC_URI[pyo3-macros-backend-0.18.3.sha256sum] = "97daff08a4c48320587b5224cc98d609e3c27b6d437315bd40b605c98eeb5918"
-SRC_URI[quote-1.0.28.sha256sum] = "1b9ab9c7eadfd8df19006f1cf1a4aed13540ed5cbc047010ece5826e10825488"
-SRC_URI[redox_syscall-0.2.16.sha256sum] = "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a"
-SRC_URI[scopeguard-1.1.0.sha256sum] = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
-SRC_URI[smallvec-1.10.0.sha256sum] = "a507befe795404456341dfab10cef66ead4c041f62b8b11bbb92bffe5d0953e0"
-SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
-SRC_URI[syn-2.0.18.sha256sum] = "32d41677bcbe24c20c52e7c70b0d8db04134c5d1066bf98662e2871ad200ea3e"
-SRC_URI[target-lexicon-0.12.7.sha256sum] = "fd1ba337640d60c3e96bc6f0638a939b9c9a7f2c316a1598c279828b3d1dc8c5"
-SRC_URI[unicode-ident-1.0.9.sha256sum] = "b15811caf2415fb889178633e7724bad2509101cde276048e013b9def5e51fa0"
-SRC_URI[unindent-0.1.11.sha256sum] = "e1766d682d402817b5ac4490b3c3002d91dfa0d22812f341609f97b08757359c"
-SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
-SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
-SRC_URI[windows-sys-0.45.0.sha256sum] = "75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0"
-SRC_URI[windows-targets-0.42.2.sha256sum] = "8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071"
-SRC_URI[windows_aarch64_gnullvm-0.42.2.sha256sum] = "597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8"
-SRC_URI[windows_aarch64_msvc-0.42.2.sha256sum] = "e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43"
-SRC_URI[windows_i686_gnu-0.42.2.sha256sum] = "c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f"
-SRC_URI[windows_i686_msvc-0.42.2.sha256sum] = "44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060"
-SRC_URI[windows_x86_64_gnu-0.42.2.sha256sum] = "8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36"
-SRC_URI[windows_x86_64_gnullvm-0.42.2.sha256sum] = "26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3"
-SRC_URI[windows_x86_64_msvc-0.42.2.sha256sum] = "9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0"
diff --git a/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb b/meta/recipes-devtools/python/python3-cryptography_41.0.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-cryptography_41.0.1.bb
rename to meta/recipes-devtools/python/python3-cryptography_41.0.2.bb
index 494ca233f0..20d6c97f36 100644
--- a/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_41.0.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "d34579085401d3f49762d2f7d6634d6b6c2ae1242202e860f4d26b046e3a1006"
+SRC_URI[sha256sum] = "7d230bf856164de164ecb615ccc14c7fc6de6906ddd5b491f3af90d3514c925c"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://0001-Fix-include-directory-when-cross-compiling-9129.patch \
-- 
2.39.2


--===============6220034802670860615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1803 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:86154ff65a9ae95e8791f3089fea212d2c9e7984"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 227 Local 214 Mirrors 0 Missed 13 Current 534 (94% match, 98% complete)
Removing 3 stale sstate objects for arch core2-32...done.
Removing 1 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 591 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1225 of 2591 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.2.bb:do_fetch)
NOTE: recipe python3-cryptography-41.0.2-r0: task do_fetch: Started
NOTE: Running task 1700 of 2591 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb:do_fetch)
NOTE: recipe python3-cryptography-41.0.2-r0: task do_fetch: Failed
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-41.0.1-r0: task do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 1796 tasks of which 1794 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.2.bb:do_fetch
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-cryptography-41.0.2-r0 do_fetch: Missing SRC_URI checksum, please add those to the recipe: 
SRC_URI[Inflector-0.11.4.sha256sum] = "fe438c63458706e03479442743baae6c88256498e6431708f6dfc520a26515d3"
SRC_URI[aliasable-0.1.3.sha256sum] = "250f629c0161ad8107cf89319e990051fae62832fd343083bea452d93e2205fd"
SRC_URI[asn1-0.15.2.sha256sum] = "28c19b9324de5b815b6487e0f8098312791b09de0dbf3d5c2db1fe2d95bab973"
SRC_URI[asn1_derive-0.15.2.sha256sum] = "a045c3ccad89f244a86bd1e6cf1a7bf645296e7692698b056399b6efd4639407"
SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
SRC_URI[base64-0.13.1.sha256sum] = "9e1b586273c5702936fe7b7d6896644d8be71e6314cfe09d3167c95f712589e8"
SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
SRC_URI[cc-1.0.79.sha256sum] = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
SRC_URI[indoc-1.0.9.sha256sum] = "bfa799dd5ed20a7e349f3b4639aa80d74549c81716d9ec4f994c9b5815598306"
SRC_URI[libc-0.2.144.sha256sum] = "2b00cc1c228a6782d0f076e7b232802e0c5689d41bb5df366f2a6b6621cfdfe1"
SRC_URI[lock_api-0.4.9.sha256sum] = "435011366fe56583b16cf956f9df0095b405b82d76425bc8981c0e22e60ec4df"
SRC_URI[memoffset-0.8.0.sha256sum] = "d61c719bcfbcf5d62b3a09efa6088de8c54bc0bfcd3ea7ae39fcc186108b8de1"
SRC_URI[once_cell-1.17.2.sha256sum] = "9670a07f94779e00908f3e686eab508878ebb390ba6e604d3a284c00e8d0487b"
SRC_URI[openssl-0.10.54.sha256sum] = "69b3f656a17a6cbc115b5c7a40c616947d213ba182135b014d6051b73ab6f019"
SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
SRC_URI[openssl-sys-0.9.88.sha256sum] = "c2ce0f250f34a308dcfdbb351f511359857d4ed2134ba715a4eadd46e1ffd617"
SRC_URI[ouroboros-0.15.6.sha256sum] = "e1358bd1558bd2a083fed428ffeda486fbfb323e698cdda7794259d592ca72db"
SRC_URI[ouroboros_macro-0.15.6.sha256sum] = "5f7d21ccd03305a674437ee1248f3ab5d4b1db095cf1caf49f1713ddf61956b7"
SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
SRC_URI[parking_lot_core-0.9.7.sha256sum] = "9069cbb9f99e3a5083476ccb29ceb1de18b9118cafa53e90c9551235de2b9521"
SRC_URI[pem-1.1.1.sha256sum] = "a8835c273a76a90455d7344889b0964598e3316e2a79ede8e36f16bdcf2228b8"
SRC_URI[pkg-config-0.3.27.sha256sum] = "26072860ba924cbfa98ea39c8c19b4dd6a4a25423dbdf219c1eca91aa0cf6964"
SRC_URI[proc-macro-error-1.0.4.sha256sum] = "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] = "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
SRC_URI[proc-macro2-1.0.59.sha256sum] = "6aeca18b86b413c660b781aa319e4e2648a3e6f9eadc9b47e9038e6fe9f3451b"
SRC_URI[pyo3-0.18.3.sha256sum] = "e3b1ac5b3731ba34fdaa9785f8d74d17448cd18f30cf19e0c7e7b1fdb5272109"
SRC_URI[pyo3-build-config-0.18.3.sha256sum] = "9cb946f5ac61bb61a5014924910d936ebd2b23b705f7a4a3c40b05c720b079a3"
SRC_URI[pyo3-ffi-0.18.3.sha256sum] = "fd4d7c5337821916ea2a1d21d1092e8443cf34879e53a0ac653fbb98f44ff65c"
SRC_URI[pyo3-macros-0.18.3.sha256sum] = "a9d39c55dab3fc5a4b25bbd1ac10a2da452c4aca13bb450f22818a002e29648d"
SRC_URI[pyo3-macros-backend-0.18.3.sha256sum] = "97daff08a4c48320587b5224cc98d609e3c27b6d437315bd40b605c98eeb5918"
SRC_URI[quote-1.0.28.sha256sum] = "1b9ab9c7eadfd8df19006f1cf1a4aed13540ed5cbc047010ece5826e10825488"
SRC_URI[redox_syscall-0.2.16.sha256sum] = "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a"
SRC_URI[scopeguard-1.1.0.sha256sum] = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
SRC_URI[smallvec-1.10.0.sha256sum] = "a507befe795404456341dfab10cef66ead4c041f62b8b11bbb92bffe5d0953e0"
SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
SRC_URI[syn-2.0.18.sha256sum] = "32d41677bcbe24c20c52e7c70b0d8db04134c5d1066bf98662e2871ad200ea3e"
SRC_URI[target-lexicon-0.12.7.sha256sum] = "fd1ba337640d60c3e96bc6f0638a939b9c9a7f2c316a1598c279828b3d1dc8c5"
SRC_URI[unicode-ident-1.0.9.sha256sum] = "b15811caf2415fb889178633e7724bad2509101cde276048e013b9def5e51fa0"
SRC_URI[unindent-0.1.11.sha256sum] = "e1766d682d402817b5ac4490b3c3002d91dfa0d22812f341609f97b08757359c"
SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
SRC_URI[windows-sys-0.45.0.sha256sum] = "75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0"
SRC_URI[windows-targets-0.42.2.sha256sum] = "8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071"
SRC_URI[windows_aarch64_gnullvm-0.42.2.sha256sum] = "597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8"
SRC_URI[windows_aarch64_msvc-0.42.2.sha256sum] = "e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43"
SRC_URI[windows_i686_gnu-0.42.2.sha256sum] = "c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f"
SRC_URI[windows_i686_msvc-0.42.2.sha256sum] = "44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060"
SRC_URI[windows_x86_64_gnu-0.42.2.sha256sum] = "8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36"
SRC_URI[windows_x86_64_gnullvm-0.42.2.sha256sum] = "26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3"
SRC_URI[windows_x86_64_msvc-0.42.2.sha256sum] = "9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0"
ERROR: python3-cryptography-41.0.2-r0 do_fetch: Bitbake Fetcher Error: BBFetchException('There was some missing checksums in the recipe')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-cryptography/41.0.2-r0/temp/log.do_fetch.1093288
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.2.bb:do_fetch) failed with exit code '1'

--===============6220034802670860615==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-upgrade-41.0.1-41.0.2.patch"

RnJvbSAyZDA2M2YwNjUyZDUyN2FjZjAwM2RkMmVjNTFmZDBlMjI0MDIyMmMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTE6NDU6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeTogdXBncmFkZSA0MS4wLjEgLT4gNDEuMC4yCgotLS0KIC4uLi9w
eXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY3JhdGVzLmluYyAgICB8IDUzIC0tLS0tLS0tLS0t
LS0tLS0tLS0KIC4uLi4wLjEuYmIgPT4gcHl0aG9uMy1jcnlwdG9ncmFwaHlfNDEuMC4yLmJifSB8
ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1NCBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNyeXB0b2dyYXBo
eV80MS4wLjEuYmIgPT4gcHl0aG9uMy1jcnlwdG9ncmFwaHlfNDEuMC4yLmJifSAoOTUlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFw
aHktY3JhdGVzLmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlw
dG9ncmFwaHktY3JhdGVzLmluYwppbmRleCAzYjE2ZTMyMzk5Li40NTJhZjQzNWM3IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNy
YXRlcy5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0
b2dyYXBoeS1jcmF0ZXMuaW5jCkBAIC01Nyw1NiArNTcsMyBAQCBTUkNfVVJJICs9ICIgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2XzY0X21zdmMvMC40Mi4yIFwKICIKIAotU1JD
X1VSSVtJbmZsZWN0b3ItMC4xMS40LnNoYTI1NnN1bV0gPSAiZmU0MzhjNjM0NTg3MDZlMDM0Nzk0
NDI3NDNiYWFlNmM4ODI1NjQ5OGU2NDMxNzA4ZjZkZmM1MjBhMjY1MTVkMyIKLVNSQ19VUklbYWxp
YXNhYmxlLTAuMS4zLnNoYTI1NnN1bV0gPSAiMjUwZjYyOWMwMTYxYWQ4MTA3Y2Y4OTMxOWU5OTAw
NTFmYWU2MjgzMmZkMzQzMDgzYmVhNDUyZDkzZTIyMDVmZCIKLVNSQ19VUklbYXNuMS0wLjE1LjIu
c2hhMjU2c3VtXSA9ICIyOGMxOWI5MzI0ZGU1YjgxNWI2NDg3ZTBmODA5ODMxMjc5MWIwOWRlMGRi
ZjNkNWMyZGIxZmUyZDk1YmFiOTczIgotU1JDX1VSSVthc24xX2Rlcml2ZS0wLjE1LjIuc2hhMjU2
c3VtXSA9ICJhMDQ1YzNjY2FkODlmMjQ0YTg2YmQxZTZjZjFhN2JmNjQ1Mjk2ZTc2OTI2OThiMDU2
Mzk5YjZlZmQ0NjM5NDA3IgotU1JDX1VSSVthdXRvY2ZnLTEuMS4wLnNoYTI1NnN1bV0gPSAiZDQ2
ODgwMmJhYjE3Y2JjMGNjNTc1ZTliMDUzZjQxZTcyYWEzNmJmYTZiN2Y1NWUzNTI5ZmZhNDMxNjFi
OTdmYSIKLVNSQ19VUklbYmFzZTY0LTAuMTMuMS5zaGEyNTZzdW1dID0gIjllMWI1ODYyNzNjNTcw
MjkzNmZlN2I3ZDY4OTY2NDRkOGJlNzFlNjMxNGNmZTA5ZDMxNjdjOTVmNzEyNTg5ZTgiCi1TUkNf
VVJJW2JpdGZsYWdzLTEuMy4yLnNoYTI1NnN1bV0gPSAiYmVmMzhkNDUxNjNjMmYxZGRlMDk0YTdk
ZmQzM2NjZjU5NWM5MjkwNWM4ZjhmNGZkYzE4ZDA2ZmIxMDM3NzE4YSIKLVNSQ19VUklbY2MtMS4w
Ljc5LnNoYTI1NnN1bV0gPSAiNTBkMzA5MDYyODYxMjFkOTViZTNkNDc5NTMzYjQ1OGY4NzQ5M2Iz
MGE0YjVmNzlhNjA3ZGI4ZjVkMTFhYTkxZiIKLVNSQ19VUklbY2ZnLWlmLTEuMC4wLnNoYTI1NnN1
bV0gPSAiYmFmMWRlNDMzOTc2MTU4OGJjMDYxOWUzY2JjMDEyMGVlNTgyZWJiNzRiNTNiNGVmYmY3
OTExN2JkMmRhNDBmZCIKLVNSQ19VUklbZm9yZWlnbi10eXBlcy0wLjMuMi5zaGEyNTZzdW1dID0g
ImY2ZjMzOWViOGFkYzA1MmNkMmNhNzg5MTBmZGE4NjlhZWZhMzhkMjJkNWNiNjQ4ZTY0ODVlNGQz
ZmMwNmYzYjEiCi1TUkNfVVJJW2ZvcmVpZ24tdHlwZXMtc2hhcmVkLTAuMS4xLnNoYTI1NnN1bV0g
PSAiMDBiMDIyODQxMTkwOGNhODY4NWRiYTdmYzJjZGQ3MGVjOTk5MGE2ZTc1M2U4OWI2YWM5MWE4
NGM0MGZiYWY0YiIKLVNSQ19VUklbaW5kb2MtMS4wLjkuc2hhMjU2c3VtXSA9ICJiZmE3OTlkZDVl
ZDIwYTdlMzQ5ZjNiNDYzOWFhODBkNzQ1NDljODE3MTZkOWVjNGY5OTRjOWI1ODE1NTk4MzA2Igot
U1JDX1VSSVtsaWJjLTAuMi4xNDQuc2hhMjU2c3VtXSA9ICIyYjAwY2MxYzIyOGE2NzgyZDBmMDc2
ZTdiMjMyODAyZTBjNTY4OWQ0MWJiNWRmMzY2ZjJhNmI2NjIxY2ZkZmUxIgotU1JDX1VSSVtsb2Nr
X2FwaS0wLjQuOS5zaGEyNTZzdW1dID0gIjQzNTAxMTM2NmZlNTY1ODNiMTZjZjk1NmY5ZGYwMDk1
YjQwNWI4MmQ3NjQyNWJjODk4MWMwZTIyZTYwZWM0ZGYiCi1TUkNfVVJJW21lbW9mZnNldC0wLjgu
MC5zaGEyNTZzdW1dID0gImQ2MWM3MTliY2ZiY2Y1ZDYyYjNhMDllZmE2MDg4ZGU4YzU0YmMwYmZj
ZDNlYTdhZTM5ZmNjMTg2MTA4YjhkZTEiCi1TUkNfVVJJW29uY2VfY2VsbC0xLjE3LjIuc2hhMjU2
c3VtXSA9ICI5NjcwYTA3Zjk0Nzc5ZTAwOTA4ZjNlNjg2ZWFiNTA4ODc4ZWJiMzkwYmE2ZTYwNGQz
YTI4NGMwMGU4ZDA0ODdiIgotU1JDX1VSSVtvcGVuc3NsLTAuMTAuNTQuc2hhMjU2c3VtXSA9ICI2
OWIzZjY1NmExN2E2Y2JjMTE1YjVjN2E0MGM2MTY5NDdkMjEzYmExODIxMzViMDE0ZDYwNTFiNzNh
YjZmMDE5IgotU1JDX1VSSVtvcGVuc3NsLW1hY3Jvcy0wLjEuMS5zaGEyNTZzdW1dID0gImE5NDg2
NjZiNjM3YTBmNDY1ZTg1NjRjNzNlODlkNGRkZTAwZDcyZDRkNDczY2M5NzJmMzkwZmMzZGNlZTdk
OWMiCi1TUkNfVVJJW29wZW5zc2wtc3lzLTAuOS44OC5zaGEyNTZzdW1dID0gImMyY2UwZjI1MGYz
NGEzMDhkY2ZkYmIzNTFmNTExMzU5ODU3ZDRlZDIxMzRiYTcxNWE0ZWFkZDQ2ZTFmZmQ2MTciCi1T
UkNfVVJJW291cm9ib3Jvcy0wLjE1LjYuc2hhMjU2c3VtXSA9ICJlMTM1OGJkMTU1OGJkMmEwODNm
ZWQ0MjhmZmVkYTQ4NmZiZmIzMjNlNjk4Y2RkYTc3OTQyNTlkNTkyY2E3MmRiIgotU1JDX1VSSVtv
dXJvYm9yb3NfbWFjcm8tMC4xNS42LnNoYTI1NnN1bV0gPSAiNWY3ZDIxY2NkMDMzMDVhNjc0NDM3
ZWUxMjQ4ZjNhYjVkNGIxZGIwOTVjZjFjYWY0OWYxNzEzZGRmNjE5NTZiNyIKLVNSQ19VUklbcGFy
a2luZ19sb3QtMC4xMi4xLnNoYTI1NnN1bV0gPSAiMzc0MmIyYzEwM2I5ZjA2YmM5ZmZmMGEzN2Zm
NDkxMjkzNTg1MWJlZTZkMzZmM2MwMmJjYzc1NWJjZmVjMjI4ZiIKLVNSQ19VUklbcGFya2luZ19s
b3RfY29yZS0wLjkuNy5zaGEyNTZzdW1dID0gIjkwNjljYmI5Zjk5ZTNhNTA4MzQ3NmNjYjI5Y2Vi
MWRlMThiOTExOGNhZmE1M2U5MGM5NTUxMjM1ZGUyYjk1MjEiCi1TUkNfVVJJW3BlbS0xLjEuMS5z
aGEyNTZzdW1dID0gImE4ODM1YzI3M2E3NmE5MDQ1NWQ3MzQ0ODg5YjA5NjQ1OThlMzMxNmUyYTc5
ZWRlOGUzNmYxNmJkY2YyMjI4YjgiCi1TUkNfVVJJW3BrZy1jb25maWctMC4zLjI3LnNoYTI1NnN1
bV0gPSAiMjYwNzI4NjBiYTkyNGNiZmE5OGVhMzljOGMxOWI0ZGQ2YTRhMjU0MjNkYmRmMjE5YzFl
Y2E5MWFhMGNmNjk2NCIKLVNSQ19VUklbcHJvYy1tYWNyby1lcnJvci0xLjAuNC5zaGEyNTZzdW1d
ID0gImRhMjU0OTBmZjk4OTJhYWIzZmNmN2MzNmYwOGNmYjkwMmRkM2U3MWNhMGY5Zjk1MTdiZWEw
MmE3M2E1Y2UzOGMiCi1TUkNfVVJJW3Byb2MtbWFjcm8tZXJyb3ItYXR0ci0xLjAuNC5zaGEyNTZz
dW1dID0gImExYmU0MDE4MGU1MmVjYzk4YWQ4MGIxODQ5MzRiYWYzZDBkMjlmOTc5NTc0ZTQzOWFm
NWE1NTI3NGIzNWY4NjkiCi1TUkNfVVJJW3Byb2MtbWFjcm8yLTEuMC41OS5zaGEyNTZzdW1dID0g
IjZhZWNhMThiODZiNDEzYzY2MGI3ODFhYTMxOWU0ZTI2NDhhM2U2ZjllYWRjOWI0N2U5MDM4ZTZm
ZTlmMzQ1MWIiCi1TUkNfVVJJW3B5bzMtMC4xOC4zLnNoYTI1NnN1bV0gPSAiZTNiMWFjNWIzNzMx
YmEzNGZkYWE5Nzg1ZjhkNzRkMTc0NDhjZDE4ZjMwY2YxOWUwYzdlN2IxZmRiNTI3MjEwOSIKLVNS
Q19VUklbcHlvMy1idWlsZC1jb25maWctMC4xOC4zLnNoYTI1NnN1bV0gPSAiOWNiOTQ2ZjVhYzYx
YmI2MWE1MDE0OTI0OTEwZDkzNmViZDJiMjNiNzA1ZjdhNGEzYzQwYjA1YzcyMGIwNzlhMyIKLVNS
Q19VUklbcHlvMy1mZmktMC4xOC4zLnNoYTI1NnN1bV0gPSAiZmQ0ZDdjNTMzNzgyMTkxNmVhMmEx
ZDIxZDEwOTJlODQ0M2NmMzQ4NzllNTNhMGFjNjUzZmJiOThmNDRmZjY1YyIKLVNSQ19VUklbcHlv
My1tYWNyb3MtMC4xOC4zLnNoYTI1NnN1bV0gPSAiYTlkMzljNTVkYWIzZmM1YTRiMjViYmQxYWMx
MGEyZGE0NTJjNGFjYTEzYmI0NTBmMjI4MThhMDAyZTI5NjQ4ZCIKLVNSQ19VUklbcHlvMy1tYWNy
b3MtYmFja2VuZC0wLjE4LjMuc2hhMjU2c3VtXSA9ICI5N2RhZmYwOGE0YzQ4MzIwNTg3YjUyMjRj
Yzk4ZDYwOWUzYzI3YjZkNDM3MzE1YmQ0MGI2MDVjOThlZWI1OTE4IgotU1JDX1VSSVtxdW90ZS0x
LjAuMjguc2hhMjU2c3VtXSA9ICIxYjlhYjljN2VhZGZkOGRmMTkwMDZmMWNmMWE0YWVkMTM1NDBl
ZDVjYmMwNDcwMTBlY2U1ODI2ZTEwODI1NDg4IgotU1JDX1VSSVtyZWRveF9zeXNjYWxsLTAuMi4x
Ni5zaGEyNTZzdW1dID0gImZiNWE1OGMxODU1YjRiNjgxOWQ1OTAxMjE1NTYwM2YwYjIyYWQzMGNh
ZDc1MjYwMGFhZGZjYjY5NTI2NTUxOWEiCi1TUkNfVVJJW3Njb3BlZ3VhcmQtMS4xLjAuc2hhMjU2
c3VtXSA9ICJkMjlhYjBjNmQzZmMwZWU5MmZlNjZlMmQ5OWY3MDBlYWIxN2E4ZDU3ZDFjMWQzYjc0
ODM4MGZiMjBiYWE3OGNkIgotU1JDX1VSSVtzbWFsbHZlYy0xLjEwLjAuc2hhMjU2c3VtXSA9ICJh
NTA3YmVmZTc5NTQwNDQ1NjM0MWRmYWIxMGNlZjY2ZWFkNGMwNDFmNjJiOGIxMWJiYjkyYmZmZTVk
MDk1M2UwIgotU1JDX1VSSVtzeW4tMS4wLjEwOS5zaGEyNTZzdW1dID0gIjcyYjY0MTkxYjI3NWI2
NmZmZTI0NjllOGFmMmMxY2ZlM2JhZmE2N2I1MjllYWQ3OTJhNmQwMTYwODg4YjQyMzciCi1TUkNf
VVJJW3N5bi0yLjAuMTguc2hhMjU2c3VtXSA9ICIzMmQ0MTY3N2JjYmUyNGMyMGM1MmU3YzcwYjBk
OGRiMDQxMzRjNWQxMDY2YmY5ODY2MmUyODcxYWQyMDBlYTNlIgotU1JDX1VSSVt0YXJnZXQtbGV4
aWNvbi0wLjEyLjcuc2hhMjU2c3VtXSA9ICJmZDFiYTMzNzY0MGQ2MGMzZTk2YmM2ZjA2MzhhOTM5
YjljOWE3ZjJjMzE2YTE1OThjMjc5ODI4YjNkMWRjOGM1IgotU1JDX1VSSVt1bmljb2RlLWlkZW50
LTEuMC45LnNoYTI1NnN1bV0gPSAiYjE1ODExY2FmMjQxNWZiODg5MTc4NjMzZTc3MjRiYWQyNTA5
MTAxY2RlMjc2MDQ4ZTAxM2I5ZGVmNWU1MWZhMCIKLVNSQ19VUklbdW5pbmRlbnQtMC4xLjExLnNo
YTI1NnN1bV0gPSAiZTE3NjZkNjgyZDQwMjgxN2I1YWM0NDkwYjNjMzAwMmQ5MWRmYTBkMjI4MTJm
MzQxNjA5Zjk3YjA4NzU3MzU5YyIKLVNSQ19VUklbdmNwa2ctMC4yLjE1LnNoYTI1NnN1bV0gPSAi
YWNjZDRlYTYyZjdiYjdhODJmZTIzMDY2ZmIwOTU3ZDQ4ZWY2NzdmNmVlYjgyMTVmMzcyZjUyZTQ4
YmIzMjQyNiIKLVNSQ19VUklbdmVyc2lvbl9jaGVjay0wLjkuNC5zaGEyNTZzdW1dID0gIjQ5ODc0
YjUxNjdiNjVkNzE5M2I4YWJhMTU2N2Y1YzdkOTNkMDAxY2FmYzM0NjAwY2VlMDAzZWRhNzg3ZTQ4
M2YiCi1TUkNfVVJJW3dpbmRvd3Mtc3lzLTAuNDUuMC5zaGEyNTZzdW1dID0gIjc1MjgzYmU1ZWZi
MjgzMWQzN2VhMTQyMzY1ZjAwOWMwMmVjMjAzY2QyOWEzZWJlY2JjMDkzZDUyMzE1YjY2ZDAiCi1T
UkNfVVJJW3dpbmRvd3MtdGFyZ2V0cy0wLjQyLjIuc2hhMjU2c3VtXSA9ICI4ZTUxODBjMDBjZDQ0
YzliMWM4OGFkYjM2OTMyOTFmMWNkOTM2MDVkZWQ4MGMyNTBhNzVkNDcyNzU2YjRkMDcxIgotU1JD
X1VSSVt3aW5kb3dzX2FhcmNoNjRfZ251bGx2bS0wLjQyLjIuc2hhMjU2c3VtXSA9ICI1OTdhNTEx
ODU3MGI2OGJjMDhkOGQ1OTEyNTMzMmM1NGYxYmE5ZDlhZGVlZGVlZjViOTliMDJiYTJiMDY5OGY4
IgotU1JDX1VSSVt3aW5kb3dzX2FhcmNoNjRfbXN2Yy0wLjQyLjIuc2hhMjU2c3VtXSA9ICJlMDhl
ODg2NGE2MGYwNmVmMGQwZmY0YmEwNDEyNGRiOGIwZmIzYmU1Nzc2YTVjZDQ3NjQxZTk0MmU1OGM0
ZDQzIgotU1JDX1VSSVt3aW5kb3dzX2k2ODZfZ251LTAuNDIuMi5zaGEyNTZzdW1dID0gImM2MWQ5
MjdkOGRhNDFkYTk2YTgxZjAyOTQ4OTM1M2U2ODczOTczN2QzYmVjYTQzMTQ1YzhhZmVjOWEzMWE4
NGYiCi1TUkNfVVJJW3dpbmRvd3NfaTY4Nl9tc3ZjLTAuNDIuMi5zaGEyNTZzdW1dID0gIjQ0ZDg0
MGI2ZWM2NDlmNDgwYTQxYzhkODBmOWM2NTEwOGI5MmQ4OTM0NWRkOTQwMjdiZmUwNmFjNDQ0ZDEw
NjAiCi1TUkNfVVJJW3dpbmRvd3NfeDg2XzY0X2dudS0wLjQyLjIuc2hhMjU2c3VtXSA9ICI4ZGU5
MTJiOGI4ZmViNTVjMDY0ODY3Y2YwNDdkZGEwOTdmOTJkNTFlZmFkNWI0OTFkZmI5OGY2YmJiNzBj
YjM2IgotU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9nbnVsbHZtLTAuNDIuMi5zaGEyNTZzdW1dID0g
IjI2ZDQxYjQ2YTM2ZDQ1Mzc0OGFlZGVmMTQ4NmQ1YzdhODVkYjIyZTU2YWZmMzQ2NDM5ODRlYTg1
NTE0ZTk0YTMiCi1TUkNfVVJJW3dpbmRvd3NfeDg2XzY0X21zdmMtMC40Mi4yLnNoYTI1NnN1bV0g
PSAiOWFlYzVkYTMzMTUyNDE1OGM2ZDFhNGFjMGFiMTU0MTE0OWMwYjk1MDVmZGUwNjQyM2IwMmY1
ZWYwMTA2YjlmMCIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1jcnlwdG9ncmFwaHlfNDEuMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWNyeXB0b2dyYXBoeV80MS4wLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eV80MS4wLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1jcnlwdG9ncmFwaHlfNDEuMC4yLmJiCmluZGV4IDQ5NGNhMjMzZjAuLjIwZDZjOTdmMzYgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFw
aHlfNDEuMC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1j
cnlwdG9ncmFwaHlfNDEuMC4yLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9MSUNFTlNFO21kNT04YzM2MTdkYjRmYjZmYWUwMWYxZDI1M2FiOTE1MTFlNCBcCiAg
ICAgICAgICAgICAgICAgICAgIgogTERTSEFSRUQgKz0gIi1wdGhyZWFkIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiZDM0NTc5MDg1NDAxZDNmNDk3NjJkMmY3ZDY2MzRkNmI2YzJhZTEyNDIyMDJl
ODYwZjRkMjZiMDQ2ZTNhMTAwNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3ZDIzMGJmODU2MTY0
ZGUxNjRlY2I2MTVjY2MxNGM3ZmM2ZGU2OTA2ZGRkNWI0OTFmM2FmOTBkMzUxNGM5MjVjIgogCiBT
UkNfVVJJICs9ICJmaWxlOi8vMDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRp
c2FibGUtb3B0aW9uLnBhdGNoIFwKICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUZpeC1pbmNsdWRl
LWRpcmVjdG9yeS13aGVuLWNyb3NzLWNvbXBpbGluZy05MTI5LnBhdGNoIFwKLS0gCjIuMzkuMgoK

--===============6220034802670860615==--

