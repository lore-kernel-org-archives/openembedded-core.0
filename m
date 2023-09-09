Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1175BEEB586
	for <webhook@archiver.kernel.org>; Sat,  9 Sep 2023 10:46:17 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.14339.1694256368762077568
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Sep 2023 03:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gA3ZBWJF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31c3df710bdso2583191f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Sep 2023 03:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694256367; x=1694861167; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BH6Rk/f3Peqadp6f5uGbsQmRL5THQJOQo6SGCKVlFLY=;
        b=gA3ZBWJFFnmXIJBw/JfAnK5FhC+yTYqKTrIshfrMEvZXkWSX/0eW4p0aKUTB4+pFkA
         hubEnQOJmA/jDydwgA7JlxxlG1QSfBEo1xkbJlFfrEj6l+hkQ8IfUUFlEaLB1VbAJazZ
         HkXcbW0WR9X8aOcl1h5GHuygM/o2oe/ueu9R0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694256367; x=1694861167;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BH6Rk/f3Peqadp6f5uGbsQmRL5THQJOQo6SGCKVlFLY=;
        b=uRK47YxC7SUq3c3waQ6+6o/BmHgtea3A4dgdN0GGZv+4f77GBVKBBfIfoJxbmxUNYz
         +1uGCiHNRlnXs4Bff+8n4I7IPyVgE0jpBWzieh06mu6JZN8mRl08iDszImxTGP/sbkH1
         B9iFYfK9/m0cSgeK7Y/CJdU3tf6aKreNex0C8tI4/ixJllc5JR5A4dGR1SDgxpLjaDqU
         QqecuuVMdkI1NDCPcea0y+eczISStmRscWzq4wwfTNtK+ITHYtxwFLmywSJCJ5SqFic0
         pvq4HWQCwOGXnf8+UTBWF/X/IuVaUdDWieNXLe4QBhjhManOsx2w/oUSaHQ1/uj/ioib
         ehIA==
X-Gm-Message-State: AOJu0Yx5JPaa0/nUxIbrTTKNzeXjg3VCcCMwZBespJra5Wo3wPmoMpQB
	ENYZeyU+fMAfUaBfNdhJQTb0d7n+HcXLE9IUzyM=
X-Google-Smtp-Source: AGHT+IFwYadoP9OFesVi1NCQrDXOtp90OjZy6zfU14dICNuDCf9/oOZvB9MaUjX/rCyZQ7jpQQuZHw==
X-Received: by 2002:a5d:4702:0:b0:319:8430:f80f with SMTP id y2-20020a5d4702000000b003198430f80fmr3228375wrq.49.1694256367194;
        Sat, 09 Sep 2023 03:46:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d1d:16cd:60c5:6f5e? ([2001:8b0:aba:5f3c:d1d:16cd:60c5:6f5e])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4c82000000b0031aca6cc69csm4467798wrs.2.2023.09.09.03.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 03:46:06 -0700 (PDT)
Message-ID: <a77e2b059ce3d35507567272bd23c6f5c3348684.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] classes: Drop ';' delimiter from
 ROOTFS/IMAGE*COMMAND variables
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 09 Sep 2023 11:46:06 +0100
In-Reply-To: <DB5PR02MB10213B9A33FF911CE0A3E298CEFECA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230907221120.3231358-1-richard.purdie@linuxfoundation.org>
	 <DB5PR02MB10213B9A33FF911CE0A3E298CEFECA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Sep 2023 10:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187445

On Sat, 2023-09-09 at 01:32 +0000, Peter Kjellerstedt wrote:
> > =C2=A0def populate_sdk_common(d):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from oe.sdk import populate_sdk
> > @@ -372,8 +372,7 @@ do_populate_sdk[vardeps] +=3D
> > "${@sdk_variables(d)}"
> > =C2=A0python () {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0variables =3D sdk_command_variables(d)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for var in variables:
> > -        if d.getVar(var, False):
> > -            d.setVarFlag(var, 'func', '1')
> > +        d.setVarFlag(var, 'vardeps', d.getVar(var))
>=20
> Was this really supposed to be part of this patch? It looks
> unrelated.

It is very much related. We turn these variables into "functions" and
pass to the shell parser to determine dependencies. With the removal of
";" as the delimiter, that no longer works so we have to do something
different.

Cheers,

Richard


