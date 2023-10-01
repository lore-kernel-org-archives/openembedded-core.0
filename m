Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A95A1E776CF
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:18 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.65024.1696183991164769806
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=P7ivcEwB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nGXsQ9XB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018aec71b779-f16fe094-f5c2-4883-a68f-b4cb87a792bd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Rs8fRdFmXTGw2Qv+XZGH5nO3TgjQWhcRlDLQyfycb+c=;
	b=P7ivcEwBFBlGF1b3XJgPmyGC17l+xtK2uaeYHBRCyKyui0dEtRb9dzNX+lrTPvYa
	ZSO9t3vr/NrZ6xobaolhjL/n9JullR9nBB+kStAoByWoDybZFJ5s/FEDeCKZZlhSHJW
	1/Xb+JuAI4vvIABLH7xnID9XIKq8t1H3vs70calk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Rs8fRdFmXTGw2Qv+XZGH5nO3TgjQWhcRlDLQyfycb+c=;
	b=nGXsQ9XBM+enGBUkXFwSIQ62JQsaTxoc+20h3uWur6pAn8X+jO+Pd+5Qm789/wBM
	cdFTBGYeg6Zurtj1etIFVh6WcdNCT22FZrgp4TBRb/n5Mwtwa1XpJBZCnngOWSmTfse
	ukaq9GEn1tCdEgiN3+0y04usLJdjyaV8BIhkcSlo=
Content-Type: multipart/mixed; boundary="===============7967485122255654663=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <mrybczynska@syslinbit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-beartype: upgrading to 0.16.2 SUCCEEDED
Message-ID: <0101018aec71b779-f16fe094-f5c2-4883-a68f-b4cb87a792bd-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188543

--===============7967485122255654663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-beartype* to *0.16.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-beartype-upgrade-0.15.0-0.16.2.patch
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
From 469263ce2a6f2371c4aa974cdc6a71e31eca76a5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 09:04:30 +0000
Subject: [PATCH] python3-beartype: upgrade 0.15.0 -> 0.16.2

