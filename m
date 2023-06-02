Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F3BECAA3E
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:46 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.7631.1685693432372498291
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UIRGR9K1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101887b28853a-3c6f7b5f-3c87-4bd0-a695-246fa6f44437-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hL5Con2E58JComgcWGSnLha8guXYKSi5+Iad1Kr5sDI=;
	b=UIRGR9K187q0vAbf7cw+BI6bBPrsV3iN1pq+ngTBDy6qLUJ9acntmej0xQxQzC0n
	jeQAxl/oCgDyi50Qlz8qWYdfXsEFeuegtA3OmEeTGdFlpmnXS5+X8hkZu0bvdjXYCHR
	QehPfNBEbZwIPfBDhCSGM4yWJQzhqhjZIhEBcuvE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hL5Con2E58JComgcWGSnLha8guXYKSi5+Iad1Kr5sDI=;
	b=J4Dei5Nhkpp8af0LqNiDoP019245aWBqaock2CPeiqxSF9SBx9osArhsfdPgrT8b
	LkeVpyfbMGjEnyeyvckjonqoI1bBFKAcUMb551lFrHv1Dz1Svzb5op5Ihtu91ym/NK3
	NyvZfzuShXaR4JOigaokV2fjsDd+4js/9X7n0LAQ=
Content-Type: multipart/mixed; boundary="===============8538686334486853005=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 7.0.1 SUCCEEDED
Message-ID: <010101887b28853a-3c6f7b5f-3c87-4bd0-a695-246fa6f44437-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182215

--===============8538686334486853005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinx* to *7.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-6.1.3-7.0.1.patch
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
--===============8538686334486853005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1d4fdea38aa0ab5a021bbd41c408b485dfabdf82"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 61 Local 15 Mirrors 0 Missed 46 Current 426 (24% match, 90% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 459 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 487 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-requests-2.30.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 486 of 487 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.69.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1158 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 1181 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_fetch)
NOTE: recipe cargo-native-1.69.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1439 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Succeeded
NOTE: recipe cargo-native-1.69.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 487 of 487 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.69.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1446 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: Running task 1447 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_unpack)
NOTE: Running task 1448 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1449 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1491 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: Running task 1493 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: Running task 1496 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_packagedata)
NOTE: Running task 1498 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Started
NOTE: Running task 1500 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: Running task 1502 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_package: Started
NOTE: Running task 1503 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata)
NOTE: recipe rust-native-1.69.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: Running task 1504 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: Running task 1505 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_packagedata)
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Started
NOTE: Running task 1583 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata)
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_packagedata: Started
NOTE: Running task 1716 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_packagedata)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1723 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata)
NOTE: Running task 1724 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_patch)
NOTE: Running task 1733 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: Running task 1734 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm)
NOTE: Running task 1735 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: Running task 1736 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package_write_rpm)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Started
NOTE: Running task 1737 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_write_rpm)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Started
NOTE: Running task 1739 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1740 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1741 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1742 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package_write_rpm)
NOTE: Running task 1743 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_package_write_rpm)
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Failed
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Failed
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe rust-native-1.69.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_package: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1743 tasks of which 1713 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-src went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dbg went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-staticdev went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dev went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-doc went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-locale went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-docutils/0.19-r0/temp/log.do_packagedata.3840501
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata) failed with exit code '1'
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-src went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dbg went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-ptest went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-staticdev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-doc went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-locale went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1 went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-pyasn1/0.4.8-r0/temp/log.do_packagedata.3840766
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata) failed with exit code '1'

