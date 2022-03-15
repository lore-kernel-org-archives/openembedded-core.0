Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE51FC352A1
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:56 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.10590.1647349735266818380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SER8AFQt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 0101017f8db21cac-05b22c34-e143-4ffe-8d78-e85531500a44-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4vUFh4WB84iGsp+ZNwViAnwcbOo45TwD4u3SeCufM7M=;
	b=SER8AFQtWzUYGr89hnie2UrcU/4RAqWrRfPu8I6RomlE8tHiKGJA0KMjp/FVgZrZ
	QgFIgfcTGZQyheP4dwLLgAMFJ4MVt2BnzM4zb2euJ11PnfunyYIDmL8S9nILc8sogr1
	kinqAdeUywuPNNiEuzPBe5RC8/Y2zk85rIMPvpUg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4vUFh4WB84iGsp+ZNwViAnwcbOo45TwD4u3SeCufM7M=;
	b=KzCNh6gMsd37yMETooZhPTArSngiaqDJsfBLdeFB73a1x5Ah3/aKVyqXXKZ2DjEV
	GVvRLhr5LMTCCXoMfgxl66hlvqTjv9+i7Em1ri7n+BdiZaeWJCR3ypaRfjYk8FVCsBx
	oHx6+fEcG0iBHs58R4EApIK8K8ngl4u1Aq9G3IYk=
Content-Type: multipart/mixed; boundary="===============0926818803359959800=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 60.9.3 SUCCEEDED
Message-ID: 
 <0101017f8db21cac-05b22c34-e143-4ffe-8d78-e85531500a44-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:54 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163262

