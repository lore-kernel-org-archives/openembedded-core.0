Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F1BD0D7A7
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:42 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.53367.1728588951632949875
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MkOH4Klj;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=zvvzWUr6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019277eedce0-e1332a42-e51e-4e53-8215-fb5691e76375-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588996;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dihVzJu1na9OdjYjfEj7V+Yw0xOhxZSNd17QLuamidY=;
	b=MkOH4Klj8vd5cp5YDC5bMEpV8CSLYc4/B8yNBPNZO+JniZvXta+TX+9MTjT7beHb
	jxwqY435ocGK9+VS4dfzufoee9jNMI0vAwU+hQek3AkkESSllhIgFnP83hy30zFTVkp
	KsJvm5OO+HmbGFciu0bfGGYdlYhSv9KPVx2RzBEQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588996;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dihVzJu1na9OdjYjfEj7V+Yw0xOhxZSNd17QLuamidY=;
	b=zvvzWUr6xKh5lKQfkj97gQO1hjdGmD9GLIqZb3+knGM6CiptT+A/1tiJixKOe8J3
	lEUQCEjN1DeC6ctvOdBng7JhQUKhTKswGPaX/YX2lxWUCBXWYl71fJjBeOmSS8TjRcl
	yne8EwkGmgRl5W4J64dbkYGgzu/JMTyV2Y49MH0k=
Content-Type: multipart/mixed; boundary="===============4674582422722155836=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.78.0 SUCCEEDED
Message-ID: <0101019277eedce0-e1332a42-e51e-4e53-8215-fb5691e76375-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205608

--===============4674582422722155836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICp2dGUqIHRvICowLjc4LjAqIGhhcyBTdWNjZWVkZWQuCgpOZXh0IHN0ZXBzOgogICAgLSBh
cHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLXZ0ZS11cGdyYWRlLTAuNzYuMy0wLjc4LjAucGF0
Y2gKICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8gdXBzdHJlYW0gcGF0Y2hlcyBhbmQgc3VtbWFy
aXplIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLAogICAgLSBjb21waWxlIGFuIGltYWdlIHRo
YXQgY29udGFpbnMgdGhlIHBhY2thZ2UKICAgIC0gcGVyZm9ybSBzb21lIGJhc2ljIHNhbml0eSB0
ZXN0cwogICAgLSBhbWVuZCB0aGUgcGF0Y2ggYW5kIHNpZ24gaXQgb2ZmOiBnaXQgY29tbWl0IC1z
IC0tcmVzZXQtYXV0aG9yIC0tYW1lbmQKICAgIC0gc2VuZCBpdCB0byB0aGUgYXBwcm9wcmlhdGUg
bWFpbGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5LCBpZiB5b3UgYmVsaWV2ZSB0aGUgcmVjaXBlIHNo
b3VsZCBub3QgYmUgdXBncmFkZWQgYXQgdGhpcyB0aW1lLAp5b3UgY2FuIGZpbGwgUkVDSVBFX05P
X1VQREFURV9SRUFTT04gaW4gcmVzcGVjdGl2ZSByZWNpcGUgZmlsZSBzbyB0aGF0CmF1dG9tYXRp
YyB1cGdyYWRlcyB3b3VsZCBubyBsb25nZXIgYmUgYXR0ZW1wdGVkLgoKUGxlYXNlIHJldmlldyB0
aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIgaW5mb3JtYXRpb24gYW5kIGJ1aWxkL3VwZGF0
ZSBmYWlsdXJlcy4KQW55IHByb2JsZW0gcGxlYXNlIGZpbGUgYSBidWcgYXQgaHR0cHM6Ly9idWd6
aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1Zy5jZ2k/cHJvZHVjdD1BdXRvbWF0ZWQlMjBV
cGRhdGUlMjBIYW5kbGVyCgpSZWdhcmRzLApUaGUgVXBncmFkZSBIZWxwZXIKCi0tID44IC0tCkZy
b20gYTBhMTA1ZTA3NjUxNTgyOGU4OWMwNzViM2E2M2I2NWY2MTY1OWY0NyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxwZXIgPGF1aEB5b2N0b3Byb2plY3Qub3JnPgpE
YXRlOiBUaHUsIDEwIE9jdCAyMDI0IDA2OjM5OjAwICswMDAwClN1YmplY3Q6IFtQQVRDSF0gdnRl
OiB1cGdyYWRlIDAuNzYuMyAtPiAwLjc4LjAKCi0tLQogLi4uL3Z0ZS8wMDAxLUFkZC1XX0VYSVRD
T0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCB8IDQgKystLQogbWV0YS9yZWNp
cGVzLXN1cHBvcnQvdnRlL3t2dGVfMC43Ni4zLmJiID0+IHZ0ZV8wLjc4LjAuYmJ9ICAgICB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS97dnRlXzAuNzYuMy5iYiA9PiB2dGVfMC43OC4w
LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAw
MS1BZGQtV19FWElUQ09ERS1tYWNyby1mb3Itbm9uLWdsaWJjLXN5c3RlbXMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlLzAwMDEtQWRkLVdfRVhJVENPREUtbWFjcm8tZm9yLW5v
bi1nbGliYy1zeXN0ZW1zLnBhdGNoCmluZGV4IGUyY2ZmNmNmNzYuLjQzYzQ3ZWUxOTggMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS1BZGQtV19FWElUQ09ERS1t
YWNyby1mb3Itbm9uLWdsaWJjLXN5c3RlbXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvdnRlL3Z0ZS8wMDAxLUFkZC1XX0VYSVRDT0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVt
cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjg3OTVkZGE2Mjk2MTRjZDg0MmZjYmExYzRi
NTBiZTc1OWMyMGRhNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTlkZGM4ZWM3YjBm
NWRmODRkNTBlZmI4ZjNkNjlkN2ExMjliNmE2NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IERhbmlsbyBTcGluZWxsYSA8ZGFueXNwaW45N0Bwcm90b25tYWlsLmNvbT4KIERhdGU6IFRo
dSwgMjEgTWFyIDIwMTkgMTQ6MTk6MjYgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gQWRkIFdfRVhJ
VENPREUgbWFjcm8gZm9yIG5vbi1nbGliYyBzeXN0ZW1zCkBAIC0xNiw3ICsxNiw3IEBAIFNpZ25l
ZC1vZmYtYnk6IEFuZHJlYXMgTcO8bGxlciA8c2Nobml0emVsdG9ueUBnbWFpbC5jb20+CiAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvc3JjL3dpZGdldC5j
YyBiL3NyYy93aWRnZXQuY2MKLWluZGV4IGI4ZGFhNWMuLmMzNTc5NjAgMTAwNjQ0CitpbmRleCA2
Njk1NWE2Li5iMzUyYzExIDEwMDY0NAogLS0tIGEvc3JjL3dpZGdldC5jYwogKysrIGIvc3JjL3dp
ZGdldC5jYwogQEAgLTE2LDYgKzE2LDEwIEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC92dGUvdnRlXzAuNzYuMy5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43
OC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L3Z0ZS92dGVfMC43Ni4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUv
dnRlXzAuNzguMC5iYgppbmRleCA1MTVmZjIyOGZkLi44YzkyOTJlOGE3IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlXzAuNzYuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC92dGUvdnRlXzAuNzguMC5iYgpAQCAtMTksNyArMTksNyBAQCBHSURPQ0dFTl9NRVNP
Tl9PUFRJT04gPSAiZG9jcyIKIGluaGVyaXQgZ25vbWViYXNlIGdpLWRvY2dlbiBmZWF0dXJlc19j
aGVjayB1cHN0cmVhbS12ZXJzaW9uLWlzLWV2ZW4gZ29iamVjdC1pbnRyb3NwZWN0aW9uIHN5c3Rl
bWQgdmFsYQogCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1m
b3Itbm9uLWdsaWJjLXN5c3RlbXMucGF0Y2giCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9
ICJmNjc4ZTk0YzA1NmYzNzdmZDAwMjEyMTRhZGZmNTQ1MGNiMTcyZTlhMDhiMTYwOTExMTgxZGRm
ZjdiN2Q1ZDYwIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiMDdmMDljNjIyOGE4YmIz
YzE1OTlkZDBmNWE2ZWM3OTdiMzBkMzAxMGMzYWM5MWNmMjFiNjlkOTYzNWRmYWY3YyIKIAogQU5Z
X09GX0RJU1RST19GRUFUVVJFUyA9ICIke0dUSzNESVNUUk9GRUFUVVJFU30iCiAKLS0gCjIuNDQu
MQoK

