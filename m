Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CEFFC282D6
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:27 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.7168.1740828323633416534
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dd+xes3b;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=3BpftrhF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101955174332e-030d625d-c13a-4320-b2a0-1e64fdcb0bec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YpDOLu42o+XdhEVm+ZWuzCHUSa9UtKmni2ajSQM1mRM=;
	b=dd+xes3b27YQoDnjDatYhc9FmJ+YrdVZKtgGo+QGcxYHfrVM9gkUeLXqAUdqwcBF
	6MgdDN3J7u5cg680V/fLnpnQ92oFHmoWVyOLPQdqBEijyG8NXyqEI8Sd3+aUEAGiE0O
	Z+EGnSph6SImPVokffDCShQ1mtqDA5euZa0Mhweg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YpDOLu42o+XdhEVm+ZWuzCHUSa9UtKmni2ajSQM1mRM=;
	b=3BpftrhFkDAzJf39pEhzvoE2xIJMVdAc4gZV5xFnXoJLFaTReta3v4UXxiazkTfG
	0tGsarpTYhwSDwnAjCmoxh6KJiNixT5ht4vQJ30TmIGN1kNb4qHe/kRAOIWbOx1cfLA
	c45BudZ5eujAP8zHvaBcIdcXU/mQSsISG8rmuebM=
Content-Type: multipart/mixed; boundary="===============6361352770940653744=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <mrybczynska@syslinbit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-beartype: upgrading to 0.20.0 SUCCEEDED
Message-ID: <010101955174332e-030d625d-c13a-4320-b2a0-1e64fdcb0bec-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212120

--===============6361352770940653744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-beartype* to *0.20.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-beartype-upgrade-0.19.0-0.20.0.patch
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
From d3e59438e766a8bd96d9ebe68c99161ff81edd6b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 07:52:42 +0000
Subject: [PATCH] python3-beartype: upgrade 0.19.0 -> 0.20.0

