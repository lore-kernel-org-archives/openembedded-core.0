Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D56C87FE2
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.32133.1680384535534334145
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=m/X+E3EN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101873eb92919-6708a8d3-493b-4ac0-918c-6ff26d97e07d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0Y+Tc2Hmve/2J+fNMpI+SFliizMv9ApmzsmhL4HdaFk=;
	b=m/X+E3ENdbYYctXFxYTHjSzGKEMDEAMhjvDMsPGxO8lLUtSMlx6TnJ/mMRen8xij
	n6NgzTu7kuDhSgjRs8qDspiWpYF/grChM8rtgU96IyESI5/5lB1wiXPDAJw82kgsfC4
	iyKqvH4O9zzJk6397EoMTWcIfOHLeXg7B5ocshjk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0Y+Tc2Hmve/2J+fNMpI+SFliizMv9ApmzsmhL4HdaFk=;
	b=ZPmEo3KFMKEFSh6HKeH00oUKD26oLxDk1z/119XZak94SPIcpzr7dtsYkzpFvgSV
	Dz8n9/tjI4O0VxX5XRaiaXPt/EqO/iDcJFy2PkiIbgaS1XB4a7/iwmfCFnzQo8c0KZ7
	j+1aiSrYvhktfnjDg7XHRHLeLF/bXp03vEQaV8l0=
Content-Type: multipart/mixed; boundary="===============7731027862313263635=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gobject-introspection: upgrading to 1.76.1 FAILED
Message-ID: <010101873eb92919-6708a8d3-493b-4ac0-918c-6ff26d97e07d-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179522

--===============7731027862313263635==
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
--===============7731027862313263635==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gobject-introspection-upgrade-1.74.0-1.76.1.patch"

RnJvbSA1OWNhODM2MDcxOGE5OGQ0MGQyZTczOTJkMDdiNjcyMWUwMWQ0Nzg1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAxNDoyNzozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdv
YmplY3QtaW50cm9zcGVjdGlvbjogdXBncmFkZSAxLjc0LjAgLT4gMS43Ni4xCgotLS0KIC4uLjAx
LVJlbG9jYXRlLXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9yeS1mb3ItbmF0aXZlLWJ1aWxkcy5wYXRj
aCB8IDIgKy0KIC4uLi1pbnRyb3NwZWN0aW9uXzEuNzQuMC5iYiA9PiBnb2JqZWN0LWludHJvc3Bl
Y3Rpb25fMS43Ni4xLmJifSB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1nbm9tZS9nb2JqZWN0LWludHJv
c3BlY3Rpb24ve2dvYmplY3QtaW50cm9zcGVjdGlvbl8xLjc0LjAuYmIgPT4gZ29iamVjdC1pbnRy
b3NwZWN0aW9uXzEuNzYuMS5iYn0gKDk5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25v
bWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50cm9zcGVjdGlvbi8wMDAxLVJlbG9j
YXRlLXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9yeS1mb3ItbmF0aXZlLWJ1aWxkcy5wYXRjaCBiL21l
dGEvcmVjaXBlcy1nbm9tZS9nb2JqZWN0LWludHJvc3BlY3Rpb24vZ29iamVjdC1pbnRyb3NwZWN0
aW9uLzAwMDEtUmVsb2NhdGUtdGhlLXJlcG9zaXRvcnktZGlyZWN0b3J5LWZvci1uYXRpdmUtYnVp
bGRzLnBhdGNoCmluZGV4IDAzMGZmMTc2MDEuLmU0YTFmZTNkMmMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1nbm9tZS9nb2JqZWN0LWludHJvc3BlY3Rpb24vZ29iamVjdC1pbnRyb3NwZWN0aW9u
LzAwMDEtUmVsb2NhdGUtdGhlLXJlcG9zaXRvcnktZGlyZWN0b3J5LWZvci1uYXRpdmUtYnVpbGRz
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9nb2JqZWN0LWludHJvc3BlY3Rpb24vZ29i
amVjdC1pbnRyb3NwZWN0aW9uLzAwMDEtUmVsb2NhdGUtdGhlLXJlcG9zaXRvcnktZGlyZWN0b3J5
LWZvci1uYXRpdmUtYnVpbGRzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkMzk2ZTUxMjY0
NjE2MzFlMmM3M2NlOThiYTAzNGYxZTQ0NTk4ZjZhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSAxNmM4ZTUyNGQxODkzYTg2NTM4ZTJiZTQwZTEwMmI1MzFkYzAwYTM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogU2FzY2hhIFNpbGJlIDx4LXlvMTdAc2Utc2lsYmUuZGU+CiBE
YXRlOiBGcmksIDggSnVuIDIwMTggMTM6NTU6MTAgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gUmVs
b2NhdGUgdGhlIHJlcG9zaXRvcnkgZGlyZWN0b3J5IGZvciBuYXRpdmUgYnVpbGRzCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50
cm9zcGVjdGlvbl8xLjc0LjAuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3Nw
ZWN0aW9uL2dvYmplY3QtaW50cm9zcGVjdGlvbl8xLjc2LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5
OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9n
b2JqZWN0LWludHJvc3BlY3Rpb25fMS43NC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25v
bWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50cm9zcGVjdGlvbl8xLjc2LjEuYmIK
aW5kZXggNzgxZWQ2NWRhMy4uZGVlM2Y0MDhjMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdu
b21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rpb25fMS43NC4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9nb2JqZWN0LWludHJvc3BlY3Rpb24vZ29iamVjdC1p
bnRyb3NwZWN0aW9uXzEuNzYuMS5iYgpAQCAtMTcsNyArMTcsNyBAQCBTUkNfVVJJID0gIiR7R05P
TUVfTUlSUk9SfS8ke0JQTn0vJHtAb2UudXRpbHMudHJpbV92ZXJzaW9uKCIke1BWfSIsIDIpfS8k
e0JQTn0tJAogICAgICAgICAgICBmaWxlOi8vMDAwMS1nLWlyLXRvb2wtdGVtcGxhdGUuaW4tZml4
LWdpcmRpci1wYXRoLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMzQ3YjNhNzE5ZTY4YmE0YzY5ZmYyZDU3ZWUyNjg5MjMzZWE4YzA3ZmM0OTIyMDVlNTczMzg2
Nzc5ZTQyZDY1MyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxOTYxNzhiZjY0MzQ1NTAxZGNkYzRk
ODQ2OWIzNmFhNmZlODA0ODkzNTRlZmU3MWNiN2NiOGFiODJhMzczOGJmIgogCiBTUkNfVVJJOmFw
cGVuZDpjbGFzcy1uYXRpdmUgPSAiIGZpbGU6Ly8wMDAxLVJlbG9jYXRlLXRoZS1yZXBvc2l0b3J5
LWRpcmVjdG9yeS1mb3ItbmF0aXZlLWJ1aWxkcy5wYXRjaCIKIAotLSAKMi4zOS4yCgo=

