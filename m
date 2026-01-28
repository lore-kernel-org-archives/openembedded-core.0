Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BDFD35688
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 07:09:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7808.1769584140795703676
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 23:09:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=J1wY5eQ4;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8E6F04E422E9
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 07:08:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4CE076071A;
	Wed, 28 Jan 2026 07:08:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F27A119A8695;
	Wed, 28 Jan 2026 08:08:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769584137; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tvNxR+J4uOiMYQepXnDf6qgFov0EG6Jwb/0rjfkneQs=;
	b=J1wY5eQ4cf4eREhvMzOya4x+otMH89xJjuGFOZuhSAJzApEabilsC5ZxUBYeA/NtddQJBI
	9MvZduJYPG1nO4xThls/CVH1TSTaKJHylW1OkJyzGB/BzD0HjqiygQFPYdiozl+CE4Tq1P
	WzG/LIoROsWbtp12oQ09jps+tc1fIHpWuPGuwWTKgiASpk6T2ey7TKBnPkvzyTNdJ2HD25
	mZn0y71O68YGRIvyK8HyQJx7oo0CJKcUwlDf6DTQqpb/cwrb5cstgy/jOLT5QlU52Tg2zJ
	M1lyYkTtMDbzPoVJv8GYoOfXMI0x73OzmyQb1qKPxIkAibZQdNVRpYMyDzuL7g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 08:08:55 +0100
Message-Id: <DG01814VIAP0.1YYMOP47NI7ER@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 08/17] python3-packaging: upgrade 25.0 -> 26.0
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260126123517.1020-1-wangmy@fujitsu.com>
 <20260126123517.1020-8-wangmy@fujitsu.com>
In-Reply-To: <20260126123517.1020-8-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 07:09:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230081

On Mon Jan 26, 2026 at 1:35 PM CET, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for the upgrade. It looks like some ptests are now failing:

Failed ptests:
{'python3-packaging': 'START: ptest-runner\n'
                      '2026-01-27T20:53\n'
                      '\n'
                      'ImportError while importing test module '
                      "'/usr/lib/python3-packaging/ptest/tests/test_pylock.=
py'.\n"
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
                      'tests/test_pylock.py:9: in <module>\n'
                      '    import tomli_w\n'
                      "E   ModuleNotFoundError: No module named 'tomli_w'\n=
"
                      'ERROR: tests/test_pylock.py:tests/test_pylock.py\n'
                      '=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D\n'
                      'Testsuite summary\n'
                      '# TOTAL: 1\n'
                      '# PASS: 0\n'
                      '# SKIP: 0\n'
                      '# XFAIL: 0\n'
                      '# FAIL: 0\n'
                      '# XPASS: 0\n'
                      '# ERROR: 1\n'
                      '\n'
                      'ERROR: Exit status is 2\n'
                      'DURATION: 77\n'}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1002
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2960
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2992

Can you have a look at these?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


