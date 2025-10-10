Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7469CCD18A
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 15:42:27 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.11802.1760110943443995480
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 08:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JNPV8PZg;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8C79B1A127B
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 15:42:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5403660667;
	Fri, 10 Oct 2025 15:42:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45FB0102F21C8;
	Fri, 10 Oct 2025 17:42:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760110940; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=T/jMcYzRjX4n0u0s+Cm7gc00ymW88Wfs+MGZMZnGg7Y=;
	b=JNPV8PZgAfiYQlrE81eFQJrTIgTPyJCJITgCjArDxIZO3SUCT6Al0E4RDC7xG6TBg0iFnm
	jGc+OjsmPQWf0LolGKYx+hHzsz2bTG0vtcULREbVmKu9huuk772mGbXVAoLnlfMoOjey1u
	+h1BohSjq8/k92bQ3c2cwv5bcGX+DR3mtkiJ3q7xTtz3ZoBxr+fw9j8qaIqtYBmX/L/M3U
	tAlD9Kwq8gR0PqewsB0BDy76wrwP6J0vMG6v0f5SicqUFEVlrIsNoAWa0k+ZG8GeZpemNg
	iJx3aTuVuEfRy0qDJ7CI9534Cie8NPMAnXFRu4Af9k778tvoM6V/qmCgsrsgIA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Oct 2025 17:42:19 +0200
Message-Id: <DDER972NVZX3.1OQ244B88C5QQ@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/3]
 oeqa/selftest/bblock/fitimage/sstatetests: Fix changing MACHINE during the
 test
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
References: <20251006131454.846597-1-richard.purdie@linuxfoundation.org>
 <DDER4TNFACYK.197FU3Y7W8OXL@bootlin.com>
 <c62656752249cec0bdcf7699ff69f7471a118029.camel@linuxfoundation.org>
In-Reply-To: <c62656752249cec0bdcf7699ff69f7471a118029.camel@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 15:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224695

On Fri Oct 10, 2025 at 5:40 PM CEST, Richard Purdie wrote:
> On Fri, 2025-10-10 at 17:36 +0200, Antonin Godard wrote:
>> On Mon Oct 6, 2025 at 3:14 PM CEST, Richard Purdie via
>> lists.openembedded.org wrote:
>> > With config fragments, changing MACHINE in the test like this no
>> > longer works. Use the forcevarable override to allow it to work.
>> > This also needs a tweak to bitbake to work correctly, sent
>> > seperately. Whilst ugly, this avoids the need to start changing
>> > config fragments within oeqa right now.
>>=20
>> Why not move the inclusion of auto.conf after the addfragments call
>> in bitbake.conf? Maybe this triggers another issue, but I'm just
>> wondering.
>
> It would change behaviour, there is a lot of things out there which
> assume the current ordering and we don't really want to change it as
> the breakage is potentially very subtle and not obvious.

Ok, I also assumed along those lines... thanks.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


