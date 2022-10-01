Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2C6C352AA
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:54:14 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.486.1664643228745551427
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AztWZeJ7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 010101839477e08c-0fad76dc-2884-4067-a267-36b826d507b5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mkE7pplts15DYDahA4ibQwLVomtRAti9a+P3ES432lU=;
	b=AztWZeJ7FSrLLoFILJ1/HuWNXzgT3ExCdroceSnnd9DInVYO4PiqVjuVKvD/MePe
	B6mXSMeg87TP5uRZpoU+v5cJfZZ42Q0JV+SgeaIaj3kuRmMv0P39/OgepA6KQ45dJ8Y
	K5Rjk4Z/gZbPfq6KcvuBTG6oGFzLjVnr1FPo2O4U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mkE7pplts15DYDahA4ibQwLVomtRAti9a+P3ES432lU=;
	b=ZRI+Z822RJztTw7obdXhyX7/X/TndltuGtp9zW8evePupiMn5aDpMOJWof7505cB
	UVRdFUmGoX1f7eWuwSuPBwgT1czSlLNAtJNcXhQVptQU2lS1gbCkT4XPzX7eLU0DocE
	kkIiovK8ymdUUUCInb13goIdW40hUsHVonPZB7Zc=
Content-Type: multipart/mixed; boundary="===============7975981572885016207=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gobject-introspection: upgrading to 1.74.0 FAILED
Message-ID: 
 <010101839477e08c-0fad76dc-2884-4067-a267-36b826d507b5-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:54:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171314

--===============7975981572885016207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gobject-introspection* to *1.74.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gobject-introspection-upgrade-1.72.0-1.74.0.patch
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
--===============7975981572885016207==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gobject-introspection-upgrade-1.72.0-1.74.0.patch"

RnJvbSAzYjRkZWIxNzU1OGJhNzcyZWE1NGFlYWQ3ZTBjYmJiNmFiZTA0Y2JjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAxMjoyMzoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdv
YmplY3QtaW50cm9zcGVjdGlvbjogdXBncmFkZSAxLjcyLjAgLT4gMS43NC4wCgotLS0KIC4uLi1S
ZWxvY2F0ZS10aGUtcmVwb3NpdG9yeS1kaXJlY3RvcnktZm9yLW5hdGl2ZS1idWlsZHMucGF0Y2gg
fCA0ICsrLS0KIC4uLm50cm9zcGVjdGlvbl8xLjcyLjAuYmIgPT4gZ29iamVjdC1pbnRyb3NwZWN0
aW9uXzEuNzQuMC5iYn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3Nw
ZWN0aW9uL3tnb2JqZWN0LWludHJvc3BlY3Rpb25fMS43Mi4wLmJiID0+IGdvYmplY3QtaW50cm9z
cGVjdGlvbl8xLjc0LjAuYmJ9ICg5OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21l
L2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rpb24vMDAwMS1SZWxvY2F0
ZS10aGUtcmVwb3NpdG9yeS1kaXJlY3RvcnktZm9yLW5hdGl2ZS1idWlsZHMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50cm9zcGVjdGlv
bi8wMDAxLVJlbG9jYXRlLXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9yeS1mb3ItbmF0aXZlLWJ1aWxk
cy5wYXRjaAppbmRleCBiYTk2NTA5MmUxLi41MGY0MTE4NTFjIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50cm9zcGVjdGlvbi8w
MDAxLVJlbG9jYXRlLXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9yeS1mb3ItbmF0aXZlLWJ1aWxkcy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmpl
Y3QtaW50cm9zcGVjdGlvbi8wMDAxLVJlbG9jYXRlLXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9yeS1m
b3ItbmF0aXZlLWJ1aWxkcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzRhMGZlZTg5MjIz
NWM3MjJhYzYwZGRlYTZlZTc5YmMzZDdhOTNmNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gNTM5ZmM0ODgxODQ0YzdiMzI2OGVjY2QyMWI1YTQ1ZGNkMjAxNjljMCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IFNhc2NoYSBTaWxiZSA8eC15bzE3QHNlLXNpbGJlLmRlPgogRGF0
ZTogRnJpLCA4IEp1biAyMDE4IDEzOjU1OjEwICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJlbG9j
YXRlIHRoZSByZXBvc2l0b3J5IGRpcmVjdG9yeSBmb3IgbmF0aXZlIGJ1aWxkcwpAQCAtMjEsNyAr
MjEsNyBAQCBTaWduZWQtb2ZmLWJ5OiBTYXNjaGEgU2lsYmUgPHgteW8xN0BzZS1zaWxiZS5kZT4K
ICAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiAKIGRp
ZmYgLS1naXQgYS9naXJlcG9zaXRvcnkvZ2lyZXBvc2l0b3J5LmMgYi9naXJlcG9zaXRvcnkvZ2ly
ZXBvc2l0b3J5LmMKLWluZGV4IDdkMDM0ODUuLjIwZjQ4MTMgMTAwNjQ0CitpbmRleCBhMDc1NGY0
Li4yZDQ1NmY5IDEwMDY0NAogLS0tIGEvZ2lyZXBvc2l0b3J5L2dpcmVwb3NpdG9yeS5jCiArKysg
Yi9naXJlcG9zaXRvcnkvZ2lyZXBvc2l0b3J5LmMKIEBAIC0yMSw2ICsyMSw4IEBACmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50
cm9zcGVjdGlvbl8xLjcyLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3Nw
ZWN0aW9uL2dvYmplY3QtaW50cm9zcGVjdGlvbl8xLjc0LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5
OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9n
b2JqZWN0LWludHJvc3BlY3Rpb25fMS43Mi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25v
bWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50cm9zcGVjdGlvbl8xLjc0LjAuYmIK
aW5kZXggZDkzNWNiZDkwNS4uYWI5ZDJkMzVkOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdu
b21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rpb25fMS43Mi4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9nb2JqZWN0LWludHJvc3BlY3Rpb24vZ29iamVjdC1p
bnRyb3NwZWN0aW9uXzEuNzQuMC5iYgpAQCAtMTcsNyArMTcsNyBAQCBTUkNfVVJJID0gIiR7R05P
TUVfTUlSUk9SfS8ke0JQTn0vJHtAb2UudXRpbHMudHJpbV92ZXJzaW9uKCIke1BWfSIsIDIpfS8k
e0JQTn0tJAogICAgICAgICAgICBmaWxlOi8vMDAwMS1nLWlyLXRvb2wtdGVtcGxhdGUuaW4tZml4
LWdpcmRpci1wYXRoLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMDJmZThlNTkwODYxZDg4ZjgzMDYwZGQzOWNkYTVjY2FhNjBiMmRhMWQyMWQwZjk1NDk5MzAx
YjE4NmJlYWFiYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzNDdiM2E3MTllNjhiYTRjNjlmZjJk
NTdlZTI2ODkyMzNlYThjMDdmYzQ5MjIwNWU1NzMzODY3NzllNDJkNjUzIgogCiBTUkNfVVJJOmFw
cGVuZDpjbGFzcy1uYXRpdmUgPSAiIGZpbGU6Ly8wMDAxLVJlbG9jYXRlLXRoZS1yZXBvc2l0b3J5
LWRpcmVjdG9yeS1mb3ItbmF0aXZlLWJ1aWxkcy5wYXRjaCIKIAotLSAKMi4zMS4xCgo=

