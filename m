Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFBECD12C9
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:29 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.44645.1711994601572504973
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WJEDH/cx;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=4JWW6RIR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018e9ad4830c-0830accb-f24a-49ac-aa53-b73586052b94-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OQGtxQ9Nl1lLg5K204hnbZEOPkXBQETXJD7cnB5f9o4=;
	b=WJEDH/cxJRDeg2pTy2xjTF3R63OeZC2eD50CxYu5gDJfBzM0emaDLnIBY5OSfZeZ
	6vWsSEakPy4ddOWUqfk3vR8X3wOv6dBDSl659sRP+r34naqmHKz9/+31apl8nk17KW8
	o+gu9/Y7zgIMKV2AcI9MT55WJI5tHQUbvJ3dUGEo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OQGtxQ9Nl1lLg5K204hnbZEOPkXBQETXJD7cnB5f9o4=;
	b=4JWW6RIRz2XpPXhs/zAXomeriNlSVYw8l+kew4KzQtqkSzv92jy79qFTTXLrbr9C
	x0uH+g5IaXAbPn15hFaHx2DPYrPKeIfsmCNeYsd8TMh2fkOPbjIy04v0QWJ6b8gUV7Y
	2Nu1pkYv2KJjGttaShsJDmuJqHqhQrjs+wWR9ZSE=
Content-Type: multipart/mixed; boundary="===============3660002665077000528=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wget: upgrading to 1.24.5 SUCCEEDED
Message-ID: <0101018e9ad4830c-0830accb-f24a-49ac-aa53-b73586052b94-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197763

--===============3660002665077000528==
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
From 487ebe4f2061a554093cf5c41024f5ddf8da9a9b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 11:34:57 +0000
Subject: [PATCH] wget: upgrade 1.21.4 -> 1.24.5

---
 .../wget/wget/0002-improve-reproducibility.patch         | 9 +++------
 .../wget/{wget_1.21.4.bb => wget_1.24.5.bb}              | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-extended/wget/{wget_1.21.4.bb => wget_1.24.5.bb} (60%)

diff --git a/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch b/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
index 050fc2c7e1..18cfc8e14f 100644
--- a/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
+++ b/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
@@ -1,4 +1,4 @@
-From 7f1357529d23b356b45fbb0dd7388588162e4cb8 Mon Sep 17 00:00:00 2001
+From 2000dd8e455b60c4298b7c952ae387a59f382250 Mon Sep 17 00:00:00 2001
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


--===============3660002665077000528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/wget/wget-locale-da: PKGSIZE changed from 27130 to 82782 (+205%)
packages/core2-64-poky-linux/wget/wget-locale-he: PKGSIZE changed from 7130 to 8578 (+20%)

