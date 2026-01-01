Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7413EED601
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:37:59 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102963.1767267469816444683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ffls0Tx1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IxJgAoww;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019b79599de2-2a1fec33-4666-40f1-b38d-3a5493272ecc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267475;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Vu0dYNwZQIQOWLDFi1B+wrcDnOsDh0/OkTI5cfZDVks=;
	b=ffls0Tx1mXOdwj3+cYxZPesu6qk3AKrkbzNEnf8pTaOOKS+WCn3SL0qHjragtqZL
	w02cItdUWJPkHHSGi9+84zz1pgYQq4vB4lN8m8gcrEIhLYO8I0/C+2yLM13Yci0dx0V
	XC9aMeQQ+i5xS4T8oU09PouCLIeePD7ZA/rr7as4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267475;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Vu0dYNwZQIQOWLDFi1B+wrcDnOsDh0/OkTI5cfZDVks=;
	b=IxJgAoww+6NbPTHBm208qu9Ztr+NRiJ7vb8kHmgEyXnzFHGb3OGd0pnFHUWOW4JH
	BM0V5BoPb4P8aDPHUz8j/zN2pYe7R9Ri4rDcZQjZSxJq4gjJ+WHPJwPfqpO8uRVHmNb
	+uZV77zsK2fb+q0XbLcjF0OGB8fXK30xgb4Xwbac=
Content-Type: multipart/mixed; boundary="===============3264223445194574506=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-testtools: upgrading to 2.8.2 SUCCEEDED
Message-ID: <0101019b79599de2-2a1fec33-4666-40f1-b38d-3a5493272ecc-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228778

--===============3264223445194574506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-testtools* to *2.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-testtools-upgrade-2.8.1-2.8.2.patch
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
From 7919446841741d53e46994812ed3b9471fd4dbe6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 08:14:36 +0000
Subject: [PATCH] python3-testtools: upgrade 2.8.1 -> 2.8.2

