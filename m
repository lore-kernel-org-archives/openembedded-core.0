Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6533.1792570177128601670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 01:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iD3rpNsQ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B5B1F4E4125C
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 08:09:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 83039606E3;
	Wed, 21 Oct 2026 08:09:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27C0810328934;
	Wed, 21 Oct 2026 10:09:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792570174; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NWCQ0QoVh7hu/hoLg8nc2zbBNX1JUMOqbYg7Pu1qCag=;
	b=iD3rpNsQn9YsdxLonADE/6zYDcMYVox+wC6lO02e2lWf3W0wH197LwhSJuZNkOkuHmGD04
	geOdgwtxDdaTpphUIcIY/vZrMfDTFsENo8pGILhJHGA0FyhPQWItKy0MREBJLzWMJXpVlW
	bkKyw6cqOB4JIZQtps2NbJVz7fYHkryF7nbYAAJoHth4ac+xsI8BlLH48laTrh6MDbTpqK
	Ff0UNWerD7w+zMrRxBBTMjGpZ/4vSic5yEqZ0hppAX4iKPmkfeLCHbFVlgicoA9+/M5lCO
	4OIX8a6lVPkXSAUFUdQN5uQLdNhkXnLNn+dUCJOg3C8PLkGr+DByfqLUfqzI9A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 10:09:32 +0200
Message-Id: <DMAD3CPKX01M.254GYOV9Y6SJG@bootlin.com>
Subject: Re: [OE-core] [PATCH] python3: Fix build arch reproducibility
 issues
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261020121236.1426862-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20261020121236.1426862-1-richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 08:09:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248372

On Tue Oct 20, 2026 at 2:12 PM CEST, Richard Purdie via lists.openembedded.=
org wrote:
> The build arch leaks into some of the installed python files. This tweaks=
/adds
> some sed expressions to resolve those references for the target and impro=
ves
> reproducibility between architectures.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---

Hi Richard,

It looks like this is breaking a ptest with musl:

Failed ptests:
{'python3': ['test_implementation', 'python3']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1405
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1416

Any clue about the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

