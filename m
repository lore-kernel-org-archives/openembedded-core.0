Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 34FB571A70;
	Mon,  1 May 2017 14:06:40 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u65so23538009wmu.3;
	Mon, 01 May 2017 07:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3/8eAcpbLEFQ6TU7Yj7t9EbquH2MrmpgwsvI1F5cldI=;
	b=Yt96kuAcp3C0yzbpOKV7Y7SyEudUW+8bwiCqc3N94EU+Be9c2jZfSviA9lj4YmsBRS
	QxOdJ4DPZ+oObx8wwymU+GcH4j7ERz07skPi/WdwvsZDyZhcAjnW62g35Th4LtzWEPoT
	xnxNBuhpbTP0tqru35giD0yaxRy8mmowgPxJuCATmK/BiY4v9lojkARmY+Ta/4DWpDrA
	xBdjiAjKycz+ZgcE4o9uuRl134ZBXgRIgVa9zpr7WYHm3KbaIKkW4L6yBKEUUO9IH1fx
	Xg1x6CnjRgxElVQoNFQQgojaBWEozTu0whMPEdj5vf7LlDCpoXtbEB1EdQY02VYPa3qI
	ucqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3/8eAcpbLEFQ6TU7Yj7t9EbquH2MrmpgwsvI1F5cldI=;
	b=c4NdoKbfYyERsCpTOmVaxBmRA1sdfe26EBhAQ4p/oPc2Dlx+eW91cnosLANuo293Sk
	ye6asE8FqeSdVsdyjSqU8Da+gJ2CVRtAkOGczSQD1SGCcU5gzhsYUC6T3fXaChaMXxpb
	RcGwiAICKxndIyGydiGLUwTA+uSVSe9gc+gnsVQ+h2w+r7mcrK9XJWISibI+7tIprsZn
	9UGQoGS5C2xrmGPRtXI7BevLWv0/NXkx4azDHL09k3y3Buhcf0iE3msRaAOPztPGuvi3
	KAwdIt614QamXp3S0jMZeluX2pyI53v+pWPs3ioFxFQS4bbq7d/zGfQGDbBO+PjAeu4L
	GlJg==
X-Gm-Message-State: AN3rC/4pnfT/D1WtDjwlAnBwsy/6IkL2mxyjFaSAUBotuG7zbb7GdbPw
	82zJZcxt3GiYqg==
X-Received: by 10.28.30.9 with SMTP id e9mr1057wme.130.1493647601726;
	Mon, 01 May 2017 07:06:41 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x65sm11231295wmg.3.2017.05.01.07.06.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 May 2017 07:06:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 1 May 2017 16:07:06 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170501140706.GA2694@jama>
References: <527be78e-ad75-2221-06e8-18814bf55857@mentor.com>
	<CAK18fxHF1dPOAXSwFwtS0s_vaMo5--t4QS2dq8pBwbDPdFDmbw@mail.gmail.com>
	<CAC+thW0rVtEFKKoJChwLjK-2=aMmZuW5vRufJ9iaFXJt6JiEAg@mail.gmail.com>
	<1493635218.23535.34.camel@linuxfoundation.org>
	<CAP71Wjwwp9ca=4_V-U1NpnX+=5x1V82DS18FkxPAaL9qYknVow@mail.gmail.com>
	<1493638943.23535.36.camel@linuxfoundation.org>
	<2b56f841-8c90-64b7-b6d3-cf0c157451be@balister.org>
	<CA+chaQfvm5xdNEhF=v05VnUPiLZFea2pZkZakgmAF_mCF4v07w@mail.gmail.com>
	<1493643311.23535.40.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1493643311.23535.40.camel@linuxfoundation.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
Cc: openembedded-members@lists.openembedded.org, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [Openembedded-architecture] OpenEmbedded 2017 General Meeting
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
X-List-Received-Date: Mon, 01 May 2017 14:06:42 -0000
X-Groupsio-MsgNum: 96806
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 01, 2017 at 01:55:11PM +0100, Richard Purdie wrote:
> On Mon, 2017-05-01 at 13:59 +0200, Martin Jansa wrote:
> > I had to change the password on the login, but then it worked for me.
>=20
> I think someone promoted you to an admin which is why its working for
> you...

Yes I was after:
http://lists.openembedded.org/pipermail/openembedded-core/2017-April/136119=
=2Ehtml

but there were some more changes after that (which forced me to change
password to longer on today's login).

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWQdBCAAKCRA3VSO3ZXaA
HEvgAJ90HH7x3reBzWXBcjRtWFRh9EKtfACgoCTbSre5pcAw/ts3WoM3xFkhH+U=
=sgJD
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
