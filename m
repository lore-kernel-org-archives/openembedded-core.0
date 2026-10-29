Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5593.1793252421130285079
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 22:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DSYQNMYa;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ec8mkkb9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a1862c69d1-afbe70e0-ec82-4c9f-ae48-6a4567db5a22-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793252420;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=ZniDf1of/Ve5fFtjpq77hsxP8z5+hlKorE6UlncpHTY=;
	b=DSYQNMYavlniF6DYTgTqsKhFPJix2n9OJUxuel2WpjyBJHUnTA7y8DDJ09VMvI3Y
	FKqRW0cN6++BXlSPla53Nr7sq11k2QtiUgLho8eU5awXXSg7SvA9+nG0TlhYT/tKpxJ
	FLxoEFLlDc3gRbPEbNrInqt8CvFG3G7vGikBJHbI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793252420;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=ZniDf1of/Ve5fFtjpq77hsxP8z5+hlKorE6UlncpHTY=;
	b=ec8mkkb9JmW3kk4pQDu7ur0PU5G1OBWsvvul2I7P5oFZqV2Qs0m7BUe8AC4aWvdK
	nn6+MopYNAfjTqD5srROfW6S+tcL8ZBZi1lyg6bu25h83S0a32d/Nm0Ge3pHw45ZQuY
	HQymFBoOrngYNmYrkmYn8k6fk012iOGmDDN7osGg=
Content-Type: multipart/mixed; boundary="===============4959635363114080139=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cracklib: upgrading to 2.10.4 FAILED
Message-ID: <010101a1862c69d1-afbe70e0-ec82-4c9f-ae48-6a4567db5a22-000000@us-west-2.amazonses.com>
Date: Thu, 29 Oct 2026 05:40:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.29-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 05:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248894

--===============4959635363114080139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cracklib* to *2.10.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cracklib-upgrade-2.10.3-2.10.4.patch
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
From 5d15ffd4f4d295271a9122559d27d3c5a907a780 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 29 Oct 2026 05:29:14 +0000
Subject: [PATCH] cracklib: upgrade 2.10.3 -> 2.10.4

v2.10.5-dev
v2.10.4 Basic support for other compression in cracklib-format
        Improvements in python support and explicitly raising minimum python
        version requirement. (Pino Toscano)
        Improvements and fixes for autotools build system with support for new
        gettext 1.0 (Guillem Jover)
        Security and undefined behavior improvements (Gabe Dijkstra)
