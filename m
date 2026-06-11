Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F115CDB471
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:55 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50607.1781195498928831814
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BR05dpHa;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=n5uDpVrg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019eb7868f66-34f7d010-2b79-4e15-8b6f-9fe97f3a4043-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195509;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KlfvpoMDbHuaV9BHKNxMW7d4mO3BL15DzDYmd0Wiv7I=;
	b=BR05dpHajC+++Cp1xgWGYKkutQYECJB15JfybYY+jXkZ84ga6WptUK0t7QBZUWMW
	K89oPwfbyJn/imFhdehmOu+qPjMsGEtPAVd417DF6D6K6zNxYETqOzZyeCkR24/3n3P
	HGGNWn8AcaBdkU3TzE5RtNTNB3udMwPmf74FMc6U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195509;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KlfvpoMDbHuaV9BHKNxMW7d4mO3BL15DzDYmd0Wiv7I=;
	b=n5uDpVrgv3mJWrQOlNFamHuQ4h1qhfgv+wdYDEsXuqO8gnpjT4JYEBedINpVJY++
	ovLex6vqPt15ThSLsHrqZR4YqZtHabezdFc9o9TDUOj9pOqlfNX8PWgFlTc0+0xwrym
	t3lXzMmFOVP/waUCmuuCpeW6KqFUkPVpeSpsell4=
Content-Type: multipart/mixed; boundary="===============7696735585128873023=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wcwidth: upgrading to 0.8.1 SUCCEEDED
Message-ID: <0101019eb7868f66-34f7d010-2b79-4e15-8b6f-9fe97f3a4043-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238506

--===============7696735585128873023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-wcwidth* to *0.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wcwidth-upgrade-0.7.0-0.8.1.patch
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
From a540f20c45b5d63d94977f99d06ae8509422ceba Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 10:28:51 +0000
Subject: [PATCH] python3-wcwidth: upgrade 0.7.0 -> 0.8.1

