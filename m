Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7356A72F94
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 13:20:15 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id r45so36697154qte.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 06:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HBRg7CJ9UQLpndAkQZcXf76G4Wi/fFf6lbqLSBkpoHA=;
	b=gJXJ7/KsmhT74eWfyzHbHJrJAIQKEBIGRAqHKGdccpqfeY1nqZRBCN3Y9ZlaXbhGgd
	BMuUU6qvGKKrOJ250EiGqE+p4alYx7cPRbcQ6puZDsopJ+4PqVgHCYmuDol4SUmY5E6g
	SLSf+UmmKbLfxT3qEYarmMfNjyGJ7Tq9gLN5/rTin5QsmjUEvljIQ7zf9oDRmWavtqpP
	RvS7k45+Uqj7ACBeO0jd98N/JchESvmXzQYuhu39F+AvRhYXjG8mGHLg7+oo0zpHOuHl
	eu1ESFo/GPGKJJougDGr2N/VtoHH9V0/LcysISbpUR3oAid9pnONLhii76AA0YKeS90Q
	ShCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HBRg7CJ9UQLpndAkQZcXf76G4Wi/fFf6lbqLSBkpoHA=;
	b=hPo2O2fKJ/a3oQetAt9TPTyIb0pqyvMBoUfnz+NLe1zfMG4KmP+Kif8lZnVe0qZJRQ
	DlErKSe38nczgCOntj2CdtoxMLWMua+jUksJJnAHNk6G9nTBUVYSYAGpuupcUCyKc+6P
	uzpkT0fJAfQ7o3Q2orid6TYaUHhdxatif3Xemmo+BiLOMdLPcgpLXpFNTxjhA9QU5uvv
	aUsWRS9BFNILWodgRBdR49n3ON9n6gVB8K70PqsMbH8lm7ba4GEKBdtgu0w9jiKJfJk5
	jA7o19G2/XX3s8bp7ryBBWT3hZ2Ha+SKRO2BnpIrExUtem1JHJO2TFKAgLYO7033OeNz
	Q+tg==
X-Gm-Message-State: AFeK/H2vuRR+vCuRz0b55l9WeOAkIeReukrTAdYOQdtC3vrIVgpVlYNVNTgYBkxdRJ2Z5rMfZ2MEc9hBCIpswjf5
X-Received: by 10.237.43.69 with SMTP id p63mr19961548qtd.68.1490620817106;
	Mon, 27 Mar 2017 06:20:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 27 Mar 2017 06:19:56 -0700 (PDT)
In-Reply-To: <20170326211438.GI15664@denix.org>
References: <20170326200813.23705-1-otavio@ossystems.com.br>
	<20170326211438.GI15664@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Mar 2017 14:19:56 +0100
Message-ID: <CAJTo0LZ_V3p43c55r5cjhxp8K5ABf-001Dx=S-V0GtASPp2-tQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2017.03 release
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
X-List-Received-Date: Mon, 27 Mar 2017 13:20:16 -0000
Content-Type: multipart/alternative; boundary=94eb2c124cc44ca56d054bb63438

--94eb2c124cc44ca56d054bb63438
Content-Type: text/plain; charset=UTF-8

On 26 March 2017 at 22:14, Denys Dmytriyenko <denis@denix.org> wrote:

> At least 2 typos in the description...
>

Typos aside, this is past the M3 deadline but RC2 is running late, is there
a good reason to have the upgrade in?

Also what boards has it been tested on?  As it's from Otavio I presume the
Freescale boards have been tested.  Denys, have you tested this version on
your boards?

Cheers
Ross

--94eb2c124cc44ca56d054bb63438
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 March 2017 at 22:14, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=
=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":4bp" class=3D"a3s aX=
jCH m15b0c7942ea3d747">At least 2 typos in the description...<br></div></bl=
ockquote></div><br>Typos aside, this is past the M3 deadline but RC2 is run=
ning late, is there a good reason to have the upgrade in?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Also what boards has =
it been tested on?=C2=A0 As it&#39;s from Otavio I presume the Freescale bo=
ards have been tested.=C2=A0 Denys, have you tested this version on your bo=
ards?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Cheers</div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c124cc44ca56d054bb63438--
