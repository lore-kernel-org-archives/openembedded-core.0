Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E1DC54EC4
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:55 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.11656.1650052688290141936
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VuX68Qh3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101802ecdedf1-4c7181df-c2bc-470f-a707-e597132d2cdb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EYUVxnk4o/M/Blix1SU+h3GGROPXblTXJ5K7zen/dc8=;
	b=VuX68Qh38/TwU/oyJ2F/a0+TDZqxOoNnEh2b6nwVB817MlCcAM7tJjg0p3aWvcAm
	MCxxqmCfli8OMitwEEyDVbSnFSlcKRDPZbDENzi2osMlChOZnlkIs2rBncCncHulUUE
	yA2Gm1+XltcxlyHlgvg82hW6F0Ek61jDO1zCGWzA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EYUVxnk4o/M/Blix1SU+h3GGROPXblTXJ5K7zen/dc8=;
	b=Efc519NGMgzO+E3juUbm6USSqLuP4Vo+ztYMD6lAS8+j0o9QwXpr6K71cDMAj1Sk
	0TvE3a67tf9eBlrrjOx8BkIOKbt4KW1YnsazEEqDEv7A1Gmt9cH2VvhbZaZFH/TNOB+
	/ODGE5WrdTyMiZpa64DwOc6daI+fEuYD5cMXDu4o=
Content-Type: multipart/mixed; boundary="===============5715037854048269983=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap: upgrading to 2.64 SUCCEEDED
Message-ID: 
 <010101802ecdedf1-4c7181df-c2bc-470f-a707-e597132d2cdb-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:09 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164509

--===============5715037854048269983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcap* to *2.64* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcap-upgrade-2.63-2.64.patch
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
--===============5715037854048269983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libcap/libcap: FILELIST: removed "/lib/libcap.so.2.63 /usr/lib/libpsx.so.2.63", added "/lib/libcap.so.2.64 /usr/lib/libpsx.so.2.64"
Changes to packages/core2-32-poky-linux/libcap (sysroot):
  /lib/libcap.so.2 changed symlink target from libcap.so.2.63 to libcap.so.2.64
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.63 to libpsx.so.2.64
  /lib/libcap.so.2.63 moved to /lib/libcap.so.2.64
  /usr/lib/libpsx.so.2.63 moved to /usr/lib/libpsx.so.2.64
Changes to packages/x86_64-linux/libcap-native (sysroot):
  /usr/lib/libcap.so.2 changed symlink target from libcap.so.2.63 to libcap.so.2.64
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.63 to libpsx.so.2.64
  /usr/lib/libcap.so.2.63 moved to /usr/lib/libcap.so.2.64
  /usr/lib/libpsx.so.2.63 moved to /usr/lib/libpsx.so.2.64

--===============5715037854048269983==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libcap-upgrade-2.63-2.64.patch"

From 8bcff3181b63d89ec1c8a78f6884e714ab7632c8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 19:28:47 +0000
Subject: [PATCH] libcap: upgrade 2.63 -> 2.64

---
 ...1-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch | 2 +-
 meta/recipes-support/libcap/{libcap_2.63.bb => libcap_2.64.bb}  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.63.bb => libcap_2.64.bb} (96%)

diff --git a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
index 9884fb5641..e6dd1331f8 100644
--- a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
+++ b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
@@ -1,4 +1,4 @@
-From fc60e000169618a4adced845b9462d36ced1efdd Mon Sep 17 00:00:00 2001
+From f39b5529e76dfff4e4c1c65f9dd83cc9f9360211 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 14 Oct 2021 15:57:36 +0800
 Subject: [PATCH] nativesdk-libcap: Raise the size of arrays containing dl
diff --git a/meta/recipes-support/libcap/libcap_2.63.bb b/meta/recipes-support/libcap/libcap_2.64.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.63.bb
rename to meta/recipes-support/libcap/libcap_2.64.bb
index 9e341c4bd0..7690d3e9a5 100644
--- a/meta/recipes-support/libcap/libcap_2.63.bb
+++ b/meta/recipes-support/libcap/libcap_2.64.bb
@@ -20,7 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "0c637b8f44fc7d8627787e9cf57f15ac06c1ddccb53e41feec5496be3466f77f"
+SRC_URI[sha256sum] = "c8465e1f0b068d5fc06199231135ccac7adb56d662b1de93589252e8cd071e13"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.27.0


