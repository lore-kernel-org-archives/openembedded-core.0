Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267C3FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 12:08:04 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11838.1777378079829744715
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 05:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aUMNEQyE;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 33A00C5EF07;
	Tue, 28 Apr 2026 12:08:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FFB7601D0;
	Tue, 28 Apr 2026 12:07:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2C3D10728A7C;
	Tue, 28 Apr 2026 14:07:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777378077; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Jwpd62JrfMHDLjAqMcQ/gXvkIhmsBN8SfQQIClBJIPo=;
	b=aUMNEQyEfvLphZF1ulnBjNRkydFfQZj8qXTQMhihhStoewo/CRmVJH/sTPjd428JaSSf70
	lXaH6IaVciAjwvkU8yl3X4VrDsTi/wSjl/7JzJQR9Q7nmdxJahIz5oNiNp4Pf2khXDj2km
	mWbbykHy63wiBa68seoDq8LHs3YcZN/BQ8qMIJWkMJ6eaBm/Z20mjRcXfDXHz1OFEWZxAg
	oih+jYNjBxlQOCMM4k+bmIYt53GCpDHS5ZXqj/tJOE2egN5q3aW58+cMmHvSSPYlvADCr0
	j/F9GrngbAwIoVOXARqT7R9bGYHml4uEDw8Z6HW6I/iXn/9xWYefthemlfKcxQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 14:07:54 +0200
Message-Id: <DI4RXZC2RRHK.1B7KLKZ3AQ6UY@bootlin.com>
Cc: <quaresma.jose@gmail.com>, <openembedded-core@lists.openembedded.org>,
 "Michael Halstead" <mhalstead@linuxfoundation.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Viswanath Kraleti" <viswanath.kraleti@oss.qualcomm.com>, "Richard
 Purdie" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] mirrors: switch Yocto Project mirrors to HTTPS
References: <20260427103040.1519121-1-viswanath.kraleti@oss.qualcomm.com>
 <DI3WQFOXA6GG.23KER0QY230XL@bootlin.com>
 <18AA3C050EE61D30.2188217@lists.openembedded.org>
 <CANPvuRkVsWWCmUtt=O821j0YH0mCirsCytTywEx7YD=Qu4TMog@mail.gmail.com>
 <b9c4ddd5ae72ae21ee0b6e12fb1a1f63661c685c.camel@linuxfoundation.org>
 <CAHyS93p8V+XudSUFToKGyOCARH2HrnQLhZbFdsGr1GciCy4cHw@mail.gmail.com>
In-Reply-To: <CAHyS93p8V+XudSUFToKGyOCARH2HrnQLhZbFdsGr1GciCy4cHw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 12:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236058

On Tue Apr 28, 2026 at 2:01 PM CEST, Viswanath Kraleti wrote:
> On Tue, Apr 28, 2026 at 4:53=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Tue, 2026-04-28 at 11:46 +0100, Jose Quaresma via lists.openembedded.=
org wrote:
>> >
>> >
>> > Jose Quaresma via lists.openembedded.org <quaresma.jose=3Dgmail.com@li=
sts.openembedded.org> escreveu (segunda, 27/04/2026 =C3=A0(s) 15:09):
>> > >
>> > >
>> > > Antonin Godard via lists.openembedded.org <antonin.godard=3Dbootlin.=
com@lists.openembedded.org> escreveu (segunda, 27/04/2026 =C3=A0(s) 12:40):
>> > > > On Mon Apr 27, 2026 at 12:30 PM CEST, Viswanath Kraleti via lists.=
openembedded.org wrote:
>> > > > [...]
>> > > > >   svn://.*/.*     http://sources.openembedded.org/ \
>> > > > >   git://.*/.*     http://sources.openembedded.org/ \
>> > > > >   gitsm://.*/.*   http://sources.openembedded.org/ \
>> > > >
>> > > > On a related note, it seems that http://sources.openembedded.org/ =
is no longer
>> > > > active. Could we remove it?
>> > > >
>> > >
>> > >
>> > > I also noticed that when I tried it, but I was unsure if it was inte=
rmittent or if it didn't even exist.
>> > > Add Michael in cc and perhaps he can confirm.
>> > >
>> >
>> >
>> > It's not intermittent, because the address still can't be resolved tod=
ay.
>> > I think it's safe to remove this addresses in a subsequent commit,
>> > and if there are any complaints, we can revert the commit.
>>
>> I know a bit of the history there and agree we should remove them.
>>
>
> Thanks for the confirmation. I'll drop them.

Sorry I forgot to cc you. I just sent a patch:
https://lore.kernel.org/r/20260428-remove-sources-openembedded-mirrors-v1-1=
-dbaea026dcdf@bootlin.com

Antonin