--===============8538686334486853005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 54 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1d4fdea38aa0ab5a021bbd41c408b485dfabdf82"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 59 Local 12 Mirrors 0 Missed 47 Current 428 (20% match, 90% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 461 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.30.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1144 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1195 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 1218 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_fetch)
NOTE: recipe python3-requests-2.30.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1478 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1479 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: Running task 1480 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_unpack)
NOTE: Running task 1481 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1482 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1523 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: Running task 1524 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: Running task 1526 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata)
NOTE: Running task 1527 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_packagedata)
NOTE: Running task 1528 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1530 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: Running task 1531 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_rust_create_wrappers)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1532 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_packagedata)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1533 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: Running task 1534 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_package: Started
NOTE: Running task 1535 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_packagedata: Started
NOTE: Running task 1617 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: Running task 1753 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_packagedata)
NOTE: Running task 1757 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: Running task 1766 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Started
NOTE: Running task 1767 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: Running task 1768 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_patch)
NOTE: Running task 1769 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_write_rpm)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Started
NOTE: Running task 1770 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Started
NOTE: Running task 1772 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_configure)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Failed
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Failed
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1772 tasks of which 1744 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-src went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dbg went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-staticdev went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dev went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-doc went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-locale went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-docutils/0.19-r0/temp/log.do_packagedata.3905692
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata) failed with exit code '1'
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-src went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dbg went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-ptest went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-staticdev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-doc went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-locale went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1 went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-pyasn1/0.4.8-r0/temp/log.do_packagedata.3905862
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata) failed with exit code '1'

--===============8538686334486853005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.11/site-packages/sphinx-6.1.3.dist-info -> /usr/lib/python3.11/site-packages/sphinx-7.0.1.dist-info, removed "/usr/lib/python3.11/site-packages/sphinx/writers/_html4.py /usr/lib/python3.11/site-packages/sphinx/__pycache__/setup_command.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/writers/__pycache__/_html4.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/iterators.py /usr/lib/python3.11/site-packages/sphinx/util/jsdump.py /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/jsdump.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/setup_command.py /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/__pycache__/iterators.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__init__.py", added "/usr/lib/python3.11/site-packages/sph
 inx/themes/basic/searchfield.html"
Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.11/site-packages/sphinx-6.1.3.dist-info moved to /usr/lib/python3.11/site-packages/sphinx-7.0.1.dist-info
  /usr/lib/python3.11/site-packages/sphinx/themes/basic/searchfield.html was added
  /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/iterators.py was removed
  /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/__pycache__/iterators.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/__pycache__/setup_command.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/setup_command.py was removed
  /usr/lib/python3.11/site-packages/sphinx/util/jsdump.py was removed
  /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/jsdump.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__init__.py was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__pycache__ was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/writers/_html4.py was removed
  /usr/lib/python3.11/site-packages/sphinx/writers/__pycache__/_html4.cpython-311.pyc was removed

