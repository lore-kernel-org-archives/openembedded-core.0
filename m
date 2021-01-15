Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.702.1610713822889946820
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0BAA538C1276
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] p11-kit: upgrading to 0.23.22 SUCCEEDED
Message-ID: <MADEUP.165A67B0E43CDCA3.32579@lists.openembedded.org>
X-Groupsio-MsgNum: 146818
Content-Type: multipart/mixed; boundary="===============7028109247250620029=="

--===============7028109247250620029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *p11-kit* to *0.23.22* has Succeeded.

Next steps:
    - apply the patch: git am 0001-p11-kit-upgrade-0.23.21-0.23.22.patch
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

--===============7028109247250620029==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-p11-kit-upgrade-0.23.21-0.23.22.patch"

From b339775b3333f050713044ca6e0b7cf4822d4339 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 12:25:46 +0000
Subject: [PATCH] p11-kit: upgrade 0.23.21 -> 0.23.22

---
 .../p11-kit/{p11-kit_0.23.21.bb => p11-kit_0.23.22.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.23.21.bb => p11-kit_0.23.22.bb} (87%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
similarity index 87%
rename from meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
index b1fd2334b2..050ef2f3ed 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
@@ -8,8 +8,8 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 
 DEPENDS_append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
-SRC_URI = "git://github.com/p11-glue/p11-kit"
-SRCREV = "fd8b56f3ee971f94dc6fc95411fc01e1c12153ab"
+SRC_URI = "git://github.com/p11-glue/p11-kit;branch=0.23"
+SRCREV = "bd97afbfe28d5fbbde95ce36ff7a8834fc0291ee"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.27.0


--===============7028109247250620029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/p11-kit: SRC_URI changed from "git://github.com/p11-glue/p11-kit" to "git://github.com/p11-glue/p11-kit;branch=0.23"
packages/core2-32-poky-linux/p11-kit: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-bash-completion: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-bash-completion: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-dbg: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-dbg: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-dbg: PKGSIZE changed from 7405784 to 7412816 (+0%)
packages/core2-32-poky-linux/p11-kit/p11-kit-dev: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-dev: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-doc: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-doc: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ar: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ar: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-as: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-as: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ast: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ast: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-az: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-az: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-bg: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-bg: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-bn-in: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-bn-in: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ca+valencia: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ca+valencia: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ca: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ca: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-cs: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-cs: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-cy: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-cy: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-da: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-da: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-de: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-de: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-el: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-el: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-en-gb: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-en-gb: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-eo: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-eo: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-es: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-es: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-et: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-et: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-eu: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-eu: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fa: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fa: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fi: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fi: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fo: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fo: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fr: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fr: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fur: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fur: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ga: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ga: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-gl: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-gl: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-gu: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-gu: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-he: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-he: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hi: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hi: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hr: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hr: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hu: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hu: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ia: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ia: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-id: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-id: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-it: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-it: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ja: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ja: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ka: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ka: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-kk: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-kk: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-kn: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-kn: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ko: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ko: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-lt: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-lt: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-lv: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-lv: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ml: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ml: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-mr: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-mr: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ms: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ms: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nb: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nb: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nl: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nl: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nn: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nn: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-oc: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-oc: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-or: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-or: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pa: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pa: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pl: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pl: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pt-br: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pt-br: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pt: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pt: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ro: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ro: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ru: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ru: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sk: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sk: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sl: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sl: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sq: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sq: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sr+latin: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sr+latin: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sr: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sr: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sv: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sv: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ta: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ta: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-te: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-te: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-th: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-th: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-tr: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-tr: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-uk: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-uk: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-vi: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-vi: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-wa: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-wa: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-cn: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-cn: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-hk: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-hk: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-tw: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-tw: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-src: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-src: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-src: PKGSIZE changed from 1470733 to 1471776 (+0%)
packages/core2-32-poky-linux/p11-kit/p11-kit-staticdev: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-staticdev: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit: PKGSIZE changed from 2966206 to 2967359 (+0%)

--===============7028109247250620029==--