--===============0926818803359959800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *60.9.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-59.5.0-60.9.3.patch
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
--===============0926818803359959800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: PV changed from "59.5.0" to "60.9.3"
packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 59.5.0 [default] to 60.9.3 [default]
packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-59.5.0.tar.gz file://0001-change-shebang-to-python3.patch file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-60.9.3.tar.gz file://0001-change-shebang-to-python3.patch file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "59.5.0" to "60.9.3"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 59.5.0 [default] to 60.9.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: FILELIST: removed "/usr/lib/python3.10/site-packages/pkg_resources/tests/data/my-test-package-source/setup.py /usr/lib/python3.10/site-packages/pkg_resources/tests/data/my-test-package-source/__pycache__/setup.cpython-310.pyc", added "/usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_compat.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_common.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/readers.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/__init__.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/zipp.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/__pycache__/functools.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/text/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-pac
 kages/pkg_resources/_vendor/importlib_resources/__pycache__/_compat.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/more.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__init__.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/__pycache__/zipp.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_itertools.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/__init__.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_adapters.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/simple.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/abc.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resou
 rces/_itertools.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_legacy.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/readers.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/__pycache__/context.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/functools.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/more.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/simple.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/recipes.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/text/__init__.py /usr/lib/python3.10/site-packages/pkg_resour
 ces/_vendor/importlib_resources/__pycache__/abc.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/context.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/recipes.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_adapters.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_legacy.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_common.py"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGSIZE changed from 867940 to 1313766 (+51%)
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "59.5.0" to "60.9.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 59.5.0 [default] to 60.9.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "59.5.0" to "60.9.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 59.5.0 [default] to 60.9.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "59.5.0" to "60.9.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 59.5.0 [default] to 60.9.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "59.5.0" to "60.9.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 59.5.0 [default] to 60.9.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "59.5.0" to "60.9.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 59.5.0 [default] to 60.9.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "59.5.0" to "60.9.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 59.5.0 [default] to 60.9.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "59.5.0" to "60.9.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 59.5.0 [default] to 60.9.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.10/site-packages/setuptools-59.5.0.dist-info -> /usr/lib/python3.10/site-packages/setuptools-60.9.3.dist-info, added "/usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_functools.py /usr/lib/python3.10/site-packages/setuptools/_path.py /usr/lib/python3.10/site-packages/setuptools/_itertools.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_common.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_itertools.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_collections.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_adapters.py /usr/lib/python3.10/site-packages/setuptools/logging.py /usr/lib/python3.10/site-packages/setuptools/__pycache__/_itertools.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/__pyca
 che__/zipp.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_compat.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/__pycache__/context.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_common.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_functools.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_itertools.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_itertools.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/text/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_itertools.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_compat.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/read
 ers.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_text.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__init__.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_adapters.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_legacy.py /usr/lib/python3.10/site-packages/setuptools/__pycache__/_path.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_adapters.py /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/context.py /usr/lib/python3.10/site-packages/setuptools/__pycache__/_entry_points.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/zipp.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__init__.py /usr/lib/python3.10/site-pa
 ckages/setuptools/_vendor/jaraco/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/__pycache__/typing_extensions.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/abc.py /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/__init__.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_text.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_collections.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/simple.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/text/__init__.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_meta.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/readers.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/simple.py
  /usr/lib/python3.10/site-packages/setuptools/_distutils/_collections.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_legacy.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_reqs.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_compat.py /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/__pycache__/functools.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_importlib.py /usr/lib/python3.10/site-packages/setuptools/_distutils/__pycache__/_collections.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_meta.py /usr/lib/python3.10/site-packages/setuptools/_vendor/typing_extensions.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_adapters.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/__p
 ycache__/_importlib.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/functools.py /usr/lib/python3.10/site-packages/setuptools/__pycache__/logging.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_entry_points.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_compat.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/abc.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/__pycache__/_reqs.cpython-310.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 3577184 to 4008026 (+12%)
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-59.5.0.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-60.9.3.dist-info
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/abc.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_adapters.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_common.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_compat.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__init__.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_itertools.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_legacy.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__ was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/abc.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_adapters.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_common.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_compat.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_itertools.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_legacy.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/readers.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/simple.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/readers.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/simple.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/context.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/functools.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/__init__.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/__pycache__ was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/__pycache__/context.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/__pycache__/functools.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/text was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/text/__init__.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/text/__pycache__ was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/text/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/__init__.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/more.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/__pycache__ was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/more.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/recipes.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/recipes.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/__pycache__/zipp.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/zipp.py was added
  /usr/lib/python3.10/site-packages/setuptools/_distutils/_collections.py was added
  /usr/lib/python3.10/site-packages/setuptools/_distutils/__pycache__/_collections.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_entry_points.py was added
  /usr/lib/python3.10/site-packages/setuptools/_importlib.py was added
  /usr/lib/python3.10/site-packages/setuptools/_itertools.py was added
  /usr/lib/python3.10/site-packages/setuptools/logging.py was added
  /usr/lib/python3.10/site-packages/setuptools/_path.py was added
  /usr/lib/python3.10/site-packages/setuptools/__pycache__/_entry_points.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/__pycache__/_importlib.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/__pycache__/_itertools.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/__pycache__/logging.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/__pycache__/_path.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/__pycache__/_reqs.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_reqs.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_adapters.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_collections.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_compat.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_functools.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__init__.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_itertools.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_meta.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__ was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_adapters.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_collections.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_compat.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_functools.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_itertools.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_meta.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_text.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_text.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/abc.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_adapters.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_common.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_compat.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__init__.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_itertools.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_legacy.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__ was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/abc.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_adapters.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_common.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_compat.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_itertools.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_legacy.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/readers.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/simple.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/readers.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/simple.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/context.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/functools.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/__init__.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/__pycache__ was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/__pycache__/context.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/__pycache__/functools.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/text was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/text/__init__.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/text/__pycache__ was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/text/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/__pycache__/typing_extensions.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/__pycache__/zipp.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/typing_extensions.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/zipp.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/tests was removed
  /usr/lib/python3.10/site-packages/pkg_resources/tests/data was removed
  /usr/lib/python3.10/site-packages/pkg_resources/tests/data/my-test-package-source was removed
  /usr/lib/python3.10/site-packages/pkg_resources/tests/data/my-test-package-source/__pycache__ was removed
  /usr/lib/python3.10/site-packages/pkg_resources/tests/data/my-test-package-source/__pycache__/setup.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/pkg_resources/tests/data/my-test-package-source/setup.py was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-59.5.0.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-60.9.3.dist-info
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/abc.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_adapters.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_common.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_compat.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__init__.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_itertools.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_legacy.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/readers.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/simple.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/context.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/functools.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/__init__.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/text was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/text/__init__.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/__init__.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/more.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/recipes.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/zipp.py was added
  /usr/lib/python3.10/site-packages/setuptools/_distutils/_collections.py was added
  /usr/lib/python3.10/site-packages/setuptools/_entry_points.py was added
  /usr/lib/python3.10/site-packages/setuptools/_importlib.py was added
  /usr/lib/python3.10/site-packages/setuptools/_itertools.py was added
  /usr/lib/python3.10/site-packages/setuptools/logging.py was added
  /usr/lib/python3.10/site-packages/setuptools/_path.py was added
  /usr/lib/python3.10/site-packages/setuptools/_reqs.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_adapters.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_collections.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_compat.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_functools.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__init__.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_itertools.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_meta.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_text.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/abc.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_adapters.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_common.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_compat.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__init__.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_itertools.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_legacy.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/readers.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/simple.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/context.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/functools.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/__init__.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/text was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/text/__init__.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/typing_extensions.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/zipp.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/tests was removed
  /usr/lib/python3.10/site-packages/pkg_resources/tests/data was removed
  /usr/lib/python3.10/site-packages/pkg_resources/tests/data/my-test-package-source was removed
  /usr/lib/python3.10/site-packages/pkg_resources/tests/data/my-test-package-source/setup.py was removed