---
 .../cracklib/{cracklib_2.10.3.bb => cracklib_2.10.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cracklib/{cracklib_2.10.3.bb => cracklib_2.10.4.bb} (94%)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.10.3.bb b/meta/recipes-extended/cracklib/cracklib_2.10.4.bb
similarity index 94%
rename from meta/recipes-extended/cracklib/cracklib_2.10.3.bb
rename to meta/recipes-extended/cracklib/cracklib_2.10.4.bb
index 48dd72d5f9..1c7116915c 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.10.3.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.10.4.bb
@@ -12,7 +12,7 @@ EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
 SRC_URI = "git://github.com/cracklib/cracklib;protocol=https;branch=main;tag=v${PV} \
            "
 
-SRCREV = "e73d5db1789d198b5f9ec44b68b9c775c3e6c042"
+SRCREV = "246592be1a654624965630b748ab4f1ac044f513"
 S = "${UNPACKDIR}/${BP}/src"
 
 inherit autotools gettext
-- 
2.47.1


--===============4959635363114080139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cracklib-changelog.txt"

v2.10.5-dev
v2.10.4 Basic support for other compression in cracklib-format
        Improvements in python support and explicitly raising minimum python
        version requirement. (Pino Toscano)
        Improvements and fixes for autotools build system with support for new
        gettext 1.0 (Guillem Jover)
        Security and undefined behavior improvements (Gabe Dijkstra)

--===============4959635363114080139==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cracklib-upgrade-2.10.3-2.10.4.patch"

RnJvbSA1ZDE1ZmZkNGY0ZDI5NTI3MWE5MTIyNTU5ZDI3ZDNjNWE5MDdhNzgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjkgT2N0IDIwMjYgMDU6Mjk6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
cmFja2xpYjogdXBncmFkZSAyLjEwLjMgLT4gMi4xMC40Cgp2Mi4xMC41LWRldgp2Mi4xMC40IEJh
c2ljIHN1cHBvcnQgZm9yIG90aGVyIGNvbXByZXNzaW9uIGluIGNyYWNrbGliLWZvcm1hdAogICAg
ICAgIEltcHJvdmVtZW50cyBpbiBweXRob24gc3VwcG9ydCBhbmQgZXhwbGljaXRseSByYWlzaW5n
IG1pbmltdW0gcHl0aG9uCiAgICAgICAgdmVyc2lvbiByZXF1aXJlbWVudC4gKFBpbm8gVG9zY2Fu
bykKICAgICAgICBJbXByb3ZlbWVudHMgYW5kIGZpeGVzIGZvciBhdXRvdG9vbHMgYnVpbGQgc3lz
dGVtIHdpdGggc3VwcG9ydCBmb3IgbmV3CiAgICAgICAgZ2V0dGV4dCAxLjAgKEd1aWxsZW0gSm92
ZXIpCiAgICAgICAgU2VjdXJpdHkgYW5kIHVuZGVmaW5lZCBiZWhhdmlvciBpbXByb3ZlbWVudHMg
KEdhYmUgRGlqa3N0cmEpCi0tLQogLi4uL2NyYWNrbGliL3tjcmFja2xpYl8yLjEwLjMuYmIgPT4g
Y3JhY2tsaWJfMi4xMC40LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Ny
YWNrbGliL3tjcmFja2xpYl8yLjEwLjMuYmIgPT4gY3JhY2tsaWJfMi4xMC40LmJifSAoOTQlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jcmFja2xpYi9jcmFja2xpYl8yLjEw
LjMuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3JhY2tsaWIvY3JhY2tsaWJfMi4xMC40LmJi
CnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9j
cmFja2xpYi9jcmFja2xpYl8yLjEwLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRl
ZC9jcmFja2xpYi9jcmFja2xpYl8yLjEwLjQuYmIKaW5kZXggNDhkZDcyZDVmOS4uMWM3MTE2OTE1
YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2NyYWNrbGliL2NyYWNrbGliXzIu
MTAuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3JhY2tsaWIvY3JhY2tsaWJfMi4x
MC40LmJiCkBAIC0xMiw3ICsxMiw3IEBAIEVYVFJBX09FQ09ORiA9ICItLXdpdGhvdXQtcHl0aG9u
IC0tbGliZGlyPSR7YmFzZV9saWJkaXJ9IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2Ny
YWNrbGliL2NyYWNrbGliO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluO3RhZz12JHtQVn0gXAog
ICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICJlNzNkNWRiMTc4OWQxOThiNWY5ZWM0NGI2OGI5Yzc3
NWMzZTZjMDQyIgorU1JDUkVWID0gIjI0NjU5MmJlMWE2NTQ2MjQ5NjU2MzBiNzQ4YWI0ZjFhYzA0
NGY1MTMiCiBTID0gIiR7VU5QQUNLRElSfS8ke0JQfS9zcmMiCiAKIGluaGVyaXQgYXV0b3Rvb2xz
IGdldHRleHQKLS0gCjIuNDcuMQoK

--===============4959635363114080139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1997 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-d5bac216d8d2bfcb482cd6b69e2dcd669fdf34d4"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:d5bac216d8d2bfcb482cd6b69e2dcd669fdf34d4"
meta-yocto-bsp       
meta-poky            = "master:82013b83db7ba41da07694e201a7c43f561a9e00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 175 Local 157 Mirrors 0 Missed 18 Current 194 (89% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 345 of 369 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running task 706 of 1029 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_recipe_qa)
NOTE: Running task 708 of 1029 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_recipe_qa)
NOTE: recipe cracklib-2.10.4-r0: task do_recipe_qa: Started
NOTE: recipe zlib-native-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe cracklib-native-2.10.4-r0: task do_recipe_qa: Started
NOTE: recipe zlib-native-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 369 of 369 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zlib-native-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zlib-native-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 997 of 1029 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_create_recipe_spdx)
NOTE: recipe cracklib-2.10.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1000 of 1029 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_fetch)
NOTE: recipe cracklib-native-2.10.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1001 of 1029 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_fetch)
NOTE: recipe cracklib-native-2.10.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe cracklib-2.10.4-r0: task do_fetch: Started
NOTE: recipe cracklib-native-2.10.4-r0: task do_fetch: Started
NOTE: recipe cracklib-native-2.10.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1002 of 1029 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_create_recipe_spdx)
NOTE: recipe cracklib-2.10.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe cracklib-2.10.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe cracklib-2.10.4-r0: task do_fetch: Succeeded
NOTE: Running task 1003 of 1029 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_unpack)
NOTE: recipe cracklib-2.10.4-r0: task do_unpack: Started
NOTE: recipe cracklib-native-2.10.4-r0: task do_fetch: Succeeded
NOTE: Running task 1004 of 1029 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_unpack)
NOTE: Running task 1005 of 1029 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe cracklib-native-2.10.4-r0: task do_unpack: Started
NOTE: recipe cracklib-native-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cracklib-native-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cracklib-2.10.4-r0: task do_unpack: Failed
NOTE: recipe cracklib-native-2.10.4-r0: task do_unpack: Failed
NOTE: Tasks Summary: Attempted 1005 tasks of which 996 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261029052857.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261029052857.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_unpack
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/cracklib/2.10.4/temp/log.do_unpack.4165764
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_unpack
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cracklib-native/2.10.4/temp/log.do_unpack.4165859
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: cracklib-2.10.4-r0 do_unpack: Bitbake Fetcher Error: FetchError("The revision the git tag 'v2.10.4' resolved to didn't match the SRCREV in use (3b38d097102e34b50b5a1c2a8ddd1541172de85a vs 246592be1a654624965630b748ab4f1ac044f513)", 'git://github.com/cracklib/cracklib;protocol=https;branch=main;tag=v2.10.4')
ERROR: cracklib-native-2.10.4-r0 do_unpack: Bitbake Fetcher Error: FetchError("The revision the git tag 'v2.10.4' resolved to didn't match the SRCREV in use (3b38d097102e34b50b5a1c2a8ddd1541172de85a vs 246592be1a654624965630b748ab4f1ac044f513)", 'git://github.com/cracklib/cracklib;protocol=https;branch=main;tag=v2.10.4')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/cracklib/2.10.4/temp/log.do_unpack.4165764
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_unpack) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cracklib-native/2.10.4/temp/log.do_unpack.4165859
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_unpack) failed with exit code '1'

--===============4959635363114080139==--
