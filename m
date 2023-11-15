Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7618C54F7E
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:11 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.14624.1700059030257551626
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZK6AbAJL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ctK4Aiew;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018bd36a2054-120603c4-a84b-4ef6-ac85-f3e6c0f1c475-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QyAPR5X7ccj6R+n6yKUVOI1oYeAWvmncm55RuLUGZHY=;
	b=ZK6AbAJL7RJjIEnh/l38R4PdVCcmZh86rk2ftLBgy8JOWFGNC4A5PxqH6MmcF0+z
	uzh1YtymfjGQ+y+9cK2NAdyAZ0/K+A0TXeoMAXfhBeG8GYrCq0oHZUZ3STew9sMj5pf
	d72TnK17uyLYQQGjjmgeXSQUiuFKfklcSUZ6gbJk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QyAPR5X7ccj6R+n6yKUVOI1oYeAWvmncm55RuLUGZHY=;
	b=ctK4Aiew/GC+E80xN41b0NX3Ai9ca0zjDg3yx5Wzu499ZUaWU6x6X/XW/X4NE3pw
	CZEhA8HEinULuRfsFWMVDTBDebtGilM9MqMlkA+HOg5w7zzCR1TqOim6Um3yIgaJ64S
	yw2yFHkI0+bsJ2gNpETH1dtoVe64ZVRhrF1yO06U=
Content-Type: multipart/mixed; boundary="===============4318185155101155983=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2023.9 FAILED
Message-ID: <0101018bd36a2054-120603c4-a84b-4ef6-ac85-f3e6c0f1c475-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190628

--===============4318185155101155983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2023.9* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2023.7-2023.9.patch
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
From b2168f804e50ba042965e84aebb11261969acdb1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 07:04:29 +0000
Subject: [PATCH] python3-dtschema: upgrade 2023.7 -> 2023.9

