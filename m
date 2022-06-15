Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1648ECCA493
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:46 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web08.4462.1655298221974213603
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=m+ABrkru;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 010101816776645a-503be1f9-c150-4037-bf4e-c36fa5fee518-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cEUxGPHxzKgms2Kmik2jbeuXALHcrvyJfC6Q5wVVHFw=;
	b=m+ABrkruaLF+96FBKuAwgrp38iBrdc1UEc22YSWg88RXsVPZxHwpTvFzl3FWrXhN
	OKan6DUqcZmPK/tagsot61poj471PHXiFsKqpnZRfzwMS0vOOxD+X0LjsSdKKUsaALX
	06QQLkwe0p+kcL1M5XP3HK0VtcPX69Dc6ZJyb0nQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cEUxGPHxzKgms2Kmik2jbeuXALHcrvyJfC6Q5wVVHFw=;
	b=FnorrVQb6KcD+jjatLu2wrr1KfXIY16HCWiW/0F7udh6z/EAmi/uS4E7y5THgMuk
	V6lq8dV5MEEWq2+Jp0ggDqFtyvhypxvCLc6CaeMN1mk2aMJVHN9SiuQaoph9fNdwQiP
	BKMOJDUE3CYdtekK2zHkXUc2TKfofSSK1xTlY92g=
Content-Type: multipart/mixed; boundary="===============5821530336607828809=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sudo: upgrading to 1.9.11p2 SUCCEEDED
Message-ID: 
 <010101816776645a-503be1f9-c150-4037-bf4e-c36fa5fee518-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166960

--===============5821530336607828809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sudo* to *1.9.11p2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sudo-upgrade-1.9.10-1.9.11p2.patch
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
--===============5821530336607828809==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-sudo-upgrade-1.9.10-1.9.11p2.patch"

From 526132139ad238a3c434d0b02c35dd28f9240413 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 09:57:31 +0000
Subject: [PATCH] sudo: upgrade 1.9.10 -> 1.9.11p2

