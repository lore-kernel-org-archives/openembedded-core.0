Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA15C47081
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:42 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.10522.1648819420815660972
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=TTx0/eBG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 0101017fe54bbbb3-ec6044ed-1205-467e-bc6f-1ce0973c800d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hjMpq1iuX6zoIaHHAoEi98rOI4ppHZeAX/tUEifpycg=;
	b=TTx0/eBGCvsSQ8JQRVYz4eTkmfO8sPdXEwDXdN6KlMb/7uIXq+9sTPRBcr2ALeSz
	hfKLdsesjdThDFzdvehQtyobG1mig0qBta16M8bmWolCkpKQgaAtoFH9STT3w1+BMv5
	7dlinYZsoke+xT9gfBdybGwlfTqRj6uIJzGjLrX0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hjMpq1iuX6zoIaHHAoEi98rOI4ppHZeAX/tUEifpycg=;
	b=Pea/K/o84qtdxSEHosKf9wo5qtECH6VpnQdKKp3hvtKqx96U1qIN9bKGfLd9Drva
	s9OroQC6XPINMCnOFawRsO8+ab2fY3a+/gsK6VHVXJ1p28IJSQpzn0PKK2yzNpCL5Fs
	WGJMCoIx5J88TI66JaMcySj6fFFyV1vmxqhz47OQ=
Content-Type: multipart/mixed; boundary="===============0538376489127445848=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-mako: upgrading to 1.2.0 SUCCEEDED
Message-ID: 
 <0101017fe54bbbb3-ec6044ed-1205-467e-bc6f-1ce0973c800d-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163899

--===============0538376489127445848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-mako* to *1.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-mako-upgrade-1.1.6-1.2.0.patch
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
--===============0538376489127445848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-mako/python3-mako: FILELIST: removed "/usr/lib/python3.10/site-packages/Mako-1.1.6.dist-info/AUTHORS /usr/lib/python3.10/site-packages/Mako-1.1.6.dist-info/WHEEL /usr/lib/python3.10/site-packages/Mako-1.1.6.dist-info/LICENSE /usr/lib/python3.10/site-packages/Mako-1.1.6.dist-info/METADATA /usr/lib/python3.10/site-packages/Mako-1.1.6.dist-info/top_level.txt /usr/lib/python3.10/site-packages/Mako-1.1.6.dist-info/entry_points.txt /usr/lib/python3.10/site-packages/Mako-1.1.6.dist-info/RECORD", added "/usr/lib/python3.10/site-packages/mako/testing/assertions.py /usr/lib/python3.10/site-packages/Mako-1.2.0.dist-info/entry_points.txt /usr/lib/python3.10/site-packages/Mako-1.2.0.dist-info/WHEEL /usr/lib/python3.10/site-packages/mako/testing/helpers.py /usr/lib/python3.10/site-packages/mako/testing/config.py /usr/lib/python3.10/site-packages/mako/testing/__pycache__/assertions.cpython-310.pyc /usr/lib/python3.10/site-packages/mako/testing/exclusions.py /usr
 /lib/python3.10/site-packages/Mako-1.2.0.dist-info/LICENSE /usr/lib/python3.10/site-packages/mako/testing/__pycache__/config.cpython-310.pyc /usr/lib/python3.10/site-packages/mako/testing/__pycache__/fixtures.cpython-310.pyc /usr/lib/python3.10/site-packages/mako/testing/fixtures.py /usr/lib/python3.10/site-packages/mako/testing/__pycache__/exclusions.cpython-310.pyc /usr/lib/python3.10/site-packages/mako/testing/__init__.py /usr/lib/python3.10/site-packages/mako/testing/_config.py /usr/lib/python3.10/site-packages/Mako-1.2.0.dist-info/top_level.txt /usr/lib/python3.10/site-packages/Mako-1.2.0.dist-info/METADATA /usr/lib/python3.10/site-packages/Mako-1.2.0.dist-info/RECORD /usr/lib/python3.10/site-packages/mako/testing/__pycache__/_config.cpython-310.pyc /usr/lib/python3.10/site-packages/mako/testing/__pycache__/helpers.cpython-310.pyc /usr/lib/python3.10/site-packages/mako/testing/__pycache__/__init__.cpython-310.pyc"
