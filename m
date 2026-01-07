Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62AAD0D145
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 17:17:17 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11384.1767806233337029679
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 09:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sQLENp6p;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 316641A26DF
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 17:17:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB5E5606F8;
	Wed,  7 Jan 2026 17:17:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75B1B103C870E;
	Wed,  7 Jan 2026 18:17:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767806230; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KqLWzvQ+UMoz4qmCby/TVptGAOWI3jJ3rkkzD25ss2A=;
	b=sQLENp6pt+Gr4lXv0KMDKAcGuc/O6ybBPX3TBzsRn5E9U7HKh1T80rUks5n52dRM+g5uAS
	nGqgem0pxk+sUsm4NZThSsdeucymHtgaYBZCw3akIfo58Jchneb6Z6m97GVynYr+iT2sJm
	NWrunHU5qCqnXHyCbzb9EmlsjyIb4zEAbTQ6VYTRxRUUD9OoAswqeIL09eIASDWK8aB77a
	j8ysflub0wRitAu3XdeIpKrLrqXp+xIxuT3vKAyP+fGk8KdjPl8FPytsbd5T11UT+ntljn
	+D/K3++P5+0l5JKw4Dr887NqnRYouCR60/gQaqKZLqh4p9XKsxrYIrb1ZCDu+w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 18:17:08 +0100
Message-Id: <DFIJ09ZSDBHO.216DO8W5SDGE1@bootlin.com>
Subject: Re: [OE-core][PATCH] python3-pyzstd: upgrade 0.17.0 -> 0.19.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <liuyd.fnst@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260107090744.844-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260107090744.844-1-liuyd.fnst@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 17:17:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229015

On Wed Jan 7, 2026 at 10:07 AM CET, Yiding Liu (Fujitsu) via lists.openembe=
dded.org wrote:
> 1.Changelog:
>   Fix SeekableZstdFile write table entries on 32-bits architectures when =
there is a huge number of entries.
>
> 2.Remove 0001-Remove-setuptools-version-limit-of-74.patch as setuptools w=
as removed in pyproject.toml.
>
> 3.Remove do_configure:append as there is no setup.py in 0.19.1
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---

Hi Liu,

Thanks for your patch.

It looks like the ptests are failing:

Failed ptests:
{'python3-pyzstd': 'START: ptest-runner\n'
                   '2026-01-07T17:04\n'
                   '\n'
                   'ImportError while importing test module '
                   "'/usr/lib/python3-pyzstd/ptest/tests/test_seekable.py'.=
\n"
                   'Hint: make sure your test modules/packages have valid '
                   'Python names.\n'
                   'Traceback:\n'
                   '../../python3.13/importlib/__init__.py:88: in '
                   'import_module\n'
                   '    return _bootstrap._gcd_import(name[level:], package=
, '
                   'level)\n'
                   '           '
                   '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
                   'tests/test_seekable.py:17: in <module>\n'
                   '    from pyzstd import (\n'
                   '../../python3.13/site-packages/pyzstd/__init__.py:19: i=
n '
                   '<module>\n'
                   '    from backports import zstd\n'
                   "E   ModuleNotFoundError: No module named 'backports'\n"
                   'ERROR: tests/test_seekable.py:tests/test_seekable.py\n'
                   '\n'
                   'ImportError while importing test module '
                   "'/usr/lib/python3-pyzstd/ptest/tests/test_zstd.py'.\n"
                   'Hint: make sure your test modules/packages have valid '
                   'Python names.\n'
                   'Traceback:\n'
                   '../../python3.13/importlib/__init__.py:88: in '
                   'import_module\n'
                   '    return _bootstrap._gcd_import(name[level:], package=
, '
                   'level)\n'
                   '           '
                   '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
                   'tests/test_zstd.py:19: in <module>\n'
                   '    from pyzstd import ZstdCompressor, '
                   'RichMemZstdCompressor, \\\n'
                   '../../python3.13/site-packages/pyzstd/__init__.py:19: i=
n '
                   '<module>\n'
                   '    from backports import zstd\n'
                   "E   ModuleNotFoundError: No module named 'backports'\n"
                   'ERROR: tests/test_zstd.py:tests/test_zstd.py\n'
                   '=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D\n'
                   'Testsuite summary\n'
                   '# TOTAL: 2\n'
                   '# PASS: 0\n'
                   '# SKIP: 0\n'
                   '# XFAIL: 0\n'
                   '# FAIL: 0\n'
                   '# XPASS: 0\n'
                   '# ERROR: 2\n'
                   '\n'
                   'ERROR: Exit status is 2\n'
                   'DURATION: 1\n'}

ptests which had no test results:
['python3-pyzstd']

Can you have a look at this issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