---
 .../{python3-dtschema_2023.7.bb => python3-dtschema_2023.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2023.7.bb => python3-dtschema_2023.9.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.7.bb b/meta/recipes-devtools/python/python3-dtschema_2023.9.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2023.7.bb
rename to meta/recipes-devtools/python/python3-dtschema_2023.9.bb
index c1dc3e019a..8cf6f54f76 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.7.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2023.9.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "de7cd73a35244cf76a8cdd9919bbeb31f362aa5744f3c76c80e0e612489dd0c0"
+SRC_URI[sha256sum] = "52c6d271065155ca134d8a0bcf7e0ebed67b3991acbbd7a98b74eb8642f67d87"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.39.2


--===============4318185155101155983==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2023.7-2023.9.patch"

RnJvbSBiMjE2OGY4MDRlNTBiYTA0Mjk2NWU4NGFlYmIxMTI2MTk2OWFjZGIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDc6MDQ6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0c2NoZW1hOiB1cGdyYWRlIDIwMjMuNyAtPiAyMDIzLjkKCi0tLQogLi4uL3tweXRo
b24zLWR0c2NoZW1hXzIwMjMuNy5iYiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjMuOS5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kdHNjaGVtYV8yMDIzLjcu
YmIgPT4gcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjkuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjMuNy5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjkuYmIKc2lt
aWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWR0c2NoZW1hXzIwMjMuNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjMuOS5iYgppbmRleCBjMWRjM2UwMTlhLi44
Y2Y2ZjU0Zjc2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtZHRzY2hlbWFfMjAyMy43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1kdHNjaGVtYV8yMDIzLjkuYmIKQEAgLTcsNyArNyw3IEBAIGluaGVyaXQgcHlwaSBz
ZXR1cHRvb2xzMwogCiBQWVBJX1BBQ0tBR0UgPSAiZHRzY2hlbWEiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICJkZTdjZDczYTM1MjQ0Y2Y3NmE4Y2RkOTkxOWJiZWIzMWYzNjJhYTU3NDRmM2M3NmM4
MGUwZTYxMjQ4OWRkMGMwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjUyYzZkMjcxMDY1MTU1Y2Ex
MzRkOGEwYmNmN2UwZWJlZDY3YjM5OTFhY2JiZDdhOThiNzRlYjg2NDJmNjdkODciCiAKIERFUEVO
RFMgKz0gInB5dGhvbjMtc2V0dXB0b29scy1zY20tbmF0aXZlIgogUkRFUEVORFM6JHtQTn0gKz0g
IlwKLS0gCjIuMzkuMgoK

--===============4318185155101155983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1846 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-b3cef7349d5ead8e1299e8d01ee6146dc4e1d9a1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b3cef7349d5ead8e1299e8d01ee6146dc4e1d9a1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 390 Local 377 Mirrors 0 Missed 13 Current 399 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 426 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtc_1.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 447 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 454 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 455 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb:do_create_spdx_setscene)
NOTE: recipe python3-dtc-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-ruamel-yaml-0.17.35-r0: task do_create_spdx_setscene: Started
NOTE: Running task 472 of 2227 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_recipe_qa)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-dtc-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.35-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 648 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 666 of 789 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 682 of 789 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-dtschema-2023.9-r0: task do_recipe_qa: Started
NOTE: recipe python3-setuptools-scm-native-7.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-native-7.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_recipe_qa unihash changed to de4c5466140ad47cc7fe521fddadbdb3a7d2021b9157c94e3d8bd8ce0467e6c9
NOTE: recipe python3-setuptools-scm-native-7.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-7.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 741 of 789 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_23.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 789 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 789 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 746 of 789 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 789 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 696 of 2227 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_fetch)
NOTE: recipe python3-dtschema-2023.9-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-native-7.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pip-native-23.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pyparsing-native-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-typing-extensions-native-4.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-tomli-native-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_fetch: Succeeded
NOTE: Running task 697 of 2227 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_unpack)
NOTE: recipe python3-setuptools-scm-native-7.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 753 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe python3-dtschema-2023.9-r0: task do_unpack: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-native-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-typing-extensions-native-4.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 789 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 759 of 789 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyparsing-native-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 789 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pip-native-23.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 789 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_23.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-typing-extensions-native-4.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-tomli-native-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyparsing-native-3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 768 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 770 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pip-native-23.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-typing-extensions-native-4.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-tomli-native-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyparsing-native-3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pip-native-23.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 784 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1762 of 2227 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_patch)
NOTE: Running task 1858 of 2227 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dtschema-2023.9-r0: task do_patch: Started
NOTE: Running task 2170 of 2227 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_collect_spdx_deps)
NOTE: recipe python3-dtschema-2023.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_patch: Succeeded
NOTE: Running task 2213 of 2227 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2214 of 2227 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_populate_lic)
NOTE: recipe python3-dtschema-2023.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_populate_lic: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_populate_lic unihash changed to 7cd2fd778144376e3c318b923487da4529dd7de86f20a2feb99c473d695081f8
NOTE: recipe python3-dtschema-2023.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_deploy_source_date_epoch unihash changed to e927d1e460976987cc9e15db82f1adec6424806f4e1a61a775dc9817d022b967
NOTE: recipe python3-dtschema-2023.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtschema-2023.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2215 of 2227 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_configure)
NOTE: recipe python3-dtschema-2023.9-r0: task do_configure: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_configure: Succeeded
NOTE: Running task 2216 of 2227 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_compile)
NOTE: recipe python3-dtschema-2023.9-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.9/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.9/dtschema-2023.9/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.9/temp/run.do_compile.1713407:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.9/temp/run.do_compile.1713407, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.9/temp/run.do_compile.1713407, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.9/temp/run.do_compile.1713407, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.9/temp/run.do_compile.1713407, line 184
NOTE: recipe python3-dtschema-2023.9-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2216 tasks of which 2206 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115070411.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115070411.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-dtschema-2023.9-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-dtschema-2023.9-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.9/temp/run.do_compile.1713407', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.9/temp/log.do_compile.1713407
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_compile) failed with exit code '1'

--===============4318185155101155983==--

