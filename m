Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C78C19F4F
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.836.1686887484180039758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FaI0L5W3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010188c2544909-498a705d-742d-4092-90a6-cf7a0fd41198-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=p9rD6lGiBG+JALWgIsSJmb+OWDXr1Dz97p1+1JoC900=;
	b=FaI0L5W3rkcflI0Q3XngOYRMJEeVtCyjIECcARoGq0q9TXnIrfwyZVNaT2yFn+QS
	yXeUwGM0pHVhgc+iMe+OuqhTPHyVVG/k5gvXtfdtC8AAffYydcL3rYBoTYO+lJwzPMh
	TtpFZNzD5Bk7KF0kWQvZxdm8q1q94ErW8bVegDh4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=p9rD6lGiBG+JALWgIsSJmb+OWDXr1Dz97p1+1JoC900=;
	b=jPovcWM5sjGtAj8hXWLK2i6bFWgDLSPnweKMjERYq1uZtMQ9gtoPfnDrmSB4mbOC
	J8mVrttEvD8NHvV7tqBisKwknoCm9KY+wq4q8jPuBjNZPPR0Ga5TQIH+stAacT5LVzz
	UPsxoH2EbLfKmkRntiq7Rfgxt6NiUquwGqhqE4Nw=
Content-Type: multipart/mixed; boundary="===============5423298490658002962=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wget: upgrading to 1.21.4 SUCCEEDED
Message-ID: <01010188c2544909-498a705d-742d-4092-90a6-cf7a0fd41198-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182945

--===============5423298490658002962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wget* to *1.21.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wget-upgrade-1.21.3-1.21.4.patch
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
From 2d4b9932be622ea283f933a3c5f50669f1150532 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 17:13:43 +0000
Subject: [PATCH] wget: upgrade 1.21.3 -> 1.21.4

---
 meta/recipes-extended/wget/wget.inc           |  2 +-
 .../wget/{wget_1.21.3.bb => wget_1.21.4.bb}   | 24 ++++++++++++++++++-
 2 files changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/wget/{wget_1.21.3.bb => wget_1.21.4.bb} (13%)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index d31756dbc8..51926e7296 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -7,7 +7,7 @@ FTP sites"
 HOMEPAGE = "https://www.gnu.org/software/wget/"
 SECTION = "console/network"
 LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6f65012d1daf98cb09b386cfb68df26b"
 
 inherit autotools gettext texinfo update-alternatives pkgconfig
 
diff --git a/meta/recipes-extended/wget/wget_1.21.3.bb b/meta/recipes-extended/wget/wget_1.21.4.bb
similarity index 13%
rename from meta/recipes-extended/wget/wget_1.21.3.bb
rename to meta/recipes-extended/wget/wget_1.21.4.bb
index f176a1546c..7455f7e08e 100644
--- a/meta/recipes-extended/wget/wget_1.21.3.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -1,7 +1,29 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,7 +1,7 @@
+#                      GNU GENERAL PUBLIC LICENSE
+#                         Version 3, 29 June 2007
+#  
+# - Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
+# + Copyright (C) 2007, 2023 Free Software Foundation, Inc. <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# 
+#
+
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
           "
 
-SRC_URI[sha256sum] = "5726bb8bc5ca0f6dc7110f6416e4bb7019e2d2ff5bf93d1ca2ffcc6656f220e5"
+SRC_URI[sha256sum] = "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea51df27525bcde04c"
 
 require wget.inc
-- 
2.39.2


