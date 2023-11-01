Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8940EC18E19
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:15 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.8487.1698848704281599911
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GhR1gbOx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bMrj5XKX;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.33, mailfrom: 0101018b8b460367-4af741b0-7d41-4011-8907-394d35a061e6-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sF41yHfDsF/Qj+KmmD7q8319hIj4e+LXwxA/w4EczFc=;
	b=GhR1gbOxo10KVm4ZBKVNopN3prLyU/MOhiJ6xGrzCi0Mfp7chBXuVqYjOia9Tcy4
	93tk/1KBNjoqlLorxWcKq3AcUXqw6n0V59zqITX6GPaogaCK1OkDkZo7aAZIUlr5hvQ
	5AkHFw7Xi1CAmVokPARGJZbRJVl2ahzXAEc7Z+EY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sF41yHfDsF/Qj+KmmD7q8319hIj4e+LXwxA/w4EczFc=;
	b=bMrj5XKXFfXH1TvQQUC4wLK9J9KP1+g3tC4YOq23pBeb7bWmFa38T8mI1H3gbrXb
	vLzTI4PmstHK2nm3/Z6hbVs0kW3Ld9K/zwyEurB0+LTUrJ1a+5NNL46YH/mw6K/GosY
	1IVgyH7NS+RNbduzcdqHS3ZsyuaCb3svC8jfQYKE=
Content-Type: multipart/mixed; boundary="===============8849586037894251720=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography: upgrading to 41.0.5 FAILED
Message-ID: <0101018b8b460367-4af741b0-7d41-4011-8907-394d35a061e6-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189956

--===============8849586037894251720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography* to *41.0.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-cryptography-upgrade-41.0.4-41.0.5.patch
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
From 4e2c9d304affe97c4e911956acb1c1f6f971dfb6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 08:33:01 +0000
Subject: [PATCH] python3-cryptography: upgrade 41.0.4 -> 41.0.5

---
 .../python/python3-cryptography-crates.inc    | 53 -------------------
 ....0.4.bb => python3-cryptography_41.0.5.bb} |  2 +-
 2 files changed, 1 insertion(+), 54 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography_41.0.4.bb => python3-cryptography_41.0.5.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index da0a3f2ee8..ac112ffdad 100644
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
-SRC_URI[proc-macro2-1.0.64.sha256sum] = "78803b62cbf1f46fde80d7c0e803111524b9877184cfe7c3033659490ac7a7da"
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
diff --git a/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb b/meta/recipes-devtools/python/python3-cryptography_41.0.5.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-cryptography_41.0.4.bb
rename to meta/recipes-devtools/python/python3-cryptography_41.0.5.bb
index 94977789c8..17b08f05cd 100644
--- a/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_41.0.5.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "7febc3094125fc126a7f6fb1f420d0da639f3f32cb15c8ff0dc3997c4549f51a"
+SRC_URI[sha256sum] = "392cb88b597247177172e02da6b7a63deeff1937fa6fec3bbf902ebd75d97ec7"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://0001-Fix-include-directory-when-cross-compiling-9129.patch \
-- 
2.39.2


--===============8849586037894251720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1842 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-4e83e241aab542c27c07b9af2022623e2fd2486b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4e83e241aab542c27c07b9af2022623e2fd2486b"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 110 Local 95 Mirrors 0 Missed 15 Current 881 (86% match, 98% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 916 of 991 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1381 of 2822 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.5.bb:do_recipe_qa)
NOTE: recipe python3-cryptography-41.0.5-r0: task do_recipe_qa: Started
NOTE: Running task 1897 of 2822 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_fetch)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-41.0.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2288 of 2822 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.5.bb:do_fetch)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 2330 of 2822 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_unpack)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-41.0.5-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-41.0.5-r0: task do_fetch: Failed
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 2789 tasks of which 2785 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.5.bb:do_fetch
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-cryptography-41.0.5-r0 do_fetch: Missing SRC_URI checksum, please add those to the recipe: 
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
SRC_URI[proc-macro2-1.0.64.sha256sum] = "78803b62cbf1f46fde80d7c0e803111524b9877184cfe7c3033659490ac7a7da"
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
ERROR: python3-cryptography-41.0.5-r0 do_fetch: Bitbake Fetcher Error: BBFetchException('There was some missing checksums in the recipe')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/41.0.5/temp/log.do_fetch.3194416
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.5.bb:do_fetch) failed with exit code '1'

--===============8849586037894251720==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-upgrade-41.0.4-41.0.5.patch"