---
 .../{python3-testtools_2.8.1.bb => python3-testtools_2.8.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-testtools_2.8.1.bb => python3-testtools_2.8.2.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-testtools_2.8.1.bb b/meta/recipes-devtools/python/python3-testtools_2.8.2.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-testtools_2.8.1.bb
rename to meta/recipes-devtools/python/python3-testtools_2.8.2.bb
index 29a28d80da..c51fac2242 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.8.1.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.8.2.bb
@@ -8,7 +8,7 @@ DEPENDS += "python3-hatch-vcs-native"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "da5102b02b6d9924607d31dda6deb26a085a78afa78826bf44e3b8717fc77208"
+SRC_URI[sha256sum] = "b5c73332456ff54152062d47a58bc4f15f8e23514afec4e84775af124fb7db43"
 
 RDEPENDS:${PN} += "\
     python3-compression \
-- 
2.47.1


--===============3264223445194574506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-testtools: PV changed from "2.8.1" to "2.8.2"
packages/x86-64-v3-poky-linux/python3-testtools: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/x86-64-v3-poky-linux/python3-testtools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/testtools/testtools-2.8.1.tar.gz;downloadfilename=testtools-2.8.1.tar.gz" to "https://files.pythonhosted.org/packages/source/t/testtools/testtools-2.8.2.tar.gz;downloadfilename=testtools-2.8.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dbg: PV changed from "2.8.1" to "2.8.2"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dbg: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dev: PV changed from "2.8.1" to "2.8.2"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dev: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-doc: PV changed from "2.8.1" to "2.8.2"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-doc: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-locale: PV changed from "2.8.1" to "2.8.2"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-locale: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-src: PV changed from "2.8.1" to "2.8.2"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-src: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-staticdev: PV changed from "2.8.1" to "2.8.2"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-staticdev: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PV changed from "2.8.1" to "2.8.2"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: FILELIST: directory renamed /usr/lib/python3.13/site-packages/testtools-2.8.1.dist-info -> /usr/lib/python3.13/site-packages/testtools-2.8.2.dist-info, directory renamed /usr/lib/python3.13/site-packages/testtools-2.8.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/testtools-2.8.2.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/testtools/tests/test_helpers.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_doctest.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_helpers.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_dict.py /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_content.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_testresult.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_filesystem.cpython-3
 13.pyc /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_impl.py /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_content_type.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/test_tags.py /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_monkey.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_higherorder.py /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/_helpers.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/helpers.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/samplecases.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_const.py /usr/lib/python3.13/site-packages/testtools/tests/test_compat.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_basic.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/test_monkey.py /usr/lib/python3.13/site-pa
 ckages/testtools/tests/matchers/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/_helpers.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_exception.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/test_fixturesupport.py /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/test_deferred.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/helpers.py /usr/lib/python3.13/site-packages/testtools/tests/test_content.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_warnings.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_exception.py /usr/lib/python3.13/site-packages/testtools/tests/test_testresult.py /usr/lib/python3.13/site-packages/testtools/tests/test_with_with.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_higherorder.cpython-313.pyc /usr/lib/python3.13/site-packages/testt
 ools/tests/matchers/__pycache__/test_datastructures.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/test_spinner.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_const.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/test_spinner.py /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_tags.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_filesystem.py /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_testsuite.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/test_matchers.py /usr/lib/python3.13/site-packages/testtools/tests/samplecases.py /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_with_with.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/test_runtest.py /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/te
 st_assert_that.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/test_assert_that.py /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_testcase.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/test_runtest.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_compat.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/test_testcase.py /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/test_matchers.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/test_testsuite.py /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/helpers.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/test_run.py /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_fixturesupport.cpython-313.pyc /usr/lib/python3.1
 3/site-packages/testtools/tests/__init__.py /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__init__.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_warnings.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_doctest.py /usr/lib/python3.13/site-packages/testtools/tests/test_content_type.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/__init__.py /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_runtest.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/test_runtest.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_basic.py /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_run.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_impl.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/matcher
 s/test_datastructures.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_dict.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/helpers.py /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/test_deferred.cpython-313.pyc"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PKGSIZE changed from 1885349 to 718853 (-62%)
Changes to packages/x86-64-v3-poky-linux/python3-testtools (sysroot):
  /usr/lib/python3.13/site-packages/testtools-2.8.1.dist-info moved to /usr/lib/python3.13/site-packages/testtools-2.8.2.dist-info
  /usr/lib/python3.13/site-packages/testtools/tests was removed
  /usr/lib/python3.13/site-packages/testtools/tests/helpers.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__init__.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/helpers.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__init__.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__ was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/helpers.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_basic.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_const.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_datastructures.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_dict.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_doctest.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_exception.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_filesystem.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_higherorder.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_impl.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_warnings.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_basic.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_const.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_datastructures.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_dict.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_doctest.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_exception.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_filesystem.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_higherorder.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_impl.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_warnings.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__ was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/helpers.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/samplecases.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_assert_that.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_compat.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_content.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_content_type.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_fixturesupport.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_helpers.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_monkey.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_run.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_runtest.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_tags.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_testcase.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_testresult.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_testsuite.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_with_with.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/samplecases.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_assert_that.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_compat.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_content.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_content_type.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_fixturesupport.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_helpers.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_monkey.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_run.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_runtest.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_tags.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_testcase.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_testresult.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_testsuite.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_with_with.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/_helpers.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__init__.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__ was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/_helpers.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/test_deferred.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/test_matchers.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/test_runtest.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/test_spinner.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/test_deferred.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/test_matchers.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/test_runtest.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/test_spinner.py was removed

--===============3264223445194574506==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-testtools-upgrade-2.8.1-2.8.2.patch"

RnJvbSA3OTE5NDQ2ODQxNzQxZDUzZTQ2OTk0ODEyZWQzYjk0NzFmZDRkYmU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwODoxNDozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdGVzdHRvb2xzOiB1cGdyYWRlIDIuOC4xIC0+IDIuOC4yCgotLS0KIC4uLi97cHl0aG9u
My10ZXN0dG9vbHNfMi44LjEuYmIgPT4gcHl0aG9uMy10ZXN0dG9vbHNfMi44LjIuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdGVzdHRvb2xzXzIuOC4xLmJi
ID0+IHB5dGhvbjMtdGVzdHRvb2xzXzIuOC4yLmJifSAoODQlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10ZXN0dG9vbHNfMi44LjEuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdGVzdHRvb2xzXzIuOC4yLmJiCnNpbWls
YXJpdHkgaW5kZXggODQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy10ZXN0dG9vbHNfMi44LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy10ZXN0dG9vbHNfMi44LjIuYmIKaW5kZXggMjlhMjhkODBkYS4uYzUx
ZmFjMjI0MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXRlc3R0b29sc18yLjguMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtdGVzdHRvb2xzXzIuOC4yLmJiCkBAIC04LDcgKzgsNyBAQCBERVBFTkRTICs9ICJweXRo
b24zLWhhdGNoLXZjcy1uYXRpdmUiCiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkYTUxMDJiMDJiNmQ5OTI0NjA3ZDMxZGRhNmRlYjI2YTA4
NWE3OGFmYTc4ODI2YmY0NGUzYjg3MTdmYzc3MjA4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImI1
YzczMzMyNDU2ZmY1NDE1MjA2MmQ0N2E1OGJjNGYxNWY4ZTIzNTE0YWZlYzRlODQ3NzVhZjEyNGZi
N2RiNDMiCiAKIFJERVBFTkRTOiR7UE59ICs9ICJcCiAgICAgcHl0aG9uMy1jb21wcmVzc2lvbiBc
Ci0tIAoyLjQ3LjEKCg==

--===============3264223445194574506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: FILELIST: directory renamed /usr/lib/python3.13/site-packages/testtools-2.8.1.dist-info -> /usr/lib/python3.13/site-packages/testtools-2.8.2.dist-info, directory renamed /usr/lib/python3.13/site-packages/testtools-2.8.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/testtools-2.8.2.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/testtools/tests/__pycache__/helpers.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_warnings.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/test_runtest.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/test_with_with.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_dict.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pyca
 che__/test_impl.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/test_fixturesupport.py /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_fixturesupport.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/test_runtest.py /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/samplecases.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/test_content_type.py /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/test_spinner.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_helpers.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_exception.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_higherorder.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_doctest.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_assert_that.cpython-31
 3.pyc /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_run.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/test_deferred.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_dict.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_basic.py /usr/lib/python3.13/site-packages/testtools/tests/__init__.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_content.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/test_testsuite.py /usr/lib/python3.13/site-packages/testtools/tests/test_compat.py /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_compat.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_warnings.py /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/__init__.cpython-313.pyc /u
 sr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_runtest.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/test_helpers.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_const.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_monkey.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/helpers.py /usr/lib/python3.13/site-packages/testtools/tests/test_monkey.py /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/test_deferred.py /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_content_type.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/matchers/helpers.py /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/_helpers.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/test_content.py /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_testcase.cpython-313.pyc /usr/lib/python3.13/
 site-packages/testtools/tests/matchers/__init__.py /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/test_spinner.py /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/test_runtest.py /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_testresult.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_testsuite.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/test_testcase.py /usr/lib/python3.13/site-packages/testtools/tests/samplecases.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_basic.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_with_with.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/test_matchers.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/_helpers.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_doctest.py /usr/lib/python
 3.13/site-packages/testtools/tests/test_testresult.py /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__init__.py /usr/lib/python3.13/site-packages/testtools/tests/test_tags.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_filesystem.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/test_run.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_higherorder.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_exception.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_impl.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/helpers.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/test_matchers.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_datastructures.py /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_tags.cpython-313.pyc /usr/lib/python3.13/site-packages/test
 tools/tests/test_assert_that.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_filesystem.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_const.py /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_datastructures.cpython-313.pyc"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PKGSIZE changed from 1885349 to 718853 (-62%)
Changes to packages/x86-64-v3-poky-linux/python3-testtools (sysroot):
  /usr/lib/python3.13/site-packages/testtools-2.8.1.dist-info moved to /usr/lib/python3.13/site-packages/testtools-2.8.2.dist-info
  /usr/lib/python3.13/site-packages/testtools/tests was removed
  /usr/lib/python3.13/site-packages/testtools/tests/helpers.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__init__.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/helpers.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__init__.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__ was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/helpers.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_basic.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_const.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_datastructures.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_dict.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_doctest.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_exception.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_filesystem.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_higherorder.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_impl.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/__pycache__/test_warnings.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_basic.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_const.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_datastructures.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_dict.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_doctest.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_exception.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_filesystem.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_higherorder.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_impl.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/matchers/test_warnings.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__ was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/helpers.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/samplecases.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_assert_that.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_compat.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_content.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_content_type.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_fixturesupport.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_helpers.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_monkey.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_run.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_runtest.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_tags.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_testcase.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_testresult.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_testsuite.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/__pycache__/test_with_with.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/samplecases.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_assert_that.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_compat.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_content.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_content_type.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_fixturesupport.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_helpers.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_monkey.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_run.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_runtest.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_tags.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_testcase.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_testresult.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_testsuite.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/test_with_with.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/_helpers.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__init__.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__ was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/_helpers.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/test_deferred.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/test_matchers.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/test_runtest.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/__pycache__/test_spinner.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/test_deferred.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/test_matchers.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/test_runtest.py was removed
  /usr/lib/python3.13/site-packages/testtools/tests/twistedsupport/test_spinner.py was removed

--===============3264223445194574506==--