--===============5423298490658002962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/wget: SRC_URI changed from "https://ftp.gnu.org/gnu/wget/wget-1.21.3.tar.gz file://0002-improve-reproducibility.patch" to "https://ftp.gnu.org/gnu/wget/wget-1.21.4.tar.gz file://0002-improve-reproducibility.patch"
packages/core2-32-poky-linux/wget: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget: PACKAGES: added "wget-locale-ka"
packages/core2-32-poky-linux/wget/wget-dbg: PKGSIZE changed from 1368644 to 1380364 (+1%)
packages/core2-32-poky-linux/wget/wget-dbg: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-dbg: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-dev: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-dev: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-doc: PKGSIZE changed from 233669 to 233677 (+0%)
packages/core2-32-poky-linux/wget/wget-doc: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-doc: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-af: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-af: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-be: PKGSIZE changed from 23843 to 98110 (+311%)
packages/core2-32-poky-linux/wget/wget-locale-be: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-be: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-bg: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-bg: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ca: PKGSIZE changed from 34697 to 34625 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-ca: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ca: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-cs: PKGSIZE changed from 87541 to 87863 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-cs: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-cs: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-da: PKGSIZE changed from 27195 to 27130 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-da: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-da: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-de: PKGSIZE changed from 90321 to 90681 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-de: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-de: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-el: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-el: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-en-gb: PKGSIZE changed from 8365 to 8427 (+1%)
packages/core2-32-poky-linux/wget/wget-locale-en-gb: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-en-gb: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-eo: PKGSIZE changed from 80571 to 82274 (+2%)
packages/core2-32-poky-linux/wget/wget-locale-eo: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-eo: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-es: PKGSIZE changed from 84891 to 85775 (+1%)
packages/core2-32-poky-linux/wget/wget-locale-es: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-es: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-et: PKGSIZE changed from 79250 to 79536 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-et: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-et: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-eu: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-eu: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-fi: PKGSIZE changed from 71680 to 71623 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-fi: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-fi: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-fr: PKGSIZE changed from 88506 to 88786 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-fr: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-fr: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ga: PKGSIZE changed from 76717 to 76654 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-ga: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ga: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-gl: PKGSIZE changed from 24196 to 24131 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-gl: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-gl: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-he: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-he: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-hr: PKGSIZE changed from 81728 to 82185 (+1%)
packages/core2-32-poky-linux/wget/wget-locale-hr: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-hr: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-hu: PKGSIZE changed from 82226 to 90495 (+10%)
packages/core2-32-poky-linux/wget/wget-locale-hu: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-hu: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-id: PKGSIZE changed from 30193 to 61467 (+104%)
packages/core2-32-poky-linux/wget/wget-locale-id: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-id: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-it: PKGSIZE changed from 86629 to 86569 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-it: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-it: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ja: PKGSIZE changed from 92018 to 92245 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-ja: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ja: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ko: PKGSIZE changed from 82621 to 82916 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-ko: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ko: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-lt: PKGSIZE changed from 15711 to 15765 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-lt: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-lt: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ms: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ms: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-nb: PKGSIZE changed from 78832 to 79149 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-nb: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-nb: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-nl: PKGSIZE changed from 65087 to 65020 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-nl: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-nl: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-pl: PKGSIZE changed from 85834 to 86113 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-pl: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-pl: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-pt-br: PKGSIZE changed from 85338 to 87209 (+2%)
packages/core2-32-poky-linux/wget/wget-locale-pt-br: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-pt-br: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-pt: PKGSIZE changed from 83372 to 83308 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-pt: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-pt: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ro: PKGSIZE changed from 84546 to 87795 (+4%)
packages/core2-32-poky-linux/wget/wget-locale-ro: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ro: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ru: PKGSIZE changed from 105554 to 105837 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-ru: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ru: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-rw: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-rw: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-sk: PKGSIZE changed from 80943 to 81233 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-sk: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-sk: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-sl: PKGSIZE changed from 28068 to 28011 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-sl: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-sl: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-sr: PKGSIZE changed from 105082 to 105410 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-sr: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-sr: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-sv: PKGSIZE changed from 83324 to 83640 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-sv: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-sv: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-tr: PKGSIZE changed from 73064 to 73002 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-tr: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-tr: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-uk: PKGSIZE changed from 106329 to 106628 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-uk: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-uk: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-vi: PKGSIZE changed from 82728 to 90469 (+9%)
packages/core2-32-poky-linux/wget/wget-locale-vi: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-vi: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-zh-cn: PKGSIZE changed from 77661 to 79391 (+2%)
packages/core2-32-poky-linux/wget/wget-locale-zh-cn: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-zh-cn: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-zh-tw: PKGSIZE changed from 80432 to 80753 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-zh-tw: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-zh-tw: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-src: PKGSIZE changed from 2781944 to 2818203 (+1%)
packages/core2-32-poky-linux/wget/wget-src: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-src: FILELIST: directory renamed /usr/src/debug/wget/1.21.3-r0/lib/sys -> /usr/src/debug/wget/1.21.4-r0/lib/sys, directory renamed /usr/src/debug/wget/1.21.3-r0/lib/malloc -> /usr/src/debug/wget/1.21.4-r0/lib/malloc, directory renamed /usr/src/debug/wget/1.21.3-r0/src -> /usr/src/debug/wget/1.21.4-r0/src, removed "/usr/src/debug/wget/1.21.3-r0/lib/c-strcaseeq.h /usr/src/debug/wget/1.21.3-r0/lib/strtol.c /usr/src/debug/wget/1.21.3-r0/lib/c-strcase.h /usr/src/debug/wget/1.21.3-r0/lib/regcomp.c /usr/src/debug/wget/1.21.3-r0/lib/c-strcasecmp.c /usr/src/debug/wget/1.21.3-r0/lib/regexec.c /usr/src/debug/wget/1.21.3-r0/lib/xmalloc.c /usr/src/debug/wget/1.21.3-r0/lib/mbrtowc.c /usr/src/debug/wget/1.21.3-r0/lib/c-ctype.h /usr/src/debug/wget/1.21.3-r0/lib/dirname.h /usr/src/debug/wget/1.21.3-r0/lib/strerror.c /usr/src/debug/wget/1.21.3-r0/lib/regex_internal.h /usr/src/debug/wget/1.21.3-r0/lib/quotearg.c /usr/src/debug/wget/1.21.3-r0/lib/sha1.c /usr/src/de
 bug/wget/1.21.3-r0/lib/quotearg.h /usr/src/debug/wget/1.21.3-r0/lib/regex_internal.c /usr/src/debug/wget/1.21.3-r0/lib/sha1.h /usr/src/debug/wget/1.21.3-r0/lib/fnmatch.c /usr/src/debug/wget/1.21.3-r0/lib/xmemdup0.c /usr/src/debug/wget/1.21.3-r0/lib/hard-locale.h /usr/src/debug/wget/1.21.3-r0/lib/setlocale_null.c /usr/src/debug/wget/1.21.3-r0/lib/xmemdup0.h /usr/src/debug/wget/1.21.3-r0/lib/fnmatch.h /usr/src/debug/wget/1.21.3-r0/lib/basename.c /usr/src/debug/wget/1.21.3-r0/lib/setlocale_null.h /usr/src/debug/wget/1.21.3-r0/lib/md5.c /usr/src/debug/wget/1.21.3-r0/lib/localcharset.c /usr/src/debug/wget/1.21.3-r0/lib/fnmatch_loop.c /usr/src/debug/wget/1.21.3-r0/lib/c-strncasecmp.c /usr/src/debug/wget/1.21.3-r0/lib/mbchar.h /usr/src/debug/wget/1.21.3-r0/lib/mbiter.h /usr/src/debug/wget/1.21.3-r0/lib/md5.h /usr/src/debug/wget/1.21.3-r0/lib/sha1-stream.c /usr/src/debug/wget/1.21.3-r0/lib/sha256.h /usr/src/debug/wget/1.21.3-r0/lib/getopt-core.h /usr/src/debug/wget/1.21.3-r0/lib/localcharse
 t.h /usr/src/debug/wget/1.21.3-r0/lib/stdlib.h /usr/src/debug/wget/1.21.3-r0/lib/getopt-ext.h /usr/src/debug/wget/1.21.3-r0/lib/wchar.h /usr/src/debug/wget/1.21.3-r0/lib/error.h /usr/src/debug/wget/1.21.3-r0/lib/fcntl.h /usr/src/debug/wget/1.21.3-r0/lib/quote.h /usr/src/debug/wget/1.21.3-r0/lib/regex.h /usr/src/debug/wget/1.21.3-r0/lib/exitfail.h /usr/src/debug/wget/1.21.3-r0/lib/idx.h /usr/src/debug/wget/1.21.3-r0/lib/stdio.h /usr/src/debug/wget/1.21.3-r0/lib/fcntl.c /usr/src/debug/wget/1.21.3-r0/lib/fseek.c /usr/src/debug/wget/1.21.3-r0/lib/ioctl.c /usr/src/debug/wget/1.21.3-r0/lib/getopt1.c /usr/src/debug/wget/1.21.3-r0/lib/exitfail.c /usr/src/debug/wget/1.21.3-r0/lib/xalloc-die.c /usr/src/debug/wget/1.21.3-r0/lib/tmpdir.c /usr/src/debug/wget/1.21.3-r0/lib/xstrndup.c /usr/src/debug/wget/1.21.3-r0/lib/base32.c /usr/src/debug/wget/1.21.3-r0/lib/fflush.c /usr/src/debug/wget/1.21.3-r0/lib/basename-lgpl.c /usr/src/debug/wget/1.21.3-r0/lib/fseeko.c /usr/src/debug/wget/1.21.3-r0/lib/get
 opt.c /usr/src/debug/wget/1.21.3-r0/lib/mbchar.c /usr/src/debug/wget/1.21.3-r0/lib/memchr.c /usr/src/debug/wget/1.21.3-r0/lib/sha256.c /usr/src/debug/wget/1.21.3-r0/lib/xstrndup.h /usr/src/debug/wget/1.21.3-r0/lib/string.h /usr/src/debug/wget/1.21.3-r0/lib/tmpdir.h /usr/src/debug/wget/1.21.3-r0/lib/xalloc.h /usr/src/debug/wget/1.21.3-r0/lib/basename-lgpl.h /usr/src/debug/wget/1.21.3-r0/lib/getopt_int.h /usr/src/debug/wget/1.21.3-r0/lib/base32.h /usr/src/debug/wget/1.21.3-r0/lib/af_alg.h /usr/src/debug/wget/1.21.3-r0/lib/dirent.h /usr/src/debug/wget/1.21.3-r0/lib/ialloc.h /usr/src/debug/wget/1.21.3-r0/lib/hard-locale.c", added "/usr/src/debug/wget/1.21.4-r0/lib/c-strcasecmp.c /usr/src/debug/wget/1.21.4-r0/lib/mbrtowc.c /usr/src/debug/wget/1.21.4-r0/lib/regexec.c /usr/src/debug/wget/1.21.4-r0/lib/xmalloc.c /usr/src/debug/wget/1.21.4-r0/lib/c-ctype.h /usr/src/debug/wget/1.21.4-r0/lib/dirname.h /usr/src/debug/wget/1.21.4-r0/lib/sha1.c /usr/src/debug/wget/1.21.4-r0/lib/quotearg.c /usr/sr
 c/debug/wget/1.21.4-r0/lib/quotearg.h /usr/src/debug/wget/1.21.4-r0/lib/sha1.h /usr/src/debug/wget/1.21.4-r0/lib/mbsrtowcs.c /usr/src/debug/wget/1.21.4-r0/lib/sha1-stream.c /usr/src/debug/wget/1.21.4-r0/lib/fcntl.h /usr/src/debug/wget/1.21.4-r0/lib/quote.h /usr/src/debug/wget/1.21.4-r0/lib/regex.h /usr/src/debug/wget/1.21.4-r0/lib/stdio.h /usr/src/debug/wget/1.21.4-r0/lib/wchar.h /usr/src/debug/wget/1.21.4-r0/lib/btowc.c /usr/src/debug/wget/1.21.4-r0/lib/fcntl.c /usr/src/debug/wget/1.21.4-r0/lib/fopen.c /usr/src/debug/wget/1.21.4-r0/lib/fseek.c /usr/src/debug/wget/1.21.4-r0/lib/ioctl.c /usr/src/debug/wget/1.21.4-r0/lib/tmpdir.c /usr/src/debug/wget/1.21.4-r0/lib/base32.c /usr/src/debug/wget/1.21.4-r0/lib/fflush.c /usr/src/debug/wget/1.21.4-r0/lib/fseeko.c /usr/src/debug/wget/1.21.4-r0/lib/getopt.c /usr/src/debug/wget/1.21.4-r0/lib/mbchar.c /usr/src/debug/wget/1.21.4-r0/lib/memchr.c /usr/src/debug/wget/1.21.4-r0/lib/sha256.c /usr/src/debug/wget/1.21.4-r0/lib/strtol.c /usr/src/debug/wg
 et/1.21.4-r0/lib/sha256.h /usr/src/debug/wget/1.21.4-r0/lib/stdlib.h /usr/src/debug/wget/1.21.4-r0/lib/string.h /usr/src/debug/wget/1.21.4-r0/lib/tmpdir.h /usr/src/debug/wget/1.21.4-r0/lib/xalloc.h /usr/src/debug/wget/1.21.4-r0/lib/base32.h /usr/src/debug/wget/1.21.4-r0/lib/af_alg.h /usr/src/debug/wget/1.21.4-r0/lib/dirent.h /usr/src/debug/wget/1.21.4-r0/lib/ialloc.h /usr/src/debug/wget/1.21.4-r0/lib/hard-locale.h /usr/src/debug/wget/1.21.4-r0/lib/hard-locale.c /usr/src/debug/wget/1.21.4-r0/lib/regex_internal.h /usr/src/debug/wget/1.21.4-r0/lib/regex_internal.c /usr/src/debug/wget/1.21.4-r0/lib/setlocale_null.c /usr/src/debug/wget/1.21.4-r0/lib/basename.c /usr/src/debug/wget/1.21.4-r0/lib/setlocale_null.h /usr/src/debug/wget/1.21.4-r0/lib/c-strncasecmp.c /usr/src/debug/wget/1.21.4-r0/lib/getopt-core.h /usr/src/debug/wget/1.21.4-r0/lib/getopt-ext.h /usr/src/debug/wget/1.21.4-r0/lib/idx.h /usr/src/debug/wget/1.21.4-r0/lib/getopt_int.h /usr/src/debug/wget/1.21.4-r0/lib/mbsrtowcs-impl.h
  /usr/src/debug/wget/1.21.4-r0/lib/fnmatch.c /usr/src/debug/wget/1.21.4-r0/lib/fnmatch.h /usr/src/debug/wget/1.21.4-r0/lib/localcharset.c /usr/src/debug/wget/1.21.4-r0/lib/localcharset.h /usr/src/debug/wget/1.21.4-r0/lib/exitfail.h /usr/src/debug/wget/1.21.4-r0/lib/getopt1.c /usr/src/debug/wget/1.21.4-r0/lib/exitfail.c /usr/src/debug/wget/1.21.4-r0/lib/xstrndup.c /usr/src/debug/wget/1.21.4-r0/lib/basename-lgpl.c /usr/src/debug/wget/1.21.4-r0/lib/basename-lgpl.h /usr/src/debug/wget/1.21.4-r0/lib/xstrndup.h /usr/src/debug/wget/1.21.4-r0/lib/c-strcaseeq.h /usr/src/debug/wget/1.21.4-r0/lib/c-strcase.h /usr/src/debug/wget/1.21.4-r0/lib/regcomp.c /usr/src/debug/wget/1.21.4-r0/lib/strerror.c /usr/src/debug/wget/1.21.4-r0/lib/strnlen1.c /usr/src/debug/wget/1.21.4-r0/lib/strnlen1.h /usr/src/debug/wget/1.21.4-r0/lib/mbchar.h /usr/src/debug/wget/1.21.4-r0/lib/mbiter.h /usr/src/debug/wget/1.21.4-r0/lib/xmemdup0.c /usr/src/debug/wget/1.21.4-r0/lib/xmemdup0.h /usr/src/debug/wget/1.21.4-r0/lib/md5
 .c /usr/src/debug/wget/1.21.4-r0/lib/fnmatch_loop.c /usr/src/debug/wget/1.21.4-r0/lib/md5.h /usr/src/debug/wget/1.21.4-r0/lib/xalloc-die.c /usr/src/debug/wget/1.21.4-r0/lib/mbsrtowcs-state.c"
