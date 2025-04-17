Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B0EC369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 11:04:17 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.6023.1744887853724328600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 04:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UOuMQE40;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf257158fso4454595e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 04:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744887852; x=1745492652; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BqeteCxTyi0OwkckcLq/crpeBC8aACpbGfM594B1lwg=;
        b=UOuMQE40sujMYdW0wZGjjXi2bOBdd2G5oiJZovPSQX+7rbtv2azE3vSPorIkUywJa/
         +hxVus7xd0djVu6ixt6EtqoDwQ1Flix/F0c3YqpAku+0rYSUnIqK3E7mUN3m7zbtX1Nb
         DaM10D4oYytEOCIwqWmQLM6xSZ/aYdT4BRbvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744887852; x=1745492652;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BqeteCxTyi0OwkckcLq/crpeBC8aACpbGfM594B1lwg=;
        b=Ps/ziKkelBTXNuAXHjrJFdZDkUA/wPsquI3zvbx7i87VGmGV4ftvfjgBfKFHcS3Jbu
         gEz3UO5y2oIOEJMaJuGpr0+nUJGNeJCgFwU42bd75AnaAH0K0/hC07YilxmZibdySKkV
         2kmomfM//Q6+5I5yvxq0d2at8AQRhL2erezmhqeD3lGE0FTLNWzd/UzjvACt1U5yZng/
         7HfIhnwllsuP1DSsvKFJNYs/PTlzplJOxWRvJF+XYoTY5JTBdr0GltyWlgPhKdeA+2Bo
         3I0QTV8C7VFlX5ADW9WcCgzGVhuKcD7L67DtUNLT/vWSo3dZ1BeHGaoZupWuhNzGs07Y
         LYqA==
X-Forwarded-Encrypted: i=1; AJvYcCWWydf15UR/C+STnRdslQJpsUOY9/kXxKM+lGOWCU4z1+3gV3SompAeTkvEvWuCU4AccwhJX6hyop0+NwS7jVVuiQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxOBrlaf+za0Sb9QD9au5OZy5yuJ272ckBybW4m/ZDvvEm/MG6b
	YmnwVkJlEv93Eg3FtHkjnaxzTt7ldX+qViK2TlcJtfTA9nPrvAURVfCjEpz0rE0=
X-Gm-Gg: ASbGncsuygieZaU7La8hNMTKJfL0UDYBwyXlrmswiIhuk1xv7Lo4FV2aFAY3ahfHswh
	Z5gqsaOw5OnlxGqjTWfEeRvoh4uAfHsTPt+GnKbk+Sd/LkwL0QfciRZimWHYuXG+gHA+Il/CmwN
	y0mC8L0/l29JSoirRQw39o+Gmh5kjqVShatUdmVT8XQVlxJy0gMMtk3rKra+xpYUWQP/8rteh1X
	JbNcx9WroTmwvb61yFRSqSPVgKZ5FaW76GpFJbkvrysyx+wDZ5oKffgS4gsUDFafO/SARNZDxhv
	PUPlTiZ3sOwKWL7bb7eCnIYRoecWTB9q4aSSY4viK3qJxa3GH0e5qrU1Dq4tLavPiz6PtAGm0v9
	upi7Qzm/p2iQYqvbISICVNBFtFNftDA==
X-Google-Smtp-Source: AGHT+IFLro1DXUrTgacq789zU2kzISK+EvRj4QykOvpzniCrQzEkgXOTQ2dOv9V/0p1tca9XSDeImg==
X-Received: by 2002:a05:600c:4694:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-4405d5fccf9mr51649295e9.3.1744887852037;
        Thu, 17 Apr 2025 04:04:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2c08:678e:aaf2:4c3a? ([2001:8b0:aba:5f3c:2c08:678e:aaf2:4c3a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44034fca7a3sm42127315e9.0.2025.04.17.04.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 04:04:11 -0700 (PDT)
Message-ID: <1264db75faf2ae16362f1f05ea2b6b77e0fb7616.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/sdk/sdktest: Add test discovery across
 layers
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chuck Wolber <chuckwolber@gmail.com>
Cc: thune.a.tran@boeing.com, openembedded-core@lists.openembedded.org, Chuck
 Wolber <chuck.wolber@boeing.com>
Date: Thu, 17 Apr 2025 12:04:10 +0100
In-Reply-To: <CAB=6tBQsqNJBqFsocxDQM9sOwz5S3w5HqkOO2cLuvH8OmSQ4kA@mail.gmail.com>
References: <20250416164134.399-1-thune.a.tran@boeing.com>
	 <dd0877909b1240d999dae6979ce1efa269180173.camel@linuxfoundation.org>
	 <CAB=6tBQsqNJBqFsocxDQM9sOwz5S3w5HqkOO2cLuvH8OmSQ4kA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 11:04:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215066

On Wed, 2025-04-16 at 21:39 -0700, Chuck Wolber wrote:
> On Wed, Apr 16, 2025 at 3:07=E2=80=AFPM Richard Purdie via
> lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>=20
> %< SNIP $<=20
> >=20
> > I suspect this causes some regressions in our automated testing
> > unfortunately:
> >=20
> > buildtools:
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/1396
> >=20
> > meta-mingw:
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/7/builds/1430
> >=20
>=20
>=20
> Would it make more sense to add
> self.context_executor_class.default_cases
> to the list of paths returned by get_sdk_paths?

meta/recipes-core/meta/buildtools-tarball.bb does:

    cases_path =3D os.path.join(os.path.abspath(os.path.dirname(oeqa.sdk.te=
stsdk.__file__)), d.getVar("TESTSDK_CASES"))
    testsdk.context_executor_class.default_cases =3D cases_path

mingw does things in a different place, setting:

    default_cases =3D [os.path.join(os.path.abspath(os.path.dirname(__file_=
_)), 'cases')]

in meta-mingw/lib/oeqa/sdkmingw/contex.py

I think we need to add something which represents the name of the
directory for cases, i.e. "sdk", "sdkming", "sdk/buildtools-cases" and
then allow this to be passed into your function so regardless, it
allows customisation within a layer.

Just adding default cases to anything in the layer is going to always
add the layer's test cases which isn't what we want (i.e. your layer
would add to buildtools, mingw and sdk).

Cheers,

Richard

