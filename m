Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.1330.1618510599872298479
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id C5EEA38C13AA
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:40 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] babeltrace2: upgrading to 2.0.4 SUCCEEDED
Message-ID: <MADEUP.16761AD173DD689F.4047@lists.openembedded.org>
X-Groupsio-MsgNum: 150563
Content-Type: multipart/mixed; boundary="===============7517392268530005596=="

--===============7517392268530005596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *babeltrace2* to *2.0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-babeltrace2-upgrade-2.0.3-2.0.4.patch
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

--===============7517392268530005596==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-babeltrace2-upgrade-2.0.3-2.0.4.patch"

From 9b1a58677134c36555e7f9c6e712375c246bf1ca Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 15:15:31 +0000
Subject: [PATCH] babeltrace2: upgrade 2.0.3 -> 2.0.4

---
 .../lttng/{babeltrace2_2.0.3.bb => babeltrace2_2.0.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.3.bb => babeltrace2_2.0.4.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb
rename to meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
index 32ba75bf36..7fb524eeb0 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0 \
            file://0001-tests-do-not-run-test-applications-from-.libs.patch \
            file://0001-Make-manpages-multilib-identical.patch \
            "
-SRCREV = "91d154476e66735d705adda9ca5cbf5b5eea5940"
+SRCREV = "23e8cf4e6fdc1d0b230e964dafac08a57e6228e6"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
-- 
2.27.0


--===============7517392268530005596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/babeltrace2/babeltrace2-dbg: PV changed from "2.0.3" to "2.0.4"
packages/core2-32-poky-linux/babeltrace2/babeltrace2-dbg: PKGV changed from 2.0.3 [default] to 2.0.4 [default]
packages/core2-32-poky-linux/babeltrace2/babeltrace2-dbg: PKGSIZE changed from 7821172 to 7870028 (+1%)
packages/core2-32-poky-linux/babeltrace2/babeltrace2-dev: PV changed from "2.0.3" to "2.0.4"
packages/core2-32-poky-linux/babeltrace2/babeltrace2-dev: PKGV changed from 2.0.3 [default] to 2.0.4 [default]
packages/core2-32-poky-linux/babeltrace2/babeltrace2-dev: PKGSIZE changed from 1185972 to 1185993 (+0%)
packages/core2-32-poky-linux/babeltrace2/babeltrace2-doc: PV changed from "2.0.3" to "2.0.4"
packages/core2-32-poky-linux/babeltrace2/babeltrace2-doc: PKGV changed from 2.0.3 [default] to 2.0.4 [default]
packages/core2-32-poky-linux/babeltrace2/babeltrace2-doc: PKGSIZE changed from 392698 to 393922 (+0%)
packages/core2-32-poky-linux/babeltrace2/babeltrace2-locale: PV changed from "2.0.3" to "2.0.4"
packages/core2-32-poky-linux/babeltrace2/babeltrace2-locale: PKGV changed from 2.0.3 [default] to 2.0.4 [default]
packages/core2-32-poky-linux/babeltrace2/babeltrace2-ptest: PV changed from "2.0.3" to "2.0.4"
packages/core2-32-poky-linux/babeltrace2/babeltrace2-ptest: PKGV changed from 2.0.3 [default] to 2.0.4 [default]
packages/core2-32-poky-linux/babeltrace2/babeltrace2-ptest: PKGSIZE changed from 11345745 to 11357223 (+0%)
packages/core2-32-poky-linux/babeltrace2/babeltrace2-src: PV changed from "2.0.3" to "2.0.4"
packages/core2-32-poky-linux/babeltrace2/babeltrace2-src: PKGV changed from 2.0.3 [default] to 2.0.4 [default]
packages/core2-32-poky-linux/babeltrace2/babeltrace2-src: PKGSIZE changed from 5358731 to 5368028 (+0%)
packages/core2-32-poky-linux/babeltrace2/babeltrace2-staticdev: PV changed from "2.0.3" to "2.0.4"
packages/core2-32-poky-linux/babeltrace2/babeltrace2-staticdev: PKGV changed from 2.0.3 [default] to 2.0.4 [default]
packages/core2-32-poky-linux/babeltrace2/babeltrace2: PV changed from "2.0.3" to "2.0.4"
packages/core2-32-poky-linux/babeltrace2/babeltrace2: PKGV changed from 2.0.3 [default] to 2.0.4 [default]
packages/core2-32-poky-linux/babeltrace2/babeltrace2: PKGSIZE changed from 2185785 to 2193977 (+0%)
packages/core2-32-poky-linux/babeltrace2: PV changed from "2.0.3" to "2.0.4"
packages/core2-32-poky-linux/babeltrace2: PKGV changed from 2.0.3 [default] to 2.0.4 [default]

--===============7517392268530005596==--