--===============8538686334486853005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 48 skipped, 0 masked, 0 errors.
Removing 39 recipes from the core2-32 sysroot...done.
Removing 65 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1d4fdea38aa0ab5a021bbd41c408b485dfabdf82"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 286 Local 232 Mirrors 0 Missed 54 Current 215 (81% match, 89% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 216 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 228 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 230 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 233 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package_setscene)
NOTE: Running setscene task 234 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 237 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 239 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package_setscene)
NOTE: Running setscene task 240 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 247 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 248 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 249 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 256 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 258 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package_setscene)
NOTE: Running setscene task 259 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package_setscene)
NOTE: Running setscene task 262 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package_setscene)
NOTE: Running setscene task 265 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_package_setscene)
NOTE: Running setscene task 277 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package_setscene)
NOTE: Running setscene task 280 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_package_setscene)
NOTE: Running setscene task 282 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package_setscene)
NOTE: Running setscene task 288 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package_setscene)
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 291 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 298 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 299 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 302 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_package_setscene)
NOTE: Running setscene task 306 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 307 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 308 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 318 of 501 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 320 of 501 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.69.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 321 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package_setscene)
NOTE: Running setscene task 324 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_setscene)
NOTE: Running setscene task 325 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_setscene)
NOTE: Running setscene task 328 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_package_setscene)
NOTE: Running setscene task 329 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_setscene)
NOTE: Running setscene task 330 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-docutils-0.19-r0: task do_package_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package_setscene: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package_setscene: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_package_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_package_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cargo-native-1.69.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package_setscene: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_setscene: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_package_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_setscene: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package_setscene: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_setscene: Started
NOTE: recipe python3-urllib3-2.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 740 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_fetch)
NOTE: Running task 744 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_fetch)
NOTE: Running task 777 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_fetch)
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 810 of 1872 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_fetch)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 836 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 837 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_fetch)
NOTE: Running task 838 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_fetch)
NOTE: Running task 840 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 893 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 340 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Started
NOTE: Running setscene task 345 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 1041 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_unpack)
NOTE: Running task 1043 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_unpack)
NOTE: Running task 1048 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_unpack)
NOTE: Running task 1049 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_unpack)
NOTE: Running task 1050 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: recipe python3-requests-2.30.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1051 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 348 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_fetch: Started
NOTE: Running task 1052 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running setscene task 349 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 350 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-23.1-r0: task do_package_setscene: Succeeded
NOTE: recipe cargo-native-1.69.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 351 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 352 of 501 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.69.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 353 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 354 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1059 of 1872 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 355 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 356 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 357 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1060 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_unpack)
NOTE: Running setscene task 358 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Started
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-docutils-0.19-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 360 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rust-native-1.69.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 364 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running task 1070 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: recipe python3-packaging-23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1071 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1079 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 370 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: Running task 1096 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-requests-2.30.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 372 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 373 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-packaging-23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1125 of 1872 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_patch)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1126 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_patch)
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 1157 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1160 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_patch)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1170 of 1872 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_rust_gen_targets)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1171 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1172 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_populate_lic)
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_lic: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_rust_gen_targets: Started
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_rust_gen_targets: Succeeded
NOTE: Running setscene task 396 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_populate_lic unihash changed to fcb32b3c21b0d58b47f5d95fa2f64a061eb7b45ead232aee5fc738e9dc7f010a
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rust-native-1.69.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1209 of 1872 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 404 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 415 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 417 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 421 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 436 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1259 of 1872 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_rust_create_wrappers)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 453 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_rust_create_wrappers: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1268 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_patch)
NOTE: Running setscene task 459 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1273 of 1872 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_configure)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 464 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1283 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_rust_gen_targets)
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1284 of 1872 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_compile)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_compile: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 469 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 471 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 476 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 478 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 479 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 486 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 495 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1314 of 1872 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_install)
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_install: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1315 of 1872 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_populate_sysroot)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 498 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 499 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1506 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1577 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1594 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1613 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1685 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: Running task 1686 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_packagedata)
NOTE: recipe libunwind-1.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1687 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: Running task 1689 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1691 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1693 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata)
NOTE: Running task 1694 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: Running task 1696 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_packagedata)
NOTE: Running task 1699 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Started
NOTE: Running task 1721 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: Running task 1782 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: Running task 1789 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_packagedata)
NOTE: Running task 1794 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_write_rpm)
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: Running task 1795 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package_write_rpm)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Started
NOTE: Running task 1796 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm)
NOTE: Running task 1797 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: Running task 1798 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Started
NOTE: recipe libunwind-1.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1800 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_configure)
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1801 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1802 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package_write_rpm)
NOTE: recipe libunwind-1.6.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1803 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1804 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Failed
NOTE: Running task 1805 of 1872 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package_write_rpm: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Failed
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_unpack: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1805 tasks of which 1741 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-src went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dbg went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-staticdev went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dev went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-doc went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-locale went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-docutils/0.19-r0/temp/log.do_packagedata.5707
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata) failed with exit code '1'
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-src went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dbg went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-ptest went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-staticdev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-doc went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-locale went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1 went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-pyasn1/0.4.8-r0/temp/log.do_packagedata.5817
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata) failed with exit code '1'

