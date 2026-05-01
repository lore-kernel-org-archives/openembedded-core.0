Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46E5CD342D
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:52 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15609.1777645532270387654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hdmYzZoB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1XGZGI06;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019de3ee79f0-6d5ee985-a606-4c86-8c9e-9231b69cb124-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645550;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rjZmhMFpK8q9/QoNAyXj7xXcgy6a+pCXucUUk/iY6nU=;
	b=hdmYzZoBqbOEYrpHR/0HL7YFicdvl+H5pcZyFAXjyuEjOjbmBrnRuMJ2hOWJQTmJ
	iWuhcLvmT/knMEVULX/geyrwCaIVjv2PNdxbFZ6kKIOEWnYZ04ZWs9vqfQmN1jxeUHG
	2snz4mSLEKS4aggQpqV9ATebqQ8f6oxsExNJ1ikE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645550;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rjZmhMFpK8q9/QoNAyXj7xXcgy6a+pCXucUUk/iY6nU=;
	b=1XGZGI06BYgOVDOz46bAD4HR5XVybzMcIvQqD0J8TMAT/1/eSeOXCGO9ibepIRxR
	I+4ectIKEHyDmrDKwmdqwgB9HIFI+kjV8sJ+38ptrg3vpnIzJz/ytday2IIMChmLgwM
	M9D60ZCVa/Us1l5OLDPXh/axkIelV9IhoYSOmCOE=
Content-Type: multipart/mixed; boundary="===============4027317831843327128=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] igt-gpu-tools: upgrading to 2.4 FAILED
Message-ID: <0101019de3ee79f0-6d5ee985-a606-4c86-8c9e-9231b69cb124-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236273

--===============4027317831843327128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *igt-gpu-tools* to *2.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-igt-gpu-tools-upgrade-2.3-2.4.patch
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
From 7266f0853149321defb1b7b77c1515093bc3ac37 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 11:58:58 +0000
Subject: [PATCH] igt-gpu-tools: upgrade 2.3 -> 2.4

---
 ...-meson.build-do-not-hardcode-the-build-directory-.patch | 7 +++----
 .../{igt-gpu-tools_2.3.bb => igt-gpu-tools_2.4.bb}         | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/igt-gpu-tools/{igt-gpu-tools_2.3.bb => igt-gpu-tools_2.4.bb} (97%)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
index 7ff8aa22a9..4490920435 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
@@ -1,4 +1,4 @@
-From 27fd94beadfc29ea4ad82f660dbdb2540d0b6b97 Mon Sep 17 00:00:00 2001
+From e33d1fc3ca98f39d257fb4f359458a666706e99e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 18 Dec 2025 15:45:11 +0100
 Subject: [PATCH] lib/meson.build: do not hardcode the build directory into the
@@ -25,7 +25,6 @@ and them IGT_IMGDIR is used thusly in lib/igt_core.h:
 #define igt_fopen_data(filename) \
         __igt_fopen_data(IGT_SRCDIR, IGT_DATADIR, IGT_IMGDIR, filename)
 
-
 Upstream-Status: Inappropriate [hack patching in a bogus dir; issue reported at https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/190]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
@@ -33,10 +32,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/meson.build b/lib/meson.build
-index d0487fb3c..f6452e970 100644
+index 5c4829345..d28c95d99 100644
 --- a/lib/meson.build
 +++ b/lib/meson.build
-@@ -292,7 +292,7 @@ foreach f: lib_sources
+@@ -301,7 +301,7 @@ foreach f: lib_sources
  	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
  	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
  	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb
similarity index 97%
rename from meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb
rename to meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb
index c92d10c617..536e7a2652 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 
 inherit meson pkgconfig
 
-SRCREV = "2d7ec9a36c550c48af4bdd6e748f6753369ab8ff"
+SRCREV = "e6b603e4984e4ce30fe1cc2705734d0f130e0550"
 
 SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master;tag=v${PV} \
            file://0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch \
