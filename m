Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38455CD342E
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:53 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15617.1777645535643143513
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aSvNU8fp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tM08sW9C;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019de3ee7934-df184b0e-df7d-4a35-967e-4056f85c67eb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645550;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+/QZ9YGOmaDvqGTO352wLHtuYI5q9QB+7vFH51kRako=;
	b=aSvNU8fpcAKc6GoS7Vb6hFSCxNbJrYIgjbLxqx7SzjE5Zmn4cooKcD7jrLATdCUf
	mJ8cGP1+SAQNU1E8q4sNcIVRjHXOzzqAa31SpNBhxpxpIUpxyZEeaBD9HcPPxRZW4C2
	TS3OgMR/kFg50Aa51VfNHYU79jL3fq/fR3aShsBM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645550;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+/QZ9YGOmaDvqGTO352wLHtuYI5q9QB+7vFH51kRako=;
	b=tM08sW9CUVLLiBRMieQX5CFPVlpUJp8evIVrreRedgmLz9+jdqBvzWsKHGjM9Lkv
	xAypZtRIh1mVP8R6xN6ielUf5ymp/zBxgjsLRM3cVJl+TZTtsA1Sry+dzfIEgq+0OZw
	lflESKuHSghDV9hv+IAJPVqktO7WaJLThQ+OXChg=
Content-Type: multipart/mixed; boundary="===============2188628300435857464=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.22.4 SUCCEEDED
Message-ID: <0101019de3ee7934-df184b0e-df7d-4a35-967e-4056f85c67eb-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236272

--===============2188628300435857464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gtk4* to *4.22.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.22.2-4.22.4.patch
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
From 8ed63ee67b8891baf197b4da5be09c86f2d81ce8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 11:42:21 +0000
Subject: [PATCH] gtk4: upgrade 4.22.2 -> 4.22.4

