Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3A8C54ECA
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:13 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1252.1710522012844129201
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=W6p3Jsrr;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=IAhjxlzS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018e430e9577-104a41b1-beee-42b5-b7e1-a25f623676fa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522013;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hOqKc0nDad+caUx7Vb/HW8qoG/FWtezQZWqid+COIEk=;
	b=W6p3Jsrrwb5ldwCGsUUxC2PEkiUh+Qn3OmsqyCAT3h3lqyVcbIGcnKQ1xmibm4JJ
	ikLBDZmyn1d5iF4wjoqbJCWOie5g5yzJwqkMGZyJt9RowF/ZqVLEYJ2ZvLYQRxaE4hZ
	RoR1P7/bMwN32Tes5m8Vj66jqr9qCQR9fGDNTvc8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522013;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hOqKc0nDad+caUx7Vb/HW8qoG/FWtezQZWqid+COIEk=;
	b=IAhjxlzSARNOujvBfRNsflPLbk6m79p44MFy/hWt0e7OmzCjrZFySNbwPX+ErJw2
	8QzlI5gVnLG4GYvyZ9/TFKdkHGrhFgqDx1FdO+1qoD9hLUxr0IRHFlZ6bBcvw7B0nLT
	CIUYPo7XaHAfso1ms6l6ojiMeyiSHTrQcNmobECY=
Content-Type: multipart/mixed; boundary="===============7484485953760514175=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wget: upgrading to 1.24.5 SUCCEEDED
Message-ID: <0101018e430e9577-104a41b1-beee-42b5-b7e1-a25f623676fa-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197199

--===============7484485953760514175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wget* to *1.24.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wget-upgrade-1.21.4-1.24.5.patch
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
From 1c21ad2f4b0a0e0968cf41ee8bc59e07ffc7848b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 11:04:42 +0000
Subject: [PATCH] wget: upgrade 1.21.4 -> 1.24.5

---
 .../wget/wget/0002-improve-reproducibility.patch         | 9 +++------
 .../wget/{wget_1.21.4.bb => wget_1.24.5.bb}              | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-extended/wget/{wget_1.21.4.bb => wget_1.24.5.bb} (60%)

diff --git a/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch b/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
index 050fc2c7e1..3f1dbae585 100644
--- a/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
+++ b/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
@@ -1,4 +1,4 @@
-From 7f1357529d23b356b45fbb0dd7388588162e4cb8 Mon Sep 17 00:00:00 2001
+From 3b1c3718978b384e16cff3cf54234996faa11ccd Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 10 Jan 2018 14:43:20 +0800
 Subject: [PATCH] src/Makefile.am: improve reproducibility
@@ -44,10 +44,10 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 28c0be2..44084a3 100644
+index 18ec622..38d252d 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -87,9 +87,13 @@ version.c:  $(wget_SOURCES) ../lib/libgnu.a
+@@ -108,9 +108,13 @@ version.c:  $(wget_SOURCES) ../lib/libgnu.a
  	echo '#include "version.h"' >> $@
  	echo 'const char *version_string = "@VERSION@";' >> $@
  	echo 'const char *compilation_string = "'$(COMPILE)'";' \
@@ -61,6 +61,3 @@ index 28c0be2..44084a3 100644
  	    | $(ESCAPEQUOTE) >> $@
  
  css.c: $(srcdir)/css.l
--- 
-1.8.3.1
-
diff --git a/meta/recipes-extended/wget/wget_1.21.4.bb b/meta/recipes-extended/wget/wget_1.24.5.bb
similarity index 60%
rename from meta/recipes-extended/wget/wget_1.21.4.bb
rename to meta/recipes-extended/wget/wget_1.24.5.bb
index 1d31b0116d..64e6ee80af 100644
--- a/meta/recipes-extended/wget/wget_1.21.4.bb
+++ b/meta/recipes-extended/wget/wget_1.24.5.bb
@@ -2,6 +2,6 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
           "
 
-SRC_URI[sha256sum] = "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea51df27525bcde04c"
+SRC_URI[sha256sum] = "fa2dc35bab5184ecbc46a9ef83def2aaaa3f4c9f3c97d4bd19dcb07d4da637de"
 
 require wget.inc
-- 
2.42.0


