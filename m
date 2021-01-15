Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.720.1610713822628656440
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2D49338C1323
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygments: upgrading to 2.7.4 SUCCEEDED
Message-ID: <MADEUP.165A67B02F3D9C21.24772@lists.openembedded.org>
X-Groupsio-MsgNum: 146773
Content-Type: multipart/mixed; boundary="===============4855349718573874855=="

--===============4855349718573874855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pygments* to *2.7.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygments-upgrade-2.7.3-2.7.4.patch
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

--===============4855349718573874855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.9/site-packages/Pygments-2.7.3-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/Pygments-2.7.4-py3.9.egg-info

--===============4855349718573874855==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-pygments-upgrade-2.7.3-2.7.4.patch"

From 7cf1c362c7760db4872cef9b955c9830c1806267 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 05:56:08 +0000
Subject: [PATCH] python3-pygments: upgrade 2.7.3 -> 2.7.4

---
 ...nts_2.7.3.bb => python3-pygments_2.7.4.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.7.3.bb => python3-pygments_2.7.4.bb} (31%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.7.3.bb b/meta/recipes-devtools/python/python3-pygments_2.7.4.bb
similarity index 31%
rename from meta/recipes-devtools/python/python3-pygments_2.7.3.bb
rename to meta/recipes-devtools/python/python3-pygments_2.7.4.bb
index 379d85dbd7..e839240987 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.7.3.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.7.4.bb
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
+# -Copyright (c) 2006-2020 by the respective authors (see AUTHORS file).
+# +Copyright (c) 2006-2021 by the respective authors (see AUTHORS file).
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
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1f5d0c4cf38dfc8122c00d6f1a97a0cc"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=98419e351433ac106a24e3ad435930bc"
 
 inherit setuptools3
-SRC_URI[sha256sum] = "ccf3acacf3782cbed4a989426012f1c535c9a90d3a7fc3f16d231b9372d2b716"
+SRC_URI[sha256sum] = "df49d09b498e83c1a73128295860250b0b7edd4c723a32e9bc0d295c7c2ec337"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.27.0


--===============4855349718573874855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pygments: PV changed from "2.7.3" to "2.7.4"
packages/core2-32-poky-linux/python3-pygments: SRC_URI changed from "https://files.pythonhosted.org/packages/source/P/Pygments/Pygments-2.7.3.tar.gz" to "https://files.pythonhosted.org/packages/source/P/Pygments/Pygments-2.7.4.tar.gz"
packages/core2-32-poky-linux/python3-pygments: PKGV changed from 2.7.3 [default] to 2.7.4 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dbg: PV changed from "2.7.3" to "2.7.4"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dbg: PKGV changed from 2.7.3 [default] to 2.7.4 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dev: PV changed from "2.7.3" to "2.7.4"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dev: PKGV changed from 2.7.3 [default] to 2.7.4 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-doc: PV changed from "2.7.3" to "2.7.4"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-doc: PKGV changed from 2.7.3 [default] to 2.7.4 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-locale: PV changed from "2.7.3" to "2.7.4"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-locale: PKGV changed from 2.7.3 [default] to 2.7.4 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-src: PV changed from "2.7.3" to "2.7.4"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-src: PKGV changed from 2.7.3 [default] to 2.7.4 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-staticdev: PV changed from "2.7.3" to "2.7.4"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-staticdev: PKGV changed from 2.7.3 [default] to 2.7.4 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments: PV changed from "2.7.3" to "2.7.4"
packages/core2-32-poky-linux/python3-pygments/python3-pygments: PKGSIZE changed from 5765763 to 5766590 (+0%)
packages/core2-32-poky-linux/python3-pygments/python3-pygments: PKGV changed from 2.7.3 [default] to 2.7.4 [default]
Changes to packages/core2-32-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.9/site-packages/Pygments-2.7.3-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/Pygments-2.7.4-py3.9.egg-info

--===============4855349718573874855==--