-- 
2.47.1


--===============4027317831843327128==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-igt-gpu-tools-upgrade-2.3-2.4.patch"

RnJvbSA3MjY2ZjA4NTMxNDkzMjFkZWZiMWI3Yjc3YzE1MTUwOTNiYzNhYzM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMTo1ODo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGln
dC1ncHUtdG9vbHM6IHVwZ3JhZGUgMi4zIC0+IDIuNAoKLS0tCiAuLi4tbWVzb24uYnVpbGQtZG8t
bm90LWhhcmRjb2RlLXRoZS1idWlsZC1kaXJlY3RvcnktLnBhdGNoIHwgNyArKystLS0tCiAuLi4v
e2lndC1ncHUtdG9vbHNfMi4zLmJiID0+IGlndC1ncHUtdG9vbHNfMi40LmJifSAgICAgICAgIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2lndC1ncHUtdG9vbHMve2lndC1ncHUtdG9vbHNf
Mi4zLmJiID0+IGlndC1ncHUtdG9vbHNfMi40LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHMvMDAwMS1saWItbWVz
b24uYnVpbGQtZG8tbm90LWhhcmRjb2RlLXRoZS1idWlsZC1kaXJlY3RvcnktLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL2lndC1ncHUtdG9vbHMvaWd0LWdwdS10b29scy8wMDAxLWxpYi1t
ZXNvbi5idWlsZC1kby1ub3QtaGFyZGNvZGUtdGhlLWJ1aWxkLWRpcmVjdG9yeS0ucGF0Y2gKaW5k
ZXggN2ZmOGFhMjJhOS4uNDQ5MDkyMDQzNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2lndC1ncHUtdG9vbHMvaWd0LWdwdS10b29scy8wMDAxLWxpYi1tZXNvbi5idWlsZC1kby1u
b3QtaGFyZGNvZGUtdGhlLWJ1aWxkLWRpcmVjdG9yeS0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2lndC1ncHUtdG9vbHMvaWd0LWdwdS10b29scy8wMDAxLWxpYi1tZXNvbi5idWls
ZC1kby1ub3QtaGFyZGNvZGUtdGhlLWJ1aWxkLWRpcmVjdG9yeS0ucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDI3ZmQ5NGJlYWRmYzI5ZWE0YWQ4MmY2NjBkYmRiMjU0MGQwYjZiOTcgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGUzM2QxZmMzY2E5OGYzOWQyNTdmYjRmMzU5NDU4YTY2
NjcwNmU5OWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZp
biA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogVGh1LCAxOCBEZWMgMjAyNSAxNTo0NToxMSAr
MDEwMAogU3ViamVjdDogW1BBVENIXSBsaWIvbWVzb24uYnVpbGQ6IGRvIG5vdCBoYXJkY29kZSB0
aGUgYnVpbGQgZGlyZWN0b3J5IGludG8gdGhlCkBAIC0yNSw3ICsyNSw2IEBAIGFuZCB0aGVtIElH
VF9JTUdESVIgaXMgdXNlZCB0aHVzbHkgaW4gbGliL2lndF9jb3JlLmg6CiAjZGVmaW5lIGlndF9m
b3Blbl9kYXRhKGZpbGVuYW1lKSBcCiAgICAgICAgIF9faWd0X2ZvcGVuX2RhdGEoSUdUX1NSQ0RJ
UiwgSUdUX0RBVEFESVIsIElHVF9JTUdESVIsIGZpbGVuYW1lKQogCi0KIFVwc3RyZWFtLVN0YXR1
czogSW5hcHByb3ByaWF0ZSBbaGFjayBwYXRjaGluZyBpbiBhIGJvZ3VzIGRpcjsgaXNzdWUgcmVw
b3J0ZWQgYXQgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xz
Ly0vaXNzdWVzLzE5MF0KIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxp
bnV0cm9uaXguZGU+CiAtLS0KQEAgLTMzLDEwICszMiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbGliL21lc29uLmJ1aWxk
IGIvbGliL21lc29uLmJ1aWxkCi1pbmRleCBkMDQ4N2ZiM2MuLmY2NDUyZTk3MCAxMDA2NDQKK2lu
ZGV4IDVjNDgyOTM0NS4uZDI4Yzk1ZDk5IDEwMDY0NAogLS0tIGEvbGliL21lc29uLmJ1aWxkCiAr
KysgYi9saWIvbWVzb24uYnVpbGQKLUBAIC0yOTIsNyArMjkyLDcgQEAgZm9yZWFjaCBmOiBsaWJf
c291cmNlcworQEAgLTMwMSw3ICszMDEsNyBAQCBmb3JlYWNoIGY6IGxpYl9zb3VyY2VzCiAgCSAg
ICAnLURJR1RfREFUQURJUj0iQDBAIicuZm9ybWF0KGpvaW5fcGF0aHMocHJlZml4LCBkYXRhZGly
KSksCiAgCSAgICAnLURJR1RfU1JDRElSPSJAMEAiJy5mb3JtYXQoc3JjZGlyKSwKICAJICAgICct
RElHVF9MT0dfRE9NQUlOPSJAMEAiJy5mb3JtYXQoZi5zcGxpdCgnLicpWzBdKSwKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHNfMi4z
LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2lndC1ncHUtdG9vbHMvaWd0LWdwdS10b29sc18y
LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2lndC1ncHUtdG9vbHMvaWd0LWdwdS10b29sc18yLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHNfMi40LmJiCmluZGV4IGM5
MmQxMGM2MTcuLjUzNmU3YTI2NTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9p
Z3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHNfMi4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHNfMi40LmJiCkBAIC05LDcgKzksNyBAQCBM
SUNFTlNFID0gIk1JVCIKIAogaW5oZXJpdCBtZXNvbiBwa2djb25maWcKIAotU1JDUkVWID0gIjJk
N2VjOWEzNmM1NTBjNDhhZjRiZGQ2ZTc0OGY2NzUzMzY5YWI4ZmYiCitTUkNSRVYgPSAiZTZiNjAz
ZTQ5ODRlNGNlMzBmZTFjYzI3MDU3MzRkMGYxMzBlMDU1MCIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzLmdpdDtwcm90b2NvbD1odHRw
czticmFuY2g9bWFzdGVyO3RhZz12JHtQVn0gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1saWIt
bWVzb24uYnVpbGQtZG8tbm90LWhhcmRjb2RlLXRoZS1idWlsZC1kaXJlY3RvcnktLnBhdGNoIFwK
LS0gCjIuNDcuMQoK

