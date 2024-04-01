Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65456CD12C4
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:29 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.44636.1711994601268390210
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hsnNb7PH;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=J8zsBzok;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018e9ad47c22-d59dcd4f-3274-4583-8f19-dc412332b3b2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XDIUF9+b8JBhlrOF3JzNVsBpeZ9n80gH96Q8KoVED+Y=;
	b=hsnNb7PHDD7Ap9wki1RsL8r/0XB7YkEizIYrvZrZBItG5WMeF6owLY3+Jf/sRza8
	P1S85yBcAfUTqpFuvZxAEbiY2Bi4bsqdpOjKftf1mDKMSkni/MKZdOmN94rRO5MN9TO
	jO5mQXrspZqjPzCMR/p+Fl+rzOkgc3VyY8lbaq48=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XDIUF9+b8JBhlrOF3JzNVsBpeZ9n80gH96Q8KoVED+Y=;
	b=J8zsBzok7wsZTl/fAoVKG1FOK+QtbzNYHwLtmpz2MBEwF8F5YOE52IYWu38eZUqf
	AgpvXlW31Z6kRT/08s7OYjXv6AhU23sqLIj5JUaE24Xlzlt1+IT5svy4UU4YPEEzrs4
	s/jdXIR8NznaCZHJkwW2vRYww3SckWC9c93XtCl4=
Content-Type: multipart/mixed; boundary="===============3856022353765942737=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-networking: upgrading to 2.80.0 SUCCEEDED
Message-ID: <0101018e9ad47c22-d59dcd4f-3274-4583-8f19-dc412332b3b2-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197704

--===============3856022353765942737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-networking* to *2.80.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-networking-upgrade-2.78.1-2.80.0.patch
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
From a8d8c234da7e11769214fa44f9cc3b3f57118113 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 06:21:32 +0000
Subject: [PATCH] glib-networking: upgrade 2.78.1 -> 2.80.0

---
 meta/recipes-core/glib-networking/glib-networking/eagain.patch  | 2 +-
 .../{glib-networking_2.78.1.bb => glib-networking_2.80.0.bb}    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.78.1.bb => glib-networking_2.80.0.bb} (95%)

diff --git a/meta/recipes-core/glib-networking/glib-networking/eagain.patch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
index 6c2e3c634b..2bc6d1f1a4 100644
--- a/meta/recipes-core/glib-networking/glib-networking/eagain.patch
+++ b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
@@ -1,4 +1,4 @@
-From 5604707bed4b4a4bc4658c7158a18c1774775775 Mon Sep 17 00:00:00 2001
+From 1cdeb802f2dc2c754a69fe134385bf4772ff2552 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sat, 6 May 2023 12:18:50 +0100
 Subject: [PATCH] In autobuilder testing we regularly see glib-networking ptest
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
similarity index 95%
rename from meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
index 5060d9fd7a..c8a1355548 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 SECTION = "libs"
 DEPENDS = "glib-2.0-native glib-2.0"
 
-SRC_URI[archive.sha256sum] = "e48f2ddbb049832cbb09230529c5e45daca9f0df0eda325f832f7379859bf09f"
+SRC_URI[archive.sha256sum] = "d8f4f1aab213179ae3351617b59dab5de6bcc9e785021eee178998ebd4bb3acf"
 
 # Upstream note that for the openssl backend, half the tests where this backend don't return
 # the expected error code or don't work as expected so default to gnutls
-- 
2.42.0


--===============3856022353765942737==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-networking-upgrade-2.78.1-2.80.0.patch"