Changes to packages/core2-32-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.10/site-packages/Mako-1.1.6.dist-info moved to /usr/lib/python3.10/site-packages/Mako-1.2.0.dist-info
  /usr/lib/python3.10/site-packages/mako/testing was added
  /usr/lib/python3.10/site-packages/mako/testing/assertions.py was added
  /usr/lib/python3.10/site-packages/mako/testing/_config.py was added
  /usr/lib/python3.10/site-packages/mako/testing/config.py was added
  /usr/lib/python3.10/site-packages/mako/testing/exclusions.py was added
  /usr/lib/python3.10/site-packages/mako/testing/fixtures.py was added
  /usr/lib/python3.10/site-packages/mako/testing/helpers.py was added
  /usr/lib/python3.10/site-packages/mako/testing/__init__.py was added
  /usr/lib/python3.10/site-packages/mako/testing/__pycache__ was added
  /usr/lib/python3.10/site-packages/mako/testing/__pycache__/assertions.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/mako/testing/__pycache__/_config.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/mako/testing/__pycache__/config.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/mako/testing/__pycache__/exclusions.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/mako/testing/__pycache__/fixtures.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/mako/testing/__pycache__/helpers.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/mako/testing/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/Mako-1.1.6.dist-info/AUTHORS was removed

--===============0538376489127445848==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-mako-upgrade-1.1.6-1.2.0.patch"

From 0fd070185f94b5da9e64d83b61d27676cd96b53c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 07:37:18 +0000
Subject: [PATCH] python3-mako: upgrade 1.1.6 -> 1.2.0

