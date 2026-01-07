Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C01D0D148
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 17:19:27 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11415.1767806364320158776
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 09:19:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DYeINLE7;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C8B501A26DF;
	Wed,  7 Jan 2026 17:19:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90AFE606F8;
	Wed,  7 Jan 2026 17:19:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0A0C103C870E;
	Wed,  7 Jan 2026 18:19:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767806362; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RS4XpZmxbgi9XcyWZw71Jd6Kxpn3yRVjcL6h44QQl+E=;
	b=DYeINLE7WrQcRexirL75a5PaXr6DEwvgHm1lAPHwVfQyEPz5f//wozctLvhEwXqrqIhodp
	kz7yPgBim8m8gdcc49HL7Cfo2+C6v4rurCUk52YD9cd6AgpDXuJK28Sr53qpmhN0JasSUO
	fSBcyktBpMiDYjV4aDNTnOH8OduKCWu7JE6lvWcy08kjidb0j6m1g+g7PkDN2ydwls5Tak
	isS1jon1wLnpcuKCAQ6BBO9VUA+LbAdU1DAkGhhzM+Nzwu7rQlVopZQ1cLP+TMzbBDjBLn
	Oq/MjWdxaZEr4UmAJX2tzHjyFQpR0wFNfWqOFU0++ZlPc9AyeGR9RN6dvh8ucQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 18:19:21 +0100
Message-Id: <DFIJ1YYREQ2V.3041A1DCKFC6M@bootlin.com>
To: <liuyd.fnst@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] python3-pyzstd: upgrade 0.17.0 -> 0.19.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260107090744.844-1-liuyd.fnst@fujitsu.com>
 <DFIJ09ZSDBHO.216DO8W5SDGE1@bootlin.com>
In-Reply-To: <DFIJ09ZSDBHO.216DO8W5SDGE1@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 17:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229016

On Wed Jan 7, 2026 at 6:17 PM CET, Mathieu Dubois-Briand wrote:
> On Wed Jan 7, 2026 at 10:07 AM CET, Yiding Liu (Fujitsu) via lists.openem=
bedded.org wrote:
>> 1.Changelog:
>>   Fix SeekableZstdFile write table entries on 32-bits architectures when=
 there is a huge number of entries.
>>
>> 2.Remove 0001-Remove-setuptools-version-limit-of-74.patch as setuptools =
was removed in pyproject.toml.
>>
>> 3.Remove do_configure:append as there is no setup.py in 0.19.1
>>
>> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
>> ---
>
> Hi Liu,
>
> Thanks for your patch.
>
> It looks like the ptests are failing:
>
> Failed ptests:
> {'python3-pyzstd': 'START: ptest-runner\n'
>                    '2026-01-07T17:04\n'
>                    '\n'
>                    'ImportError while importing test module '
>                    "'/usr/lib/python3-pyzstd/ptest/tests/test_seekable.py=
'.\n"
>                    'Hint: make sure your test modules/packages have valid=
 '
>                    'Python names.\n'
>                    'Traceback:\n'
>                    '../../python3.13/importlib/__init__.py:88: in '
>                    'import_module\n'
>                    '    return _bootstrap._gcd_import(name[level:], packa=
ge, '
>                    'level)\n'
>                    '           '
>                    '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\=
n'
>                    'tests/test_seekable.py:17: in <module>\n'
>                    '    from pyzstd import (\n'
>                    '../../python3.13/site-packages/pyzstd/__init__.py:19:=
 in '
>                    '<module>\n'
>                    '    from backports import zstd\n'
>                    "E   ModuleNotFoundError: No module named 'backports'\=
n"
>                    'ERROR: tests/test_seekable.py:tests/test_seekable.py\=
n'
>                    '\n'
>                    'ImportError while importing test module '
>                    "'/usr/lib/python3-pyzstd/ptest/tests/test_zstd.py'.\n=
"
>                    'Hint: make sure your test modules/packages have valid=
 '
>                    'Python names.\n'
>                    'Traceback:\n'
>                    '../../python3.13/importlib/__init__.py:88: in '
>                    'import_module\n'
>                    '    return _bootstrap._gcd_import(name[level:], packa=
ge, '
>                    'level)\n'
>                    '           '
>                    '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\=
n'
>                    'tests/test_zstd.py:19: in <module>\n'
>                    '    from pyzstd import ZstdCompressor, '
>                    'RichMemZstdCompressor, \\\n'
>                    '../../python3.13/site-packages/pyzstd/__init__.py:19:=
 in '
>                    '<module>\n'
>                    '    from backports import zstd\n'
>                    "E   ModuleNotFoundError: No module named 'backports'\=
n"
>                    'ERROR: tests/test_zstd.py:tests/test_zstd.py\n'
>                    '=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D\n'
>                    'Testsuite summary\n'
>                    '# TOTAL: 2\n'
>                    '# PASS: 0\n'
>                    '# SKIP: 0\n'
>                    '# XFAIL: 0\n'
>                    '# FAIL: 0\n'
>                    '# XPASS: 0\n'
>                    '# ERROR: 2\n'
>                    '\n'
>                    'ERROR: Exit status is 2\n'
>                    'DURATION: 1\n'}
>
> ptests which had no test results:
> ['python3-pyzstd']
>
> Can you have a look at this issue?
>
> Thanks,
> Mathieu

Sorry, I was too quick again... Here is the link to the failure:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2881


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


