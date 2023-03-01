Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1421C83004
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:18 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.24044.1677681915411426749
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JgdzR7yk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101869da2723a-29650770-997c-4a14-a892-cef7f1698be9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=N+nPmnv1E34hLwXXHpBw6zlBPzT6r/RZ2YxVZiCWj7k=;
	b=JgdzR7yktXHmULnYe1p0p/PTO82IKS9p1TGqBY+Z1WHBqdB9QH+EmRvwh62YIkcD
	glsQkIdxW/tEjtNnYe1WHnL2mx1lcX15pEhYyBLRGRyMFYk+yuHAe/WnNeCtQQB/nmZ
	wkUhUMj9ph+8GhIbOx/4iioAIlpxqPh0R9pc1cY8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=N+nPmnv1E34hLwXXHpBw6zlBPzT6r/RZ2YxVZiCWj7k=;
	b=PHE75rQB/ODRGeDy6E5FblROdSJPF4NtcsmnPgQzMIKNrXUQtJYxuv2NYzxdkqmK
	bn4STWoFpg2ldQ7/qvvqdTBZQ8FurJNhIGyZz/7Ga4hhqGP8/PjgSS+J4Kl2YSdJwDi
	fJ9cQjjULgUf/4DYCxMXua+BTdi0qdvPzxxqbhms=
Content-Type: multipart/mixed; boundary="===============8549610888862158657=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 43.1 FAILED
Message-ID: <010101869da2723a-29650770-997c-4a14-a892-cef7f1698be9-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177924

--===============8549610888862158657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *epiphany* to *43.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-43.0-43.1.patch
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
--===============8549610888862158657==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-43.0-43.1.patch"

RnJvbSAxNWUyMmE2ZTVlMjNmNzNmNTU1MGMxMjE2MDUzNDFiYmQ2OWM3NDdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAxMjoxMTo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVw
aXBoYW55OiB1cGdyYWRlIDQzLjAgLT4gNDMuMQoKLS0tCiAuLi4vZXBpcGhhbnkve2VwaXBoYW55
XzQzLjAuYmIgPT4gZXBpcGhhbnlfNDMuMS5iYn0gICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZ25vbWUvZXBpcGhhbnkve2VwaXBoYW55XzQzLjAuYmIgPT4gZXBpcGhhbnlfNDMuMS5iYn0g
KDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlf
NDMuMC5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80My4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFu
eS9lcGlwaGFueV80My4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkv
ZXBpcGhhbnlfNDMuMS5iYgppbmRleCA0YTYwMDdiMGRmLi5lYTIyNzIzYTk3IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDMuMC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDMuMS5iYgpAQCAtMzEsNyArMzEsNyBA
QCBTUkNfVVJJID0gIiR7R05PTUVfTUlSUk9SfS8ke0dOT01FQk59LyR7QG9lLnV0aWxzLnRyaW1f
dmVyc2lvbigiJHtQVn0iLCAxKX0vJHtHTgogICAgICAgICAgICBmaWxlOi8vbWlncmF0b3IucGF0
Y2ggXAogICAgICAgICAgICBmaWxlOi8vZGlzdHJpYnV0b3IucGF0Y2ggXAogICAgICAgICAgICAi
Ci1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJiNjZkNDk5ZjllZTcyNjk2ZDgzY2Y4NDQx
MjUzNzcxODFhOTU0NTU0YTRiYjM3ODViNzMyOTMzODBhYzBjMjI3IgorU1JDX1VSSVthcmNoaXZl
LnNoYTI1NnN1bV0gPSAiZTg2ZWFkMjdjYjk5ODI4MTUxNTA2NjRkZTNiZjIwZmFmMzc1Zjc3Yjgw
NjViMDJiMzExODBjNjViNmJiZWJiNCIKIAogIyBEZXZlbG9wZXIgbW9kZSBlbmFibGVzIGRlYnVn
Z2luZwogUEFDS0FHRUNPTkZJR1tkZXZlbG9wZXItbW9kZV0gPSAiLURkZXZlbG9wZXJfbW9kZT10
cnVlLC1EZGV2ZWxvcGVyX21vZGU9ZmFsc2UiCi0tIAoyLjM5LjIKCg==

