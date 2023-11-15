Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E461EC54F48
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:10 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.14620.1700059030019167353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AW7diZiQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=j8637+xd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018bd36a1d1e-d1cb65b4-256b-4b75-a013-b735ee4d49e3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4/sPXws9jwFZsI+9ZPZpMeLXg38ir98jCtLb10aQKsY=;
	b=AW7diZiQEjQ4YISEL8RDVQ+TCtxOewrBPr2Z2wKgGxNeTjvc0cHZYZc5TWMVP1M0
	s+pxkMYq3My3VcHiBHe1GNuKXGOXbNe9t5XDUX+sTCy8eEmZAzVyrgDafQ/vaNFpVrO
	4YmHXDioiCVMYPjajv69/XepJ2fYAVBrr59AfS4c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4/sPXws9jwFZsI+9ZPZpMeLXg38ir98jCtLb10aQKsY=;
	b=j8637+xdhM513Tt7TzCNayLf+DRKf9W3M+Xs66obGg2+QXfJljCoAmmTfo+jRXKs
	XQ6Fqa/BToOPhTNFF4K6Ni0X38AHLV8Hi/KvpX7emyF07c2Tb4N2H1SvQ+Zt9MSGyHv
	2WuIW++F/2TS8Wc4U3xQMnU+5gIH7elnIZkJkQXs=
Content-Type: multipart/mixed; boundary="===============7876618735061885151=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.18.1 SUCCEEDED
Message-ID: <0101018bd36a1d1e-d1cb65b4-256b-4b75-a013-b735ee4d49e3-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190621

--===============7876618735061885151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.18.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.17.0-4.18.1.patch
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
From 7eb8e545e4611cb2b0fe1f390c0f71122841c8e1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 05:53:47 +0000
Subject: [PATCH] dnf: upgrade 4.17.0 -> 4.18.1

---
 .../dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch           | 2 +-
 meta/recipes-devtools/dnf/{dnf_4.17.0.bb => dnf_4.18.1.bb}      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.17.0.bb => dnf_4.18.1.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
index eb0309d81a..d9b821bd36 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
@@ -1,4 +1,4 @@
-From 3bd0faf58cc9ad531e6b63d5660c4b8316e8daed Mon Sep 17 00:00:00 2001
+From 69f8f533fff84cb75774491143fa6f9579ae2229 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 28 Apr 2020 15:55:00 +0200
 Subject: [PATCH] dnf: write the log lock to root
diff --git a/meta/recipes-devtools/dnf/dnf_4.17.0.bb b/meta/recipes-devtools/dnf/dnf_4.18.1.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.17.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.18.1.bb
index ec4e48d68b..f60b4794a6 100644
--- a/meta/recipes-devtools/dnf/dnf_4.17.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.18.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "a31687c169095de1acb5c0a3762bf78993661776"
+SRCREV = "41a287e2bd60b4d1100c329a274776ff32ba8740"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


--===============7876618735061885151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dnf/dnf-bash-completion: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-dbg: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-dbg: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-dev: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-dev: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-doc: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-doc: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PKGSIZE changed from 2855 to 2853 (-0%)
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bg: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bn: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-bn: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ca: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PKGSIZE changed from 50784 to 78935 (+55%)
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-da: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-da: PKGSIZE changed from 83819 to 83665 (-0%)
packages/core2-64-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-de: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-de: PKGSIZE changed from 84360 to 85700 (+2%)
packages/core2-64-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-el: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-el: PKGSIZE changed from 743 to 3043 (+310%)
packages/core2-64-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PKGSIZE changed from 26333 to 26712 (+1%)
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PKGSIZE changed from 38724 to 38624 (-0%)
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-es: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-es: PKGSIZE changed from 89227 to 89056 (-0%)
packages/core2-64-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PKGSIZE changed from 22386 to 22923 (+2%)
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PKGSIZE changed from 7431 to 7735 (+4%)
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PKGSIZE changed from 91403 to 93138 (+2%)
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fil: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PKGSIZE changed from 96256 to 96362 (+0%)
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PKGSIZE changed from 91128 to 91203 (+0%)
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-gd: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-gu: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-he: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hi: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hr: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PKGSIZE changed from 95040 to 95292 (+0%)
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-id: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-id: PKGSIZE changed from 74173 to 75625 (+2%)
packages/core2-64-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-it: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PKGSIZE changed from 102671 to 104240 (+2%)
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PKGSIZE changed from 60991 to 91911 (+51%)
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-kk: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PKGSIZE changed from 93367 to 93609 (+0%)
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PKGSIZE changed from 31365 to 38610 (+23%)
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ml: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-mr: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ms: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-nb: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PKGSIZE changed from 89918 to 90134 (+0%)
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-or: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pa: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PKGSIZE changed from 94680 to 94898 (+0%)
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PKGSIZE changed from 87611 to 90966 (+4%)
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PKGSIZE changed from 35543 to 39018 (+10%)
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PKGSIZE changed from 117259 to 117175 (-0%)
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-si: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sk: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sq: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sr: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PKGSIZE changed from 89365 to 89573 (+0%)
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-th: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PKGSIZE changed from 91179 to 91377 (+0%)
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PKGSIZE changed from 119421 to 119610 (+0%)
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ur: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-vi: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PKGSIZE changed from 83624 to 83779 (+0%)
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PKGSIZE changed from 7420 to 83786 (+1029%)
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PKGSIZE changed from 72596 to 77662 (+7%)
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-src: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-src: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-staticdev: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-test-dep: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-test-dep: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf-test-main: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf-test-main: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf/dnf: FILELIST: removed "/etc/dnf/protected.d/dnf.conf", added "/usr/lib/python3.11/site-packages/dnf-4.18.1.dist-info/METADATA"
packages/core2-64-poky-linux/dnf/dnf: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf/dnf: PKGSIZE changed from 955215 to 957361 (+0%)
packages/core2-64-poky-linux/dnf/dnf: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
packages/core2-64-poky-linux/dnf: PV changed from "4.17.0" to "4.18.1"
packages/core2-64-poky-linux/dnf: PACKAGES: added "dnf-locale-om dnf-locale-ie dnf-locale-be dnf-locale-sl"
packages/core2-64-poky-linux/dnf: PKGV changed from 4.17.0 [default] to 4.18.1 [default]
Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.11/site-packages/dnf-4.18.1.dist-info was added
  /usr/lib/python3.11/site-packages/dnf-4.18.1.dist-info/METADATA was added