--===============0926818803359959800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: FILELIST: removed "/usr/lib/python3.10/site-packages/pkg_resources/tests/data/my-test-package-source/setup.py /usr/lib/python3.10/site-packages/pkg_resources/tests/data/my-test-package-source/__pycache__/setup.cpython-310.pyc", added "/usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/__pycache__/functools.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/functools.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_itertools.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_legacy.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/abc.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.
 10/site-packages/pkg_resources/_vendor/__pycache__/zipp.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/recipes.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/zipp.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/simple.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_common.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/__init__.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/text/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/text/__init__.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/context.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_adapters.py 
 /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_adapters.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_itertools.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/readers.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_common.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/simple.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/__init__.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_compat.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/abc.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/recipes.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/readers.py /usr/lib/python3.10/site-packages/pk
 g_resources/_vendor/jaraco/__pycache__/context.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__init__.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_compat.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/more.py /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/more.cpython-310.pyc /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_legacy.py"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGSIZE changed from 867940 to 1313766 (+51%)
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.10/site-packages/setuptools-59.5.0.dist-info -> /usr/lib/python3.10/site-packages/setuptools-60.9.3.dist-info, added "/usr/lib/python3.10/site-packages/setuptools/_vendor/__pycache__/typing_extensions.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_itertools.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/__pycache__/logging.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_legacy.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_compat.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_importlib.py /usr/lib/python3.10/site-packages/setuptools/_vendor/typing_extensions.py /usr/lib/python3.10/site-packages/setupto
 ols/logging.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/readers.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_adapters.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_adapters.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_functools.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_itertools.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_entry_points.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_itertools.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/simple.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__init__.py /usr/lib/python3.10/site-packages/setuptools/_path.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_compat.py /usr/lib/python3.10/site-
 packages/setuptools/_vendor/zipp.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_meta.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/__pycache__/_path.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_common.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/abc.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_functools.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/abc.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/readers.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/__pycache__/context.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/__pycache__/functools.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_compat.py /usr/lib/p
 ython3.10/site-packages/setuptools/_vendor/importlib_metadata/__init__.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_legacy.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_itertools.py /usr/lib/python3.10/site-packages/setuptools/__pycache__/_entry_points.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/__pycache__/zipp.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/__pycache__/_itertools.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_text.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_adapters.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/simple.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_reqs.py /usr/lib/python3.10/site-packages/setuptools/_vendor/import
 lib_metadata/_collections.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_text.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/context.py /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_meta.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_common.py /usr/lib/python3.10/site-packages/setuptools/__pycache__/_reqs.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/functools.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_collections.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/__init__.py /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_itertools.py /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/text/__init__.py /usr/lib/python3.10/site-pack
 ages/setuptools/_distutils/_collections.py /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/text/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_adapters.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/__pycache__/_importlib.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_distutils/__pycache__/_collections.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_compat.cpython-310.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 3577184 to 4008026 (+12%)
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-59.5.0.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-60.9.3.dist-info
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/abc.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_adapters.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_common.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_compat.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__init__.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_itertools.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_legacy.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__ was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/abc.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_adapters.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_common.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_compat.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_itertools.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_legacy.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/readers.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/simple.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/readers.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/simple.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/context.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/functools.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/__init__.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/__pycache__ was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/__pycache__/context.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/__pycache__/functools.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/text was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/text/__init__.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/text/__pycache__ was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/text/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/__init__.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/more.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/__pycache__ was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/more.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/recipes.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/recipes.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/__pycache__/zipp.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/zipp.py was added
  /usr/lib/python3.10/site-packages/setuptools/_distutils/_collections.py was added
  /usr/lib/python3.10/site-packages/setuptools/_distutils/__pycache__/_collections.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_entry_points.py was added
  /usr/lib/python3.10/site-packages/setuptools/_importlib.py was added
  /usr/lib/python3.10/site-packages/setuptools/_itertools.py was added
  /usr/lib/python3.10/site-packages/setuptools/logging.py was added
  /usr/lib/python3.10/site-packages/setuptools/_path.py was added
  /usr/lib/python3.10/site-packages/setuptools/__pycache__/_entry_points.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/__pycache__/_importlib.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/__pycache__/_itertools.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/__pycache__/logging.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/__pycache__/_path.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/__pycache__/_reqs.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_reqs.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_adapters.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_collections.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_compat.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_functools.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__init__.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_itertools.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_meta.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__ was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_adapters.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_collections.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_compat.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_functools.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_itertools.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_meta.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_text.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_text.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/abc.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_adapters.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_common.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_compat.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__init__.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_itertools.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_legacy.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__ was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/abc.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_adapters.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_common.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_compat.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_itertools.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_legacy.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/readers.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__pycache__/simple.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/readers.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/simple.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/context.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/functools.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/__init__.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/__pycache__ was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/__pycache__/context.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/__pycache__/functools.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/text was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/text/__init__.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/text/__pycache__ was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/text/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/__pycache__/typing_extensions.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/__pycache__/zipp.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/typing_extensions.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/zipp.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/tests was removed
  /usr/lib/python3.10/site-packages/pkg_resources/tests/data was removed
  /usr/lib/python3.10/site-packages/pkg_resources/tests/data/my-test-package-source was removed
  /usr/lib/python3.10/site-packages/pkg_resources/tests/data/my-test-package-source/__pycache__ was removed
  /usr/lib/python3.10/site-packages/pkg_resources/tests/data/my-test-package-source/__pycache__/setup.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/pkg_resources/tests/data/my-test-package-source/setup.py was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-59.5.0.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-60.9.3.dist-info
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/abc.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_adapters.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_common.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_compat.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/__init__.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_itertools.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/_legacy.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/readers.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/importlib_resources/simple.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/context.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/functools.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/__init__.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/text was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/jaraco/text/__init__.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/__init__.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/more.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/more_itertools/recipes.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/_vendor/zipp.py was added
  /usr/lib/python3.10/site-packages/setuptools/_distutils/_collections.py was added
  /usr/lib/python3.10/site-packages/setuptools/_entry_points.py was added
  /usr/lib/python3.10/site-packages/setuptools/_importlib.py was added
  /usr/lib/python3.10/site-packages/setuptools/_itertools.py was added
  /usr/lib/python3.10/site-packages/setuptools/logging.py was added
  /usr/lib/python3.10/site-packages/setuptools/_path.py was added
  /usr/lib/python3.10/site-packages/setuptools/_reqs.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_adapters.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_collections.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_compat.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_functools.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/__init__.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_itertools.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_meta.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_metadata/_text.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/abc.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_adapters.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_common.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_compat.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/__init__.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_itertools.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/_legacy.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/readers.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/importlib_resources/simple.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/context.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/functools.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/__init__.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/text was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/jaraco/text/__init__.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/typing_extensions.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/zipp.py was added
  /usr/lib/python3.10/site-packages/pkg_resources/tests was removed
  /usr/lib/python3.10/site-packages/pkg_resources/tests/data was removed
  /usr/lib/python3.10/site-packages/pkg_resources/tests/data/my-test-package-source was removed
  /usr/lib/python3.10/site-packages/pkg_resources/tests/data/my-test-package-source/setup.py was removed