--===============7731027862313263635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1796 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1796 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-c8f46a6e2702984f372fdf6f65cecfe8c72d5c2a"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c8f46a6e2702984f372fdf6f65cecfe8c72d5c2a"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 121 Local 111 Mirrors 0 Missed 10 Current 224 (91% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 319 of 345 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 841 of 1296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_fetch)
NOTE: Running task 842 of 1296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_fetch)
NOTE: Running task 859 of 1296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_write_config)
NOTE: Running task 866 of 1296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_write_config)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_fetch: Succeeded
NOTE: Running task 946 of 1296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_unpack)
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_fetch: Succeeded
NOTE: Running task 947 of 1296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_unpack)
NOTE: Running task 948 of 1296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_unpack: Succeeded
NOTE: Running task 949 of 1296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_patch: Started
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_unpack: Succeeded
NOTE: Running task 950 of 1296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_patch: Succeeded
NOTE: Running task 951 of 1296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 952 of 1296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_populate_lic)
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_lic: Started
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 953 of 1296 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_deploy_source_date_epoch)
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
 cto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['quilt-native', 'glib-2.0-native', 'zlib-native', 'autoconf-archive-native', 'bison-native', 'flex-native', 'meson-native', 'ninja-native', 'pkgconfig-native', 'python3-native', 'xz-native', 'gtk-doc-native', 'libffi-native', 're2c-native', 'texinfo-dummy-native', 'gettext-minimal-native', 'libtool-native', 'm4-native', 'bzip2-native', 'libnsl2-native', 'readline-native', 'openssl-native', 'ncurses-native', 'util-linux-libuuid-native', 'sqlite3-native', 'gdbm-native', 'libtirpc-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-build-native', 'python3-installer-native', 'libpcre2-native', 'util-linux-native', 'gettext-native', 'gnu-config-native', 'perl-native', 'python3-flit-core-native', 'python3-pyproject-hooks-native', 'python3-packaging-native', 'libcap-ng-native', 'make-native', 'unzip-native']
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.76.1-r0/temp/run.do_configure.3489251:183 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.76.1-r0/temp/run.do_configure.3489251, line 183
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.76.1-r0/temp/run.do_configure.3489251, line 172
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.76.1-r0/temp/run.do_configure.3489251, line 158
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.76.1-r0/temp/run.do_configure.3489251, line 196
NOTE: recipe gobject-introspection-native-1.76.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1283 tasks of which 1270 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gobject-introspection-native-1.76.1-r0 do_configure: meson failed
ERROR: gobject-introspection-native-1.76.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.76.1-r0/temp/run.do_configure.3489251', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.76.1-r0/temp/log.do_configure.3489251
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_configure) failed with exit code '1'

--===============7731027862313263635==--