---
 meta/recipes-gnome/gtk+/{gtk4_4.22.2.bb => gtk4_4.22.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.22.2.bb => gtk4_4.22.4.bb} (97%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.22.2.bb b/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb
similarity index 97%
rename from meta/recipes-gnome/gtk+/gtk4_4.22.2.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.22.4.bb
index f2cef8d13a..bb2e041595 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.22.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM = " \
     file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
 "
 
-SRC_URI[archive.sha256sum] = "b1c987370a0c30780cde351bdbee02eef816728f1c1c2ec7c8093281c0709ee8"
+SRC_URI[archive.sha256sum] = "51bd9f60c7d23a665a556c7364c21fb2e4e282566b3e7e092455e8f910330893"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.47.1


--===============2188628300435857464==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.22.2-4.22.4.patch"

RnJvbSA4ZWQ2M2VlNjdiODg5MWJhZjE5N2I0ZGE1YmUwOWM4NmYyZDgxY2U4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMTo0MjoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGd0
azQ6IHVwZ3JhZGUgNC4yMi4yIC0+IDQuMjIuNAoKLS0tCiBtZXRhL3JlY2lwZXMtZ25vbWUvZ3Rr
Ky97Z3RrNF80LjIyLjIuYmIgPT4gZ3RrNF80LjIyLjQuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdu
b21lL2d0aysve2d0azRfNC4yMi4yLmJiID0+IGd0azRfNC4yMi40LmJifSAoOTclKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMi4yLmJiIGIvbWV0YS9yZWNp
cGVzLWdub21lL2d0aysvZ3RrNF80LjIyLjQuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2d0aysvZ3RrNF80LjIyLjIuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMi40LmJiCmluZGV4IGYyY2VmOGQxM2EuLmJi
MmUwNDE1OTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMi4y
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMi40LmJiCkBAIC0zMyw3
ICszMyw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiIFwKICAgICBmaWxlOi8vdGVzdHMvdGVzdGd0
ay5jO2VuZGxpbmU9MjU7bWQ1PTQ5ZDA2NzcwNjgxYjgzMjI0NjZiNTJlZDE5ZDI5ZmIyIFwKICIK
IAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiYjFjOTg3MzcwYTBjMzA3ODBjZGUzNTFi
ZGJlZTAyZWVmODE2NzI4ZjFjMWMyZWM3YzgwOTMyODFjMDcwOWVlOCIKK1NSQ19VUklbYXJjaGl2
ZS5zaGEyNTZzdW1dID0gIjUxYmQ5ZjYwYzdkMjNhNjY1YTU1NmM3MzY0YzIxZmIyZTRlMjgyNTY2
YjNlN2UwOTI0NTVlOGY5MTAzMzA4OTMiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9LyR7R05PTUVCTn0t
JHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============2188628300435857464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nb: PKGSIZE changed from 78803 to 92821 (+18%)
packages/x86-64-v3-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.2200.2", added "/usr/lib/libgtk-4.so.1.2200.4"
Changes to packages/x86-64-v3-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.2200.2 to libgtk-4.so.1.2200.4
  /usr/lib/libgtk-4.so.1.2200.2 moved to /usr/lib/libgtk-4.so.1.2200.4

--===============2188628300435857464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-b2e8580634041a04bc0443b14999e0188ffcbf7e"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:b2e8580634041a04bc0443b14999e0188ffcbf7e"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1142 Local 1078 Mirrors 0 Missed 64 Current 592 (94% match, 96% complete)
done.
Removing 6 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 607 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 608 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 609 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 617 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 641 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 650 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 654 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_populate_lic_setscene)
NOTE: Running setscene task 694 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 702 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 710 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 711 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 712 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 724 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 736 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 737 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 742 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_qa_setscene: Started
NOTE: recipe adwaita-icon-theme-50.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk4-4.22.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_qa_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 750 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 754 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 763 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 776 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 778 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_spdx_setscene)
NOTE: recipe adwaita-icon-theme-50.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 780 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk4-4.22.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 794 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_create_spdx_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 796 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx_setscene)
NOTE: Running setscene task 797 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 799 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 800 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 808 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 817 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 822 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 825 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 826 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 827 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 829 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 833 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sbc-2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 835 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 836 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.94.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 840 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 844 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 845 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe orc-0.4.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 846 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 849 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 851 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_create_spdx_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 853 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 854 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 856 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 857 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 858 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 860 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.86-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 861 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_packagedata_setscene)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 866 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 868 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 869 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 874 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_create_recipe_spdx_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 878 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 881 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_create_spdx_setscene)
NOTE: recipe iso-codes-4.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 883 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 884 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 885 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 886 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 891 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 892 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.20-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 894 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 898 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 902 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 904 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 906 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 908 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 916 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: recipe librsvg-2.61.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 917 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 919 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 922 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 924 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 925 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 926 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 928 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 929 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_spdx_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 933 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.86-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 934 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 936 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 937 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 938 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 940 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 941 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 942 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 943 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 944 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 945 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 946 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 950 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 953 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 954 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sbc-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 955 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 957 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 959 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 960 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 964 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 966 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 967 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 968 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 971 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 972 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 973 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 974 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_packagedata_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 976 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.94.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 979 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 981 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.48-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 983 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 987 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 988 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 990 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 991 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 992 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-protocols-1.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 995 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 998 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 999 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1002 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1005 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1006 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1007 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1010 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.86-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1013 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1015 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1019 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1021 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_26.0.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1024 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1037 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1038 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1044 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1046 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1047 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk+3-3.24.52-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1048 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1051 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1052 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1054 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_packagedata_setscene)
NOTE: recipe pango-1.57.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1055 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1057 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.94.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1060 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1064 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1066 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.57.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1070 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1073 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcxx-22.1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1075 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1082 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1083 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1084 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1085 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1086 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1087 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1095 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1098 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1100 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcxx-22.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1102 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1103 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1116 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_create_spdx_setscene)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1118 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1130 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1133 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1139 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1141 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1142 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1143 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1144 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1146 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1150 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1151 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1152 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: Running setscene task 1153 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.94.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1157 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1158 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1160 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1161 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1165 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1166 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1167 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1168 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1169 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1171 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_spdx_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1175 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1176 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1177 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1178 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1180 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1183 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1185 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1186 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1192 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe pango-1.57.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1193 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1194 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1195 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1200 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1201 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1202 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1203 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.57.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1204 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1205 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/gdk-pixbuf/2.44.5/temp/log.do_packagedata_setscene.3156446
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1207 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe icu-78.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1209 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx_setscene)
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1210 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1212 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1215 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1218 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1219 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_recipe_qa_setscene)
NOTE: recipe compiler-rt-22.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1220 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1222 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1223 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1224 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1225 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1226 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1227 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package_setscene)
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe compiler-rt-22.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1229 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1230 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1233 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1234 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1235 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1238 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1240 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1241 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1243 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1244 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1245 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1250 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1251 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1253 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1254 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libcxx-22.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.56-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1255 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1256 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1259 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1260 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1261 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1264 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1265 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1266 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.56-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1268 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1271 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1272 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1273 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1275 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.57.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1280 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.57.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1281 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1286 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1287 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1290 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcxx-22.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1291 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1294 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1295 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1297 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1301 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1304 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1306 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1309 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1310 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1312 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcxx-22.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_26.0.5-r0: task do_package_setscene: Started
NOTE: Running setscene task 1313 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1317 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe compiler-rt-22.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libcxx-22.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1318 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1322 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1323 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1325 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1327 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1328 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1330 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1333 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1335 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: recipe compiler-rt-22.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1340 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1342 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.56-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe icu-78.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1343 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1344 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1348 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1349 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1352 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1353 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1356 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.56-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1357 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe icu-78.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1358 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1365 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1367 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1369 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1371 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1373 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_spdx_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1383 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1385 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1387 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe compiler-rt-22.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1388 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1391 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1400 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1404 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1405 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1407 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe compiler-rt-22.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1408 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1411 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1414 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1415 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1419 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1423 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1424 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1426 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1427 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1429 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1431 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1434 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1437 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1439 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1440 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1447 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe mesa-2_26.0.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1448 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1449 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1450 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1451 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_packagedata_setscene)
NOTE: Running setscene task 1452 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1453 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1454 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1455 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1456 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1457 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1458 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1459 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1460 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 827 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_fetch)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-78.3-r0: task do_fetch: Started
NOTE: recipe icu-78.3-r0: task do_fetch: Succeeded
NOTE: Running task 953 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_unpack)
NOTE: recipe mesa-2_26.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1466 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1469 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1472 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1474 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1475 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1477 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1478 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1479 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1481 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1482 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1485 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1486 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1488 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1489 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.3-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1491 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1493 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1494 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1498 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1499 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running task 1009 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1501 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1502 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1504 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1506 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1508 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1076 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_fetch)
NOTE: Running task 1084 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_fetch)
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1510 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1085 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.57.1-r0: task do_fetch: Started
NOTE: Running task 1096 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_fetch)
NOTE: recipe harfbuzz-12.3.2-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.57.1-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running setscene task 1514 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: Running task 1118 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1123 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1516 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1165 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1518 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1520 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1521 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1225 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe pango-1.57.1-r0: task do_unpack: Started
NOTE: recipe librsvg-2.61.3-r0: task do_fetch: Started
NOTE: Running task 1256 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1273 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_write_config)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running task 1334 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running setscene task 1523 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1524 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1362 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.57.1-r0: task do_write_config: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1393 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe librsvg-2.61.3-r0: task do_fetch: Succeeded
NOTE: Running task 1416 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_unpack)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1447 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_fetch)
NOTE: Running task 1452 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_write_config)
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.57.1-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1526 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1527 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1528 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_write_config: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_fetch: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_fetch: Started
NOTE: recipe pango-1.57.1-r0: task do_unpack: Succeeded
NOTE: Running task 1477 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_patch)
NOTE: recipe libical-3.0.20-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_26.0.5-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1489 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_unpack)
NOTE: Running task 1496 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_fetch: Succeeded
NOTE: Running task 1566 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1575 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_unpack)
NOTE: recipe pango-1.57.1-r0: task do_patch: Started
NOTE: recipe librsvg-2.61.3-r0: task do_unpack: Started
NOTE: recipe libical-3.0.20-r0: task do_unpack: Started
NOTE: recipe librsvg-2.61.3-r0: task do_write_config: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_26.0.5-r0: task do_unpack: Started
NOTE: recipe pango-1.57.1-r0: task do_patch: Succeeded
NOTE: Running task 1656 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: Running task 1669 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1531 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1532 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1533 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe librsvg-2.61.3-r0: task do_write_config: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_unpack: Started
NOTE: Running setscene task 1534 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1536 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1537 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.20-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running setscene task 1538 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1540 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1541 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1542 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1545 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1546 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running task 1682 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1688 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_unpack: Succeeded
NOTE: Running task 1703 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_patch)
NOTE: Running task 1713 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1550 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running task 1726 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1552 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running setscene task 1554 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.20-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1733 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1558 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1559 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1560 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1772 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_unpack)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1786 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: Running task 1795 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: Running task 1819 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_patch: Succeeded
NOTE: Running task 1820 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_patch)
NOTE: Running task 1822 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_generate_toolchain_file)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe bluez5-5.86-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_fetch: Started
NOTE: Running task 1824 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_fetch: Succeeded
NOTE: Running task 1846 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_fetch: Started
NOTE: Running task 1856 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_unpack)
NOTE: recipe gtk+3-3.24.52-r0: task do_fetch: Succeeded
NOTE: recipe icu-78.3-r0: task do_unpack: Succeeded
NOTE: Running task 1884 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_unpack)
NOTE: Running task 1889 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_write_config)
NOTE: Running task 1890 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_patch: Started
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Started
NOTE: Running setscene task 1562 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1564 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: Running task 1905 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_unpack: Started
NOTE: Running setscene task 1565 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1566 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1567 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1568 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_write_config: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_unpack: Started
NOTE: recipe icu-78.3-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1569 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1570 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1571 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1937 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_patch)
NOTE: recipe libpng-1.6.56-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1947 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_recipe_qa)
NOTE: recipe libpng-1.6.56-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.56-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk4-4.22.4-r0: task do_recipe_qa: Started
NOTE: Running task 1984 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1574 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_recipe_qa_setscene)
NOTE: Running task 2004 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_write_config)
NOTE: recipe libpng-1.6.56-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1576 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1578 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_recipe_qa_setscene)
NOTE: Running task 2005 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.56-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_write_config: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_write_config: Succeeded
NOTE: Running task 2076 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_write_config)
NOTE: Running task 2084 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.56-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 863877277e5432a250457b4adbf48b5089823fb95b64415fbdd44bf31f4e658a to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '1c4b810620c395f71e6da82eeae6855bb2e1d04b3c5ad715459ec0130107d857', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '863877277e5432a250457b4adbf48b5089823fb95b64415fbdd44bf31f4e658a'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 1c4b810620c395f71e6da82eeae6855bb2e1d04b3c5ad715459ec0130107d857 -> 863877277e5432a250457b4adbf48b5089823fb95b64415fbdd44bf31f4e658a as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe icu-78.3-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1580 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1582 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1583 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1584 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1585 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe gtk4-4.22.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 2179 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_fetch)
NOTE: recipe gtk4-4.22.4-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_patch: Started
NOTE: Running task 2197 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_create_recipe_spdx)
NOTE: recipe libxml2-2.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.22.4-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.22.4-r0: task do_fetch: Started
NOTE: recipe gtk4-4.22.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe gtk4-4.22.4-r0: task do_fetch: Succeeded
NOTE: Running task 2201 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_unpack)
NOTE: recipe gtk+3-3.24.52-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2207 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_patch)
NOTE: recipe libxml2-2.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1588 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.22.4-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.22.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1590 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1591 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1592 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1594 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 1595 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1596 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_26.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 2216 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_26.0.5-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1598 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1601 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1604 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1606 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk4-4.22.4-r0: task do_unpack: Succeeded
NOTE: Running task 2236 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_patch)
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1608 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe gtk4-4.22.4-r0: task do_patch: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.22.4-r0: task do_patch: Succeeded
NOTE: Running task 2237 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1610 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1611 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1612 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1613 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1614 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1615 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1616 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1617 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: recipe gtk4-4.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1618 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1619 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1621 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1623 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1624 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1625 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1626 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1627 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1628 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1631 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe gtk4-4.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1632 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1633 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1637 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1638 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1639 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1641 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1643 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1644 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1645 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1648 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1651 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1654 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1655 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1659 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1660 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1662 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1663 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1664 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1667 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1671 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1672 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1673 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1676 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1681 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1682 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1683 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1684 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1687 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1688 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1689 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1691 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1695 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1696 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1698 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1700 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1701 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 2700 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1703 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1705 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1706 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1708 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1710 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 1711 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1712 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1713 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1714 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1719 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1721 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1723 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1728 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1730 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1732 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1734 of 1734 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3189 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-78.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.61.3-r0: task do_unpack: Succeeded
NOTE: Running task 3632 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_packagedata)
NOTE: Running task 3633 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_patch)
NOTE: Running task 3637 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3654 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3801 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.61.3-r0: task do_patch: Started
NOTE: recipe icu-78.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3891 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_make_icudata)
NOTE: recipe mesa-2_26.0.5-r0: task do_create_spdx: Started
NOTE: recipe icu-78.3-r0: task do_make_icudata: Started
NOTE: recipe icu-78.3-r0: task do_make_icudata: Succeeded
NOTE: Running task 3892 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_configure)
NOTE: recipe librsvg-2.61.3-r0: task do_patch: Succeeded
NOTE: Running task 3894 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_rust_gen_targets)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe icu-78.3-r0: task do_configure: Started
NOTE: Running task 3895 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_rust_gen_targets: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 3896 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running task 3897 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_create_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 863877277e5432a250457b4adbf48b5089823fb95b64415fbdd44bf31f4e658a to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'a870c945589a05a71b4ab3daf513b27c83bbbbb6ac546216c2fdf4160c3b14df', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '863877277e5432a250457b4adbf48b5089823fb95b64415fbdd44bf31f4e658a'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed a870c945589a05a71b4ab3daf513b27c83bbbbb6ac546216c2fdf4160c3b14df -> 863877277e5432a250457b4adbf48b5089823fb95b64415fbdd44bf31f4e658a as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3912 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package_write_ipk)
NOTE: Running task 3913 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package_write_deb)
NOTE: Running task 3914 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package_write_rpm)
NOTE: Running task 3915 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package_qa)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_write_ipk: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_write_deb: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_qa: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 3916 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 3917 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package_write_ipk unihash changed to b19bfb4a86de449deb8a572f35f83091aa59ec091b67ca0066e0ba692f2ba4f3
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package_qa unihash changed to 62c73290608456f78ea2670b48f51bf642d97561587dd55da16c4966ac0aaa7c
NOTE: recipe icu-78.3-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3918 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_configure_ptest_base)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package_write_rpm unihash changed to 1e96b68d783c3c35b46f7654923d49c2b6b80914554e2349384984b691e23953
NOTE: recipe icu-78.3-r0: task do_configure_ptest_base: Started
NOTE: recipe icu-78.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3919 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_compile)
NOTE: recipe icu-78.3-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 3920 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: Running task 3922 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_package)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_write_deb: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package_write_deb unihash changed to c18c52834364876ca0054adc112d19803b7b07c615d67ba5b76f137af6f069e1
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Succeeded
NOTE: Running task 3923 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3924 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 3925 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 3926 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 3927 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 3928 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata unihash changed to c6ae3bbc197d663abb62b5d48c60824b1dec25170d6f56100d004cf5c4562309
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_spdx as unihash 4b2c79d88448bd353efec9364571c5cf4f7967b4779b2def32782ed467fb8ea9 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'e212bb557da0ff29a35c39eee667367a23fc270f3973855ca4cb8f84f2e169a2', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '4b2c79d88448bd353efec9364571c5cf4f7967b4779b2def32782ed467fb8ea9'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_spdx unihash changed e212bb557da0ff29a35c39eee667367a23fc270f3973855ca4cb8f84f2e169a2 -> 4b2c79d88448bd353efec9364571c5cf4f7967b4779b2def32782ed467fb8ea9 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3929 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe icu-78.3-r0: task do_compile: Succeeded
NOTE: Running task 3930 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_compile_ptest_base)
NOTE: recipe icu-78.3-r0: task do_compile_ptest_base: Started
NOTE: recipe icu-78.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3931 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_install)
NOTE: recipe icu-78.3-r0: task do_install: Started
NOTE: recipe icu-78.3-r0: task do_install: Succeeded
NOTE: Running task 3932 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_install_ptest_base)
NOTE: recipe icu-78.3-r0: task do_install_ptest_base: Started
NOTE: recipe icu-78.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3933 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_populate_sysroot)
NOTE: Running task 3934 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_package)
NOTE: recipe icu-78.3-r0: task do_populate_sysroot: Started
NOTE: recipe icu-78.3-r0: task do_package: Started
NOTE: recipe icu-78.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_populate_sysroot unihash changed to 813f06834017202bcc4d3c096d73585608da6d4aa47f0ac126fc4a739136b533
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_populate_sysroot as unihash cf1b6a0563cc05ea4b5d6062ee6e002fffa35be82d5f1204ace4e998196e7365 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '1646285b80edecf3cb5581b6adba07d305022cacce3073bfc9aee465b2698b3c', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'cf1b6a0563cc05ea4b5d6062ee6e002fffa35be82d5f1204ace4e998196e7365'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_populate_sysroot unihash changed 1646285b80edecf3cb5581b6adba07d305022cacce3073bfc9aee465b2698b3c -> cf1b6a0563cc05ea4b5d6062ee6e002fffa35be82d5f1204ace4e998196e7365 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_spdx as unihash 4b2c79d88448bd353efec9364571c5cf4f7967b4779b2def32782ed467fb8ea9 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'c3620e18625579f14bb8254ef627b5e33f5b535e4cba7c18efee70ededea935c', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '4b2c79d88448bd353efec9364571c5cf4f7967b4779b2def32782ed467fb8ea9'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_spdx unihash changed c3620e18625579f14bb8254ef627b5e33f5b535e4cba7c18efee70ededea935c -> 4b2c79d88448bd353efec9364571c5cf4f7967b4779b2def32782ed467fb8ea9 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3935 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3936 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-12.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3937 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_configure)
NOTE: Running task 3938 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_configure)
NOTE: recipe harfbuzz-12.3.2-r0: task do_configure: Started
NOTE: recipe libical-3.0.20-r0: task do_configure: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_configure: Succeeded
NOTE: Running task 3939 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_compile)
NOTE: recipe harfbuzz-12.3.2-r0: task do_compile: Started
NOTE: recipe libical-3.0.20-r0: task do_configure: Succeeded
NOTE: Running task 3940 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_compile)
NOTE: recipe libical-3.0.20-r0: task do_compile: Started
NOTE: recipe icu-78.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_package unihash changed to be208e709b024b6089244aff8989f74c983aa3f41afada3145382e8ad19cae87
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_spdx as unihash 4b2c79d88448bd353efec9364571c5cf4f7967b4779b2def32782ed467fb8ea9 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'a0f6f746a69afd6d3a404056ea05748e4d78f20dcc11dcade671f916b1b6035a', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '4b2c79d88448bd353efec9364571c5cf4f7967b4779b2def32782ed467fb8ea9'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_spdx unihash changed a0f6f746a69afd6d3a404056ea05748e4d78f20dcc11dcade671f916b1b6035a -> 4b2c79d88448bd353efec9364571c5cf4f7967b4779b2def32782ed467fb8ea9 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3941 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_packagedata)
NOTE: recipe icu-78.3-r0: task do_packagedata: Started
NOTE: recipe icu-78.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_packagedata unihash changed to 42dc08c96d561e88e91be91a86460302445a2ebde2002433ef8fa93278142c23
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_spdx as unihash 4b2c79d88448bd353efec9364571c5cf4f7967b4779b2def32782ed467fb8ea9 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'f80f6b8652e152813e7d91fd28d20e1315464cb42295f25e65bf296f4f265f29', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '4b2c79d88448bd353efec9364571c5cf4f7967b4779b2def32782ed467fb8ea9'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_spdx unihash changed f80f6b8652e152813e7d91fd28d20e1315464cb42295f25e65bf296f4f265f29 -> 4b2c79d88448bd353efec9364571c5cf4f7967b4779b2def32782ed467fb8ea9 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3942 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_create_spdx)
NOTE: recipe icu-78.3-r0: task do_create_spdx: Started
NOTE: recipe icu-78.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3943 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_install)
NOTE: recipe libical-3.0.20-r0: task do_install: Started
NOTE: recipe libical-3.0.20-r0: task do_install: Succeeded
NOTE: Running task 3944 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_populate_sysroot)
NOTE: Running task 3945 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_package)
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.20-r0: task do_package: Started
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3946 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.86-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.86-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3947 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_configure)
NOTE: recipe bluez5-5.86-r0: task do_configure: Started
NOTE: recipe libical-3.0.20-r0: task do_package: Succeeded
NOTE: Running task 3948 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_packagedata)
NOTE: recipe libical-3.0.20-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.20-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_packagedata unihash changed to b72182ae4964baa9c35288c09032f3bcb57a9d6f2a87a949be935b8a005f7c52
NOTE: Setscene tasks completed
NOTE: Running task 3949 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_create_spdx)
NOTE: recipe libical-3.0.20-r0: task do_create_spdx: Started
NOTE: recipe libical-3.0.20-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3950 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.86-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.86-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3951 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_compile)
NOTE: recipe bluez5-5.86-r0: task do_compile: Started
NOTE: recipe bluez5-5.86-r0: task do_compile: Succeeded
NOTE: Running task 3952 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_compile_ptest_base)
NOTE: recipe harfbuzz-12.3.2-r0: task do_compile: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_compile_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 3953 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_install)
NOTE: recipe harfbuzz-12.3.2-r0: task do_install: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_install: Succeeded
NOTE: Running task 3954 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_populate_sysroot)
NOTE: Running task 3955 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_package)
NOTE: recipe harfbuzz-12.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_package: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3956 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.57.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.57.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3957 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_configure)
NOTE: recipe pango-1.57.1-r0: task do_configure: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_package: Succeeded
NOTE: Running task 3958 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_packagedata)
NOTE: recipe harfbuzz-12.3.2-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_packagedata unihash changed to 7c80e6f984a4e89ebf2bc2355122e411f67f4982971d75e0175645874241e17c
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_spdx as unihash 4b2c79d88448bd353efec9364571c5cf4f7967b4779b2def32782ed467fb8ea9 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '1b29662fe6d1ad7559b103e1e3a0443446f8f09a288b36cfc1e3dbfe5f7b15b7', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '4b2c79d88448bd353efec9364571c5cf4f7967b4779b2def32782ed467fb8ea9'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_spdx unihash changed 1b29662fe6d1ad7559b103e1e3a0443446f8f09a288b36cfc1e3dbfe5f7b15b7 -> 4b2c79d88448bd353efec9364571c5cf4f7967b4779b2def32782ed467fb8ea9 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3959 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_create_spdx)
NOTE: recipe harfbuzz-12.3.2-r0: task do_create_spdx: Started
NOTE: recipe pango-1.57.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3960 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_compile)
NOTE: recipe pango-1.57.1-r0: task do_compile: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_create_spdx: Succeeded
NOTE: recipe pango-1.57.1-r0: task do_compile: Succeeded
NOTE: Running task 3961 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_install)
NOTE: recipe pango-1.57.1-r0: task do_install: Started
NOTE: recipe pango-1.57.1-r0: task do_install: Succeeded
NOTE: Running task 3962 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_populate_sysroot)
NOTE: Running task 3963 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_package)
NOTE: recipe pango-1.57.1-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.57.1-r0: task do_package: Started
NOTE: recipe pango-1.57.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3964 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3965 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3966 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.61.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3967 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3968 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_configure)
NOTE: recipe librsvg-2.61.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3969 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_rust_create_wrappers)
NOTE: recipe gtk+3-3.24.52-r0: task do_configure: Started
NOTE: recipe librsvg-2.61.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.61.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3970 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_configure)
NOTE: recipe librsvg-2.61.3-r0: task do_configure: Started
NOTE: recipe pango-1.57.1-r0: task do_package: Succeeded
NOTE: Running task 3971 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_packagedata)
NOTE: recipe pango-1.57.1-r0: task do_packagedata: Started
NOTE: recipe pango-1.57.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_packagedata unihash changed to aba1829c0c5fbaac3757ea5dd0bf70565aa0f14583cddbbc01400371e9dd0e39
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_spdx as unihash 4b2c79d88448bd353efec9364571c5cf4f7967b4779b2def32782ed467fb8ea9 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'd6797638c1bc3dd63d3ae7c921c20f4acddcf537cf18461829bb5e073caacfed', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '4b2c79d88448bd353efec9364571c5cf4f7967b4779b2def32782ed467fb8ea9'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_spdx unihash changed d6797638c1bc3dd63d3ae7c921c20f4acddcf537cf18461829bb5e073caacfed -> 4b2c79d88448bd353efec9364571c5cf4f7967b4779b2def32782ed467fb8ea9 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3972 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_create_spdx)
NOTE: recipe pango-1.57.1-r0: task do_create_spdx: Started
NOTE: recipe pango-1.57.1-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3973 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_configure_ptest_base)
NOTE: recipe librsvg-2.61.3-r0: task do_configure_ptest_base: Started
NOTE: recipe librsvg-2.61.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3974 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_compile)
NOTE: recipe librsvg-2.61.3-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3975 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_compile)
NOTE: recipe gtk+3-3.24.52-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3976 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_compile: Succeeded
NOTE: Running task 3977 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_install: Succeeded
NOTE: Running task 3978 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_populate_sysroot)
NOTE: Running task 3979 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_compile: Succeeded
NOTE: Running task 3980 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_install)
NOTE: recipe gtk+3-3.24.52-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_install: Succeeded
NOTE: Running task 3981 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_package)
NOTE: recipe gtk+3-3.24.52-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_package: Succeeded
NOTE: Running task 3988 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3989 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_package: Succeeded
NOTE: Running task 3990 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.52-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3999 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_install)
NOTE: recipe bluez5-5.86-r0: task do_install: Started
NOTE: recipe bluez5-5.86-r0: task do_install: Succeeded
NOTE: Running task 4000 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.86-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.86-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4001 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_populate_sysroot)
NOTE: Running task 4002 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_package)
NOTE: recipe bluez5-5.86-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.86-r0: task do_package: Started
NOTE: recipe bluez5-5.86-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_package: Succeeded
NOTE: Running task 4003 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_packagedata)
NOTE: recipe bluez5-5.86-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.86-r0: task do_packagedata: Succeeded
NOTE: Running task 4004 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_create_spdx)
NOTE: recipe bluez5-5.86-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.86-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_compile: Succeeded
NOTE: Running task 4005 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_compile_ptest_cargo)
NOTE: recipe librsvg-2.61.3-r0: task do_compile_ptest_cargo: Started
NOTE: recipe librsvg-2.61.3-r0: task do_compile_ptest_cargo: Succeeded
NOTE: Running task 4006 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_compile_ptest_base)
NOTE: recipe librsvg-2.61.3-r0: task do_compile_ptest_base: Started
NOTE: recipe librsvg-2.61.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4007 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_install)
NOTE: recipe librsvg-2.61.3-r0: task do_install: Started
NOTE: recipe librsvg-2.61.3-r0: task do_install: Succeeded
NOTE: Running task 4008 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_install_ptest_base)
NOTE: recipe librsvg-2.61.3-r0: task do_install_ptest_base: Started
NOTE: recipe librsvg-2.61.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4009 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_populate_sysroot)
NOTE: Running task 4010 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_install_ptest_cargo)
NOTE: recipe librsvg-2.61.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.61.3-r0: task do_install_ptest_cargo: Started
NOTE: recipe librsvg-2.61.3-r0: task do_install_ptest_cargo: Succeeded
NOTE: Running task 4011 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_package)
NOTE: recipe librsvg-2.61.3-r0: task do_package: Started
NOTE: recipe librsvg-2.61.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4012 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4013 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_configure: Started
NOTE: recipe librsvg-2.61.3-r0: task do_package: Succeeded
NOTE: Running task 4014 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_packagedata)
NOTE: recipe librsvg-2.61.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.61.3-r0: task do_packagedata: Succeeded
NOTE: Running task 4015 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_create_spdx)
NOTE: recipe librsvg-2.61.3-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_configure: Succeeded
NOTE: Running task 4016 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_compile: Started
NOTE: recipe librsvg-2.61.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_compile: Succeeded
NOTE: Running task 4017 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_install: Succeeded
NOTE: Running task 4018 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_package)
NOTE: Running task 4019 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4020 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4021 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_configure)
NOTE: recipe gtk4-4.22.4-r0: task do_configure: Started
NOTE: recipe gtk4-4.22.4-r0: task do_configure: Succeeded
NOTE: Running task 4022 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_compile)
NOTE: recipe gtk4-4.22.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_package: Succeeded
NOTE: Running task 4023 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_packagedata: Succeeded
NOTE: Running task 4024 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk4-4.22.4-r0: task do_compile: Succeeded
NOTE: Running task 4025 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_install)
NOTE: recipe gtk4-4.22.4-r0: task do_install: Started
NOTE: recipe gtk4-4.22.4-r0: task do_install: Succeeded
NOTE: Running task 4026 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_package)
NOTE: Running task 4027 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.22.4-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.22.4-r0: task do_package: Started
NOTE: recipe gtk4-4.22.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.22.4-r0: task do_package: Succeeded
NOTE: Running task 4028 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_packagedata)
NOTE: recipe gtk4-4.22.4-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.22.4-r0: task do_packagedata: Succeeded
NOTE: Running task 4029 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_create_spdx)
NOTE: Running task 4030 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_package_write_ipk)
NOTE: Running task 4031 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_package_write_deb)
NOTE: Running task 4032 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_package_write_rpm)
NOTE: recipe gtk4-4.22.4-r0: task do_create_spdx: Started
NOTE: Running task 4033 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_package_qa)
NOTE: recipe gtk4-4.22.4-r0: task do_package_write_ipk: Started
NOTE: recipe gtk4-4.22.4-r0: task do_package_write_deb: Started
NOTE: recipe gtk4-4.22.4-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.22.4-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.22.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 4034 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_create_package_spdx)
NOTE: recipe gtk4-4.22.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gtk4-4.22.4-r0: task do_create_package_spdx: Started
NOTE: recipe gtk4-4.22.4-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.22.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk4-4.22.4-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gtk4-4.22.4-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 4035 of 4035 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_build)
NOTE: Tasks Summary: Attempted 4035 tasks of which 3854 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 127 ERROR messages, returning a non-zero exit code.
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-src went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-dbg went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-ptest went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-staticdev went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-dev went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-doc went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-ab went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-af went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-ang went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-ar went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-as went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-ast went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-az went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-be went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-be+latin went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-bg went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-bn went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-bn-in went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-br went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-bs went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-ca went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-ca+valencia went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-crh went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-cs went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-csb went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-cy went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-da went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-de went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-dz went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-el went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-en+shaw went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-en-ca went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-en-gb went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-eo went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-es went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-et went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-eu went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-fa went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-fi went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-fr went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-fur went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-ga went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-gl went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-gu went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-he went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-hi went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-hr went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-hu went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-hy went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-ia went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-id went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-io went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-is went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-it went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-ja went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-ka went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-kab went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-kk went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-km went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-kn went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-ko went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-ku went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-li went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-lt went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-lv went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-mai went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-mi went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-mk went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-ml went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-mn went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-mr went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-ms went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-my went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-nb went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-nds went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-ne went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-nl went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-nn went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-nso went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-oc went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-or went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-pa went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-pl went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-ps went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-pt went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-pt-br went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-ro went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-ru went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-si went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-sk went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-sl went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-sq went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-sr went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-sr+ije went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-sr+latin went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-sv went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-ta went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-te went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-tg went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-th went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-tk went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-tr went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-tt went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-ug went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-uk went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-uz went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-vi went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-wa went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-xh went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-yi went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-zh-cn went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-zh-hk went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-locale-zh-tw went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-bin went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-loader-ani went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-loader-bmp went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-loader-gif went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-loader-icns went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-loader-ico went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-loader-pnm went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-loader-qtif went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-loader-tga went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-loader-xbm went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: QA Issue: Package version for package gdk-pixbuf-loader-xpm went backwards which would break package feeds (from 0:2.44.6-r0 to 0:2.44.5-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.44.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2188628300435857464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: FILELIST: removed "/usr/lib/.debug/libgtk-4.so.1.2200.2", added "/usr/lib/.debug/libgtk-4.so.1.2200.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PKGSIZE changed from 85035760 to 85042848 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PKGSIZE changed from 24950519 to 24954859 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-doc: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-doc: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ab: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ab: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-af: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-af: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-am: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-am: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-an: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-an: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ang: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ang: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ar: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ar: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-as: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-as: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ast: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ast: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az-ir: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az-ir: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be+latin: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be+latin: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bg: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bg: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn-in: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn-in: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-br: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-br: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bs: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bs: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca+valencia: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca+valencia: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-crh: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-crh: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cs: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cs: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cy: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cy: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-da: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-da: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PKGSIZE changed from 122106 to 125037 (+2%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-dz: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-dz: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-el: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-el: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en+shaw: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en+shaw: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-ca: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-ca: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-gb: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-gb: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eo: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eo: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-es: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-es: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-et: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-et: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fa: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fa: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fi: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fi: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fr: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fr: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fur: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fur: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ga: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ga: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gd: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gd: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gl: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gl: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gu: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gu: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-he: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-he: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hi: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hi: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hr: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hr: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hu: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hu: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hy: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hy: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ia: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ia: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-id: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-id: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ie: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ie: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-io: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-io: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-is: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-is: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-it: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-it: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ja: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ja: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ka: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ka: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kab: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kab: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kk: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kk: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-km: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-km: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kn: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kn: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ko: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ko: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ku: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ku: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ky: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ky: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lg: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lg: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-li: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-li: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lt: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lt: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lv: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lv: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mai: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mai: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mi: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mi: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mjw: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mjw: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mk: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mk: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ml: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ml: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mn: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mn: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mr: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mr: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ms: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ms: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-my: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-my: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nb: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nb: PKGSIZE changed from 78803 to 92821 (+18%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nb: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nds: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nds: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ne: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ne: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nl: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nl: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nn: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nn: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nso: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nso: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-oc: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-oc: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-or: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-or: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pa: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pa: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pl: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pl: PKGSIZE changed from 125673 to 125627 (-0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pl: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ps: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ps: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt-br: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt-br: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ro: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ro: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ru: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ru: PKGSIZE changed from 152946 to 153060 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ru: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-rw: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-rw: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-si: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-si: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sk: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sk: PKGSIZE changed from 122324 to 125209 (+2%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sk: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sl: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sl: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sq: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sq: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+ije: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+ije: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sv: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sv: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ta: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ta: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-te: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-te: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tg: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tg: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tr: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tr: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tt: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tt: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uk: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uk: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ur: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ur: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-vi: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-vi: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-wa: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-wa: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-xh: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-xh: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-yi: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-yi: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-cn: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-cn: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-hk: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-hk: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-tw: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-tw: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: FILELIST: directory renamed /usr/src/debug/gtk4/4.22.2/gdk/loaders -> /usr/src/debug/gtk4/4.22.4/gdk/loaders, directory renamed /usr/src/debug/gtk4/4.22.2/tools -> /usr/src/debug/gtk4/4.22.4/tools, directory renamed /usr/src/debug/gtk4/4.22.2/gtk -> /usr/src/debug/gtk4/4.22.4/gtk, directory renamed /usr/src/debug/gtk4/4.22.2/testsuite/reftests -> /usr/src/debug/gtk4/4.22.4/testsuite/reftests, directory renamed /usr/src/debug/gtk4/4.22.2/gtk/css -> /usr/src/debug/gtk4/4.22.4/gtk/css, directory renamed /usr/src/debug/gtk4/4.22.2/gtk/timsort -> /usr/src/debug/gtk4/4.22.4/gtk/timsort, directory renamed /usr/src/debug/gtk4/4.22.2/gdk/x11 -> /usr/src/debug/gtk4/4.22.4/gdk/x11, directory renamed /usr/src/debug/gtk4/4.22.2/gsk/gpu/shaders -> /usr/src/debug/gtk4/4.22.4/gsk/gpu/shaders, directory renamed /usr/src/debug/gtk4/4.22.2/gtk/media -> /usr/src/debug/gtk4/4.22.4/gtk/media, directory renamed /usr/src/debug/gtk4/4.22.2/gdk/wayland -> /usr/src/
 debug/gtk4/4.22.4/gdk/wayland, directory renamed /usr/src/debug/gtk4/4.22.2/gtk/a11y/atspi -> /usr/src/debug/gtk4/4.22.4/gtk/a11y/atspi, directory renamed /usr/src/debug/gtk4/4.22.2/gtk/print/backends -> /usr/src/debug/gtk4/4.22.4/gtk/print/backends, directory renamed /usr/src/debug/gtk4/4.22.2/gsk/gl -> /usr/src/debug/gtk4/4.22.4/gsk/gl, directory renamed /usr/src/debug/gtk4/4.22.2/gtk/roaring -> /usr/src/debug/gtk4/4.22.4/gtk/roaring, directory renamed /usr/src/debug/gtk4/4.22.2/gdk -> /usr/src/debug/gtk4/4.22.4/gdk, directory renamed /usr/src/debug/gtk4/4.22.2/gsk/gpu -> /usr/src/debug/gtk4/4.22.4/gsk/gpu, directory renamed /usr/src/debug/gtk4/4.22.2/gdk/deprecated -> /usr/src/debug/gtk4/4.22.4/gdk/deprecated, directory renamed /usr/src/debug/gtk4/4.22.2/gtk/deprecated -> /usr/src/debug/gtk4/4.22.4/gtk/deprecated, directory renamed /usr/src/debug/gtk4/4.22.2/gtk/a11y -> /usr/src/debug/gtk4/4.22.4/gtk/a11y, directory renamed /usr/src/debug/gtk4/4.22.2/gtk/inspector -> /usr/src/deb
 ug/gtk4/4.22.4/gtk/inspector, directory renamed /usr/src/debug/gtk4/4.22.2/gsk -> /usr/src/debug/gtk4/4.22.4/gsk, directory renamed /usr/src/debug/gtk4/4.22.2/gtk/print -> /usr/src/debug/gtk4/4.22.4/gtk/print
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PKGSIZE changed from 52214051 to 52232499 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4-staticdev: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-staticdev: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.2200.2", added "/usr/lib/libgtk-4.so.1.2200.4"
packages/x86-64-v3-poky-linux/gtk4/gtk4: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4: PKGSIZE changed from 19784043 to 19783943 (-0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4: PV changed from "4.22.2" to "4.22.4"
packages/x86-64-v3-poky-linux/gtk4: PKGV changed from 4.22.2 [default] to 4.22.4 [default]
packages/x86-64-v3-poky-linux/gtk4: SRC_URI changed from "https://download.gnome.org/sources//gtk/4.22/gtk-4.22.2.tar.xz;name=archive" to "https://download.gnome.org/sources//gtk/4.22/gtk-4.22.4.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/gtk4: PV changed from "4.22.2" to "4.22.4"
Changes to packages/x86-64-v3-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.2200.2 to libgtk-4.so.1.2200.4
  /usr/lib/libgtk-4.so.1.2200.2 moved to /usr/lib/libgtk-4.so.1.2200.4

--===============2188628300435857464==--