--===============4674582422722155836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1872 targets, 51 skipped, 0 masked, 0 errors.
Removing 124 recipes from the core2-64 sysroot...done.
Removing 124 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5212da4f5e92eae6759de00ac4979d05c5d43cda"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 943 Local 928 Mirrors 0 Missed 15 Current 344 (98% match, 98% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 353 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_create_spdx_setscene)
NOTE: Running setscene task 355 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 356 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 358 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.78.bb:do_create_spdx_setscene)
NOTE: Running setscene task 359 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx_setscene)
NOTE: Running setscene task 360 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 361 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 362 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 363 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 364 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 365 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 366 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 367 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_create_spdx_setscene)
NOTE: Running setscene task 368 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 377 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_populate_lic_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.78-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vte-0.78.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 379 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 380 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 381 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.78-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 384 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 385 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 388 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 391 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.10.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 393 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_packagedata_setscene)
NOTE: recipe vte-0.78.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 394 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_create_spdx_setscene)
NOTE: Running setscene task 395 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 396 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 399 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.16.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk4-4.16.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 400 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 403 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 404 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: recipe librsvg-2.58.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 408 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 412 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 414 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 416 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_create_spdx_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 418 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 422 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 424 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk4-4.16.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.54.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 425 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk4-4.16.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 429 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_create_spdx_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 435 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 437 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 441 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe at-spi2-core-2.54.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.54.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnutls-3.8.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vte-0.78.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 565 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_create_spdx_setscene)
NOTE: Running setscene task 566 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 567 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 568 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 569 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb:do_create_spdx_setscene)
NOTE: Running setscene task 573 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 577 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 580 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnutls-3.8.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vte-0.78.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 603 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 604 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 605 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.37-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-9.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 606 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_package_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-9.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 610 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 611 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 614 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 616 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 618 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 620 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 621 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 622 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 627 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 630 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 632 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 634 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 636 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 637 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 642 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 644 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 648 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 650 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 654 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 655 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 660 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 665 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 673 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 677 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 688 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1139 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_fetch)
NOTE: Running setscene task 691 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1152 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_fetch)
NOTE: Running task 1154 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_write_config)
NOTE: Running task 1170 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_write_config)
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.54.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 699 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe gtk4-4.16.1-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe vte-0.78.0-r0: task do_fetch: Started
NOTE: recipe gtk4-4.16.1-r0: task do_write_config: Started
NOTE: recipe vte-0.78.0-r0: task do_write_config: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk4-4.16.1-r0: task do_fetch: Succeeded
NOTE: Running task 1214 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vte-0.78.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 702 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: Running task 1215 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk4-4.16.1-r0: task do_write_config: Succeeded
NOTE: recipe vte-0.78.0-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.16.1-r0: task do_unpack: Started
NOTE: recipe vte-0.78.0-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 706 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vte-0.78.0-r0: task do_unpack: Succeeded
NOTE: Running task 1226 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_patch)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 710 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vte-0.78.0-r0: task do_patch: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 712 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe vte-0.78.0-r0: task do_patch: Succeeded
NOTE: Running task 1232 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe vte-0.78.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 716 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vte-0.78.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_deploy_source_date_epoch unihash changed to 7f2939626f9ec2f5b022467fedfc6cc84b4e63158fbde3f945ed61bfa5c3de8a
NOTE: recipe gtk4-4.16.1-r0: task do_unpack: Succeeded
NOTE: Running task 1242 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_patch)
NOTE: recipe gtk4-4.16.1-r0: task do_patch: Started
NOTE: recipe gtk4-4.16.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 723 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.78.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.78.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 728 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 731 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 732 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 733 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 736 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.78-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 739 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 741 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.78-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 743 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 746 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 747 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 752 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.78.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 757 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 759 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.58.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 761 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bluez5-5.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 762 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 764 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 766 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe curl-8.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.79.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 782 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 783 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 785 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 786 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 788 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 789 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_packagedata_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 790 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 793 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.40-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 794 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 797 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.40-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 800 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 801 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 804 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 811 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 812 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 815 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 818 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 819 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 820 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 823 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 825 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-9.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 828 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 829 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-9.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 830 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 832 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 833 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 836 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 839 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.79.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 841 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 845 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 847 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 848 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-9.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 849 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 853 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-9.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 854 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 856 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 858 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 860 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 861 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 863 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 864 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 865 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 866 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 868 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-9.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 869 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.37-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 870 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 873 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-9.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 875 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 880 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 881 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 884 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 885 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 887 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 888 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 890 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 892 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/gstreamer1.0/1.24.6/temp/log.do_packagedata_setscene.3351884
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 893 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 894 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 895 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 897 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 899 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 900 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 902 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 904 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 905 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 907 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 909 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 910 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 912 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 913 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 919 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 920 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 921 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 922 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 924 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 926 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 928 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 930 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_package_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 931 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 933 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 935 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 937 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 938 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 940 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 942 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 943 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 945 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 946 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_package_setscene: Started
NOTE: Running setscene task 949 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 951 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 953 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 954 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.44-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 956 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 958 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 959 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 960 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 961 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 963 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 964 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 965 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 968 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 969 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 972 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 973 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 975 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 977 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 978 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 981 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 983 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 985 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 987 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 988 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 990 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 991 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 992 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 993 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/fribidi/1.0.15/temp/log.do_packagedata_setscene.3353478
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 994 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_package_setscene)
NOTE: Running setscene task 997 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 998 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1000 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1003 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1004 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1005 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1007 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1008 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1009 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_package_setscene: Started
NOTE: Running setscene task 1011 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1012 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1013 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1014 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1017 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1019 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1020 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1022 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1023 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1024 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1025 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1028 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_recipe_qa_setscene)
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1030 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1031 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1032 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1035 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1037 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1039 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1041 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1042 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1047 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1049 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1050 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1051 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1052 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.15-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1054 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1056 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1058 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1060 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1062 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1063 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1065 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1067 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1069 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1071 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iso-codes-4.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1079 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1080 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 1081 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1083 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1084 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1086 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1088 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1090 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1597 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_fetch)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1092 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1093 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1094 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1096 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1098 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1099 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_fetch: Started
NOTE: Running setscene task 1101 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1102 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1105 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_fetch: Succeeded
NOTE: Running task 1639 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_unpack: Started
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1111 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1113 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1114 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1115 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1116 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1117 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1119 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1122 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1125 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1126 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1127 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1128 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1129 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1130 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1132 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1137 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1139 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1140 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1142 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1144 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1146 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1147 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1150 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1151 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1152 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1153 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1154 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1155 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1156 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1158 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1159 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1160 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1161 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1162 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1163 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1164 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1165 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1166 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1168 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1171 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1173 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1175 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1178 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1184 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1185 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1186 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1187 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1189 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1190 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1191 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1192 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1193 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1194 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1195 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1202 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1204 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1205 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1207 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1209 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1210 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1212 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1214 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1216 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1217 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1219 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1221 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1223 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1225 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1227 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1229 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1232 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1234 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1235 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1237 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1238 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1243 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1245 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1247 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1249 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1250 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1252 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1254 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1256 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1257 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1259 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1260 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1261 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1262 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1264 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1268 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1269 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1271 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1276 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1278 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1279 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1283 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1284 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1286 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3073 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_packagedata)
NOTE: Running task 3250 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_packagedata)
NOTE: Running task 3278 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.16.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3482 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3483 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_create_spdx)
NOTE: recipe gtk4-4.16.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_create_spdx: Started
NOTE: Running task 3484 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_configure)
NOTE: recipe gtk4-4.16.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3485 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.16.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.16.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.16.1-r0: task do_configure: Succeeded
NOTE: Running task 3486 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_compile)
NOTE: recipe gtk4-4.16.1-r0: task do_compile: Started
NOTE: recipe gtk4-4.16.1-r0: task do_compile: Succeeded
NOTE: Running task 3487 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_install)
NOTE: recipe gtk4-4.16.1-r0: task do_install: Started
NOTE: recipe gtk4-4.16.1-r0: task do_install: Succeeded
NOTE: Running task 3488 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_package)
NOTE: Running task 3489 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.16.1-r0: task do_package: Started
NOTE: recipe gtk4-4.16.1-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.16.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3490 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.78.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.78.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3491 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_configure)
NOTE: recipe vte-0.78.0-r0: task do_configure: Started
NOTE: recipe vte-0.78.0-r0: task do_configure: Succeeded
NOTE: Running task 3492 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_compile)
NOTE: recipe vte-0.78.0-r0: task do_compile: Started
NOTE: recipe gtk4-4.16.1-r0: task do_package: Succeeded
NOTE: Running task 3493 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_packagedata)
NOTE: recipe gtk4-4.16.1-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.16.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_packagedata unihash changed to 77d595e939fd2e803551f004efe46edce2157e83f24a45ae3b3867e1a34b7cce
NOTE: Setscene tasks completed
NOTE: Running task 3494 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_create_spdx)
NOTE: recipe gtk4-4.16.1-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.16.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3495 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_collect_spdx_deps)
NOTE: recipe vte-0.78.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vte-0.78.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vte-0.78.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3496 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_install)
NOTE: recipe vte-0.78.0-r0: task do_install: Started
NOTE: recipe vte-0.78.0-r0: task do_install: Succeeded
NOTE: Running task 3497 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_package)
NOTE: Running task 3498 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_populate_sysroot)
NOTE: recipe vte-0.78.0-r0: task do_package: Started
NOTE: recipe vte-0.78.0-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.78.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.78.0-r0: task do_package: Succeeded
NOTE: Running task 3499 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_packagedata)
NOTE: recipe vte-0.78.0-r0: task do_packagedata: Started
NOTE: recipe vte-0.78.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_packagedata unihash changed to 2a096914be5428a776e41b7558ba769a0bee633fcb8d96ca3158131a6b62af87
NOTE: Setscene tasks completed
NOTE: Running task 3500 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_create_spdx)
NOTE: Running task 3501 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_package_write_ipk)
NOTE: Running task 3502 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_package_write_deb)
NOTE: Running task 3503 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_package_write_rpm)
NOTE: recipe vte-0.78.0-r0: task do_create_spdx: Started
NOTE: Running task 3504 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_package_qa)
NOTE: recipe vte-0.78.0-r0: task do_package_write_ipk: Started
NOTE: recipe vte-0.78.0-r0: task do_package_write_deb: Started
NOTE: recipe vte-0.78.0-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.78.0-r0: task do_package_qa: Started
NOTE: recipe vte-0.78.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3505 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_create_package_spdx)
NOTE: recipe vte-0.78.0-r0: task do_create_package_spdx: Started
NOTE: recipe vte-0.78.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_package_qa unihash changed to 791e45f1e924fa387043346f969a81136b8854252c0e9fbc546193a4b353977e
NOTE: recipe vte-0.78.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_package_write_ipk unihash changed to cfb18aa6995b7b62dcec7390c4e2094c147dbb51eb7691ee5babbcb3e3c0fb28
NOTE: recipe vte-0.78.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe vte-0.78.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_package_write_deb unihash changed to 119f0ecb759ee9f8cef002c95ad1375d108b6a00d0506651ea5c9be7969b3c5f
NOTE: recipe vte-0.78.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_package_write_rpm unihash changed to 08ed6c2de49df440a2a4004d98714a98b85d947aec3b6acdc2afed6e69a5b630
NOTE: Running noexec task 3506 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_build)
NOTE: Tasks Summary: Attempted 3506 tasks of which 3467 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 62 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-src went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-dbg went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-ptest went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-staticdev went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-dev went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-doc went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-af went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ast went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-az went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-be went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-bg went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ca went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-cs went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-da went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-de went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-el went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-en-gb went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-eo went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-es went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-eu went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-fi went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-fr went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-fur went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-gl went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-hr went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-hu went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-id went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-it went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ja went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ka went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ko went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-lt went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-lv went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-nb went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-nl went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-pl went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-pt-br went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ro went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ru went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-rw went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-sk went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-sl went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-sq went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-sr went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-sv went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-tr went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-uk went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-vi went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-zh-cn went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-zh-tw went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-bash-completion went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: fribidi-1.0.15-r0 do_packagedata_setscene: QA Issue: Package version for package fribidi-src went backwards which would break package feeds (from 0:1.0.16-r0 to 0:1.0.15-r0) [version-going-backwards]
ERROR: fribidi-1.0.15-r0 do_packagedata_setscene: QA Issue: Package version for package fribidi-dbg went backwards which would break package feeds (from 0:1.0.16-r0 to 0:1.0.15-r0) [version-going-backwards]
ERROR: fribidi-1.0.15-r0 do_packagedata_setscene: QA Issue: Package version for package fribidi-staticdev went backwards which would break package feeds (from 0:1.0.16-r0 to 0:1.0.15-r0) [version-going-backwards]
ERROR: fribidi-1.0.15-r0 do_packagedata_setscene: QA Issue: Package version for package fribidi-dev went backwards which would break package feeds (from 0:1.0.16-r0 to 0:1.0.15-r0) [version-going-backwards]
ERROR: fribidi-1.0.15-r0 do_packagedata_setscene: QA Issue: Package version for package fribidi-doc went backwards which would break package feeds (from 0:1.0.16-r0 to 0:1.0.15-r0) [version-going-backwards]
ERROR: fribidi-1.0.15-r0 do_packagedata_setscene: QA Issue: Package version for package fribidi-locale went backwards which would break package feeds (from 0:1.0.16-r0 to 0:1.0.15-r0) [version-going-backwards]
ERROR: fribidi-1.0.15-r0 do_packagedata_setscene: QA Issue: Package version for package fribidi-bin went backwards which would break package feeds (from 0:1.0.16-r0 to 0:1.0.15-r0) [version-going-backwards]
ERROR: fribidi-1.0.15-r0 do_packagedata_setscene: QA Issue: Package version for package fribidi went backwards which would break package feeds (from 0:1.0.16-r0 to 0:1.0.15-r0) [version-going-backwards]
ERROR: fribidi-1.0.15-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4674582422722155836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/vte: PACKAGES: added "vte-locale-kab"
packages/core2-64-poky-linux/vte/libvte-gtk4: PKGSIZE changed from 658072 to 818224 (+24%)
packages/core2-64-poky-linux/vte/libvte-gtk4: RDEPENDS: added "graphene (['>= 1.10.8'])"
packages/core2-64-poky-linux/vte/libvte: PKGSIZE changed from 667859 to 815691 (+22%)
packages/core2-64-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.7600.3", added "/usr/lib/libvte-2.91.so.0.7800.0"
Changes to packages/core2-64-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.7600.3 to libvte-2.91.so.0.7800.0
  /usr/lib/libvte-2.91.so.0.7600.3 moved to /usr/lib/libvte-2.91.so.0.7800.0
  /usr/include/vte-2.91-gtk4/vte/vteuuid.h was added
  /usr/include/vte-2.91/vte/vteuuid.h was added