---
 meta/recipes-extended/sudo/{sudo_1.9.10.bb => sudo_1.9.11p2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.10.bb => sudo_1.9.11p2.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.10.bb b/meta/recipes-extended/sudo/sudo_1.9.11p2.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.10.bb
rename to meta/recipes-extended/sudo/sudo_1.9.11p2.bb
index aa0d814ed7..b3eae4a0fa 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.10.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.11p2.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "44a1461098e7c7b8e6ac597499c24fb2e43748c0c139a8b4944e57d1349a64f4"
+SRC_URI[sha256sum] = "a21918eb9fc0063794f6887464fa2d924ab6d192e19063191a429605c22791d2"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.31.1


--===============5821530336607828809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sudo: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo: PACKAGES: added "sudo-locale-ka"
packages/core2-32-poky-linux/sudo: SRC_URI changed from "https://www.sudo.ws/dist/sudo-1.9.10.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch file://0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch" to "https://www.sudo.ws/dist/sudo-1.9.11p2.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch file://0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch"
packages/core2-32-poky-linux/sudo/sudo-dbg: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-dbg: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-dbg: PKGSIZE changed from 4121852 to 4186952 (+2%)
packages/core2-32-poky-linux/sudo/sudo-dev: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-dev: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-doc: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-doc: FILELIST: removed "/usr/share/man/man8/sudo_plugin.8", added "/usr/share/man/man5/sudo_plugin.5"
packages/core2-32-poky-linux/sudo/sudo-doc: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-doc: PKGSIZE changed from 2833570 to 2892189 (+2%)
packages/core2-32-poky-linux/sudo/sudo-lib: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-lib: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-lib: PKGSIZE changed from 973162 to 981856 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-ast: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-ast: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ca: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-ca: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PKGSIZE changed from 99570 to 99969 (+0%)
packages/core2-32-poky-linux/sudo/sudo-locale-da: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-da: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-de: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-de: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-de: PKGSIZE changed from 104019 to 104520 (+0%)
packages/core2-32-poky-linux/sudo/sudo-locale-el: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-el: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PKGSIZE changed from 96073 to 96419 (+0%)
packages/core2-32-poky-linux/sudo/sudo-locale-es: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-es: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-eu: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-eu: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fa: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-fa: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PKGSIZE changed from 108366 to 108759 (+0%)
packages/core2-32-poky-linux/sudo/sudo-locale-fur: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-fur: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-gl: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-gl: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PKGSIZE changed from 100723 to 101093 (+0%)
packages/core2-32-poky-linux/sudo/sudo-locale-hu: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-hu: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-it: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-it: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PKGSIZE changed from 104176 to 104831 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-lt: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-lt: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nb: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-nb: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nl: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-nl: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nn: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-nn: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PKGSIZE changed from 100862 to 101361 (+0%)
packages/core2-32-poky-linux/sudo/sudo-locale-pt-br: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-pt-br: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PKGSIZE changed from 87444 to 104742 (+20%)
packages/core2-32-poky-linux/sudo/sudo-locale-ru: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-ru: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sk: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-sk: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sl: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-sl: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-tr: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-tr: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PKGSIZE changed from 136677 to 137281 (+0%)
packages/core2-32-poky-linux/sudo/sudo-locale-vi: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-vi: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-vi: PKGSIZE changed from 80097 to 81921 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-src: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-src: FILELIST: directory renamed /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/include -> /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/include, directory renamed /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/include/protobuf-c -> /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/include/protobuf-c, directory renamed /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/plugins/group_file -> /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/plugins/group_file, directory renamed /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/plugins/system_group -> /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/plugins/system_group, directory renamed /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/logsrvd -> /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/logsrvd, directory renamed /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/lib/eventlog -> /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/lib/eventlog, directory renamed /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/plugins/sudoers -> /usr/src/debug/sudo/1.9.11p2-
 r0/sudo-1.9.11p2/plugins/sudoers, directory renamed /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/plugins/sample_approval -> /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/plugins/sample_approval, directory renamed /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/plugins/audit_json -> /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/plugins/audit_json, directory renamed /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/include/compat -> /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/include/compat, directory renamed /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/plugins/sudoers/auth -> /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/plugins/sudoers/auth, directory renamed /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/lib/util -> /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/lib/util, directory renamed /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/lib/iolog -> /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/lib/iolog, directory renamed /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/lib/protobuf-c -> /usr/src/debug/sudo/1.9.11p2-
 r0/sudo-1.9.11p2/lib/protobuf-c, directory renamed /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/lib/logsrv -> /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/lib/logsrv, removed "/usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/exec_intercept.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/exec.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/sudo_edit.h /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/sudo_intercept_common.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/signal.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/hooks.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/net_ifs.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/limits.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/sudo_edit.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/conversation.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/load_plugins.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/sudo.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/utmp.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/env_hooks.c /usr/src/debug/
 sudo/1.9.10-r0/sudo-1.9.10/src/sudo_plugin_int.h /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/exec_common.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/parse_args.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/ttyname.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/tcsetpgrp_nobg.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/sudo_intercept.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/exec_preload.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/preserve_fds.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/exec_pty.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/tgetpass.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/intercept.pb-c.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/exec_monitor.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/get_pty.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/edit_open.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/sudo.h /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/sudo_noexec.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/sudo_exec.h /u
 sr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/exec_nopty.c /usr/src/debug/sudo/1.9.10-r0/sudo-1.9.10/src/copy_file.c", added "/usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/exec_nopty.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/sudo_exec.h /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/exec_monitor.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/get_pty.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/sudo_intercept.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/utmp.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/copy_file.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/preserve_fds.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/exec_intercept.h /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/ttyname.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/exec_intercept.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/intercept.pb-c.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/signal.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/ne
 t_ifs.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/sudo.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/suspend_nopty.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/sudo_intercept_common.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/hooks.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/sudo_edit.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/exec_preload.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/exec_ptrace.h /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/sudo_noexec.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/conversation.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/exec_pty.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/load_plugins.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/exec.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/sudo.h /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/exec_common.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/limits.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/e
 nv_hooks.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/edit_open.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/sudo_plugin_int.h /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/exec_ptrace.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/tcsetpgrp_nobg.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/tgetpass.c /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/sudo_edit.h /usr/src/debug/sudo/1.9.11p2-r0/sudo-1.9.11p2/src/parse_args.c"
packages/core2-32-poky-linux/sudo/sudo-src: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-src: PKGSIZE changed from 2759848 to 2840722 (+3%)
packages/core2-32-poky-linux/sudo/sudo-staticdev: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-staticdev: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-sudo: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo-sudo: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo-sudo: PKGSIZE changed from 271452 to 291964 (+8%)
packages/core2-32-poky-linux/sudo/sudo: PV changed from "1.9.10" to "1.9.11p2"
packages/core2-32-poky-linux/sudo/sudo: PKGV changed from 1.9.10 [default] to 1.9.11p2 [default]
packages/core2-32-poky-linux/sudo/sudo: PKGSIZE changed from 1224996 to 1225256 (+0%)

--===============5821530336607828809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/sudo: PACKAGES: added "sudo-locale-ka"
packages/core2-32-poky-linux/sudo/sudo-doc: FILELIST: removed "/usr/share/man/man8/sudo_plugin.8", added "/usr/share/man/man5/sudo_plugin.5"
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PKGSIZE changed from 87444 to 104742 (+20%)

--===============5821530336607828809==--