---
 .../{python3-wcwidth_0.7.0.bb => python3-wcwidth_0.8.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.7.0.bb => python3-wcwidth_0.8.1.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.7.0.bb b/meta/recipes-devtools/python/python3-wcwidth_0.8.1.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-wcwidth_0.7.0.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.8.1.bb
index cd5e40b080..9b306225d9 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.7.0.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.8.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "90e3a7ea092341c44b99562e75d09e4d5160fe7a3974c6fb842a101a95e7eed0"
+SRC_URI[sha256sum] = "faf5b4a5366a72dc49cad48cdf21f52bdf63bdda995178e483ba247ff79089b9"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.1


--===============7696735585128873023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.7.0.tar.gz;downloadfilename=wcwidth-0.7.0.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.8.1.tar.gz;downloadfilename=wcwidth-0.8.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-wcwidth: PKGV changed from 0.7.0 [default] to 0.8.1 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth: PV changed from "0.7.0" to "0.8.1"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGV changed from 0.7.0 [default] to 0.8.1 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PV changed from "0.7.0" to "0.8.1"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PKGV changed from 0.7.0 [default] to 0.8.1 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PV changed from "0.7.0" to "0.8.1"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PKGV changed from 0.7.0 [default] to 0.8.1 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PV changed from "0.7.0" to "0.8.1"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PKGV changed from 0.7.0 [default] to 0.8.1 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PV changed from "0.7.0" to "0.8.1"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGV changed from 0.7.0 [default] to 0.8.1 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: FILELIST: added "/usr/lib/python3-wcwidth/ptest/tests/test_term_overrides.py"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PV changed from "0.7.0" to "0.8.1"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 164307 to 193807 (+18%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGV changed from 0.7.0 [default] to 0.8.1 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PV changed from "0.7.0" to "0.8.1"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PKGV changed from 0.7.0 [default] to 0.8.1 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PV changed from "0.7.0" to "0.8.1"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGV changed from 0.7.0 [default] to 0.8.1 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.7.0.dist-info -> /usr/lib/python3.14/site-packages/wcwidth-0.8.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.7.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/wcwidth-0.8.1.dist-info/licenses, added "/usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_813fee16.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_27e0693f.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_da9ceb0a.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fd9d4c44.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_4cdf59ce.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8f94b404.cpython-314.pyc /usr/lib
 /python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_529fbb4a.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fd9d4c44.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c3db41c0.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_da9ceb0a.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e08bd75e.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_45d92e98.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_5bfac390.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_4cdf59ce.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_3d4826b8.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme
 _overrides/_known_fcc05a0f.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_8589765c.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__init__.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_529fbb4a.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c0a2cdbf.py /usr/lib/python3.14/site-packages/wcwidth/table_overrides.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_970dbe10.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_5bfac390.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e22030f3.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_8f94b404.py /usr/lib/python3.14/site-packages/wcwidth/table_vs15.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_45d92e98.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_o
 verrides/_known_c3db41c0.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_27e0693f.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_813fee16.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_50bf0759.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_registry.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c0a2cdbf.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_3d4826b8.py /usr/lib/python3.14/site-packages/wcwidth/__pycache__/table_vs15.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e08bd75e.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8589765c.cpython-314.pyc /u
 sr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e22030f3.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/__pycache__/table_term_programs.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c2157f7e.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_term_programs.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_970dbe10.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c2157f7e.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_50bf0759.py /usr/lib/python3.14/site-packages/wcwidth/__pycache__/table_overrides.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fcc05a0f.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_registry.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PV changed from "0.7.0" to "0.8.1"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 582094 to 4375331 (+652%)
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.14/site-packages/wcwidth-0.7.0.dist-info moved to /usr/lib/python3.14/site-packages/wcwidth-0.8.1.dist-info
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/table_overrides.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/table_term_programs.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/table_vs15.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__init__.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_27e0693f.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_3d4826b8.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_45d92e98.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_4cdf59ce.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_50bf0759.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_529fbb4a.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_5bfac390.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_813fee16.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_8589765c.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_8f94b404.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_970dbe10.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c0a2cdbf.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c2157f7e.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c3db41c0.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_da9ceb0a.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e08bd75e.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e22030f3.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fcc05a0f.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fd9d4c44.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__ was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_27e0693f.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_3d4826b8.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_45d92e98.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_4cdf59ce.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_50bf0759.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_529fbb4a.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_5bfac390.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_813fee16.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8589765c.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8f94b404.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_970dbe10.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c0a2cdbf.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c2157f7e.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c3db41c0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_da9ceb0a.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e08bd75e.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e22030f3.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fcc05a0f.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fd9d4c44.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_registry.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_registry.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_overrides.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_term_programs.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_vs15.py was added
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/WHEEL was removed

--===============7696735585128873023==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wcwidth-upgrade-0.7.0-0.8.1.patch"

RnJvbSBhNTQwZjIwYzQ1YjVkNjNkOTQ5NzdmOTlkMDZhZTg1MDk0MjJjZWJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTA6Mjg6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdjd2lkdGg6IHVwZ3JhZGUgMC43LjAgLT4gMC44LjEKCi0tLQogLi4uL3tweXRob24z
LXdjd2lkdGhfMC43LjAuYmIgPT4gcHl0aG9uMy13Y3dpZHRoXzAuOC4xLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13Y3dpZHRoXzAuNy4wLmJiID0+
IHB5dGhvbjMtd2N3aWR0aF8wLjguMS5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjcuMC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuOC4xLmJiCnNpbWlsYXJpdHkgaW5k
ZXggODQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13
Y3dpZHRoXzAuNy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtd2N3aWR0aF8wLjguMS5iYgppbmRleCBjZDVlNDBiMDgwLi45YjMwNjIyNWQ5IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjcu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8w
LjguMS5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2px
dWFzdC93Y3dpZHRoIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT1iMTU5NzljMzlhMjU0Mzg5MmZjYThjZDg2YjRiNTJjYiIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjkwZTNhN2VhMDkyMzQxYzQ0Yjk5NTYyZTc1ZDA5ZTRkNTE2MGZlN2Ez
OTc0YzZmYjg0MmExMDFhOTVlN2VlZDAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmFmNWI0YTUz
NjZhNzJkYzQ5Y2FkNDhjZGYyMWY1MmJkZjYzYmRkYTk5NTE3OGU0ODNiYTI0N2ZmNzkwODliOSIK
IAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcgcHRlc3QtcHl0aG9uLXB5dGVzdAogCi0t
IAoyLjQ3LjEKCg==

--===============7696735585128873023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: FILELIST: added "/usr/lib/python3-wcwidth/ptest/tests/test_term_overrides.py"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 164307 to 193807 (+18%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.7.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/wcwidth-0.8.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.7.0.dist-info -> /usr/lib/python3.14/site-packages/wcwidth-0.8.1.dist-info, added "/usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e08bd75e.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8f94b404.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fd9d4c44.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_529fbb4a.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_45d92e98.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_27e0693f
 .cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_da9ceb0a.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_813fee16.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_4cdf59ce.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c3db41c0.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_da9ceb0a.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fd9d4c44.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_3d4826b8.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_5bfac390.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_4cdf59ce.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme
 _overrides/_known_529fbb4a.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__init__.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_8589765c.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fcc05a0f.py /usr/lib/python3.14/site-packages/wcwidth/table_vs15.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_8f94b404.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e22030f3.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_5bfac390.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_970dbe10.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_overrides.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c0a2cdbf.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_813fee16.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_o
 verrides/_known_27e0693f.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c3db41c0.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_45d92e98.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8589765c.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e08bd75e.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/__pycache__/table_vs15.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_3d4826b8.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c0a2cdbf.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_registry.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_50bf0759.cpython-314.pyc /u
 sr/lib/python3.14/site-packages/wcwidth/table_term_programs.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c2157f7e.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e22030f3.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/__pycache__/table_term_programs.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_registry.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fcc05a0f.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/__pycache__/table_overrides.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_50bf0759.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_970dbe10.py /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c2157f7e.py"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 582094 to 4375331 (+652%)
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.14/site-packages/wcwidth-0.7.0.dist-info moved to /usr/lib/python3.14/site-packages/wcwidth-0.8.1.dist-info
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/table_overrides.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/table_term_programs.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/table_vs15.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__init__.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_27e0693f.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_3d4826b8.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_45d92e98.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_4cdf59ce.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_50bf0759.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_529fbb4a.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_5bfac390.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_813fee16.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_8589765c.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_8f94b404.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_970dbe10.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c0a2cdbf.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c2157f7e.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_c3db41c0.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_da9ceb0a.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e08bd75e.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_e22030f3.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fcc05a0f.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_known_fd9d4c44.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__ was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_27e0693f.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_3d4826b8.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_45d92e98.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_4cdf59ce.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_50bf0759.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_529fbb4a.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_5bfac390.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_813fee16.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8589765c.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_8f94b404.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_970dbe10.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c0a2cdbf.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c2157f7e.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_c3db41c0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_da9ceb0a.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e08bd75e.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_e22030f3.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fcc05a0f.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_known_fd9d4c44.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/__pycache__/_registry.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/table_grapheme_overrides/_registry.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_overrides.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_term_programs.py was added
  /usr/lib/python3.14/site-packages/wcwidth/table_vs15.py was added
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.6.1.19.dist-info/WHEEL was removed

--===============7696735585128873023==--

