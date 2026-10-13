Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD695CA9ED2
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 12:03:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5430.1791893026502490089
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 05:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DAGusDpf;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1C84B4E41207
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 12:03:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E440660362;
	Tue, 13 Oct 2026 12:03:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A1FF11D70413;
	Tue, 13 Oct 2026 14:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791893022; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xg2sMb8zZlY1PZX2GWrDZyc57tM9h8NEHXgVKrgygbk=;
	b=DAGusDpfbejxUlfpcCvOvxycdmRA0liWsnCClCAnUu/+2FufWf/Xyo6pDdx7dI3GaL+yAF
	MDFEGdhEXN0Id+gkHpwBiwi7kJs+exngVdvda0PxARHAnswndS17LZdSkaHQrKzWItiWWy
	85OLr1e0FNT0KU5gP1devfmi7omZs/peQpBbhTKc23j8GP8T31LsVA0mBXmxXhvqxhmp3J
	W0atO0Mk8xcsyutTvjgqwHc9mcinwouXNuadgGKn8w2Sv7PAD4JZNWF71AhcnrwysTecbR
	UAatESsof3ojh0FigOt46cV9yEdHuoq8Wc7ELKDy5hBTOideJnkEBH+FANRNLA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 14:03:40 +0200
Message-Id: <DM3P29KLORSR.1NVLANULHWXZP@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 12/18] python3-jsonpointer: upgrade 3.1.1 ->
 3.2.1
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
 <20261012132005.23909-13-jaipaul.cheernam@est.tech>
In-Reply-To: <20261012132005.23909-13-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 12:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247723

On Mon Oct 12, 2026 at 3:19 PM CEST, Jaipaul Cheernam wrote:
> ReleaseNotes: https://github.com/stefankoegl/python-json-pointer/releases=
/tag/v3.2.1
>
> CompareLog: https://github.com/stefankoegl/python-json-pointer/compare/v3=
.1.1...v3.2.1
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

This one got a failing ptest:

{'python3-jsonpointer': ['tests.CommandLineTests.test_empty_pointer',
                         'tests.CommandLineTests.test_invalid_pointer_file'=
,
                         'tests.CommandLineTests.test_missing_pointer_multi=
ple_files',
                         'tests.CommandLineTests.test_no_pointer',
                         'tests.CommandLineTests.test_pointer_and_pointer_f=
ile_exclusive',
                         'tests.CommandLineTests.test_pointer_file',
                         'tests.CommandLineTests.test_pointer_file_requires=
_value',
                         'tests.CommandLineTests.test_pointer_file_single_f=
ile',
                         'tests.CommandLineTests.test_pointer_option',
                         'tests.CommandLineTests.test_positional_pointer',
                         'tests.CommandLineTests.test_positional_pointer_si=
ngle_file',
                         'tests.CommandLineTests.test_unresolvable_pointer'=
,
                         'tests.CommandLineTests.test_unresolvable_pointer_=
in_one_file']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4737
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1372
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1359

I believe this will be the last failure with this series, all other
patches should be fine.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


