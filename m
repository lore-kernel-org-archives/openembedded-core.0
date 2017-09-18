Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7ECF177F34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 08:36:48 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id n64so4634131wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 01:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=XgPcyXdKzstXi2w8pFhElAomUzhAiUF3T2u/qfs9yfA=;
	b=R5tylmZY5JTEiygV0XxCZV2wRWR4iAy85qWL1ZfAvaeeEbqqFolJ6KkP9H50QWoKTn
	79zp8z5vdC0Gnhnj9iavfbtowYh8IjiYdaN7q/UsxF7tRfCL6hszv127zAm7txZbOgft
	+Oi3niM0W8MkyDxS1vfl18wX5SMJ0MzrDfTVQ1bt3IuCcrN/gSWPs3JrjS0ve0V3LWtF
	E83mHnIXpn0jFgI1UUc/Fu2AkluqM1xc3t9XtqS7pzksZsdmH/h0gZYMfsEAEO8TuQgA
	y5xccYwab3az0G8X9jlASvSW53shD2tYUl17bByiW8vtgaveWUNxv21XePZ/+KdIfKTA
	EZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=XgPcyXdKzstXi2w8pFhElAomUzhAiUF3T2u/qfs9yfA=;
	b=Gl2uTTClEyQSsu0he6GGCAKYx3lXwd7P5rxZxhC+iZIffK54HyyD6oM4h9/hKCg++s
	b8OAzyLPWmO9gDONiMYfzE1xw+UVTxxy53waID0e4RRouon1Vb+3PYJ2I5NaArL6A1fy
	dfHGAX4dbWcSGJRypTeyOFaP5Gx6PhsYtxpLhreh7iYmlgdPCaXOfFfCsm65KQK8JV71
	Cm1JEo/eg+jlwFhgYZQbOYzAoUsDyt3Q1niEUPp5eol3U8vakHRTt8L4jYpTeBcj83FG
	WJRvpq+G+IrcGrufMEQMUWVnf4C3T7/51fsUqIeN2StewkfQjhdF6IPYimQqkTmwKBuV
	jasw==
X-Gm-Message-State: AHPjjUiCsRt469mh59BdPzpBptUZg0hAJ4ujf5GfFPMAQD8q/a2xp4+1
	uvo0Ml+NuZX5jw==
X-Google-Smtp-Source: AOwi7QC6dyFoEwRKqXDf7tqB91zxmDqpIXr2GKn6qpC0tYmfNo0fQjx9CqtBeoO5dLTX2lZW91eHxA==
X-Received: by 10.223.155.157 with SMTP id d29mr113147wrc.24.1505723809296;
	Mon, 18 Sep 2017 01:36:49 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r14sm6147477wra.97.2017.09.18.01.36.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 01:36:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 18 Sep 2017 10:39:15 +0200
To: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <20170918083915.GB3340@jama>
References: <20170911203056.22156-1-otavio@ossystems.com.br>
	<CA+chaQcUnbBq_f3zkAOxSF_E8M9RUMSaefncSgF6Hdt-j+Q0qg@mail.gmail.com>
	<CA+chaQec-cL6x3i3TfOi7yBhmCQ9Gf=-4jXkXqJ2-yJQmPmcmw@mail.gmail.com>
	<5e66c357-fda0-17d8-1d78-5b877fdc47e5@gmail.com>
	<CA+chaQfdgGcWAc17f=epK8s3q1=h+voUUc4sNJSLdtu_5SbOfA@mail.gmail.com>
	<1095f2c9-3ff8-bf71-4b6e-707111a4445c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1095f2c9-3ff8-bf71-4b6e-707111a4445c@gmail.com>
User-Agent: Mutt/1.9.0 (2017-09-02)
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [U-Boot] [PATCH] u-boot: Upgrade to 2017.09
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
X-List-Received-Date: Mon, 18 Sep 2017 08:36:48 -0000
X-Groupsio-MsgNum: 103039
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Content-Disposition: inline

--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2017 at 10:31:05AM +0200, Marek Vasut wrote:
> On 09/18/2017 09:54 AM, Martin Jansa wrote:
> > u-boot-fw-utils-cross is broken for at least a year, if it breaks a lot
> > of boards, why nobody complained yet?
>=20
> Didn't you say it worked for 2017.07 or did I misunderstand that ?

u-boot-fw-utils did work, u-boot-fw-utils-cross no, read it again:

And that u-boot-fw-utils-cross was broken even with Yocto 2.3 Pyro and
2017.01 version there, maybe it's time to remove cross version? As
nobody is using it and it's not tested?

--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWb+GMwAKCRA3VSO3ZXaA
HCmIAJ9V3yDTuFfygEK2n+85TXPyBStPnQCfQO2xk33S5TFA0qet1gPag6obuhk=
=IY/l
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
