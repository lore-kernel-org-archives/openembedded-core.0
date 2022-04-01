Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B58C4707A
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:43 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.10520.1648819420538139019
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=epucFM/g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 0101017fe54bbee7-2947b65b-b3bc-4934-898d-5a2458480eac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819421;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L3MS3ChoOLsDG4szDxJNKuU+KTFcLiNvejGwVp9+zGQ=;
	b=epucFM/goVjSTIVdHJsFnq3K5Ux4CWeLJFVZYH3fC5XdNJUWMhCq8KKKXT+MaD6G
	DYyLb4azxng9QmkTMnnpPbP6pQrsDXAprT1ESwORQ3577zk/38OnYFFLGW7mrvT/wB1
	jaYX/F7MqNWD4DNZBP1tzM3l9rB8XltZdToQY19E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819421;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L3MS3ChoOLsDG4szDxJNKuU+KTFcLiNvejGwVp9+zGQ=;
	b=Ny3itRBsFwJodh0jk91q3ABWgb4GIQANBGnx70pkDtH5XbRd9LUupN+xBNvQwxeS
	0RDFfiAs13obchaFB57aIkLkiH3Hrg0f3kOUPw0KqyImq61sbLXTlLAoo5Y6GV/ez1r
	/OGjXD/pGTajUfz0KRn7Yz4XivGfnat/d1o0dZhY=
Content-Type: multipart/mixed; boundary="===============8774774652772910678=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libhandy: upgrading to 1.6.1 SUCCEEDED
Message-ID: 
 <0101017fe54bbee7-2947b65b-b3bc-4934-898d-5a2458480eac-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163915

--===============8774774652772910678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libhandy* to *1.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libhandy-upgrade-1.5.0-1.6.1.patch
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
--===============8774774652772910678==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libhandy-upgrade-1.5.0-1.6.1.patch"

From 448ddc86691e17c3e2aa045e12870369e944ae74 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 11:09:02 +0000
Subject: [PATCH] libhandy: upgrade 1.5.0 -> 1.6.1

---
 .../libhandy/0001-Add-private-headers.patch   | 37 -------------------
 .../{libhandy_1.5.0.bb => libhandy_1.6.1.bb}  |  6 +--
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch
 rename meta/recipes-gnome/libhandy/{libhandy_1.5.0.bb => libhandy_1.6.1.bb} (89%)

diff --git a/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch b/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch
deleted file mode 100644
index 7b2a512738..0000000000
--- a/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From e7c3e8fa00f6a68b2e0629db5ee115e641ea710e Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 8 Dec 2021 07:35:52 +0000
-Subject: [PATCH] Add private headers
-
-After the commit(8157ecc Separate public and private enums) introduced,
-there comes a race as below:
- | In file included from ../git/src/hdy-settings.c:11:
- | ../git/src/hdy-settings-private.h:16:10: fatal error: hdy-enums-private.h: No such file or directory
- |    16 | #include "hdy-enums-private.h"
-
-So also add private headers like private sources to libhandy_sources to
-fix the issue.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libhandy/-/merge_requests/796]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index d087323..6f11f27 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -64,7 +64,7 @@ hdy_private_enums = gnome.mkenums('hdy-enums-private',
- )
- 
- libhandy_public_sources += [hdy_public_enums[0]]
--libhandy_private_sources += [hdy_private_enums[0]]
-+libhandy_private_sources += hdy_private_enums
- libhandy_generated_headers += [hdy_public_enums[1]]
- 
- src_headers = [
--- 
-2.32.0
-
diff --git a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb b/meta/recipes-gnome/libhandy/libhandy_1.6.1.bb
similarity index 89%
rename from meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.6.1.bb
index 722593dfb1..06b2b467fe 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.6.1.bb
@@ -9,10 +9,8 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=master \
-           file://0001-Add-private-headers.patch \
-"
-SRCREV = "8fa8306a79215fc6ebf2483145da98bf9b2495ab"
+SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=libhandy-1-6"
+SRCREV = "4186dae5570cf8e73cf8a145236240eec3a237b5"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+))"
-- 
2.27.0


--===============8774774652772910678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libhandy: PACKAGES: added "libhandy-locale-cs"
packages/core2-32-poky-linux/libhandy/libhandy-locale-sl: PKGSIZE changed from 7563 to 11786 (+56%)

--===============8774774652772910678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libhandy: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy: PACKAGES: added "libhandy-locale-cs"
packages/core2-32-poky-linux/libhandy: SRC_URI changed from "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=master file://0001-Add-private-headers.patch" to "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=libhandy-1-6"
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PKGSIZE changed from 2258612 to 2263356 (+0%)
packages/core2-32-poky-linux/libhandy/libhandy-dev: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-dev: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-dev: PKGSIZE changed from 847705 to 893298 (+5%)
packages/core2-32-poky-linux/libhandy/libhandy-doc: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-doc: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-examples: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-examples: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-ca: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-ca: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-de: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-de: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-en-gb: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-en-gb: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-es: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-es: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-es: PKGSIZE changed from 25814 to 26521 (+3%)
packages/core2-32-poky-linux/libhandy/libhandy-locale-eu: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-eu: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-eu: PKGSIZE changed from 23711 to 24821 (+5%)
packages/core2-32-poky-linux/libhandy/libhandy-locale-fa: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-fa: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-fi: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-fi: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-fr: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-fr: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-fur: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-fur: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-gl: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-gl: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-hu: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-hu: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-hu: PKGSIZE changed from 25449 to 26125 (+3%)
packages/core2-32-poky-linux/libhandy/libhandy-locale-id: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-id: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-nl: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-nl: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-oc: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-oc: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-pl: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-pl: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-pt-br: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-pt-br: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-pt: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-pt: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-ro: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-ro: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-ro: PKGSIZE changed from 25011 to 25184 (+1%)
packages/core2-32-poky-linux/libhandy/libhandy-locale-sl: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-sl: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-sl: PKGSIZE changed from 7563 to 11786 (+56%)
packages/core2-32-poky-linux/libhandy/libhandy-locale-sr: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-sr: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-sv: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-sv: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-uk: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-uk: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-zh-cn: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-zh-cn: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-src: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-src: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy-src: PKGSIZE changed from 3566152 to 3571435 (+0%)
packages/core2-32-poky-linux/libhandy/libhandy-staticdev: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-staticdev: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy: PKGV changed from 1.5.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy: PV changed from "1.5.0" to "1.6.1"
packages/core2-32-poky-linux/libhandy/libhandy: PKGSIZE changed from 888912 to 897240 (+1%)

--===============8774774652772910678==--

