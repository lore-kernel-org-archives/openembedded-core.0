Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95FEEFD23E
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 10:11:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42418.1772014299374404953
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 02:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fz7rcECv;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2D30B1A12BD
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 10:11:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAB735FDE5;
	Wed, 25 Feb 2026 10:11:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93D5E1036924D;
	Wed, 25 Feb 2026 11:11:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772014296; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=19pTPmPimRUl9mclrz0tK/mga2ye65LQIBEwINfM7Kw=;
	b=fz7rcECvgjBL0voXeUEzzgWcM3i8W0Z6iS7wvkIan6AC4lVFYWWSk4pe3w72t836ddy9BG
	cvOk6+SLp0/aX+jog9qbEF6ob7s4X2SuXftU9Xn+QQ/U9gGl7DUXBLpoUbdTQroNqGcVSZ
	WtK0QQY3cLllhNEnnLV2WtcOo3aEIOoOrfBnVF5zFxwt1Hu0Cgb7yi5Hej9sfNlKUhce0+
	RFBq3DJbZ+L5qE4DR5A2Dz0jR0EyFDmXBZ4qRotyRwYJdfPiKTFy6fqJJNkhTrufJiKTCl
	0HVo36VxD2x4wy93u6QKn/Ema00Cpa2tPP3eUv/MhI7POLghZs3cGzDHb6H+eA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 11:11:33 +0100
Message-Id: <DGNYN4ICGR5R.29DIPU8EA51MG@bootlin.com>
Subject: Re: [OE-core] [PATCH] perl: upgrade from 5.40.2 to 5.42.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <changqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260224014646.3335672-1-changqing.li@windriver.com>
In-Reply-To: <20260224014646.3335672-1-changqing.li@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 10:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231947

On Tue Feb 24, 2026 at 2:46 AM CET, Changqing Li via lists.openembedded.org=
 wrote:
> License-Update: Update copies of GPL to match recent FSF changes
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---

Hi Changqing,

Thanks for your patch.

It looks like some ptest is failing. I suspect the fail comes from the
perl upgrade:

WARNING: core-image-ptest-libmodule-build-perl-1.0-r0 do_testimage: There w=
ere failing ptests.
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembed=
ded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembed=
ded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembed=
ded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembed=
ded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptestrunne=
r_expectfail
    self.do_ptestrunner()
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembed=
ded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 120, in do_ptestrunner
    self.fail(failmsg)
AssertionError:
Failed ptests:
{'libmodule-build-perl': ['t/xs']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3155
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3114
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1126

Test logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20260225-48/testresults/qemuarm64=
-ptest/core-image-ptest-libmodule-build-perl/
https://valkyrie.yocto.io/pub/non-release/20260225-48/testresults/qemux86-6=
4-ptest/core-image-ptest-libmodule-build-perl/

Can you have a look at the issues?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