--===============7484485953760514175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/wget: SRC_URI changed from "https://ftp.gnu.org/gnu/wget/wget-1.21.4.tar.gz file://0002-improve-reproducibility.patch" to "https://ftp.gnu.org/gnu/wget/wget-1.24.5.tar.gz file://0002-improve-reproducibility.patch"
packages/core2-64-poky-linux/wget: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-dbg: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-dbg: PKGSIZE changed from 1581736 to 1586176 (+0%)
packages/core2-64-poky-linux/wget/wget-dbg: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-dev: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-dev: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-doc: FILELIST: removed "/usr/share/man/man1/wget.1"
packages/core2-64-poky-linux/wget/wget-doc: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-doc: PKGSIZE changed from 343048 to 232841 (-32%)
packages/core2-64-poky-linux/wget/wget-doc: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-af: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-af: PKGSIZE changed from 726 to 721 (-1%)
packages/core2-64-poky-linux/wget/wget-locale-af: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-be: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-be: PKGSIZE changed from 98110 to 98965 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-be: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-bg: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-bg: PKGSIZE changed from 16681 to 16691 (+0%)
packages/core2-64-poky-linux/wget/wget-locale-bg: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-ca: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-ca: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-cs: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-cs: PKGSIZE changed from 87863 to 88563 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-cs: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-da: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-da: PKGSIZE changed from 27130 to 82782 (+205%)
packages/core2-64-poky-linux/wget/wget-locale-da: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-de: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-de: PKGSIZE changed from 90681 to 91360 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-de: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-el: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-el: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-en-gb: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-en-gb: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-eo: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-eo: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-es: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-es: PKGSIZE changed from 85775 to 86428 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-es: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-et: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-et: PKGSIZE changed from 79536 to 80174 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-et: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-eu: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-eu: PKGSIZE changed from 10556 to 10551 (-0%)
packages/core2-64-poky-linux/wget/wget-locale-eu: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-fi: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-fi: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-fr: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-fr: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-ga: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-ga: PKGSIZE changed from 76654 to 76721 (+0%)
packages/core2-64-poky-linux/wget/wget-locale-ga: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-gl: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-gl: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-he: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-he: PKGSIZE changed from 7130 to 8578 (+20%)
packages/core2-64-poky-linux/wget/wget-locale-he: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-hr: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-hr: PKGSIZE changed from 82185 to 82194 (+0%)
packages/core2-64-poky-linux/wget/wget-locale-hr: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-hu: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-hu: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-id: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-id: PKGSIZE changed from 61467 to 61462 (-0%)
packages/core2-64-poky-linux/wget/wget-locale-id: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-it: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-it: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-ja: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-ja: PKGSIZE changed from 92245 to 93020 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-ja: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-ka: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-ka: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-ko: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-ko: PKGSIZE changed from 82916 to 84787 (+2%)
packages/core2-64-poky-linux/wget/wget-locale-ko: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-lt: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-lt: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-ms: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-ms: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-nb: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-nb: PKGSIZE changed from 79149 to 79808 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-nb: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-nl: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-nl: PKGSIZE changed from 65020 to 69506 (+7%)
packages/core2-64-poky-linux/wget/wget-locale-nl: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-pl: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-pl: PKGSIZE changed from 86113 to 86769 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-pl: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-pt-br: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-pt-br: PKGSIZE changed from 87209 to 87909 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-pt-br: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-pt: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-pt: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-ro: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-ro: PKGSIZE changed from 87795 to 88487 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-ro: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-ru: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-ru: PKGSIZE changed from 105837 to 106630 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-ru: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-rw: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-rw: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-sk: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-sk: PKGSIZE changed from 81233 to 81891 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-sk: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-sl: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-sl: PKGSIZE changed from 28011 to 28187 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-sl: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-sr: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-sr: PKGSIZE changed from 105410 to 106233 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-sr: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-sv: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-sv: PKGSIZE changed from 83640 to 84289 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-sv: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-tr: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-tr: PKGSIZE changed from 73002 to 73237 (+0%)
packages/core2-64-poky-linux/wget/wget-locale-tr: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-uk: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-uk: PKGSIZE changed from 106628 to 107426 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-uk: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-vi: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-vi: PKGSIZE changed from 90469 to 91213 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-vi: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-zh-cn: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-zh-cn: PKGSIZE changed from 79391 to 80030 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-zh-cn: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-zh-tw: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-zh-tw: PKGSIZE changed from 80753 to 81407 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-zh-tw: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-src: FILELIST: directory renamed /usr/src/debug/wget/1.21.4/src -> /usr/src/debug/wget/1.24.5/src, directory renamed /usr/src/debug/wget/1.21.4/lib/malloc -> /usr/src/debug/wget/1.24.5/lib/malloc, directory renamed /usr/src/debug/wget/1.21.4/lib/sys -> /usr/src/debug/wget/1.24.5/lib/sys, removed "/usr/src/debug/wget/1.21.4/lib/tmpdir.h /usr/src/debug/wget/1.21.4/lib/tmpdir.c /usr/src/debug/wget/1.21.4/lib/regex.h /usr/src/debug/wget/1.21.4/lib/mbchar.c /usr/src/debug/wget/1.21.4/lib/mbchar.h /usr/src/debug/wget/1.21.4/lib/fopen.c /usr/src/debug/wget/1.21.4/lib/sha1.h /usr/src/debug/wget/1.21.4/lib/sha1.c /usr/src/debug/wget/1.21.4/lib/dirname.h /usr/src/debug/wget/1.21.4/lib/c-ctype.h /usr/src/debug/wget/1.21.4/lib/sha256.c /usr/src/debug/wget/1.21.4/lib/sha256.h /usr/src/debug/wget/1.21.4/lib/mbsrtowcs.c /usr/src/debug/wget/1.21.4/lib/mbiter.h /usr/src/debug/wget/1.21.4/lib/xalloc-die.c /usr/src/debug/wget/1.21.4/lib/quotearg.c /usr/src/debug/w
 get/1.21.4/lib/stdlib.h /usr/src/debug/wget/1.21.4/lib/quotearg.h /usr/src/debug/wget/1.21.4/lib/stdio.h /usr/src/debug/wget/1.21.4/lib/setlocale_null.h /usr/src/debug/wget/1.21.4/lib/setlocale_null.c /usr/src/debug/wget/1.21.4/lib/sha1-stream.c /usr/src/debug/wget/1.21.4/lib/mbsrtowcs-impl.h /usr/src/debug/wget/1.21.4/lib/xmalloc.c /usr/src/debug/wget/1.21.4/lib/c-strcaseeq.h /usr/src/debug/wget/1.21.4/lib/dirent.h /usr/src/debug/wget/1.21.4/lib/xmemdup0.h /usr/src/debug/wget/1.21.4/lib/regexec.c /usr/src/debug/wget/1.21.4/lib/xmemdup0.c /usr/src/debug/wget/1.21.4/lib/exitfail.c /usr/src/debug/wget/1.21.4/lib/exitfail.h /usr/src/debug/wget/1.21.4/lib/c-strncasecmp.c /usr/src/debug/wget/1.21.4/lib/memchr.c /usr/src/debug/wget/1.21.4/lib/xstrndup.c /usr/src/debug/wget/1.21.4/lib/xstrndup.h /usr/src/debug/wget/1.21.4/lib/strtol.c /usr/src/debug/wget/1.21.4/lib/fcntl.h /usr/src/debug/wget/1.21.4/lib/c-strcase.h /usr/src/debug/wget/1.21.4/lib/string.h /usr/src/debug/wget/1.21.4/lib/fcnt
 l.c /usr/src/debug/wget/1.21.4/lib/mbsrtowcs-state.c /usr/src/debug/wget/1.21.4/lib/getopt-ext.h /usr/src/debug/wget/1.21.4/lib/getopt_int.h /usr/src/debug/wget/1.21.4/lib/mbrtowc.c /usr/src/debug/wget/1.21.4/lib/af_alg.h /usr/src/debug/wget/1.21.4/lib/quote.h /usr/src/debug/wget/1.21.4/lib/fnmatch_loop.c /usr/src/debug/wget/1.21.4/lib/ioctl.c /usr/src/debug/wget/1.21.4/lib/c-strcasecmp.c /usr/src/debug/wget/1.21.4/lib/localcharset.c /usr/src/debug/wget/1.21.4/lib/regex_internal.h /usr/src/debug/wget/1.21.4/lib/regex_internal.c /usr/src/debug/wget/1.21.4/lib/localcharset.h /usr/src/debug/wget/1.21.4/lib/base32.h /usr/src/debug/wget/1.21.4/lib/regcomp.c /usr/src/debug/wget/1.21.4/lib/fseeko.c /usr/src/debug/wget/1.21.4/lib/fflush.c /usr/src/debug/wget/1.21.4/lib/base32.c /usr/src/debug/wget/1.21.4/lib/btowc.c /usr/src/debug/wget/1.21.4/lib/idx.h /usr/src/debug/wget/1.21.4/lib/fnmatch.h /usr/src/debug/wget/1.21.4/lib/basename-lgpl.h /usr/src/debug/wget/1.21.4/lib/fnmatch.c /usr/src/de
 bug/wget/1.21.4/lib/wchar.h /usr/src/debug/wget/1.21.4/lib/getopt1.c /usr/src/debug/wget/1.21.4/lib/basename-lgpl.c /usr/src/debug/wget/1.21.4/lib/strerror.c /usr/src/debug/wget/1.21.4/lib/basename.c /usr/src/debug/wget/1.21.4/lib/md5.c /usr/src/debug/wget/1.21.4/lib/getopt.c /usr/src/debug/wget/1.21.4/lib/md5.h /usr/src/debug/wget/1.21.4/lib/hard-locale.h /usr/src/debug/wget/1.21.4/lib/hard-locale.c /usr/src/debug/wget/1.21.4/lib/ialloc.h /usr/src/debug/wget/1.21.4/lib/xalloc.h /usr/src/debug/wget/1.21.4/lib/strnlen1.c /usr/src/debug/wget/1.21.4/lib/strnlen1.h /usr/src/debug/wget/1.21.4/lib/fseek.c /usr/src/debug/wget/1.21.4/lib/getopt-core.h", added "/usr/src/debug/wget/1.24.5/lib/exitfail.c /usr/src/debug/wget/1.24.5/lib/exitfail.h /usr/src/debug/wget/1.24.5/lib/c-strncasecmp.c /usr/src/debug/wget/1.24.5/lib/memchr.c /usr/src/debug/wget/1.24.5/lib/xstrndup.c /usr/src/debug/wget/1.24.5/lib/xstrndup.h /usr/src/debug/wget/1.24.5/lib/strtol.c /usr/src/debug/wget/1.24.5/lib/fcntl.h /u
 sr/src/debug/wget/1.24.5/lib/c-strcase.h /usr/src/debug/wget/1.24.5/lib/string.h /usr/src/debug/wget/1.24.5/lib/fcntl.c /usr/src/debug/wget/1.24.5/lib/mbsrtowcs-state.c /usr/src/debug/wget/1.24.5/lib/getopt-ext.h /usr/src/debug/wget/1.24.5/lib/getopt_int.h /usr/src/debug/wget/1.24.5/lib/mbrtowc.c /usr/src/debug/wget/1.24.5/lib/af_alg.h /usr/src/debug/wget/1.24.5/lib/quote.h /usr/src/debug/wget/1.24.5/lib/setlocale_null-unlocked.c /usr/src/debug/wget/1.24.5/lib/fnmatch_loop.c /usr/src/debug/wget/1.24.5/lib/ioctl.c /usr/src/debug/wget/1.24.5/lib/c-strcasecmp.c /usr/src/debug/wget/1.24.5/lib/localcharset.c /usr/src/debug/wget/1.24.5/lib/regex_internal.h /usr/src/debug/wget/1.24.5/lib/regex_internal.c /usr/src/debug/wget/1.24.5/lib/localcharset.h /usr/src/debug/wget/1.24.5/lib/base32.h /usr/src/debug/wget/1.24.5/lib/regcomp.c /usr/src/debug/wget/1.24.5/lib/fseeko.c /usr/src/debug/wget/1.24.5/lib/fflush.c /usr/src/debug/wget/1.24.5/lib/base32.c /usr/src/debug/wget/1.24.5/lib/btowc.c /usr
 /src/debug/wget/1.24.5/lib/idx.h /usr/src/debug/wget/1.24.5/lib/fnmatch.h /usr/src/debug/wget/1.24.5/lib/basename-lgpl.h /usr/src/debug/wget/1.24.5/lib/fnmatch.c /usr/src/debug/wget/1.24.5/lib/uchar.h /usr/src/debug/wget/1.24.5/lib/getopt1.c /usr/src/debug/wget/1.24.5/lib/wchar.h /usr/src/debug/wget/1.24.5/lib/basename-lgpl.c /usr/src/debug/wget/1.24.5/lib/basename.c /usr/src/debug/wget/1.24.5/lib/md5.c /usr/src/debug/wget/1.24.5/lib/getopt.c /usr/src/debug/wget/1.24.5/lib/md5.h /usr/src/debug/wget/1.24.5/lib/hard-locale.h /usr/src/debug/wget/1.24.5/lib/hard-locale.c /usr/src/debug/wget/1.24.5/lib/ialloc.h /usr/src/debug/wget/1.24.5/lib/xalloc.h /usr/src/debug/wget/1.24.5/lib/strnlen1.c /usr/src/debug/wget/1.24.5/lib/strerror.c /usr/src/debug/wget/1.24.5/lib/strnlen1.h /usr/src/debug/wget/1.24.5/lib/fseek.c /usr/src/debug/wget/1.24.5/lib/getopt-core.h /usr/src/debug/wget/1.24.5/lib/tmpdir.h /usr/src/debug/wget/1.24.5/lib/tmpdir.c /usr/src/debug/wget/1.24.5/lib/regex.h /usr/src/debug
 /wget/1.24.5/lib/mbchar.h /usr/src/debug/wget/1.24.5/lib/fopen.c /usr/src/debug/wget/1.24.5/lib/sha1.h /usr/src/debug/wget/1.24.5/lib/sha1.c /usr/src/debug/wget/1.24.5/lib/dirname.h /usr/src/debug/wget/1.24.5/lib/c-ctype.h /usr/src/debug/wget/1.24.5/lib/sha256.c /usr/src/debug/wget/1.24.5/lib/sha256.h /usr/src/debug/wget/1.24.5/lib/mbsrtowcs.c /usr/src/debug/wget/1.24.5/lib/mbrtoc32.c /usr/src/debug/wget/1.24.5/lib/mbiter.h /usr/src/debug/wget/1.24.5/lib/xalloc-die.c /usr/src/debug/wget/1.24.5/lib/quotearg.c /usr/src/debug/wget/1.24.5/lib/quotearg.h /usr/src/debug/wget/1.24.5/lib/stdlib.h /usr/src/debug/wget/1.24.5/lib/stdio.h /usr/src/debug/wget/1.24.5/lib/setlocale_null.h /usr/src/debug/wget/1.24.5/lib/setlocale_null.c /usr/src/debug/wget/1.24.5/lib/sha1-stream.c /usr/src/debug/wget/1.24.5/lib/mbsrtowcs-impl.h /usr/src/debug/wget/1.24.5/lib/xmalloc.c /usr/src/debug/wget/1.24.5/lib/c-strcaseeq.h /usr/src/debug/wget/1.24.5/lib/dirent.h /usr/src/debug/wget/1.24.5/lib/xmemdup0.h /usr/
 src/debug/wget/1.24.5/lib/regexec.c /usr/src/debug/wget/1.24.5/lib/xmemdup0.c"
