Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3963BCD4F48
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:33 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34819.1778851226675266815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JCtd55uq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Y3bDXgWM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019e2bcbb595-4cafdd41-dfb8-426c-95f7-0c99e0094102-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851231;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L2FYYv2mrj3zUnRN0ccbmDU0YlC2YwINqSaPiuIXifA=;
	b=JCtd55uqOqoPk+qbXNGroeIXR5leTjoYRWnXmgY4pNOofqvY18+N2O5tcEz2BS2e
	Ng7q90jGEIk7kkuKjF3u0nXPGb7z5lqca3ACU2+zxzUor+Lzqa4V5vl+ks75WGXAfVl
	kSZyevRmRHymZjV3VBWZlyt5j4m+5sUrBngwdTBk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851231;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L2FYYv2mrj3zUnRN0ccbmDU0YlC2YwINqSaPiuIXifA=;
	b=Y3bDXgWMd832AEkopcCbsxR2kGOYSylRzox4k/21JU39mHjwV0Ohiv0eqHHMD0ca
	tAN41TEn1jM6c5f4hc+wisR3hBBGOGOm1Ks7k06d1JRFu/LjNav6eVy06vVZ7Om22sB
	7jE6GGW5R/YZK1FI8Nt5jb3Gtd/AbycOPpvQUBEc=
Content-Type: multipart/mixed; boundary="===============5933618947810709097=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 26.1.1 SUCCEEDED
Message-ID: <0101019e2bcbb595-4cafdd41-dfb8-426c-95f7-0c99e0094102-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237116

--===============5933618947810709097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pip* to *26.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pip-upgrade-26.1-26.1.1.patch
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
From 0a032d1461507d4bb3db5c891bef4c9ee4e8ab29 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 08:45:43 +0000
Subject: [PATCH] python3-pip: upgrade 26.1 -> 26.1.1

---
 .../python/python3-pip/no_shebang_mangling.patch                | 2 +-
 .../python/{python3-pip_26.1.bb => python3-pip_26.1.1.bb}       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_26.1.bb => python3-pip_26.1.1.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index 5823d6307c..a1c9859ec8 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From adccf194155f40fb1d387c2cac432341a1dc8a0e Mon Sep 17 00:00:00 2001
