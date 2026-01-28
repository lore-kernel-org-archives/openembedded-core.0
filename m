Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4023CD25B7B
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 13:40:43 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13085.1769607634518088332
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 05:40:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gj08Vo1B;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D8146C211E6;
	Wed, 28 Jan 2026 13:40:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3EFA56071F;
	Wed, 28 Jan 2026 13:40:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EC836119A8801;
	Wed, 28 Jan 2026 14:40:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769607631; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6U2Fg5ZlHY1JFqfPzJBnmzjIQbUyRN8PIX4jartRe5M=;
	b=gj08Vo1BP4VkXPW9KhAHBY4yIpC1C+B9dgp3zrqHY5NwqwNWSmO1779uLAAN7f81Nu4Rvw
	NlbjdW176Zhl9FHighgFWDHNrzy/PsCUtGlpXfbUi22QEm7o18i0/m4J3ze1GqmpvIKquI
	56K+AIRzHHhSzG575L5/s13N+JW/P5h1foUiN5/q4qvvnsTVlOCt/1q7Umnbw3fs3IHKz1
	x36lwq6uc+2RSXw3mDodZcC8KmxGWmSfVaPmU7s1Y5IwGWYrf09ZGBjjqhuJuloMCEXrAk
	LZ6GEhvvXI4vtsaHPrdUiQwddfjlmCjXSmWN1hpFyjJZUoF5EOl+fz3YLY7M7Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 14:40:27 +0100
Message-Id: <DG09JTACVG5A.LITESNITSRG3@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-pyzstd: Upgrade 0.17.0 -> 0.19.1
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <leon.anavi@konsulko.com>, "Martin Jansa" <martin.jansa@gmail.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260123084336.3061764-1-leon.anavi@konsulko.com>
 <CA+chaQcjfc2w1Tt7L43VR4H=fV8NM9k8h8mNZwjPp3FejQr4ag@mail.gmail.com>
 <CALtQ3O3BZwWd55xXNKoVNkYsHmvDHZQ2Didg=cO9v9WRPkb8CA@mail.gmail.com>
In-Reply-To: <CALtQ3O3BZwWd55xXNKoVNkYsHmvDHZQ2Didg=cO9v9WRPkb8CA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 13:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230095

On Tue Jan 27, 2026 at 10:20 AM CET, Leon Anavi via lists.openembedded.org =
wrote:
>
> Btw on a separate topic: I haven't seen any remarks regarding my other
> patch from Friday for updating python3-wcwidth to 0.3.1 but it hasn't bee=
n
> picked up in master-next yet. Please let me know if any modifications are
> needed.
>

Hi Leon,

I believe it was first ignored as it was part of the same series, so at
first glance we can't be sure if there is any dependency between
patches.

It is in my branch now, so it should soon land to master-next.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


