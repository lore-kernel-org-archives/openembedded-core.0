Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E3FC47082
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:11 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.2285.1651434543016834096
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CdUUE886;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010180812b55fb-2d8ec6ec-fa19-4317-a268-0bfa842245eb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uLHBKMDig8JqyRC5FKWd50T9ERQ5NyatrICgIC0lozo=;
	b=CdUUE886Kf0/u3i/jGj9mI8nSQ+24V438v9wnYO4mcpax7WaM53P6CXqpdpXa/et
	z2/O1rHqCJJzuMYGe7p/U2rKKshuZz7b9EsuJDqN6fFyIH3JlmaEppzZKSyOEux8ihN
	MnimXcvBaYJzSHbVgO4vcbdMZ0xyvPQNWwRXszFU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uLHBKMDig8JqyRC5FKWd50T9ERQ5NyatrICgIC0lozo=;
	b=GMLTs7Q0LDL0ldVTY27dYOS0xtwvBtZUAUzTBEFn3/4bh/PDsXvnnjJwfrs0UBdM
	6uTPOUL3XIUVgu+1aTYuMHLry549miT4zK+Y60JnDkheMysd119uw0LgNb29T1e4HaY
	Nh1OpnrjBBx1Ds9Ba8fO2h/2DkPXmW+BxSNgFNYg=
Content-Type: multipart/mixed; boundary="===============0598851713331039378=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygments: upgrading to 2.12.0 SUCCEEDED
Message-ID: 
 <01010180812b55fb-2d8ec6ec-fa19-4317-a268-0bfa842245eb-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165108

--===============0598851713331039378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pygments* to *2.12.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygments-upgrade-2.11.2-2.12.0.patch
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
--===============0598851713331039378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pygments/python3-pygments: FILELIST: directory renamed /usr/lib/python3.10/site-packages/Pygments-2.11.2.dist-info -> /usr/lib/python3.10/site-packages/Pygments-2.12.0.dist-info, added "/usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/macaulay2.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/_css_builtins.py /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/ada.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/mcfunction.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/_scheme_builtins.py /usr/lib/python3.10/site-packages/pygments/lexers/cplint.py /usr/lib/python3.10/site-packages/pygments/lexers/tal.py /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/qlik.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/cplint.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/macaulay2.py /usr/lib/python3.10/site-packag
 es/pygments/lexers/ul4.py /usr/lib/python3.10/site-packages/pygments/lexers/ada.py /usr/lib/python3.10/site-packages/pygments/lexers/_qlik_builtins.py /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/berry.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/_css_builtins.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/_scheme_builtins.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/tal.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/mcfunction.py /usr/lib/python3.10/site-packages/pygments/lexers/berry.py /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/_qlik_builtins.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/q.py /usr/lib/python3.10/site-packages/pygments/lexers/_ada_builtins.py /usr/lib/python3.10/site-packages/pygments/lexers/qlik.py /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/_ada_builtins.cpython-310.pyc /usr/
 lib/python3.10/site-packages/pygments/lexers/__pycache__/ul4.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/q.cpython-310.pyc"
Changes to packages/core2-32-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.10/site-packages/Pygments-2.11.2.dist-info moved to /usr/lib/python3.10/site-packages/Pygments-2.12.0.dist-info
  /usr/lib/python3.10/site-packages/pygments/lexers/_ada_builtins.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/ada.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/berry.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/cplint.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/_css_builtins.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/macaulay2.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/mcfunction.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/_ada_builtins.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/ada.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/berry.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/cplint.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/_css_builtins.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/macaulay2.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/mcfunction.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/q.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/_qlik_builtins.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/qlik.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/_scheme_builtins.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/tal.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/ul4.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/_qlik_builtins.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/qlik.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/q.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/_scheme_builtins.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/tal.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/ul4.py was added

