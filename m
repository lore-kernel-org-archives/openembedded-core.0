Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CB6C04FCC
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:24 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.102666.1697399114305380349
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IovlQ4Qo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Hopq9gBA;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.193, mailfrom: 0101018b34df076f-104d392e-e517-462b-99c7-fe4ea3dcf54b-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UqD75Clg3vAOVcTQnGjWGbgc/dW6xlDotl8ph/yRSRk=;
	b=IovlQ4QoAl1siCimERmCuoH1j2rxYzfuUok9wkcBQJZ8HKNO7Y/Dw32baS04RbVT
	nOAn0bmUkPvMzysOy2ATCXHFzc/SGMb2hzgpQBqt1d3FSKvl5EqBmDJruVHMYZ2GWP4
	MDQiYRdzIbgbwZAZFHag+AAINsMW/E8+oilGauHs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UqD75Clg3vAOVcTQnGjWGbgc/dW6xlDotl8ph/yRSRk=;
	b=Hopq9gBA7uG0DtxlBa2PQNUXciZLv631lOopqpJnyxtu4Voj9WieTdE5YAOIZFuj
	6CuZklUlCYTVevCnLKZEHBd+HQ1eEw3OJvxFov+Gm8cpBhIUWKA+QEHQe+OVG0T6tFM
	PjGNBpbuIIS2ZUb44VjlsramNo+2t8efaJ0XN9Mw=
Content-Type: multipart/mixed; boundary="===============5783066701076794032=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <mrybczynska@syslinbit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-beartype: upgrading to 0.16.3 SUCCEEDED
Message-ID: <0101018b34df076f-104d392e-e517-462b-99c7-fe4ea3dcf54b-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189178

--===============5783066701076794032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-beartype* to *0.16.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-beartype-upgrade-0.15.0-0.16.3.patch
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
From f36bf5ee39aa078b28403834ef48823cb8fa5a08 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 10:18:26 +0000
Subject: [PATCH] python3-beartype: upgrade 0.15.0 -> 0.16.3