--===============0926818803359959800==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-59.5.0-60.9.3.patch"

From d66184eb77d99454144e38472728160bd4a457e1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Mar 2022 08:23:10 +0000
Subject: [PATCH] python3-setuptools: upgrade 59.5.0 -> 60.9.3

---
 ...01-conditionally-do-not-fetch-code-by-easy_install.patch | 6 +++---
 ...n3-setuptools_59.5.0.bb => python3-setuptools_60.9.3.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_59.5.0.bb => python3-setuptools_60.9.3.bb} (95%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 5e2ee454da..eb22c4b811 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From da88c57fe03e4474ba20325edacf519e80c1d7a8 Mon Sep 17 00:00:00 2001
+From a6af8780afa837c7b3a20bfa9e6a1b06b68b06d2 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index fc848d0..c04a5de 100644
+index 5b73e6e..7e87f05 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
-@@ -642,6 +642,11 @@ class easy_install(Command):
+@@ -658,6 +658,11 @@ class easy_install(Command):
              os.path.exists(tmpdir) and rmtree(tmpdir)
  
      def easy_install(self, spec, deps=False):
diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_60.9.3.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_60.9.3.bb
index d93972b9a0..c9573d27f4 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_60.9.3.bb
@@ -13,7 +13,7 @@ SRC_URI += "\
     file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch \
 "
 
-SRC_URI[sha256sum] = "d144f85102f999444d06f9c0e8c737fd0194f10f2f7e5fdb77573f6e2fa4fad0"
+SRC_URI[sha256sum] = "2347b2b432c891a863acadca2da9ac101eae6169b1d3dfee2ec605ecd50dbfe5"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.27.0


--===============0926818803359959800==--