RnJvbSA0ZTJjOWQzMDRhZmZlOTdjNGU5MTE5NTZhY2IxYzFmNmY5NzFkZmI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwODozMzowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5OiB1cGdyYWRlIDQxLjAuNCAtPiA0MS4wLjUKCi0tLQogLi4uL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jcmF0ZXMuaW5jICAgIHwgNTMgLS0tLS0tLS0tLS0t
LS0tLS0tLQogLi4uLjAuNC5iYiA9PiBweXRob24zLWNyeXB0b2dyYXBoeV80MS4wLjUuYmJ9IHwg
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDU0IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY3J5cHRvZ3JhcGh5
XzQxLjAuNC5iYiA9PiBweXRob24zLWNyeXB0b2dyYXBoeV80MS4wLjUuYmJ9ICg5NSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eS1jcmF0ZXMuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0
b2dyYXBoeS1jcmF0ZXMuaW5jCmluZGV4IGRhMGEzZjJlZTguLmFjMTEyZmZkYWQgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY3Jh
dGVzLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRv
Z3JhcGh5LWNyYXRlcy5pbmMKQEAgLTU3LDU2ICs1NywzIEBAIFNSQ19VUkkgKz0gIiBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c194ODZfNjRfbXN2Yy8wLjQyLjIgXAogIgogCi1TUkNf
VVJJW0luZmxlY3Rvci0wLjExLjQuc2hhMjU2c3VtXSA9ICJmZTQzOGM2MzQ1ODcwNmUwMzQ3OTQ0
Mjc0M2JhYWU2Yzg4MjU2NDk4ZTY0MzE3MDhmNmRmYzUyMGEyNjUxNWQzIgotU1JDX1VSSVthbGlh
c2FibGUtMC4xLjMuc2hhMjU2c3VtXSA9ICIyNTBmNjI5YzAxNjFhZDgxMDdjZjg5MzE5ZTk5MDA1
MWZhZTYyODMyZmQzNDMwODNiZWE0NTJkOTNlMjIwNWZkIgotU1JDX1VSSVthc24xLTAuMTUuMi5z
aGEyNTZzdW1dID0gIjI4YzE5YjkzMjRkZTViODE1YjY0ODdlMGY4MDk4MzEyNzkxYjA5ZGUwZGJm
M2Q1YzJkYjFmZTJkOTViYWI5NzMiCi1TUkNfVVJJW2FzbjFfZGVyaXZlLTAuMTUuMi5zaGEyNTZz
dW1dID0gImEwNDVjM2NjYWQ4OWYyNDRhODZiZDFlNmNmMWE3YmY2NDUyOTZlNzY5MjY5OGIwNTYz
OTliNmVmZDQ2Mzk0MDciCi1TUkNfVVJJW2F1dG9jZmctMS4xLjAuc2hhMjU2c3VtXSA9ICJkNDY4
ODAyYmFiMTdjYmMwY2M1NzVlOWIwNTNmNDFlNzJhYTM2YmZhNmI3ZjU1ZTM1MjlmZmE0MzE2MWI5
N2ZhIgotU1JDX1VSSVtiYXNlNjQtMC4xMy4xLnNoYTI1NnN1bV0gPSAiOWUxYjU4NjI3M2M1NzAy
OTM2ZmU3YjdkNjg5NjY0NGQ4YmU3MWU2MzE0Y2ZlMDlkMzE2N2M5NWY3MTI1ODllOCIKLVNSQ19V
UklbYml0ZmxhZ3MtMS4zLjIuc2hhMjU2c3VtXSA9ICJiZWYzOGQ0NTE2M2MyZjFkZGUwOTRhN2Rm
ZDMzY2NmNTk1YzkyOTA1YzhmOGY0ZmRjMThkMDZmYjEwMzc3MThhIgotU1JDX1VSSVtjYy0xLjAu
Nzkuc2hhMjU2c3VtXSA9ICI1MGQzMDkwNjI4NjEyMWQ5NWJlM2Q0Nzk1MzNiNDU4Zjg3NDkzYjMw
YTRiNWY3OWE2MDdkYjhmNWQxMWFhOTFmIgotU1JDX1VSSVtjZmctaWYtMS4wLjAuc2hhMjU2c3Vt
XSA9ICJiYWYxZGU0MzM5NzYxNTg4YmMwNjE5ZTNjYmMwMTIwZWU1ODJlYmI3NGI1M2I0ZWZiZjc5
MTE3YmQyZGE0MGZkIgotU1JDX1VSSVtmb3JlaWduLXR5cGVzLTAuMy4yLnNoYTI1NnN1bV0gPSAi
ZjZmMzM5ZWI4YWRjMDUyY2QyY2E3ODkxMGZkYTg2OWFlZmEzOGQyMmQ1Y2I2NDhlNjQ4NWU0ZDNm
YzA2ZjNiMSIKLVNSQ19VUklbZm9yZWlnbi10eXBlcy1zaGFyZWQtMC4xLjEuc2hhMjU2c3VtXSA9
ICIwMGIwMjI4NDExOTA4Y2E4Njg1ZGJhN2ZjMmNkZDcwZWM5OTkwYTZlNzUzZTg5YjZhYzkxYTg0
YzQwZmJhZjRiIgotU1JDX1VSSVtpbmRvYy0xLjAuOS5zaGEyNTZzdW1dID0gImJmYTc5OWRkNWVk
MjBhN2UzNDlmM2I0NjM5YWE4MGQ3NDU0OWM4MTcxNmQ5ZWM0Zjk5NGM5YjU4MTU1OTgzMDYiCi1T
UkNfVVJJW2xpYmMtMC4yLjE0NC5zaGEyNTZzdW1dID0gIjJiMDBjYzFjMjI4YTY3ODJkMGYwNzZl
N2IyMzI4MDJlMGM1Njg5ZDQxYmI1ZGYzNjZmMmE2YjY2MjFjZmRmZTEiCi1TUkNfVVJJW2xvY2tf
YXBpLTAuNC45LnNoYTI1NnN1bV0gPSAiNDM1MDExMzY2ZmU1NjU4M2IxNmNmOTU2ZjlkZjAwOTVi
NDA1YjgyZDc2NDI1YmM4OTgxYzBlMjJlNjBlYzRkZiIKLVNSQ19VUklbbWVtb2Zmc2V0LTAuOC4w
LnNoYTI1NnN1bV0gPSAiZDYxYzcxOWJjZmJjZjVkNjJiM2EwOWVmYTYwODhkZThjNTRiYzBiZmNk
M2VhN2FlMzlmY2MxODYxMDhiOGRlMSIKLVNSQ19VUklbb25jZV9jZWxsLTEuMTcuMi5zaGEyNTZz
dW1dID0gIjk2NzBhMDdmOTQ3NzllMDA5MDhmM2U2ODZlYWI1MDg4NzhlYmIzOTBiYTZlNjA0ZDNh
Mjg0YzAwZThkMDQ4N2IiCi1TUkNfVVJJW29wZW5zc2wtMC4xMC41NC5zaGEyNTZzdW1dID0gIjY5
YjNmNjU2YTE3YTZjYmMxMTViNWM3YTQwYzYxNjk0N2QyMTNiYTE4MjEzNWIwMTRkNjA1MWI3M2Fi
NmYwMTkiCi1TUkNfVVJJW29wZW5zc2wtbWFjcm9zLTAuMS4xLnNoYTI1NnN1bV0gPSAiYTk0ODY2
NmI2MzdhMGY0NjVlODU2NGM3M2U4OWQ0ZGRlMDBkNzJkNGQ0NzNjYzk3MmYzOTBmYzNkY2VlN2Q5
YyIKLVNSQ19VUklbb3BlbnNzbC1zeXMtMC45Ljg4LnNoYTI1NnN1bV0gPSAiYzJjZTBmMjUwZjM0
YTMwOGRjZmRiYjM1MWY1MTEzNTk4NTdkNGVkMjEzNGJhNzE1YTRlYWRkNDZlMWZmZDYxNyIKLVNS
Q19VUklbb3Vyb2Jvcm9zLTAuMTUuNi5zaGEyNTZzdW1dID0gImUxMzU4YmQxNTU4YmQyYTA4M2Zl
ZDQyOGZmZWRhNDg2ZmJmYjMyM2U2OThjZGRhNzc5NDI1OWQ1OTJjYTcyZGIiCi1TUkNfVVJJW291
cm9ib3Jvc19tYWNyby0wLjE1LjYuc2hhMjU2c3VtXSA9ICI1ZjdkMjFjY2QwMzMwNWE2NzQ0Mzdl
ZTEyNDhmM2FiNWQ0YjFkYjA5NWNmMWNhZjQ5ZjE3MTNkZGY2MTk1NmI3IgotU1JDX1VSSVtwYXJr
aW5nX2xvdC0wLjEyLjEuc2hhMjU2c3VtXSA9ICIzNzQyYjJjMTAzYjlmMDZiYzlmZmYwYTM3ZmY0
OTEyOTM1ODUxYmVlNmQzNmYzYzAyYmNjNzU1YmNmZWMyMjhmIgotU1JDX1VSSVtwYXJraW5nX2xv
dF9jb3JlLTAuOS43LnNoYTI1NnN1bV0gPSAiOTA2OWNiYjlmOTllM2E1MDgzNDc2Y2NiMjljZWIx
ZGUxOGI5MTE4Y2FmYTUzZTkwYzk1NTEyMzVkZTJiOTUyMSIKLVNSQ19VUklbcGVtLTEuMS4xLnNo
YTI1NnN1bV0gPSAiYTg4MzVjMjczYTc2YTkwNDU1ZDczNDQ4ODliMDk2NDU5OGUzMzE2ZTJhNzll
ZGU4ZTM2ZjE2YmRjZjIyMjhiOCIKLVNSQ19VUklbcGtnLWNvbmZpZy0wLjMuMjcuc2hhMjU2c3Vt
XSA9ICIyNjA3Mjg2MGJhOTI0Y2JmYTk4ZWEzOWM4YzE5YjRkZDZhNGEyNTQyM2RiZGYyMTljMWVj
YTkxYWEwY2Y2OTY0IgotU1JDX1VSSVtwcm9jLW1hY3JvLWVycm9yLTEuMC40LnNoYTI1NnN1bV0g
PSAiZGEyNTQ5MGZmOTg5MmFhYjNmY2Y3YzM2ZjA4Y2ZiOTAyZGQzZTcxY2EwZjlmOTUxN2JlYTAy
YTczYTVjZTM4YyIKLVNSQ19VUklbcHJvYy1tYWNyby1lcnJvci1hdHRyLTEuMC40LnNoYTI1NnN1
bV0gPSAiYTFiZTQwMTgwZTUyZWNjOThhZDgwYjE4NDkzNGJhZjNkMGQyOWY5Nzk1NzRlNDM5YWY1
YTU1Mjc0YjM1Zjg2OSIKLVNSQ19VUklbcHJvYy1tYWNybzItMS4wLjY0LnNoYTI1NnN1bV0gPSAi
Nzg4MDNiNjJjYmYxZjQ2ZmRlODBkN2MwZTgwMzExMTUyNGI5ODc3MTg0Y2ZlN2MzMDMzNjU5NDkw
YWM3YTdkYSIKLVNSQ19VUklbcHlvMy0wLjE4LjMuc2hhMjU2c3VtXSA9ICJlM2IxYWM1YjM3MzFi
YTM0ZmRhYTk3ODVmOGQ3NGQxNzQ0OGNkMThmMzBjZjE5ZTBjN2U3YjFmZGI1MjcyMTA5IgotU1JD
X1VSSVtweW8zLWJ1aWxkLWNvbmZpZy0wLjE4LjMuc2hhMjU2c3VtXSA9ICI5Y2I5NDZmNWFjNjFi
YjYxYTUwMTQ5MjQ5MTBkOTM2ZWJkMmIyM2I3MDVmN2E0YTNjNDBiMDVjNzIwYjA3OWEzIgotU1JD
X1VSSVtweW8zLWZmaS0wLjE4LjMuc2hhMjU2c3VtXSA9ICJmZDRkN2M1MzM3ODIxOTE2ZWEyYTFk
MjFkMTA5MmU4NDQzY2YzNDg3OWU1M2EwYWM2NTNmYmI5OGY0NGZmNjVjIgotU1JDX1VSSVtweW8z
LW1hY3Jvcy0wLjE4LjMuc2hhMjU2c3VtXSA9ICJhOWQzOWM1NWRhYjNmYzVhNGIyNWJiZDFhYzEw
YTJkYTQ1MmM0YWNhMTNiYjQ1MGYyMjgxOGEwMDJlMjk2NDhkIgotU1JDX1VSSVtweW8zLW1hY3Jv
cy1iYWNrZW5kLTAuMTguMy5zaGEyNTZzdW1dID0gIjk3ZGFmZjA4YTRjNDgzMjA1ODdiNTIyNGNj
OThkNjA5ZTNjMjdiNmQ0MzczMTViZDQwYjYwNWM5OGVlYjU5MTgiCi1TUkNfVVJJW3F1b3RlLTEu
MC4yOC5zaGEyNTZzdW1dID0gIjFiOWFiOWM3ZWFkZmQ4ZGYxOTAwNmYxY2YxYTRhZWQxMzU0MGVk
NWNiYzA0NzAxMGVjZTU4MjZlMTA4MjU0ODgiCi1TUkNfVVJJW3JlZG94X3N5c2NhbGwtMC4yLjE2
LnNoYTI1NnN1bV0gPSAiZmI1YTU4YzE4NTViNGI2ODE5ZDU5MDEyMTU1NjAzZjBiMjJhZDMwY2Fk
NzUyNjAwYWFkZmNiNjk1MjY1NTE5YSIKLVNSQ19VUklbc2NvcGVndWFyZC0xLjEuMC5zaGEyNTZz
dW1dID0gImQyOWFiMGM2ZDNmYzBlZTkyZmU2NmUyZDk5ZjcwMGVhYjE3YThkNTdkMWMxZDNiNzQ4
MzgwZmIyMGJhYTc4Y2QiCi1TUkNfVVJJW3NtYWxsdmVjLTEuMTAuMC5zaGEyNTZzdW1dID0gImE1
MDdiZWZlNzk1NDA0NDU2MzQxZGZhYjEwY2VmNjZlYWQ0YzA0MWY2MmI4YjExYmJiOTJiZmZlNWQw
OTUzZTAiCi1TUkNfVVJJW3N5bi0xLjAuMTA5LnNoYTI1NnN1bV0gPSAiNzJiNjQxOTFiMjc1YjY2
ZmZlMjQ2OWU4YWYyYzFjZmUzYmFmYTY3YjUyOWVhZDc5MmE2ZDAxNjA4ODhiNDIzNyIKLVNSQ19V
Uklbc3luLTIuMC4xOC5zaGEyNTZzdW1dID0gIjMyZDQxNjc3YmNiZTI0YzIwYzUyZTdjNzBiMGQ4
ZGIwNDEzNGM1ZDEwNjZiZjk4NjYyZTI4NzFhZDIwMGVhM2UiCi1TUkNfVVJJW3RhcmdldC1sZXhp
Y29uLTAuMTIuNy5zaGEyNTZzdW1dID0gImZkMWJhMzM3NjQwZDYwYzNlOTZiYzZmMDYzOGE5Mzli
OWM5YTdmMmMzMTZhMTU5OGMyNzk4MjhiM2QxZGM4YzUiCi1TUkNfVVJJW3VuaWNvZGUtaWRlbnQt
MS4wLjkuc2hhMjU2c3VtXSA9ICJiMTU4MTFjYWYyNDE1ZmI4ODkxNzg2MzNlNzcyNGJhZDI1MDkx
MDFjZGUyNzYwNDhlMDEzYjlkZWY1ZTUxZmEwIgotU1JDX1VSSVt1bmluZGVudC0wLjEuMTEuc2hh
MjU2c3VtXSA9ICJlMTc2NmQ2ODJkNDAyODE3YjVhYzQ0OTBiM2MzMDAyZDkxZGZhMGQyMjgxMmYz
NDE2MDlmOTdiMDg3NTczNTljIgotU1JDX1VSSVt2Y3BrZy0wLjIuMTUuc2hhMjU2c3VtXSA9ICJh
Y2NkNGVhNjJmN2JiN2E4MmZlMjMwNjZmYjA5NTdkNDhlZjY3N2Y2ZWViODIxNWYzNzJmNTJlNDhi
YjMyNDI2IgotU1JDX1VSSVt2ZXJzaW9uX2NoZWNrLTAuOS40LnNoYTI1NnN1bV0gPSAiNDk4NzRi
NTE2N2I2NWQ3MTkzYjhhYmExNTY3ZjVjN2Q5M2QwMDFjYWZjMzQ2MDBjZWUwMDNlZGE3ODdlNDgz
ZiIKLVNSQ19VUklbd2luZG93cy1zeXMtMC40NS4wLnNoYTI1NnN1bV0gPSAiNzUyODNiZTVlZmIy
ODMxZDM3ZWExNDIzNjVmMDA5YzAyZWMyMDNjZDI5YTNlYmVjYmMwOTNkNTIzMTViNjZkMCIKLVNS
Q19VUklbd2luZG93cy10YXJnZXRzLTAuNDIuMi5zaGEyNTZzdW1dID0gIjhlNTE4MGMwMGNkNDRj
OWIxYzg4YWRiMzY5MzI5MWYxY2Q5MzYwNWRlZDgwYzI1MGE3NWQ0NzI3NTZiNGQwNzEiCi1TUkNf
VVJJW3dpbmRvd3NfYWFyY2g2NF9nbnVsbHZtLTAuNDIuMi5zaGEyNTZzdW1dID0gIjU5N2E1MTE4
NTcwYjY4YmMwOGQ4ZDU5MTI1MzMyYzU0ZjFiYTlkOWFkZWVkZWVmNWI5OWIwMmJhMmIwNjk4Zjgi
Ci1TUkNfVVJJW3dpbmRvd3NfYWFyY2g2NF9tc3ZjLTAuNDIuMi5zaGEyNTZzdW1dID0gImUwOGU4
ODY0YTYwZjA2ZWYwZDBmZjRiYTA0MTI0ZGI4YjBmYjNiZTU3NzZhNWNkNDc2NDFlOTQyZTU4YzRk
NDMiCi1TUkNfVVJJW3dpbmRvd3NfaTY4Nl9nbnUtMC40Mi4yLnNoYTI1NnN1bV0gPSAiYzYxZDky
N2Q4ZGE0MWRhOTZhODFmMDI5NDg5MzUzZTY4NzM5NzM3ZDNiZWNhNDMxNDVjOGFmZWM5YTMxYTg0
ZiIKLVNSQ19VUklbd2luZG93c19pNjg2X21zdmMtMC40Mi4yLnNoYTI1NnN1bV0gPSAiNDRkODQw
YjZlYzY0OWY0ODBhNDFjOGQ4MGY5YzY1MTA4YjkyZDg5MzQ1ZGQ5NDAyN2JmZTA2YWM0NDRkMTA2
MCIKLVNSQ19VUklbd2luZG93c194ODZfNjRfZ251LTAuNDIuMi5zaGEyNTZzdW1dID0gIjhkZTkx
MmI4YjhmZWI1NWMwNjQ4NjdjZjA0N2RkYTA5N2Y5MmQ1MWVmYWQ1YjQ5MWRmYjk4ZjZiYmI3MGNi
MzYiCi1TUkNfVVJJW3dpbmRvd3NfeDg2XzY0X2dudWxsdm0tMC40Mi4yLnNoYTI1NnN1bV0gPSAi
MjZkNDFiNDZhMzZkNDUzNzQ4YWVkZWYxNDg2ZDVjN2E4NWRiMjJlNTZhZmYzNDY0Mzk4NGVhODU1
MTRlOTRhMyIKLVNSQ19VUklbd2luZG93c194ODZfNjRfbXN2Yy0wLjQyLjIuc2hhMjU2c3VtXSA9
ICI5YWVjNWRhMzMxNTI0MTU4YzZkMWE0YWMwYWIxNTQxMTQ5YzBiOTUwNWZkZTA2NDIzYjAyZjVl
ZjAxMDZiOWYwIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWNyeXB0b2dyYXBoeV80MS4wLjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtY3J5cHRvZ3JhcGh5XzQxLjAuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5
XzQxLjAuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWNyeXB0b2dyYXBoeV80MS4wLjUuYmIKaW5kZXggOTQ5Nzc3ODljOC4uMTdiMDhmMDVjZCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eV80MS4wLjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNy
eXB0b2dyYXBoeV80MS4wLjUuYmIKQEAgLTgsNyArOCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PThjMzYxN2RiNGZiNmZhZTAxZjFkMjUzYWI5MTUxMWU0IFwKICAg
ICAgICAgICAgICAgICAgICAiCiBMRFNIQVJFRCArPSAiLXB0aHJlYWQiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI3ZmViYzMwOTQxMjVmYzEyNmE3ZjZmYjFmNDIwZDBkYTYzOWYzZjMyY2IxNWM4
ZmYwZGMzOTk3YzQ1NDlmNTFhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM5MmNiODhiNTk3MjQ3
MTc3MTcyZTAyZGE2YjdhNjNkZWVmZjE5MzdmYTZmZWMzYmJmOTAyZWJkNzVkOTdlYzciCiAKIFNS
Q19VUkkgKz0gImZpbGU6Ly8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlz
YWJsZS1vcHRpb24ucGF0Y2ggXAogICAgICAgICAgICAgZmlsZTovLzAwMDEtRml4LWluY2x1ZGUt
ZGlyZWN0b3J5LXdoZW4tY3Jvc3MtY29tcGlsaW5nLTkxMjkucGF0Y2ggXAotLSAKMi4zOS4yCgo=

--===============8849586037894251720==--