--===============8549610888862158657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1698 targets, 49 skipped, 0 masked, 0 errors.
Removing 146 recipes from the core2-32 sysroot...done.
Removing 150 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-a568266e4af66211826cd60fea2c794c921ff74c"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a568266e4af66211826cd60fea2c794c921ff74c"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 627 Local 270 Mirrors 0 Missed 357 Current 325 (43% match, 62% complete)
Removing 1 stale sstate objects for arch qemux86...done.
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 326 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 335 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 401 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 618 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 635 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 644 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 651 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 656 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 673 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-7.88.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.88.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 713 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 714 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 722 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-7.88.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 736 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 738 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-7.88.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 752 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 756 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 760 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 762 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.67-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 771 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 787 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.67-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 713 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_fetch)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 748 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_write_config)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 749 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: Running task 750 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 751 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_fetch)
NOTE: Running task 752 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_fetch)
NOTE: Running task 754 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_fetch)
NOTE: Running task 756 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 757 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: Running task 762 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_fetch)
NOTE: Running setscene task 799 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 800 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 767 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 769 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_fetch)
NOTE: Running task 779 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_fetch)
NOTE: Running task 780 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: Running task 781 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_fetch)
NOTE: Running task 782 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: Running task 783 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: Running task 784 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: Running task 799 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_fetch)
NOTE: Running task 804 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 811 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 805 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 806 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 809 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 811 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 859 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_fetch)
NOTE: Running task 861 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 864 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_fetch)
NOTE: Running task 865 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 878 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.1.bb:do_fetch)
NOTE: Running task 879 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_fetch)
NOTE: Running task 880 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_fetch)
NOTE: Running task 881 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_fetch)
NOTE: Running task 882 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 892 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: Running task 902 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_write_config)
NOTE: Running task 941 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_write_config)
NOTE: Running task 948 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.39-r0: task do_fetch: Started
NOTE: recipe freetype-2.13.0-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: Running setscene task 813 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.39-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_fetch: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: Running task 975 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: recipe fontconfig-2.14.2-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 815 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 817 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 818 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 819 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 820 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata_setscene)
NOTE: Running task 976 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_unpack)
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_fetch: Started
NOTE: Running task 977 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_fetch: Started
NOTE: Running task 978 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: Running task 979 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_unpack)
NOTE: Running task 980 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: Running task 981 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: Running task 982 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_unpack)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 983 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: Running task 984 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_unpack)
NOTE: Running task 985 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: Running task 986 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_unpack)
NOTE: Running task 987 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: Running task 988 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: Running task 989 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: Running task 990 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_fetch: Started
NOTE: recipe harfbuzz-7.0.1-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Started
NOTE: recipe pango-1.50.12-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Started
NOTE: Running setscene task 821 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 822 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 824 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe dbus-1.14.6-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe harfbuzz-7.0.1-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Succeeded
NOTE: Running setscene task 825 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 826 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 828 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 995 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 996 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_unpack)
NOTE: Running task 997 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_unpack)
NOTE: Running task 998 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_unpack)
NOTE: Running task 999 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_write_config: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.39-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: Running setscene task 829 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_package_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_write_config: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_write_config: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_unpack: Succeeded
NOTE: Running setscene task 844 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 845 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 852 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 853 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 854 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 1039 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_patch)
NOTE: Running task 1046 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: Running task 1047 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: Running task 1050 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_patch)
NOTE: Running task 1051 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_unpack)
NOTE: Running task 1052 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_patch)
NOTE: Running task 1054 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: Running task 1055 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: Running task 1056 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_patch)
NOTE: Running task 1057 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: Running task 1058 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_patch)
NOTE: Running task 1059 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: Running task 1060 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_patch)
NOTE: Running task 1061 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: Running task 1062 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: Running task 1063 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: Running task 1064 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: Running task 1065 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_patch)
NOTE: Running task 1066 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1067 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_patch)
NOTE: Running task 1068 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.1.bb:do_unpack)
NOTE: Running task 1069 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_unpack)
NOTE: Running task 1070 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_unpack)
NOTE: Running task 1071 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_unpack)
NOTE: Running task 1072 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1073 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1094 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_unpack: Started
NOTE: recipe wayland-1.21.0-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe libpng-1.6.39-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: Running task 1124 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.1.bb:do_write_config)
NOTE: Running task 1125 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_write_config)
NOTE: recipe freetype-2.13.0-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 1131 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_write_config)
NOTE: Running task 1132 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1133 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: Running task 1136 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_fetch)
NOTE: Running task 1152 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: Running task 1174 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_fetch)
NOTE: Running task 1175 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1196 of 3331 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.1.bb:do_rust_gen_targets)
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: Running task 1197 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.39-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_patch: Started
NOTE: Running task 1202 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_fetch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe dbus-1.14.6-r0: task do_patch: Started
NOTE: recipe harfbuzz-7.0.1-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Started
NOTE: Running task 1234 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1238 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1243 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 1244 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1245 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1249 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_write_config)
NOTE: Running task 1250 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_fetch)
NOTE: Running task 1253 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_fetch)
NOTE: Running task 1254 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_fetch)
NOTE: Running task 1256 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_fetch)
NOTE: Running task 1261 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1262 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_fetch)
NOTE: recipe libdrm-2.4.115-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Started
NOTE: Running task 1263 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.12-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: recipe vala-0.56.4-r0: task do_fetch: Started
NOTE: Running task 1264 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_deploy_source_date_epoch)
NOTE: Running task 1265 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1266 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_fetch)
NOTE: recipe harfbuzz-7.0.1-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Started
NOTE: Running task 1267 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1268 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe vala-0.56.4-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: Running task 1281 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 1296 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: Running task 1297 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_unpack)
NOTE: Running task 1298 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1300 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_fetch)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1309 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_unpack)
NOTE: Running task 1310 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 1319 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe rust-native-1.67.1-r0: task do_rust_gen_targets: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Started
NOTE: recipe libucontext-1.2-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe bluez5-5.66-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1325 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_patch)
NOTE: Running task 1326 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_fetch: Started
NOTE: Running task 1327 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_patch)
NOTE: Running task 1328 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 1329 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1339 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: recipe harfbuzz-7.0.1-r0: task do_write_config: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_fetch: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: Running task 1340 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_unpack)
NOTE: Running task 1341 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe rust-native-1.67.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: Running task 1343 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_unpack)
NOTE: Running task 1350 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_unpack)
NOTE: Running task 1351 of 3331 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.67.1.bb:do_rust_gen_targets)
NOTE: Running task 1354 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_write_config)
NOTE: Running task 1360 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running task 1361 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_fetch)
NOTE: Running task 1380 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: recipe fontconfig-2.14.2-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Started
NOTE: Running task 1381 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1382 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1383 of 3331 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.1.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1384 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1385 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 1386 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: recipe vala-0.56.4-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.6-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.21.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: Running task 1387 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_generate_toolchain_file)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: Running task 1388 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_patch)
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Succeeded
NOTE: Running task 1390 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1391 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.38-r0: task do_write_config: Started
NOTE: Running task 1392 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: Running task 1393 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe bluez5-5.66-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_unpack: Started
NOTE: Running task 1394 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1395 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_write_config)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: Running task 1396 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: Running task 1397 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cargo-native-1.67.1-r0: task do_rust_gen_targets: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1398 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe rust-native-1.67.1-r0: task do_compile: Started
NOTE: Running task 1399 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_generate_toolchain_file)
NOTE: Running task 1400 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1401 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1402 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1403 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Succeeded
NOTE: recipe cargo-native-1.67.1-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 1404 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1405 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1406 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_write_config: Succeeded
NOTE: Running task 1420 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_write_config)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Started
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: Running task 1433 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: Running task 1441 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: Running task 1442 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_unpack: Succeeded
NOTE: Running task 1443 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1444 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: Running task 1451 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 1460 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1468 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 1469 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_patch)
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 1471 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1473 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_patch)
NOTE: Running task 1474 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.33-r0: task do_fetch: Started
NOTE: Running task 1475 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 1476 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1485 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_fetch)
NOTE: Running task 1486 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_fetch)
NOTE: recipe libpng-1.6.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 1487 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_patch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_fetch: Succeeded
NOTE: Running task 1492 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: recipe libucontext-1.2-r0: task do_write_config: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: Running task 1494 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Started
NOTE: Running task 1495 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_patch)
NOTE: Running task 1496 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: Running task 1497 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: Running task 1498 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_unpack)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: Running task 1505 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 1506 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_unpack)
NOTE: Running task 1507 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: Running task 1508 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: Running task 1509 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libwpe-1.14.1-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1510 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_patch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: recipe pango-1.50.12-r0: task do_patch: Started
NOTE: Running task 1511 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 1512 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe libwpe-1.14.1-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: Running task 1513 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: Running task 1514 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: Running task 1515 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: recipe libucontext-1.2-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_unpack: Started
NOTE: Running task 1516 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1517 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_unpack)
NOTE: Running task 1518 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1527 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_write_config)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Started
NOTE: Running task 1557 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: Running task 1559 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: Running task 1560 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Started
NOTE: recipe bluez5-5.66-r0: task do_unpack: Succeeded
NOTE: Running task 1561 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: Running task 1562 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1563 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1564 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1565 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_patch)
NOTE: Running task 1566 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 1567 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_write_config)
NOTE: recipe vala-0.56.4-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: Running task 1568 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 1569 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_unpack)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1570 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1571 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_patch)
NOTE: Running task 1572 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1573 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: Running task 1574 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_fetch)
NOTE: Running task 1586 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Running task 1592 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.14.1-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: Running task 1593 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: Running task 1594 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_deploy_source_date_epoch)
NOTE: Running task 1595 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: Running task 1596 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 1597 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_fetch)
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Started
NOTE: Running task 1598 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_patch)
NOTE: Running task 1599 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_patch)
NOTE: Running task 1600 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.66-r0: task do_patch: Started
NOTE: Running task 1601 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: Running task 1602 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 1603 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_fetch)
NOTE: Running task 1604 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: recipe vala-0.56.4-r0: task do_patch: Started
NOTE: recipe orc-0.4.33-r0: task do_write_config: Started
NOTE: Running task 1605 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1638 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Started
NOTE: Running task 1639 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_unpack)
NOTE: Running task 1640 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_fetch: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Started
NOTE: Running task 1641 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1642 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe pango-1.50.12-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1643 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1644 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: recipe libwpe-1.14.1-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_patch: Started
NOTE: Running task 1645 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: Running task 1646 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1647 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: Running task 1648 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_patch)
NOTE: Running task 1649 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe vala-0.56.4-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Started
NOTE: Running task 1650 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_generate_toolchain_file)
NOTE: recipe orc-0.4.33-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: Running task 1651 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1652 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1653 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_unpack)
NOTE: Running task 1656 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_fetch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1658 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_fetch)
NOTE: Running task 1659 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_fetch)
NOTE: Running task 1660 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_patch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: Running task 1661 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1662 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_fetch)
NOTE: Running task 1663 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_fetch)
NOTE: Running task 1664 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_fetch)
NOTE: recipe libucontext-1.2-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: Running task 1665 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1666 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.14.1-r0: task do_patch: Started
NOTE: Running task 1667 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 1674 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1675 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: Running task 1676 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 1677 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe mesa-2_22.3.5-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_fetch: Started
NOTE: recipe libsoup-3.2.2-r0: task do_unpack: Started
NOTE: Running task 1678 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: recipe libwpe-1.14.1-r0: task do_patch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1679 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: Running task 1681 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.37-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Started
NOTE: Running task 1683 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_unpack)
NOTE: Running task 1684 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Succeeded
NOTE: Running task 1685 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_patch)
NOTE: Running task 1686 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_unpack)
NOTE: recipe p11-kit-0.24.1-r0: task do_fetch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1687 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_patch)
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1688 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1689 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1690 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 1701 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_deploy_source_date_epoch)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: Running task 1702 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 1703 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 1705 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1706 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_write_config)
NOTE: Running task 1709 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_fetch)
NOTE: Running task 1710 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_fetch)
NOTE: Running task 1725 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_generate_toolchain_file)
NOTE: Running task 1726 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1732 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 1742 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_unpack)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Started
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Started
NOTE: Running task 1743 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 1744 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_unpack)
NOTE: Running task 1745 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_unpack)
NOTE: Running task 1746 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1747 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: Running task 1748 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1749 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_unpack)
NOTE: Running task 1750 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_unpack)
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1751 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1752 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_patch)
NOTE: recipe libsoup-3.2.2-r0: task do_unpack: Succeeded
NOTE: recipe webkitgtk-2.38.5-r0: task do_fetch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: Running task 1753 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: Running task 1754 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_fetch: Succeeded
NOTE: recipe libwpe-1.14.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: Running task 1755 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_unpack)
NOTE: recipe libwpe-1.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_unpack: Started
NOTE: Running task 1756 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1759 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr3_3.41.1.bb:do_fetch)
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1760 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_fetch)
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_unpack: Started
NOTE: Running task 1761 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-7.0.1-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1762 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe p11-kit-0.24.1-r0: task do_unpack: Started
NOTE: Running task 1763 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1764 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.1.bb:do_patch)
NOTE: Running task 1765 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_patch)
NOTE: Running task 1766 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.6.bb:do_fetch)
NOTE: Running task 1767 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_fetch)
NOTE: Running task 1768 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Started
NOTE: Running task 1769 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.2.2-r0: task do_patch: Started
NOTE: recipe libwpe-1.14.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1790 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 1798 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1799 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 1800 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: Running task 1802 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_unpack)
NOTE: Running task 1804 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_write_config)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1805 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1835 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1836 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_patch: Started
NOTE: Running task 1837 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_write_config)
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Started
NOTE: recipe gcr3-3.41.1-r0: task do_fetch: Started
NOTE: Running task 1838 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_patch)
NOTE: recipe libsoup-3.2.2-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-7.0.1-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_unpack: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Started
NOTE: Running task 1862 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_generate_toolchain_file)
NOTE: Running task 1863 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gcr3-3.41.1-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libportal-0.6-r0: task do_fetch: Started
NOTE: Running task 1864 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_write_config: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1865 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 1881 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr3_3.41.1.bb:do_unpack)
NOTE: Running task 1882 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_unpack)
NOTE: recipe libhandy-1.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 1884 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1892 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.1.bb:do_fetch)
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1893 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1894 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1903 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_write_config)
NOTE: Running task 1904 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-7.0.1-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Started
NOTE: Running task 1905 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_unpack)
NOTE: Running task 1906 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_patch)
NOTE: Running task 1907 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_write_config)
NOTE: Running task 1908 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_write_config)
NOTE: Running task 1909 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_write_config)
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1910 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1911 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_patch)
NOTE: recipe libwpe-1.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Started
NOTE: recipe libsoup-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libportal-0.6-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_write_config: Succeeded
NOTE: Running task 1912 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_write_config)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 1913 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Succeeded
NOTE: recipe gcr3-3.41.1-r0: task do_unpack: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Started
NOTE: Running task 1914 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.6.bb:do_unpack)
NOTE: Running task 1915 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1922 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_write_config)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-43.1-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1923 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxslt-1.1.37-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-43.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 1949 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_patch)
NOTE: Running task 1967 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr3_3.41.1.bb:do_write_config)
NOTE: Running task 1968 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Started
NOTE: Running task 1969 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Started
NOTE: recipe harfbuzz-7.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1970 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.6.bb:do_write_config)
NOTE: Running task 1971 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_write_config)
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_unpack: Succeeded
NOTE: Running task 1972 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_patch)
NOTE: Running task 1973 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_patch)
NOTE: Running task 1974 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_write_config: Started
NOTE: Running task 1990 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.1.bb:do_write_config)
NOTE: Running task 1994 of 3331 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: Running task 1996 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe bluez5-5.66-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_write_config: Started
NOTE: recipe libportal-0.6-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_patch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_write_config: Started
NOTE: Running task 2020 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Succeeded
NOTE: Running task 2021 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_patch)
NOTE: Running task 2022 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libhandy-1.8.1-r0: task do_write_config: Started
NOTE: Running task 2023 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2024 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-43.1-r0: task do_unpack: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_write_config: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_patch: Succeeded
NOTE: recipe epiphany-43.1-r0: task do_write_config: Started
NOTE: Running task 2025 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2026 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxslt-1.1.37-r0: task do_patch: Started
NOTE: recipe libportal-0.6-r0: task do_write_config: Started
NOTE: recipe libsoup-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcr3-3.41.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: Running task 2027 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_patch: Succeeded
NOTE: Running task 2028 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_patch)
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcr3-3.41.1-r0: task do_unpack: Succeeded
NOTE: Running task 2029 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_deploy_source_date_epoch)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_write_config: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_write_config: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_write_config: Succeeded
NOTE: Running task 2030 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_patch)
NOTE: Running task 2031 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr3_3.41.1.bb:do_patch)
NOTE: recipe libportal-0.6-r0: task do_write_config: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-43.1-r0: task do_write_config: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_patch: Started
NOTE: recipe harfbuzz-7.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.37-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr3-3.41.1-r0: task do_write_config: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2032 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2033 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-native-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_patch: Started
NOTE: Running task 2034 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2035 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2036 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Started
NOTE: recipe libucontext-1.2-r0: task do_patch: Succeeded
NOTE: recipe gcr3-3.41.1-r0: task do_patch: Started
NOTE: recipe librsvg-native-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_patch: Succeeded
NOTE: Running task 2037 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2038 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: Running task 2039 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2040 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2041 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_deploy_source_date_epoch)
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Succeeded
NOTE: Running task 2042 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_22.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-43.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr3-3.41.1-r0: task do_patch: Succeeded
NOTE: Running task 2043 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.1.bb:do_patch)
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2044 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr3_3.41.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libhandy-1.8.1-r0: task do_unpack: Succeeded
NOTE: recipe libportal-0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2045 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_patch)
NOTE: Running task 2046 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.6.bb:do_patch)
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-43.1-r0: task do_patch: Started
NOTE: recipe gcr3-3.41.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 2047 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libportal-0.6-r0: task do_patch: Started
NOTE: recipe libhandy-1.8.1-r0: task do_patch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libportal-0.6-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2048 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libhandy-1.8.1-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 2049 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2050 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe gcr3-3.41.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libportal-0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-43.1-r0: task do_patch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2051 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2052 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.1.bb:do_populate_lic)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-43.1-r0: task do_populate_lic: Started
NOTE: recipe epiphany-43.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package_setscene: Succeeded
NOTE: Running task 2053 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: Running setscene task 867 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 868 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 869 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 870 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 871 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 872 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 873 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libportal-0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe epiphany-43.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.1.bb:do_populate_lic unihash changed to d8ad5a4a8e74d8ac4fc138be2dd24b4268304b19689b69a3bc3e38e92e64a204
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe epiphany-43.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 876 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: Running task 2068 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2069 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.8.3-r0: task do_unpack: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: Running task 2070 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_patch)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_patch: Succeeded
NOTE: Running task 2075 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2076 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gtk4-4.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running setscene task 883 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 884 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 885 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 886 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 888 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 890 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 891 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 893 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 10bb837f9be944a042a4976b2679f37e5098b65a05b35e8bee72a997cbf5fff5
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 901 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 903 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 907 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 908 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 909 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 910 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe webkitgtk-2.38.5-r0: task do_unpack: Succeeded
NOTE: Running task 2105 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_patch)
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_patch: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe webkitgtk-2.38.5-r0: task do_patch: Succeeded
NOTE: Running task 2110 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_generate_toolchain_file)
NOTE: Running task 2111 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_deploy_source_date_epoch)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 915 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 916 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 917 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe webkitgtk-2.38.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe rust-native-1.67.1-r0: task do_compile: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: Running task 2116 of 3331 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.1.bb:do_install)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe webkitgtk-2.38.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 920 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rust-native-1.67.1-r0: task do_install: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 923 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 925 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 927 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 929 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 930 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 933 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 934 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 935 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 938 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 939 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 946 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 949 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 950 of 952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2419 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2422 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2429 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2432 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2435 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2438 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2445 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2470 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2472 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2476 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2493 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2506 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2507 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2510 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2559 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2560 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2565 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2575 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2576 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2588 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2594 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2608 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2621 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2624 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2626 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2627 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2629 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2633 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpng-1.6.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2634 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_configure)
NOTE: Running task 2635 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2644 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2645 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2685 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2689 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_configure)
NOTE: Running task 2690 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_configure)
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2691 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: Running task 2692 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_configure)
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2693 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libpng-1.6.39-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2694 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Started
NOTE: Running task 2695 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_configure)
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ea966ecbf6aefa0dc1a4c5d4d0a88cedc818a0eb7c8fdd30980d0615db84acfb
NOTE: Running task 2696 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: Running task 2697 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_configure)
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Started
NOTE: Running task 2698 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 2705 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_configure)
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Started
NOTE: Running task 2706 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_configure: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Started
NOTE: Running task 2707 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: recipe wayland-1.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2708 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: Running task 2709 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_configure)
NOTE: Running task 2710 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_configure)
NOTE: recipe xkeyboard-config-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2711 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_configure)
NOTE: Running task 2712 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_configure)
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2713 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure: Started
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2714 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_configure)
NOTE: Running task 2715 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2716 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_configure)
NOTE: recipe libxslt-1.1.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_configure: Started
NOTE: recipe libucontext-1.2-r0: task do_configure: Started
NOTE: Running task 2717 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_configure)
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2718 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: Running task 2719 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_configure)
NOTE: Running task 2720 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2721 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe vala-0.56.4-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: Running task 2722 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: Running task 2723 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_configure: Started
NOTE: Running task 2724 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe orc-0.4.33-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: Running task 2725 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_configure: Succeeded
NOTE: Running task 2726 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 2727 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure)
NOTE: Running task 2728 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_compile: Succeeded
NOTE: Running task 2729 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_install)
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe dbus-1.14.6-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_install: Succeeded
NOTE: Running task 2730 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot)
NOTE: Running task 2731 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2732 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_configure: Succeeded
NOTE: Running task 2733 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_compile)
NOTE: recipe xkeyboard-config-2.38-r0: task do_compile: Started
NOTE: recipe libucontext-1.2-r0: task do_configure: Succeeded
NOTE: Running task 2734 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_compile)
NOTE: recipe libucontext-1.2-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 2735 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: Running task 2736 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_compile)
NOTE: Running task 2737 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Started
NOTE: recipe orc-0.4.33-r0: task do_configure: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_compile: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: Running task 2738 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_compile)
NOTE: Running task 2739 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_install)
NOTE: recipe xkeyboard-config-2.38-r0: task do_compile: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_compile: Started
NOTE: Running task 2740 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_install)
NOTE: recipe libucontext-1.2-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_install: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 2741 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_configure_ptest_base)
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Succeeded
NOTE: Running task 2742 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: Running task 2743 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: Running task 2744 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Started
NOTE: recipe libucontext-1.2-r0: task do_install: Succeeded
NOTE: Running task 2745 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_compile)
NOTE: Running task 2746 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_patch)
NOTE: Running task 2747 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot)
NOTE: Running task 2748 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_package)
NOTE: recipe wayland-1.21.0-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_patch: Started
NOTE: recipe libucontext-1.2-r0: task do_package: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_install: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package: Succeeded
NOTE: Running task 2749 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot)
NOTE: Running task 2750 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package)
NOTE: Running task 2751 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2752 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2753 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2754 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_compile_ptest_base)
NOTE: recipe libstd-rs-1.67.1-r0: task do_patch: Succeeded
NOTE: Running task 2755 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2756 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_rust_gen_targets)
NOTE: recipe wayland-1.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-1.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_gen_targets: Started
NOTE: Running task 2757 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_install)
NOTE: Running task 2758 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_install: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: Running task 2759 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 2760 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_package)
NOTE: recipe libstd-rs-1.67.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Started
NOTE: recipe orc-0.4.33-r0: task do_compile: Succeeded
NOTE: Running task 2761 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2762 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_install)
NOTE: recipe orc-0.4.33-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_install: Started
NOTE: recipe wayland-1.21.0-r0: task do_install: Succeeded
NOTE: Running task 2763 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_install_ptest_base)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2764 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 2765 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe libucontext-1.2-r0: task do_package: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_install_ptest_base: Started
NOTE: Running task 2766 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_install: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: Running task 2767 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot)
NOTE: Running task 2768 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_package)
NOTE: recipe libucontext-1.2-r0: task do_packagedata: Started
NOTE: recipe wayland-1.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot: Started
NOTE: Running task 2769 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_package: Started
NOTE: Running task 2770 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package)
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 2771 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe orc-0.4.33-r0: task do_install: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2772 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: Running task 2773 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_package)
NOTE: recipe libucontext-1.2-r0: task do_packagedata: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_package: Started
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2774 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2775 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2776 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2777 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe tiff-4.5.0-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2778 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 2779 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata)
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Succeeded
NOTE: Running task 2780 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_compile)
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 2781 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe orc-0.4.33-r0: task do_package: Succeeded
NOTE: Running task 2782 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_package: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Started
NOTE: Running task 2783 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2784 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: Running task 2785 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_package: Succeeded
NOTE: Running task 2786 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata)
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Succeeded
NOTE: Running task 2787 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_install)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2788 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_compile)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Started
NOTE: recipe wayland-1.21.0-r0: task do_package: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_compile: Started
NOTE: Running task 2789 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Succeeded
NOTE: Running task 2790 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_populate_sysroot)
NOTE: Running task 2791 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_package)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2792 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Succeeded
NOTE: Running task 2793 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_compile: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Succeeded
NOTE: Running task 2794 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_install)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2795 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_install)
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2796 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: Running task 2797 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe libpng-1.6.39-r0: task do_configure: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Succeeded
NOTE: Running task 2798 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 2799 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot)
NOTE: Running task 2800 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_package)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_install: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_compile: Started
NOTE: Running task 2801 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot)
NOTE: Running task 2802 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_compile: Succeeded
NOTE: Running task 2803 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: Running task 2804 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_install)
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_install: Started
NOTE: Running task 2805 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_packagedata)
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_install: Succeeded
NOTE: Running task 2806 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot)
NOTE: Running task 2807 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_package)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_package: Started
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Succeeded
NOTE: Running task 2808 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_compile)
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2809 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunwind-1.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Succeeded
NOTE: Running task 2810 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: Running task 2811 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_compile)
NOTE: recipe libunwind-1.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Succeeded
NOTE: Running task 2812 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Started
NOTE: Running task 2813 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata)
NOTE: recipe libunwind-1.6.2-r0: task do_configure: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Succeeded
NOTE: Running task 2814 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_install)
NOTE: recipe libpciaccess-0.17-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2815 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2816 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2817 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_compile)
NOTE: Running task 2818 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2819 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2820 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_compile)
NOTE: Running task 2821 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: Running task 2822 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_install)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Started
NOTE: Running task 2823 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata: Started
NOTE: recipe libpciaccess-0.17-r0: task do_install: Succeeded
NOTE: Running task 2824 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot)
NOTE: Running task 2825 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_package)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_package: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Started
NOTE: Running task 2826 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata)
NOTE: recipe libpciaccess-0.17-r0: task do_package: Started
NOTE: recipe libpng-1.6.39-r0: task do_compile: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata: Started
NOTE: Running task 2827 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_install)
NOTE: recipe libpng-1.6.39-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2828 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2829 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Started
NOTE: Running task 2830 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot)
NOTE: Running task 2831 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_package)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2832 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: Running task 2833 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe libdrm-2.4.115-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: Running task 2834 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: Running task 2835 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_compile)
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: recipe aspell-0.60.8-r0: task do_compile: Started
NOTE: recipe libxslt-1.1.37-r0: task do_configure: Succeeded
NOTE: Running task 2836 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_compile)
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_install: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2837 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot)
NOTE: Running task 2838 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_package)
NOTE: Running task 2839 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_configure)
NOTE: Running task 2840 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot)
NOTE: recipe vala-0.56.4-r0: task do_configure: Succeeded
NOTE: Running task 2841 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_package)
NOTE: Running task 2842 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_compile)
NOTE: Running task 2843 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.39-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2844 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 2845 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: Running task 2846 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2847 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libdrm-2.4.115-r0: task do_configure: Started
NOTE: recipe vala-0.56.4-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2848 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2849 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2850 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2851 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2852 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2853 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2854 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.13.0-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2855 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2856 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: Running task 2857 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 2858 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libpciaccess-0.17-r0: task do_package: Succeeded
NOTE: Running task 2859 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2860 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata)
NOTE: Running task 2861 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Succeeded
NOTE: Running task 2862 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2863 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2864 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2865 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: Running task 2866 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2867 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libpng-1.6.39-r0: task do_package: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: Running task 2868 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata: Started
NOTE: Running task 2869 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.115-r0: task do_configure: Succeeded
NOTE: Running task 2870 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_compile)
NOTE: recipe libdrm-2.4.115-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2871 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2872 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: Running task 2873 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_compile: Succeeded
NOTE: Running task 2874 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: Running task 2875 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_install)
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe aspell-0.60.8-r0: task do_install: Started
NOTE: recipe libxslt-1.1.37-r0: task do_compile: Succeeded
NOTE: Running task 2876 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_install)
NOTE: recipe libxslt-1.1.37-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Succeeded
NOTE: Running task 2877 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot)
NOTE: Running task 2878 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package)
NOTE: recipe libdrm-2.4.115-r0: task do_compile: Succeeded
NOTE: Running task 2879 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2880 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_install)
NOTE: recipe libdrm-2.4.115-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2881 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.115-r0: task do_install: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 2882 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot)
NOTE: Running task 2883 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_package)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.115-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2884 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2885 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2886 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2887 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2888 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2889 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2890 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2891 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_package)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2892 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: Running task 2893 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2894 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2895 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: Running task 2896 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_configure: Started
NOTE: Running task 2897 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure)
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: Running task 2898 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2899 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2900 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2901 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2902 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2903 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2904 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2905 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2906 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_configure)
NOTE: Running task 2907 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_configure)
NOTE: Running task 2908 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: Running task 2909 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: Running task 2910 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe aspell-0.60.8-r0: task do_install: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: Running task 2911 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_populate_sysroot)
NOTE: Running task 2912 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_package)
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_package: Started
NOTE: recipe libxslt-1.1.37-r0: task do_install: Succeeded
NOTE: Running task 2913 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_populate_sysroot)
NOTE: Running task 2914 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_package)
NOTE: recipe libxslt-1.1.37-r0: task do_populate_sysroot: Started
NOTE: recipe libxslt-1.1.37-r0: task do_package: Started
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2915 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe enchant2-2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.37-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_configure: Succeeded
NOTE: Running task 2916 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe enchant2-2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2917 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_compile)
NOTE: Running task 2918 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 2919 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe enchant2-2.3.3-r0: task do_configure: Started
NOTE: Running task 2920 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2921 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2922 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: Running task 2923 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_compile)
NOTE: recipe tiff-4.5.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: Running task 2924 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_install)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2925 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_install)
NOTE: recipe libpsl-0.21.2-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 2926 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe libdrm-2.4.115-r0: task do_package: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2927 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata)
NOTE: Running task 2928 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_compile: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: Running task 2929 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_install: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 2930 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: Running task 2931 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2932 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_install: Succeeded
NOTE: Running task 2933 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_package)
NOTE: Running task 2934 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_install: Succeeded
NOTE: Running task 2935 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot)
NOTE: Running task 2936 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_package)
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_package: Started
NOTE: recipe libxslt-1.1.37-r0: task do_package: Succeeded
NOTE: Running task 2937 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_packagedata)
NOTE: recipe libxslt-1.1.37-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2938 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxslt-1.1.37-r0: task do_packagedata: Succeeded
NOTE: Running task 2939 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libsoup-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: Running task 2940 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2941 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2942 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_configure)
NOTE: recipe freetype-2.13.0-r0: task do_configure: Succeeded
NOTE: Running task 2943 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_compile)
NOTE: recipe libsoup-3.2.2-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2944 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2945 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Succeeded
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: Running task 2946 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure_ptest_base)
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2947 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2948 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 2949 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Started
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_package: Succeeded
NOTE: Running task 2950 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_packagedata)
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 2951 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe aspell-0.60.8-r0: task do_package: Succeeded
NOTE: Running task 2952 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_packagedata)
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Started
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 2953 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2954 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Succeeded
NOTE: Running task 2955 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: Running task 2956 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_populate_sysroot)
NOTE: Running task 2957 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_package)
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 2958 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2959 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: Running task 2960 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package: Succeeded
NOTE: Running task 2961 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2962 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: Running task 2963 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: Running task 2964 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 2965 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe freetype-2.13.0-r0: task do_compile: Succeeded
NOTE: Running task 2966 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe freetype-2.13.0-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 2967 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2968 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe libunwind-1.6.2-r0: task do_configure: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_package: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Succeeded
NOTE: Running task 2969 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_compile)
NOTE: Running task 2970 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_package_write_rpm)
NOTE: Running task 2971 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_compile)
NOTE: Running task 2972 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libunwind-1.6.2-r0: task do_compile: Started
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_write_rpm: Started
NOTE: recipe tiff-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2973 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_install)
NOTE: recipe tiff-4.5.0-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2974 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 2975 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2976 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2977 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe freetype-2.13.0-r0: task do_install: Succeeded
NOTE: Running task 2978 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_populate_sysroot)
NOTE: Running task 2979 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_package)
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.13.0-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 2980 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: Running task 2981 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_install)
NOTE: Running task 2982 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Started
NOTE: Running task 2983 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2984 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Succeeded
NOTE: Running task 2985 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_packagedata)
NOTE: recipe fontconfig-2.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2986 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_configure)
NOTE: Running task 2987 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe fontconfig-2.14.2-r0: task do_configure: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 2988 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2989 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package)
NOTE: Running task 2990 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_configure: Succeeded
NOTE: Running task 2991 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.6-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2992 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2993 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2994 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2995 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2996 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 2997 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: Running task 2998 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2999 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: Running task 3000 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: recipe freetype-2.13.0-r0: task do_package: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_compile: Succeeded
NOTE: Running task 3001 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_install)
NOTE: Running task 3002 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: recipe libunwind-1.6.2-r0: task do_install: Started
NOTE: recipe freetype-2.13.0-r0: task do_packagedata: Started
NOTE: recipe freetype-2.13.0-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Succeeded
NOTE: Running task 3003 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: Running task 3004 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe libunwind-1.6.2-r0: task do_install: Succeeded
NOTE: Running task 3005 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot)
NOTE: Running task 3006 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_package)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libunwind-1.6.2-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3007 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_compile)
NOTE: Running task 3008 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Started
NOTE: Running task 3009 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.2.2-r0: task do_compile: Succeeded
NOTE: Running task 3010 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_install)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Succeeded
NOTE: Running task 3011 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3012 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Started
NOTE: Running task 3013 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 3014 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: Running task 3015 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3016 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3017 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 3018 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_install)
NOTE: recipe libsoup-3.2.2-r0: task do_install: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3019 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_populate_sysroot)
NOTE: Running task 3020 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_package)
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3021 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: Running task 3022 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Started
NOTE: Running task 3023 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe libsoup-3.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe libsoup-3.2.2-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: Running task 3024 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot)
NOTE: Running task 3025 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 3026 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 3027 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 3028 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_package)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3029 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot)
NOTE: Running task 3030 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Started
NOTE: Running task 3031 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 3032 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3033 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 3034 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_compile: Succeeded
NOTE: Running task 3035 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 3036 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_install)
NOTE: Running task 3037 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3038 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunwind-1.6.2-r0: task do_package: Succeeded
NOTE: Running task 3039 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: Running task 3040 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata)
NOTE: recipe vala-0.56.4-r0: task do_install: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata: Started
NOTE: Running task 3041 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_install)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Started
NOTE: Running task 3042 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3043 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_configure)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3044 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3045 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 3046 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile_ptest_base)
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Succeeded
NOTE: Running task 3047 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install)
NOTE: Running task 3048 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 3049 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_install: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Started
NOTE: Running task 3050 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_populate_sysroot)
NOTE: Running task 3051 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 3052 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Succeeded
NOTE: Running task 3053 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Started
NOTE: Running task 3054 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot)
NOTE: Running task 3055 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: Running task 3056 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: Running task 3057 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install_ptest_base)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3058 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_configure: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_compile: Succeeded
NOTE: Running task 3059 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_compile)
NOTE: Running task 3060 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_compile_ptest_base)
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Started
NOTE: Running task 3061 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe dbus-1.14.6-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3062 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3063 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 3064 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_package)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3065 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_configure: Started
NOTE: recipe vala-0.56.4-r0: task do_install: Succeeded
NOTE: Running task 3066 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_populate_sysroot)
NOTE: Running task 3067 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_package)
NOTE: recipe vala-0.56.4-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rust-native-1.67.1-r0: task do_install: Succeeded
NOTE: Running task 3068 of 3331 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.1.bb:do_populate_sysroot)
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Succeeded
NOTE: Running task 3069 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata)
NOTE: recipe rust-native-1.67.1-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3070 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3071 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.20.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3072 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_configure)
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3073 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_configure)
NOTE: recipe libsoup-3.2.2-r0: task do_package: Succeeded
NOTE: Running task 3074 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_packagedata)
NOTE: recipe libsecret-0.20.5-r0: task do_configure: Started
NOTE: recipe libical-3.0.16-r0: task do_configure: Started
NOTE: recipe libsoup-3.2.2-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 3075 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_configure: Succeeded
NOTE: Running task 3076 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_compile)
NOTE: recipe p11-kit-0.24.1-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_compile: Succeeded
NOTE: Running task 3077 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_install)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_install: Started
NOTE: recipe rust-native-1.67.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3078 of 3331 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.67.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe cargo-native-1.67.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-native-1.67.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3079 of 3331 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.67.1.bb:do_rust_create_wrappers)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_install: Succeeded
NOTE: Running task 3080 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_populate_sysroot)
NOTE: Running task 3081 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_package)
NOTE: recipe cargo-native-1.67.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 3082 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_package: Started
NOTE: recipe cargo-native-1.67.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3083 of 3331 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.67.1.bb:do_configure)
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe cargo-native-1.67.1-r0: task do_configure: Started
NOTE: recipe dbus-1.14.6-r0: task do_install: Succeeded
NOTE: Running task 3084 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_install_ptest_base)
NOTE: recipe cargo-native-1.67.1-r0: task do_configure: Succeeded
NOTE: Running task 3085 of 3331 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.67.1.bb:do_compile)
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 3086 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe dbus-1.14.6-r0: task do_install_ptest_base: Started
NOTE: recipe libsecret-0.20.5-r0: task do_configure: Succeeded
NOTE: Running task 3087 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_compile)
NOTE: recipe vala-0.56.4-r0: task do_package: Succeeded
NOTE: Running task 3088 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_packagedata)
NOTE: recipe cargo-native-1.67.1-r0: task do_compile: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_compile: Started
NOTE: Running task 3089 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata)
NOTE: recipe vala-0.56.4-r0: task do_packagedata: Started
NOTE: Running task 3090 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3091 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.6-r0: task do_package: Started
NOTE: recipe vala-0.56.4-r0: task do_packagedata: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3092 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-native-1.67.1-r0: task do_compile: Succeeded
NOTE: Running task 3093 of 3331 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.67.1.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Succeeded
NOTE: recipe cargo-native-1.67.1-r0: task do_install: Started
NOTE: recipe cargo-native-1.67.1-r0: task do_install: Succeeded
NOTE: Running task 3094 of 3331 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.67.1.bb:do_populate_sysroot)
NOTE: recipe cargo-native-1.67.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_configure: Succeeded
NOTE: Running task 3095 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_compile)
NOTE: recipe fontconfig-2.14.2-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 3096 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_install)
NOTE: recipe xrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3097 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_package: Succeeded
NOTE: Running task 3098 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_packagedata)
NOTE: recipe libnotify-0.8.1-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 3099 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 3100 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_package)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe cargo-native-1.67.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3101 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3102 of 3331 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe libical-3.0.16-r0: task do_configure: Succeeded
NOTE: Running task 3103 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_compile)
NOTE: recipe libstd-rs-1.67.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-native-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_compile: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: recipe librsvg-native-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3104 of 3331 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: Running task 3105 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 3106 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3107 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-native-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-native-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3108 of 3331 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: recipe libstd-rs-1.67.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3109 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-native-2.54.5-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3110 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3111 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.67.1-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_configure: Succeeded
NOTE: Running task 3112 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_compile)
NOTE: recipe mesa-2_22.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3113 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_configure)
NOTE: recipe libstd-rs-1.67.1-r0: task do_compile: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3114 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3115 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_compile)
NOTE: recipe xrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: Running task 3116 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.1-r0: task do_configure: Succeeded
NOTE: Running task 3117 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_compile)
NOTE: recipe libnotify-0.8.1-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3118 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_install)
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3119 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 3120 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_package)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 3121 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 3122 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3123 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3124 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_compile)
NOTE: recipe enchant2-2.3.3-r0: task do_compile: Started
NOTE: recipe libsecret-0.20.5-r0: task do_compile: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_package: Succeeded
NOTE: Running task 3125 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_install)
NOTE: Running task 3126 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: Running task 3127 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: recipe libsecret-0.20.5-r0: task do_install: Started
NOTE: recipe dbus-1.14.6-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_compile: Succeeded
NOTE: Running task 3128 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_install)
NOTE: recipe dbus-1.14.6-r0: task do_packagedata: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_install: Started
NOTE: Running task 3129 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_package_write_rpm)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package_write_rpm: Started
NOTE: recipe libsecret-0.20.5-r0: task do_install: Succeeded
NOTE: Running task 3130 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_populate_sysroot)
NOTE: Running task 3131 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_package)
NOTE: recipe libsecret-0.20.5-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.20.5-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3132 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe libsecret-0.20.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3133 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_install)
NOTE: recipe fontconfig-2.14.2-r0: task do_install: Succeeded
NOTE: Running task 3134 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot)
NOTE: Running task 3135 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_package)
NOTE: recipe libnotify-0.8.1-r0: task do_install: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_package: Started
NOTE: recipe enchant2-2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3136 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_install)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3137 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe enchant2-2.3.3-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.8.1-r0: task do_install: Succeeded
NOTE: Running task 3138 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_populate_sysroot)
NOTE: Running task 3139 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_package)
NOTE: recipe libnotify-0.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_compile: Succeeded
NOTE: Running task 3140 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_install)
NOTE: recipe libnotify-0.8.1-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3141 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_configure)
NOTE: recipe libical-3.0.16-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Started
NOTE: recipe enchant2-2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3142 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3143 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_package)
NOTE: recipe libnotify-0.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.3.3-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: Running task 3144 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe libical-3.0.16-r0: task do_install: Succeeded
NOTE: Running task 3145 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: Running task 3146 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_package)
NOTE: recipe mesa-2_22.3.5-r0: task do_configure: Succeeded
NOTE: Running task 3147 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_compile)
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_package: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_compile: Started
NOTE: recipe enchant2-2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3148 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-native-2.54.5-r0: task do_configure: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_package: Succeeded
NOTE: Running task 3149 of 3331 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_compile)
NOTE: recipe bluez5-5.66-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3150 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_packagedata)
NOTE: recipe librsvg-native-2.54.5-r0: task do_compile: Started
NOTE: recipe libsecret-0.20.5-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.66-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3151 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_configure)
NOTE: recipe libsecret-0.20.5-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_configure: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_package: Succeeded
NOTE: Running task 3152 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata)
NOTE: recipe libnotify-0.8.1-r0: task do_package: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata: Started
NOTE: Running task 3153 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_packagedata)
NOTE: recipe libnotify-0.8.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3154 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_packagedata)
NOTE: recipe libnotify-0.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_package: Succeeded
NOTE: Running task 3155 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata)
NOTE: recipe libical-3.0.16-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.16-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: Running task 3156 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe p11-kit-0.24.1-r0: task do_compile: Succeeded
NOTE: Running task 3157 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_install: Succeeded
NOTE: Running task 3158 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: Running task 3159 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: Running task 3160 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_populate_sysroot)
NOTE: Running task 3161 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_package)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_package: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_package: Succeeded
NOTE: Running task 3162 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_packagedata)
NOTE: recipe p11-kit-0.24.1-r0: task do_packagedata: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Succeeded
NOTE: Running task 3163 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3164 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_compile)
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3165 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3166 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_install)
NOTE: recipe bluez5-5.66-r0: task do_configure: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Started
NOTE: Running task 3167 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.66-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.66-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3168 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_compile)
NOTE: recipe bluez5-5.66-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Succeeded
NOTE: Running task 3169 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot)
NOTE: Running task 3170 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3171 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Succeeded
NOTE: Running task 3172 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3173 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3174 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_package)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3175 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3176 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3177 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_compile: Succeeded
NOTE: Running task 3178 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.66-r0: task do_compile_ptest_base: Started
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 3179 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 3180 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 3181 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 3182 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_compile: Succeeded
NOTE: Running task 3183 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_install: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_install: Succeeded
NOTE: Running task 3184 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_populate_sysroot)
NOTE: Running task 3185 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_package)
NOTE: recipe mesa-2_22.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 3186 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_compile: Succeeded
NOTE: Running task 3187 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_install)
NOTE: recipe libstd-rs-1.67.1-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3188 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3189 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3190 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.67.1-r0: task do_install: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3191 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_populate_sysroot)
NOTE: Running task 3192 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_package)
NOTE: recipe libstd-rs-1.67.1-r0: task do_package: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3193 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3194 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libwpe-1.14.1-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3195 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe libwpe-1.14.1-r0: task do_configure: Succeeded
NOTE: Running task 3196 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_compile)
NOTE: recipe libwpe-1.14.1-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwpe-1.14.1-r0: task do_compile: Succeeded
NOTE: Running task 3197 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_install)
NOTE: recipe libwpe-1.14.1-r0: task do_install: Started
NOTE: recipe libwpe-1.14.1-r0: task do_install: Succeeded
NOTE: Running task 3198 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_populate_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 3199 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libwpe-1.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe libwpe-1.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_package: Succeeded
NOTE: Running task 3200 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_packagedata)
NOTE: recipe libstd-rs-1.67.1-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_package: Succeeded
NOTE: Running task 3201 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_packagedata)
NOTE: recipe mesa-2_22.3.5-r0: task do_packagedata: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3202 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_package)
NOTE: recipe libwpe-1.14.1-r0: task do_package: Started
NOTE: recipe libwpe-1.14.1-r0: task do_package: Succeeded
NOTE: Running task 3203 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_packagedata)
NOTE: recipe libwpe-1.14.1-r0: task do_packagedata: Started
NOTE: recipe libwpe-1.14.1-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 3204 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 3205 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 3206 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3207 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3208 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 3209 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_configure: Succeeded
NOTE: Running task 3210 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3211 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_compile: Succeeded
NOTE: Running task 3212 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_install)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_install: Succeeded
NOTE: Running task 3213 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_populate_sysroot)
NOTE: Running task 3214 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_package)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-native-2.54.5-r0: task do_compile: Succeeded
NOTE: Running task 3215 of 3331 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_install)
NOTE: recipe librsvg-native-2.54.5-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_package: Succeeded
NOTE: Running task 3216 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_packagedata: Started
NOTE: recipe librsvg-native-2.54.5-r0: task do_install: Succeeded
NOTE: Running task 3217 of 3331 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_populate_sysroot)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-native-2.54.5-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-native-2.54.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3218 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 3219 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 3220 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3221 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-7.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-7.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3222 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.1.bb:do_configure)
NOTE: recipe harfbuzz-7.0.1-r0: task do_configure: Started
NOTE: recipe bluez5-5.66-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3223 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_install)
NOTE: recipe bluez5-5.66-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 3224 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_install: Succeeded
NOTE: Running task 3225 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.66-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.66-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3226 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_populate_sysroot)
NOTE: Running task 3227 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_package)
NOTE: recipe bluez5-5.66-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.66-r0: task do_package: Started
NOTE: recipe bluez5-5.66-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-7.0.1-r0: task do_configure: Succeeded
NOTE: Running task 3228 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.1.bb:do_compile)
NOTE: recipe harfbuzz-7.0.1-r0: task do_compile: Started
NOTE: recipe bluez5-5.66-r0: task do_package: Succeeded
NOTE: Running task 3229 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_packagedata)
NOTE: recipe bluez5-5.66-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.66-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-7.0.1-r0: task do_compile: Succeeded
NOTE: Running task 3230 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.1.bb:do_install)
NOTE: recipe harfbuzz-7.0.1-r0: task do_install: Started
NOTE: recipe harfbuzz-7.0.1-r0: task do_install: Succeeded
NOTE: Running task 3231 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.1.bb:do_populate_sysroot)
NOTE: Running task 3232 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.1.bb:do_package)
NOTE: recipe harfbuzz-7.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-7.0.1-r0: task do_package: Started
NOTE: recipe harfbuzz-7.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3233 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3234 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure)
NOTE: recipe pango-1.50.12-r0: task do_configure: Started
NOTE: recipe harfbuzz-7.0.1-r0: task do_package: Succeeded
NOTE: Running task 3235 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.1.bb:do_packagedata)
NOTE: recipe harfbuzz-7.0.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-7.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_configure: Succeeded
NOTE: Running task 3236 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure_ptest_base)
NOTE: recipe pango-1.50.12-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3237 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_compile)
NOTE: recipe pango-1.50.12-r0: task do_compile: Started
NOTE: recipe pango-1.50.12-r0: task do_compile: Succeeded
NOTE: Running task 3238 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.12-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3239 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_install)
NOTE: recipe pango-1.50.12-r0: task do_install: Started
NOTE: recipe pango-1.50.12-r0: task do_install: Succeeded
NOTE: Running task 3240 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.12-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3241 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_sysroot)
NOTE: Running task 3242 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package)
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_package: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3243 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3244 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3245 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3246 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_configure)
NOTE: recipe gtk+3-3.24.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Started
NOTE: Running task 3247 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_configure)
NOTE: recipe gtk+3-3.24.36-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3248 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3249 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Started
NOTE: recipe pango-1.50.12-r0: task do_package: Succeeded
NOTE: Running task 3250 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata)
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_configure: Succeeded
NOTE: Running task 3251 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_compile)
NOTE: recipe gtk+3-3.24.36-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 3252 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Started
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Succeeded
NOTE: Running task 3253 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_compile)
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 3254 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 3255 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 3256 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_compile: Succeeded
NOTE: Running task 3257 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_install)
NOTE: recipe gtk+3-3.24.36-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_install: Succeeded
NOTE: Running task 3258 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_populate_sysroot)
NOTE: Running task 3259 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_package)
NOTE: recipe gtk+3-3.24.36-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3260 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr3_3.41.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3261 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3262 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3263 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3264 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcr3-3.41.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libhandy-1.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libhandy-1.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3265 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_configure)
NOTE: Running task 3266 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_configure)
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Started
NOTE: recipe libhandy-1.8.1-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3267 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_configure)
NOTE: recipe gcr3-3.41.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3268 of 3331 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr3_3.41.1.bb:do_configure)
NOTE: recipe webkitgtk-2.38.5-r0: task do_configure: Started
NOTE: recipe gcr3-3.41.1-r0: task do_configure: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_configure: Succeeded
NOTE: recipe gcr3-3.41.1-r0: task do_configure: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_package: Succeeded
NOTE: recipe webkitgtk-2.38.5-r0: task do_configure: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3268 tasks of which 2261 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_prepare_recipe_sysroot
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: adwaita-icon-theme-43-r0 do_prepare_recipe_sysroot: Error executing a python function in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:extend_recipe_sysroot(d)
     0003:
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes-global/staging.bbclass', lineno: 614, function: extend_recipe_sysroot
     0610:                    if "/bin/" in l or "/sbin/" in l:
     0611:                        # defer /*bin/* files until last in case they need libs
     0612:                        binfiles[l] = (targetdir, dest)
     0613:                    else:
 *** 0614:                        staging_copyfile(l, targetdir, dest, postinsts, seendirs)
     0615:
     0616:    # Handle deferred binfiles
     0617:    for l in binfiles:
     0618:        (targetdir, dest) = binfiles[l]
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes-global/staging.bbclass', lineno: 156, function: staging_copyfile
     0152:    if os.path.islink(c):
     0153:        linkto = os.readlink(c)
     0154:        if os.path.lexists(dest):
     0155:            if not os.path.islink(dest):
 *** 0156:                raise OSError(errno.EEXIST, "Link %s already exists as a file" % dest, dest)
     0157:            if os.readlink(dest) == linkto:
     0158:                return dest
     0159:            raise OSError(errno.EEXIST, "Link %s already exists to a different location? (%s vs %s)" % (dest, os.readlink(dest), linkto), dest)
     0160:        os.symlink(linkto, dest)