--===============7975981572885016207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:42ba65d98a3594fff24591c01036307cd62f1637"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 112 Local 103 Mirrors 0 Missed 9 Current 218 (91% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1052 of 1252 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 1054 of 1252 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 1113 of 1252 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 1121 of 1252 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_write_config: Started
NOTE: Running task 1231 of 1252 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: Running task 1232 of 1252 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: Running task 1233 of 1252 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 1234 of 1252 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 1235 of 1252 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: Running task 1236 of 1252 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1237 of 1252 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_lic)
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_lic: Started
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_patch: Succeeded
NOTE: Running task 1238 of 1252 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1239 of 1252 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.09.03.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.63.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/y
 octo-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['quilt-native', 'glib-2.0-native', 'zlib-native', 'autoconf-archive-native', 'bison-native', 'flex-native', 'meson-native', 'ninja-native', 'pkgconfig-native', 'python3-native', 'xz-native', 'gtk-doc-native', 'libffi-native', 'libtool-native', 'util-linux-native', 'gettext-minimal-native', 'gettext-native', 'libpcre-native', 'texinfo-dummy-native', 're2c-native', 'sqlite3-native', 'readline-native', 'libtirpc-native', 'bzip2-native', 'ncurses-native', 'util-linux-libuuid-native', 'libnsl2-native', 'gdbm-native', 'openssl-native', 'python3-wheel-native', 'python3-setuptools-native', 'python3-installer-native', 'python3-picobuild-native', 'm4-native', 'libcap-ng-native', 'libpcre2-native', 'perl-native', 'python3-flit-core-native', 'gnu-config-native', 'make-native', 'unzip-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| gtkdocize: neither configure.ac nor configure.in exist
| NOTE: Executing meson -Dgtk_doc=false -Ddoctool=disabled...
| The Meson build system
| Version: 0.63.2
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/gobject-introspection-1.74.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/build
| Build type: native build
| Project name: gobject-introspection
| Project version: 1.74.0
| C compiler for the host machine: gcc (gcc 8.5.0 "gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-10)")
| C linker for the host machine: gcc ld.bfd 2.30-113
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Program python3 found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3)
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
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/recipe-sysroot-native/usr/bin/pkg-config-native (0.29.2)
| Dependency glib-2.0 found: NO found 2.72.3 but need: '>=2.74.0'
| Did not find CMake 'cmake'
| Found CMake: NO
| Run-time dependency glib-2.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency glib-2.0
| 
| ../gobject-introspection-1.74.0/meson.build:129:0: ERROR: Automatic wrap-based subproject downloading is disabled
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/temp/run.do_configure.2552616:184 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/temp/run.do_configure.2552616, line 184
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/temp/run.do_configure.2552616, line 173
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/temp/run.do_configure.2552616, line 159
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/temp/run.do_configure.2552616, line 197
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1239 tasks of which 1226 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gobject-introspection-native-1.74.0-r0 do_configure: meson failed
ERROR: gobject-introspection-native-1.74.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/temp/run.do_configure.2552616', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/temp/log.do_configure.2552616
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure) failed with exit code '1'

--===============7975981572885016207==--

