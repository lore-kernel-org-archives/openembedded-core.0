Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82834C1B0D9
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:22 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.8094.1739623333240363604
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JjxCFJwk;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=myqrHNJQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019509a19e61-a7ce7d9f-b9bd-4e1c-b00c-3bcc9ded616f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623341;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rKcELhnqOp154f3I8LsmJdwarTEbb5e3WMIutUY+rAw=;
	b=JjxCFJwkGllY+zvLhYFTYlfktrBdWbDwAzcanPeUFLMoudG0X7uabg99jnTJkrZQ
	h07M1bmVSdXM09Q9NvKk6P4qa5Dkc6HEyAd11Xfxy9Zz8EVdOG8Vs9QMzgoOka/FMDu
	vAhNvCx5gcPjvFJgIp0bFnXB+7zJmpF2AAWbFRQ0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623341;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rKcELhnqOp154f3I8LsmJdwarTEbb5e3WMIutUY+rAw=;
	b=myqrHNJQ08Gm4R+OnSAobAeKX3HyYQImdcUwIq96MkJatyJX4X9i0sZnJCxVQyeS
	zMXrJnuFgTD3SPitGa43XXR9Eubquf7gHwMdB1ahLdIfNOwj/X23+xYdnhecxu90Rzi
	h2oS9+1Ej2RUjV4I6Na/5yUw1Nn6esMfLv5xRbtY=
Content-Type: multipart/mixed; boundary="===============5780881170939485180=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffutils: upgrading to 3.11 SUCCEEDED
Message-ID: <0101019509a19e61-a7ce7d9f-b9bd-4e1c-b00c-3bcc9ded616f-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211438

--===============5780881170939485180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffutils* to *3.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffutils-upgrade-3.10-3.11.patch
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
From d619e28f4ee8bd7cfaa203a1d82bb55b81ea8ebe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 08:37:14 +0000
Subject: [PATCH] diffutils: upgrade 3.10 -> 3.11

---
 .../diffutils/0001-Skip-strip-trailing-cr-test-case.patch  | 7 +++----
 .../diffutils/{diffutils_3.10.bb => diffutils_3.11.bb}     | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/diffutils/{diffutils_3.10.bb => diffutils_3.11.bb} (93%)

diff --git a/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch b/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
index 32793233f9..81c35c0228 100644
--- a/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
+++ b/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
@@ -1,4 +1,4 @@
-From f31395c931bc633206eccfcfaaaa5d15021a3e86 Mon Sep 17 00:00:00 2001
+From 5cd585dd6201abc6520471f497f7f0f602a6a625 Mon Sep 17 00:00:00 2001
 From: Peiran Hong <peiran.hong@windriver.com>
 Date: Thu, 5 Sep 2019 15:42:22 -0400
 Subject: [PATCH] Skip strip-trailing-cr test case
@@ -10,16 +10,15 @@ package.
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
-
 ---
  tests/Makefile.am | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 79bacfb..4adb4d7 100644
+index adbb10d..3962c2c 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -22,7 +22,6 @@ TESTS = \
+@@ -28,7 +28,6 @@ TESTS = \
    stdin \
    strcoll-0-names \
    filename-quoting \
diff --git a/meta/recipes-extended/diffutils/diffutils_3.10.bb b/meta/recipes-extended/diffutils/diffutils_3.11.bb
similarity index 93%
rename from meta/recipes-extended/diffutils/diffutils_3.10.bb
rename to meta/recipes-extended/diffutils/diffutils_3.11.bb
index 08e8305612..8f5a87c2db 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.10.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.11.bb
@@ -8,7 +8,7 @@ SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
            file://0001-Skip-strip-trailing-cr-test-case.patch \
            "
 
-SRC_URI[sha256sum] = "90e5e93cc724e4ebe12ede80df1634063c7a855692685919bfe60b556c9bd09e"
+SRC_URI[sha256sum] = "a73ef05fe37dd585f7d87068e4a0639760419f810138bd75c61ddaa1f9e2131e"
 
 EXTRA_OECONF += "ac_cv_path_PR_PROGRAM=${bindir}/pr --without-libsigsegv-prefix"
 
-- 
2.44.1


