Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74D9C352AA
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:11 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.2285.1651434543177362489
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=sjdE+l2v;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010180812b5570-25ba268d-94fd-45e2-9348-04e1bcd31e37-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=p2JEz3KI9G+P/nu/Cv8LPL2kCCT9w7b7fLPX2iXjetA=;
	b=sjdE+l2vKV4AkdLXoDKoWS18PbY8qoRRX58xWLcgzxh5Tg65uWTex065qtKoUZIg
	+b7dOlGzz0IQigkxHYbRw+/AmmyRl2ZwbyoZjwIoZ3iNk4pEkIY70/ej3m30ndE4CTo
	5lGobKizlTGUMyiOKoy7J7UJuBtM0gjGXpYx3uVE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=p2JEz3KI9G+P/nu/Cv8LPL2kCCT9w7b7fLPX2iXjetA=;
	b=f3AuB/D4PFZo20qTnPULCUtgWmR45J2Z0S4eezeoVrtzYD86pvFUh/nmMXAxrsfY
	cX4LozaH+UKTS4awDPsBnnO2GtQN77gsXlBf6k24szRq1Anyrc+ettyLFz26HMerecv
	Ra+1F7aJdkfKGw/XF4QGmD8N0wq80gwrjIBI6QJc=
Content-Type: multipart/mixed; boundary="===============5052656921945640843=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-babel: upgrading to 2.10.1 SUCCEEDED
Message-ID: 
 <01010180812b5570-25ba268d-94fd-45e2-9348-04e1bcd31e37-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165113

--===============5052656921945640843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-babel* to *2.10.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-babel-upgrade-2.9.1-2.10.1.patch
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
--===============5052656921945640843==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-babel-upgrade-2.9.1-2.10.1.patch"

From 066efc16713b89dc8ba926b95a9af40e43b5fe19 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 09:38:04 +0000
Subject: [PATCH] python3-babel: upgrade 2.9.1 -> 2.10.1

---
 ...babel_2.9.1.bb => python3-babel_2.10.1.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-babel_2.9.1.bb => python3-babel_2.10.1.bb} (40%)

diff --git a/meta/recipes-devtools/python/python3-babel_2.9.1.bb b/meta/recipes-devtools/python/python3-babel_2.10.1.bb
similarity index 40%
rename from meta/recipes-devtools/python/python3-babel_2.9.1.bb
rename to meta/recipes-devtools/python/python3-babel_2.10.1.bb
index 11c8d60105..0780116fc7 100644
--- a/meta/recipes-devtools/python/python3-babel_2.9.1.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.10.1.bb
@@ -1,9 +1,28 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,4 +1,4 @@
+# -Copyright (c) 2013-2021 by the Babel Team, see AUTHORS for more information.
+# +Copyright (c) 2013-2022 by the Babel Team, see AUTHORS for more information.
+#  
+#  All rights reserved.
+#  
+# 
+#
+
 DESCRIPTION = "A collection of tools for internationalizing Python applications"
 HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=05fb707293a85504aa67afc8ea34d747"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1b3f4650099e6d6a73e5a7fc8774ff18"
 
-SRC_URI[sha256sum] = "bc0c176f9f6a994582230df350aa6e05ba2ebe4b3ac317eab29d9be5d2768da0"
+SRC_URI[sha256sum] = "98aeaca086133efb3e1e2aad0396987490c8425929ddbcfe0550184fdc54cd13"
 
 PYPI_PACKAGE = "Babel"
 
-- 
2.27.0


--===============5052656921945640843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-babel/python3-babel: FILELIST: directory renamed /usr/lib/python3.10/site-packages/Babel-2.9.1.dist-info -> /usr/lib/python3.10/site-packages/Babel-2.10.1.dist-info, removed "/usr/lib/python3.10/site-packages/babel/locale-data/prg_001.dat /usr/lib/python3.10/site-packages/babel/locale-data/cu_RU.dat /usr/lib/python3.10/site-packages/babel/locale-data/prg.dat /usr/lib/python3.10/site-packages/babel/locale-data/cu.dat /usr/lib/python3.10/site-packages/babel/_compat.py /usr/lib/python3.10/site-packages/babel/locale-data/vo.dat /usr/lib/python3.10/site-packages/babel/__pycache__/_compat.cpython-310.pyc /usr/lib/python3.10/site-packages/babel/locale-data/vo_001.dat", added "/usr/lib/python3.10/site-packages/babel/locale-data/en_MV.dat /usr/lib/python3.10/site-packages/babel/locale-data/sa.dat /usr/lib/python3.10/site-packages/babel/locale-data/yrl_CO.dat /usr/lib/python3.10/site-packages/babel/locale-data/kgp_BR.dat /usr/lib/python3.10/site-packages/ba
 bel/locale-data/ks_Deva_IN.dat /usr/lib/python3.10/site-packages/babel/locale-data/doi_IN.dat /usr/lib/python3.10/site-packages/babel/locale-data/yrl_BR.dat /usr/lib/python3.10/site-packages/babel/locale-data/sc_IT.dat /usr/lib/python3.10/site-packages/babel/locale-data/be_TARASK.dat /usr/lib/python3.10/site-packages/babel/locale-data/yrl.dat /usr/lib/python3.10/site-packages/babel/locale-data/ks_Deva.dat /usr/lib/python3.10/site-packages/babel/locale-data/hi_Latn_IN.dat /usr/lib/python3.10/site-packages/babel/locale-data/sa_IN.dat /usr/lib/python3.10/site-packages/babel/locale-data/yrl_VE.dat /usr/lib/python3.10/site-packages/babel/locale-data/sc.dat /usr/lib/python3.10/site-packages/babel/locale-data/doi.dat /usr/lib/python3.10/site-packages/babel/locale-data/hi_Latn.dat /usr/lib/python3.10/site-packages/babel/locale-data/kgp.dat /usr/lib/python3.10/site-packages/babel/locale-data/no.dat"
