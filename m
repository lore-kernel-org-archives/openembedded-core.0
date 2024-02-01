Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38591C54E7B
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:20 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.2156.1706810405618658335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KohIclIF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ptzEkxl4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018d65d3f015-2cc5069d-6a96-4097-8f8b-d99b239b5483-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tY+GDbZabDNzNRcRFBGJcoTyxvvixmCuYh6b030yl3U=;
	b=KohIclIF+cLVx5L7l7O9r3Yb8nwP5B15qB6O2JZfT8SxxIP/W/JkBau8Lr6JUcwZ
	gxdTTgGlOvGrC4fDocoYruofCjq6teKq7hTKP59RvpKFctIJLSdZIfg2444cwxuf9AK
	GDoOPhdJg0HP5kOMmc61C0Z4ipVoqlYrIEQHc7CQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tY+GDbZabDNzNRcRFBGJcoTyxvvixmCuYh6b030yl3U=;
	b=ptzEkxl42qJ66vIc2ro/wIY9NglLlw25Hkpb0C6WUATS0Sdp6cPdE0Cp33wvhoqC
	FN25GxrkcV57epJJY1dBnszIwxuiMWC1T4ICm5YfrljQtFxdK1NeLzqTQTK9E1jsj2N
	OU51hO9Lnxtt7MOKbidHS8rXkc3uTIhJlWp4Dscg=
Content-Type: multipart/mixed; boundary="===============8939740961782757527=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <mrybczynska@syslinbit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-beartype: upgrading to 0.17.0 SUCCEEDED
Message-ID: <0101018d65d3f015-2cc5069d-6a96-4097-8f8b-d99b239b5483-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194627

--===============8939740961782757527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-beartype* to *0.17.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-beartype-upgrade-0.16.4-0.17.0.patch
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
From da2eadd4a45e33bd5132bacb60fcfe7a9c168d12 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 07:32:24 +0000
Subject: [PATCH] python3-beartype: upgrade 0.16.4 -> 0.17.0