--===============4027317831843327128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-ac92bcaa5cadd82349d29501fa145b7aeae63912"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:ac92bcaa5cadd82349d29501fa145b7aeae63912"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 283 Local 269 Mirrors 0 Missed 14 Current 784 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2175 of 2513 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_recipe_qa)
NOTE: Running task 2333 of 2513 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_write_config)
NOTE: Running task 2480 of 2513 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_create_recipe_spdx)
NOTE: recipe igt-gpu-tools-2.4-r0: task do_recipe_qa: Started
NOTE: recipe igt-gpu-tools-2.4-r0: task do_write_config: Started
NOTE: recipe igt-gpu-tools-2.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe igt-gpu-tools-2.4-r0: task do_write_config: Succeeded
NOTE: recipe igt-gpu-tools-2.4-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_recipe_qa unihash changed to 02decd8f8ff254a9f3441fd4cd82dacf19bc10093304c07405309ff14fb0e851
NOTE: Setscene tasks completed
NOTE: Running task 2495 of 2513 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_fetch)
NOTE: recipe igt-gpu-tools-2.4-r0: task do_fetch: Started
NOTE: recipe igt-gpu-tools-2.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe igt-gpu-tools-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2496 of 2513 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_unpack)
NOTE: Running task 2497 of 2513 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe igt-gpu-tools-2.4-r0: task do_unpack: Started
NOTE: recipe igt-gpu-tools-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe igt-gpu-tools-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2498 of 2513 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_patch)
NOTE: recipe igt-gpu-tools-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe igt-gpu-tools-2.4-r0: task do_patch: Started
NOTE: recipe igt-gpu-tools-2.4-r0: task do_patch: Succeeded
NOTE: Running task 2499 of 2513 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2500 of 2513 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_populate_lic)
NOTE: recipe igt-gpu-tools-2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe igt-gpu-tools-2.4-r0: task do_populate_lic: Started
NOTE: recipe igt-gpu-tools-2.4-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_populate_lic unihash changed to a33b57f4c8e33c66e562f6210499ec10d3e5152529fb247d50180b06d574e5d2
NOTE: recipe igt-gpu-tools-2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_deploy_source_date_epoch unihash changed to 1da6d7d54eaa25de9de0b3b53262d85ed256e9d7f4d5b4c4d5cbd43087022edc
NOTE: Setscene tasks completed
NOTE: Running task 2501 of 2513 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_configure)
NOTE: recipe igt-gpu-tools-2.4-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_259.5.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/
 openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_
 sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb:do_populate_s
 ysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'base-files', 'base-passwd', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'systemd', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'procps', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'wayland-protocols', 'wayland', 'libpciaccess', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxext', 'libxkbcommon', 'libxrender', 'pixman', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'alsa-lib', 'libpng', 'acl', 'attr', 'bash-completion', 'curl', 'gdbm', 'gmp', 'gnutls', 
 'libtasn1', 'libcap-ng', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error', 'libmicrohttpd', 'libpcre2', 'libseccomp', 'libunistring', 'libunwind', 'nettle', 'shared-mime-info', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'bison-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconf-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddocs=disabled -Drunner=enabled -Dsrcdir=/usr/src/debug/igt-gpu-tools/2.4/git/ -Dversion_hash=2.4 -Dchamelium=disabled...