Changes to packages/core2-32-poky-linux/python3-babel (sysroot):
  /usr/lib/python3.10/site-packages/Babel-2.10.1.dist-info was added
  /usr/lib/python3.10/site-packages/Babel-2.10.1.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/Babel-2.10.1.dist-info/LICENSE was added
  /usr/lib/python3.10/site-packages/Babel-2.10.1.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/Babel-2.10.1.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/Babel-2.10.1.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/Babel-2.10.1.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/babel/locale-data/be_TARASK.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/doi.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/doi_IN.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/en_MV.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/hi_Latn.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/hi_Latn_IN.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/kgp_BR.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/kgp.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/ks_Deva.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/ks_Deva_IN.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/no.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/sa.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/sa_IN.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/sc.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/sc_IT.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/yrl_BR.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/yrl_CO.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/yrl.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/yrl_VE.dat was added
  /usr/lib/python3.10/site-packages/Babel-2.9.1.dist-info was removed
  /usr/lib/python3.10/site-packages/Babel-2.9.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.10/site-packages/Babel-2.9.1.dist-info/LICENSE was removed
  /usr/lib/python3.10/site-packages/Babel-2.9.1.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/Babel-2.9.1.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/Babel-2.9.1.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/Babel-2.9.1.dist-info/WHEEL was removed
  /usr/lib/python3.10/site-packages/babel/_compat.py was removed
  /usr/lib/python3.10/site-packages/babel/locale-data/cu.dat was removed
  /usr/lib/python3.10/site-packages/babel/locale-data/cu_RU.dat was removed
  /usr/lib/python3.10/site-packages/babel/locale-data/prg_001.dat was removed
  /usr/lib/python3.10/site-packages/babel/locale-data/prg.dat was removed
  /usr/lib/python3.10/site-packages/babel/locale-data/vo_001.dat was removed
  /usr/lib/python3.10/site-packages/babel/locale-data/vo.dat was removed
  /usr/lib/python3.10/site-packages/babel/__pycache__/_compat.cpython-310.pyc was removed