---
 ...e_0.19.0.bb => python3-beartype_0.20.0.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.19.0.bb => python3-beartype_0.20.0.bb} (22%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.19.0.bb b/meta/recipes-devtools/python/python3-beartype_0.20.0.bb
similarity index 22%
rename from meta/recipes-devtools/python/python3-beartype_0.19.0.bb
rename to meta/recipes-devtools/python/python3-beartype_0.20.0.bb
index ee2c068e09..1276b2acec 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.19.0.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.20.0.bb
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
+# -Copyright (c) 2014-2024 Beartype authors.
+# +Copyright (c) 2014-2025 Beartype authors.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy
+#  of this software and associated documentation files (the "Software"), to deal
+# 
+#
+
 SUMMARY = "Unbearably fast runtime type checking in pure Python."
 HOMEPAGE = "https://beartype.readthedocs.io"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e71f94261c1b39896cacacfeaf60560e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3a5bc05a109d235912da97a053cd7a58"
 
-SRC_URI[sha256sum] = "de42dfc1ba5c3710fde6c3002e3bd2cad236ed4d2aabe876345ab0b4234a6573"
+SRC_URI[sha256sum] = "599ecc86b88549bcb6d1af626f44d85ffbb9151ace5d7f9f3b493dce2ffee529"
 
 inherit pypi python_hatchling
 
-- 
2.44.1


--===============6361352770940653744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-beartype: PV changed from "0.19.0" to "0.20.0"
packages/core2-64-poky-linux/python3-beartype: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-beartype: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.19.0.tar.gz;downloadfilename=beartype-0.19.0.tar.gz" to "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.20.0.tar.gz;downloadfilename=beartype-0.20.0.tar.gz"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dbg: PV changed from "0.19.0" to "0.20.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dbg: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dev: PV changed from "0.19.0" to "0.20.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dev: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-doc: PV changed from "0.19.0" to "0.20.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-doc: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-locale: PV changed from "0.19.0" to "0.20.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-locale: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-src: PV changed from "0.19.0" to "0.20.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-src: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-staticdev: PV changed from "0.19.0" to "0.20.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-staticdev: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PV changed from "0.19.0" to "0.20.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.13/site-packages/beartype-0.19.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/beartype-0.20.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/beartype/_data/module/__pycache__ -> /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__, directory renamed /usr/lib/python3.13/site-packages/beartype-0.19.0.dist-info -> /usr/lib/python3.13/site-packages/beartype-0.20.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/beartype/_data/module -> /usr/lib/python3.13/site-packages/beartype/_data/api/standard, removed "/usr/lib/python3.13/site-packages/beartype/_check/error/_pep/errpep484.py /usr/lib/python3.13/site-packages/beartype/_util/api/utilapityping.py /usr/lib/python3.13/site-packages/beartype/door/_doortest.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585ty
 pe.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484.py /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahintfactory.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep613.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep593.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep673.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484union.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/utilapisphinx.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585callable.py /usr/lib/python3.13/site-packages/beartype/_data/api/dataapinumpy.py /usr/lib/python3.13/s
 ite-packages/beartype/_util/cache/pool/__pycache__/utilcachepoolobjecttyped.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484namedtuple.py /usr/lib/python3.13/site-packages/beartype/door/_doormap.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep675.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep612.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep591.py /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapisphinx.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/doorsub.py /usr/lib/python3.13/site-packages/beartype/door/_cls/__pycache__/doorsub.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep673.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585ref.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint
 /pep/proposal/pep484/__pycache__/utilpep484namedtuple.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484newtype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/nonpep/api/__pycache__/utilmodnumpy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585func.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapibeartype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep589.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep557.py /usr/lib/python3.13/site-packages/beartype/_util/api/utilapinumpy.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585generic.py /usr/lib/python3.13/site-packa
 ges/beartype/_util/api/__pycache__/utilapityping.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/utilapifunctools.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585container.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convcoerce.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convreduce.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484typevar.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep484604.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484union.py /usr/lib/python3.13/site-packages/beartype/_data/kind/__pycache__/datakinddict.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/__pycache__/dataapinumpy.cpython-313.pyc /usr/lib/python3.13/site-p
 ackages/beartype/_util/hint/pep/proposal/__pycache__/utilpep585.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep675.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep695.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cache/pool/utilcachepoolobjecttyped.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484generic.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep557.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep647.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585ref.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep613.py /usr/lib/python3.13/site-packages/beartype/door/__pycache__/_doormap.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_uti
 l/api/utilapibeartype.py /usr/lib/python3.13/site-packages/beartype/_util/hint/nonpep/api/utilmodnumpy.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep612.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/convreduce.py /usr/lib/python3.13/site-packages/beartype/_check/code/__pycache__/codecls.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep585.py /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapicontextlib.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep484604.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep646692.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585container.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585tuple.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilp
 ep544.py /usr/lib/python3.13/site-packages/beartype/_util/utilobjectattr.py /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/__pycache__/errpep484.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/__pycache__/utilobjectattr.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585callable.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep591.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/datahintfactory.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/__pycache__/utilpepreduce.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/utilpepreduce.py /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapifunctools.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep589.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_u
 til/hint/pep/proposal/pep484585/__pycache__/utilpep484585generic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/__pycache__/_doortest.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/convcoerce.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484newtype.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484generic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484typevar.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585func.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585type.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep647.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/
 proposal/pep484585/__pycache__/utilpep484585tuple.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep695.py /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapinumpy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep646692.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep586.py /usr/lib/python3.13/site-packages/beartype/_data/kind/datakinddict.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep544.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep593.py /usr/lib/python3.13/site-packages/beartype/_util/api/utilapicontextlib.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep586.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/codecls.py", added "/usr/lib/python3.13/site-packages/beartype/_check/conv
 ert/_reduce/_pep/__pycache__/redpep484604.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/rednonpeptype.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__/redpep484typevar.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__init__.py /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484585/__pycache__/doorpep484585subscripted.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/util/doorclstest.py /usr/lib/python3.13/site-packages/beartype/_check/metadata/__pycache__/metasane.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484612646.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484typevar.py /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/codepep484585container.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep612.py
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/redhint.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/redpep484585type.py /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484/doorpep484any.py /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484/codepep484typevar.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585container.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585type.py /usr/lib/python3.13/site-packages/beartype/_data/api/external/__pycache__/datamodthirdparty.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/codepep484604.py /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utilsphinx.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep613.cpython-313.pyc /usr/lib/python3.1
 3/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep647.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/metadata/metasane.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep673.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep695.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/kind/__pycache__/datakindmap.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585ref.py /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/hintsmeta.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585tuple.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585tuple.py /usr/lib/python3.13/site-packages/beartyp
 e/_check/metadata/hint/__pycache__/hintsmeta.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep675.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep695.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/hintmeta.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep544.py /usr/lib/python3.13/site-packages/beartype/_util/api/external/utilclick.py /usr/lib/python3.13/sit
 e-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585callable.py /usr/lib/python3.13/site-packages/beartype/_util/api/external/utilnumpy.py /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/kind/sequence/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep484612646.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/proposal/__pycache__/checkpep484585generic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/cache/pool/utilcachepoolinstance.py /usr/lib/python3.13/site-packages/beartype/_check/proposal/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep
 484604.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484generic.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/_redmap.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__pycache__/redpep484585generic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__pycache__/redpep484585type.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep589.py /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/_convcoerce.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484namedtuple.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484/__pycache__/doo
 rpep484any.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585func.py /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/__pycache__/codepep484585container.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/util/doorclsget.py /usr/lib/python3.13/site-packages/beartype/_util/kind/sequence/__pycache__/utilseqmake.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__/redpep484.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep557.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep647.py /usr/lib/python3.13/site-packages/beartype/_check/proposal/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__/__init__.cpython-
 313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/external/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/standard/__pycache__/utiltyping.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/external/__pycache__/dataapinumpy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/__pycache__/errpep484typevar.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585func.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585type.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/standard/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484/__pycache__/codepep484typevar.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/
 api/standard/utiltyping.py /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/datahintpep.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/redapinumpy.py /usr/lib/python3.13/site-packages/beartype/_util/api/standard/__pycache__/utilcontextlib.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utilclick.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/redpep484.py /usr/lib/python3.13/site-packages/beartype/_util/api/standard/utilfunctools.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/__pycache__/redapinumpy.cpython-313.pyc /usr/lib/python3.13/si
 te-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585ref.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/__pycache__/utilobjattr.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/__pycache__/utilobjmake.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/standard/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484newtype.py /usr/lib/python3.13/site-packages/beartype/_data/api/external/dataapinumpy.py /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilbeartype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep585.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep695.py /usr/lib/python3.13/site-packages/bear
 type/_check/code/_pep/__pycache__/codepep484604.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__/doorclsget.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__/doorclstest.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484typevar.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep646692.py /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__pycache__/hintmeta.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/redhint.py /usr/lib/python3.13/site-packages/beartype/_util/kind/sequence/utilseqmake.py /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/errpep484typevar.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585.py /usr/lib/python3.13/site-packages/beartype/_data/api/external/datamodthirdparty.py /usr/lib/python3.13/site-
 packages/beartype/_check/convert/_reduce/_redmap.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep647742.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/__pycache__/errpep484noreturn.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/__pycache__/pep484585genget.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585callable.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahintpep.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_convcoerce.py /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utilnumpy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartyp
 e/_util/hint/pep/proposal/pep484/pep484.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep484604.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/kind/sequence/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep646692.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep591.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep647742.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/utilobjattr.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484union.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep544.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep589.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep59
 3.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/__pycache__/doorhint.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/pep484585genget.py /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/utilobjmake.py /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484585/doorpep484585generic.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484585/doorpep484585subscripted.py /usr/lib/python3.13/site-packages/beartype/_util/api/external/utilsphinx.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep544.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep589.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/r
 edpep593.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep675.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep695.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep544.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep557.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep585.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep586.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep589.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/errpep484noreturn.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep591.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cache/pool/__pycache__/utilcachepoolinstance.cpython-313.pyc /usr/l
 ib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep593.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep612.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/__pycache__/rednonpeptype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484604.py /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/redpep484585generic.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/pep484585gentest.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484namedtuple.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep586.py /usr/lib/pytho
 n3.13/site-packages/beartype/_data/api/external/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/api/external/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep593.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep613.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep673.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585container.py /usr/lib/python3.13/site-packages/beartype/_util/api/utilbeartype.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484newtype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484585/__pycache__/doorpep484585generic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/standard/utilcontextlib.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484generic.cpython-313.pyc /usr/lib/python3.13/site-packages/be
 artype/_util/api/standard/__pycache__/utilfunctools.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/redpep484typevar.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484union.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484/__init__.py /usr/lib/python3.13/site-packages/beartype/door/_cls/doorhint.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/__pycache__/pep484585gentest.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/kind/datakindmap.py /usr/lib/python3.13/site-packages/beartype/_check/proposal/checkpep484585generic.py"
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PKGSIZE changed from 5342569 to 5874545 (+10%)
Changes to packages/core2-64-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.13/site-packages/beartype-0.19.0.dist-info moved to /usr/lib/python3.13/site-packages/beartype-0.20.0.dist-info
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/codepep484604.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484 was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585 was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/codepep484585container.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/__pycache__/codepep484585container.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484/codepep484typevar.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484/__pycache__/codepep484typevar.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/__pycache__/codepep484604.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_convcoerce.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/_convcoerce.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/__pycache__/redapinumpy.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/redapinumpy.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/__pycache__/rednonpeptype.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/rednonpeptype.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484 was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585 was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__pycache__/redpep484585generic.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__pycache__/redpep484585type.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/redpep484585generic.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/redpep484585type.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__/redpep484.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__/redpep484typevar.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/redpep484.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/redpep484typevar.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep484604.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep544.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep589.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep593.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep675.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep695.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep484604.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep544.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep589.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep593.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep675.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep695.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/redhint.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/_redmap.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/redhint.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_redmap.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484 was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/errpep484noreturn.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/errpep484typevar.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/__pycache__/errpep484noreturn.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/__pycache__/errpep484typevar.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/hintmeta.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/hintsmeta.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__pycache__/hintmeta.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__pycache__/hintsmeta.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/metasane.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/__pycache__/metasane.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/proposal was added
  /usr/lib/python3.13/site-packages/beartype/_check/proposal/checkpep484585generic.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/proposal/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/proposal/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/proposal/__pycache__/checkpep484585generic.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/proposal/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/external was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/external/dataapinumpy.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/external/datamodthirdparty.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/external/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/external/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/external/__pycache__/dataapinumpy.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/external/__pycache__/datamodthirdparty.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/external/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodcontextlib.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodpy.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodtyping.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodcontextlib.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodpy.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodtyping.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/datahintpep.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahintpep.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/kind/datakindmap.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/kind/__pycache__/datakindmap.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/doorhint.py was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484585/doorpep484585generic.py was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484585/doorpep484585subscripted.py was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484585/__pycache__/doorpep484585generic.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484585/__pycache__/doorpep484585subscripted.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484/doorpep484any.py was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484/__pycache__/doorpep484any.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/__pycache__/doorhint.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/doorclsget.py was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/doorclstest.py was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__/doorclsget.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__/doorclstest.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utilclick.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utilnumpy.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utilsphinx.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/utilclick.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/utilnumpy.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/utilsphinx.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilbeartype.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/standard was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/standard/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/standard/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/standard/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/standard/__pycache__/utilcontextlib.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/standard/__pycache__/utilfunctools.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/standard/__pycache__/utiltyping.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/standard/utilcontextlib.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/standard/utilfunctools.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/standard/utiltyping.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/utilbeartype.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/cache/pool/__pycache__/utilcachepoolinstance.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/cache/pool/utilcachepoolinstance.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/pep484585genget.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/pep484585gentest.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/__pycache__/pep484585genget.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/__pycache__/pep484585gentest.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585callable.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585container.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585func.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585ref.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585tuple.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585type.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585callable.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585container.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585func.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585ref.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585tuple.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585type.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484604.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484612646.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484generic.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484namedtuple.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484newtype.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484typevar.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484union.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484generic.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484namedtuple.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484newtype.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484typevar.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484union.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep544.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep557.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep585.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep586.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep589.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep591.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep593.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep612.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep613.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep646692.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep647742.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep647.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep673.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep695.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep484604.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep484612646.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep544.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep557.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep585.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep586.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep589.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep591.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep593.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep612.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep613.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep646692.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep647742.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep647.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep673.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep695.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/sequence was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/sequence/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/sequence/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/sequence/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/sequence/__pycache__/utilseqmake.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/sequence/utilseqmake.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/__pycache__/utilobjattr.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/__pycache__/utilobjmake.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/utilobjattr.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/utilobjmake.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/codecls.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/code/__pycache__/codecls.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/convcoerce.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/convreduce.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convcoerce.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convreduce.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/errpep484.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/__pycache__/errpep484.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/api/dataapinumpy.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/api/__pycache__/dataapinumpy.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/datahintfactory.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahintfactory.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/kind/datakinddict.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/kind/__pycache__/datakinddict.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/module was removed
  /usr/lib/python3.13/site-packages/beartype/_data/module/datamodcontextlib.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/module/datamodpy.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/module/datamodtyping.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/module/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/module/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/_data/module/__pycache__/datamodcontextlib.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/module/__pycache__/datamodpy.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/module/__pycache__/datamodtyping.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/module/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_cls/doorsub.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_cls/__pycache__/doorsub.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_doormap.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_doortest.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/__pycache__/_doormap.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/__pycache__/_doortest.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapibeartype.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapicontextlib.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapifunctools.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapinumpy.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapisphinx.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapityping.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/utilapibeartype.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/utilapicontextlib.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/utilapifunctools.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/utilapinumpy.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/utilapisphinx.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/utilapityping.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/cache/pool/__pycache__/utilcachepoolobjecttyped.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/cache/pool/utilcachepoolobjecttyped.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/nonpep/api/__pycache__/utilmodnumpy.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/nonpep/api/utilmodnumpy.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585callable.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585container.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585func.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585generic.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585ref.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585tuple.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585type.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585callable.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585container.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585func.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585generic.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585ref.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585tuple.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585type.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484generic.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484namedtuple.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484newtype.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484typevar.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484union.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484generic.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484namedtuple.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484newtype.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484typevar.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484union.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep484604.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep544.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep557.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep585.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep586.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep589.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep591.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep593.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep612.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep613.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep646692.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep647.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep673.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep675.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep695.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep484604.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep544.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep557.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep585.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep586.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep589.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep591.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep593.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep612.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep613.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep646692.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep647.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep673.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep675.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep695.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/__pycache__/utilpepreduce.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/utilpepreduce.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/__pycache__/utilobjectattr.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/utilobjectattr.py was removed

--===============6361352770940653744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.13/site-packages/beartype-0.19.0.dist-info -> /usr/lib/python3.13/site-packages/beartype-0.20.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/beartype-0.19.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/beartype-0.20.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/beartype/_data/module/__pycache__ -> /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__, directory renamed /usr/lib/python3.13/site-packages/beartype/_data/module -> /usr/lib/python3.13/site-packages/beartype/_data/api/standard, removed "/usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep557.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484namedtuple.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585typ
 e.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484union.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585callable.py /usr/lib/python3.13/site-packages/beartype/_check/code/codecls.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585container.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep646692.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep613.py /usr/lib/python3.13/site-packages/beartype/_util/api/utilapinumpy.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585.cpython-313.pyc /usr/lib/python3.13/site-packages/be
 artype/_util/api/__pycache__/utilapibeartype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585generic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/convreduce.py /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/errpep484.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep593.py /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapisphinx.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep484604.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep646692.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep647.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585generic.py /usr/lib/python3.13/site-packages/beartype/_check/convert/convcoerce.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal
 /utilpep612.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585callable.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/kind/__pycache__/datakinddict.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep591.py /usr/lib/python3.13/site-packages/beartype/_data/api/__pycache__/dataapinumpy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/__pycache__/utilobjectattr.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_doortest.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/__pycache__/utilpepreduce.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cache/pool/__pycache__/utilcachepoolobjecttyped.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapifunctools.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484union.cpython-313.pyc /us
 r/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep585.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep589.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585tuple.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convcoerce.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convreduce.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585.py /usr/lib/python3.13/site-packages/beartype/_util/hint/nonpep/api/utilmodnumpy.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep593.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep613.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep673.cpython-313.pyc /usr/lib/python3.13/site-pa
 ckages/beartype/_util/hint/pep/proposal/__pycache__/utilpep612.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep585.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep675.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep695.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep544.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/nonpep/api/__pycache__/utilmodnumpy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/kind/datakinddict.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585tuple.py /usr/lib/python3.13/site-packages/beartype/door/__pycache__/_doortest.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep673.py /usr/lib/python3.13/site-packages/beartype/_util/hin
 t/pep/proposal/pep484/utilpep484generic.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep591.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/utilapisphinx.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep557.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep647.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep586.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585func.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapityping.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585ref.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484typevar.py /usr/lib/python3.13/site-packages/beartype/_check/
 code/__pycache__/codecls.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_doormap.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484newtype.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484newtype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/dataapinumpy.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep544.py /usr/lib/python3.13/site-packages/beartype/_util/api/utilapifunctools.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484typevar.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/__pycache__/errpep484.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484generic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/__pycache__/_doormap.cpython-313.pyc /usr/lib/python3.13/site-packages/
 beartype/_util/hint/pep/proposal/utilpep675.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585container.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep589.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep484604.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep586.py /usr/lib/python3.13/site-packages/beartype/_util/api/utilapicontextlib.py /usr/lib/python3.13/site-packages/beartype/_util/api/utilapityping.py /usr/lib/python3.13/site-packages/beartype/_util/utilobjectattr.py /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapinumpy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/datahintfactory.py /usr/lib/python3.13/site-packages/beartype/_util/api/utilapibeartype.py /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapicont
 extlib.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahintfactory.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cache/pool/utilcachepoolobjecttyped.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585ref.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585func.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585type.py /usr/lib/python3.13/site-packages/beartype/door/_cls/__pycache__/doorsub.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep695.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484namedtuple.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/utilpepreduce.py /usr/lib/python3.13/site-packages/beartype/door/_cls/doorsub.py", added "/usr/lib/python3.13/site-packages/beartype/_check/code
 /_pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/__pycache__/codepep484604.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep544.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep589.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep593.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/external/utilsphinx.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484612646.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__/redpep484.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/propo
 sal/pep484585/__pycache__/pep484585tuple.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep612.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep613.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep647.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep673.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep695.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484585/__pycache__/doorpep484585subscripted.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484newtype.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep593.cpython-313.pyc /u
 sr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep544.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahintpep.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__pycache__/redpep484585type.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/redpep484585type.py /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__pycache__/hintsmeta.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/codepep484604.py /usr/lib/python3.13/site-packages/beartype/_check/metadata/metasane.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585type.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585func.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep589.py /usr/lib/py
 thon3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585type.py /usr/lib/python3.13/site-packages/beartype/_util/api/external/utilclick.py /usr/lib/python3.13/site-packages/beartype/_util/api/external/utilnumpy.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484union.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/redhint.py /usr/lib/python3.13/site-packages/beartype/_util/kind/sequence/utilseqmake.py /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/hintmeta.py /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585callable.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/__pycache__/redapinumpy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/utilobjmake.py /usr/lib/python3.13/site-packages/beartype/_util/kind/sequen
 ce/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/_convcoerce.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585container.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/redpep484.py /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484/__pycache__/doorpep484any.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/standard/__pycache__/utiltyping.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484585/__pycache__/doorpep484585generic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/__pycache__/pep484585genget.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/
 convert/_reduce/_pep/pep484/redpep484typevar.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep593.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep613.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep673.py /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/errpep484noreturn.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484newtype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__init__.py /usr/lib/python3.13/site-packages/beartype/door/_cls/doorhint.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep585.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep695.py /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__/doorclstest.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/__pycache__/codepep484585containe
 r.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/rednonpeptype.py /usr/lib/python3.13/site-packages/beartype/_data/api/external/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/api/external/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484/codepep484typevar.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__/redpep484typevar.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/_redmap.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/__init__.py /usr/lib/python
 3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484generic.py /usr/lib/python3.13/site-packages/beartype/_util/kind/sequence/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/datahintpep.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585container.py /usr/lib/python3.13/site-packages/beartype/_util/api/standard/utiltyping.py /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utilsphinx.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484/__pycache__/codepep484typevar.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/utilbeartype.py /usr/lib/python3.13/site-packages/beartype/_check/proposal/__pycache__/checkpep484585generic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484585/doorpep484585generic.py
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/proposal/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/redpep484585generic.py /usr/lib/python3.13/site-packages/beartype/_data/api/external/dataapinumpy.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/pep484585gentest.py /usr/lib/python3.13/site-packages/beartype/_data/api/external/datamodthirdparty.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585callable.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/util/doorclsget.py /usr/lib/python3.13/site-packages/beartype/_check/proposal/checkpep484585generic.py /us
 r/lib/python3.13/site-packages/beartype/_util/api/standard/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_convcoerce.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585tuple.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep647742.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484generic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cache/pool/__pycache__/utilcachepoolinstance.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__/doorclsget.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/kind/sequence/__pycache__/utilseqmake.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/external/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/a
 pi/external/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/standard/__pycache__/utilfunctools.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep675.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep695.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484585/doorpep484585subscripted.py /usr/lib/python3.13/site-packages/beartype/_data/kind/__pycache__/datakindmap.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_redmap.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585ref.cp
 ython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484604.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep612.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/redhint.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep557.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep647.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__pycache__/redpep484585generic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/standard/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/__pycache__/rednonpeptype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utilnumpy.cpython-313.pyc /usr/lib/python3.13/si
 te-packages/beartype/_util/cache/pool/utilcachepoolinstance.py /usr/lib/python3.13/site-packages/beartype/_util/__pycache__/utilobjattr.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/__pycache__/utilobjmake.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/standard/utilfunctools.py /usr/lib/python3.13/site-packages/beartype/_check/proposal/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585.py /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/__pycache__/errpep484noreturn.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484/doorpep484any.py /usr/lib/python3.13/site-packages/beartype/door/_cls/util/doorclstest.py /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utilclick.cpython-313.pyc /usr/lib/python3.13/si
 te-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484typevar.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep544.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep557.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep585.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep586.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep589.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep591.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/hintsmeta.py /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_r
 educe/_pep/__pycache__/redpep484604.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep544.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep589.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep593.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep675.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep695.py /usr/lib/python3.13/site-packages/beartype/_data/api/external/__pycache__/dataapinumpy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep484604.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep646692.cpython-313.pyc 
 /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/codepep484585container.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep647742.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/__pycache__/errpep484typevar.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__pycache__/hintmeta.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep646692.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585func.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/redapinumpy.py /usr/lib/python3.13/site-packages/beartype/door/_cls/__pycache__/doorhint.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__/__init__.cpython-313.pyc
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/__pycache__/metasane.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/kind/datakindmap.py /usr/lib/python3.13/site-packages/beartype/_util/utilobjattr.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585ref.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep591.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep484604.py /usr/lib/python3.13/site-packages/beartype/_data/api/external/__pycache__/datamodthirdparty.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484union.py /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilbeartype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/errpep484typevar.py /usr/lib/python3.13/site-packages/beartype/_u
 til/hint/pep/proposal/pep484585/generic/pep484585genget.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484namedtuple.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/__pycache__/pep484585gentest.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484typevar.py /usr/lib/python3.13/site-packages/beartype/_util/api/standard/utilcontextlib.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484namedtuple.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep484612646.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep586.py /usr/lib/python3.13/site-packages/beartype/_util/api/standard/__pycache__/utilcontextlib.cpython-313.pyc"
Changes to packages/core2-64-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.13/site-packages/beartype-0.19.0.dist-info moved to /usr/lib/python3.13/site-packages/beartype-0.20.0.dist-info
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/codepep484604.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484 was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585 was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/codepep484585container.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/__pycache__/codepep484585container.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484/codepep484typevar.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484/__pycache__/codepep484typevar.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/__pycache__/codepep484604.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_convcoerce.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/_convcoerce.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/__pycache__/redapinumpy.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/redapinumpy.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/__pycache__/rednonpeptype.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/rednonpeptype.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484 was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585 was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__pycache__/redpep484585generic.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__pycache__/redpep484585type.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/redpep484585generic.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/redpep484585type.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__/redpep484.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__/redpep484typevar.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/redpep484.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/redpep484typevar.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep484604.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep544.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep589.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep593.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep675.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep695.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep484604.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep544.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep589.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep593.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep675.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep695.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/redhint.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/_redmap.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/redhint.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_redmap.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484 was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/errpep484noreturn.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/errpep484typevar.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/__pycache__/errpep484noreturn.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/__pycache__/errpep484typevar.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/hintmeta.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/hintsmeta.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__pycache__/hintmeta.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__pycache__/hintsmeta.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/metasane.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/__pycache__/metasane.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/proposal was added
  /usr/lib/python3.13/site-packages/beartype/_check/proposal/checkpep484585generic.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/proposal/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/proposal/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/proposal/__pycache__/checkpep484585generic.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/proposal/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/external was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/external/dataapinumpy.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/external/datamodthirdparty.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/external/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/external/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/external/__pycache__/dataapinumpy.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/external/__pycache__/datamodthirdparty.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/external/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodcontextlib.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodpy.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodtyping.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodcontextlib.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodpy.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodtyping.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/datahintpep.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahintpep.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/kind/datakindmap.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/kind/__pycache__/datakindmap.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/doorhint.py was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484585/doorpep484585generic.py was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484585/doorpep484585subscripted.py was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484585/__pycache__/doorpep484585generic.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484585/__pycache__/doorpep484585subscripted.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484/doorpep484any.py was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/pep/pep484/__pycache__/doorpep484any.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/__pycache__/doorhint.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/doorclsget.py was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/doorclstest.py was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__/doorclsget.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__/doorclstest.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utilclick.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utilnumpy.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utilsphinx.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/utilclick.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/utilnumpy.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/utilsphinx.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilbeartype.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/standard was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/standard/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/standard/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/standard/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/standard/__pycache__/utilcontextlib.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/standard/__pycache__/utilfunctools.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/standard/__pycache__/utiltyping.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/standard/utilcontextlib.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/standard/utilfunctools.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/standard/utiltyping.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/utilbeartype.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/cache/pool/__pycache__/utilcachepoolinstance.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/cache/pool/utilcachepoolinstance.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/pep484585genget.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/pep484585gentest.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/__pycache__/pep484585genget.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/generic/__pycache__/pep484585gentest.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585callable.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585container.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585func.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585ref.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585tuple.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585type.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585callable.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585container.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585func.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585ref.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585tuple.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585type.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484604.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484612646.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484generic.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484namedtuple.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484newtype.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484typevar.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/pep484union.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484generic.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484namedtuple.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484newtype.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484typevar.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/pep484union.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep544.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep557.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep585.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep586.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep589.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep591.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep593.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep612.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep613.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep646692.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep647742.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep647.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep673.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep695.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep484604.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep484612646.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep544.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep557.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep585.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep586.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep589.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep591.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep593.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep612.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep613.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep646692.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep647742.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep647.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep673.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep695.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/sequence was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/sequence/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/sequence/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/sequence/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/sequence/__pycache__/utilseqmake.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/sequence/utilseqmake.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/__pycache__/utilobjattr.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/__pycache__/utilobjmake.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/utilobjattr.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/utilobjmake.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/codecls.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/code/__pycache__/codecls.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/convcoerce.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/convreduce.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convcoerce.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convreduce.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/errpep484.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/__pycache__/errpep484.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/api/dataapinumpy.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/api/__pycache__/dataapinumpy.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/datahintfactory.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahintfactory.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/kind/datakinddict.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/kind/__pycache__/datakinddict.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/module was removed
  /usr/lib/python3.13/site-packages/beartype/_data/module/datamodcontextlib.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/module/datamodpy.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/module/datamodtyping.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/module/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/module/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/_data/module/__pycache__/datamodcontextlib.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/module/__pycache__/datamodpy.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/module/__pycache__/datamodtyping.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/module/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_cls/doorsub.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_cls/__pycache__/doorsub.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_doormap.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_doortest.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/__pycache__/_doormap.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/__pycache__/_doortest.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapibeartype.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapicontextlib.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapifunctools.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapinumpy.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapisphinx.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilapityping.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/utilapibeartype.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/utilapicontextlib.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/utilapifunctools.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/utilapinumpy.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/utilapisphinx.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/utilapityping.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/cache/pool/__pycache__/utilcachepoolobjecttyped.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/cache/pool/utilcachepoolobjecttyped.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/nonpep/api/__pycache__/utilmodnumpy.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/nonpep/api/utilmodnumpy.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585callable.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585container.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585func.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585generic.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585ref.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585tuple.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585type.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585callable.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585container.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585func.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585generic.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585ref.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585tuple.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585type.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484generic.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484namedtuple.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484newtype.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484typevar.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484union.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484generic.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484namedtuple.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484newtype.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484typevar.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484union.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep484604.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep544.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep557.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep585.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep586.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep589.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep591.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep593.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep612.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep613.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep646692.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep647.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep673.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep675.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep695.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep484604.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep544.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep557.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep585.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep586.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep589.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep591.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep593.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep612.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep613.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep646692.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep647.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep673.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep675.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/utilpep695.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/__pycache__/utilpepreduce.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/utilpepreduce.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/__pycache__/utilobjectattr.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/utilobjectattr.py was removed

--===============6361352770940653744==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-beartype-upgrade-0.19.0-0.20.0.patch"

RnJvbSBkM2U1OTQzOGU3NjZhOGJkOTZkOWViZTY4Yzk5MTYxZmY4MWVkZDZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwNzo1Mjo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYmVhcnR5cGU6IHVwZ3JhZGUgMC4xOS4wIC0+IDAuMjAuMAoKLS0tCiAuLi5lXzAuMTku
MC5iYiA9PiBweXRob24zLWJlYXJ0eXBlXzAuMjAuMC5iYn0gfCAyNSArKysrKysrKysrKysrKysr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWJlYXJ0eXBlXzAuMTku
MC5iYiA9PiBweXRob24zLWJlYXJ0eXBlXzAuMjAuMC5iYn0gKDIyJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmVhcnR5cGVfMC4xOS4wLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJlYXJ0eXBlXzAuMjAuMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDIyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtYmVhcnR5cGVfMC4xOS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmVhcnR5cGVfMC4yMC4wLmJiCmluZGV4IGVlMmMwNjhlMDku
LjEyNzZiMmFjZWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1iZWFydHlwZV8wLjE5LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWJlYXJ0eXBlXzAuMjAuMC5iYgpAQCAtMSwxMCArMSwzMSBAQAorIyBGSVhNRTog
dGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29s
IHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhl
IG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VO
U0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBj
b21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xp
Y2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdl
czoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysrIExJQ0VOU0UKKyMgQEAgLTEsNiArMSw2IEBACisj
ICBNSVQgTGljZW5zZQorIyAgCisjIC1Db3B5cmlnaHQgKGMpIDIwMTQtMjAyNCBCZWFydHlwZSBh
dXRob3JzLgorIyArQ29weXJpZ2h0IChjKSAyMDE0LTIwMjUgQmVhcnR5cGUgYXV0aG9ycy4KKyMg
IAorIyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFu
eSBwZXJzb24gb2J0YWluaW5nIGEgY29weQorIyAgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2Np
YXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwKKyMgCisj
CisKIFNVTU1BUlkgPSAiVW5iZWFyYWJseSBmYXN0IHJ1bnRpbWUgdHlwZSBjaGVja2luZyBpbiBw
dXJlIFB5dGhvbi4iCiBIT01FUEFHRSA9ICJodHRwczovL2JlYXJ0eXBlLnJlYWR0aGVkb2NzLmlv
IgogCiBMSUNFTlNFID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PWU3MWY5NDI2MWMxYjM5ODk2Y2FjYWNmZWFmNjA1NjBlIgorTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRTttZDU9M2E1YmMwNWExMDlkMjM1OTEyZGE5N2EwNTNjZDdhNTgiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkZTQyZGZjMWJhNWMzNzEwZmRlNmMzMDAyZTNiZDJjYWQy
MzZlZDRkMmFhYmU4NzYzNDVhYjBiNDIzNGE2NTczIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU5
OWVjYzg2Yjg4NTQ5YmNiNmQxYWY2MjZmNDRkODVmZmJiOTE1MWFjZTVkN2Y5ZjNiNDkzZGNlMmZm
ZWU1MjkiCiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKLS0gCjIuNDQuMQoK

--===============6361352770940653744==--