packages/core2-64-poky-linux/wget/wget-src: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-src: PKGSIZE changed from 2818207 to 2908911 (+3%)
packages/core2-64-poky-linux/wget/wget-src: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-staticdev: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-staticdev: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget: PKGSIZE changed from 557209 to 561305 (+1%)
packages/core2-64-poky-linux/wget/wget: PKGV changed from 1.21.4 [default] to 1.24.5 [default]

--===============7484485953760514175==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wget-upgrade-1.21.4-1.24.5.patch"

RnJvbSAxYzIxYWQyZjRiMGEwZTA5NjhjZjQxZWU4YmM1OWUwN2ZmYzc4NDhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMTE6MDQ6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
Z2V0OiB1cGdyYWRlIDEuMjEuNCAtPiAxLjI0LjUKCi0tLQogLi4uL3dnZXQvd2dldC8wMDAyLWlt
cHJvdmUtcmVwcm9kdWNpYmlsaXR5LnBhdGNoICAgICAgICAgfCA5ICsrKy0tLS0tLQogLi4uL3dn
ZXQve3dnZXRfMS4yMS40LmJiID0+IHdnZXRfMS4yNC41LmJifSAgICAgICAgICAgICAgfCAyICst
CiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC97d2dldF8xLjIxLjQuYmIgPT4gd2dldF8xLjI0
LjUuYmJ9ICg2MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dnZXQvd2dl
dC8wMDAyLWltcHJvdmUtcmVwcm9kdWNpYmlsaXR5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3dnZXQvd2dldC8wMDAyLWltcHJvdmUtcmVwcm9kdWNpYmlsaXR5LnBhdGNoCmluZGV4IDA1
MGZjMmM3ZTEuLjNmMWRiYWU1ODUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC93
Z2V0L3dnZXQvMDAwMi1pbXByb3ZlLXJlcHJvZHVjaWJpbGl0eS5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0LzAwMDItaW1wcm92ZS1yZXByb2R1Y2liaWxpdHkucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDdmMTM1NzUyOWQyM2IzNTZiNDVmYmIwZGQ3Mzg4NTg4
MTYyZTRjYjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDNiMWMzNzE4OTc4YjM4NGUx
NmNmZjNjZjU0MjM0OTk2ZmFhMTFjY2QgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBI
b25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDEwIEphbiAy
MDE4IDE0OjQzOjIwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNyYy9NYWtlZmlsZS5hbTogaW1w
cm92ZSByZXByb2R1Y2liaWxpdHkKQEAgLTQ0LDEwICs0NCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBK
b2UgU2xhdGVyIDxqc2xhdGVyQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvc3JjL01ha2VmaWxlLmFtIGIvc3JjL01ha2VmaWxl
LmFtCi1pbmRleCAyOGMwYmUyLi40NDA4NGEzIDEwMDY0NAoraW5kZXggMThlYzYyMi4uMzhkMjUy
ZCAxMDA2NDQKIC0tLSBhL3NyYy9NYWtlZmlsZS5hbQogKysrIGIvc3JjL01ha2VmaWxlLmFtCi1A
QCAtODcsOSArODcsMTMgQEAgdmVyc2lvbi5jOiAgJCh3Z2V0X1NPVVJDRVMpIC4uL2xpYi9saWJn
bnUuYQorQEAgLTEwOCw5ICsxMDgsMTMgQEAgdmVyc2lvbi5jOiAgJCh3Z2V0X1NPVVJDRVMpIC4u
L2xpYi9saWJnbnUuYQogIAllY2hvICcjaW5jbHVkZSAidmVyc2lvbi5oIicgPj4gJEAKICAJZWNo
byAnY29uc3QgY2hhciAqdmVyc2lvbl9zdHJpbmcgPSAiQFZFUlNJT05AIjsnID4+ICRACiAgCWVj
aG8gJ2NvbnN0IGNoYXIgKmNvbXBpbGF0aW9uX3N0cmluZyA9ICInJChDT01QSUxFKSciOycgXApA
QCAtNjEsNiArNjEsMyBAQCBpbmRleCAyOGMwYmUyLi40NDA4NGEzIDEwMDY0NAogIAkgICAgfCAk
KEVTQ0FQRVFVT1RFKSA+PiAkQAogIAogIGNzcy5jOiAkKHNyY2RpcikvY3NzLmwKLS0tIAotMS44
LjMuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0XzEuMjEu
NC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC93Z2V0L3dnZXRfMS4yNC41LmJiCnNpbWlsYXJp
dHkgaW5kZXggNjAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC93Z2V0L3dnZXRf
MS4yMS40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0XzEuMjQu
NS5iYgppbmRleCAxZDMxYjAxMTZkLi42NGU2ZWU4MGFmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvd2dldC93Z2V0XzEuMjEuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvd2dldC93Z2V0XzEuMjQuNS5iYgpAQCAtMiw2ICsyLDYgQEAgU1JDX1VSSSA9ICIke0dOVV9N
SVJST1J9L3dnZXQvd2dldC0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1p
bXByb3ZlLXJlcHJvZHVjaWJpbGl0eS5wYXRjaCBcCiAgICAgICAgICAgIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiODE1NDJmNWNlZmI4ZmFhY2MzOWJiYmM2YzgyZGVkODBlM2U0YTg4NTA1YWU3
MmVhNTFkZjI3NTI1YmNkZTA0YyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmYTJkYzM1YmFiNTE4
NGVjYmM0NmE5ZWY4M2RlZjJhYWFhM2Y0YzlmM2M5N2Q0YmQxOWRjYjA3ZDRkYTYzN2RlIgogCiBy
ZXF1aXJlIHdnZXQuaW5jCi0tIAoyLjQyLjAKCg==

--===============7484485953760514175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/wget/wget-doc: PKGSIZE changed from 343048 to 232841 (-32%)
packages/core2-64-poky-linux/wget/wget-doc: FILELIST: removed "/usr/share/man/man1/wget.1"
packages/core2-64-poky-linux/wget/wget-locale-da: PKGSIZE changed from 27130 to 82782 (+205%)
packages/core2-64-poky-linux/wget/wget-locale-he: PKGSIZE changed from 7130 to 8578 (+20%)

--===============7484485953760514175==--