--===============3660002665077000528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/wget: SRC_URI changed from "https://ftp.gnu.org/gnu/wget/wget-1.21.4.tar.gz file://0002-improve-reproducibility.patch" to "https://ftp.gnu.org/gnu/wget/wget-1.24.5.tar.gz file://0002-improve-reproducibility.patch"
packages/core2-64-poky-linux/wget: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-dbg: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-dbg: PKGSIZE changed from 1581736 to 1586176 (+0%)
packages/core2-64-poky-linux/wget/wget-dbg: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-dev: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-dev: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-doc: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-doc: PKGSIZE changed from 233677 to 232841 (-0%)
packages/core2-64-poky-linux/wget/wget-doc: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-af: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-af: PKGSIZE changed from 726 to 721 (-1%)
packages/core2-64-poky-linux/wget/wget-locale-af: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-be: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-be: PKGSIZE changed from 98110 to 98965 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-be: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-bg: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-bg: PKGSIZE changed from 16681 to 16691 (+0%)
packages/core2-64-poky-linux/wget/wget-locale-bg: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-ca: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-ca: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-cs: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-cs: PKGSIZE changed from 87863 to 88563 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-cs: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-da: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-da: PKGSIZE changed from 27130 to 82782 (+205%)
packages/core2-64-poky-linux/wget/wget-locale-da: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-de: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-de: PKGSIZE changed from 90681 to 91360 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-de: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-el: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-el: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-en-gb: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-en-gb: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-eo: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-eo: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-es: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-es: PKGSIZE changed from 85775 to 86428 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-es: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-et: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-et: PKGSIZE changed from 79536 to 80174 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-et: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-eu: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-eu: PKGSIZE changed from 10556 to 10551 (-0%)
packages/core2-64-poky-linux/wget/wget-locale-eu: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-fi: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-fi: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-fr: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-fr: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-ga: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-ga: PKGSIZE changed from 76654 to 76721 (+0%)
packages/core2-64-poky-linux/wget/wget-locale-ga: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-gl: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-gl: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-he: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-he: PKGSIZE changed from 7130 to 8578 (+20%)
packages/core2-64-poky-linux/wget/wget-locale-he: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-hr: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-hr: PKGSIZE changed from 82185 to 82194 (+0%)
packages/core2-64-poky-linux/wget/wget-locale-hr: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-hu: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-hu: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-id: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-id: PKGSIZE changed from 61467 to 61462 (-0%)
packages/core2-64-poky-linux/wget/wget-locale-id: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-it: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-it: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-ja: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-ja: PKGSIZE changed from 92245 to 93020 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-ja: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-ka: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-ka: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-ko: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-ko: PKGSIZE changed from 82916 to 84787 (+2%)
packages/core2-64-poky-linux/wget/wget-locale-ko: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-lt: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-lt: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-ms: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-ms: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-nb: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-nb: PKGSIZE changed from 79149 to 79808 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-nb: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-nl: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-nl: PKGSIZE changed from 65020 to 69506 (+7%)
packages/core2-64-poky-linux/wget/wget-locale-nl: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-pl: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-pl: PKGSIZE changed from 86113 to 86769 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-pl: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-pt-br: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-pt-br: PKGSIZE changed from 87209 to 87909 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-pt-br: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-pt: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-pt: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-ro: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-ro: PKGSIZE changed from 87795 to 88487 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-ro: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-ru: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-ru: PKGSIZE changed from 105837 to 106630 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-ru: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-rw: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-rw: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-sk: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-sk: PKGSIZE changed from 81233 to 81891 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-sk: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-sl: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-sl: PKGSIZE changed from 28011 to 28187 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-sl: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-sr: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-sr: PKGSIZE changed from 105410 to 106233 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-sr: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-sv: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-sv: PKGSIZE changed from 83640 to 84289 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-sv: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-tr: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-tr: PKGSIZE changed from 73002 to 73237 (+0%)
packages/core2-64-poky-linux/wget/wget-locale-tr: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-uk: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-uk: PKGSIZE changed from 106628 to 107426 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-uk: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-vi: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-vi: PKGSIZE changed from 90469 to 91213 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-vi: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-zh-cn: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-zh-cn: PKGSIZE changed from 79391 to 80030 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-zh-cn: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-locale-zh-tw: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-locale-zh-tw: PKGSIZE changed from 80753 to 81407 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-zh-tw: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-src: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-src: PKGSIZE changed from 2818207 to 2908911 (+3%)
packages/core2-64-poky-linux/wget/wget-src: FILELIST: directory renamed /usr/src/debug/wget/1.21.4/lib/sys -> /usr/src/debug/wget/1.24.5/lib/sys, directory renamed /usr/src/debug/wget/1.21.4/src -> /usr/src/debug/wget/1.24.5/src, directory renamed /usr/src/debug/wget/1.21.4/lib/malloc -> /usr/src/debug/wget/1.24.5/lib/malloc, removed "/usr/src/debug/wget/1.21.4/lib/c-ctype.h /usr/src/debug/wget/1.21.4/lib/getopt-core.h /usr/src/debug/wget/1.21.4/lib/mbsrtowcs-state.c /usr/src/debug/wget/1.21.4/lib/fnmatch.c /usr/src/debug/wget/1.21.4/lib/base32.c /usr/src/debug/wget/1.21.4/lib/idx.h /usr/src/debug/wget/1.21.4/lib/fnmatch.h /usr/src/debug/wget/1.21.4/lib/base32.h /usr/src/debug/wget/1.21.4/lib/mbrtowc.c /usr/src/debug/wget/1.21.4/lib/regex_internal.c /usr/src/debug/wget/1.21.4/lib/af_alg.h /usr/src/debug/wget/1.21.4/lib/regex_internal.h /usr/src/debug/wget/1.21.4/lib/xalloc-die.c /usr/src/debug/wget/1.21.4/lib/exitfail.h /usr/src/debug/wget/1.21.4/lib/c-strcaseeq.h /usr/src/debug/wget
 /1.21.4/lib/exitfail.c /usr/src/debug/wget/1.21.4/lib/getopt1.c /usr/src/debug/wget/1.21.4/lib/ialloc.h /usr/src/debug/wget/1.21.4/lib/xalloc.h /usr/src/debug/wget/1.21.4/lib/strnlen1.h /usr/src/debug/wget/1.21.4/lib/mbsrtowcs-impl.h /usr/src/debug/wget/1.21.4/lib/strerror.c /usr/src/debug/wget/1.21.4/lib/strnlen1.c /usr/src/debug/wget/1.21.4/lib/basename.c /usr/src/debug/wget/1.21.4/lib/getopt.c /usr/src/debug/wget/1.21.4/lib/getopt-ext.h /usr/src/debug/wget/1.21.4/lib/getopt_int.h /usr/src/debug/wget/1.21.4/lib/wchar.h /usr/src/debug/wget/1.21.4/lib/fflush.c /usr/src/debug/wget/1.21.4/lib/ioctl.c /usr/src/debug/wget/1.21.4/lib/string.h /usr/src/debug/wget/1.21.4/lib/c-strcasecmp.c /usr/src/debug/wget/1.21.4/lib/fnmatch_loop.c /usr/src/debug/wget/1.21.4/lib/sha1-stream.c /usr/src/debug/wget/1.21.4/lib/basename-lgpl.h /usr/src/debug/wget/1.21.4/lib/stdlib.h /usr/src/debug/wget/1.21.4/lib/basename-lgpl.c /usr/src/debug/wget/1.21.4/lib/regcomp.c /usr/src/debug/wget/1.21.4/lib/fcntl.h 
 /usr/src/debug/wget/1.21.4/lib/quote.h /usr/src/debug/wget/1.21.4/lib/regexec.c /usr/src/debug/wget/1.21.4/lib/mbsrtowcs.c /usr/src/debug/wget/1.21.4/lib/fcntl.c /usr/src/debug/wget/1.21.4/lib/mbiter.h /usr/src/debug/wget/1.21.4/lib/hard-locale.h /usr/src/debug/wget/1.21.4/lib/localcharset.c /usr/src/debug/wget/1.21.4/lib/localcharset.h /usr/src/debug/wget/1.21.4/lib/hard-locale.c /usr/src/debug/wget/1.21.4/lib/stdio.h /usr/src/debug/wget/1.21.4/lib/xstrndup.h /usr/src/debug/wget/1.21.4/lib/strtol.c /usr/src/debug/wget/1.21.4/lib/xstrndup.c /usr/src/debug/wget/1.21.4/lib/dirname.h /usr/src/debug/wget/1.21.4/lib/memchr.c /usr/src/debug/wget/1.21.4/lib/xmalloc.c /usr/src/debug/wget/1.21.4/lib/dirent.h /usr/src/debug/wget/1.21.4/lib/btowc.c /usr/src/debug/wget/1.21.4/lib/xmemdup0.c /usr/src/debug/wget/1.21.4/lib/xmemdup0.h /usr/src/debug/wget/1.21.4/lib/fseeko.c /usr/src/debug/wget/1.21.4/lib/tmpdir.c /usr/src/debug/wget/1.21.4/lib/regex.h /usr/src/debug/wget/1.21.4/lib/tmpdir.h /usr/s
 rc/debug/wget/1.21.4/lib/fopen.c /usr/src/debug/wget/1.21.4/lib/quotearg.h /usr/src/debug/wget/1.21.4/lib/sha256.h /usr/src/debug/wget/1.21.4/lib/sha1.c /usr/src/debug/wget/1.21.4/lib/fseek.c /usr/src/debug/wget/1.21.4/lib/sha1.h /usr/src/debug/wget/1.21.4/lib/quotearg.c /usr/src/debug/wget/1.21.4/lib/sha256.c /usr/src/debug/wget/1.21.4/lib/mbchar.h /usr/src/debug/wget/1.21.4/lib/c-strcase.h /usr/src/debug/wget/1.21.4/lib/md5.c /usr/src/debug/wget/1.21.4/lib/mbchar.c /usr/src/debug/wget/1.21.4/lib/md5.h /usr/src/debug/wget/1.21.4/lib/setlocale_null.h /usr/src/debug/wget/1.21.4/lib/c-strncasecmp.c /usr/src/debug/wget/1.21.4/lib/setlocale_null.c", added "/usr/src/debug/wget/1.24.5/lib/regcomp.c /usr/src/debug/wget/1.24.5/lib/fcntl.h /usr/src/debug/wget/1.24.5/lib/quote.h /usr/src/debug/wget/1.24.5/lib/regexec.c /usr/src/debug/wget/1.24.5/lib/mbsrtowcs.c /usr/src/debug/wget/1.24.5/lib/fcntl.c /usr/src/debug/wget/1.24.5/lib/mbiter.h /usr/src/debug/wget/1.24.5/lib/hard-locale.h /usr/src/
 debug/wget/1.24.5/lib/localcharset.c /usr/src/debug/wget/1.24.5/lib/localcharset.h /usr/src/debug/wget/1.24.5/lib/hard-locale.c /usr/src/debug/wget/1.24.5/lib/stdio.h /usr/src/debug/wget/1.24.5/lib/xstrndup.h /usr/src/debug/wget/1.24.5/lib/strtol.c /usr/src/debug/wget/1.24.5/lib/xstrndup.c /usr/src/debug/wget/1.24.5/lib/dirname.h /usr/src/debug/wget/1.24.5/lib/memchr.c /usr/src/debug/wget/1.24.5/lib/xmalloc.c /usr/src/debug/wget/1.24.5/lib/dirent.h /usr/src/debug/wget/1.24.5/lib/btowc.c /usr/src/debug/wget/1.24.5/lib/xmemdup0.c /usr/src/debug/wget/1.24.5/lib/xmemdup0.h /usr/src/debug/wget/1.24.5/lib/tmpdir.c /usr/src/debug/wget/1.24.5/lib/regex.h /usr/src/debug/wget/1.24.5/lib/tmpdir.h /usr/src/debug/wget/1.24.5/lib/fopen.c /usr/src/debug/wget/1.24.5/lib/setlocale_null-unlocked.c /usr/src/debug/wget/1.24.5/lib/quotearg.h /usr/src/debug/wget/1.24.5/lib/sha256.h /usr/src/debug/wget/1.24.5/lib/sha1.c /usr/src/debug/wget/1.24.5/lib/fseek.c /usr/src/debug/wget/1.24.5/lib/sha1.h /usr/src/
 debug/wget/1.24.5/lib/quotearg.c /usr/src/debug/wget/1.24.5/lib/sha256.c /usr/src/debug/wget/1.24.5/lib/mbchar.h /usr/src/debug/wget/1.24.5/lib/c-strcase.h /usr/src/debug/wget/1.24.5/lib/md5.c /usr/src/debug/wget/1.24.5/lib/md5.h /usr/src/debug/wget/1.24.5/lib/setlocale_null.h /usr/src/debug/wget/1.24.5/lib/c-strncasecmp.c /usr/src/debug/wget/1.24.5/lib/fseeko.c /usr/src/debug/wget/1.24.5/lib/setlocale_null.c /usr/src/debug/wget/1.24.5/lib/c-ctype.h /usr/src/debug/wget/1.24.5/lib/getopt-core.h /usr/src/debug/wget/1.24.5/lib/mbsrtowcs-state.c /usr/src/debug/wget/1.24.5/lib/fnmatch.c /usr/src/debug/wget/1.24.5/lib/base32.c /usr/src/debug/wget/1.24.5/lib/idx.h /usr/src/debug/wget/1.24.5/lib/fnmatch.h /usr/src/debug/wget/1.24.5/lib/base32.h /usr/src/debug/wget/1.24.5/lib/mbrtowc.c /usr/src/debug/wget/1.24.5/lib/regex_internal.c /usr/src/debug/wget/1.24.5/lib/af_alg.h /usr/src/debug/wget/1.24.5/lib/regex_internal.h /usr/src/debug/wget/1.24.5/lib/xalloc-die.c /usr/src/debug/wget/1.24.5/li
 b/exitfail.h /usr/src/debug/wget/1.24.5/lib/c-strcaseeq.h /usr/src/debug/wget/1.24.5/lib/exitfail.c /usr/src/debug/wget/1.24.5/lib/getopt1.c /usr/src/debug/wget/1.24.5/lib/ialloc.h /usr/src/debug/wget/1.24.5/lib/xalloc.h /usr/src/debug/wget/1.24.5/lib/strnlen1.h /usr/src/debug/wget/1.24.5/lib/mbsrtowcs-impl.h /usr/src/debug/wget/1.24.5/lib/strerror.c /usr/src/debug/wget/1.24.5/lib/strnlen1.c /usr/src/debug/wget/1.24.5/lib/basename.c /usr/src/debug/wget/1.24.5/lib/getopt.c /usr/src/debug/wget/1.24.5/lib/getopt-ext.h /usr/src/debug/wget/1.24.5/lib/getopt_int.h /usr/src/debug/wget/1.24.5/lib/uchar.h /usr/src/debug/wget/1.24.5/lib/wchar.h /usr/src/debug/wget/1.24.5/lib/fflush.c /usr/src/debug/wget/1.24.5/lib/ioctl.c /usr/src/debug/wget/1.24.5/lib/string.h /usr/src/debug/wget/1.24.5/lib/c-strcasecmp.c /usr/src/debug/wget/1.24.5/lib/fnmatch_loop.c /usr/src/debug/wget/1.24.5/lib/sha1-stream.c /usr/src/debug/wget/1.24.5/lib/mbrtoc32.c /usr/src/debug/wget/1.24.5/lib/basename-lgpl.h /usr/src/
 debug/wget/1.24.5/lib/stdlib.h /usr/src/debug/wget/1.24.5/lib/basename-lgpl.c"
