Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9464B7457A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2018 21:05:15 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id h55-v6so13466802ote.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2018 14:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gKptQkorJ1HjdkQ2cEBcBrSehDJUsYPJFIoK0bwKsnQ=;
	b=1i221bYZHMlxcbs7k3Jv3Ke3BI70+8PyaTw4732+enIb+UcKBBW6YWNsnrHCqXGrsU
	Hhsl9D90sNjFzFEOHvhE3CRdlHpEORusFSpW7ADZYJa849SDaZMrWKmE+h9AE2WAKjlX
	6MiZ8fkxzOmCRv60A72atwPDLKHV2vr0th21bvmCUxCtZxF5DvxFSMRZQIq7pmj0reLy
	0igxseGJo0UJc+yv/TqIabcw7UtyVhTq/Cc4NmlSZtmlIi5MmPxhR9Z3YbqZIk6jgDe8
	SBg1ksM4PWNCmowa7K36/1kt3Y7pIDKqozGygwYgEEuFq7OWvaWHPImSD8aS94H6csTt
	ljgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gKptQkorJ1HjdkQ2cEBcBrSehDJUsYPJFIoK0bwKsnQ=;
	b=A2klHXoHnEVsCbRLnWYj2MxHoJky5Vh93Q6TAOFcwigcgougTOI8D2959UjDjeVcb8
	8GAq3k9fwIVk4OFM0COFUikWVcG/GJgU+dJ0jG/WTvDHUzD8BWCoy2kEdBisVm5F6qp7
	F3DZG/hUDWvWbReFG3ZAMKKyZCeUjfWiDASVd3r1WwvjCKZxM+Bk5tXj62vfG2N1DKxP
	VgrZi1+pbMXWJIOsFvis1jJ0bbEZgszZZNMq0uazDgC+PomvD0/Fm5+OO+eqph+4yiaU
	c5b5phzI8ol5C8AW8ikmXbejwYOIVhct4IHDtOUlRBOPcvLBQcZupg6T3qydSIZ2luZM
	3Cwg==
X-Gm-Message-State: ALQs6tDNOAcrg2kZfObm2KvRND9mmVkyVNGXX9wZbnQePkczaeemT67U
	2VJinJ+mb56IjditAMQbqndrpQSu
X-Google-Smtp-Source: AIpwx48tk5oj1VPmaYRiY+jVhAN1Xx5B2XvzEejZelzCfWqt6DzmJ9o2UpcRL9ffe7wW2hpyKayMaQ==
X-Received: by 2002:a9d:3c0a:: with SMTP id
	q10-v6mr7123514otc.156.1523739915843; 
	Sat, 14 Apr 2018 14:05:15 -0700 (PDT)
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com.
	[209.85.218.45]) by smtp.gmail.com with ESMTPSA id
	c202-v6sm5116614oib.20.2018.04.14.14.05.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Apr 2018 14:05:14 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f45.google.com with SMTP id x9-v6so11315098oig.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2018 14:05:14 -0700 (PDT)
X-Received: by 2002:aca:3cc2:: with SMTP id
	j185-v6mr11928238oia.315.1523739914271; 
	Sat, 14 Apr 2018 14:05:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:3fe1:0:0:0:0:0 with HTTP; Sat, 14 Apr 2018 14:05:12
	-0700 (PDT)
In-Reply-To: <BN6PR1201MB01959BEFC4A5E0745C4211E38BB20@BN6PR1201MB0195.namprd12.prod.outlook.com>
References: <BN6PR1201MB01959BEFC4A5E0745C4211E38BB20@BN6PR1201MB0195.namprd12.prod.outlook.com>
Date: Sat, 14 Apr 2018 18:05:12 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrL3p6+uiUWi1R_Rxe0OXd+6HnOcrP8e=dQ+G-6rmHjUg@mail.gmail.com>
Message-ID: <CAP9ODKrL3p6+uiUWi1R_Rxe0OXd+6HnOcrP8e=dQ+G-6rmHjUg@mail.gmail.com>
To: chris.laplante@agilent.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Custom progress handlers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Apr 2018 21:05:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 14, 2018 at 11:56 AM, Chris Laplante via Openembedded-core
<openembedded-core@lists.openembedded.org> wrote:
> I have implemented a simple custom progress handler in
> bitbake/lib/bb/progress.py. It=E2=80=99s designed to handle bar-style pro=
gress. To
> use it for my shell tasks, I have modified =E2=80=9Cexec_func_shell=E2=80=
=9D in
> bitbake/lib/bb/build.py. It=E2=80=99s implemented as a new value for the =
=E2=80=9Cprogress=E2=80=9D
> varflag.
>
> Is there a better, more extensible way to add a custom progress handler t=
hat
> doesn=E2=80=99t require modifying progress.py and build.py? It would be n=
ice to be
> able to specify the name of the progress handler class to use (e.g. via a
> [progress-class] varflag) and then have build.py dynamically instantiate =
it.
> Is that possible? If so, would OE be interested in a patch to implement i=
t?

I see no problem in adding it; I am curious about your custom handler
as well :-)

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