+From 9eaf871adf6d96686eb47c88c0c67c2158fb9dfe Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
diff --git a/meta/recipes-devtools/python/python3-pip_26.1.bb b/meta/recipes-devtools/python/python3-pip_26.1.1.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_26.1.bb
rename to meta/recipes-devtools/python/python3-pip_26.1.1.bb
index a6275be140..2e09075de2 100644
--- a/meta/recipes-devtools/python/python3-pip_26.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.1.1.bb
@@ -26,7 +26,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "81e13ebcca3ffa8cc85e4deff5c27e1ee26dea0aa7fc2f294a073ac208806ff3"
+SRC_URI[sha256sum] = "d36762751d156a4ee895de8af39aa0abeeeb577f93a2eca6ab62467bbf0f8a78"
 
 do_install:append(){
 	# pip vendors distlib which ships Windows launcher templates (*.exe).
-- 
2.47.1


--===============5933618947810709097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pip: PV changed from "26.1" to "26.1.1"
packages/x86-64-v3-poky-linux/python3-pip: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pip/pip-26.1.tar.gz;downloadfilename=pip-26.1.tar.gz file://no_shebang_mangling.patch" to "https://files.pythonhosted.org/packages/source/p/pip/pip-26.1.1.tar.gz;downloadfilename=pip-26.1.1.tar.gz file://no_shebang_mangling.patch"
packages/x86-64-v3-poky-linux/python3-pip: PKGV changed from 26.1 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dbg: PV changed from "26.1" to "26.1.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dbg: PKGV changed from 26.1 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dev: PV changed from "26.1" to "26.1.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dev: PKGV changed from 26.1 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-doc: PV changed from "26.1" to "26.1.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-doc: PKGV changed from 26.1 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-locale: PV changed from "26.1" to "26.1.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-locale: PKGV changed from 26.1 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-src: PV changed from "26.1" to "26.1.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-src: PKGV changed from 26.1 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-staticdev: PV changed from "26.1" to "26.1.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-staticdev: PKGV changed from 26.1 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli_w -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/rich, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distro -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pygments -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/distro, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/msgpack -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/msgpack, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/license
 s, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/requests -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/certifi, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/rich -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/tomli, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/truststore -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/requests, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/urllib3 -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/distlib, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/cachecontrol -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/cachecontrol, dire
 ctory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/certifi -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/platformdirs, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pkg_resources, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pkg_resources -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/resolvelib, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/idna -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/idna, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist
 -info/licenses/src/pip/_vendor/platformdirs -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pygments, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/packaging -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/packaging, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/tomli_w, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distlib -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/urllib3, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/resolvelib -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/truststore
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 10675433 to 10674940 (-0%)
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PV changed from "26.1" to "26.1.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGV changed from 26.1 [default] to 26.1.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/AUTHORS.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/cachecontrol was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/cachecontrol/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/certifi was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/certifi/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/distlib was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/distlib/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/distro was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/distro/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/idna was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/idna/LICENSE.md was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/msgpack was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/msgpack/COPYING was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/packaging was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.APACHE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.BSD was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pkg_resources was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pkg_resources/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/platformdirs was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/platformdirs/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pygments was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pygments/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/requests was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/requests/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/resolvelib was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/resolvelib/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/rich was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/rich/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/tomli was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/tomli/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/tomli_w was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/tomli_w/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/truststore was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/truststore/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/urllib3 was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/urllib3/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/AUTHORS.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/cachecontrol was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/cachecontrol/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/certifi was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/certifi/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distlib was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distlib/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distro was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distro/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/idna was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/idna/LICENSE.md was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/msgpack was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/msgpack/COPYING was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/packaging was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pkg_resources was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pkg_resources/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/platformdirs was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/platformdirs/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pygments was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pygments/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/requests was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/requests/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/resolvelib was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/resolvelib/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/rich was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/rich/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli_w was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli_w/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/truststore was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/truststore/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/urllib3 was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/urllib3/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/WHEEL was removed

--===============5933618947810709097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pkg_resources -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/tomli_w, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/rich -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pkg_resources, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli_w -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/requests, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/truststore -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pygments, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/urllib3 -> /usr/lib/python3.14/site-pac
 kages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/distlib, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/resolvelib -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/certifi, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pygments -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/tomli, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/packaging -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/packaging, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/certifi -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/distro, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/msgpack -> /usr/lib/python3.14/site-packages/pip-26
 .1.1.dist-info/licenses/src/pip/_vendor/msgpack, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/requests -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/platformdirs -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/resolvelib, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distlib -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/urllib3, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/
 platformdirs, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/idna -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/idna, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distro -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/truststore, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/cachecontrol -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/cachecontrol, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli -> /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/rich
Changes to packages/x86-64-v3-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/AUTHORS.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/cachecontrol was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/cachecontrol/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/certifi was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/certifi/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/distlib was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/distlib/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/distro was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/distro/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/idna was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/idna/LICENSE.md was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/msgpack was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/msgpack/COPYING was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/packaging was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.APACHE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.BSD was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pkg_resources was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pkg_resources/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/platformdirs was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/platformdirs/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pygments was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pygments/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/requests was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/requests/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/resolvelib was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/resolvelib/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/rich was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/rich/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/tomli was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/tomli/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/tomli_w was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/tomli_w/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/truststore was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/truststore/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/urllib3 was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/urllib3/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/AUTHORS.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/cachecontrol was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/cachecontrol/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/certifi was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/certifi/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distlib was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distlib/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distro was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/distro/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/idna was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/idna/LICENSE.md was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/msgpack was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/msgpack/COPYING was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/packaging was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pkg_resources was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pkg_resources/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/platformdirs was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/platformdirs/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pygments was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pygments/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/requests was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/requests/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/resolvelib was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/resolvelib/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/rich was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/rich/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli_w was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/tomli_w/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/truststore was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/truststore/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/urllib3 was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/licenses/src/pip/_vendor/urllib3/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pip-26.1.dist-info/WHEEL was removed

--===============5933618947810709097==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pip-upgrade-26.1-26.1.1.patch"

RnJvbSAwYTAzMmQxNDYxNTA3ZDRiYjNkYjVjODkxYmVmNGM5ZWU0ZThhYjI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDg6NDU6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBpcDogdXBncmFkZSAyNi4xIC0+IDI2LjEuMQoKLS0tCiAuLi4vcHl0aG9uL3B5dGhv
bjMtcGlwL25vX3NoZWJhbmdfbWFuZ2xpbmcucGF0Y2ggICAgICAgICAgICAgICAgfCAyICstCiAu
Li4vcHl0aG9uL3tweXRob24zLXBpcF8yNi4xLmJiID0+IHB5dGhvbjMtcGlwXzI2LjEuMS5iYn0g
ICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBpcF8y
Ni4xLmJiID0+IHB5dGhvbjMtcGlwXzI2LjEuMS5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwL25vX3NoZWJhbmdfbWFuZ2xpbmcu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwL25vX3NoZWJh
bmdfbWFuZ2xpbmcucGF0Y2gKaW5kZXggNTgyM2Q2MzA3Yy4uYTFjOTg1OWVjOCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcC9ub19zaGViYW5nX21h
bmdsaW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
aXAvbm9fc2hlYmFuZ19tYW5nbGluZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYWRjY2Yx
OTQxNTVmNDBmYjFkMzg3YzJjYWM0MzIzNDFhMWRjOGEwZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gOWVhZjg3MWFkZjZkOTY2ODZlYjQ3Yzg4YzBjNjdjMjE1OGZiOWRmZSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogV2VkLCAyMyBGZWIgMjAyMiAxMjoyNzowNiArMDAw
MAogU3ViamVjdDogW1BBVENIXSBweXRob24zLXBpcDogRG9uJ3QgY2hhbmdlIHNoZWJhbmcKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjYuMS5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjYuMS4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1waXBfMjYuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXBpcF8yNi4xLjEuYmIKaW5kZXggYTYyNzViZTE0MC4uMmUwOTA3NWRlMiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcF8yNi4x
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjYuMS4x
LmJiCkBAIC0yNiw3ICsyNiw3IEBAIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWls
ZF9tZXRhCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly9ub19zaGViYW5nX21hbmdsaW5nLnBhdGNoIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODFlMTNlYmNjYTNmZmE4Y2M4NWU0ZGVmZjVjMjdlMWVl
MjZkZWEwYWE3ZmMyZjI5NGEwNzNhYzIwODgwNmZmMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJk
MzY3NjI3NTFkMTU2YTRlZTg5NWRlOGFmMzlhYTBhYmVlZWI1NzdmOTNhMmVjYTZhYjYyNDY3YmJm
MGY4YTc4IgogCiBkb19pbnN0YWxsOmFwcGVuZCgpewogCSMgcGlwIHZlbmRvcnMgZGlzdGxpYiB3
aGljaCBzaGlwcyBXaW5kb3dzIGxhdW5jaGVyIHRlbXBsYXRlcyAoKi5leGUpLgotLSAKMi40Ny4x
Cgo=

--===============5933618947810709097==--

