Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6925.1793261838938940470
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 01:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iLCrhbcn;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B070D1A138D;
	Thu, 29 Oct 2026 08:17:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D7DB60360;
	Thu, 29 Oct 2026 08:17:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBA2E103290D0;
	Thu, 29 Oct 2026 09:17:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793261835; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IaG5IKbeXL3msumAVaykSg2E+bu4ToV2nXo9lxI+5Pw=;
	b=iLCrhbcntO840Kwt8Nk0Mf2dMxJojSUKwNOeTwrIa0699yWTAWIBg6kZgkqV9p/vur3JgT
	R55LVGSvct8nxYoSwHU/GnXmcKHaRKMYSIdocJS8n3UwomkkrU0XkMiEw7C7clevNPIy30
	tMLEbQPF66sPopL+pjoRnb3OPpQXu1uabcPaYxeCC/wLrjCZbjPK7TfP8+WvTPq0unSKY0
	bhcG1zwZFJoM1fJEynAY5cHYkRuWKhPZs6VLanbjMMd35ScBKLGUJhy5rlmgCAkopYQJot
	B2/IcLAY9azGqNgRgBvCiUOhzqe32IvE0qMSvZNLFpEk3zBchGFPcalvSNoejw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Oct 2026 09:17:13 +0100
Message-Id: <DMH69LG4X13D.2DSUGJ3S5PAZW@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/8] python3-pytest: upgrade 9.1.1 -> 9.2.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261028070350.13243-1-jaipaul.cheernam@est.tech>
 <20261028070350.13243-5-jaipaul.cheernam@est.tech>
In-Reply-To: <20261028070350.13243-5-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 08:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248908

On Wed Oct 28, 2026 at 8:03 AM CET, Jaipaul Cheernam wrote:
> ChangeLog: https://docs.pytest.org/en/stable/changelog.html#pytest-9-2-0-=
2026-10-27
>
> pytest-9.2.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> The pytest team is proud to announce the 9.2.0 release!
>
> This release contains new features, improvements, and bug fixes,
> the full list of changes is available in the changelog:
>
>     https://docs.pytest.org/en/stable/changelog.html
> For complete documentation, please visit:
>     https://docs.pytest.org/en/stable/
> As usual, you can upgrade from PyPI via:
>     pip install -U pytest
> Thanks to all of the contributors to this release:
>
> Happy testing,
> The pytest Development Team
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for the upgrade.

I believe this is breaking ptests for click.

AssertionError:=20
Failed ptests:
{'python3-click': 'START: ptest-runner\n'
                  '2026-10-29T07:47\n'
                  'Error while loading plugin "pytest11".\n'
                  'pytest.PytestRemovedIn10Warning: The hookimpl '
                  'pytest_configure uses old-style configuration options '
                  '(marks or attributes).\n'
                  'Please use the pytest.hookimpl(trylast=3DTrue) decorator=
 '
                  'instead\n'
                  ' to configure the hooks.\n'
                  ' See '
                  'https://docs.pytest.org/en/latest/deprecations.html#conf=
iguring-hook-specs-impls-using-markers\n'
                  ' at /usr/lib/python3.14/site-packages/putao/pytest.py:27=
\n'
                  '\n'
                  'ERROR: Exit status is 3\n'
                  'DURATION: 1\n'}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4835

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