--===============0598851713331039378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pygments: PKGV changed from 2.11.2 [default] to 2.12.0 [default]
packages/core2-32-poky-linux/python3-pygments: SRC_URI changed from "https://files.pythonhosted.org/packages/source/P/Pygments/Pygments-2.11.2.tar.gz" to "https://files.pythonhosted.org/packages/source/P/Pygments/Pygments-2.12.0.tar.gz"
packages/core2-32-poky-linux/python3-pygments: PV changed from "2.11.2" to "2.12.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dbg: PKGV changed from 2.11.2 [default] to 2.12.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dbg: PV changed from "2.11.2" to "2.12.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dev: PKGV changed from 2.11.2 [default] to 2.12.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dev: PV changed from "2.11.2" to "2.12.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-doc: PKGV changed from 2.11.2 [default] to 2.12.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-doc: PV changed from "2.11.2" to "2.12.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-locale: PKGV changed from 2.11.2 [default] to 2.12.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-locale: PV changed from "2.11.2" to "2.12.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-src: PKGV changed from 2.11.2 [default] to 2.12.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-src: PV changed from "2.11.2" to "2.12.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-staticdev: PKGV changed from 2.11.2 [default] to 2.12.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-staticdev: PV changed from "2.11.2" to "2.12.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments: PKGSIZE changed from 6587577 to 6738132 (+2%)
packages/core2-32-poky-linux/python3-pygments/python3-pygments: PKGV changed from 2.11.2 [default] to 2.12.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments: PV changed from "2.11.2" to "2.12.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments: FILELIST: directory renamed /usr/lib/python3.10/site-packages/Pygments-2.11.2.dist-info -> /usr/lib/python3.10/site-packages/Pygments-2.12.0.dist-info, added "/usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/_css_builtins.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/berry.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/ada.py /usr/lib/python3.10/site-packages/pygments/lexers/_ada_builtins.py /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/tal.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/q.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/macaulay2.py /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/ul4.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/_scheme_builtins.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/mcfunction.py /usr/lib/
 python3.10/site-packages/pygments/lexers/__pycache__/_ada_builtins.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/qlik.py /usr/lib/python3.10/site-packages/pygments/lexers/_css_builtins.py /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/macaulay2.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/tal.py /usr/lib/python3.10/site-packages/pygments/lexers/q.py /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/mcfunction.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/_qlik_builtins.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/cplint.py /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/cplint.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/berry.py /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/ada.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/_scheme_builtins.py /usr/lib/python3.10/site-packages/pygments/lexers/_
 _pycache__/qlik.cpython-310.pyc /usr/lib/python3.10/site-packages/pygments/lexers/ul4.py /usr/lib/python3.10/site-packages/pygments/lexers/_qlik_builtins.py"
Changes to packages/core2-32-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.10/site-packages/Pygments-2.11.2.dist-info moved to /usr/lib/python3.10/site-packages/Pygments-2.12.0.dist-info
  /usr/lib/python3.10/site-packages/pygments/lexers/_ada_builtins.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/ada.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/berry.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/cplint.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/_css_builtins.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/macaulay2.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/mcfunction.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/_ada_builtins.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/ada.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/berry.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/cplint.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/_css_builtins.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/macaulay2.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/mcfunction.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/q.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/_qlik_builtins.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/qlik.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/_scheme_builtins.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/tal.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/__pycache__/ul4.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pygments/lexers/_qlik_builtins.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/qlik.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/q.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/_scheme_builtins.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/tal.py was added
  /usr/lib/python3.10/site-packages/pygments/lexers/ul4.py was added

--===============0598851713331039378==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-pygments-upgrade-2.11.2-2.12.0.patch"

From 3422387937490a6a05ba697145d257d6ebb341f7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 10:26:58 +0000
Subject: [PATCH] python3-pygments: upgrade 2.11.2 -> 2.12.0

---
 ...s_2.11.2.bb => python3-pygments_2.12.0.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.11.2.bb => python3-pygments_2.12.0.bb} (31%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.11.2.bb b/meta/recipes-devtools/python/python3-pygments_2.12.0.bb
similarity index 31%
rename from meta/recipes-devtools/python/python3-pygments_2.11.2.bb
rename to meta/recipes-devtools/python/python3-pygments_2.12.0.bb
index 35d288c89e..5abe971268 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.11.2.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.12.0.bb
@@ -1,11 +1,30 @@
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
+# -Copyright (c) 2006-2021 by the respective authors (see AUTHORS file).
+# +Copyright (c) 2006-2022 by the respective authors (see AUTHORS file).
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 SUMMARY = "Pygments is a syntax highlighting package written in Python."
 DESCRIPTION = "Pygments is a syntax highlighting package written in Python."
 HOMEPAGE = "http://pygments.org/"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=98419e351433ac106a24e3ad435930bc"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
 inherit setuptools3
-SRC_URI[sha256sum] = "4e426f72023d88d03b2fa258de560726ce890ff3b630f88c21cbb8b2503b8c6a"
+SRC_URI[sha256sum] = "5eb116118f9612ff1ee89ac96437bb6b49e8f04d8a13b514ba26f620208e26eb"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.27.0


--===============0598851713331039378==--