packages/core2-64-poky-linux/vte/vte-dbg: RRECOMMENDS: added "graphene-dbg"
packages/core2-64-poky-linux/vte/vte-dbg: PKGSIZE changed from 15395208 to 20938432 (+36%)
packages/core2-64-poky-linux/vte/vte-dev: PKGSIZE changed from 455903 to 573026 (+26%)
packages/core2-64-poky-linux/vte/vte-dev: FILELIST: added "/usr/include/vte-2.91/vte/vteuuid.h"
packages/core2-64-poky-linux/vte/vte-gtk4-dev: PKGSIZE changed from 434673 to 551863 (+27%)
packages/core2-64-poky-linux/vte/vte-gtk4-dev: FILELIST: added "/usr/include/vte-2.91-gtk4/vte/vteuuid.h"
packages/core2-64-poky-linux/vte/vte-locale-hi: PKGSIZE changed from 2790 to 1655 (-41%)
packages/core2-64-poky-linux/vte/vte-locale-th: PKGSIZE changed from 2888 to 1638 (-43%)
packages/core2-64-poky-linux/vte/vte-src: PKGSIZE changed from 2863626 to 3299862 (+15%)

--===============4674582422722155836==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vte-upgrade-0.76.3-0.78.0.patch"

RnJvbSBhMGExMDVlMDc2NTE1ODI4ZTg5YzA3NWIzYTYzYjY1ZjYxNjU5ZjQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDY6Mzk6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dGU6IHVwZ3JhZGUgMC43Ni4zIC0+IDAuNzguMAoKLS0tCiAuLi4vdnRlLzAwMDEtQWRkLVdfRVhJ
VENPREUtbWFjcm8tZm9yLW5vbi1nbGliYy1zeXN0ZW1zLnBhdGNoIHwgNCArKy0tCiBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC92dGUve3Z0ZV8wLjc2LjMuYmIgPT4gdnRlXzAuNzguMC5iYn0gICAgIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3t2dGVfMC43Ni4zLmJiID0+IHZ0ZV8wLjc4
LjAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8w
MDAxLUFkZC1XX0VYSVRDT0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1mb3It
bm9uLWdsaWJjLXN5c3RlbXMucGF0Y2gKaW5kZXggZTJjZmY2Y2Y3Ni4uNDNjNDdlZTE5OCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDAxLUFkZC1XX0VYSVRDT0RF
LW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC92dGUvdnRlLzAwMDEtQWRkLVdfRVhJVENPREUtbWFjcm8tZm9yLW5vbi1nbGliYy1zeXN0
ZW1zLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiODc5NWRkYTYyOTYxNGNkODQyZmNiYTFj
NGI1MGJlNzU5YzIwZGE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlOWRkYzhlYzdi
MGY1ZGY4NGQ1MGVmYjhmM2Q2OWQ3YTEyOWI2YTY3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogRGFuaWxvIFNwaW5lbGxhIDxkYW55c3Bpbjk3QHByb3Rvbm1haWwuY29tPgogRGF0ZTog
VGh1LCAyMSBNYXIgMjAxOSAxNDoxOToyNiArMDEwMAogU3ViamVjdDogW1BBVENIXSBBZGQgV19F
WElUQ09ERSBtYWNybyBmb3Igbm9uLWdsaWJjIHN5c3RlbXMKQEAgLTE2LDcgKzE2LDcgQEAgU2ln
bmVkLW9mZi1ieTogQW5kcmVhcyBNw7xsbGVyIDxzY2huaXR6ZWx0b255QGdtYWlsLmNvbT4KICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9zcmMvd2lkZ2V0
LmNjIGIvc3JjL3dpZGdldC5jYwotaW5kZXggYjhkYWE1Yy4uYzM1Nzk2MCAxMDA2NDQKK2luZGV4
IDY2OTU1YTYuLmIzNTJjMTEgMTAwNjQ0CiAtLS0gYS9zcmMvd2lkZ2V0LmNjCiArKysgYi9zcmMv
d2lkZ2V0LmNjCiBAQCAtMTYsNiArMTYsMTAgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L3Z0ZS92dGVfMC43Ni4zLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8w
Ljc4LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvdnRlL3Z0ZV8wLjc2LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0
ZS92dGVfMC43OC4wLmJiCmluZGV4IDUxNWZmMjI4ZmQuLjhjOTI5MmU4YTcgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43Ni4zLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L3Z0ZS92dGVfMC43OC4wLmJiCkBAIC0xOSw3ICsxOSw3IEBAIEdJRE9DR0VOX01F
U09OX09QVElPTiA9ICJkb2NzIgogaW5oZXJpdCBnbm9tZWJhc2UgZ2ktZG9jZ2VuIGZlYXR1cmVz
X2NoZWNrIHVwc3RyZWFtLXZlcnNpb24taXMtZXZlbiBnb2JqZWN0LWludHJvc3BlY3Rpb24gc3lz
dGVtZCB2YWxhCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLUFkZC1XX0VYSVRDT0RFLW1hY3Jv
LWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCIKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1d
ID0gImY2NzhlOTRjMDU2ZjM3N2ZkMDAyMTIxNGFkZmY1NDUwY2IxNzJlOWEwOGIxNjA5MTExODFk
ZGZmN2I3ZDVkNjAiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICIwN2YwOWM2MjI4YThi
YjNjMTU5OWRkMGY1YTZlYzc5N2IzMGQzMDEwYzNhYzkxY2YyMWI2OWQ5NjM1ZGZhZjdjIgogCiBB
TllfT0ZfRElTVFJPX0ZFQVRVUkVTID0gIiR7R1RLM0RJU1RST0ZFQVRVUkVTfSIKIAotLSAKMi40
NC4xCgo=