RnJvbSBhOGQ4YzIzNGRhN2UxMTc2OTIxNGZhNDRmOWNjM2IzZjU3MTE4MTEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwNjoyMTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWItbmV0d29ya2luZzogdXBncmFkZSAyLjc4LjEgLT4gMi44MC4wCgotLS0KIG1ldGEvcmVjaXBl
cy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmcvZWFnYWluLnBhdGNoICB8IDIg
Ky0KIC4uLi97Z2xpYi1uZXR3b3JraW5nXzIuNzguMS5iYiA9PiBnbGliLW5ldHdvcmtpbmdfMi44
MC4wLmJifSAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy97Z2xp
Yi1uZXR3b3JraW5nXzIuNzguMS5iYiA9PiBnbGliLW5ldHdvcmtpbmdfMi44MC4wLmJifSAoOTUl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5l
dHdvcmtpbmcvZWFnYWluLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5n
L2dsaWItbmV0d29ya2luZy9lYWdhaW4ucGF0Y2gKaW5kZXggNmMyZTNjNjM0Yi4uMmJjNmQxZjFh
NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL2dsaWItbmV0
d29ya2luZy9lYWdhaW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3Jr
aW5nL2dsaWItbmV0d29ya2luZy9lYWdhaW4ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDU2
MDQ3MDdiZWQ0YjRhNGJjNDY1OGM3MTU4YTE4YzE3NzQ3NzU3NzUgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDFjZGViODAyZjJkYzJjNzU0YTY5ZmUxMzQzODViZjQ3NzJmZjI1NTIgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJk
aWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFNhdCwgNiBNYXkgMjAyMyAxMjoxODo1MCAr
MDEwMAogU3ViamVjdDogW1BBVENIXSBJbiBhdXRvYnVpbGRlciB0ZXN0aW5nIHdlIHJlZ3VsYXJs
eSBzZWUgZ2xpYi1uZXR3b3JraW5nIHB0ZXN0CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuNzguMS5iYiBiL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmdfMi44MC4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2lu
Zy9nbGliLW5ldHdvcmtpbmdfMi43OC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9n
bGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuODAuMC5iYgppbmRleCA1MDYwZDlmZDdh
Li5jOGExMzU1NTQ4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtp
bmcvZ2xpYi1uZXR3b3JraW5nXzIuNzguMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGli
LW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuODAuMC5iYgpAQCAtMTQsNyArMTQsNyBAQCBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT00ZmJkNjUzODBjZGQyNTU5NTEw
NzkwMDhiMzY0NTE2YyBcCiBTRUNUSU9OID0gImxpYnMiCiBERVBFTkRTID0gImdsaWItMi4wLW5h
dGl2ZSBnbGliLTIuMCIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiZTQ4ZjJkZGJi
MDQ5ODMyY2JiMDkyMzA1MjljNWU0NWRhY2E5ZjBkZjBlZGEzMjVmODMyZjczNzk4NTliZjA5ZiIK
K1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImQ4ZjRmMWFhYjIxMzE3OWFlMzM1MTYxN2I1
OWRhYjVkZTZiY2M5ZTc4NTAyMWVlZTE3ODk5OGViZDRiYjNhY2YiCiAKICMgVXBzdHJlYW0gbm90
ZSB0aGF0IGZvciB0aGUgb3BlbnNzbCBiYWNrZW5kLCBoYWxmIHRoZSB0ZXN0cyB3aGVyZSB0aGlz
IGJhY2tlbmQgZG9uJ3QgcmV0dXJuCiAjIHRoZSBleHBlY3RlZCBlcnJvciBjb2RlIG9yIGRvbid0
IHdvcmsgYXMgZXhwZWN0ZWQgc28gZGVmYXVsdCB0byBnbnV0bHMKLS0gCjIuNDIuMAoK