--===============5715037854048269983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libcap: SRC_URI changed from "https://cdn.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.63.tar.xz file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch file://0002-tests-do-not-run-target-executables.patch" to "https://cdn.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.64.tar.xz file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch file://0002-tests-do-not-run-target-executables.patch"
packages/core2-32-poky-linux/libcap: PKGV changed from 2.63 [default] to 2.64 [default]
packages/core2-32-poky-linux/libcap: PV changed from "2.63" to "2.64"
packages/core2-32-poky-linux/libcap/libcap-bin: PKGV changed from 2.63 [default] to 2.64 [default]
packages/core2-32-poky-linux/libcap/libcap-bin: PV changed from "2.63" to "2.64"
packages/core2-32-poky-linux/libcap/libcap-dbg: FILELIST: removed "/lib/.debug/libcap.so.2.63 /usr/lib/.debug/libpsx.so.2.63", added "/lib/.debug/libcap.so.2.64 /usr/lib/.debug/libpsx.so.2.64"
packages/core2-32-poky-linux/libcap/libcap-dbg: PKGSIZE changed from 251204 to 252256 (+0%)
packages/core2-32-poky-linux/libcap/libcap-dbg: PKGV changed from 2.63 [default] to 2.64 [default]
packages/core2-32-poky-linux/libcap/libcap-dbg: PV changed from "2.63" to "2.64"
packages/core2-32-poky-linux/libcap/libcap-dev: PKGSIZE changed from 12565 to 12677 (+1%)
packages/core2-32-poky-linux/libcap/libcap-dev: PKGV changed from 2.63 [default] to 2.64 [default]
packages/core2-32-poky-linux/libcap/libcap-dev: PV changed from "2.63" to "2.64"
packages/core2-32-poky-linux/libcap/libcap-doc: PKGSIZE changed from 71304 to 71477 (+0%)
packages/core2-32-poky-linux/libcap/libcap-doc: PKGV changed from 2.63 [default] to 2.64 [default]
packages/core2-32-poky-linux/libcap/libcap-doc: PV changed from "2.63" to "2.64"
packages/core2-32-poky-linux/libcap/libcap-locale: PKGV changed from 2.63 [default] to 2.64 [default]
packages/core2-32-poky-linux/libcap/libcap-locale: PV changed from "2.63" to "2.64"
packages/core2-32-poky-linux/libcap/libcap-src: PKGSIZE changed from 215737 to 217229 (+1%)
packages/core2-32-poky-linux/libcap/libcap-src: PKGV changed from 2.63 [default] to 2.64 [default]
packages/core2-32-poky-linux/libcap/libcap-src: PV changed from "2.63" to "2.64"
packages/core2-32-poky-linux/libcap/libcap-staticdev: PKGSIZE changed from 151964 to 151104 (-1%)
packages/core2-32-poky-linux/libcap/libcap-staticdev: PKGV changed from 2.63 [default] to 2.64 [default]
packages/core2-32-poky-linux/libcap/libcap-staticdev: PV changed from "2.63" to "2.64"
packages/core2-32-poky-linux/libcap/libcap: FILELIST: removed "/lib/libcap.so.2.63 /usr/lib/libpsx.so.2.63", added "/lib/libcap.so.2.64 /usr/lib/libpsx.so.2.64"
packages/core2-32-poky-linux/libcap/libcap: PKGV changed from 2.63 [default] to 2.64 [default]
packages/core2-32-poky-linux/libcap/libcap: PV changed from "2.63" to "2.64"
Changes to packages/core2-32-poky-linux/libcap (sysroot):
  /lib/libcap.so.2 changed symlink target from libcap.so.2.63 to libcap.so.2.64
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.63 to libpsx.so.2.64
  /lib/libcap.so.2.63 moved to /lib/libcap.so.2.64
  /usr/lib/libpsx.so.2.63 moved to /usr/lib/libpsx.so.2.64
Changes to packages/x86_64-linux/libcap-native (sysroot):
  /usr/lib/libcap.so.2 changed symlink target from libcap.so.2.63 to libcap.so.2.64
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.63 to libpsx.so.2.64
  /usr/lib/libcap.so.2.63 moved to /usr/lib/libcap.so.2.64
  /usr/lib/libpsx.so.2.63 moved to /usr/lib/libpsx.so.2.64

--===============5715037854048269983==--