--===============8538686334486853005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 64 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1d4fdea38aa0ab5a021bbd41c408b485dfabdf82"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 12 Mirrors 0 Missed 45 Current 430 (21% match, 90% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 463 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.30.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1144 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1195 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 1218 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_fetch)
NOTE: Running task 1478 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1479 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_rust_create_wrappers)
NOTE: Running task 1480 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: Running task 1481 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_unpack)
NOTE: Running task 1482 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1483 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1523 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_packagedata)
NOTE: Running task 1526 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: Running task 1527 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_packagedata)
NOTE: Running task 1528 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_packagedata)
NOTE: Running task 1532 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: Running task 1535 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_package: Started
NOTE: Running task 1536 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_create_wrappers: Started
NOTE: Running task 1616 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata)
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_packagedata: Started
NOTE: Running task 1755 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_packagedata)
NOTE: Running task 1756 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: Running task 1757 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: Running task 1766 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: Running task 1767 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Started
NOTE: Running task 1768 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package_write_rpm)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1769 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_write_rpm)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Started
NOTE: Running task 1770 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_configure)
NOTE: Running task 1771 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm)
NOTE: Running task 1772 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package_write_rpm)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1774 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_patch)
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_configure: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Started
NOTE: Running task 1775 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1776 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1777 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_package_write_rpm)
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Failed
NOTE: recipe python3-cryptography-39.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Failed
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_package: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1777 tasks of which 1746 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-src went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dbg went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-staticdev went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dev went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-doc went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-src went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-locale went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dbg went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-docutils/0.19-r0/temp/log.do_packagedata.3978203
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-ptest went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata) failed with exit code '1'
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-staticdev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-doc went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-locale went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1 went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-pyasn1/0.4.8-r0/temp/log.do_packagedata.3978224
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata) failed with exit code '1'

--===============8538686334486853005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 70 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1d4fdea38aa0ab5a021bbd41c408b485dfabdf82"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 59 Local 12 Mirrors 0 Missed 47 Current 428 (20% match, 90% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 461 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.30.0.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.30.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.30.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1144 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1195 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 1218 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_fetch)
NOTE: Running task 1475 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1476 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: Running task 1477 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_unpack)
NOTE: Running task 1478 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1479 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1500 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_rust_create_wrappers)
NOTE: Running task 1523 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_packagedata)
NOTE: Running task 1524 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: Running task 1525 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Started
NOTE: Running task 1526 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_packagedata)
NOTE: recipe python3-babel-2.12.1-r0: task do_package: Started
NOTE: Running task 1528 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1531 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: Running task 1532 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: Running task 1533 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: Running task 1536 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Started
NOTE: Running task 1537 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_packagedata)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_packagedata: Started
NOTE: Running task 1617 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: Running task 1753 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata)
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Started
NOTE: Running task 1755 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_packagedata)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1766 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_write_rpm)
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Started
NOTE: Running task 1767 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_patch)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1768 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package_write_rpm)
NOTE: Running task 1769 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Started
NOTE: Running task 1770 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_configure)
NOTE: Running task 1771 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1773 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1774 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1775 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package_write_rpm)
NOTE: Running task 1776 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1777 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1778 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1779 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package_write_rpm)
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Failed
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Failed
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package_write_rpm: Started
NOTE: Running task 1780 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_populate_lic)
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1780 tasks of which 1744 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-src went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-src went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dbg went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dbg went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-ptest went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-staticdev went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dev went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-staticdev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-doc went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-dev went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-locale went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-doc went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1-locale went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-docutils/0.19-r0/temp/log.do_packagedata.4077375
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: QA Issue: Package version for package python3-pyasn1 went backwards which would break package feeds (from 0:0.5.0-r0 to 0:0.4.8-r0) [version-going-backwards]
ERROR: python3-pyasn1-0.4.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-pyasn1/0.4.8-r0/temp/log.do_packagedata.4077442
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata) failed with exit code '1'
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata) failed with exit code '1'

--===============8538686334486853005==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-6.1.3-7.0.1.patch"

