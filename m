Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47FCCA0FF4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:12 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.11410.1755263221863431685
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=juNRwZBU;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cTxcMXXU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010198add76709-8ed2280a-127e-48d3-a965-3cedc3c38656-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263231;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CZb4A1RUIxyK5Py4IPLch7iOKeoQe180xiUchfBGtFs=;
	b=juNRwZBU845GJiUAsm0Decjqyc2h0eGLo2lyNFKGz3iN4DFIpQtIUyO468qlr04P
	HJPT+Srelo4N4Qe75mdKmwLsE1eL2VSIM05mP8hY1/mJK4VLqzU7KwRqA46RzZPedMw
	NkE3EB0KxUin+VE5OGieUjETrCh2hNjNsgPk+ris=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263231;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CZb4A1RUIxyK5Py4IPLch7iOKeoQe180xiUchfBGtFs=;
	b=cTxcMXXU3OFnz7acYwM1L549i3igMu64WxtWvZyhR0iTX9wvoV0Xk8MXWrw4T890
	504ZopwIcJlqazhAjlSvlwehbe71z3xRLkihqSz/oQ0wLKmd7otc5mATE4hZChYYhps
	cRMiIrQM+8qJdNXBACpdVTfITVViUecCJaACKRUI=
Content-Type: multipart/mixed; boundary="===============4432464357497013014=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sudo: upgrading to 1.9.17p2 SUCCEEDED
Message-ID: <01010198add76709-8ed2280a-127e-48d3-a965-3cedc3c38656-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221932

--===============4432464357497013014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sudo* to *1.9.17p2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sudo-upgrade-1.9.17p1-1.9.17p2.patch
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
From a0da4863c48be3c8fd3d479022a647b74681bf84 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 10:37:49 +0000
Subject: [PATCH] sudo: upgrade 1.9.17p1 -> 1.9.17p2

---
 .../files/0001-sudo.conf.in-fix-conflict-with-multilib.patch    | 2 +-
 .../sudo/{sudo_1.9.17p1.bb => sudo_1.9.17p2.bb}                 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.17p1.bb => sudo_1.9.17p2.bb} (96%)

diff --git a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
index 1989c5abd7..e3cfada07c 100644
--- a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
+++ b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
@@ -1,4 +1,4 @@
-From 8c69192754ba73dd6e3273728a21aa73988f4bfb Mon Sep 17 00:00:00 2001
+From 7130a780f9c6c9aad4e93e8aeec1ba8908987001 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 17 Nov 2020 11:13:40 +0800
 Subject: [PATCH] sudo.conf.in: fix conflict with multilib
diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p1.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.17p1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index 83bfc0621c..3a5c111961 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "ff607ea717072197738a78f778692cd6df9a7e3e404565f51de063ca27455d32"
+SRC_URI[sha256sum] = "4a38a1ab3adb1199257edc2a7c4a2bd714665eb605b04368843b06dada2cfcfb"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.47.1


--===============4432464357497013014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/sudo: SRC_URI changed from "https://www.sudo.ws/dist/sudo-1.9.17p1.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch" to "https://www.sudo.ws/dist/sudo-1.9.17p2.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch"
packages/core2-64-poky-linux/sudo: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-dbg: PKGSIZE changed from 6300792 to 6301760 (+0%)
packages/core2-64-poky-linux/sudo/sudo-dbg: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-dbg: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-dev: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-dev: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-doc: PKGSIZE changed from 3285048 to 3290883 (+0%)
packages/core2-64-poky-linux/sudo/sudo-doc: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-doc: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-lib: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-lib: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ast: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-ast: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ca: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-ca: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-cs: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-cs: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-da: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-da: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-de: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-de: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-el: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-el: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-eo: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-eo: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-es: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-es: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-eu: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-eu: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fa: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-fa: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fi: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-fi: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fr: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-fr: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-fur: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-fur: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-gl: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-gl: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-hr: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-hr: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-hu: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-hu: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-id: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-id: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-it: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-it: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ja: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-ja: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ka: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-ka: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ko: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-ko: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-lt: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-lt: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-nb: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-nb: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-nl: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-nl: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-nn: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-nn: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-pl: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-pl: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-pt-br: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-pt-br: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-pt: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-pt: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ro: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-ro: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-ru: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-ru: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sk: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-sk: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sl: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-sl: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sq: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-sq: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sr: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-sr: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-sv: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-sv: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-tr: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-tr: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-uk: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-uk: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-vi: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-vi: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-yue: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-yue: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-zh-cn: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-zh-cn: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-locale-zh-tw: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-locale-zh-tw: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-src: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-src: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-staticdev: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-staticdev: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo-sudo: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo-sudo: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/core2-64-poky-linux/sudo/sudo: PV changed from "1.9.17p1" to "1.9.17p2"
packages/core2-64-poky-linux/sudo/sudo: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]

