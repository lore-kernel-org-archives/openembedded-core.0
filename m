Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F3E9EB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 08:08:23 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.6263.1686730102903562092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 01:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=JRlbgV7v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f660e57123so5936107e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 01:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686730101; x=1689322101;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4PcrtYWLRuPTgsSqtW22DewXr9N+UWWWd1QgKE3H2OA=;
        b=JRlbgV7vYKgrvswOOCHgmrdHn3TwwrEhDaIpJWjPolJTxC/Lrul5ZYU7JsSitCEFAF
         OYt5scslo59S405Do9ZXCrNai/bo+UfLCRq+otBYHtP3j8n5BSj+ZHZZNClOhLHCJlDW
         qkJl7ML7oZdvgRh50PFty9GC7PM7wkCfYqEF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686730101; x=1689322101;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4PcrtYWLRuPTgsSqtW22DewXr9N+UWWWd1QgKE3H2OA=;
        b=Hee1dbJLsvl2SBD2bm8lGJcvG9nymWCC1v7N5Dl5eEsen1Pebva0tYyqwgULemnMqI
         ErJp2yXMCEj5EvbeQjUIKuDq0QjIfOnoktxlo8ipkQDaH2dAhZZZr6QLi4v0CtrCd1M9
         tjfv49GfrQ0D1sANh43rFMFNvWNWnhHIt/qU0gSccoe3MjE7YH2bqmYm5M/A+D/lssNe
         352NooNvZqgYsz1wGM798EUQrGww384TtMPiX/4vMeHbjKToeSb+gHNV+Y06rk2PXUc7
         NU+2/BHX5Isf5KtTfaqrIkv5A9g492GT+25UYyg/eeWGWUJoysZxMLXwbJnr0wSTt6q1
         pJaA==
X-Gm-Message-State: AC+VfDz/dDP7aKXHaVYj3tKnIK6OSfOb/7iqjMFF6lJ7X6GotRh9pTGw
	2niw5fr5C0+NeMsRe5386d/BBQ==
X-Google-Smtp-Source: ACHHUZ4PY0o6yELgeT4V4xYBcJ2T1VbkXdLuR1VcmJsp4c1AnXHNstGnWYa2uLmWXLJw8EVT1aNJuQ==
X-Received: by 2002:a19:9155:0:b0:4f4:d538:3450 with SMTP id y21-20020a199155000000b004f4d5383450mr7757691lfj.49.1686730101066;
        Wed, 14 Jun 2023 01:08:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5d56:2e19:9720:bd3b? ([2001:8b0:aba:5f3c:5d56:2e19:9720:bd3b])
        by smtp.gmail.com with ESMTPSA id d8-20020a5d6dc8000000b0030aec5e020fsm17345094wrz.86.2023.06.14.01.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 01:08:20 -0700 (PDT)
Message-ID: <8d570279eb2f9832a1576a1aeeb79098a0cba175.camel@linuxfoundation.org>
Subject: Re: [EXTERNAL] Re: [OE-core][PATCH 4/6] weston-init: fix the mixed
 indentation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randolph Sapp <rs@ti.com>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "reatmon@ti.com" <reatmon@ti.com>, "denis@denix.org" <denis@denix.org>, 
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jun 2023 09:08:19 +0100
In-Reply-To: <a834239b-83d7-11cf-3ecb-c2ef53b8e6ab@ti.com>
References: <20230610011339.3716428-1-rs@ti.com>
	 <20230610011339.3716428-5-rs@ti.com>
	 <DB5PR02MB102136F50D6C9E9121C9FD08FEF57A@DB5PR02MB10213.eurprd02.prod.outlook.com>
	 <CANNYZj99QKDuDc7oPaytFOUAeaiSL9y6WMT2Dmo5nLUTNNOLKQ@mail.gmail.com>
	 <DB5PR02MB10213D04533C11ED783E5335AEF54A@DB5PR02MB10213.eurprd02.prod.outlook.com>
	 <CANNYZj-UnVQmJYeYY=zHq2xEKXZXoSNJtraAor1HEkdGVqJFGw@mail.gmail.com>
	 <176801038AB94927.4582@lists.openembedded.org>
	 <a834239b-83d7-11cf-3ecb-c2ef53b8e6ab@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 08:08:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182739

On Tue, 2023-06-13 at 20:16 -0500, Randolph Sapp wrote:
> On 6/12/23 14:46, Randolph Sapp via lists.openembedded.org wrote:
> > On 6/12/23 05:05, Alexander Kanavin wrote:
> > > On Mon, 12 Jun 2023 at 11:58, Peter Kjellerstedt
> > > <peter.kjellerstedt@axis.com> wrote:
> > > > Well that is of course an option, but then it may get messy if diff=
erent
> > > > people have different preferences and start changing the indentatio=
n=20
> > > > back
> > > > and forth...
> > >=20
> > > I suppose changing indentation needs to be justified by for example
> > > achieving consistency in the same code block (as it does here, which
> > > is fine), and it never should be mixed in with functional changes.
> > > What I don't want is lots of empty code churn that doesn't actually
> > > make things more readable than they already were, and is more or less
> > > an exercise in pedantic neat freakery.
> > >=20
> > > Alex
> >=20
> > I frankly don't like the concept of mixed indentation in the same file,=
=20
> > let alone the same code block. The only thing really driving me to=20
> > change it here was the lack of git attributes to define the project=20
> > standard, nvim is attempting to enforce the 4 space standard from pytho=
n=20
> > over the entirety of bitbake recipes (which I think is fairly sane), an=
d=20
> > the variance of standard in this code block.
> >=20
> > I have no preference. So long as there is a standard, I will bow to it.
> >=20
> > Randolph
> >=20
>=20
> I noticed master didn't pick up any patches past this one. I take it you=
=20
> want me to reformat this to the current tab shell block standard?

Yes please. I stopped there since at least at a quick glance it looked
mostly tab indented and this changed it to space which breaks the code
standard for oe-core. Whether we want to change that isn't something I
have the time/energy to get into right now. If I take it, I'm opening
the gates to many more such changes. There are views on both sides and
people get upset about various aspects of it, me included.

Cheers,

Richard



