Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF391C5DF9D
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 07:05:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30921.1787814345672935721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 00:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yGRKRJvD;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 48C8A4E413D8;
	Thu, 27 Aug 2026 07:05:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 153C9602B8;
	Thu, 27 Aug 2026 07:05:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F48B11C780F6;
	Thu, 27 Aug 2026 09:05:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787814342; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HcgQ4JJGXKJFCDZKBy8gXqoyYdcbKSJhzq4y87NzqF0=;
	b=yGRKRJvDbd1K3F4PbFMTPDjsXPcWXEoc5eql52Uazx6TmMsUF6f7Si95OMyghGr503kjiO
	ijA1Eq13CZaXE756XJw0LE1XIsQkMIqtxSorXJMdTaa2p+4IHyNd8iJZDHjHIgbH3XZtWn
	sl5Hr1ogKtqjUd/j9roNAVJx7JNOeZOmGWvk1FAkoDPTMDPZQWuTbYzTi4zdvBiXIfFQXu
	13cugh6Q3MaDmLgFRpwAaKz9W2QOU1ea0XHm4lVk/VEuSkulrQaAjgoCuvLufsGC1Sraz2
	m737sFRommodCzyKTcvJ0s8LDUqUu6e1GUUGHO59V2BTFA0kS4BSdXckoDDV1g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 09:05:40 +0200
Message-Id: <DKZJAHP6ASIS.MJVIR95WLGA2@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <bruce.ashfield@gmail.com>, <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [meta][PATCH 03/06] linux-yocto/7.2: introduce
 reference kernel recipes
Cc: <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260821112509.861559-1-bruce.ashfield@gmail.com>
 <20260821112509.861559-4-bruce.ashfield@gmail.com>
 <18CF953235C263D2.642712@lists.openembedded.org>
In-Reply-To: <18CF953235C263D2.642712@lists.openembedded.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 07:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244460

On Thu Aug 27, 2026 at 8:20 AM CEST, Mathieu Dubois-Briand via lists.openem=
bedded.org wrote:
> And then, failure in runtime_test.RustKernel.test_kernel_rust_sample
> selftest:
> 2026-08-26 14:11:09,216 - oe-selftest - INFO - runtime_test.RustKernel.te=
st_kernel_rust_sample (subunit.RemotedTestCase)
> 2026-08-26 14:11:09,221 - oe-selftest - INFO -  ... FAIL
>
> Stderr:
> 2026-08-26 13:52:43,328 - oe-selftest - INFO - Adding: "include selftest.=
inc" in /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-80320=
4/conf/local.conf
> 2026-08-26 13:52:43,328 - oe-selftest - INFO - Adding: "include bblayers.=
inc" in bblayers.conf
> WARNING: test: LICENSE is using "CLOSED", which is deprecated. Convert to=
 using a license ref pointing to an actual license file, e.g.
> LICENSE =3D "LicenseRef-test-CLOSED"
> WARNING: test: LICENSE is using "CLOSED", which is deprecated. Convert to=
 using a license ref pointing to an actual license file, e.g.
> LICENSE =3D "LicenseRef-test-CLOSED"
> ERROR: When reparsing /tmp/selftest-fetch8rb2fo4w/test.bb:do_checkuri, th=
e basehash value changed from eaf531c7d0304fd45f77fab173d0399db2b76e45cd464=
87426eb74bae7d4b7bb to 2cdec1b5839750d0c5998dd35b7ab7380727d2fa3a33aed86414=
4428d3a78f7d. The metadata is not deterministic and this needs to be fixed.
> ERROR: The following commands may help:
> ERROR: $ bitbake test -cdo_checkuri -Snone
> ERROR: Then:
> ERROR: $ bitbake test -cdo_checkuri -Sprintdiff
>
> I suspect the warning about the LICENSE value is unrelated, but is
> something else I should fix.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4680
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4502
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4724

On that one, I believe the error source is actually the QA issue:

ERROR: linux-yocto-7.2+git-r0 do_package_qa: QA Issue: File /lib/modules/7.=
2.0-yocto-standard/kernel/samples/rust/.debug/rust_minimal.ko in package ke=
rnel-dbg contains a reference to the build host HOME directory. If upstream=
 hardcodes a directory path that matches your home, you can set OEQA_BUILDP=
ATHS_SKIP =3D "/srv/pokybuild" in the recipe. [buildpaths]
ERROR: linux-yocto-7.2+git-r0 do_package_qa: QA Issue: File /boot/.debug/vm=
linux-7.2.0-yocto-standard in package kernel-dbg contains a reference to th=
e build host HOME directory. If upstream hardcodes a directory path that ma=
tches your home, you can set OEQA_BUILDPATHS_SKIP =3D "/srv/pokybuild" in t=
he recipe. [buildpaths]
ERROR: linux-yocto-7.2+git-r0 do_package_qa: Fatal QA errors were found, fa=
iling task.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