--===============4674582422722155836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vte: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte: SRC_URI changed from "https://download.gnome.org/sources//vte/0.76/vte-0.76.3.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch" to "https://download.gnome.org/sources//vte/0.78/vte-0.78.0.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
packages/core2-64-poky-linux/vte: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte: PACKAGES: added "vte-locale-kab"
packages/core2-64-poky-linux/vte/libvte-gtk4: PKGSIZE changed from 658072 to 818224 (+24%)
packages/core2-64-poky-linux/vte/libvte-gtk4: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/libvte-gtk4: RDEPENDS: added "graphene (['>= 1.10.8'])"
packages/core2-64-poky-linux/vte/libvte-gtk4: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/libvte: PKGSIZE changed from 667859 to 815691 (+22%)
packages/core2-64-poky-linux/vte/libvte: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.7600.3", added "/usr/lib/libvte-2.91.so.0.7800.0"
packages/core2-64-poky-linux/vte/libvte: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
Changes to packages/core2-64-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.7600.3 to libvte-2.91.so.0.7800.0
  /usr/lib/libvte-2.91.so.0.7600.3 moved to /usr/lib/libvte-2.91.so.0.7800.0
  /usr/include/vte-2.91-gtk4/vte/vteuuid.h was added
  /usr/include/vte-2.91/vte/vteuuid.h was added