Exception: FileExistsError: [Errno 17] Link /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/43-r0/recipe-sysroot/usr/include/c++/12.2.0/i686-poky-linux already exists as a file: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/43-r0/recipe-sysroot/usr/include/c++/12.2.0/i686-poky-linux'

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/43-r0/temp/log.do_prepare_recipe_sysroot.968438
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_prepare_recipe_sysroot) failed with exit code '1'

--===============8549610888862158657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/epiphany/epiphany-dbg: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-dbg: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 4701200 to 4701864 (+0%)
packages/core2-32-poky-linux/epiphany/epiphany-dev: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-dev: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-doc: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-doc: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ab: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ab: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ab: PKGSIZE changed from 7646 to 24331 (+218%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-af: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-am: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-an: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ar: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-as: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ast: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-az: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-be: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-bg: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-bn: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-br: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-bs: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ca: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-cs: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-cy: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-da: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-de: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-dz: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-el: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-en-gb: PKGSIZE changed from 79896 to 81382 (+2%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-eo: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-es: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-et: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-eu: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-fa: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-fi: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-fr: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-fr: PKGSIZE changed from 90731 to 92446 (+2%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-fur: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-fur: PKGSIZE changed from 87145 to 87265 (+0%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-fy: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-fy: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ga: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-gl: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-gu: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-gv: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-he: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-hi: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-hr: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-hu: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-hy: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-id: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ig: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-is: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-it: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-it: PKGSIZE changed from 86156 to 87771 (+2%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-ja: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ka: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-kk: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-kk: PKGSIZE changed from 53316 to 54047 (+1%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-km: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-kn: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ko: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ku: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-li: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-lt: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-lv: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mai: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mg: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mi: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mk: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ml: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mn: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mr: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ms: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-nb: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-nb: PKGSIZE changed from 65154 to 67234 (+3%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-nds: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ne: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-nl: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-nl: PKGSIZE changed from 86725 to 87053 (+0%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-nn: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-oc: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-or: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-pa: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-pl: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ps: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-pt: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ro: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ru: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ru: PKGSIZE changed from 112904 to 112712 (-0%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-rw: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-si: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sk: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sl: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sq: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sr: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sr: PKGSIZE changed from 110862 to 112171 (+1%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-sv: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ta: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-te: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-tg: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-th: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-tk: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-tr: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-tr: PKGSIZE changed from 86362 to 86363 (+0%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-ug: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-uk: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-uz: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-vi: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-wa: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-yo: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-src: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-src: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 4520987 to 4521878 (+0%)
packages/core2-32-poky-linux/epiphany/epiphany-staticdev: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany/epiphany: PKGV changed from 43.0 [default] to 43.1 [default]
packages/core2-32-poky-linux/epiphany/epiphany: PKGSIZE changed from 2254195 to 2254604 (+0%)
packages/core2-32-poky-linux/epiphany: PV changed from "43.0" to "43.1"
packages/core2-32-poky-linux/epiphany: PACKAGES: added "epiphany-locale-ie"
packages/core2-32-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/43/epiphany-43.0.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/43/epiphany-43.1.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"
packages/core2-32-poky-linux/epiphany: PKGV changed from 43.0 [default] to 43.1 [default]

--===============8549610888862158657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/epiphany/epiphany-locale-ab: PKGSIZE changed from 7646 to 24331 (+218%)
packages/core2-32-poky-linux/epiphany: PACKAGES: added "epiphany-locale-ie"

--===============8549610888862158657==--