---
 ...n3-mako_1.1.6.bb => python3-mako_1.2.0.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.1.6.bb => python3-mako_1.2.0.bb} (28%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.1.6.bb b/meta/recipes-devtools/python/python3-mako_1.2.0.bb
similarity index 28%
rename from meta/recipes-devtools/python/python3-mako_1.1.6.bb
rename to meta/recipes-devtools/python/python3-mako_1.2.0.bb
index 71e5d96ba1..c7d9ffadda 100644
--- a/meta/recipes-devtools/python/python3-mako_1.1.6.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.2.0.bb
@@ -1,14 +1,33 @@
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
+# -Copyright 2006-2020 the Mako authors and contributors <see AUTHORS file>.
+# +Copyright 2006-2021 the Mako authors and contributors <see AUTHORS file>.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy of
+#  this software and associated documentation files (the "Software"), to deal in
+# 
+#
+
 SUMMARY = "Templating library for Python"
 HOMEPAGE = "http://www.makotemplates.org/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=943eb67718222db21d44a4ef1836675f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b32291f107a8f1ea94c4a41e00a6a18d"
 
 PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "4e9e345a41924a954251b95b4b28e14a301145b544901332e658907a7464b6b2"
+SRC_URI[sha256sum] = "9a7c7e922b87db3686210cf49d5d767033a41d4010b284e747682c92bddd8b39"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-netclient \
-- 
2.27.0


--===============0538376489127445848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-mako: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.1.6.tar.gz" to "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.2.0.tar.gz"
packages/core2-32-poky-linux/python3-mako: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/python3-mako: PV changed from "1.1.6" to "1.2.0"
packages/core2-32-poky-linux/python3-mako/python3-mako-dbg: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-dbg: PV changed from "1.1.6" to "1.2.0"
packages/core2-32-poky-linux/python3-mako/python3-mako-dev: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-dev: PV changed from "1.1.6" to "1.2.0"
packages/core2-32-poky-linux/python3-mako/python3-mako-doc: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-doc: PV changed from "1.1.6" to "1.2.0"
packages/core2-32-poky-linux/python3-mako/python3-mako-locale: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-locale: PV changed from "1.1.6" to "1.2.0"
packages/core2-32-poky-linux/python3-mako/python3-mako-src: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-src: PV changed from "1.1.6" to "1.2.0"
packages/core2-32-poky-linux/python3-mako/python3-mako-staticdev: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-staticdev: PV changed from "1.1.6" to "1.2.0"
packages/core2-32-poky-linux/python3-mako/python3-mako: PKGSIZE changed from 493107 to 506001 (+3%)
packages/core2-32-poky-linux/python3-mako/python3-mako: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako: PV changed from "1.1.6" to "1.2.0"
packages/core2-32-poky-linux/python3-mako/python3-mako: FILELIST: removed "/usr/lib/python3.10/site-packages/Mako-1.1.6.dist-info/WHEEL /usr/lib/python3.10/site-packages/Mako-1.1.6.dist-info/entry_points.txt /usr/lib/python3.10/site-packages/Mako-1.1.6.dist-info/RECORD /usr/lib/python3.10/site-packages/Mako-1.1.6.dist-info/top_level.txt /usr/lib/python3.10/site-packages/Mako-1.1.6.dist-info/LICENSE /usr/lib/python3.10/site-packages/Mako-1.1.6.dist-info/AUTHORS /usr/lib/python3.10/site-packages/Mako-1.1.6.dist-info/METADATA", added "/usr/lib/python3.10/site-packages/Mako-1.2.0.dist-info/WHEEL /usr/lib/python3.10/site-packages/mako/testing/fixtures.py /usr/lib/python3.10/site-packages/mako/testing/__pycache__/assertions.cpython-310.pyc /usr/lib/python3.10/site-packages/Mako-1.2.0.dist-info/METADATA /usr/lib/python3.10/site-packages/Mako-1.2.0.dist-info/top_level.txt /usr/lib/python3.10/site-packages/Mako-1.2.0.dist-info/RECORD /usr/lib/python3.10/site-packages/mako/testing/config.py /u
 sr/lib/python3.10/site-packages/mako/testing/__pycache__/helpers.cpython-310.pyc /usr/lib/python3.10/site-packages/mako/testing/__pycache__/config.cpython-310.pyc /usr/lib/python3.10/site-packages/mako/testing/helpers.py /usr/lib/python3.10/site-packages/mako/testing/exclusions.py /usr/lib/python3.10/site-packages/mako/testing/assertions.py /usr/lib/python3.10/site-packages/Mako-1.2.0.dist-info/entry_points.txt /usr/lib/python3.10/site-packages/mako/testing/__pycache__/exclusions.cpython-310.pyc /usr/lib/python3.10/site-packages/mako/testing/__pycache__/fixtures.cpython-310.pyc /usr/lib/python3.10/site-packages/mako/testing/_config.py /usr/lib/python3.10/site-packages/mako/testing/__pycache__/_config.cpython-310.pyc /usr/lib/python3.10/site-packages/Mako-1.2.0.dist-info/LICENSE /usr/lib/python3.10/site-packages/mako/testing/__init__.py /usr/lib/python3.10/site-packages/mako/testing/__pycache__/__init__.cpython-310.pyc"
Changes to packages/core2-32-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.10/site-packages/Mako-1.1.6.dist-info moved to /usr/lib/python3.10/site-packages/Mako-1.2.0.dist-info
  /usr/lib/python3.10/site-packages/mako/testing was added
  /usr/lib/python3.10/site-packages/mako/testing/assertions.py was added
  /usr/lib/python3.10/site-packages/mako/testing/_config.py was added
  /usr/lib/python3.10/site-packages/mako/testing/config.py was added
  /usr/lib/python3.10/site-packages/mako/testing/exclusions.py was added
  /usr/lib/python3.10/site-packages/mako/testing/fixtures.py was added
  /usr/lib/python3.10/site-packages/mako/testing/helpers.py was added
  /usr/lib/python3.10/site-packages/mako/testing/__init__.py was added
  /usr/lib/python3.10/site-packages/mako/testing/__pycache__ was added
  /usr/lib/python3.10/site-packages/mako/testing/__pycache__/assertions.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/mako/testing/__pycache__/_config.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/mako/testing/__pycache__/config.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/mako/testing/__pycache__/exclusions.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/mako/testing/__pycache__/fixtures.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/mako/testing/__pycache__/helpers.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/mako/testing/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/Mako-1.1.6.dist-info/AUTHORS was removed

--===============0538376489127445848==--