packages/core2-64-poky-linux/vte/vte-dbg: PKGSIZE changed from 15395208 to 20938432 (+36%)
packages/core2-64-poky-linux/vte/vte-dbg: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-dbg: RRECOMMENDS: added "graphene-dbg"
packages/core2-64-poky-linux/vte/vte-dbg: FILELIST: removed "/usr/lib/.debug/libvte-2.91.so.0.7600.3", added "/usr/lib/.debug/libvte-2.91.so.0.7800.0"
packages/core2-64-poky-linux/vte/vte-dbg: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-dev: PKGSIZE changed from 455903 to 573026 (+26%)
packages/core2-64-poky-linux/vte/vte-dev: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-dev: FILELIST: added "/usr/include/vte-2.91/vte/vteuuid.h"
packages/core2-64-poky-linux/vte/vte-dev: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-doc: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-doc: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-gtk4-dev: PKGSIZE changed from 434673 to 551863 (+27%)
packages/core2-64-poky-linux/vte/vte-gtk4-dev: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-gtk4-dev: FILELIST: added "/usr/include/vte-2.91-gtk4/vte/vteuuid.h"
packages/core2-64-poky-linux/vte/vte-gtk4-dev: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-gtk4: PKGSIZE changed from 109400 to 113504 (+4%)
packages/core2-64-poky-linux/vte/vte-gtk4: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-gtk4: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ab: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ab: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-am: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-am: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-an: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-an: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ang: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ang: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ar: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ar: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-as: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-as: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ast: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ast: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-az: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-az: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-be+latin: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-be+latin: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-be: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-be: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-bg: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-bg: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-bn-in: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-bn-in: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-bn: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-bn: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-bs: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-bs: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ca+valencia: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ca+valencia: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ca: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ca: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ckb: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ckb: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-cs: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-cs: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-cy: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-cy: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-da: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-da: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-de: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-de: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-dz: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-dz: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-el: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-el: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-en+shaw: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-en+shaw: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-en-ca: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-en-ca: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-en-gb: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-en-gb: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-eo: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-eo: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-es: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-es: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-et: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-et: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-eu: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-eu: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-fa: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-fa: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-fi: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-fi: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-fr: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-fr: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-fur: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-fur: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ga: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ga: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-gd: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-gd: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-gl: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-gl: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-gu: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-gu: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-he: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-he: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-hi: PKGSIZE changed from 2790 to 1655 (-41%)
packages/core2-64-poky-linux/vte/vte-locale-hi: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-hi: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-hr: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-hr: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-hu: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-hu: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-id: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-id: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-is: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-is: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-it: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-it: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ja: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ja: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ka: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ka: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-kk: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-kk: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-kn: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-kn: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ko: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ko: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ku: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ku: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ky: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ky: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-li: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-li: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-lt: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-lt: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-lv: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-lv: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-mai: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-mai: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-mi: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-mi: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-mjw: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-mjw: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-mk: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-mk: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ml: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ml: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-mn: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-mn: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-mr: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-mr: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ms: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ms: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-nb: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-nb: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-nds: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-nds: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ne: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ne: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-nl: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-nl: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-nn: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-nn: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-oc: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-oc: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-or: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-or: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-pa: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-pa: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-pl: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-pl: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-pt-br: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-pt-br: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-pt: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-pt: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ro: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ro: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ru: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ru: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-rw: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-rw: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-si: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-si: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-sk: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-sk: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-sl: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-sl: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-sq: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-sq: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-sr+latin: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-sr+latin: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-sr: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-sr: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-sv: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-sv: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ta: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ta: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-te: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-te: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-tg: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-tg: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-th: PKGSIZE changed from 2888 to 1638 (-43%)
packages/core2-64-poky-linux/vte/vte-locale-th: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-th: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-tr: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-tr: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ug: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ug: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-uk: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-uk: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-uz+cyrillic: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-uz+cyrillic: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-vi: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-vi: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-wa: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-wa: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-xh: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-xh: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-zh-cn: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-zh-cn: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-zh-hk: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-zh-hk: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-zh-tw: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-zh-tw: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-prompt: PKGSIZE changed from 19564 to 20409 (+4%)
packages/core2-64-poky-linux/vte/vte-prompt: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-prompt: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-src: PKGSIZE changed from 2863626 to 3299862 (+15%)
packages/core2-64-poky-linux/vte/vte-src: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-src: FILELIST: directory renamed /usr/src/debug/vte/0.76.3/src/app -> /usr/src/debug/vte/0.78.0/src/app, removed "/usr/src/debug/vte/0.76.3/src/fonts-pangocairo.cc /usr/src/debug/vte/0.76.3/src/vteresources-gtk4.cc.c /usr/src/debug/vte/0.76.3/src/fonts-pangocairo.hh /usr/src/debug/vte/0.76.3/src/drawing-cairo.hh /usr/src/debug/vte/0.76.3/src/minifont.hh /usr/src/debug/vte/0.76.3/src/ringview.hh /usr/src/debug/vte/0.76.3/src/ringview.cc /usr/src/debug/vte/0.76.3/src/minifont.cc /usr/src/debug/vte/0.76.3/src/ring.hh /usr/src/debug/vte/0.76.3/src/debug.cc /usr/src/debug/vte/0.76.3/src/vte/vtetypebuiltins-gtk3.cc /usr/src/debug/vte/0.76.3/src/vte/vtetypebuiltins-gtk4.cc /usr/src/debug/vte/0.76.3/src/cxx-utils.hh /usr/src/debug/vte/0.76.3/src/icu-converter.cc /usr/src/debug/vte/0.76.3/src/pty.hh /usr/src/debug/vte/0.76.3/src/reaper.cc /usr/src/debug/vte/0.76.3/src/modes.hh /usr/src/debug/vte/0.76.3/src/keymap.h /usr/src/debug/vte/0.76.3/src/pastify.cc 
 /usr/src/debug/vte/0.76.3/src/drawing-cairo.cc /usr/src/debug/vte/0.76.3/src/parser-csi.hh /usr/src/debug/vte/0.76.3/src/parser-dcs.hh /usr/src/debug/vte/0.76.3/src/parser-esc.hh /usr/src/debug/vte/0.76.3/src/parser-arg.hh /usr/src/debug/vte/0.76.3/src/pcre2-glue.hh /usr/src/debug/vte/0.76.3/src/parser-cmd.hh /usr/src/debug/vte/0.76.3/src/parser-string.hh /usr/src/debug/vte/0.76.3/src/icu-decoder.hh /usr/src/debug/vte/0.76.3/src/color-triple.hh /usr/src/debug/vte/0.76.3/src/missing.cc /usr/src/debug/vte/0.76.3/src/spawn.hh /usr/src/debug/vte/0.76.3/src/cell.hh /usr/src/debug/vte/0.76.3/src/vtegtk.hh /usr/src/debug/vte/0.76.3/src/parser-reply.hh /usr/src/debug/vte/0.76.3/src/debug.h /usr/src/debug/vte/0.76.3/src/vterowdata.hh /usr/src/debug/vte/0.76.3/src/vteresources.c /usr/src/debug/vte/0.76.3/src/scheduler.h /usr/src/debug/vte/0.76.3/src/vte/vteglobals.h /usr/src/debug/vte/0.76.3/src/utf8.cc /usr/src/debug/vte/0.76.3/src/modes-dec.hh /usr/src/debug/vte/0.76.3/src/modes-ecma.hh /us
 r/src/debug/vte/0.76.3/src/vtestream-file.h /usr/src/debug/vte/0.76.3/src/drawing-gsk.cc /usr/src/debug/vte/0.76.3/src/vtetypes.hh /usr/src/debug/vte/0.76.3/src/regex.hh /usr/src/debug/vte/0.76.3/src/vteinternal.hh /usr/src/debug/vte/0.76.3/src/vteregex.cc /usr/src/debug/vte/0.76.3/src/vtetypes.cc /usr/src/debug/vte/0.76.3/src/graphene-glue.hh /usr/src/debug/vte/0.76.3/src/pango-glue.hh /usr/src/debug/vte/0.76.3/src/refptr.hh /usr/src/debug/vte/0.76.3/src/vtegtk.cc /usr/src/debug/vte/0.76.3/src/vte/vtedeprecated.h /usr/src/debug/vte/0.76.3/src/bidi.cc /usr/src/debug/vte/0.76.3/src/vte/vteregex.h /usr/src/debug/vte/0.76.3/src/vtepty.cc /usr/src/debug/vte/0.76.3/src/vte/vtetypebuiltins-gtk4.h /usr/src/debug/vte/0.76.3/src/vte/vteenums.h /usr/src/debug/vte/0.76.3/src/box-drawing.hh /usr/src/debug/vte/0.76.3/src/pastify.hh /usr/src/debug/vte/0.76.3/src/regex.cc /usr/src/debug/vte/0.76.3/src/clipboard-gtk.cc /usr/src/debug/vte/0.76.3/src/vte/vtetypebuiltins-gtk3.h /usr/src/debug/vte/0.76
 .3/src/drawing-gsk.hh /usr/src/debug/vte/0.76.3/src/tabstops.hh /usr/src/debug/vte/0.76.3/src/glib-glue.cc /usr/src/debug/vte/0.76.3/src/vte/vtepty.h /usr/src/debug/vte/0.76.3/src/clipboard-gtk.hh /usr/src/debug/vte/0.76.3/src/systemd.cc /usr/src/debug/vte/0.76.3/src/gdkarrayimpl.c /usr/src/debug/vte/0.76.3/src/marshal.c /usr/src/debug/vte/0.76.3/src/marshal.h /usr/src/debug/vte/0.76.3/src/spawn.cc /usr/src/debug/vte/0.76.3/src/libc-glue.hh /usr/src/debug/vte/0.76.3/src/vteregexinternal.hh /usr/src/debug/vte/0.76.3/src/icu-converter.hh /usr/src/debug/vte/0.76.3/src/gtk-glue.hh /usr/src/debug/vte/0.76.3/src/parser.cc /usr/src/debug/vte/0.76.3/src/ring.cc /usr/src/debug/vte/0.76.3/src/vteptyinternal.hh /usr/src/debug/vte/0.76.3/src/parser.hh /usr/src/debug/vte/0.76.3/src/parser-charset-tables.hh /usr/src/debug/vte/0.76.3/src/parser-cmd-handlers.hh /usr/src/debug/vte/0.76.3/src/std-glue.hh /usr/src/debug/vte/0.76.3/src/systemd.hh /usr/src/debug/vte/0.76.3/src/urlencode.cc /usr/src/debu
 g/vte/0.76.3/src/vteaccess.cc /usr/src/debug/vte/0.76.3/src/vteunistr.cc /usr/src/debug/vte/0.76.3/src/utf8.hh /usr/src/debug/vte/0.76.3/src/buffer.h /usr/src/debug/vte/0.76.3/src/attr.hh /usr/src/debug/vte/0.76.3/src/chunk.cc /usr/src/debug/vte/0.76.3/src/scheduler.cc /usr/src/debug/vte/0.76.3/src/keymap.cc /usr/src/debug/vte/0.76.3/src/vtestream-base.h /usr/src/debug/vte/0.76.3/src/vteseq.cc /usr/src/debug/vte/0.76.3/src/widget.cc /usr/src/debug/vte/0.76.3/src/drawing-context.cc /usr/src/debug/vte/0.76.3/src/reaper.hh /usr/src/debug/vte/0.76.3/src/bidi.hh /usr/src/debug/vte/0.76.3/src/vte/vteterminal.h /usr/src/debug/vte/0.76.3/src/pty.cc /usr/src/debug/vte/0.76.3/src/vteutils.h /usr/src/debug/vte/0.76.3/src/vterowdata.cc /usr/src/debug/vte/0.76.3/src/glib-glue.hh /usr/src/debug/vte/0.76.3/src/vtestream.h /usr/src/debug/vte/0.76.3/src/vteunistr.h /usr/src/debug/vte/0.76.3/src/drawing-context.hh /usr/src/debug/vte/0.76.3/src/unicode-width.hh /usr/src/debug/vte/0.76.3/src/vte-glue.h
 h /usr/src/debug/vte/0.76.3/src/parser-glue.hh /usr/src/debug/vte/0.76.3/src/vteaccess.h /usr/src/debug/vte/0.76.3/src/vtespawn.cc /usr/src/debug/vte/0.76.3/src/vtespawn.hh /usr/src/debug/vte/0.76.3/src/gobject-glue.hh /usr/src/debug/vte/0.76.3/src/fwd.hh /usr/src/debug/vte/0.76.3/src/vte.cc /usr/src/debug/vte/0.76.3/src/vteutils.cc /usr/src/debug/vte/0.76.3/src/chunk.hh /usr/src/debug/vte/0.76.3/src/missing.hh /usr/src/debug/vte/0.76.3/src/icu-decoder.cc /usr/src/debug/vte/0.76.3/src/cairo-glue.hh /usr/src/debug/vte/0.76.3/src/icu-glue.hh /usr/src/debug/vte/0.76.3/src/widget.hh /usr/src/debug/vte/0.76.3/src/icu-glue.cc", added "/usr/src/debug/vte/0.78.0/src/vteregexinternal.hh /usr/src/debug/vte/0.78.0/src/refptr.hh /usr/src/debug/vte/0.78.0/src/parser-cmd-handlers.hh /usr/src/debug/vte/0.78.0/src/modes-ecma.hh /usr/src/debug/vte/0.78.0/src/ring.hh /usr/src/debug/vte/0.78.0/src/icu-converter.hh /usr/src/debug/vte/0.78.0/src/icu-decoder.hh /usr/src/debug/vte/0.78.0/src/parser-string
 .hh /usr/src/debug/vte/0.78.0/src/glib-glue.hh /usr/src/debug/vte/0.78.0/src/parser.hh /usr/src/debug/vte/0.78.0/src/vteptyinternal.hh /usr/src/debug/vte/0.78.0/src/scheduler.h /usr/src/debug/vte/0.78.0/src/vteuuidinternal.hh /usr/src/debug/vte/0.78.0/src/vte/vteenums.h /usr/src/debug/vte/0.78.0/src/vteinternal.hh /usr/src/debug/vte/0.78.0/src/marshal.c /usr/src/debug/vte/0.78.0/src/vterowdata.cc /usr/src/debug/vte/0.78.0/src/vte.cc /usr/src/debug/vte/0.78.0/src/sgr.hh /usr/src/debug/vte/0.78.0/src/marshal.h /usr/src/debug/vte/0.78.0/src/vteuuid.cc /usr/src/debug/vte/0.78.0/src/vteregex.cc /usr/src/debug/vte/0.78.0/src/widget.hh /usr/src/debug/vte/0.78.0/src/uuid.hh /usr/src/debug/vte/0.78.0/src/drawing-context.hh /usr/src/debug/vte/0.78.0/src/vterowdata.hh /usr/src/debug/vte/0.78.0/src/vteaccess-gtk4.cc /usr/src/debug/vte/0.78.0/src/drawing-cairo.cc /usr/src/debug/vte/0.78.0/src/chunk.cc /usr/src/debug/vte/0.78.0/src/gtk-glue.hh /usr/src/debug/vte/0.78.0/src/uuid.cc /usr/src/debug/
 vte/0.78.0/src/vtepty.cc /usr/src/debug/vte/0.78.0/src/pty.hh /usr/src/debug/vte/0.78.0/src/parser.cc /usr/src/debug/vte/0.78.0/src/rect.hh /usr/src/debug/vte/0.78.0/src/utf8.cc /usr/src/debug/vte/0.78.0/src/termprops.hh /usr/src/debug/vte/0.78.0/src/vte/vteregex.h /usr/src/debug/vte/0.78.0/src/minifont-coverage.inc /usr/src/debug/vte/0.78.0/src/unicode-width.hh /usr/src/debug/vte/0.78.0/src/buffer.h /usr/src/debug/vte/0.78.0/src/drawing-cairo.hh /usr/src/debug/vte/0.78.0/src/vte/vtedeprecated.h /usr/src/debug/vte/0.78.0/src/missing.hh /usr/src/debug/vte/0.78.0/src/widget.cc /usr/src/debug/vte/0.78.0/src/vteutils.h /usr/src/debug/vte/0.78.0/src/cairo-glue.hh /usr/src/debug/vte/0.78.0/src/spawn.hh /usr/src/debug/vte/0.78.0/src/tabstops.hh /usr/src/debug/vte/0.78.0/src/reaper.cc /usr/src/debug/vte/0.78.0/src/utf8.hh /usr/src/debug/vte/0.78.0/src/icu-glue.cc /usr/src/debug/vte/0.78.0/src/glib-glue.cc /usr/src/debug/vte/0.78.0/src/icu-glue.hh /usr/src/debug/vte/0.78.0/src/libc-glue.hh /
 usr/src/debug/vte/0.78.0/src/drawing-gsk.hh /usr/src/debug/vte/0.78.0/src/spawn.cc /usr/src/debug/vte/0.78.0/src/parser-glue.hh /usr/src/debug/vte/0.78.0/src/missing.cc /usr/src/debug/vte/0.78.0/src/osc-colors.cc /usr/src/debug/vte/0.78.0/src/gdkarrayimpl.c /usr/src/debug/vte/0.78.0/src/ring.cc /usr/src/debug/vte/0.78.0/src/urlencode.cc /usr/src/debug/vte/0.78.0/src/vteutils.cc /usr/src/debug/vte/0.78.0/src/box-drawing.hh /usr/src/debug/vte/0.78.0/src/vtespawn.cc /usr/src/debug/vte/0.78.0/src/drawing-context.cc /usr/src/debug/vte/0.78.0/src/debug.h /usr/src/debug/vte/0.78.0/src/vte-glue.hh /usr/src/debug/vte/0.78.0/src/vteunistr.h /usr/src/debug/vte/0.78.0/src/vteaccess.h /usr/src/debug/vte/0.78.0/src/vtespawn.hh /usr/src/debug/vte/0.78.0/src/vtestream.h /usr/src/debug/vte/0.78.0/src/vte/vtetypebuiltins-gtk4.h /usr/src/debug/vte/0.78.0/src/reaper.hh /usr/src/debug/vte/0.78.0/src/bidi.hh /usr/src/debug/vte/0.78.0/src/keymap.cc /usr/src/debug/vte/0.78.0/src/vtestream-base.h /usr/src/d
 ebug/vte/0.78.0/src/vte/vtepty.h /usr/src/debug/vte/0.78.0/src/systemd.cc /usr/src/debug/vte/0.78.0/src/cxx-utils.hh /usr/src/debug/vte/0.78.0/src/fwd.hh /usr/src/debug/vte/0.78.0/src/parser-charset-tables.hh /usr/src/debug/vte/0.78.0/src/color-parser.cc /usr/src/debug/vte/0.78.0/src/vtegtk.cc /usr/src/debug/vte/0.78.0/src/regex.cc /usr/src/debug/vte/0.78.0/src/vte/vteuuid.h /usr/src/debug/vte/0.78.0/src/icu-decoder.cc /usr/src/debug/vte/0.78.0/src/parser-arg.hh /usr/src/debug/vte/0.78.0/src/chunk.hh /usr/src/debug/vte/0.78.0/src/parser-cmd.hh /usr/src/debug/vte/0.78.0/src/parser-csi.hh /usr/src/debug/vte/0.78.0/src/parser-dcs.hh /usr/src/debug/vte/0.78.0/src/parser-esc.hh /usr/src/debug/vte/0.78.0/src/pcre2-glue.hh /usr/src/debug/vte/0.78.0/src/vteaccess-gtk4.h /usr/src/debug/vte/0.78.0/src/std-glue.hh /usr/src/debug/vte/0.78.0/src/clipboard-gtk.hh /usr/src/debug/vte/0.78.0/src/vtegtk.hh /usr/src/debug/vte/0.78.0/src/debug.cc /usr/src/debug/vte/0.78.0/src/color-palette.hh /usr/src/
 debug/vte/0.78.0/src/color-parser.hh /usr/src/debug/vte/0.78.0/src/systemd.hh /usr/src/debug/vte/0.78.0/src/scheduler.cc /usr/src/debug/vte/0.78.0/src/vteresources.c /usr/src/debug/vte/0.78.0/src/keymap.h /usr/src/debug/vte/0.78.0/src/attr.hh /usr/src/debug/vte/0.78.0/src/pastify.cc /usr/src/debug/vte/0.78.0/src/vteresources-gtk4.cc.c /usr/src/debug/vte/0.78.0/src/color-names.hh /usr/src/debug/vte/0.78.0/src/vteseq.cc /usr/src/debug/vte/0.78.0/src/cell.hh /usr/src/debug/vte/0.78.0/src/drawing-gsk.cc /usr/src/debug/vte/0.78.0/src/clipboard-gtk.cc /usr/src/debug/vte/0.78.0/src/icu-converter.cc /usr/src/debug/vte/0.78.0/src/color.hh /usr/src/debug/vte/0.78.0/src/pango-glue.hh /usr/src/debug/vte/0.78.0/src/graphene-glue.hh /usr/src/debug/vte/0.78.0/src/minifont.cc /usr/src/debug/vte/0.78.0/src/ringview.cc /usr/src/debug/vte/0.78.0/src/minifont.hh /usr/src/debug/vte/0.78.0/src/ringview.hh /usr/src/debug/vte/0.78.0/src/pastify.hh /usr/src/debug/vte/0.78.0/src/osc-colors.hh /usr/src/debug/
 vte/0.78.0/src/pty.cc /usr/src/debug/vte/0.78.0/src/modes-dec.hh /usr/src/debug/vte/0.78.0/src/gobject-glue.hh /usr/src/debug/vte/0.78.0/src/vte/vteterminal.h /usr/src/debug/vte/0.78.0/src/bidi.cc /usr/src/debug/vte/0.78.0/src/color-triple.hh /usr/src/debug/vte/0.78.0/src/parser-reply.hh /usr/src/debug/vte/0.78.0/src/vte/vteglobals.h /usr/src/debug/vte/0.78.0/src/fonts-pangocairo.cc /usr/src/debug/vte/0.78.0/src/modes.hh /usr/src/debug/vte/0.78.0/src/vtestream-file.h /usr/src/debug/vte/0.78.0/src/vte/vtetypebuiltins-gtk3.h /usr/src/debug/vte/0.78.0/src/fonts-pangocairo.hh /usr/src/debug/vte/0.78.0/src/vte/vtetypebuiltins-gtk3.cc /usr/src/debug/vte/0.78.0/src/vte/vtetypebuiltins-gtk4.cc /usr/src/debug/vte/0.78.0/src/vteaccess.cc /usr/src/debug/vte/0.78.0/src/regex.hh /usr/src/debug/vte/0.78.0/src/vtetypes.cc /usr/src/debug/vte/0.78.0/src/vteunistr.cc /usr/src/debug/vte/0.78.0/src/vtetypes.hh"
packages/core2-64-poky-linux/vte/vte-src: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-staticdev: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-staticdev: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte: PKGSIZE changed from 117770 to 121874 (+3%)
packages/core2-64-poky-linux/vte/vte: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte: PKGV changed from 0.76.3 [default] to 0.78.0 [default]

--===============4674582422722155836==--