---
 ...e_0.16.4.bb => python3-beartype_0.17.0.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.16.4.bb => python3-beartype_0.17.0.bb} (18%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.16.4.bb b/meta/recipes-devtools/python/python3-beartype_0.17.0.bb
similarity index 18%
rename from meta/recipes-devtools/python/python3-beartype_0.16.4.bb
rename to meta/recipes-devtools/python/python3-beartype_0.17.0.bb
index ad4462e0e2..e990aab335 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.16.4.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.17.0.bb
@@ -1,10 +1,31 @@
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
+# @@ -1,6 +1,6 @@
+#  MIT License
+#  
+# -Copyright (c) 2014-2023 Beartype authors.
+# +Copyright (c) 2014-2024 Beartype authors.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy
+#  of this software and associated documentation files (the "Software"), to deal
+# 
+#
+
 SUMMARY = "Unbearably fast runtime type checking in pure Python."
 HOMEPAGE = "https://beartype.readthedocs.io"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e40b52d8eb5553aa8f705cdd3f979d69"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e71f94261c1b39896cacacfeaf60560e"
 
-SRC_URI[sha256sum] = "1ada89cf2d6eb30eb6e156eed2eb5493357782937910d74380918e53c2eae0bf"
+SRC_URI[sha256sum] = "3226fbba8c53b4e698acdb47dcaf3c0640151c4d405618c281e6631f4112947d"
 
 inherit setuptools3 pypi
 
-- 
2.42.0


--===============8939740961782757527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484585 -> /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585, directory renamed /usr/lib/python3.12/site-packages/beartype/_decor/error/_util -> /usr/lib/python3.12/site-packages/beartype/_check/error/_util, directory renamed /usr/lib/python3.12/site-packages/beartype/_decor/error/_util/__pycache__ -> /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__, directory renamed /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__ -> /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__, directory renamed /usr/lib/python3.12/site-packages/beartype-0.16.4.dist-info -> /usr/lib/python3.12/site-packages/beartype-0.17.0.dist-info, removed "/usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__/__init__.cpython-312
 .pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__/_errorunion.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/__init__.py /usr/lib/python3.12/site-packages/beartype/_util/error/utilerror.py /usr/lib/python3.12/site-packages/beartype/_check/forward/_fwdref.py /usr/lib/python3.12/site-packages/beartype/_check/code/__pycache__/_codesnip.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/__pycache__/_errorpep586.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/__pycache__/_errorpep593.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/_fwdref.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/kind/utilkinddict.py /usr/lib/python3.12/site-packages/beartype/_decor/error/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/wrap/__pycache__/_wrapcode.cpython-312.pyc /usr/lib/python3.12/site-p
 ackages/beartype/_decor/error/_errorcause.py /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__/_errornoreturn.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/__pycache__/_errortype.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_errorpep593.py /usr/lib/python3.12/site-packages/beartype/_decor/error/__init__.py /usr/lib/python3.12/site-packages/beartype/_decor/error/__pycache__/errormain.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/_errortype.py /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/__init__.py /usr/lib/python3.12/site-packages/beartype/_decor/error/__pycache__/_errorcause.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerror.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/_errornoreturn.py /usr/lib/python3.12/site-packages/beartype/_check/forward/fwdhint.py /usr/lib/p
 ython3.12/site-packages/beartype/_decor/wrap/_wrapcode.py /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_errorpep586.py /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/_errorunion.py /usr/lib/python3.12/site-packages/beartype/_util/kind/__pycache__/utilkinddict.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/fwdhint.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/code/_codesnip.py /usr/lib/python3.12/site-packages/beartype/_decor/error/errormain.py", added "/usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep586.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep593.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__init__.py /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrorraise.p
 y /usr/lib/python3.12/site-packages/beartype/_data/ast/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/forward/fwdmain.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/forward/fwdref.py /usr/lib/python3.12/site-packages/beartype/_data/ast/__pycache__/dataast.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/__init__.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep695.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/code/__pycache__/codesnip.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrorget.py /usr/lib/python3.12/site-packages/beartype
 /_check/error/__pycache__/_errordata.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__pycache__/utilmapset.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/utilpep695.py /usr/lib/python3.12/site-packages/beartype/_conf/__pycache__/confoverrides.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/__init__.py /usr/lib/python3.12/site-packages/beartype/_util/kind/map/utilmapset.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep484604union.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/claw/_ast/_clawaststar.py /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/clawastpep526.py /usr/lib/python3.12/site-packages/beartype/claw/_ast/__pycache__/_clawaststar.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/clawastpep695.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep593.py /usr/lib/python3.12/site-packages/bea
 rtype/_check/error/_pep/_pep484/__pycache__/_errornoreturn.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/fwdref.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrorget.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrorraise.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_data/ast/__init__.py /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__pycache__/utilmapfrozen.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_data/ast/dataast.py /usr/lib/python3.12/site-packages/beartype/_conf/confoverrides.py /usr/lib/python3.12/site-packages/beartype/_check/error/_errorcause.py /usr/lib/python3.12/site-packages/beartype/_check/code/codesnip.py /usr/lib/python3.12/site-packages/beartype/_check/error/errorget.py /usr/lib/python3.12/site-packages/beartyp
 e/_check/error/_pep/_pep484/_errornoreturn.py /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__/errorget.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep484604union.py /usr/lib/python3.12/site-packages/beartype/_conf/__pycache__/conftest.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_errortype.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__init__.py /usr/lib/python3.12/site-packages/beartype/_conf/conftest.py /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/fwdmain.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/kind/map/utilmapfrozen.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep586.py /usr/lib/python3.12/site-packages/beartype/_check/error/_errordata.py /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/kind/map/utilmap
 test.py /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/__pycache__/clawastpep526.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__/_errorcause.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/__pycache__/clawastpep695.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__init__.py /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__pycache__/utilmaptest.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__/_errortype.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.12/site-packages/beartype-0.16.4.dist-info moved to /usr/lib/python3.12/site-packages/beartype-0.17.0.dist-info
  /usr/lib/python3.12/site-packages/beartype/_check/code/codesnip.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/__pycache__/codesnip.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_errorcause.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_errordata.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/errorget.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_errortype.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep484604union.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep586.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep593.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484 was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585 was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/_errorgeneric.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/_errorsequence.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__/_errorgeneric.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__/_errorsequence.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/_errornoreturn.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__pycache__/_errornoreturn.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep484604union.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep586.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep593.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__/_errorcause.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__/_errordata.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__/errorget.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__/_errortype.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/errorutilcolor.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/errorutiltext.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__/errorutilcolor.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__/errorutiltext.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/fwdmain.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/fwdref.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/fwdmain.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/fwdref.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/_clawaststar.py was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/clawastpep526.py was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/clawastpep695.py was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/__pycache__/clawastpep526.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/__pycache__/clawastpep695.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/__pycache__/_clawaststar.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_conf/confoverrides.py was added
  /usr/lib/python3.12/site-packages/beartype/_conf/conftest.py was added
  /usr/lib/python3.12/site-packages/beartype/_conf/__pycache__/confoverrides.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_conf/__pycache__/conftest.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_data/ast was added
  /usr/lib/python3.12/site-packages/beartype/_data/ast/dataast.py was added
  /usr/lib/python3.12/site-packages/beartype/_data/ast/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_data/ast/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_data/ast/__pycache__/dataast.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_data/ast/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrorget.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrorraise.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrorget.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrorraise.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep695.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/utilpep695.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/kind/map was added
  /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__pycache__/utilmapfrozen.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__pycache__/utilmapset.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__pycache__/utilmaptest.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/kind/map/utilmapfrozen.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/kind/map/utilmapset.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/kind/map/utilmaptest.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/_codesnip.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/code/__pycache__/_codesnip.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/forward/fwdhint.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/forward/_fwdref.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/fwdhint.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/_fwdref.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_errorcause.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/errormain.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_errortype.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/__init__.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_errorpep586.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_errorpep593.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/__init__.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484 was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484585 was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484585/_errorgeneric.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484585/_errorsequence.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484585/__init__.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__ was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__/_errorgeneric.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__/_errorsequence.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/_errornoreturn.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/_errorunion.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/__init__.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__ was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__/_errornoreturn.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__/_errorunion.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/__pycache__ was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/__pycache__/_errorpep586.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/__pycache__/_errorpep593.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/__pycache__ was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/__pycache__/_errorcause.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/__pycache__/errormain.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/__pycache__/_errortype.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_util was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_util/errorutilcolor.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_util/errorutiltext.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_util/__init__.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_util/__pycache__ was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_util/__pycache__/errorutilcolor.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_util/__pycache__/errorutiltext.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_util/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/wrap/__pycache__/_wrapcode.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/wrap/_wrapcode.py was removed
  /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerror.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/error/utilerror.py was removed
  /usr/lib/python3.12/site-packages/beartype/_util/kind/__pycache__/utilkinddict.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/kind/utilkinddict.py was removed

--===============8939740961782757527==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-beartype-upgrade-0.16.4-0.17.0.patch"

RnJvbSBkYTJlYWRkNGE0NWUzM2JkNTEzMmJhY2I2MGZjZmU3YTljMTY4ZDEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwNzozMjoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYmVhcnR5cGU6IHVwZ3JhZGUgMC4xNi40IC0+IDAuMTcuMAoKLS0tCiAuLi5lXzAuMTYu
NC5iYiA9PiBweXRob24zLWJlYXJ0eXBlXzAuMTcuMC5iYn0gfCAyNSArKysrKysrKysrKysrKysr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWJlYXJ0eXBlXzAuMTYu
NC5iYiA9PiBweXRob24zLWJlYXJ0eXBlXzAuMTcuMC5iYn0gKDE4JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmVhcnR5cGVfMC4xNi40LmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJlYXJ0eXBlXzAuMTcuMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDE4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtYmVhcnR5cGVfMC4xNi40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmVhcnR5cGVfMC4xNy4wLmJiCmluZGV4IGFkNDQ2MmUwZTIu
LmU5OTBhYWIzMzUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1iZWFydHlwZV8wLjE2LjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWJlYXJ0eXBlXzAuMTcuMC5iYgpAQCAtMSwxMCArMSwzMSBAQAorIyBGSVhNRTog
dGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29s
IHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhl
IG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VO
U0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBj
b21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xp
Y2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdl
czoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysrIExJQ0VOU0UKKyMgQEAgLTEsNiArMSw2IEBACisj
ICBNSVQgTGljZW5zZQorIyAgCisjIC1Db3B5cmlnaHQgKGMpIDIwMTQtMjAyMyBCZWFydHlwZSBh
dXRob3JzLgorIyArQ29weXJpZ2h0IChjKSAyMDE0LTIwMjQgQmVhcnR5cGUgYXV0aG9ycy4KKyMg
IAorIyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFu
eSBwZXJzb24gb2J0YWluaW5nIGEgY29weQorIyAgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2Np
YXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwKKyMgCisj
CisKIFNVTU1BUlkgPSAiVW5iZWFyYWJseSBmYXN0IHJ1bnRpbWUgdHlwZSBjaGVja2luZyBpbiBw
dXJlIFB5dGhvbi4iCiBIT01FUEFHRSA9ICJodHRwczovL2JlYXJ0eXBlLnJlYWR0aGVkb2NzLmlv
IgogCiBMSUNFTlNFID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PWU0MGI1MmQ4ZWI1NTUzYWE4ZjcwNWNkZDNmOTc5ZDY5IgorTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRTttZDU9ZTcxZjk0MjYxYzFiMzk4OTZjYWNhY2ZlYWY2MDU2MGUiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxYWRhODljZjJkNmViMzBlYjZlMTU2ZWVkMmViNTQ5MzM1
Nzc4MjkzNzkxMGQ3NDM4MDkxOGU1M2MyZWFlMGJmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjMy
MjZmYmJhOGM1M2I0ZTY5OGFjZGI0N2RjYWYzYzA2NDAxNTFjNGQ0MDU2MThjMjgxZTY2MzFmNDEx
Mjk0N2QiCiAKIGluaGVyaXQgc2V0dXB0b29sczMgcHlwaQogCi0tIAoyLjQyLjAKCg==

--===============8939740961782757527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1850 targets, 46 skipped, 0 masked, 0 errors.
Removing 21 recipes from the core2-64 sysroot...done.
Removing 54 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-9e5f18669a1327f3eac26d1a20edf388cfb4f415"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9e5f18669a1327f3eac26d1a20edf388cfb4f415"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 419 Local 404 Mirrors 0 Missed 15 Current 226 (96% match, 97% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 242 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 243 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 244 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 245 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 374 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_recipe_qa)
NOTE: recipe python3-beartype-0.17.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 324 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-beartype-0.17.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 402 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_fetch)
NOTE: recipe python3-beartype-0.17.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-beartype-0.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 403 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 326 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-beartype-0.17.0-r0: task do_unpack: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 327 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-beartype-0.17.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 341 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 352 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 353 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 386 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 909 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_patch)
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 405 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 409 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 414 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-beartype-0.17.0-r0: task do_patch: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/elfutils/0.189/temp/log.do_packagedata_setscene.3790308
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 422 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_package_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-beartype-0.17.0-r0: task do_patch: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 426 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 429 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 431 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 434 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 437 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 438 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 445 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: Running task 1016 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1020 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1027 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_populate_lic)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-beartype-0.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-beartype-0.17.0-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1028 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1029 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-beartype-0.17.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 451 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_populate_lic unihash changed to f5a593071d2aa647ee991542b2ffc54ba1863d38c232cb3ebd0fb507f1e9841d
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-beartype-0.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 454 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running task 1061 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1068 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1074 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1075 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1076 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 455 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 463 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 503 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 515 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 522 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 532 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 543 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 549 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 568 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 569 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 578 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1223 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 605 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 606 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 608 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 610 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 611 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 614 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 616 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 624 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 633 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 640 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 645 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1659 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1779 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata)
NOTE: Running task 1807 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-beartype-0.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata: Started
NOTE: recipe python3-beartype-0.17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata: Succeeded
NOTE: recipe python3-beartype-0.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-beartype-0.17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1809 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_configure)
NOTE: recipe python3-beartype-0.17.0-r0: task do_configure: Started
NOTE: recipe python3-beartype-0.17.0-r0: task do_configure: Succeeded
NOTE: Running task 1814 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_compile)
NOTE: recipe python3-beartype-0.17.0-r0: task do_compile: Started
NOTE: recipe python3-beartype-0.17.0-r0: task do_compile: Succeeded
NOTE: Running task 1815 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_install)
NOTE: recipe python3-beartype-0.17.0-r0: task do_install: Started
NOTE: recipe python3-beartype-0.17.0-r0: task do_install: Succeeded
NOTE: Running task 1816 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_package)
NOTE: Running task 1817 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_populate_sysroot)
NOTE: recipe python3-beartype-0.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-beartype-0.17.0-r0: task do_package: Started
NOTE: recipe python3-beartype-0.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-beartype-0.17.0-r0: task do_package: Succeeded
NOTE: Running task 1818 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_packagedata)
NOTE: recipe python3-beartype-0.17.0-r0: task do_packagedata: Started
NOTE: recipe python3-beartype-0.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1819 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_create_spdx)
NOTE: Running task 1820 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_package_write_ipk)
NOTE: Running task 1821 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_package_write_deb)
NOTE: Running task 1822 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_package_write_rpm)
NOTE: Running task 1823 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_package_qa)
NOTE: recipe python3-beartype-0.17.0-r0: task do_create_spdx: Started
NOTE: recipe python3-beartype-0.17.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-beartype-0.17.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-beartype-0.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-beartype-0.17.0-r0: task do_package_qa: Started
NOTE: recipe python3-beartype-0.17.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1824 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_create_runtime_spdx)
NOTE: recipe python3-beartype-0.17.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-beartype-0.17.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-beartype-0.17.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-beartype-0.17.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-beartype-0.17.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-beartype-0.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1825 of 1825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.17.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1825 tasks of which 1794 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-src went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-dbg went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-binutils went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package libelf went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package libasm went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package libdw went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package libdebuginfod went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-ptest went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-staticdev went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-dev went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-doc went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-de went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-en+boldquot went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-en+quot went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-es went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-ja went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-pl went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-uk went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8939740961782757527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-beartype: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.16.4.tar.gz;downloadfilename=beartype-0.16.4.tar.gz" to "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.17.0.tar.gz;downloadfilename=beartype-0.17.0.tar.gz"
packages/core2-64-poky-linux/python3-beartype: PKGV changed from 0.16.4 [default] to 0.17.0 [default]
packages/core2-64-poky-linux/python3-beartype: PV changed from "0.16.4" to "0.17.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dbg: PKGV changed from 0.16.4 [default] to 0.17.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dbg: PV changed from "0.16.4" to "0.17.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dev: PKGV changed from 0.16.4 [default] to 0.17.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dev: PV changed from "0.16.4" to "0.17.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-doc: PKGV changed from 0.16.4 [default] to 0.17.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-doc: PV changed from "0.16.4" to "0.17.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-locale: PKGV changed from 0.16.4 [default] to 0.17.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-locale: PV changed from "0.16.4" to "0.17.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-src: PKGV changed from 0.16.4 [default] to 0.17.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-src: PV changed from "0.16.4" to "0.17.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-staticdev: PKGV changed from 0.16.4 [default] to 0.17.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-staticdev: PV changed from "0.16.4" to "0.17.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.12/site-packages/beartype/_decor/error/_util -> /usr/lib/python3.12/site-packages/beartype/_check/error/_util, directory renamed /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484585 -> /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585, directory renamed /usr/lib/python3.12/site-packages/beartype-0.16.4.dist-info -> /usr/lib/python3.12/site-packages/beartype-0.17.0.dist-info, directory renamed /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__ -> /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__, directory renamed /usr/lib/python3.12/site-packages/beartype/_decor/error/_util/__pycache__ -> /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__, removed "/usr/lib/python3.12/site-packages/beartype/_check/forward/fwdhint.py /usr/lib/python3.12/site-package
 s/beartype/_decor/error/_pep/_errorpep593.py /usr/lib/python3.12/site-packages/beartype/_decor/wrap/_wrapcode.py /usr/lib/python3.12/site-packages/beartype/_decor/error/__pycache__/_errorcause.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/code/_codesnip.py /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/fwdhint.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerror.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__/_errorunion.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/__init__.py /usr/lib/python3.12/site-packages/beartype/_util/error/utilerror.py /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/kind/__pycache__/utilkinddict.
 cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/__init__.py /usr/lib/python3.12/site-packages/beartype/_decor/wrap/__pycache__/_wrapcode.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__/_errornoreturn.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/__pycache__/_errortype.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_errorpep586.py /usr/lib/python3.12/site-packages/beartype/_check/code/__pycache__/_codesnip.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/__pycache__/_errorpep586.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/__init__.py /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/__pycache__/_errorpep593.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/_errortyp
 e.py /usr/lib/python3.12/site-packages/beartype/_decor/error/__pycache__/errormain.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/_errornoreturn.py /usr/lib/python3.12/site-packages/beartype/_decor/error/errormain.py /usr/lib/python3.12/site-packages/beartype/_check/forward/_fwdref.py /usr/lib/python3.12/site-packages/beartype/_util/kind/utilkinddict.py /usr/lib/python3.12/site-packages/beartype/_decor/error/_errorcause.py /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/_fwdref.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/_errorunion.py", added "/usr/lib/python3.12/site-packages/beartype/_util/error/utilerrorraise.py /usr/lib/python3.12/site-packages/beartype/_util/kind/map/utilmapset.py /usr/lib/python3.12/site-packages/beartype/_data/ast/dataast.py /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrorget.cpython-312.pyc /usr/lib/python3.12/site-packages/bearty
 pe/claw/_ast/pep/__pycache__/clawastpep526.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep593.py /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/fwdmain.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep484604union.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep586.py /usr/lib/python3.12/site-packages/beartype/_check/error/__init__.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep586.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/kind/map/utilmapfrozen.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep593.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/forward/fwdmain.py /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep695.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_conf/__pycache__/conftest.cpython-312.p
 yc /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__pycache__/utilmapfrozen.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__pycache__/utilmapset.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/clawastpep526.py /usr/lib/python3.12/site-packages/beartype/_conf/__pycache__/confoverrides.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/fwdref.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/clawastpep695.py /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__/_errorcause.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_data/ast/__init__.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__init__.py /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/code/__pycache__/codesnip.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/cl
 aw/_ast/pep/__init__.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/_errornoreturn.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__pycache__/_errornoreturn.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/kind/map/utilmaptest.py /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/__pycache__/clawastpep695.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_conf/conftest.py /usr/lib/python3.12/site-packages/beartype/_data/ast/__pycache__/dataast.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_errordata.py /usr/lib/python3.12/site-packages/beartype/_check/error/_errorcause.py /usr/lib/python3.12/site-packages/beartype/_data/ast/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packa
 ges/beartype/claw/_ast/__pycache__/_clawaststar.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__pycache__/utilmaptest.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep484604union.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__/_errortype.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__/_errordata.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/errorget.py /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__init__.py /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrorraise.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/code/codesnip.py /usr/lib/python3.12/site-packag
 es/beartype/_check/error/_pep/_pep484/__init__.py /usr/lib/python3.12/site-packages/beartype/_check/error/_errortype.py /usr/lib/python3.12/site-packages/beartype/claw/_ast/_clawaststar.py /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__/errorget.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_conf/confoverrides.py /usr/lib/python3.12/site-packages/beartype/_check/forward/fwdref.py /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/utilpep695.py /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrorget.py"
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PKGSIZE changed from 4167687 to 4449116 (+7%)
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PKGV changed from 0.16.4 [default] to 0.17.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PV changed from "0.16.4" to "0.17.0"
Changes to packages/core2-64-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.12/site-packages/beartype-0.16.4.dist-info moved to /usr/lib/python3.12/site-packages/beartype-0.17.0.dist-info
  /usr/lib/python3.12/site-packages/beartype/_check/code/codesnip.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/__pycache__/codesnip.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_errorcause.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_errordata.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/errorget.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_errortype.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep484604union.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep586.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep593.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484 was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585 was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/_errorgeneric.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/_errorsequence.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__/_errorgeneric.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__/_errorsequence.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/_errornoreturn.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__pycache__/_errornoreturn.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep484604union.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep586.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep593.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__/_errorcause.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__/_errordata.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__/errorget.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__/_errortype.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/errorutilcolor.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/errorutiltext.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__/errorutilcolor.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__/errorutiltext.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/fwdmain.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/fwdref.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/fwdmain.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/fwdref.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/_clawaststar.py was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/clawastpep526.py was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/clawastpep695.py was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/__pycache__/clawastpep526.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/__pycache__/clawastpep695.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/pep/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/__pycache__/_clawaststar.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_conf/confoverrides.py was added
  /usr/lib/python3.12/site-packages/beartype/_conf/conftest.py was added
  /usr/lib/python3.12/site-packages/beartype/_conf/__pycache__/confoverrides.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_conf/__pycache__/conftest.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_data/ast was added
  /usr/lib/python3.12/site-packages/beartype/_data/ast/dataast.py was added
  /usr/lib/python3.12/site-packages/beartype/_data/ast/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_data/ast/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_data/ast/__pycache__/dataast.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_data/ast/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrorget.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrorraise.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrorget.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrorraise.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep695.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/utilpep695.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/kind/map was added
  /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__pycache__/utilmapfrozen.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__pycache__/utilmapset.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/kind/map/__pycache__/utilmaptest.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/kind/map/utilmapfrozen.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/kind/map/utilmapset.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/kind/map/utilmaptest.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/_codesnip.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/code/__pycache__/_codesnip.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/forward/fwdhint.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/forward/_fwdref.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/fwdhint.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/_fwdref.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_errorcause.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/errormain.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_errortype.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/__init__.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_errorpep586.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_errorpep593.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/__init__.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484 was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484585 was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484585/_errorgeneric.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484585/_errorsequence.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484585/__init__.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__ was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__/_errorgeneric.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__/_errorsequence.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/_errornoreturn.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/_errorunion.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/__init__.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__ was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__/_errornoreturn.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__/_errorunion.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/__pycache__ was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/__pycache__/_errorpep586.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/__pycache__/_errorpep593.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_pep/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/__pycache__ was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/__pycache__/_errorcause.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/__pycache__/errormain.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/__pycache__/_errortype.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_util was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_util/errorutilcolor.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_util/errorutiltext.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_util/__init__.py was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_util/__pycache__ was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_util/__pycache__/errorutilcolor.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_util/__pycache__/errorutiltext.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/error/_util/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/wrap/__pycache__/_wrapcode.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_decor/wrap/_wrapcode.py was removed
  /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerror.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/error/utilerror.py was removed
  /usr/lib/python3.12/site-packages/beartype/_util/kind/__pycache__/utilkinddict.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/kind/utilkinddict.py was removed

--===============8939740961782757527==--

