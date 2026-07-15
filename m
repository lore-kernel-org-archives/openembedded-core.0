Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50776C44507
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 11:47:13 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4319.1784116032060558691
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 04:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LRWgzRMW;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CA8B6C2B9D3
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 11:47:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D3AB16035C;
	Wed, 15 Jul 2026 11:47:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA3D011BD39FC;
	Wed, 15 Jul 2026 13:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784116029; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ud0o6lBlH2pmwG9WFiZBzFZEewLuxgOYHdCI5PSf7BU=;
	b=LRWgzRMWMVWwIxXAlfxIGeSAbLPLpVQm3HIFEuaSbAWho9jm/xmUFG1jrw8vzQ2lagxYOh
	2gWr/Rycts4ZERKD4QqCqspJtPFeP1Gg1o24qEz+mRP+ulYXMkYrYdOBO0/rfw8qYVzVt4
	LLJA7bYK5c1rjh/2PKF2RmFnTIF38vw6y7fh7jajqXwsJVxfarAQEO5Oh9kgfAl58aYhbW
	tPhnpfgfCCxsjvAl7fGyJxLPzrpVtObjSCvHOr301xxw3k83s8pXhFCmnekOOxsn/y0QkC
	zAockVK46c4w7vT4Pr1OBio8+JKZJqoxz2Cq827eUb65k6YPxw6NI/qZxIhFrQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 13:47:07 +0200
Message-Id: <DJZ4CKAA0NT8.2WA3Q543OQGNQ@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <sdoshi@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH] pinentry: upgrade 1.3.2 -> 1.3.3
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260714171418.1585070-1-sdoshi@mvista.com>
In-Reply-To: <20260714171418.1585070-1-sdoshi@mvista.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 11:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240952

On Tue Jul 14, 2026 at 7:14 PM CEST, Siddharth Doshi via lists.openembedded=
.org wrote:
> From: Siddharth Doshi <sdoshi@mvista.com>
>
> For detailed information, see the link below:
> [1] https://github.com/gpg/pinentry/compare/pinentry-1.3.2...pinentry-1.3=
.3
> [2] https://github.com/gpg/pinentry/blob/pinentry-1.3.3/NEWS
>
> Note: small modification to libassuan_pkgconf.patch
>
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---

Hi Siddharth,

We get the following error on the autobuilder, and I suspect it comes
from this patch:

2026-07-15 07:40:07,413 - oe-selftest - INFO - oescripts.OEListPackageconfi=
gTests.test_packageconfig_flags_option_all (subunit.RemotedTestCase)
2026-07-15 07:40:07,413 - oe-selftest - INFO -  ... FAIL
...
2026-07-15 07:40:07,414 - oe-selftest - INFO - 8: 34/44 230/698 (261.34s) (=
0 failed) (oescripts.OEListPackageconfigTests.test_packageconfig_flags_opti=
on_all)
2026-07-15 07:40:07,414 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/oescripts.py", line 165, in test_pa=
ckageconfig_flags_option_all
    self.check_endlines(results, expected_endlines)
    ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/oescripts.py", line 129, in check_e=
ndlines
    self.fail('Missing expected listings:\n  %s' % '\n  '.join(expected_end=
lines))
    ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^
  File "/usr/lib64/python3.13/unittest/case.py", line 732, in fail
    raise self.failureException(msg)
AssertionError: Missing expected listings:
  pinentry-1.3.2

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4283
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4283

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


