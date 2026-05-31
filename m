Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF38CCD6E56
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 17:30:48 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11299.1780248638966367382
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2026 10:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0dWmzWup;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8E494C62475
	for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 17:30:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C094A60230;
	Sun, 31 May 2026 17:30:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D75F10888CC7;
	Sun, 31 May 2026 19:30:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780248636; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZIjDjcp2PtY1NSszfMW1i77VLVgayFxRlJh+0sGAo2o=;
	b=0dWmzWup4GSDpj28EJRhUGgg1DpFX+1Z7Ds8M2T8J1GqthkMXaJE6vDx8QCLn4GgKygDnI
	uk/tGTNpHWxSYB7OT4Dq9eRw6kmM+DFTGmhGnMhsGnrWjYhsPLzHLFFTvA5M22WotGYYAr
	01oXVeHHrmmyZ+QVM6NbExTQGG+eo4l4mJkk0IuBDcrpApMs0/+pcLCi1N8XzDQ4TrvKUv
	zSCzAPerrvTKaFQpsi0PDh4NLFYIK1cYyd/t332YyWwunyvfkQO/MvdHIMpOvhAV7a/mGG
	ZkXm8UWGH8aF/aP/Hg2+4dBMquAGlNzKyVioV01BQMjFrlwEzOtT5/95vICUkQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 31 May 2026 19:30:33 +0200
Message-Id: <DIX1H01XXHMQ.3EYWKQXBXFXPB@bootlin.com>
Subject: Re: [OE-core] [PATCH 3/9] python3-packaging: upgrade 26.0 -> 26.2
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <tim.orling@konsulko.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260531001756.1582306-1-tim.orling@konsulko.com>
 <20260531001756.1582306-3-tim.orling@konsulko.com>
In-Reply-To: <20260531001756.1582306-3-tim.orling@konsulko.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 17:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237800

On Sun May 31, 2026 at 2:17 AM CEST, Tim Orling via lists.openembedded.org =
wrote:
> From: Tim Orling <tim.orling@konsulko.com>
>
> 26.2 - 2026-04-24
> Fixes:
> * Fix incorrect sysconfig var name for pyemscripten in (PR #1160)
> * Make Version, Specifier, SpecifierSet, Tag, Marker, and Requirement
>   pickle-safe and backward-compatible with pickles created in 25.0-26.1
>   (including references to the removed packaging._structures module)
>   (PR #1163, PR #1168, PR #1170, PR #1171)
> * Re-export ExceptionGroup in metatadata for now in (PR #1164)
>
> 26.1 - 2026-04-14
> Fixes:
> * Fix > comparison for versions with dev+local segments in (PR #1097)
> * Fix incorrect self-comparison for InfinityType and NegativeInfinityType
>   in (PR #1093)
> * Canonicalize when deduplicating specifiers in SpecifierSet in
>   (PR #1109)
> * Fix charset error message formatting in (PR #1121)
> * Handle the key parameter in SpecifierSet.filter when specifiers are
>   empty and prerelease is False in (PR #1096)
> * Standardize inner components of repr output in (PR #1090)
> * Specifier=E2=80=99s =3D=3D=3D uses original string, not normalized, whe=
n available
>   in (PR #1124)
> * Propagate int-max-str-digits ValueError in (PR #1155)
>
> For additional changes, see [1].
> For full comparison, see [2].
>
> [1] https://packaging.pypa.io/en/stable/changelog.html
> [2] https://github.com/pypa/packaging/compare/26.0...26.2
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---

Hi Tim,

Thanks for the upgrade.

We get a ptest failure on python3-packaging:

Failed ptests:
{'python3-packaging': 'START: ptest-runner\n'
                      '2026-05-31T14:34\n'
                      '\n'
                      'ImportError while importing test module '
                      "'/usr/lib/python3-packaging/ptest/tests/property/tes=
t_specifier_comparison.py'.\n"
                      'Hint: make sure your test modules/packages have vali=
d '
                      'Python names.\n'
                      'Traceback:\n'
                      '../../python3.14/importlib/__init__.py:88: in '
                      'import_module\n'
                      '    return _bootstrap._gcd_import(name[level:], '
                      'package, level)\n'
                      '           '
                      '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
\n'
                      'tests/property/test_specifier_comparison.py:8: in '
                      '<module>\n'
                      '    from hypothesis import assume, given\n'
                      "E   ModuleNotFoundError: No module named 'hypothesis=
'\n"

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1658
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3723
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3741
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/472
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/456

Can you have look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