--===============4432464357497013014==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sudo-upgrade-1.9.17p1-1.9.17p2.patch"

RnJvbSBhMGRhNDg2M2M0OGJlM2M4ZmQzZDQ3OTAyMmE2NDdiNzQ2ODFiZjg0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMTA6Mzc6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
dWRvOiB1cGdyYWRlIDEuOS4xN3AxIC0+IDEuOS4xN3AyCgotLS0KIC4uLi9maWxlcy8wMDAxLXN1
ZG8uY29uZi5pbi1maXgtY29uZmxpY3Qtd2l0aC1tdWx0aWxpYi5wYXRjaCAgICB8IDIgKy0KIC4u
Li9zdWRvL3tzdWRvXzEuOS4xN3AxLmJiID0+IHN1ZG9fMS45LjE3cDIuYmJ9ICAgICAgICAgICAg
ICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL3tzdWRvXzEuOS4xN3AxLmJi
ID0+IHN1ZG9fMS45LjE3cDIuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL3N1ZG8vZmlsZXMvMDAwMS1zdWRvLmNvbmYuaW4tZml4LWNvbmZsaWN0LXdpdGgtbXVs
dGlsaWIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9maWxlcy8wMDAxLXN1ZG8u
Y29uZi5pbi1maXgtY29uZmxpY3Qtd2l0aC1tdWx0aWxpYi5wYXRjaAppbmRleCAxOTg5YzVhYmQ3
Li5lM2NmYWRhMDdjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9maWxl
cy8wMDAxLXN1ZG8uY29uZi5pbi1maXgtY29uZmxpY3Qtd2l0aC1tdWx0aWxpYi5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9maWxlcy8wMDAxLXN1ZG8uY29uZi5pbi1maXgt
Y29uZmxpY3Qtd2l0aC1tdWx0aWxpYi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOGM2OTE5
Mjc1NGJhNzNkZDZlMzI3MzcyOGEyMWFhNzM5ODhmNGJmYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNzEzMGE3ODBmOWM2YzlhYWQ0ZTkzZThhZWVjMWJhODkwODk4NzAwMSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29t
PgogRGF0ZTogVHVlLCAxNyBOb3YgMjAyMCAxMToxMzo0MCArMDgwMAogU3ViamVjdDogW1BBVENI
XSBzdWRvLmNvbmYuaW46IGZpeCBjb25mbGljdCB3aXRoIG11bHRpbGliCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9zdWRvXzEuOS4xN3AxLmJiIGIvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL3N1ZG8vc3Vkb18xLjkuMTdwMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9zdWRvXzEuOS4xN3AxLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9zdWRvXzEuOS4xN3AyLmJiCmluZGV4IDgz
YmZjMDYyMWMuLjNhNWMxMTE5NjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9z
dWRvL3N1ZG9fMS45LjE3cDEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N1ZG8vc3Vk
b18xLjkuMTdwMi5iYgpAQCAtNyw3ICs3LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL3d3dy5zdWRv
LndzL2Rpc3Qvc3Vkby0ke1BWfS50YXIuZ3ogXAogCiBQQU1fU1JDX1VSSSA9ICJmaWxlOi8vc3Vk
by5wYW0iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmZjYwN2VhNzE3MDcyMTk3NzM4YTc4Zjc3
ODY5MmNkNmRmOWE3ZTNlNDA0NTY1ZjUxZGUwNjNjYTI3NDU1ZDMyIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjRhMzhhMWFiM2FkYjExOTkyNTdlZGMyYTdjNGEyYmQ3MTQ2NjVlYjYwNWIwNDM2ODg0
M2IwNmRhZGEyY2ZjZmIiCiAKIERFUEVORFMgKz0gIiB2aXJ0dWFsL2NyeXB0ICR7QGJiLnV0aWxz
LmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAncGFtJywgJ2xpYnBhbScsICcnLCBkKX0iCiBS
REVQRU5EUzoke1BOfSArPSAiICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMn
LCAncGFtJywgJ3BhbS1wbHVnaW4tbGltaXRzIHBhbS1wbHVnaW4ta2V5aW5pdCcsICcnLCBkKX0i
Ci0tIAoyLjQ3LjEKCg==

--===============4432464357497013014==--