RnJvbSA0NzI0MDQ1NTkzMzMwN2YxNDQ2YzIxNjZlYzgzYjc1M2FiYWEyMjQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxNjo1Njo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3BoaW54OiB1cGdyYWRlIDYuMS4zIC0+IDcuMC4xCgotLS0KIC4uLnBoaW54XzYuMS4z
LmJiID0+IHB5dGhvbjMtc3BoaW54XzcuMC4xLmJifSB8IDk3ICsrKysrKysrKysrKysrKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCA5NSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc3BoaW54XzYuMS4zLmJiID0+
IHB5dGhvbjMtc3BoaW54XzcuMC4xLmJifSAoMTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhfNi4xLjMuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzcuMC4xLmJiCnNpbWlsYXJpdHkgaW5kZXgg
MTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhp
bnhfNi4xLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1zcGhpbnhfNy4wLjEuYmIKaW5kZXggMGRlMTlhZjhkOS4uODQ4NjEzOTk0NiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF82LjEuMy5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzcuMC4xLmJi
CkBAIC0xLDEyICsxLDEwNSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVz
IGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5n
IGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRl
eHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3Vt
bWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2Ut
VXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVh
cnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysr
IExJQ0VOU0UKKyMgQEAgLTM0LDc5ICszNCw2IEBACisjICBMaWNlbnNlcyBmb3IgaW5jb3Jwb3Jh
dGVkIHNvZnR3YXJlCisjICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CisjICAK
KyMgLVRoZSBpbmNsdWRlZCBzbWFydHlwYW50cyBtb2R1bGUsIGluY2x1ZGVkIGFzIHNwaGlueC51
dGlsLnNtYXJ0eXBhbnRzLAorIyAtaXMgYXZhaWxhYmxlIHVuZGVyIHRoZSBmb2xsb3dpbmcgbGlj
ZW5zZToKKyMgLQorIyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAtU21hcnR5UGFudHNfIGxpY2Vuc2U6Ogor
IyAtCisjIC0gICAgQ29weXJpZ2h0IChjKSAyMDAzIEpvaG4gR3J1YmVyCisjIC0gICAgKGh0dHBz
Oi8vZGFyaW5nZmlyZWJhbGwubmV0L3Byb2plY3RzL3NtYXJ0eXBhbnRzLykKKyMgLSAgICBBbGwg
cmlnaHRzIHJlc2VydmVkLgorIyAtCisjIC0gICAgUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBz
b3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0CisjIC0gICAgbW9kaWZpY2F0
aW9uLCBhcmUgcGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIGZvbGxvd2luZyBjb25kaXRpb25z
CisjIC0gICAgYXJlIG1ldDoKKyMgLQorIyAtICAgICogICBSZWRpc3RyaWJ1dGlvbnMgb2Ygc291
cmNlIGNvZGUgbXVzdCByZXRhaW4gdGhlIGFib3ZlIGNvcHlyaWdodAorIyAtICAgICAgICBub3Rp
Y2UsIHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5nIGRpc2NsYWltZXIu
CisjIC0KKyMgLSAgICAqICAgUmVkaXN0cmlidXRpb25zIGluIGJpbmFyeSBmb3JtIG11c3QgcmVw
cm9kdWNlIHRoZSBhYm92ZQorIyAtICAgICAgICBjb3B5cmlnaHQgbm90aWNlLCB0aGlzIGxpc3Qg
b2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZworIyAtICAgICAgICBkaXNjbGFpbWVyIGlu
IHRoZSBkb2N1bWVudGF0aW9uIGFuZC9vciBvdGhlciBtYXRlcmlhbHMKKyMgLSAgICAgICAgcHJv
dmlkZWQgd2l0aCB0aGUgZGlzdHJpYnV0aW9uLgorIyAtCisjIC0gICAgKiAgIE5laXRoZXIgdGhl
IG5hbWUgIlNtYXJ0eVBhbnRzIiBub3IgdGhlIG5hbWVzIG9mIGl0cworIyAtICAgICAgICBjb250
cmlidXRvcnMgbWF5IGJlIHVzZWQgdG8gZW5kb3JzZSBvciBwcm9tb3RlIHByb2R1Y3RzCisjIC0g
ICAgICAgIGRlcml2ZWQgZnJvbSB0aGlzIHNvZnR3YXJlIHdpdGhvdXQgc3BlY2lmaWMgcHJpb3Ig
d3JpdHRlbgorIyAtICAgICAgICBwZXJtaXNzaW9uLgorIyAtCisjIC0gICAgVGhpcyBzb2Z0d2Fy
ZSBpcyBwcm92aWRlZCBieSB0aGUgY29weXJpZ2h0IGhvbGRlcnMgYW5kCisjIC0gICAgY29udHJp
YnV0b3JzICJhcyBpcyIgYW5kIGFueSBleHByZXNzIG9yIGltcGxpZWQgd2FycmFudGllcywKKyMg
LSAgICBpbmNsdWRpbmcsIGJ1dCBub3QgbGltaXRlZCB0bywgdGhlIGltcGxpZWQgd2FycmFudGll
cyBvZgorIyAtICAgIG1lcmNoYW50YWJpbGl0eSBhbmQgZml0bmVzcyBmb3IgYSBwYXJ0aWN1bGFy
IHB1cnBvc2UgYXJlCisjIC0gICAgZGlzY2xhaW1lZC4gSW4gbm8gZXZlbnQgc2hhbGwgdGhlIGNv
cHlyaWdodCBvd25lciBvciBjb250cmlidXRvcnMKKyMgLSAgICBiZSBsaWFibGUgZm9yIGFueSBk
aXJlY3QsIGluZGlyZWN0LCBpbmNpZGVudGFsLCBzcGVjaWFsLAorIyAtICAgIGV4ZW1wbGFyeSwg
b3IgY29uc2VxdWVudGlhbCBkYW1hZ2VzIChpbmNsdWRpbmcsIGJ1dCBub3QgbGltaXRlZAorIyAt
ICAgIHRvLCBwcm9jdXJlbWVudCBvZiBzdWJzdGl0dXRlIGdvb2RzIG9yIHNlcnZpY2VzOyBsb3Nz
IG9mIHVzZSwKKyMgLSAgICBkYXRhLCBvciBwcm9maXRzOyBvciBidXNpbmVzcyBpbnRlcnJ1cHRp
b24pIGhvd2V2ZXIgY2F1c2VkIGFuZCBvbgorIyAtICAgIGFueSB0aGVvcnkgb2YgbGlhYmlsaXR5
LCB3aGV0aGVyIGluIGNvbnRyYWN0LCBzdHJpY3QgbGlhYmlsaXR5LCBvcgorIyAtICAgIHRvcnQg
KGluY2x1ZGluZyBuZWdsaWdlbmNlIG9yIG90aGVyd2lzZSkgYXJpc2luZyBpbiBhbnkgd2F5IG91
dCBvZgorIyAtICAgIHRoZSB1c2Ugb2YgdGhpcyBzb2Z0d2FyZSwgZXZlbiBpZiBhZHZpc2VkIG9m
IHRoZSBwb3NzaWJpbGl0eSBvZgorIyAtICAgIHN1Y2ggZGFtYWdlLgorIyAtCisjIC0KKyMgLXNt
YXJ0eXBhbnRzLnB5IGxpY2Vuc2U6OgorIyAtCisjIC0gICAgc21hcnR5cGFudHMucHkgaXMgYSBk
ZXJpdmF0aXZlIHdvcmsgb2YgU21hcnR5UGFudHMuCisjIC0KKyMgLSAgICBSZWRpc3RyaWJ1dGlv
biBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMg
LSAgICBtb2RpZmljYXRpb24sIGFyZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93
aW5nIGNvbmRpdGlvbnMKKyMgLSAgICBhcmUgbWV0OgorIyAtCisjIC0gICAgKiAgIFJlZGlzdHJp
YnV0aW9ucyBvZiBzb3VyY2UgY29kZSBtdXN0IHJldGFpbiB0aGUgYWJvdmUgY29weXJpZ2h0Cisj
IC0gICAgICAgIG5vdGljZSwgdGhpcyBsaXN0IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dp
bmcgZGlzY2xhaW1lci4KKyMgLQorIyAtICAgICogICBSZWRpc3RyaWJ1dGlvbnMgaW4gYmluYXJ5
IGZvcm0gbXVzdCByZXByb2R1Y2UgdGhlIGFib3ZlCisjIC0gICAgICAgIGNvcHlyaWdodCBub3Rp
Y2UsIHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5nCisjIC0gICAgICAg
IGRpc2NsYWltZXIgaW4gdGhlIGRvY3VtZW50YXRpb24gYW5kL29yIG90aGVyIG1hdGVyaWFscwor
IyAtICAgICAgICBwcm92aWRlZCB3aXRoIHRoZSBkaXN0cmlidXRpb24uCisjIC0KKyMgLSAgICBU
aGlzIHNvZnR3YXJlIGlzIHByb3ZpZGVkIGJ5IHRoZSBjb3B5cmlnaHQgaG9sZGVycyBhbmQKKyMg
LSAgICBjb250cmlidXRvcnMgImFzIGlzIiBhbmQgYW55IGV4cHJlc3Mgb3IgaW1wbGllZCB3YXJy
YW50aWVzLAorIyAtICAgIGluY2x1ZGluZywgYnV0IG5vdCBsaW1pdGVkIHRvLCB0aGUgaW1wbGll
ZCB3YXJyYW50aWVzIG9mCisjIC0gICAgbWVyY2hhbnRhYmlsaXR5IGFuZCBmaXRuZXNzIGZvciBh
IHBhcnRpY3VsYXIgcHVycG9zZSBhcmUKKyMgLSAgICBkaXNjbGFpbWVkLiBJbiBubyBldmVudCBz
aGFsbCB0aGUgY29weXJpZ2h0IG93bmVyIG9yIGNvbnRyaWJ1dG9ycworIyAtICAgIGJlIGxpYWJs
ZSBmb3IgYW55IGRpcmVjdCwgaW5kaXJlY3QsIGluY2lkZW50YWwsIHNwZWNpYWwsCisjIC0gICAg
ZXhlbXBsYXJ5LCBvciBjb25zZXF1ZW50aWFsIGRhbWFnZXMgKGluY2x1ZGluZywgYnV0IG5vdCBs
aW1pdGVkCisjIC0gICAgdG8sIHByb2N1cmVtZW50IG9mIHN1YnN0aXR1dGUgZ29vZHMgb3Igc2Vy
dmljZXM7IGxvc3Mgb2YgdXNlLAorIyAtICAgIGRhdGEsIG9yIHByb2ZpdHM7IG9yIGJ1c2luZXNz
IGludGVycnVwdGlvbikgaG93ZXZlciBjYXVzZWQgYW5kIG9uCisjIC0gICAgYW55IHRoZW9yeSBv
ZiBsaWFiaWxpdHksIHdoZXRoZXIgaW4gY29udHJhY3QsIHN0cmljdCBsaWFiaWxpdHksIG9yCisj
IC0gICAgdG9ydCAoaW5jbHVkaW5nIG5lZ2xpZ2VuY2Ugb3Igb3RoZXJ3aXNlKSBhcmlzaW5nIGlu
IGFueSB3YXkgb3V0IG9mCisjIC0gICAgdGhlIHVzZSBvZiB0aGlzIHNvZnR3YXJlLCBldmVuIGlm
IGFkdmlzZWQgb2YgdGhlIHBvc3NpYmlsaXR5IG9mCisjIC0gICAgc3VjaCBkYW1hZ2UuCisjIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCisjIC0KKyMgIFRoZSBpbmNsdWRlZCBpbXBsZW1lbnRhdGlvbiBvZiBOdW1w
eURvY3N0cmluZy5fcGFyc2VfbnVtcHlkb2Nfc2VlX2Fsc29fc2VjdGlvbgorIyAgd2FzIGRlcml2
ZWQgZnJvbSBjb2RlIHVuZGVyIHRoZSBmb2xsb3dpbmcgbGljZW5zZToKKyMgIAorIyAKKyMKKwog
U1VNTUFSWSA9ICJQeXRob24gZG9jdW1lbnRhdGlvbiBnZW5lcmF0b3IiCiBIT01FUEFHRSA9ICJo
dHRwOi8vc3BoaW54LWRvYy5vcmcvIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNF
ID0gIkJTRC0yLUNsYXVzZSAmIE1JVCAmIEJTRC0zLUNsYXVzZSIKLUxJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTA2NmRhNTFhYjczMjMxOWEwNmJlYWU0ZjEwNzg4NTc3Igor
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NWViNmFjMWIxMTVhMWVkMjRh
MTJkOWYxNWI2MzM5OTMiCiAKIFBZUElfUEFDS0FHRSA9ICJTcGhpbngiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICIwZGFjM2I2OTg1MzhmZmVmNDE3MTZjZjk3YmEyNmMxYzc3ODhkYmE3M2NlNmYx
NTBjMWZmNWI0NzIwNzg2ZGQyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjYxZTAyNWY3ODhjNTk3
N2Q5NDEyNTg3ZTczMzczM2EyODllMmI5ZmRjMmZlZjg4NjhkZGZiZmM0Y2NmZTg4MWQiCiAKIGlu
aGVyaXQgcHl0aG9uX2ZsaXRfY29yZSBweXBpCiAKLS0gCjIuMzkuMgoK

