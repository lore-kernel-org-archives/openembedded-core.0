Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC301C4167D
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 11:05:59 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.51189.1699268749265368539
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 03:05:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gnFCVRnA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.174, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c6ec78a840so57952881fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 03:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699268747; x=1699873547; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oRxLhqKuXuYOk7pb5VKuGdcwBbLOOb/Ru2hrm9hpb8o=;
        b=gnFCVRnAK0qdgRFxc4Oh8X+URB8V7CJ421s/2sYFwZ0/9Ga9kWq5a7O0+ns5hIj6IL
         3uofiFSh67jhnFYwzgZA9FYkjaQUQrLWQ6Ag6Y+ebvpaUI/AEhb0IlU0XFwRr8EIOFM8
         RO3cXESaje1E9vE0+h36OY1sRjLxYkRxl6MbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268747; x=1699873547;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oRxLhqKuXuYOk7pb5VKuGdcwBbLOOb/Ru2hrm9hpb8o=;
        b=UBarpI0YocpVjZZAz88PnBGw8YnddafBrXRucDsRwpjmY7qim4IDbzE5XaDRdmk/xI
         7fNB2hnem9gCYL5KpNKwjZb0gzjQAnsoJ1WIWUs1GWtCuZYtrQ7XhRpAUgIUfhw/aCxP
         VMOgMFA6UTB1aQ2TOu6mpjqnruj0vIF9xWS/NCYZJZBt6nbNEMBObgDSzOKpsPPAKHoH
         4yaxTggruICU5Ae7W7bPz9RoSytpwF6Od81hVjSZgSQwMKF5NVZsmLldDUD2S42PoU6f
         rog4Y7rmgaYC7EcLkAfIPE6ySzHM8FGtMd3C8GHsp06aim7w6JhXlu2XK+DSF56HKg5S
         qaFw==
X-Gm-Message-State: AOJu0Ywd3Sx34rYkIxKCEhrwj/5QwVES/pdExxifCJ530pXzUfUONIiq
	FTNt7LR4QESyWly/ZD7FPTURgQ==
X-Google-Smtp-Source: AGHT+IF4av6/GHR259M5p5p3/8m8G+avRHjysvA/NDxzPn1fdRiqhYStEI+oIrEwri1BFqm6sBP2jA==
X-Received: by 2002:a2e:988e:0:b0:2c5:38d:f80b with SMTP id b14-20020a2e988e000000b002c5038df80bmr21447293ljj.6.1699268747323;
        Mon, 06 Nov 2023 03:05:47 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1ccc:c310:74c7:1597? ([2001:8b0:aba:5f3c:1ccc:c310:74c7:1597])
        by smtp.gmail.com with ESMTPSA id fm15-20020a05600c0c0f00b00405391f485fsm12101887wmb.41.2023.11.06.03.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:05:47 -0800 (PST)
Message-ID: <bc84dc8a84bed4bcd8b27bf9f73451c38186ee7b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH][master] poky-tiny: fix PACKAGE_EXCLUDE
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Mon, 06 Nov 2023 11:05:46 +0000
In-Reply-To: <5A07D8A2-2FE1-4FD1-9468-0AF32FB335C9@arm.com>
References: <20231106103516.361162-1-ross.burton@arm.com>
	 <f772002b508b7a29fec7957f072a33dee36bf627.camel@linuxfoundation.org>
	 <5A07D8A2-2FE1-4FD1-9468-0AF32FB335C9@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 11:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190204

On Mon, 2023-11-06 at 10:55 +0000, Ross Burton wrote:
> On 6 Nov 2023, at 10:44, Richard Purdie <richard.purdie@linuxfoundation.o=
rg> wrote:
> >=20
> > On Mon, 2023-11-06 at 10:35 +0000, Ross Burton wrote:
> > > From: Ross Burton <ross.burton@arm.com>
> > >=20
> > > poky-tiny does a PACKAGE_EXCLUDE on shadow-base as the kernel doesn't
> > > support multiple users.  However it does this by assigning to an
> > > override, which makes it impossible for images or machines to extend
> > > PACKAGE_INCLUDE with their own exclusions.
> >=20
> > PACKAGE_INCLUDE?
>=20
> More coffee needed. V2 incoming.
>=20
> > > # If shadow-base is brought into the image, logins will fail because =
it
> > > # doesn't have the heuristics to work when CONFIG_MULTIUSER is unset.
> > > -PACKAGE_EXCLUDE:poky-tiny =3D "shadow-base"
> > > +PACKAGE_EXCLUDE +=3D "shadow-base"
> >=20
> > Does yocto-check-layer still pass?
>=20
> This is in the distro configuration so it still does nothing when not inc=
luded, but:
>=20
> INFO: meta-poky =E2=80=A6 PASS

Of course, that was the detail I was overlooking, thanks :)

Cheers,

Richard