--===============3856022353765942737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/glib-networking/glib-networking-locale-el: PKGSIZE changed from 4443 to 7344 (+65%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fi: PKGSIZE changed from 5360 to 6010 (+12%)

--===============3856022353765942737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1875 targets, 46 skipped, 0 masked, 0 errors.
Removing 48 recipes from the core2-64 sysroot...done.
Removing 101 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-158a747bd00c61e418718a2a30ac360776cd9c34"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:158a747bd00c61e418718a2a30ac360776cd9c34"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 410 Local 388 Mirrors 0 Missed 22 Current 183 (94% match, 96% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 196 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 203 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_create_spdx_setscene)
NOTE: Running setscene task 207 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 208 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 213 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 217 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 218 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 219 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 220 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 221 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 222 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 223 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-networking-2.80.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_create_spdx_setscene: Started
NOTE: Running task 328 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_write_config)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-networking-2.80.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 332 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_packagedata_setscene)
NOTE: Running task 349 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_fetch)
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 334 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 336 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-networking-2.80.0-r0: task do_write_config: Started
NOTE: Running setscene task 353 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 357 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_setscene)
NOTE: recipe gnutls-3.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-networking-2.80.0-r0: task do_write_config: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-networking-2.80.0-r0: task do_fetch: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-networking-2.80.0-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 360 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/coreutils/9.4/temp/log.do_packagedata_setscene.2387259
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 361 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_package_setscene)
NOTE: Running setscene task 370 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 371 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 383 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 387 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 392 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 393 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 395 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 400 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 405 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 373 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 410 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 411 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 419 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 377 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_package_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 421 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe coreutils-9.4-r0: task do_package_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 438 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 775 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_unpack)
NOTE: Running setscene task 439 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 779 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 789 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.80.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 838 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 442 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-networking-2.80.0-r0: task do_unpack: Succeeded
NOTE: Running task 839 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 840 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe glib-networking-2.80.0-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 842 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe glib-networking-2.80.0-r0: task do_patch: Succeeded
NOTE: Running task 843 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 844 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_populate_lic)
NOTE: recipe bash-5.2.21-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: Running setscene task 443 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 845 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe glib-networking-2.80.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.80.0-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 846 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 444 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-networking-2.80.0-r0: task do_populate_lic: Succeeded
NOTE: Running setscene task 447 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 448 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 450 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 452 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_populate_sysroot_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_populate_lic unihash changed to 711c488bbee6d8035ae2fb1b0b5d704755e73e8d3a4c8f5fbefd3ac6e640f298
NOTE: recipe glib-networking-2.80.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_deploy_source_date_epoch unihash changed to 6a07fca0453e22f093fe823ceeabd1efbcce71a20c7e606d5e6e5265b619c1fb
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 456 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 459 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 466 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 467 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 479 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 480 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 491 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 495 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 501 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 503 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 513 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 517 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1077 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 524 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 530 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 532 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 540 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 548 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 552 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 553 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1164 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running setscene task 556 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 558 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Running setscene task 564 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3827d1886d21fc285ddcf2fcb9cb1cc58679b8245b5b8a3c52f01f2714d587ae
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 58b8a0f1c2fdc603a3c1c69f6c8f73e3ceb751230a450a8666661126b1d5c576 to hashserv.yocto.io:8686 ({'taskhash': '0c005249988598735fd5a8daec17267a5bc2a0f52f53b9e82dfc3d96bc72608b', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '58b8a0f1c2fdc603a3c1c69f6c8f73e3ceb751230a450a8666661126b1d5c576'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 0c005249988598735fd5a8daec17267a5bc2a0f52f53b9e82dfc3d96bc72608b -> 58b8a0f1c2fdc603a3c1c69f6c8f73e3ceb751230a450a8666661126b1d5c576 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 574 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 576 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 577 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 580 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 582 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 583 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1459 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1628 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata)
NOTE: Running task 1641 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_collect_spdx_deps)
NOTE: Running task 1650 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_collect_spdx_deps)
NOTE: Running task 1656 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_ipk)
NOTE: Running task 1657 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_deb)
NOTE: Running task 1658 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe glib-networking-2.80.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-networking-2.80.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_ipk: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_deb: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1659 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Started
NOTE: recipe glib-networking-2.80.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-networking-2.80.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1660 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_configure)
NOTE: recipe coreutils-9.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1661 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_ipk)
NOTE: recipe glib-networking-2.80.0-r0: task do_configure: Started
NOTE: Running task 1662 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_deb)
NOTE: Running task 1663 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_rpm)
NOTE: recipe bash-5.2.21-r0: task do_package_write_deb: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_ipk: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_ipk unihash changed to 799147645d0ec4a2164b3e4c261c6975709e372903bcd55e2fd8fd2be3134758
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_deb unihash changed to d07c2f2530859c1f047cca01d3be903cd489b79a89e91c9c6466a6a92fe84fd4
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm unihash changed to a9aa389747ce3f963501f8a45bf96d766b2d2c95a4760b063f69937813837e56
NOTE: recipe bash-5.2.21-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_ipk unihash changed to 4b3bacae40c5ef1e2c12ec207ba853654472492793f87e5d4567010f415ed9e8
NOTE: recipe glib-networking-2.80.0-r0: task do_configure: Succeeded
NOTE: Running task 1664 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.80.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.80.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1665 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_compile)
NOTE: recipe glib-networking-2.80.0-r0: task do_compile: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_deb unihash changed to e3d7f9ddadf976b0b407ede67e44101990304292d1389d8b6850d1231054aee8
NOTE: recipe glib-networking-2.80.0-r0: task do_compile: Succeeded
NOTE: Running task 1666 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.80.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.80.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1667 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_install)
NOTE: recipe glib-networking-2.80.0-r0: task do_install: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_rpm unihash changed to 23e771a18b4d2007bd667d5256050611e809a142437106bfb8279bfa1fa42e7d
NOTE: recipe glib-networking-2.80.0-r0: task do_install: Succeeded
NOTE: Running task 1668 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.80.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.80.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1669 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_package)
NOTE: Running task 1670 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.80.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.80.0-r0: task do_package: Started
NOTE: recipe glib-networking-2.80.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.80.0-r0: task do_package: Succeeded
NOTE: Running task 1671 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.80.0-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.80.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_packagedata unihash changed to 4a24d56e7b376e0484f011ecab888a6a0dd8417c10925afcf5d793b5f489cd6e
NOTE: Setscene tasks completed
NOTE: Running task 1672 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_create_spdx)
NOTE: Running task 1673 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_package_write_ipk)
NOTE: Running task 1674 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_package_write_deb)
NOTE: Running task 1675 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_package_write_rpm)
NOTE: Running task 1676 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_package_qa)
NOTE: recipe glib-networking-2.80.0-r0: task do_create_spdx: Started
NOTE: recipe glib-networking-2.80.0-r0: task do_package_write_ipk: Started
NOTE: recipe glib-networking-2.80.0-r0: task do_package_write_deb: Started
NOTE: recipe glib-networking-2.80.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.80.0-r0: task do_package_qa: Started
NOTE: recipe glib-networking-2.80.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1677 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_create_runtime_spdx)
NOTE: recipe glib-networking-2.80.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe glib-networking-2.80.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe glib-networking-2.80.0-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_package_write_ipk unihash changed to 0c4349ddd3b58afb96c2c4b6544dccae8ba1177fb34c603a926a3a5a7c0fd528
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_package_qa unihash changed to eb958c48f57d6923cfdcb3efafec98227bf3728e40afecd56072f342edfa3191
NOTE: recipe glib-networking-2.80.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_package_write_deb unihash changed to 6e5db1685081ca6346110e6d83a3d533e34d6f54e4ae681228457d6d472da628
NOTE: recipe glib-networking-2.80.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe glib-networking-2.80.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1678 of 1678 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1678 tasks of which 1634 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 54 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ka went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ta went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.5-r0 to 0:9.4-r0) [version-going-backwards]
ERROR: coreutils-9.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3856022353765942737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/glib-networking/glib-networking-dbg: PKGSIZE changed from 840240 to 840416 (+0%)
packages/core2-64-poky-linux/glib-networking/glib-networking-dbg: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-dbg: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-dev: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-dev: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-doc: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-doc: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ab: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ab: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-an: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-an: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ar: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ar: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-as: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-as: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-be: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-be: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bg: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bg: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bn-in: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bn-in: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bs: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bs: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ca: PKGSIZE changed from 8462 to 8914 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ca: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ca: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-cs: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-cs: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-da: PKGSIZE changed from 7631 to 8085 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-da: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-da: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-de: PKGSIZE changed from 8338 to 8452 (+1%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-de: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-de: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-el: PKGSIZE changed from 4443 to 7344 (+65%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-el: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-el: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-en-ca: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-en-ca: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-en-gb: PKGSIZE changed from 7261 to 7753 (+7%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-en-gb: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-en-gb: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eo: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eo: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-es: PKGSIZE changed from 7951 to 8379 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-es: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-es: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-et: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-et: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eu: PKGSIZE changed from 7652 to 8106 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eu: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eu: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fa: PKGSIZE changed from 9523 to 10017 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fa: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fa: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fi: PKGSIZE changed from 5360 to 6010 (+12%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fi: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fi: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fr: PKGSIZE changed from 8335 to 8877 (+7%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fr: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fr: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fur: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fur: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gd: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gd: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gl: PKGSIZE changed from 8313 to 8780 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gl: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gl: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gu: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gu: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-he: PKGSIZE changed from 9064 to 9530 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-he: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-he: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hi: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hi: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hr: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hr: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hu: PKGSIZE changed from 8124 to 8600 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hu: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hu: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-id: PKGSIZE changed from 7414 to 7832 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-id: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-id: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-it: PKGSIZE changed from 8047 to 8523 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-it: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-it: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ja: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ja: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ka: PKGSIZE changed from 11868 to 12595 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ka: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ka: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-kk: PKGSIZE changed from 9719 to 10296 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-kk: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-kk: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-km: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-km: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-kn: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-kn: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ko: PKGSIZE changed from 8342 to 8805 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ko: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ko: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lt: PKGSIZE changed from 7830 to 8264 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lt: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lt: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lv: PKGSIZE changed from 7953 to 8489 (+7%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lv: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lv: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ml: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ml: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-mr: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-mr: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ms: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ms: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-nb: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-nb: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ne: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ne: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-nl: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-nl: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-oc: PKGSIZE changed from 8173 to 8616 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-oc: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-oc: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-or: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-or: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pa: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pa: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pl: PKGSIZE changed from 8219 to 8699 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pl: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pl: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pt-br: PKGSIZE changed from 8060 to 8248 (+2%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pt-br: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pt-br: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pt: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pt: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ro: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ro: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ru: PKGSIZE changed from 10411 to 10968 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ru: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ru: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sk: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sk: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sl: PKGSIZE changed from 8193 to 8607 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sl: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sl: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sr+latin: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sr+latin: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sr: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sr: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sv: PKGSIZE changed from 7752 to 8181 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sv: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sv: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ta: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ta: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-te: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-te: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-tg: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-tg: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-th: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-th: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-tr: PKGSIZE changed from 7403 to 7805 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-tr: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-tr: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ug: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ug: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-uk: PKGSIZE changed from 11136 to 11741 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-uk: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-uk: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-vi: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-vi: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-cn: PKGSIZE changed from 6775 to 7146 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-cn: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-cn: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-hk: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-hk: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-tw: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-tw: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-ptest: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-ptest: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-src: PKGSIZE changed from 744568 to 744834 (+0%)
packages/core2-64-poky-linux/glib-networking/glib-networking-src: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-src: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-staticdev: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-staticdev: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking: SRC_URI changed from "https://download.gnome.org/sources//glib-networking/2.78/glib-networking-2.78.1.tar.xz;name=archive file://run-ptest file://eagain.patch" to "https://download.gnome.org/sources//glib-networking/2.80/glib-networking-2.80.0.tar.xz;name=archive file://run-ptest file://eagain.patch"
packages/core2-64-poky-linux/glib-networking: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking: PKGV changed from 2.78.1 [default] to 2.80.0 [default]

--===============3856022353765942737==--