| The Meson build system
| Version: 1.11.0
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/sources/igt-gpu-tools-2.4
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/build
| Build type: cross build
| Project name: igt-gpu-tools
| Project version: 2.4
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/recipe-sysroot (gcc 15.2.0 "x86_64-poky-linux-gcc (GCC) 15.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/recipe-sysroot ld.bfd 2.46
| C compiler for the build machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
| C linker for the build machine: gcc ld.bfd 2.43.1.20241111
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Compiler for C supports arguments -Wbad-function-cast: YES
| Compiler for C supports arguments -Wdeclaration-after-statement: YES
| Compiler for C supports arguments -Wformat=2: YES
| Compiler for C supports arguments -Wimplicit-fallthrough=0: YES
| Compiler for C supports arguments -Wlogical-op: YES
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wmissing-format-attribute: YES
| Compiler for C supports arguments -Wmissing-noreturn: YES
| Compiler for C supports arguments -Wmissing-prototypes: YES
| Compiler for C supports arguments -Wnested-externs: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Compiler for C supports arguments -Wredundant-decls: YES
| Compiler for C supports arguments -Wshadow: YES
| Compiler for C supports arguments -Wstrict-prototypes: YES
| Compiler for C supports arguments -Wuninitialized: YES
| Compiler for C supports arguments -Wunused: YES
| Compiler for C supports arguments -Wno-clobbered: YES
| Compiler for C supports arguments -Wno-maybe-uninitialized: YES
| Compiler for C supports arguments -Wno-missing-field-initializers: YES
| Compiler for C supports arguments -Wno-pointer-arith: YES
| Compiler for C supports arguments -Wno-address-of-packed-member: YES
| Compiler for C supports arguments -Wno-sign-compare: YES
| Compiler for C supports arguments -Wno-type-limits: YES
| Compiler for C supports arguments -Wno-unused-parameter: YES
| Compiler for C supports arguments -Wno-unused-result: YES
| Compiler for C supports arguments -Werror=address: YES
| Compiler for C supports arguments -Werror=array-bounds: YES
| Compiler for C supports arguments -Werror=dangling-pointer: YES
| Compiler for C supports arguments -Werror=implicit: YES
| Compiler for C supports arguments -Werror=init-self: YES
| Compiler for C supports arguments -Werror=int-conversion: YES
| Compiler for C supports arguments -Werror=int-to-pointer-cast: YES
| Compiler for C supports arguments -Werror=main: YES
| Compiler for C supports arguments -Werror=missing-braces: YES
| Compiler for C supports arguments -Werror=nonnull: YES
| Compiler for C supports arguments -Werror=pointer-to-int-cast: YES
| Compiler for C supports arguments -Werror=return-type: YES
| Compiler for C supports arguments -Werror=sequence-point: YES
| Compiler for C supports arguments -Werror=trigraphs: YES
| Compiler for C supports arguments -Werror=write-strings: YES
| Compiler for C supports arguments -fno-builtin-malloc: YES
| Compiler for C supports arguments -fno-builtin-calloc: YES
| Compiler for C supports arguments -D_LARGEFILE64_SOURCE=1: YES
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/recipe-sysroot-native/usr/bin/pkg-config) 2.5.1
| Run-time dependency libdrm found: YES 2.4.131
| Run-time dependency libdrm_intel found: YES 2.4.131
| Run-time dependency libdrm_nouveau found: YES 2.4.131
| Run-time dependency libdrm_amdgpu found: YES 2.4.131
| Run-time dependency pciaccess found: YES 0.19
| Run-time dependency libkmod found: YES 34.2
| Found CMake: NO
| Run-time dependency libprocps found: NO  (tried pkg-config and cmake)
| Run-time dependency libproc2 found: YES 4.0.6-dirty
| Run-time dependency libunwind found: YES 1.8.3
| Run-time dependency libdw found: YES 0.194
| Run-time dependency pixman-1 found: YES 0.46.4
| Run-time dependency valgrind found: NO  (tried pkg-config)
| Run-time dependency cairo found: YES 1.18.4
| Run-time dependency libpci found: NO  (tried pkg-config)
| 
| ../sources/igt-gpu-tools-2.4/meson.build:165:9: ERROR: Dependency "libpci" not found (tried pkg-config)
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/build/meson-logs/meson-log.txt
| 
| Last 10 lines of meson-log.txt:
| Package libpci was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libpci.pc'
| to the PKG_CONFIG_PATH environment variable
| Package 'libpci' not found
| -----------
| CMake binary for host machine is cached as not found
| Dependency lookup for libpci with method 'cmake' failed: CMake binary for machine host machine not found. Giving up.
| Run-time dependency libpci found: NO  (tried pkg-config)
| 
| ../sources/igt-gpu-tools-2.4/meson.build:165:9: ERROR: Dependency "libpci" not found (tried pkg-config)
| 
| ERROR: meson setup failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/temp/run.do_configure.3352425:170 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/temp/run.do_configure.3352425, line 170
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/temp/run.do_configure.3352425, line 159
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/temp/run.do_configure.3352425, line 146
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/temp/run.do_configure.3352425, line 183
NOTE: recipe igt-gpu-tools-2.4-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2501 tasks of which 2491 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501115841.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501115841.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/temp/log.do_configure.3352425
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: igt-gpu-tools-2.4-r0 do_configure: meson setup failed
ERROR: igt-gpu-tools-2.4-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/temp/run.do_configure.3352425' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/temp/log.do_configure.3352425
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_configure) failed with exit code '1'

--===============4027317831843327128==--

