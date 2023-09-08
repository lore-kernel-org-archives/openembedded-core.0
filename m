Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0F1EE57D6
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 07:04:43 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.34210.1694156681070121408
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 00:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LETdwh/s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-31aec0a1a8bso1089157f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 00:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694156679; x=1694761479; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WmFYy528QndCEjFsnuuSXPJ5rPwPj/UfDx3Z64MqmI0=;
        b=LETdwh/szbH3C0VumXkoW2IBVKGFbV2bC/tT0bb71qL2YMMy7+i5H2gzP7o4zPYmgb
         uXnC/EPbgZdwVvO7PMN7+77kLVWvNOkA+Vz0XUZ38t4R19eFewPPUKheDBUfmQN+ZzvZ
         rw5wnyuV8AQtpn/O4OIP552MN9bk2ZlLH8644=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694156679; x=1694761479;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WmFYy528QndCEjFsnuuSXPJ5rPwPj/UfDx3Z64MqmI0=;
        b=BFb4ZbW7SnnnGpriAoIT052SLU+YtDZJrZkKqhENBqJgRdDUeuzpRDyjIGKJfk1Vsh
         iuhDAKJXhsFXmP0l9EAzJXS4sDSgfi9f8iwqc7Ub2CCWzrPniYGebStWRwt9y/LZBMZa
         WOWUyzZ+HMP/aqWknIVWgMgwZoaJ9YUm21TkLeNpoMPI4fDd33MHywxjrLLmQ7IZ0gAn
         gLC8GiN6cB/BZzDKwJJk1q/+4wMAR6KoOiBMA26eRx+L1jETRWyP/jMLaCBLD8EfBOvS
         dM2CaFnf/UCKSYxDD+hd7q2mMXtkOW8m5mmxNqX4/bu1LEQjmabr4xMXE4hsX8NUVLRM
         +Hxw==
X-Gm-Message-State: AOJu0Yx3T1+6TIZtMfJ9JGVi8RTy/sl2MKojZmERmmF8gpOaXPPlYySQ
	mr/vRzE0NdjNrc4HXoEm1HHs2A==
X-Google-Smtp-Source: AGHT+IE9agDF09LgCns8xK2u5f0S/6jaB/EdDiLuMIvLQeJf73sKuqK64SjRZvGGMFUIQP+6xQPYTw==
X-Received: by 2002:a5d:42d0:0:b0:317:dcdd:3fa2 with SMTP id t16-20020a5d42d0000000b00317dcdd3fa2mr1056439wrr.31.1694156679498;
        Fri, 08 Sep 2023 00:04:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f8cb:1f37:5b30:431c? ([2001:8b0:aba:5f3c:f8cb:1f37:5b30:431c])
        by smtp.gmail.com with ESMTPSA id l9-20020a5d4809000000b0031c6e1ea4c7sm1251039wrq.90.2023.09.08.00.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 00:04:38 -0700 (PDT)
Message-ID: <b69aa4b4a5f0257e69d7b96a4b80481476736484.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] classes: Drop ';' delimiter from
 ROOTFS/IMAGE*COMMAND variables
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 08 Sep 2023 08:04:38 +0100
In-Reply-To: <ZPq/ZOCadgGhzVBj@nuoska>
References: <20230907221120.3231358-1-richard.purdie@linuxfoundation.org>
	 <ZPq/ZOCadgGhzVBj@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 07:04:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187409

On Fri, 2023-09-08 at 09:29 +0300, Mikko Rapeli wrote:
> Hi,
>=20
> On Thu, Sep 07, 2023 at 11:11:20PM +0100, Richard Purdie wrote:
> > Originally these were shell functions but they have long since been pro=
cessed by
> > bb.build.exec_func(). Since we no longer need shell syntax, we can drop=
 the ';'
> > delimiters and just use a space separated string.
> >=20
> > This cleans up the variable and quietly removes any stray ';' that do h=
appen to
> > still make it in.
>=20
> I'm afraid many layers and recipes may be breaking with this because of m=
issing
> space in appends, e.g.
>=20
> IMAGE_PREPROCESS_COMMAND:append =3D "foo;"
>=20
> used to work, and now will fail. Fix is to use
>=20
> IMAGE_PREPROCESS_COMMAND:append =3D " foo"
>=20
> but I wonder if we could help detect these?

At runtime I'd at least expect there would be failure from an invalid
function name? Earlier detection is going to be trickier though.

> And I have dislike for :append when a plain +=3D would work
> and would add the needed space chars and still allow overriding
> the variable elsewhere when it is needed. But maybe that's just me.

We both do, I'd love to go through our metadata and reduce the number
of append usages. At least for the initial patch, I tried to avoid that
in this case.

Cheers,

Richard