---
 .../{python3-beartype_0.15.0.bb => python3-beartype_0.16.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.15.0.bb => python3-beartype_0.16.3.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.15.0.bb b/meta/recipes-devtools/python/python3-beartype_0.16.3.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-beartype_0.15.0.bb
rename to meta/recipes-devtools/python/python3-beartype_0.16.3.bb
index 14eda1dd7d..e89ca3c88e 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.15.0.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.16.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://beartype.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e40b52d8eb5553aa8f705cdd3f979d69"
 
-SRC_URI[sha256sum] = "2af6a8d8a7267ccf7d271e1a3bd908afbc025d2a09aa51123567d7d7b37438df"
+SRC_URI[sha256sum] = "085591b5b77807229b65a137fd473c6891c45287fe0ca6565b3250dead00380b"
 
 inherit setuptools3 pypi
 
-- 
2.39.2


--===============5783066701076794032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/wrap/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype-0.15.0.dist-info -> /usr/lib/python3.11/site-packages/beartype-0.16.3.dist-info, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484 -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/__pycache__ -> /usr/lib/python3.11/site-packages/beart
 ype/_decor/error/_pep/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/error/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_data/mod -> /usr/lib/python3.11/site-packages/beartype/_data/module, directory renamed /usr/lib/python3.11/site-packages/beartype/_util/mod -> /usr/lib/python3.11/site-packages/beartype/_util/module, directory renamed /usr/lib/python3.11/site-packages/beartype/_util/mod/lib/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_util/module/lib/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_util, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error -> /usr/lib/python3.11/site-packages/beartype/_decor/error, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585/__pyc
 ache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_util/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_data/mod/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_data/module/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_util/mod/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_util/module/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585 -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_wrap -> /usr/lib/python3.11/site-packages/beartype/_decor/wrap, directory renamed /usr/lib/python3.11/site-packages/beartype/_util/mod/lib -> /usr/lib/python3.11/site-packages/beartype/
 _util/module/lib, removed "/usr/lib/python3.11/site-packages/beartype/_decor/_cache/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_conf/__pycache__/confcache.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/datakind.py /usr/lib/python3.11/site-packages/beartype/_util/text/utiltextident.py /usr/lib/python3.11/site-packages/beartype/_util/text/__pycache__/utiltextident.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/_cache/cachedecor.py /usr/lib/python3.11/site-packages/beartype/_decor/_decormore.py /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__pycache__/cachedecor.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/__pycache__/datakind.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__init__.py /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decormore.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__pycache__/cachetype.cpython
 -311.pyc /usr/lib/python3.11/site-packages/beartype/_conf/confcache.py /usr/lib/python3.11/site-packages/beartype/_decor/_cache/cachetype.py", added "/usr/lib/python3.11/site-packages/beartype/_util/text/utiltextversion.py /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakindsequence.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_util/os/__pycache__/utilosshell.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_util/text/utiltextidentifier.py /usr/lib/python3.11/site-packages/beartype/_data/kind/datakindtext.py /usr/lib/python3.11/site-packages/beartype/_check/forward/_fwdref.py /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/os/dataosshell.py /usr/lib/python3.11/site-packages/beartype/_util/os/utilosshell.py /usr/lib/python3.11/site-packages/beartype/_data/kind/datakinddict.py /usr/lib/python3.11/site-packages/beartype/_decor/decorcache.py /usr/lib/
 python3.11/site-packages/beartype/_data/kind/datakindsequence.py /usr/lib/python3.11/site-packages/beartype/_util/text/__pycache__/utiltextidentifier.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/os/__pycache__/dataosshell.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/fwdhint.py /usr/lib/python3.11/site-packages/beartype/_conf/_confget.py /usr/lib/python3.11/site-packages/beartype/_data/func/__pycache__/datafuncarg.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakindset.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decornontype.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakindtext.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/fwdtype.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_c
 heck/forward/__pycache__/fwdhint.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/datakindset.py /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/_fwdref.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/__init__.py /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/fwdscope.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/_decornontype.py /usr/lib/python3.11/site-packages/beartype/_check/forward/fwdscope.py /usr/lib/python3.11/site-packages/beartype/_data/os/__init__.py /usr/lib/python3.11/site-packages/beartype/_decor/_decortype.py /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decortype.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_util/text/__pycache__/utiltextversion.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/__init__.py /usr/lib/python3.11/site-packages/beartype/_util/cls/utilclsmake.py /usr/lib/python3.11/site-packages/
 beartype/_conf/__pycache__/_confget.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/fwdtype.py /usr/lib/python3.11/site-packages/beartype/_util/cls/__pycache__/utilclsmake.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/os/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/func/datafuncarg.py /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/decorcache.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakinddict.cpython-311.pyc"
Changes to packages/core2-32-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.11/site-packages/beartype-0.15.0.dist-info moved to /usr/lib/python3.11/site-packages/beartype-0.16.3.dist-info
  /usr/lib/python3.11/site-packages/beartype/_check/forward was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/fwdhint.py was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/_fwdref.py was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/fwdscope.py was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/fwdtype.py was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/fwdhint.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/_fwdref.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/fwdscope.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/fwdtype.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_conf/_confget.py was added
  /usr/lib/python3.11/site-packages/beartype/_conf/__pycache__/_confget.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/func/datafuncarg.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/func/__pycache__/datafuncarg.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/datakinddict.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/datakindsequence.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/datakindset.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/datakindtext.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakinddict.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakindsequence.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakindset.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakindtext.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/module was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/datamodcontextlib.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/datamodfunctools.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/datamodpy.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/datamodtyping.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/__pycache__/datamodcontextlib.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/__pycache__/datamodfunctools.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/__pycache__/datamodpy.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/__pycache__/datamodtyping.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/os was added
  /usr/lib/python3.11/site-packages/beartype/_data/os/dataosshell.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/os/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/os/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_data/os/__pycache__/dataosshell.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/os/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/decorcache.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/_decornontype.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/_decortype.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_errorcause.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/errormain.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_errortype.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_errorpep586.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_errorpep593.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484 was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585 was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585/_errorgeneric.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585/_errorsequence.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__/_errorgeneric.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__/_errorsequence.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484/_errornoreturn.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484/_errorunion.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__/_errornoreturn.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__/_errorunion.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/__pycache__/_errorpep586.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/__pycache__/_errorpep593.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/__pycache__/_errorcause.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/__pycache__/errormain.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/__pycache__/_errortype.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_util was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_util/errorutilcolor.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_util/errorutiltext.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_util/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_util/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_util/__pycache__/errorutilcolor.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_util/__pycache__/errorutiltext.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_util/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/decorcache.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decornontype.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decortype.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/wrap was added
  /usr/lib/python3.11/site-packages/beartype/_decor/wrap/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/wrap/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_decor/wrap/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/wrap/__pycache__/_wrapcode.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/wrap/__pycache__/wrapmain.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/wrap/__pycache__/wrapsnip.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/wrap/_wrapcode.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/wrap/wrapmain.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/wrap/wrapsnip.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/cls/__pycache__/utilclsmake.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/cls/utilclsmake.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/module was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/lib was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/lib/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/lib/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/lib/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/lib/__pycache__/utilsphinx.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/lib/__pycache__/utiltyping.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/lib/utilsphinx.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/lib/utiltyping.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/__pycache__/utilmoddeprecate.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/__pycache__/utilmodget.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/__pycache__/utilmodimport.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/__pycache__/utilmodtest.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/utilmoddeprecate.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/utilmodget.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/utilmodimport.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/utilmodtest.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/os/__pycache__/utilosshell.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/os/utilosshell.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/text/__pycache__/utiltextidentifier.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/text/__pycache__/utiltextversion.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/text/utiltextidentifier.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/text/utiltextversion.py was added
  /usr/lib/python3.11/site-packages/beartype/_conf/confcache.py was removed
  /usr/lib/python3.11/site-packages/beartype/_conf/__pycache__/confcache.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_data/datakind.py was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/datamodcontextlib.py was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/datamodfunctools.py was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/datamodpy.py was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/datamodtyping.py was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/__init__.py was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/__pycache__ was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/__pycache__/datamodcontextlib.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/__pycache__/datamodfunctools.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/__pycache__/datamodpy.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/__pycache__/datamodtyping.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_data/__pycache__/datakind.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_cache was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_cache/cachedecor.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_cache/cachetype.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__init__.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__pycache__ was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__pycache__/cachedecor.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__pycache__/cachetype.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_decormore.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_errorcause.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/errormain.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_errortype.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/__init__.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_errorpep586.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_errorpep593.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/__init__.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484 was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585 was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585/_errorgeneric.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585/_errorsequence.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585/__init__.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585/__pycache__ was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585/__pycache__/_errorgeneric.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585/__pycache__/_errorsequence.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484/_errornoreturn.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484/_errorunion.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484/__init__.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484/__pycache__ was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484/__pycache__/_errornoreturn.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484/__pycache__/_errorunion.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/__pycache__ was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/__pycache__/_errorpep586.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/__pycache__/_errorpep593.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/__pycache__ was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/__pycache__/_errorcause.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/__pycache__/errormain.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/__pycache__/_errortype.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util/errorutilcolor.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util/errorutiltext.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util/__init__.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util/__pycache__ was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util/__pycache__/errorutilcolor.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util/__pycache__/errorutiltext.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decormore.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_wrap was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/__init__.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/__pycache__ was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/__pycache__/_wrapcode.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/__pycache__/wrapmain.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/__pycache__/wrapsnip.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/_wrapcode.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/wrapmain.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/wrapsnip.py was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/__init__.py was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/lib was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/lib/__init__.py was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/lib/__pycache__ was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/lib/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/lib/__pycache__/utilsphinx.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/lib/__pycache__/utiltyping.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/lib/utilsphinx.py was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/lib/utiltyping.py was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/__pycache__ was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/__pycache__/utilmoddeprecate.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/__pycache__/utilmodget.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/__pycache__/utilmodimport.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/__pycache__/utilmodtest.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/utilmoddeprecate.py was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/utilmodget.py was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/utilmodimport.py was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/utilmodtest.py was removed
  /usr/lib/python3.11/site-packages/beartype/_util/text/__pycache__/utiltextident.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_util/text/utiltextident.py was removed

--===============5783066701076794032==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-beartype-upgrade-0.15.0-0.16.3.patch"

RnJvbSBmMzZiZjVlZTM5YWEwNzhiMjg0MDM4MzRlZjQ4ODIzY2I4ZmE1YTA4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTA6MTg6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWJlYXJ0eXBlOiB1cGdyYWRlIDAuMTUuMCAtPiAwLjE2LjMKCi0tLQogLi4uL3tweXRo
b24zLWJlYXJ0eXBlXzAuMTUuMC5iYiA9PiBweXRob24zLWJlYXJ0eXBlXzAuMTYuMy5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1iZWFydHlwZV8wLjE1LjAu
YmIgPT4gcHl0aG9uMy1iZWFydHlwZV8wLjE2LjMuYmJ9ICg3NSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJlYXJ0eXBlXzAuMTUuMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iZWFydHlwZV8wLjE2LjMuYmIKc2lt
aWxhcml0eSBpbmRleCA3NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWJlYXJ0eXBlXzAuMTUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWJlYXJ0eXBlXzAuMTYuMy5iYgppbmRleCAxNGVkYTFkZDdkLi5l
ODljYTNjODhlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtYmVhcnR5cGVfMC4xNS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1iZWFydHlwZV8wLjE2LjMuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0
dHBzOi8vYmVhcnR5cGUucmVhZHRoZWRvY3MuaW8iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWU0MGI1MmQ4ZWI1NTUzYWE4ZjcwNWNkZDNm
OTc5ZDY5IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmFmNmE4ZDhhNzI2N2NjZjdkMjcxZTFh
M2JkOTA4YWZiYzAyNWQyYTA5YWE1MTEyMzU2N2Q3ZDdiMzc0MzhkZiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIwODU1OTFiNWI3NzgwNzIyOWI2NWExMzdmZDQ3M2M2ODkxYzQ1Mjg3ZmUwY2E2NTY1
YjMyNTBkZWFkMDAzODBiIgogCiBpbmhlcml0IHNldHVwdG9vbHMzIHB5cGkKIAotLSAKMi4zOS4y
Cgo=

--===============5783066701076794032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-beartype: PKGV changed from 0.15.0 [default] to 0.16.3 [default]
packages/core2-32-poky-linux/python3-beartype: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.15.0.tar.gz;downloadfilename=beartype-0.15.0.tar.gz" to "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.16.3.tar.gz;downloadfilename=beartype-0.16.3.tar.gz"
packages/core2-32-poky-linux/python3-beartype: PV changed from "0.15.0" to "0.16.3"
packages/core2-32-poky-linux/python3-beartype/python3-beartype-dbg: PKGV changed from 0.15.0 [default] to 0.16.3 [default]
packages/core2-32-poky-linux/python3-beartype/python3-beartype-dbg: PV changed from "0.15.0" to "0.16.3"
packages/core2-32-poky-linux/python3-beartype/python3-beartype-dev: PKGV changed from 0.15.0 [default] to 0.16.3 [default]
packages/core2-32-poky-linux/python3-beartype/python3-beartype-dev: PV changed from "0.15.0" to "0.16.3"
packages/core2-32-poky-linux/python3-beartype/python3-beartype-doc: PKGV changed from 0.15.0 [default] to 0.16.3 [default]
packages/core2-32-poky-linux/python3-beartype/python3-beartype-doc: PV changed from "0.15.0" to "0.16.3"
packages/core2-32-poky-linux/python3-beartype/python3-beartype-locale: PKGV changed from 0.15.0 [default] to 0.16.3 [default]
packages/core2-32-poky-linux/python3-beartype/python3-beartype-locale: PV changed from "0.15.0" to "0.16.3"
packages/core2-32-poky-linux/python3-beartype/python3-beartype-src: PKGV changed from 0.15.0 [default] to 0.16.3 [default]
packages/core2-32-poky-linux/python3-beartype/python3-beartype-src: PV changed from "0.15.0" to "0.16.3"
packages/core2-32-poky-linux/python3-beartype/python3-beartype-staticdev: PKGV changed from 0.15.0 [default] to 0.16.3 [default]
packages/core2-32-poky-linux/python3-beartype/python3-beartype-staticdev: PV changed from "0.15.0" to "0.16.3"
packages/core2-32-poky-linux/python3-beartype/python3-beartype: PKGV changed from 0.15.0 [default] to 0.16.3 [default]
packages/core2-32-poky-linux/python3-beartype/python3-beartype: PKGSIZE changed from 4054723 to 4263052 (+5%)
packages/core2-32-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/error/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484 -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484, directory renamed /usr/lib/python3.11/site-packages/beartype/_util/mod -> /usr/lib/python3.11/site-packages/beartype/_util/module, directory renamed /usr/lib/python3.11/site-packages/beartype/_data/mod -> /usr/lib/python3.11/site-packages/beartype/_data/module, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error -> /usr/lib/python3.11/site-packages/beartype/_decor/error, directory renamed /usr/lib/python3.11/
 site-packages/beartype/_decor/_wrap/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/wrap/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_data/mod/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_data/module/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep, directory renamed /usr/lib/python3.11/site-packages/beartype-0.15.0.dist-info -> /usr/lib/python3.11/site-packages/beartype-0.16.3.dist-info, directory renamed /usr/lib/python3.11/site-packages/beartype/_util/mod/lib -> /usr/lib/python3.11/site-packages/beartype/_util/module/lib, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_wrap -> /usr/lib/python3.11/site-packages/b
 eartype/_decor/wrap, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585 -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_util, directory renamed /usr/lib/python3.11/site-packages/beartype/_util/mod/lib/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_util/module/lib/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_util/mod/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_util/module/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_util/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep48
 4585/__pycache__, removed "/usr/lib/python3.11/site-packages/beartype/_conf/confcache.py /usr/lib/python3.11/site-packages/beartype/_util/text/__pycache__/utiltextident.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/_cache/cachedecor.py /usr/lib/python3.11/site-packages/beartype/_util/text/utiltextident.py /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decormore.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_conf/__pycache__/confcache.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/_cache/cachetype.py /usr/lib/python3.11/site-packages/beartype/_data/__pycache__/datakind.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/datakind.py /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__init__.py /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__pycache__/cachetype.cpython-311.pyc /usr/lib/python3.11
 /site-packages/beartype/_decor/_decormore.py /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__pycache__/cachedecor.cpython-311.pyc", added "/usr/lib/python3.11/site-packages/beartype/_data/func/__pycache__/datafuncarg.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakindset.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/fwdhint.py /usr/lib/python3.11/site-packages/beartype/_conf/_confget.py /usr/lib/python3.11/site-packages/beartype/_data/kind/datakindsequence.py /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_util/text/__pycache__/utiltextidentifier.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/os/__pycache__/dataosshell.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/fwdhint.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/fwd
 type.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decornontype.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/datakindtext.py /usr/lib/python3.11/site-packages/beartype/_util/os/__pycache__/utilosshell.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_util/text/utiltextidentifier.py /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakindsequence.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_util/text/utiltextversion.py /usr/lib/python3.11/site-packages/beartype/_data/kind/datakinddict.py /usr/lib/python3.11/site-packages/beartype/_decor/decorcache.py /usr/lib/python3.11/site-packages/beartype/_data/os/dataosshell.py /usr/lib/python3.11/site-packages/beartype/_util/os/utilosshell.py /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/_fwdref.py /usr/lib/python3.11/site-packages/beartype/_ut
 il/cls/utilclsmake.py /usr/lib/python3.11/site-packages/beartype/_data/kind/__init__.py /usr/lib/python3.11/site-packages/beartype/_util/text/__pycache__/utiltextversion.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/decorcache.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakinddict.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakindtext.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/func/datafuncarg.py /usr/lib/python3.11/site-packages/beartype/_util/cls/__pycache__/utilclsmake.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/os/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/fwdtype.py /usr/lib/python3.11/site-packages/beartype/_conf/__pycache__/_confget.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/_decornontype.py /usr/lib/python3.11/site-packages/beartype/_check/forward/f
 wdscope.py /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/fwdscope.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/__init__.py /usr/lib/python3.11/site-packages/beartype/_data/kind/datakindset.py /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/_fwdref.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/_decortype.py /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decortype.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/os/__init__.py"
packages/core2-32-poky-linux/python3-beartype/python3-beartype: PV changed from "0.15.0" to "0.16.3"
Changes to packages/core2-32-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.11/site-packages/beartype-0.15.0.dist-info moved to /usr/lib/python3.11/site-packages/beartype-0.16.3.dist-info
  /usr/lib/python3.11/site-packages/beartype/_check/forward was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/fwdhint.py was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/_fwdref.py was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/fwdscope.py was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/fwdtype.py was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/fwdhint.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/_fwdref.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/fwdscope.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/fwdtype.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_conf/_confget.py was added
  /usr/lib/python3.11/site-packages/beartype/_conf/__pycache__/_confget.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/func/datafuncarg.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/func/__pycache__/datafuncarg.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/datakinddict.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/datakindsequence.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/datakindset.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/datakindtext.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakinddict.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakindsequence.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakindset.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakindtext.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/module was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/datamodcontextlib.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/datamodfunctools.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/datamodpy.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/datamodtyping.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/__pycache__/datamodcontextlib.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/__pycache__/datamodfunctools.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/__pycache__/datamodpy.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/__pycache__/datamodtyping.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/module/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/os was added
  /usr/lib/python3.11/site-packages/beartype/_data/os/dataosshell.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/os/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_data/os/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_data/os/__pycache__/dataosshell.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_data/os/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/decorcache.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/_decornontype.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/_decortype.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_errorcause.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/errormain.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_errortype.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_errorpep586.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_errorpep593.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484 was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585 was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585/_errorgeneric.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585/_errorsequence.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__/_errorgeneric.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__/_errorsequence.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484/_errornoreturn.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484/_errorunion.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__/_errornoreturn.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__/_errorunion.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/__pycache__/_errorpep586.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/__pycache__/_errorpep593.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/__pycache__/_errorcause.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/__pycache__/errormain.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/__pycache__/_errortype.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_util was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_util/errorutilcolor.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_util/errorutiltext.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_util/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_util/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_util/__pycache__/errorutilcolor.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_util/__pycache__/errorutiltext.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/error/_util/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/decorcache.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decornontype.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decortype.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/wrap was added
  /usr/lib/python3.11/site-packages/beartype/_decor/wrap/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/wrap/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_decor/wrap/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/wrap/__pycache__/_wrapcode.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/wrap/__pycache__/wrapmain.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/wrap/__pycache__/wrapsnip.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_decor/wrap/_wrapcode.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/wrap/wrapmain.py was added
  /usr/lib/python3.11/site-packages/beartype/_decor/wrap/wrapsnip.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/cls/__pycache__/utilclsmake.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/cls/utilclsmake.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/module was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/lib was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/lib/__init__.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/lib/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/lib/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/lib/__pycache__/utilsphinx.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/lib/__pycache__/utiltyping.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/lib/utilsphinx.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/lib/utiltyping.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/__pycache__ was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/__pycache__/utilmoddeprecate.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/__pycache__/utilmodget.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/__pycache__/utilmodimport.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/__pycache__/utilmodtest.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/utilmoddeprecate.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/utilmodget.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/utilmodimport.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/module/utilmodtest.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/os/__pycache__/utilosshell.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/os/utilosshell.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/text/__pycache__/utiltextidentifier.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/text/__pycache__/utiltextversion.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/beartype/_util/text/utiltextidentifier.py was added
  /usr/lib/python3.11/site-packages/beartype/_util/text/utiltextversion.py was added
  /usr/lib/python3.11/site-packages/beartype/_conf/confcache.py was removed
  /usr/lib/python3.11/site-packages/beartype/_conf/__pycache__/confcache.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_data/datakind.py was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/datamodcontextlib.py was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/datamodfunctools.py was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/datamodpy.py was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/datamodtyping.py was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/__init__.py was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/__pycache__ was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/__pycache__/datamodcontextlib.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/__pycache__/datamodfunctools.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/__pycache__/datamodpy.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/__pycache__/datamodtyping.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_data/mod/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_data/__pycache__/datakind.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_cache was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_cache/cachedecor.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_cache/cachetype.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__init__.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__pycache__ was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__pycache__/cachedecor.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__pycache__/cachetype.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_decormore.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_errorcause.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/errormain.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_errortype.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/__init__.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_errorpep586.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_errorpep593.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/__init__.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484 was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585 was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585/_errorgeneric.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585/_errorsequence.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585/__init__.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585/__pycache__ was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585/__pycache__/_errorgeneric.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585/__pycache__/_errorsequence.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484/_errornoreturn.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484/_errorunion.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484/__init__.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484/__pycache__ was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484/__pycache__/_errornoreturn.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484/__pycache__/_errorunion.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/__pycache__ was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/__pycache__/_errorpep586.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/__pycache__/_errorpep593.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/__pycache__ was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/__pycache__/_errorcause.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/__pycache__/errormain.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/__pycache__/_errortype.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util/errorutilcolor.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util/errorutiltext.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util/__init__.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util/__pycache__ was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util/__pycache__/errorutilcolor.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util/__pycache__/errorutiltext.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/_decormore.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_wrap was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/__init__.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/__pycache__ was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/__pycache__/_wrapcode.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/__pycache__/wrapmain.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/__pycache__/wrapsnip.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/_wrapcode.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/wrapmain.py was removed
  /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/wrapsnip.py was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/__init__.py was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/lib was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/lib/__init__.py was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/lib/__pycache__ was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/lib/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/lib/__pycache__/utilsphinx.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/lib/__pycache__/utiltyping.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/lib/utilsphinx.py was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/lib/utiltyping.py was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/__pycache__ was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/__pycache__/utilmoddeprecate.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/__pycache__/utilmodget.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/__pycache__/utilmodimport.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/__pycache__/utilmodtest.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/utilmoddeprecate.py was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/utilmodget.py was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/utilmodimport.py was removed
  /usr/lib/python3.11/site-packages/beartype/_util/mod/utilmodtest.py was removed
  /usr/lib/python3.11/site-packages/beartype/_util/text/__pycache__/utiltextident.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/beartype/_util/text/utiltextident.py was removed

--===============5783066701076794032==--

