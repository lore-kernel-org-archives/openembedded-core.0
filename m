Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62EEEF587C
	for <webhook@archiver.kernel.org>; Sun, 15 Feb 2026 13:40:50 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25320.1771162839656957381
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 05:40:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Y/qVbUmn;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 88DDBC19D1B;
	Sun, 15 Feb 2026 13:40:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6D30606CD;
	Sun, 15 Feb 2026 13:40:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D604E1036905B;
	Sun, 15 Feb 2026 14:40:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771162835; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dOKh1NmQIYVdD8VbNAhN6L9a26oFUtNRd19wvwuhzXw=;
	b=Y/qVbUmnpoP6eFI6cmnnPrkqUT3Ox7lBI4r79sR6wkPPrbNDCksM5MjNl1WcK2KSv09g8Q
	4PYBVziVDhn5GhF8B7gusNHNxc2Y9B+KHOMxPFS7+K615C5IbEjWPsWLWvF2cMQby5K1ez
	0tZf+jd62OM9NQp11s7Dy/RxES1ppb0LklaY3jpvNbOzmltkylOrmKNPcZbeAPpOC/y4A+
	Vz/7xy23LSz3jGBL0HIoDAxSwcGbXWxf7bIVuRAjM2T4kqYx6wKuFhMi9zIq3LaILkMrEf
	UdbaJnJ+8NnH3WLLBjkf/bawu1GW7HTOtNLVNwb/0Gi1ZkUO9MMWQdeJhV/Jrw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 14:40:27 +0100
Message-Id: <DGFKTMA2S0AH.2FYRLKHRWQT5I@bootlin.com>
Subject: Re: [OE-core] [PATCH v6 09/14] selftest/cases/runtime_test: Add
 test for Linux Rust sample
Cc: <Randy.MacLeod@windriver.com>, <Sundeep.Kokkonda@windriver.com>,
 <bruce.ashfield@gmail.com>, <paul@pbarker.dev>, <yoann.congal@smile.fr>,
 <elmehdi.younes@smile.fr>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
 <20260212181039.1826154-5-Harish.Sadineni@windriver.com>
In-Reply-To: <20260212181039.1826154-5-Harish.Sadineni@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 13:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231158

On Thu Feb 12, 2026 at 7:10 PM CET, Harish via lists.openembedded.org Sadin=
eni wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
>
> This new case tests that the rust_mininal sample inside the kernel source
> tree is buildable and works properly: check that the module can be
> loaded and that it prints correctly.
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---

Hi Harish, Yoann,

It looks like this test is still a bit intermittent:

2026-02-15 09:27:44,140 - oe-selftest - INFO - runtime_test.RustKernel.test=
_kernel_rust_sample (subunit.RemotedTestCase)
2026-02-15 09:27:44,142 - oe-selftest - INFO -  ... FAIL
...
2026-02-15 09:27:44,142 - oe-selftest - INFO - 11: 13/57 404/671 (87.99s) (=
0 failed) (runtime_test.RustKernel.test_kernel_rust_sample)
2026-02-15 09:27:44,142 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/runtime_test.py", line 506, in tes=
t_kernel_rust_sample
    self.assertEqual(status, 1, "Loading rust_minimal module failed!")
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 907, in assertEqual
    assertion_func(first, second, msg=3Dmsg)
    ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 900, in _baseAssertEqua=
l
    raise self.failureException(msg)
AssertionError: 0 !=3D 1 : Loading rust_minimal module failed!

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3319

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