packages/core2-64-poky-linux/wget/wget-src: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget-staticdev: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget-staticdev: PV changed from "1.21.4" to "1.24.5"
packages/core2-64-poky-linux/wget/wget: PKGV changed from 1.21.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/wget/wget: PKGSIZE changed from 557209 to 561305 (+1%)
packages/core2-64-poky-linux/wget/wget: PV changed from "1.21.4" to "1.24.5"

--===============3660002665077000528==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wget-upgrade-1.21.4-1.24.5.patch"

RnJvbSA0ODdlYmU0ZjIwNjFhNTU0MDkzY2Y1YzQxMDI0ZjVkZGY4ZGE5YTliIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxMTozNDo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdn
ZXQ6IHVwZ3JhZGUgMS4yMS40IC0+IDEuMjQuNQoKLS0tCiAuLi4vd2dldC93Z2V0LzAwMDItaW1w
cm92ZS1yZXByb2R1Y2liaWxpdHkucGF0Y2ggICAgICAgICB8IDkgKysrLS0tLS0tCiAuLi4vd2dl
dC97d2dldF8xLjIxLjQuYmIgPT4gd2dldF8xLjI0LjUuYmJ9ICAgICAgICAgICAgICB8IDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1leHRlbmRlZC93Z2V0L3t3Z2V0XzEuMjEuNC5iYiA9PiB3Z2V0XzEuMjQu
NS5iYn0gKDYwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0
LzAwMDItaW1wcm92ZS1yZXByb2R1Y2liaWxpdHkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvd2dldC93Z2V0LzAwMDItaW1wcm92ZS1yZXByb2R1Y2liaWxpdHkucGF0Y2gKaW5kZXggMDUw
ZmMyYzdlMS4uMThjZmM4ZTE0ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dn
ZXQvd2dldC8wMDAyLWltcHJvdmUtcmVwcm9kdWNpYmlsaXR5LnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC93Z2V0L3dnZXQvMDAwMi1pbXByb3ZlLXJlcHJvZHVjaWJpbGl0eS5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gN2YxMzU3NTI5ZDIzYjM1NmI0NWZiYjBkZDczODg1ODgx
NjJlNGNiOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjAwMGRkOGU0NTViNjBjNDI5
OGI3Yzk1MmFlMzg3YTU5ZjM4MjI1MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhv
bmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMTAgSmFuIDIw
MTggMTQ6NDM6MjAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gc3JjL01ha2VmaWxlLmFtOiBpbXBy
b3ZlIHJlcHJvZHVjaWJpbGl0eQpAQCAtNDQsMTAgKzQ0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEpv
ZSBTbGF0ZXIgPGpzbGF0ZXJAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9zcmMvTWFrZWZpbGUuYW0gYi9zcmMvTWFrZWZpbGUu
YW0KLWluZGV4IDI4YzBiZTIuLjQ0MDg0YTMgMTAwNjQ0CitpbmRleCAxOGVjNjIyLi4zOGQyNTJk
IDEwMDY0NAogLS0tIGEvc3JjL01ha2VmaWxlLmFtCiArKysgYi9zcmMvTWFrZWZpbGUuYW0KLUBA
IC04Nyw5ICs4NywxMyBAQCB2ZXJzaW9uLmM6ICAkKHdnZXRfU09VUkNFUykgLi4vbGliL2xpYmdu
dS5hCitAQCAtMTA4LDkgKzEwOCwxMyBAQCB2ZXJzaW9uLmM6ICAkKHdnZXRfU09VUkNFUykgLi4v
bGliL2xpYmdudS5hCiAgCWVjaG8gJyNpbmNsdWRlICJ2ZXJzaW9uLmgiJyA+PiAkQAogIAllY2hv
ICdjb25zdCBjaGFyICp2ZXJzaW9uX3N0cmluZyA9ICJAVkVSU0lPTkAiOycgPj4gJEAKICAJZWNo
byAnY29uc3QgY2hhciAqY29tcGlsYXRpb25fc3RyaW5nID0gIickKENPTVBJTEUpJyI7JyBcCkBA
IC02MSw2ICs2MSwzIEBAIGluZGV4IDI4YzBiZTIuLjQ0MDg0YTMgMTAwNjQ0CiAgCSAgICB8ICQo
RVNDQVBFUVVPVEUpID4+ICRACiAgCiAgY3NzLmM6ICQoc3JjZGlyKS9jc3MubAotLS0gCi0xLjgu
My4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC93Z2V0L3dnZXRfMS4yMS40
LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dnZXQvd2dldF8xLjI0LjUuYmIKc2ltaWxhcml0
eSBpbmRleCA2MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dnZXQvd2dldF8x
LjIxLjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC93Z2V0L3dnZXRfMS4yNC41
LmJiCmluZGV4IDFkMzFiMDExNmQuLjY0ZTZlZTgwYWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC93Z2V0L3dnZXRfMS4yMS40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC93Z2V0L3dnZXRfMS4yNC41LmJiCkBAIC0yLDYgKzIsNiBAQCBTUkNfVVJJID0gIiR7R05VX01J
UlJPUn0vd2dldC93Z2V0LSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLWlt
cHJvdmUtcmVwcm9kdWNpYmlsaXR5LnBhdGNoIFwKICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI4MTU0MmY1Y2VmYjhmYWFjYzM5YmJiYzZjODJkZWQ4MGUzZTRhODg1MDVhZTcy
ZWE1MWRmMjc1MjViY2RlMDRjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImZhMmRjMzViYWI1MTg0
ZWNiYzQ2YTllZjgzZGVmMmFhYWEzZjRjOWYzYzk3ZDRiZDE5ZGNiMDdkNGRhNjM3ZGUiCiAKIHJl
cXVpcmUgd2dldC5pbmMKLS0gCjIuNDIuMAoK

--===============3660002665077000528==--