--===============5780881170939485180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffutils/diffutils-dbg: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-dbg: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-dbg: PKGSIZE changed from 1601920 to 1516728 (-5%)
packages/core2-64-poky-linux/diffutils/diffutils-dev: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-dev: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-doc: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-doc: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-doc: PKGSIZE changed from 241386 to 244493 (+1%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-bg: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-bg: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-bg: PKGSIZE changed from 46905 to 49014 (+4%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-ca: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-ca: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-ca: PKGSIZE changed from 7925 to 7792 (-2%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-cs: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-cs: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-cs: PKGSIZE changed from 35815 to 37477 (+5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-da: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-da: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-da: PKGSIZE changed from 33337 to 32644 (-2%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-de: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-de: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-de: PKGSIZE changed from 37041 to 38766 (+5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-el: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-el: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-el: PKGSIZE changed from 42953 to 40836 (-5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-eo: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-eo: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-eo: PKGSIZE changed from 34051 to 32425 (-5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-es: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-es: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-es: PKGSIZE changed from 36766 to 34985 (-5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-fi: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-fi: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-fi: PKGSIZE changed from 35517 to 33724 (-5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-fr: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-fr: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-fr: PKGSIZE changed from 36886 to 38647 (+5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-ga: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-ga: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-ga: PKGSIZE changed from 7704 to 7627 (-1%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-gl: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-gl: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-gl: PKGSIZE changed from 10100 to 9889 (-2%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-he: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-he: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-he: PKGSIZE changed from 6130 to 7111 (+16%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-hr: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-hr: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-hr: PKGSIZE changed from 35574 to 37281 (+5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-hu: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-hu: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-hu: PKGSIZE changed from 37088 to 35287 (-5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-id: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-id: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-id: PKGSIZE changed from 33980 to 35663 (+5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-it: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-it: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-it: PKGSIZE changed from 32960 to 31597 (-4%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-ja: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-ja: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-ja: PKGSIZE changed from 30247 to 29997 (-1%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-ka: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-ka: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-ka: PKGSIZE changed from 44891 to 42289 (-6%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-ko: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-ko: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-ko: PKGSIZE changed from 35758 to 34063 (-5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-lv: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-lv: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-lv: PKGSIZE changed from 31067 to 32393 (+4%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-ms: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-ms: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-ms: PKGSIZE changed from 33924 to 32775 (-3%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-nb: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-nb: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-nb: PKGSIZE changed from 34399 to 32689 (-5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-nl: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-nl: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-nl: PKGSIZE changed from 36324 to 38046 (+5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-pl: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-pl: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-pl: PKGSIZE changed from 35454 to 37267 (+5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-pt-br: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-pt-br: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-pt-br: PKGSIZE changed from 36824 to 38638 (+5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-pt: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-pt: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-pt: PKGSIZE changed from 34636 to 32972 (-5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-ro: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-ro: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-ro: PKGSIZE changed from 37888 to 39701 (+5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-ru: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-ru: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-ru: PKGSIZE changed from 43910 to 41754 (-5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-sr: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-sr: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-sr: PKGSIZE changed from 42102 to 44274 (+5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-sv: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-sv: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-sv: PKGSIZE changed from 34038 to 35641 (+5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-tr: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-tr: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-tr: PKGSIZE changed from 35563 to 33866 (-5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-uk: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-uk: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-uk: PKGSIZE changed from 44968 to 47093 (+5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-vi: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-vi: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-vi: PKGSIZE changed from 37426 to 35548 (-5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-zh-cn: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-zh-cn: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-zh-cn: PKGSIZE changed from 34198 to 35965 (+5%)
packages/core2-64-poky-linux/diffutils/diffutils-locale-zh-tw: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-locale-zh-tw: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-locale-zh-tw: PKGSIZE changed from 33672 to 35426 (+5%)
packages/core2-64-poky-linux/diffutils/diffutils-ptest: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-ptest: FILELIST: added "/usr/lib/diffutils/ptest/tests/ignore-tab-expansion /usr/lib/diffutils/ptest/tests/bug-64316 /usr/lib/diffutils/ptest/tests/expand-tabs /usr/lib/diffutils/ptest/tests/starting-file /usr/lib/diffutils/ptest/tests/side-by-side /usr/lib/diffutils/ptest/tests/ignore-case"
packages/core2-64-poky-linux/diffutils/diffutils-ptest: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-ptest: PKGSIZE changed from 273282 to 343470 (+26%)
packages/core2-64-poky-linux/diffutils/diffutils-src: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-src: FILELIST: directory renamed /usr/src/debug/diffutils/3.10/lib/malloc -> /usr/src/debug/diffutils/3.11/lib/malloc, removed "/usr/src/debug/diffutils/3.10/lib/setlocale_null.c /usr/src/debug/diffutils/3.10/lib/xmalloc.c /usr/src/debug/diffutils/3.10/lib/mbrtowc.c /usr/src/debug/diffutils/3.10/lib/regexec.c /usr/src/debug/diffutils/3.10/lib/setlocale_null.h /usr/src/debug/diffutils/3.10/src/ed.c /usr/src/debug/diffutils/3.10/lib/filenamecat.c /usr/src/debug/diffutils/3.10/lib/malloca.h /usr/src/debug/diffutils/3.10/lib/stdopen.h /usr/src/debug/diffutils/3.10/lib/filenamecat.h /usr/src/debug/diffutils/3.10/lib/stdopen.c /usr/src/debug/diffutils/3.10/src/io.c /usr/src/debug/diffutils/3.10/lib/freopen.c /usr/src/debug/diffutils/3.10/lib/fnmatch.h /usr/src/debug/diffutils/3.10/lib/trim.h /usr/src/debug/diffutils/3.10/lib/mbsrtowcs-impl.h /usr/src/debug/diffutils/3.10/lib/malloca.c /usr/src/debug/diffutils/3.10/lib/hard-locale.c /usr/src/
 debug/diffutils/3.10/lib/fnmatch.c /usr/src/debug/diffutils/3.10/lib/trim.c /usr/src/debug/diffutils/3.10/lib/hard-locale.h /usr/src/debug/diffutils/3.10/lib/exclude.c /usr/src/debug/diffutils/3.10/lib/gettime.c /usr/src/debug/diffutils/3.10/lib/xstriconv.c /usr/src/debug/diffutils/3.10/src/diff.h /usr/src/debug/diffutils/3.10/lib/c-ctype.h /usr/src/debug/diffutils/3.10/lib/exclude.h /usr/src/debug/diffutils/3.10/lib/xstriconv.h /usr/src/debug/diffutils/3.10/src/diff.c /usr/src/debug/diffutils/3.10/lib/stackvma.c /usr/src/debug/diffutils/3.10/lib/version-etc.h /usr/src/debug/diffutils/3.10/lib/version-etc.c /usr/src/debug/diffutils/3.10/lib/stackvma.h /usr/src/debug/diffutils/3.10/lib/localcharset.h /usr/src/debug/diffutils/3.10/lib/xstrtol.h /usr/src/debug/diffutils/3.10/lib/localcharset.c /usr/src/debug/diffutils/3.10/lib/xstrtol.c /usr/src/debug/diffutils/3.10/lib/sh-quote.c /usr/src/debug/diffutils/3.10/lib/strnlen1.h /usr/src/debug/diffutils/3.10/lib/sh-quote.h /usr/src/debug/d
 iffutils/3.10/lib/strnlen1.c /usr/src/debug/diffutils/3.10/lib/mbsrtowcs-state.c /usr/src/debug/diffutils/3.10/lib/inttostr.h /usr/src/debug/diffutils/3.10/lib/anytostr.c /usr/src/debug/diffutils/3.10/lib/c-strcasecmp.c /usr/src/debug/diffutils/3.10/lib/cmpbuf.h /usr/src/debug/diffutils/3.10/lib/ialloc.h /usr/src/debug/diffutils/3.10/lib/mbchar.h /usr/src/debug/diffutils/3.10/lib/mbiter.h /usr/src/debug/diffutils/3.10/lib/stdlib.h /usr/src/debug/diffutils/3.10/lib/mbchar.c /usr/src/debug/diffutils/3.10/lib/mbslen.c /usr/src/debug/diffutils/3.10/lib/mbsstr.c /usr/src/debug/diffutils/3.10/lib/memchr.c /usr/src/debug/diffutils/3.10/lib/cmpbuf.c /usr/src/debug/diffutils/3.10/lib/getopt.c /usr/src/debug/diffutils/3.10/src/dir.c /usr/src/debug/diffutils/3.10/lib/c-stack.c /usr/src/debug/diffutils/3.10/lib/regex_internal.h /usr/src/debug/diffutils/3.10/lib/areadlink.h /usr/src/debug/diffutils/3.10/lib/careadlinkat.h /usr/src/debug/diffutils/3.10/lib/propername.h /usr/src/debug/diffutils/3.
 10/lib/xreadlink.h /usr/src/debug/diffutils/3.10/lib/mbscasecmp.c /usr/src/debug/diffutils/3.10/lib/propername.c /usr/src/debug/diffutils/3.10/lib/areadlink.c /usr/src/debug/diffutils/3.10/lib/careadlinkat.c /usr/src/debug/diffutils/3.10/lib/c-stack.h /usr/src/debug/diffutils/3.10/lib/regex_internal.c /usr/src/debug/diffutils/3.10/lib/xreadlink.c /usr/src/debug/diffutils/3.10/lib/getopt_int.h /usr/src/debug/diffutils/3.10/lib/sigsegv.c /usr/src/debug/diffutils/3.10/src/util.c /usr/src/debug/diffutils/3.10/lib/sigsegv.h /usr/src/debug/diffutils/3.10/lib/xfreopen.h /usr/src/debug/diffutils/3.10/lib/xstdopen.h /usr/src/debug/diffutils/3.10/lib/xfreopen.c /usr/src/debug/diffutils/3.10/lib/xstdopen.c /usr/src/debug/diffutils/3.10/lib/filenamecat-lgpl.c /usr/src/debug/diffutils/3.10/lib/timespec.h /usr/src/debug/diffutils/3.10/lib/getprogname.c /usr/src/debug/diffutils/3.10/src/context.c /usr/src/debug/diffutils/3.10/lib/btowc.c /usr/src/debug/diffutils/3.10/lib/time.h /usr/src/debug/diff
 utils/3.10/lib/fcntl.c /usr/src/debug/diffutils/3.10/lib/allocator.h /usr/src/debug/diffutils/3.10/lib/basename-lgpl.h /usr/src/debug/diffutils/3.10/lib/exitfail.c /usr/src/debug/diffutils/3.10/src/version.h /usr/src/debug/diffutils/3.10/lib/allocator.c /usr/src/debug/diffutils/3.10/lib/basename-lgpl.c /usr/src/debug/diffutils/3.10/lib/idx.h /usr/src/debug/diffutils/3.10/lib/fcntl.h /usr/src/debug/diffutils/3.10/lib/exitfail.h /usr/src/debug/diffutils/3.10/lib/getopt1.c /usr/src/debug/diffutils/3.10/lib/stdio.h /usr/src/debug/diffutils/3.10/lib/wchar.h /usr/src/debug/diffutils/3.10/src/version.c /usr/src/debug/diffutils/3.10/lib/quote.h /usr/src/debug/diffutils/3.10/lib/getopt-ext.h /usr/src/debug/diffutils/3.10/lib/mbsrtowcs.c /usr/src/debug/diffutils/3.10/lib/getopt-core.h /usr/src/debug/diffutils/3.10/lib/c-strcase.h /usr/src/debug/diffutils/3.10/lib/xmalloca.c /usr/src/debug/diffutils/3.10/lib/c-strcaseeq.h /usr/src/debug/diffutils/3.10/lib/regcomp.c /usr/src/debug/diffutils/3.1
 0/lib/str-kmp.h /usr/src/debug/diffutils/3.10/lib/xmalloca.h /usr/src/debug/diffutils/3.10/lib/fnmatch_loop.c /usr/src/debug/diffutils/3.10/lib/quotearg.h /usr/src/debug/diffutils/3.10/lib/quotearg.c /usr/src/debug/diffutils/3.10/lib/hash.c /usr/src/debug/diffutils/3.10/lib/mbuiter.h /usr/src/debug/diffutils/3.10/lib/binary-io.h /usr/src/debug/diffutils/3.10/lib/hash.h /usr/src/debug/diffutils/3.10/lib/string.h /usr/src/debug/diffutils/3.10/lib/striconv.h /usr/src/debug/diffutils/3.10/lib/xalloc.h /usr/src/debug/diffutils/3.10/src/cmp.c /usr/src/debug/diffutils/3.10/lib/striconv.c /usr/src/debug/diffutils/3.10/lib/nstrftime.c /usr/src/debug/diffutils/3.10/lib/stat-time.h /usr/src/debug/diffutils/3.10/lib/file-type.h /usr/src/debug/diffutils/3.10/src/diff3.c /usr/src/debug/diffutils/3.10/lib/file-type.c /usr/src/debug/diffutils/3.10/lib/time_rz.c /usr/src/debug/diffutils/3.10/src/ifdef.c /usr/src/debug/diffutils/3.10/src/sdiff.c /usr/src/debug/diffutils/3.10/lib/progname.c /usr/src/d
 ebug/diffutils/3.10/lib/progname.h /usr/src/debug/diffutils/3.10/lib/strftime.h /usr/src/debug/diffutils/3.10/lib/version-etc-fsf.c /usr/src/debug/diffutils/3.10/lib/diffseq.h /usr/src/debug/diffutils/3.10/src/normal.c /usr/src/debug/diffutils/3.10/lib/time-internal.h /usr/src/debug/diffutils/3.10/lib/xalloc-die.c /usr/src/debug/diffutils/3.10/src/system.h /usr/src/debug/diffutils/3.10/src/side.c /usr/src/debug/diffutils/3.10/src/analyze.c /usr/src/debug/diffutils/3.10/lib/bitrotate.h /usr/src/debug/diffutils/3.10/lib/fopen.c /usr/src/debug/diffutils/3.10/lib/regex.h", added "/usr/src/debug/diffutils/3.11/lib/setlocale_null.c /usr/src/debug/diffutils/3.11/lib/regexec.c /usr/src/debug/diffutils/3.11/lib/mbrtowc.c /usr/src/debug/diffutils/3.11/lib/setlocale_null.h /usr/src/debug/diffutils/3.11/lib/propername-lite.c /usr/src/debug/diffutils/3.11/lib/xmalloc.c /usr/src/debug/diffutils/3.11/lib/filenamecat.c /usr/src/debug/diffutils/3.11/src/ed.c /usr/src/debug/diffutils/3.11/lib/malloca
 .h /usr/src/debug/diffutils/3.11/lib/stdopen.h /usr/src/debug/diffutils/3.11/lib/filenamecat.h /usr/src/debug/diffutils/3.11/lib/stdopen.c /usr/src/debug/diffutils/3.11/src/io.c /usr/src/debug/diffutils/3.11/lib/freopen.c /usr/src/debug/diffutils/3.11/lib/fnmatch.h /usr/src/debug/diffutils/3.11/lib/malloca.c /usr/src/debug/diffutils/3.11/lib/mbsrtowcs-impl.h /usr/src/debug/diffutils/3.11/lib/hard-locale.c /usr/src/debug/diffutils/3.11/lib/fnmatch.c /usr/src/debug/diffutils/3.11/lib/hard-locale.h /usr/src/debug/diffutils/3.11/lib/exclude.c /usr/src/debug/diffutils/3.11/lib/c-file-type.c /usr/src/debug/diffutils/3.11/src/diff.h /usr/src/debug/diffutils/3.11/lib/c-ctype.h /usr/src/debug/diffutils/3.11/lib/exclude.h /usr/src/debug/diffutils/3.11/src/diff.c /usr/src/debug/diffutils/3.11/lib/stackvma.c /usr/src/debug/diffutils/3.11/lib/version-etc.h /usr/src/debug/diffutils/3.11/lib/version-etc.c /usr/src/debug/diffutils/3.11/lib/stackvma.h /usr/src/debug/diffutils/3.11/lib/localcharset.h
  /usr/src/debug/diffutils/3.11/lib/xstrtol.h /usr/src/debug/diffutils/3.11/lib/localcharset.c /usr/src/debug/diffutils/3.11/lib/reallocarray.c /usr/src/debug/diffutils/3.11/lib/xstrtol.c /usr/src/debug/diffutils/3.11/lib/sh-quote.c /usr/src/debug/diffutils/3.11/lib/strnlen1.h /usr/src/debug/diffutils/3.11/lib/sh-quote.h /usr/src/debug/diffutils/3.11/lib/strnlen1.c /usr/src/debug/diffutils/3.11/lib/mbsrtowcs-state.c /usr/src/debug/diffutils/3.11/lib/c-strcasecmp.c /usr/src/debug/diffutils/3.11/lib/string.h /usr/src/debug/diffutils/3.11/lib/xalloc.h /usr/src/debug/diffutils/3.11/lib/cmpbuf.h /usr/src/debug/diffutils/3.11/lib/dirent.h /usr/src/debug/diffutils/3.11/lib/ialloc.h /usr/src/debug/diffutils/3.11/lib/mbrtoc32.c /usr/src/debug/diffutils/3.11/lib/stdlib.h /usr/src/debug/diffutils/3.11/lib/cmpbuf.c /usr/src/debug/diffutils/3.11/lib/getopt.c /usr/src/debug/diffutils/3.11/lib/memchr.c /usr/src/debug/diffutils/3.11/src/dir.c /usr/src/debug/diffutils/3.11/lib/c-stack.c /usr/src/debu
 g/diffutils/3.11/lib/regex_internal.h /usr/src/debug/diffutils/3.11/lib/careadlinkat.h /usr/src/debug/diffutils/3.11/lib/propername.h /usr/src/debug/diffutils/3.11/lib/mbscasecmp.c /usr/src/debug/diffutils/3.11/lib/careadlinkat.c /usr/src/debug/diffutils/3.11/lib/getopt_int.h /usr/src/debug/diffutils/3.11/lib/c-stack.h /usr/src/debug/diffutils/3.11/lib/regex_internal.c /usr/src/debug/diffutils/3.11/lib/sigsegv.c /usr/src/debug/diffutils/3.11/src/util.c /usr/src/debug/diffutils/3.11/lib/sigsegv.h /usr/src/debug/diffutils/3.11/lib/xfreopen.h /usr/src/debug/diffutils/3.11/lib/xstdopen.h /usr/src/debug/diffutils/3.11/lib/xfreopen.c /usr/src/debug/diffutils/3.11/lib/xstdopen.c /usr/src/debug/diffutils/3.11/lib/filenamecat-lgpl.c /usr/src/debug/diffutils/3.11/lib/timespec.h /usr/src/debug/diffutils/3.11/lib/mcel.h /usr/src/debug/diffutils/3.11/lib/getprogname.c /usr/src/debug/diffutils/3.11/src/context.c /usr/src/debug/diffutils/3.11/lib/time.h /usr/src/debug/diffutils/3.11/lib/fopen.c /u
 sr/src/debug/diffutils/3.11/lib/fcntl.c /usr/src/debug/diffutils/3.11/lib/allocator.h /usr/src/debug/diffutils/3.11/lib/basename-lgpl.h /usr/src/debug/diffutils/3.11/lib/exitfail.c /usr/src/debug/diffutils/3.11/src/version.h /usr/src/debug/diffutils/3.11/lib/allocator.c /usr/src/debug/diffutils/3.11/lib/basename-lgpl.c /usr/src/debug/diffutils/3.11/lib/idx.h /usr/src/debug/diffutils/3.11/lib/fcntl.h /usr/src/debug/diffutils/3.11/lib/exitfail.h /usr/src/debug/diffutils/3.11/lib/getopt1.c /usr/src/debug/diffutils/3.11/lib/stdio.h /usr/src/debug/diffutils/3.11/lib/uchar.h /usr/src/debug/diffutils/3.11/lib/wchar.h /usr/src/debug/diffutils/3.11/src/version.c /usr/src/debug/diffutils/3.11/lib/quote.h /usr/src/debug/diffutils/3.11/lib/getopt-ext.h /usr/src/debug/diffutils/3.11/lib/mbsrtowcs.c /usr/src/debug/diffutils/3.11/lib/getopt-core.h /usr/src/debug/diffutils/3.11/lib/c-strcase.h /usr/src/debug/diffutils/3.11/lib/xmalloca.c /usr/src/debug/diffutils/3.11/lib/c-strcaseeq.h /usr/src/debu
 g/diffutils/3.11/lib/regcomp.c /usr/src/debug/diffutils/3.11/lib/xmalloca.h /usr/src/debug/diffutils/3.11/lib/fnmatch_loop.c /usr/src/debug/diffutils/3.11/lib/diagnose.c /usr/src/debug/diffutils/3.11/lib/diagnose.h /usr/src/debug/diffutils/3.11/lib/quotearg.h /usr/src/debug/diffutils/3.11/lib/quotearg.c /usr/src/debug/diffutils/3.11/lib/hash.c /usr/src/debug/diffutils/3.11/lib/binary-io.h /usr/src/debug/diffutils/3.11/lib/hash.h /usr/src/debug/diffutils/3.11/src/cmp.c /usr/src/debug/diffutils/3.11/lib/stat-time.h /usr/src/debug/diffutils/3.11/lib/file-type.h /usr/src/debug/diffutils/3.11/src/diff3.c /usr/src/debug/diffutils/3.11/lib/time_rz.c /usr/src/debug/diffutils/3.11/src/ifdef.c /usr/src/debug/diffutils/3.11/src/sdiff.c /usr/src/debug/diffutils/3.11/lib/progname.c /usr/src/debug/diffutils/3.11/lib/strftime.c /usr/src/debug/diffutils/3.11/lib/progname.h /usr/src/debug/diffutils/3.11/lib/strftime.h /usr/src/debug/diffutils/3.11/lib/version-etc-fsf.c /usr/src/debug/diffutils/3.11/
 lib/diffseq.h /usr/src/debug/diffutils/3.11/src/normal.c /usr/src/debug/diffutils/3.11/src/system.c /usr/src/debug/diffutils/3.11/lib/time-internal.h /usr/src/debug/diffutils/3.11/lib/xalloc-die.c /usr/src/debug/diffutils/3.11/src/system.h /usr/src/debug/diffutils/3.11/src/side.c /usr/src/debug/diffutils/3.11/src/analyze.c /usr/src/debug/diffutils/3.11/lib/setlocale_null-unlocked.c /usr/src/debug/diffutils/3.11/lib/bitrotate.h /usr/src/debug/diffutils/3.11/lib/btowc.c /usr/src/debug/diffutils/3.11/lib/regex.h"
packages/core2-64-poky-linux/diffutils/diffutils-src: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils-src: PKGSIZE changed from 1913543 to 2027958 (+6%)
packages/core2-64-poky-linux/diffutils/diffutils-staticdev: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils-staticdev: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils/diffutils: PV changed from "3.10" to "3.11"
packages/core2-64-poky-linux/diffutils/diffutils: PKGSIZE changed from 451552 to 427184 (-5%)
packages/core2-64-poky-linux/diffutils: PKGV changed from 3.10 [default] to 3.11 [default]
packages/core2-64-poky-linux/diffutils: SRC_URI changed from "https://ftp.gnu.org/gnu/diffutils/diffutils-3.10.tar.xz file://run-ptest file://0001-Skip-strip-trailing-cr-test-case.patch" to "https://ftp.gnu.org/gnu/diffutils/diffutils-3.11.tar.xz file://run-ptest file://0001-Skip-strip-trailing-cr-test-case.patch"
packages/core2-64-poky-linux/diffutils: PV changed from "3.10" to "3.11"

--===============5780881170939485180==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffutils-upgrade-3.10-3.11.patch"

RnJvbSBkNjE5ZTI4ZjRlZThiZDdjZmFhMjAzYTFkODJiYjU1YjgxZWE4ZWJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDg6Mzc6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmdXRpbHM6IHVwZ3JhZGUgMy4xMCAtPiAzLjExCgotLS0KIC4uLi9kaWZmdXRpbHMvMDAwMS1T
a2lwLXN0cmlwLXRyYWlsaW5nLWNyLXRlc3QtY2FzZS5wYXRjaCAgfCA3ICsrKy0tLS0KIC4uLi9k
aWZmdXRpbHMve2RpZmZ1dGlsc18zLjEwLmJiID0+IGRpZmZ1dGlsc18zLjExLmJifSAgICAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZGlmZnV0aWxzL3tkaWZmdXRpbHNfMy4xMC5iYiA9
PiBkaWZmdXRpbHNfMy4xMS5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvZGlmZnV0aWxzL2RpZmZ1dGlscy8wMDAxLVNraXAtc3RyaXAtdHJhaWxpbmctY3ItdGVz
dC1jYXNlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2RpZmZ1dGlscy9kaWZmdXRpbHMv
MDAwMS1Ta2lwLXN0cmlwLXRyYWlsaW5nLWNyLXRlc3QtY2FzZS5wYXRjaAppbmRleCAzMjc5MzIz
M2Y5Li44MWMzNWMwMjI4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZGlmZnV0
aWxzL2RpZmZ1dGlscy8wMDAxLVNraXAtc3RyaXAtdHJhaWxpbmctY3ItdGVzdC1jYXNlLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9kaWZmdXRpbHMvZGlmZnV0aWxzLzAwMDEtU2tp
cC1zdHJpcC10cmFpbGluZy1jci10ZXN0LWNhc2UucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGYzMTM5NWM5MzFiYzYzMzIwNmVjY2ZjZmFhYWE1ZDE1MDIxYTNlODYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDVjZDU4NWRkNjIwMWFiYzY1MjA0NzFmNDk3ZjdmMGY2MDJhNmE2MjUg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQZWlyYW4gSG9uZyA8cGVpcmFuLmhvbmdA
d2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgNSBTZXAgMjAxOSAxNTo0MjoyMiAtMDQwMAogU3Vi
amVjdDogW1BBVENIXSBTa2lwIHN0cmlwLXRyYWlsaW5nLWNyIHRlc3QgY2FzZQpAQCAtMTAsMTYg
KzEwLDE1IEBAIHBhY2thZ2UuCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2VtYmVk
ZGVkIHNwZWNpZmljXQogCiBTaWduZWQtb2ZmLWJ5OiBQZWlyYW4gSG9uZyA8cGVpcmFuLmhvbmdA
d2luZHJpdmVyLmNvbT4KLQogLS0tCiAgdGVzdHMvTWFrZWZpbGUuYW0gfCAxIC0KICAxIGZpbGUg
Y2hhbmdlZCwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdHMvTWFrZWZpbGUuYW0g
Yi90ZXN0cy9NYWtlZmlsZS5hbQotaW5kZXggNzliYWNmYi4uNGFkYjRkNyAxMDA2NDQKK2luZGV4
IGFkYmIxMGQuLjM5NjJjMmMgMTAwNjQ0CiAtLS0gYS90ZXN0cy9NYWtlZmlsZS5hbQogKysrIGIv
dGVzdHMvTWFrZWZpbGUuYW0KLUBAIC0yMiw3ICsyMiw2IEBAIFRFU1RTID0gXAorQEAgLTI4LDcg
KzI4LDYgQEAgVEVTVFMgPSBcCiAgICBzdGRpbiBcCiAgICBzdHJjb2xsLTAtbmFtZXMgXAogICAg
ZmlsZW5hbWUtcXVvdGluZyBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZGlm
ZnV0aWxzL2RpZmZ1dGlsc18zLjEwLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2RpZmZ1dGls
cy9kaWZmdXRpbHNfMy4xMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvZGlmZnV0aWxzL2RpZmZ1dGlsc18zLjEwLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZGlmZnV0aWxzL2RpZmZ1dGlsc18zLjExLmJiCmluZGV4IDA4
ZTgzMDU2MTIuLjhmNWE4N2MyZGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9k
aWZmdXRpbHMvZGlmZnV0aWxzXzMuMTAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Rp
ZmZ1dGlscy9kaWZmdXRpbHNfMy4xMS5iYgpAQCAtOCw3ICs4LDcgQEAgU1JDX1VSSSA9ICIke0dO
VV9NSVJST1J9L2RpZmZ1dGlscy9kaWZmdXRpbHMtJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAg
ZmlsZTovLzAwMDEtU2tpcC1zdHJpcC10cmFpbGluZy1jci10ZXN0LWNhc2UucGF0Y2ggXAogICAg
ICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5MGU1ZTkzY2M3MjRlNGViZTEyZWRl
ODBkZjE2MzQwNjNjN2E4NTU2OTI2ODU5MTliZmU2MGI1NTZjOWJkMDllIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gImE3M2VmMDVmZTM3ZGQ1ODVmN2Q4NzA2OGU0YTA2Mzk3NjA0MTlmODEwMTM4YmQ3
NWM2MWRkYWExZjllMjEzMWUiCiAKIEVYVFJBX09FQ09ORiArPSAiYWNfY3ZfcGF0aF9QUl9QUk9H
UkFNPSR7YmluZGlyfS9wciAtLXdpdGhvdXQtbGlic2lnc2Vndi1wcmVmaXgiCiAKLS0gCjIuNDQu
MQoK

--===============5780881170939485180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/diffutils/diffutils-locale-he: PKGSIZE changed from 6130 to 7111 (+16%)
packages/core2-64-poky-linux/diffutils/diffutils-ptest: PKGSIZE changed from 273282 to 343470 (+26%)
packages/core2-64-poky-linux/diffutils/diffutils-ptest: FILELIST: added "/usr/lib/diffutils/ptest/tests/ignore-case /usr/lib/diffutils/ptest/tests/side-by-side /usr/lib/diffutils/ptest/tests/bug-64316 /usr/lib/diffutils/ptest/tests/expand-tabs /usr/lib/diffutils/ptest/tests/starting-file /usr/lib/diffutils/ptest/tests/ignore-tab-expansion"

--===============5780881170939485180==--