--===============8538686334486853005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-sphinx: PKGV changed from 6.1.3 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/python3-sphinx: PV changed from "6.1.3" to "7.0.1"
packages/core2-32-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/S/Sphinx/Sphinx-6.1.3.tar.gz;downloadfilename=Sphinx-6.1.3.tar.gz" to "https://files.pythonhosted.org/packages/source/S/Sphinx/Sphinx-7.0.1.tar.gz;downloadfilename=Sphinx-7.0.1.tar.gz"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 6.1.3 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "6.1.3" to "7.0.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 6.1.3 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "6.1.3" to "7.0.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 6.1.3 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "6.1.3" to "7.0.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 6.1.3 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "6.1.3" to "7.0.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 6.1.3 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "6.1.3" to "7.0.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 6.1.3 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "6.1.3" to "7.0.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 14957001 to 14755671 (-1%)
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.11/site-packages/sphinx-6.1.3.dist-info -> /usr/lib/python3.11/site-packages/sphinx-7.0.1.dist-info, removed "/usr/lib/python3.11/site-packages/sphinx/setup_command.py /usr/lib/python3.11/site-packages/sphinx/writers/__pycache__/_html4.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/__pycache__/setup_command.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/iterators.py /usr/lib/python3.11/site-packages/sphinx/util/jsdump.py /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/writers/_html4.py /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/__pycache__/iterators.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__init__.py /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/jsdump.cpython-311.pyc", added "/usr/lib/python3.11/site-packages/sph
 inx/themes/basic/searchfield.html"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 6.1.3 [default] to 7.0.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PV changed from "6.1.3" to "7.0.1"
Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.11/site-packages/sphinx-6.1.3.dist-info moved to /usr/lib/python3.11/site-packages/sphinx-7.0.1.dist-info
  /usr/lib/python3.11/site-packages/sphinx/themes/basic/searchfield.html was added
  /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/iterators.py was removed
  /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/__pycache__/iterators.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/__pycache__/setup_command.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/setup_command.py was removed
  /usr/lib/python3.11/site-packages/sphinx/util/jsdump.py was removed
  /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/jsdump.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__init__.py was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__pycache__ was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/writers/_html4.py was removed
  /usr/lib/python3.11/site-packages/sphinx/writers/__pycache__/_html4.cpython-311.pyc was removed

--===============8538686334486853005==--