--===============5052656921945640843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-babel: SRC_URI changed from "https://files.pythonhosted.org/packages/source/B/Babel/Babel-2.9.1.tar.gz" to "https://files.pythonhosted.org/packages/source/B/Babel/Babel-2.10.1.tar.gz"
packages/core2-32-poky-linux/python3-babel: PKGV changed from 2.9.1 [default] to 2.10.1 [default]
packages/core2-32-poky-linux/python3-babel: PV changed from "2.9.1" to "2.10.1"
packages/core2-32-poky-linux/python3-babel/python3-babel-dbg: PKGV changed from 2.9.1 [default] to 2.10.1 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-dbg: PV changed from "2.9.1" to "2.10.1"
packages/core2-32-poky-linux/python3-babel/python3-babel-dev: PKGV changed from 2.9.1 [default] to 2.10.1 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-dev: PV changed from "2.9.1" to "2.10.1"
packages/core2-32-poky-linux/python3-babel/python3-babel-doc: PKGV changed from 2.9.1 [default] to 2.10.1 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-doc: PV changed from "2.9.1" to "2.10.1"
packages/core2-32-poky-linux/python3-babel/python3-babel-locale: PKGV changed from 2.9.1 [default] to 2.10.1 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-locale: PV changed from "2.9.1" to "2.10.1"
packages/core2-32-poky-linux/python3-babel/python3-babel-src: PKGV changed from 2.9.1 [default] to 2.10.1 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-src: PV changed from "2.9.1" to "2.10.1"
packages/core2-32-poky-linux/python3-babel/python3-babel-staticdev: PKGV changed from 2.9.1 [default] to 2.10.1 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-staticdev: PV changed from "2.9.1" to "2.10.1"
packages/core2-32-poky-linux/python3-babel/python3-babel: PKGSIZE changed from 28155986 to 30302659 (+8%)
packages/core2-32-poky-linux/python3-babel/python3-babel: FILELIST: directory renamed /usr/lib/python3.10/site-packages/Babel-2.9.1.dist-info -> /usr/lib/python3.10/site-packages/Babel-2.10.1.dist-info, removed "/usr/lib/python3.10/site-packages/babel/_compat.py /usr/lib/python3.10/site-packages/babel/locale-data/prg.dat /usr/lib/python3.10/site-packages/babel/locale-data/prg_001.dat /usr/lib/python3.10/site-packages/babel/locale-data/vo.dat /usr/lib/python3.10/site-packages/babel/locale-data/vo_001.dat /usr/lib/python3.10/site-packages/babel/locale-data/cu_RU.dat /usr/lib/python3.10/site-packages/babel/__pycache__/_compat.cpython-310.pyc /usr/lib/python3.10/site-packages/babel/locale-data/cu.dat", added "/usr/lib/python3.10/site-packages/babel/locale-data/yrl.dat /usr/lib/python3.10/site-packages/babel/locale-data/sc.dat /usr/lib/python3.10/site-packages/babel/locale-data/be_TARASK.dat /usr/lib/python3.10/site-packages/babel/locale-data/hi_Latn.dat /usr/lib/python3.10/site-packages/
 babel/locale-data/doi.dat /usr/lib/python3.10/site-packages/babel/locale-data/doi_IN.dat /usr/lib/python3.10/site-packages/babel/locale-data/no.dat /usr/lib/python3.10/site-packages/babel/locale-data/yrl_BR.dat /usr/lib/python3.10/site-packages/babel/locale-data/hi_Latn_IN.dat /usr/lib/python3.10/site-packages/babel/locale-data/yrl_CO.dat /usr/lib/python3.10/site-packages/babel/locale-data/sa.dat /usr/lib/python3.10/site-packages/babel/locale-data/kgp.dat /usr/lib/python3.10/site-packages/babel/locale-data/sa_IN.dat /usr/lib/python3.10/site-packages/babel/locale-data/sc_IT.dat /usr/lib/python3.10/site-packages/babel/locale-data/ks_Deva_IN.dat /usr/lib/python3.10/site-packages/babel/locale-data/en_MV.dat /usr/lib/python3.10/site-packages/babel/locale-data/kgp_BR.dat /usr/lib/python3.10/site-packages/babel/locale-data/yrl_VE.dat /usr/lib/python3.10/site-packages/babel/locale-data/ks_Deva.dat"
packages/core2-32-poky-linux/python3-babel/python3-babel: PKGV changed from 2.9.1 [default] to 2.10.1 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel: PV changed from "2.9.1" to "2.10.1"
Changes to packages/core2-32-poky-linux/python3-babel (sysroot):
  /usr/lib/python3.10/site-packages/Babel-2.10.1.dist-info was added
  /usr/lib/python3.10/site-packages/Babel-2.10.1.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/Babel-2.10.1.dist-info/LICENSE was added
  /usr/lib/python3.10/site-packages/Babel-2.10.1.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/Babel-2.10.1.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/Babel-2.10.1.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/Babel-2.10.1.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/babel/locale-data/be_TARASK.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/doi.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/doi_IN.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/en_MV.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/hi_Latn.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/hi_Latn_IN.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/kgp_BR.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/kgp.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/ks_Deva.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/ks_Deva_IN.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/no.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/sa.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/sa_IN.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/sc.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/sc_IT.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/yrl_BR.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/yrl_CO.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/yrl.dat was added
  /usr/lib/python3.10/site-packages/babel/locale-data/yrl_VE.dat was added
  /usr/lib/python3.10/site-packages/Babel-2.9.1.dist-info was removed
  /usr/lib/python3.10/site-packages/Babel-2.9.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.10/site-packages/Babel-2.9.1.dist-info/LICENSE was removed
  /usr/lib/python3.10/site-packages/Babel-2.9.1.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/Babel-2.9.1.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/Babel-2.9.1.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/Babel-2.9.1.dist-info/WHEEL was removed
  /usr/lib/python3.10/site-packages/babel/_compat.py was removed
  /usr/lib/python3.10/site-packages/babel/locale-data/cu.dat was removed
  /usr/lib/python3.10/site-packages/babel/locale-data/cu_RU.dat was removed
  /usr/lib/python3.10/site-packages/babel/locale-data/prg_001.dat was removed
  /usr/lib/python3.10/site-packages/babel/locale-data/prg.dat was removed
  /usr/lib/python3.10/site-packages/babel/locale-data/vo_001.dat was removed
  /usr/lib/python3.10/site-packages/babel/locale-data/vo.dat was removed
  /usr/lib/python3.10/site-packages/babel/__pycache__/_compat.cpython-310.pyc was removed

--===============5052656921945640843==--

