Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59852C88CAE
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:30 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.13517.1681581684516033537
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NnK0Nphs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018786143af8-419ba18e-5965-4907-89e0-be0436b82ef8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4SneVgDZybLkI4XZZN+HpypOk7B8JPc1w2Iu/6E95SI=;
	b=NnK0Nphsbz4IhThC2Pk35rvzGhb3O/MejFKuFo8lN6AhtBj+ErY/MhGhOLuJO6zj
	OtZb6Vf8mxPgram365RxlcJtgcHNGSwi+RsQn232AcL+2u64/fXbQEzTtgx+7mtwTfj
	qGS1orCtiqHI7vBhnpUOL0x0uaEs1jcAlx6GYAfE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4SneVgDZybLkI4XZZN+HpypOk7B8JPc1w2Iu/6E95SI=;
	b=cW6v0OHrojHU9ufM/9/Xw3FeXi/tkpXkCyoBR3PsA3tC3Z/BnbnJZCy+lpi5E4Vx
	Q+9puUyzy9lrv3PP3KfxCHZQ/aJQyE4+vklD4Y2Q5uIKQZp8rJIeaZ/6gfk5gc5Ql9u
	W6+nqYaH/sM1gfbJ81Vs74YSFv3edRdFtjlP+wc4=
Content-Type: multipart/mixed; boundary="===============3278917154430202488=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gobject-introspection: upgrading to 1.76.1 FAILED
Message-ID: <0101018786143af8-419ba18e-5965-4907-89e0-be0436b82ef8-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180057

--===============3278917154430202488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gobject-introspection* to *1.76.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gobject-introspection-upgrade-1.74.0-1.76.1.patch
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
--===============3278917154430202488==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gobject-introspection-upgrade-1.74.0-1.76.1.patch"

RnJvbSAwMjE5MmU1NDhkYjJkYTMxOWVjOGI3ZGQ4YzNkNmM0MzlmMjQwNjY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTM6MTE6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
b2JqZWN0LWludHJvc3BlY3Rpb246IHVwZ3JhZGUgMS43NC4wIC0+IDEuNzYuMQoKLS0tCiAuLi4w
MS1SZWxvY2F0ZS10aGUtcmVwb3NpdG9yeS1kaXJlY3RvcnktZm9yLW5hdGl2ZS1idWlsZHMucGF0
Y2ggfCAyICstCiAuLi4taW50cm9zcGVjdGlvbl8xLjc0LjAuYmIgPT4gZ29iamVjdC1pbnRyb3Nw
ZWN0aW9uXzEuNzYuMS5iYn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRy
b3NwZWN0aW9uL3tnb2JqZWN0LWludHJvc3BlY3Rpb25fMS43NC4wLmJiID0+IGdvYmplY3QtaW50
cm9zcGVjdGlvbl8xLjc2LjEuYmJ9ICg5OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdu
b21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rpb24vMDAwMS1SZWxv
Y2F0ZS10aGUtcmVwb3NpdG9yeS1kaXJlY3RvcnktZm9yLW5hdGl2ZS1idWlsZHMucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50cm9zcGVj
dGlvbi8wMDAxLVJlbG9jYXRlLXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9yeS1mb3ItbmF0aXZlLWJ1
aWxkcy5wYXRjaAppbmRleCAwMzBmZjE3NjAxLi40ODk2NDFhNmM4IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50cm9zcGVjdGlv
bi8wMDAxLVJlbG9jYXRlLXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9yeS1mb3ItbmF0aXZlLWJ1aWxk
cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dv
YmplY3QtaW50cm9zcGVjdGlvbi8wMDAxLVJlbG9jYXRlLXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9y
eS1mb3ItbmF0aXZlLWJ1aWxkcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDM5NmU1MTI2
NDYxNjMxZTJjNzNjZTk4YmEwMzRmMWU0NDU5OGY2YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gODJiMGM1NTEyYTkxMTVlYWQwMmNhZDI1ZjI5OGUxNjY5MzBjZjY0MSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IFNhc2NoYSBTaWxiZSA8eC15bzE3QHNlLXNpbGJlLmRlPgog
RGF0ZTogRnJpLCA4IEp1biAyMDE4IDEzOjU1OjEwICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJl
bG9jYXRlIHRoZSByZXBvc2l0b3J5IGRpcmVjdG9yeSBmb3IgbmF0aXZlIGJ1aWxkcwpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWlu
dHJvc3BlY3Rpb25fMS43NC4wLmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9z
cGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rpb25fMS43Ni4xLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9nb2JqZWN0LWludHJvc3BlY3Rpb24v
Z29iamVjdC1pbnRyb3NwZWN0aW9uXzEuNzQuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdu
b21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rpb25fMS43Ni4xLmJi
CmluZGV4IDc4MWVkNjVkYTMuLmRlZTNmNDA4YzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1n
bm9tZS9nb2JqZWN0LWludHJvc3BlY3Rpb24vZ29iamVjdC1pbnRyb3NwZWN0aW9uXzEuNzQuMC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3Qt
aW50cm9zcGVjdGlvbl8xLjc2LjEuYmIKQEAgLTE3LDcgKzE3LDcgQEAgU1JDX1VSSSA9ICIke0dO
T01FX01JUlJPUn0vJHtCUE59LyR7QG9lLnV0aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0iLCAyKX0v
JHtCUE59LSQKICAgICAgICAgICAgZmlsZTovLzAwMDEtZy1pci10b29sLXRlbXBsYXRlLmluLWZp
eC1naXJkaXItcGF0aC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjM0N2IzYTcxOWU2OGJhNGM2OWZmMmQ1N2VlMjY4OTIzM2VhOGMwN2ZjNDkyMjA1ZTU3MzM4
Njc3OWU0MmQ2NTMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTk2MTc4YmY2NDM0NTUwMWRjZGM0
ZDg0NjliMzZhYTZmZTgwNDg5MzU0ZWZlNzFjYjdjYjhhYjgyYTM3MzhiZiIKIAogU1JDX1VSSTph
cHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBmaWxlOi8vMDAwMS1SZWxvY2F0ZS10aGUtcmVwb3NpdG9y
eS1kaXJlY3RvcnktZm9yLW5hdGl2ZS1idWlsZHMucGF0Y2giCiAKLS0gCjIuMzkuMgoK