---
 .../{python3-beartype_0.15.0.bb => python3-beartype_0.16.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.15.0.bb => python3-beartype_0.16.2.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.15.0.bb b/meta/recipes-devtools/python/python3-beartype_0.16.2.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-beartype_0.15.0.bb
rename to meta/recipes-devtools/python/python3-beartype_0.16.2.bb
index 14eda1dd7d..20a5b92c61 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.15.0.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.16.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://beartype.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e40b52d8eb5553aa8f705cdd3f979d69"
 
-SRC_URI[sha256sum] = "2af6a8d8a7267ccf7d271e1a3bd908afbc025d2a09aa51123567d7d7b37438df"
+SRC_URI[sha256sum] = "47ec1c8c3be3f999f4f9f829e8913f65926aa7e85b180d9ffd305dc78d3e7d7b"
 
 inherit setuptools3 pypi
 
-- 
2.39.2


--===============7967485122255654663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-beartype: PV changed from "0.15.0" to "0.16.2"
packages/core2-32-poky-linux/python3-beartype: PKGV changed from 0.15.0 [default] to 0.16.2 [default]
packages/core2-32-poky-linux/python3-beartype: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.15.0.tar.gz;downloadfilename=beartype-0.15.0.tar.gz" to "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.16.2.tar.gz;downloadfilename=beartype-0.16.2.tar.gz"
packages/core2-32-poky-linux/python3-beartype/python3-beartype-dbg: PV changed from "0.15.0" to "0.16.2"
packages/core2-32-poky-linux/python3-beartype/python3-beartype-dbg: PKGV changed from 0.15.0 [default] to 0.16.2 [default]
packages/core2-32-poky-linux/python3-beartype/python3-beartype-dev: PV changed from "0.15.0" to "0.16.2"
packages/core2-32-poky-linux/python3-beartype/python3-beartype-dev: PKGV changed from 0.15.0 [default] to 0.16.2 [default]
packages/core2-32-poky-linux/python3-beartype/python3-beartype-doc: PV changed from "0.15.0" to "0.16.2"
packages/core2-32-poky-linux/python3-beartype/python3-beartype-doc: PKGV changed from 0.15.0 [default] to 0.16.2 [default]
packages/core2-32-poky-linux/python3-beartype/python3-beartype-locale: PV changed from "0.15.0" to "0.16.2"
packages/core2-32-poky-linux/python3-beartype/python3-beartype-locale: PKGV changed from 0.15.0 [default] to 0.16.2 [default]
packages/core2-32-poky-linux/python3-beartype/python3-beartype-src: PV changed from "0.15.0" to "0.16.2"
packages/core2-32-poky-linux/python3-beartype/python3-beartype-src: PKGV changed from 0.15.0 [default] to 0.16.2 [default]
packages/core2-32-poky-linux/python3-beartype/python3-beartype-staticdev: PV changed from "0.15.0" to "0.16.2"
packages/core2-32-poky-linux/python3-beartype/python3-beartype-staticdev: PKGV changed from 0.15.0 [default] to 0.16.2 [default]
packages/core2-32-poky-linux/python3-beartype/python3-beartype: PV changed from "0.15.0" to "0.16.2"
packages/core2-32-poky-linux/python3-beartype/python3-beartype: PKGSIZE changed from 4054723 to 4238284 (+5%)
packages/core2-32-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/error/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_data/mod/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_data/module/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_util/mod/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_util/module/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep, directory renamed /usr/lib/python3.11/site-packages/beartype/_data/mod -> /usr/lib/python3.11/site-packages/beartype/_data/module, directory renamed /usr/lib/python3.11/site-packages/beartype/_util/mod -> /usr/lib/python3.11/site-packages/beartype/_util/module, directory renamed /usr/lib/python3.11/site-packa
 ges/beartype/_decor/_wrap -> /usr/lib/python3.11/site-packages/beartype/_decor/wrap, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_util/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484 -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/wrap/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype-0.15.0.dist-info -> /usr/lib/python3.11/site-packages/beartype-0.16.2.dist-info, directory renamed /usr/lib/python3.11/site-packages/beartype/_util/mod/lib -> /usr/lib/python3.11/site-packages/beartype/_util/module/lib, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_u
 til, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error -> /usr/lib/python3.11/site-packages/beartype/_decor/error, directory renamed /usr/lib/python3.11/site-packages/beartype/_util/mod/lib/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_util/module/lib/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585 -> /usr/lib/python3.11/site-packages/beartype/_decor/error
 /_pep/_pep484585, removed "/usr/lib/python3.11/site-packages/beartype/_decor/_cache/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/datakind.py /usr/lib/python3.11/site-packages/beartype/_util/text/utiltextident.py /usr/lib/python3.11/site-packages/beartype/_conf/__pycache__/confcache.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_util/text/__pycache__/utiltextident.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/__pycache__/datakind.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/_cache/cachedecor.py /usr/lib/python3.11/site-packages/beartype/_decor/_cache/cachetype.py /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__pycache__/cachetype.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__init__.py /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__pycache__/cachedecor.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_conf/confcache.py", added "/us
 r/lib/python3.11/site-packages/beartype/_data/kind/datakindtext.py /usr/lib/python3.11/site-packages/beartype/_util/cls/utilclsmake.py /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/decorcache.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakindset.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/func/__pycache__/datafuncarg.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/fwdhint.py /usr/lib/python3.11/site-packages/beartype/_data/kind/__init__.py /usr/lib/python3.11/site-packages/beartype/_util/text/__pycache__/utiltextidentifier.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/fwdscope.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_util/text/utiltextversion.py /usr/lib/python3.11/site-packages/beartype/_data/os/dataosshell.py /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakindsequence.cpython-311.pyc /usr/lib/python
 3.11/site-packages/beartype/_util/os/utilosshell.py /usr/lib/python3.11/site-packages/beartype/_util/text/__pycache__/utiltextversion.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/os/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/_fwdref.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_util/os/__pycache__/utilosshell.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/__init__.py /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/datakindsequence.py /usr/lib/python3.11/site-packages/beartype/_util/text/utiltextidentifier.py /usr/lib/python3.11/site-packages/beartype/_data/os/__init__.py /usr/lib/python3.11/site-packages/beartype/_conf/__pycache__/_confget.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/fwdscope.py /usr/lib/python3.11/site-packages/beartyp
 e/_data/kind/datakinddict.py /usr/lib/python3.11/site-packages/beartype/_conf/_confget.py /usr/lib/python3.11/site-packages/beartype/_data/func/datafuncarg.py /usr/lib/python3.11/site-packages/beartype/_data/kind/datakindset.py /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/fwdtype.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/fwdtype.py /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/fwdhint.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_util/cls/__pycache__/utilclsmake.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakinddict.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakindtext.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/os/__pycache__/dataosshell.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype
 /_decor/decorcache.py /usr/lib/python3.11/site-packages/beartype/_check/forward/_fwdref.py"
packages/core2-32-poky-linux/python3-beartype/python3-beartype: PKGV changed from 0.15.0 [default] to 0.16.2 [default]
Changes to packages/core2-32-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.11/site-packages/beartype-0.15.0.dist-info moved to /usr/lib/python3.11/site-packages/beartype-0.16.2.dist-info
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

--===============7967485122255654663==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-beartype-upgrade-0.15.0-0.16.2.patch"

RnJvbSA0NjkyNjNjZTJhNmYyMzcxYzRhYTk3NGNkYzZhNzFlMzFlY2E3NmE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAwOTowNDozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYmVhcnR5cGU6IHVwZ3JhZGUgMC4xNS4wIC0+IDAuMTYuMgoKLS0tCiAuLi4ve3B5dGhv
bjMtYmVhcnR5cGVfMC4xNS4wLmJiID0+IHB5dGhvbjMtYmVhcnR5cGVfMC4xNi4yLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWJlYXJ0eXBlXzAuMTUuMC5i
YiA9PiBweXRob24zLWJlYXJ0eXBlXzAuMTYuMi5iYn0gKDc1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmVhcnR5cGVfMC4xNS4wLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJlYXJ0eXBlXzAuMTYuMi5iYgpzaW1p
bGFyaXR5IGluZGV4IDc1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtYmVhcnR5cGVfMC4xNS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtYmVhcnR5cGVfMC4xNi4yLmJiCmluZGV4IDE0ZWRhMWRkN2QuLjIw
YTViOTJjNjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1iZWFydHlwZV8wLjE1LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWJlYXJ0eXBlXzAuMTYuMi5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0
cHM6Ly9iZWFydHlwZS5yZWFkdGhlZG9jcy5pbyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZTQwYjUyZDhlYjU1NTNhYThmNzA1Y2RkM2Y5
NzlkNjkiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyYWY2YThkOGE3MjY3Y2NmN2QyNzFlMWEz
YmQ5MDhhZmJjMDI1ZDJhMDlhYTUxMTIzNTY3ZDdkN2IzNzQzOGRmIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjQ3ZWMxYzhjM2JlM2Y5OTlmNGY5ZjgyOWU4OTEzZjY1OTI2YWE3ZTg1YjE4MGQ5ZmZk
MzA1ZGM3OGQzZTdkN2IiCiAKIGluaGVyaXQgc2V0dXB0b29sczMgcHlwaQogCi0tIAoyLjM5LjIK
Cg==

--===============7967485122255654663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_wrap/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/wrap/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484585/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype-0.15.0.dist-info -> /usr/lib/python3.11/site-packages/beartype-0.16.2.dist-info, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_wrap -> /usr/lib/python3.11/site-packages/beartype/_decor/wrap, directory renamed /usr/lib/python3.11/site-packages/beartype/_util/mod/lib/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_util/module/lib/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484585 -> /usr/lib/python3.11/site-packages/beartype/_
 decor/error/_pep/_pep484585, directory renamed /usr/lib/python3.11/site-packages/beartype/_data/mod -> /usr/lib/python3.11/site-packages/beartype/_data/module, directory renamed /usr/lib/python3.11/site-packages/beartype/_util/mod -> /usr/lib/python3.11/site-packages/beartype/_util/module, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_util/mod/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_util/module/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_data/mod/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_data/module/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep, directory renamed /usr/lib/python3.11/site-packages/beartype/_deco
 r/_error/_util/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_util/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_util -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_util, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/_pep484 -> /usr/lib/python3.11/site-packages/beartype/_decor/error/_pep/_pep484, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/error/__pycache__, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error -> /usr/lib/python3.11/site-packages/beartype/_decor/error, directory renamed /usr/lib/python3.11/site-packages/beartype/_util/mod/lib -> /usr/lib/python3.11/site-packages/beartype/_util/module/lib, directory renamed /usr/lib/python3.11/site-packages/beartype/_decor/_error/_pep/__pycache__ -> /usr/lib/python3.11/site-packages/beartype/_decor/error/
 _pep/__pycache__, removed "/usr/lib/python3.11/site-packages/beartype/_decor/_cache/__pycache__/cachedecor.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_util/text/utiltextident.py /usr/lib/python3.11/site-packages/beartype/_data/__pycache__/datakind.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_conf/confcache.py /usr/lib/python3.11/site-packages/beartype/_util/text/__pycache__/utiltextident.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/_cache/cachetype.py /usr/lib/python3.11/site-packages/beartype/_data/datakind.py /usr/lib/python3.11/site-packages/beartype/_conf/__pycache__/confcache.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__pycache__/cachetype.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/_cache/cachedecor.py /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/_cache/__init__.py", added "/us
 r/lib/python3.11/site-packages/beartype/_data/os/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/datakinddict.py /usr/lib/python3.11/site-packages/beartype/_data/func/datafuncarg.py /usr/lib/python3.11/site-packages/beartype/_conf/__pycache__/_confget.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakindsequence.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/fwdscope.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/os/__pycache__/dataosshell.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/fwdtype.py /usr/lib/python3.11/site-packages/beartype/_util/cls/utilclsmake.py /usr/lib/python3.11/site-packages/beartype/_data/os/dataosshell.py /usr/lib/python3.11/site-packages/beartype/_check/forward/fwdhint.py /usr/lib/python3.11/site-packages/beartype/_util/os/utilosshell.py /usr/lib/python3.11/site-packages/beartype/_check/forward/__
 pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/os/__init__.py /usr/lib/python3.11/site-packages/beartype/_check/forward/fwdscope.py /usr/lib/python3.11/site-packages/beartype/_util/text/__pycache__/utiltextidentifier.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_decor/__pycache__/decorcache.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/_fwdref.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/fwdtype.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_check/forward/__pycache__/fwdhint.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/datakindtext.py /usr/lib/python3.11/site-packages/beartype/_decor/decorcache.py /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/__init__.py /usr/lib/python3.11/site-packages/beartype/_check/forward/__init_
 _.py /usr/lib/python3.11/site-packages/beartype/_conf/_confget.py /usr/lib/python3.11/site-packages/beartype/_check/forward/_fwdref.py /usr/lib/python3.11/site-packages/beartype/_data/func/__pycache__/datafuncarg.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakindset.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_util/text/utiltextversion.py /usr/lib/python3.11/site-packages/beartype/_util/cls/__pycache__/utilclsmake.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_util/text/utiltextidentifier.py /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakinddict.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/__pycache__/datakindtext.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/datakindsequence.py /usr/lib/python3.11/site-packages/beartype/_util/os/__pycache__/utilosshell.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_util/text/__pycache__/utiltextve
 rsion.cpython-311.pyc /usr/lib/python3.11/site-packages/beartype/_data/kind/datakindset.py"
Changes to packages/core2-32-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.11/site-packages/beartype-0.15.0.dist-info moved to /usr/lib/python3.11/site-packages/beartype-0.16.2.dist-info
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

--===============7967485122255654663==--