--===============7876618735061885151==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.17.0-4.18.1.patch"

RnJvbSA3ZWI4ZTU0NWU0NjExY2IyYjBmZTFmMzkwYzBmNzExMjI4NDFjOGUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDU6NTM6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
bmY6IHVwZ3JhZGUgNC4xNy4wIC0+IDQuMTguMQoKLS0tCiAuLi4vZG5mL2RuZi8wMDAxLWRuZi13
cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaCAgICAgICAgICAgfCAyICstCiBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZG5mL3tkbmZfNC4xNy4wLmJiID0+IGRuZl80LjE4LjEuYmJ9ICAgICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL3tkbmZfNC4xNy4wLmJiID0+IGRuZl80
LjE4LjEuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9k
bmYvMDAwMS1kbmYtd3JpdGUtdGhlLWxvZy1sb2NrLXRvLXJvb3QucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5w
YXRjaAppbmRleCBlYjAzMDlkODFhLi5kOWI4MjFiZDM2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWRuZi13cml0ZS10
aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2JkMGZhZjU4
Y2M5YWQ1MzFlNmI2M2Q1NjYwYzRiODMxNmU4ZGFlZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gNjlmOGY1MzNmZmY4NGNiNzU3NzQ0OTExNDNmYTZmOTU3OWFlMjIyOSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPgogRGF0ZTogVHVlLCAyOCBBcHIgMjAyMCAxNTo1NTowMCArMDIwMAogU3ViamVjdDog
W1BBVENIXSBkbmY6IHdyaXRlIHRoZSBsb2cgbG9jayB0byByb290CmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80LjE3LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZG5mL2RuZl80LjE4LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4xNy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZG5mL2RuZl80LjE4LjEuYmIKaW5kZXggZWM0ZTQ4ZDY4Yi4uZjYwYjQ3OTRh
NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4xNy4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMTguMS5iYgpAQCAtMTksNyArMTks
NyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vcnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQv
ZG5mLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvYwogCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRp
dmUgPSAiZmlsZTovLzAwMDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoIgog
Ci1TUkNSRVYgPSAiYTMxNjg3YzE2OTA5NWRlMWFjYjVjMGEzNzYyYmY3ODk5MzY2MTc3NiIKK1NS
Q1JFViA9ICI0MWEyODdlMmJkNjBiNGQxMTAwYzMyOWEyNzQ3NzZmZjMyYmE4NzQwIgogVVBTVFJF
QU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQrKSspIgogCiBTID0gIiR7
V09SS0RJUn0vZ2l0IgotLSAKMi4zOS4yCgo=

--===============7876618735061885151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/dnf/dnf-locale-cs: PKGSIZE changed from 50784 to 78935 (+55%)
packages/core2-64-poky-linux/dnf/dnf-locale-el: PKGSIZE changed from 743 to 3043 (+310%)
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PKGSIZE changed from 60991 to 91911 (+51%)
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PKGSIZE changed from 31365 to 38610 (+23%)
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PKGSIZE changed from 7420 to 83786 (+1029%)
packages/core2-64-poky-linux/dnf/dnf: FILELIST: removed "/etc/dnf/protected.d/dnf.conf", added "/usr/lib/python3.11/site-packages/dnf-4.18.1.dist-info/METADATA"
packages/core2-64-poky-linux/dnf: PACKAGES: added "dnf-locale-om dnf-locale-sl dnf-locale-be dnf-locale-ie"
Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.11/site-packages/dnf-4.18.1.dist-info was added
  /usr/lib/python3.11/site-packages/dnf-4.18.1.dist-info/METADATA was added

--===============7876618735061885151==--

