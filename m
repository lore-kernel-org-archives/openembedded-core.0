Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.4464.1621074783442767245
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id A12BB38C13EB
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-tools: upgrading to 2021.1 SUCCEEDED
Message-ID: <MADEUP.167F36EDA0016EEA.8202@lists.openembedded.org>
X-Groupsio-MsgNum: 151822
Content-Type: multipart/mixed; boundary="===============1605658870101324475=="

--===============1605658870101324475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *spirv-tools* to *2021.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-tools-upgrade-2020.7-2021.1.patch
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

--===============1605658870101324475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/spirv-tools: PKGV changed from 2020.7 [default] to 2021.1 [default]
packages/core2-32-poky-linux/spirv-tools: PV changed from "2020.7" to "2021.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-dbg: PKGV changed from 2020.7 [default] to 2021.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-dbg: PV changed from "2020.7" to "2021.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-dbg: PKGSIZE changed from 230425408 to 231661376 (+1%)
packages/core2-32-poky-linux/spirv-tools/spirv-tools-dev: PKGV changed from 2020.7 [default] to 2021.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-dev: PV changed from "2020.7" to "2021.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-dev: PKGSIZE changed from 134336 to 135104 (+1%)
packages/core2-32-poky-linux/spirv-tools/spirv-tools-doc: PKGV changed from 2020.7 [default] to 2021.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-doc: PV changed from "2020.7" to "2021.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-lesspipe: PKGV changed from 2020.7 [default] to 2021.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-lesspipe: PV changed from "2020.7" to "2021.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-locale: PKGV changed from 2020.7 [default] to 2021.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-locale: PV changed from "2020.7" to "2021.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-src: PKGV changed from 2020.7 [default] to 2021.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-src: PV changed from "2020.7" to "2021.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-src: PKGSIZE changed from 4739692 to 4754405 (+0%)
packages/core2-32-poky-linux/spirv-tools/spirv-tools-staticdev: PKGV changed from 2020.7 [default] to 2021.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-staticdev: PV changed from "2020.7" to "2021.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools: PKGV changed from 2020.7 [default] to 2021.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools: PV changed from "2020.7" to "2021.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools: PKGSIZE changed from 6323166 to 6347742 (+0%)

--===============1605658870101324475==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-spirv-tools-upgrade-2020.7-2021.1.patch"

From a970cee092aa312999ce96ab0f5b52dca1c70203 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 07:14:11 +0000
Subject: [PATCH] spirv-tools: upgrade 2020.7 -> 2021.1

---
 .../spir/{spirv-tools_2020.7.bb => spirv-tools_2021.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-tools_2020.7.bb => spirv-tools_2021.1.bb} (96%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_2020.7.bb b/meta/recipes-graphics/spir/spirv-tools_2021.1.bb
similarity index 96%
rename from meta/recipes-graphics/spir/spirv-tools_2020.7.bb
rename to meta/recipes-graphics/spir/spirv-tools_2021.1.bb
index 8be698533a..5795d93e53 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2020.7.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2021.1.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "2573fd781b5408cd7fe5755a78b60d767a748ff9"
+SRCREV = "4b3707b788c84449a55f67257ae6aab3ca3552cb"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git \
            file://0001-fix-strncpy-bound-error.patch \
           "
-- 
2.27.0


--===============1605658870101324475==--