--===============3278917154430202488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1798 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1798 targets, 40 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:dabcec1983405775b4450afc1e0f1c8d449039c1"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 108 Local 99 Mirrors 0 Missed 9 Current 237 (91% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 334 of 345 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 841 of 1296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_fetch)
NOTE: Running task 842 of 1296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_fetch)
NOTE: Running task 859 of 1296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_write_config)
NOTE: Running task 866 of 1296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_write_config)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_fetch: Succeeded
NOTE: Running task 946 of 1296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_unpack)
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_write_config: Succeeded
NOTE: Running task 947 of 1296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_unpack)
NOTE: Running task 948 of 1296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_unpack: Succeeded
NOTE: Running task 949 of 1296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_patch: Started
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 950 of 1296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_patch: Succeeded
NOTE: Running task 951 of 1296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 952 of 1296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_populate_lic)
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_lic: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_patch: Succeeded
NOTE: Running task 953 of 1296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1283 of 1296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_configure)
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2023.02.20.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.0.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yo
 cto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['quilt-native', 'glib-2.0-native', 'zlib-native', 'autoconf-archive-native', 'bison-native', 'flex-native', 'meson-native', 'ninja-native', 'pkgconfig-native', 'python3-native', 'xz-native', 'gtk-doc-native', 'libffi-native', 'gettext-minimal-native', 'libtool-native', 'm4-native', 'texinfo-dummy-native', 'gettext-native', 'libpcre2-native', 'util-linux-native', 'python3-wheel-native', 'python3-installer-native', 'python3-setuptools-native', 'python3-build-native', 'readline-native', 'util-linux-libuuid-native', 'bzip2-native', 'libtirpc-native', 'gdbm-native', 'libnsl2-native', 'openssl-native', 'sqlite3-native', 'ncurses-native', 're2c-native', 'gnu-config-native', 'libcap-ng-native', 'python3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'perl-native', 'unzip-native', 'make-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| gtkdocize: neither configure.ac nor configure.in exist
| NOTE: Executing meson -Dgtk_doc=false -Ddoctool=disabled...
| The Meson build system
| Version: 1.0.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.76.1-r0/gobject-introspection-1.76.1
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.76.1-r0/build
| Build type: native build
| Project name: gobject-introspection
| Project version: 1.76.1
| C compiler for the host machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the host machine: gcc ld.bfd 2.40.20230119
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Program python3 found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.76.1-r0/recipe-sysroot-native/usr/bin/python3-native/python3)
| Compiler for C supports arguments -Warray-bounds: YES
| Compiler for C supports arguments -Wcast-align: YES
| Compiler for C supports arguments -Wduplicated-branches: YES
| Compiler for C supports arguments -Wformat=2: YES
| Compiler for C supports arguments -Wformat-nonliteral: YES
| Compiler for C supports arguments -Wformat-security: YES
| Compiler for C supports arguments -Wimplicit-function-declaration: YES
| Compiler for C supports arguments -Winit-self: YES
| Compiler for C supports arguments -Wjump-misses-init: YES
| Compiler for C supports arguments -Wlogical-op: YES
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wmissing-format-attribute: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Wmissing-noreturn: YES
| Compiler for C supports arguments -Wmissing-prototypes: YES
| Compiler for C supports arguments -Wnested-externs: YES
| Compiler for C supports arguments -Wnull-dereference: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C supports arguments -Wpacked: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Compiler for C supports arguments -Wrestrict: YES
| Compiler for C supports arguments -Wreturn-type: YES
| Compiler for C supports arguments -Wshadow: YES
| Compiler for C supports arguments -Wsign-compare: YES
| Compiler for C supports arguments -Wstrict-aliasing: YES
| Compiler for C supports arguments -Wstrict-prototypes: YES
| Compiler for C supports arguments -Wundef: YES
| Compiler for C supports arguments -Wunused-but-set-variable: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Checking for size of "char" : 1
| Checking for size of "short" : 2
| Checking for size of "int" : 4
| Checking for size of "long" : 8
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.76.1-r0/recipe-sysroot-native/usr/bin/pkg-config-native (0.29.2)
| Dependency glib-2.0 found: NO found 2.74.6 but need: '>=2.76.0'
| Did not find CMake 'cmake'
| Found CMake: NO
| Run-time dependency glib-2.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency glib-2.0
| 
| ../gobject-introspection-1.76.1/meson.build:130:0: ERROR: Automatic wrap-based subproject downloading is disabled
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.76.1-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.76.1-r0/temp/run.do_configure.3079579:183 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.76.1-r0/temp/run.do_configure.3079579, line 183
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.76.1-r0/temp/run.do_configure.3079579, line 172
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.76.1-r0/temp/run.do_configure.3079579, line 158
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.76.1-r0/temp/run.do_configure.3079579, line 196
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1283 tasks of which 1270 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gobject-introspection-native-1.76.1-r0 do_configure: meson failed
ERROR: gobject-introspection-native-1.76.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.76.1-r0/temp/run.do_configure.3079579', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.76.1-r0/temp/log.do_configure.3079579
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_configure) failed with exit code '1'

--===============3278917154430202488==--

