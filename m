Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4749.1793780058749183260
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 00:14:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=F8G7hgcd;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7BC191A13C8
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2026 08:14:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4B94B60770;
	Wed,  4 Nov 2026 08:14:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2EBC103291CE;
	Wed,  4 Nov 2026 09:14:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793780055; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c84m6U99MuBrDHX9D8Y4FgetkfrP7Jb1n5wLkFTo3js=;
	b=F8G7hgcdJE2I8ItZCLtkTvzcj8PZFZ2DD5+8gR/2CS5DaSpdV8BCAoA3TnWfwQ6H33w0sW
	nBxNNArjjsV9NOC9azFCylPx+xeIbdopy7VKSGDKC8/MSJhawhfXULgzLxUQPzeb/Qd2c9
	EP5j+n4FT266lncQ+HHP8BBuFD/X62Uo9ETCEV/jLw11fL2dhnMT7Bt1BPtG8VVHuT7d5X
	Q9+xtKHMlgntRFqNdegZ6C6FXBqrGPVj+1cmqa3w+7PuMPlVseHXp0er6T0S8aVraRh78S
	5cjNgk9UBWHRrYBwVRPhjk+X+b7v2tJMhDghMQo6xBaD3tnYggC0oqMM5/+oYQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 09:14:14 +0100
Message-Id: <DMM9YKSULX1P.SE0S57XBC0HT@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 05/12] python3-jsonpointer: upgrade 3.5 -> 3.8
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
 <20261103092800.39286-6-jaipaul.cheernam@est.tech>
In-Reply-To: <20261103092800.39286-6-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 08:14:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249344

On Tue Nov 3, 2026 at 10:27 AM CET, Jaipaul Cheernam wrote:
> CompareLog: https://github.com/stefankoegl/python-json-pointer/compare/v3=
.5...v3.8
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for the upgrades.

I can see some ptest failures here:

AssertionError:
Failed ptests:
{'python3-jsonpointer': 'START: ptest-runner\n'
                        '2026-11-03T21:12\n'
                        'ERROR: unittest.loader._FailedTest.tests\n'
                        'Traceback (most recent call last):\n'
                        '  File "/usr/lib/python3-jsonpointer/ptest/tests.p=
y", '
                        'line 990, in load_tests\n'
                        '    '
                        "tests.addTests(doctest.DocFileSuite('doc/tutorial.=
rst'))\n"
                        '                   '
                        '~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^\n'
                        '  File "/usr/lib/python3.14/doctest.py", line 2636=
, '
                        'in DocFileSuite\n'
                        '    suite.addTest(DocFileTest(path, **kw))\n'
                        '                  ~~~~~~~~~~~^^^^^^^^^^^^\n'
                        '  File "/usr/lib/python3.14/doctest.py", line 2558=
, '
                        'in DocFileTest\n'
                        '    doc, path =3D _load_testfile(path, package, '
                        'module_relative,\n'
                        '                '
                        '~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
                        '                               encoding or "utf-8"=
)\n'
                        '                               ^^^^^^^^^^^^^^^^^^^=
^\n'
                        '  File "/usr/lib/python3.14/doctest.py", line 255,=
 in '
                        '_load_testfile\n'
                        '    file_contents =3D loader.get_data(filename)\n'
                        '  File "<frozen importlib._bootstrap_external>", l=
ine '
                        '954, in get_data\n'
                        'FileNotFoundError: [Errno 2] No such file or '
                        'directory: '
                        "'/usr/lib/python3-jsonpointer/ptest/doc/tutorial.r=
st'\n"
                        '=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n'
                        '\n'
                        '=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n'
                        'Testsuite summary\n'
                        '# TOTAL: 1\n'
                        '# PASS: 0\n'
                        '# SKIP: 0\n'
                        '# XFAIL: 0\n'
                        '# FAIL: 0\n'
                        '# XPASS: 0\n'
                        '# ERROR: 1\n'
                        '\n'
                        'ERROR: Exit status is 1\n'
                        'DURATION: 0\n'}

ptests which had no test results:
['python3-jsonpointer']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4839
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2723
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4871
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1495
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1516

Can you have a look at the issues?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