packages/core2-32-poky-linux/wget/wget-src: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-staticdev: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-staticdev: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget: PKGV changed from 1.21.3 [default] to 1.21.4 [default]

--===============5423298490658002962==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wget-upgrade-1.21.3-1.21.4.patch"

RnJvbSAyZDRiOTkzMmJlNjIyZWEyODNmOTMzYTNjNWY1MDY2OWYxMTUwNTMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTc6MTM6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
Z2V0OiB1cGdyYWRlIDEuMjEuMyAtPiAxLjIxLjQKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3dnZXQvd2dldC5pbmMgICAgICAgICAgIHwgIDIgKy0KIC4uLi93Z2V0L3t3Z2V0XzEuMjEuMy5i
YiA9PiB3Z2V0XzEuMjEuNC5iYn0gICB8IDI0ICsrKysrKysrKysrKysrKysrKy0KIDIgZmlsZXMg
Y2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvd2dldC97d2dldF8xLjIxLjMuYmIgPT4gd2dldF8xLjIxLjQuYmJ9ICgx
MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dnZXQvd2dldC5pbmMgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0LmluYwppbmRleCBkMzE3NTZkYmM4Li41MTky
NmU3Mjk2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0LmluYwor
KysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0LmluYwpAQCAtNyw3ICs3LDcgQEAg
RlRQIHNpdGVzIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS93Z2V0
LyIKIFNFQ1RJT04gPSAiY29uc29sZS9uZXR3b3JrIgogTElDRU5TRSA9ICJHUEwtMy4wLW9ubHki
Ci1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jNjc4OTU3YjBjOGU5NjRh
YTZjNzBmZDc3NjQxYTcxZSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1
PTZmNjUwMTJkMWRhZjk4Y2IwOWIzODZjZmI2OGRmMjZiIgogCiBpbmhlcml0IGF1dG90b29scyBn
ZXR0ZXh0IHRleGluZm8gdXBkYXRlLWFsdGVybmF0aXZlcyBwa2djb25maWcKIApkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dnZXQvd2dldF8xLjIxLjMuYmIgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvd2dldC93Z2V0XzEuMjEuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDEzJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0XzEuMjEuMy5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dnZXQvd2dldF8xLjIxLjQuYmIKaW5kZXggZjE3NmEx
NTQ2Yy4uNzQ1NWY3ZTA4ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dnZXQv
d2dldF8xLjIxLjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dnZXQvd2dldF8xLjIx
LjQuYmIKQEAgLTEsNyArMSwyOSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFs
dWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93
aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNl
IHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQg
c3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vu
c2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQg
eWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcKKyMg
KysrIENPUFlJTkcKKyMgQEAgLTEsNyArMSw3IEBACisjICAgICAgICAgICAgICAgICAgICAgIEdO
VSBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjICAgICAgICAgICAgICAgICAgICAgICAgIFZlcnNp
b24gMywgMjkgSnVuZSAyMDA3CisjICAKKyMgLSBDb3B5cmlnaHQgKEMpIDIwMDcgRnJlZSBTb2Z0
d2FyZSBGb3VuZGF0aW9uLCBJbmMuIDxodHRwczovL2ZzZi5vcmcvPgorIyArIENvcHlyaWdodCAo
QykgMjAwNywgMjAyMyBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4gPGh0dHBzOi8vZnNm
Lm9yZy8+CisjICAgRXZlcnlvbmUgaXMgcGVybWl0dGVkIHRvIGNvcHkgYW5kIGRpc3RyaWJ1dGUg
dmVyYmF0aW0gY29waWVzCisjICAgb2YgdGhpcyBsaWNlbnNlIGRvY3VtZW50LCBidXQgY2hhbmdp
bmcgaXQgaXMgbm90IGFsbG93ZWQuCisjICAKKyMgCisjCisKIFNSQ19VUkkgPSAiJHtHTlVfTUlS
Uk9SfS93Z2V0L3dnZXQtJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDItaW1w
cm92ZS1yZXByb2R1Y2liaWxpdHkucGF0Y2ggXAogICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjU3MjZiYjhiYzVjYTBmNmRjNzExMGY2NDE2ZTRiYjcwMTllMmQyZmY1YmY5M2Qx
Y2EyZmZjYzY2NTZmMjIwZTUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODE1NDJmNWNlZmI4ZmFh
Y2MzOWJiYmM2YzgyZGVkODBlM2U0YTg4NTA1YWU3MmVhNTFkZjI3NTI1YmNkZTA0YyIKIAogcmVx
dWlyZSB3Z2V0LmluYwotLSAKMi4zOS4yCgo=

--===============5423298490658002962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/wget: PACKAGES: added "wget-locale-ka"
packages/core2-32-poky-linux/wget/wget-locale-be: PKGSIZE changed from 23843 to 98110 (+311%)
packages/core2-32-poky-linux/wget/wget-locale-hu: PKGSIZE changed from 82226 to 90495 (+10%)
packages/core2-32-poky-linux/wget/wget-locale-id: PKGSIZE changed from 30193 to 61467 (+104%)

--===============5423298490658002962==--

