Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0810160806
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 20:25:24 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id g16-v6so2995584ywk.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 13:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=dqoy0hsA2/an3SlcCG2Kx5iPSFsvJFMNBxKRZ05Ur9E=;
	b=IzuYGoeERnbctXlsKRhuYwkbhtJX0jvyi3kBIvnyzFABlWSNjOK6E6k934D2/ynfUA
	11Qz81e49ddbhOk6CKCBvDaksKRQFB5vrcPB+MymITkAyseKLqVWgmDjvRpZ4JtTCSoT
	M7IKyLYKtRndDteYU2it/kj8XsbrIRnQpd+qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=dqoy0hsA2/an3SlcCG2Kx5iPSFsvJFMNBxKRZ05Ur9E=;
	b=BgdLipY4+KFIRNgniilfUOw6w2xDptLYJWJfU2ilr19VkV7c7k/XyLIPHxE6Bw23Wy
	zgBYACtaNq0Ia26kGk+ZbizctBYmiikAGtDtzhc4uZrdczA2CZ5gZyNyBx6GeMmzZ4Ir
	9c7w4FVMgVNKa+sdTZF4nvyU9ECoTB4iTKt5qRylYOSEOdoIZcMkP/FU+yRWsPTWY/lt
	4FZ/EfxsXFqs3U33HYy5Jc1HrCMpFgghuWtH6LPUUX/HmFNspdKX2ADlqciAA7UIyu6c
	8Tz+k7wdbqNxZbYA7e+j10hQZXgXXrHMp1zp//KF/51d7ktTERcwig3l6yu1vel80Buu
	dMYg==
X-Gm-Message-State: ALQs6tAyb78v7u9I/Zr7nd4f+FUS7vufHOsYSARjcSBZalNpzSMd5Cty
	27AWB7NOAOHdysW4whjNYN82PTOG+Uk=
X-Google-Smtp-Source: AB8JxZous0iHAjIZk1HkEHJ3BdZzalixavubby0Meq44vnAuMV7Ahc4fJtQLrNm/RvwnrqdZXKNnBw==
X-Received: by 2002:a81:4cca:: with SMTP id
	z193-v6mr6938726ywa.235.1525119925318; 
	Mon, 30 Apr 2018 13:25:25 -0700 (PDT)
Received: from bill-the-cat.ec.rr.com (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	f8-v6sm3602101ywa.56.2018.04.30.13.25.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Apr 2018 13:25:24 -0700 (PDT)
Date: Mon, 30 Apr 2018 16:25:22 -0400
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20180430202522.GK31362@bill-the-cat.ec.rr.com>
References: <bf9e9593-a395-8d53-faf8-ad6609aa5ba1@prevas.dk>
	<53904a8f-7ba2-7f09-4e93-a95a780f60c7@denx.de>
	<d89b39f665a14c63b0821c1ad600da72@SOC-EX01V.e01.socionext.com>
	<8cc34667-5bb3-9642-40e2-d56b28f56646@prevas.dk>
	<32a348ed6176434db8178d29d7e1f183@SOC-EX01V.e01.socionext.com>
	<5ca366ed-3108-4a56-caaf-06b4f136d259@denx.de>
	<627e0fde-f97f-5c49-bc1a-325e7baa9072@linux.intel.com>
	<0802e876-fda0-d8d2-9dca-18ba8cbe073e@denx.de>
	<f6d2cd6a-4206-3a2c-1854-4ff12bd35df7@linux.intel.com>
	<CAP9ODKqTV4g2ze+zw9KPqkiQ_LUQ7NTfWUzN-xvKvwE64Qkisg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqTV4g2ze+zw9KPqkiQ_LUQ7NTfWUzN-xvKvwE64Qkisg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Marek Vasut <marex@denx.de>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2018.03 release
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
X-List-Received-Date: Mon, 30 Apr 2018 20:25:25 -0000
X-Groupsio-MsgNum: 110860
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AVnhnxDmMBqUeabe"
Content-Disposition: inline

--AVnhnxDmMBqUeabe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 30, 2018 at 07:57:18PM +0000, Otavio Salvador wrote:
> On Mon, Apr 30, 2018 at 4:53 PM Alexander Kanavin <
> alexander.kanavin@linux.intel.com> wrote:
>=20
> > On 04/30/2018 08:25 PM, Marek Vasut wrote:
> > >>>> Isn't it possible to solve your issue in the OE side?
> > >>>>
> > >>>
> > >>> Can we NOT compile DTC alongside U-Boot somehow ? :)
> > >>> That'd be the most desired solution IMO.
> > >>
> > >> Yes please. Can you adjust the recipes and classes in oe-core, and
> > >> remove the dtc recipe altogether?
> > >
> > > Remove dtc recipe ? Not sure I understand what you're implying.
>=20
> > If u-boot bundles dtc in its source tree, can we use that, and remove
> > the external dtc recipe?
>=20
> We shouldn't. The point in use the recipes inside OE-Core is because our
> bugfixes, patches and etc are used everywhere. If we use the bundled copy
> how we'd fix a host issue for example? Duplicate patches?

What do you do for the kernel here?

--=20
Tom

--AVnhnxDmMBqUeabe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJa53uyAAoJEIf59jXTHXZSJdIP/0bmw+6H+Aa56cZEXnwa604l
9juj0oosSyQKp0/mvWVSK06guk8TOL92H9w21T3cmrsz8mYXIFs8R6mUcOUtAQU2
fxE8YSA6acMgLwFp6Y0lfNcA3dMX5lUO4nDN+/MkEkGo/kjzAH/wbc3WpwXC8Y5j
ULfr7zx39RXoUWpjaxOSZgXho3PHst5TNdrJfrRaoid5np5qreJMw49SHl44W3mW
YsgO9ckaFe1tX/CAnWc5UvM4F89azKP9baRtq72GWAXMxfUrFbjdAHlBoySV+f/E
eaAaPrrp1d5Bg1htUaw25Rs2Y80XeohSfz/q0dKPfwRpA02B4ngcuD99g+vvPHRS
xlMvwgLgyTT7jGun6neSE+8oCKuHokLOExSle0NtNwk/aNkBrlLGNbAKY0W24cZn
QS1It9W26Na3PeL42ZiNliWKlf037gJ9AHVvyl7buDpAHbePlZMm6X1e/ApG9Gcy
fZQFrN/vuvCEfz3kVTXdnHxg1Hvj9vOR1WBriHtWBhq4bR/2iIaxOBFz6SWJp+Iu
v+RhyyDewy35s5YLUN1PJtgTvqu9dG+xFjSDkwR659M0cJ22ah3EsFQhK9go7Esq
r27C5QtWBfc+uMx5iBqW+qupqncooLKMg/YSM3Fbh//g+oLXa4fRkrv4OEy0aNpT
hIiX24Cp0vv9PeN1RAim
=p7e+
-----END PGP SIGNATURE-----

--AVnhnxDmMBqUeabe--
