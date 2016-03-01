Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 45324731F3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 08:09:37 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id p65so23542483wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2016 00:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=xxGoZMDTpCCsFplRvQtTdPewJDfbQHrW+OAH3VjS9jk=;
	b=oewOX5IUj7il6kxi9w20VPdKAQubcXSopAk6onDJ4whu8QDeYIh3iQiqV73JyA3348
	tHB5NYn8FxGHJzwb+R37MmN4LEoNnJeDEbzvhVo0hx9bHlkhrpjgMOAX/n08fmIbyBzk
	abE6ojudNrIOcsqngdYPsN5Hn5Pn4tSV33wfwBJRrP2tvognjTONdjxWIqoZHf2GeAiT
	2o0sII6YajADeUccqadrTfe2pjCjCLg0AUamcXpo0g7cksYxVo/xCz97ouyAMmqdBFem
	kfkc4jJROB5oDEZ0DK+jRbaZmNFXk9GaKZMhC/ZFQyB/M4RtMoILrNdvlbEK+nrJw8li
	FOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xxGoZMDTpCCsFplRvQtTdPewJDfbQHrW+OAH3VjS9jk=;
	b=MiaV+m8Eld2kbThO88JMgFHIbDjGPMH3XtLzuvtZM1eHJpAhoF7aRYvAGLZWZj42IQ
	7W30wNwMwEnOvqY9Y9o5fZ3zwbaAAZs7qjw2VhnwM4hJAxUo4ry0m3DxceNLIxkD2QPC
	Oqjr8G0IS4UNe4uQTJAGiJW69Os8cllJtGxE+/cbtLMV00U2y/eEUXQfnwYC5S/gaezC
	7/zyf+EVa3SAiQukMkqfSYa8FM+kE5uOtm8ylId7cQcraaypH01gwmzwdBsmSxdizmch
	LsfxoIDteRSaF5PZaGgp/QG/HI4vbw2LK2J4nT3z8EJ979VYV5vV0gP80aWqTbBMnws7
	QeJA==
X-Gm-Message-State: AD7BkJJYfT+ln/tEC7Ke6Einfr2qRHuQZuE+Nz/GLyab9f1AzsaLpW48hJV1VOaiSjoGMg==
X-Received: by 10.28.215.16 with SMTP id o16mr2105639wmg.57.1456819778389;
	Tue, 01 Mar 2016 00:09:38 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jo6sm29706020wjb.48.2016.03.01.00.09.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Mar 2016 00:09:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 1 Mar 2016 09:11:29 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160301081129.GB2559@jama>
References: <1456773039-5178-1-git-send-email-Martin.Jansa@gmail.com>
	<1456778449.11498.183.camel@linuxfoundation.org>
	<CAJTo0LZ6RabE0C2o4wjuKQRbgikjc3f+CH8RF=j4RdVP2nu=7w@mail.gmail.com>
	<CAJ86T=VFeZjULfZW3q06juYa90S8g93V7WhTB5Lgdhy+nJaprQ@mail.gmail.com>
	<CA+chaQfHZPKviheG2NY7miXe9YZir0pszp8qCQbb1kgzPABPDQ@mail.gmail.com>
	<20160301004309.GA2559@jama>
	<1456819467.11498.185.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1456819467.11498.185.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] no-static-libs.inc: add gdb
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
X-List-Received-Date: Tue, 01 Mar 2016 08:09:38 -0000
X-Groupsio-MsgNum: 78976
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Content-Disposition: inline

--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2016 at 08:04:27AM +0000, Richard Purdie wrote:
> On Tue, 2016-03-01 at 01:43 +0100, Martin Jansa wrote:
> > On Mon, Feb 29, 2016 at 10:30:17PM +0100, Martin Jansa wrote:
> > > No special configuration IIRC (will check tomorrow and send whole
> > > config.log).
> > >=20
> > > But it failed the same in my minimal chroot env with just oe-core
> > > and on
> > > Ubuntu jenkins slave doing bitbake world with many layers, here is
> > > full log:
> > > http://errors.yoctoproject.org/Errors/Details/38149/
> > >=20
> > > and it shows --without-system-readline parameter.
> >=20
> > It's caused by bbappend in meta-qt5
> >=20
> > OE qemux86@ ~/build/oe-core $ cat meta-qt5/recipes
> > -devtools/gdb/gdb_%.bbappend
> > PACKAGECONFIG ??=3D "python"
> >=20
> > But on the other hand does this change make more harm than confusing
> > error for people who try to build without readline in PACKAGECONFIG?
>=20
> I mainly wanted to understand what configuration caused this, which we
> now understand/ I agree we should probably do something about the
> error.
>=20
> I do wonder what a gdb bbappend is doing in meta-qt5 though. I'd say
> that is really "distro" configuration.

python support is needed for qt-creator:
http://patchwork.openembedded.org/patch/87523/

I've changed it to use _append to respect default value from oe-core:
http://patchwork.openembedded.org/patch/116889/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbVTrAACgkQN1Ujt2V2gByFowCfcmWWK4k88dUJ3j5By6Xy28fz
Vx8AoLIHQC54OiFxxI3AIpgk1k+cXDWp
=apHX
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--
