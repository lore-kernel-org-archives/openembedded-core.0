Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0259C6FFD3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 19:26:55 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r18so23848486wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 11:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Ng7UPkrNK8DdWrJ3l2iRTAj4Tkb59rQ9XyNgnj0c4sg=;
	b=R1VrFCKRx41YUj58nsjiBspHB4ZCv+ZheFO+FILW4WNKjvsn/JeQk8B4msoPO1hUbS
	tq4OiRaH9M8O4t467sVZquhfE3YJlDljFfTzPDhYejlYmh2hEt7DanRjI2LZ+lVM+r8t
	HrgIyMCaFhDqMroeij9QwWbpcJNGG+eeSzGMXVOENfo79X1EVV1S5ceGaqRP5jMPQ03b
	HT3kgvgYYWOTuWPiMxZJqW2GSgDcwv1Q9YY9Elwo2j50sBQcbvGqbp/nt/RWRK5h75CM
	FJNVeW2ODXY8CEvOUIFQLC4/2ccPY+sAlRBxtx+2KoSlIyzMVoZL4YgqjTKq1594Q7U9
	6yxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Ng7UPkrNK8DdWrJ3l2iRTAj4Tkb59rQ9XyNgnj0c4sg=;
	b=WRxdx5PZkxXeB7r/jz89h1Vnr5tfjHrBNgn5Tvjrv4RwFiVO3IKVRF/OzZeXzhvFrC
	rsNi0owWq+OATRiMr1duQ4yIV2pNE1hjNx4HPFiC9BZrZ8Umo0e4fmNa8BqG88nx/cqm
	QHw+wiR/F48yrtIkmIeArOr1U/m6+WQVT289BQAHrrTd4+nL1tWUEwaWwGI891Q4/C8W
	Hfin7sPo4wuecLQVGnRBuLmzkD8d+dAzOqx26JgqPpiY+V6Satq9liw+BdtC6QA18Fh/
	M40w13XC4OfduIcEWOcnBFdguBV70Vsjgi8zglzD3VwcP4Krm1AqOvGEExO8wdsMjsxQ
	GfmQ==
X-Gm-Message-State: AMke39ml1WMBJj1wtWjuhlmaqT+fCxIszpAWaE78ZMmOrWDOk5PdU3YqGITxzp09q+2tjw==
X-Received: by 10.28.210.65 with SMTP id j62mr9553994wmg.9.1486409215258;
	Mon, 06 Feb 2017 11:26:55 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	123sm14581615wml.6.2017.02.06.11.26.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Feb 2017 11:26:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 6 Feb 2017 20:26:53 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170206192653.GA3353@jama>
References: <1486396334-8039-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1486396334-8039-3-git-send-email-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1486396334-8039-3-git-send-email-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] perl-native: Remove .packinfo file
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
X-List-Received-Date: Mon, 06 Feb 2017 19:27:00 -0000
X-Groupsio-MsgNum: 92897
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline

--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2017 at 03:52:11PM +0000, Richard Purdie wrote:
> This is large and needs fixups to relocate it in each case. We can drop i=
t, save
> the work and the ~150MB disk space its various copies take up. Its not ne=
eded
> for anything that I can see.

-1

The subject says .packinfo, but the change is for .packlist.

>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/perl/perl-native_5.24.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/perl/perl-native_5.24.0.bb b/meta/reci=
pes-devtools/perl/perl-native_5.24.0.bb
> index af2ad7b..4216257 100644
> --- a/meta/recipes-devtools/perl/perl-native_5.24.0.bb
> +++ b/meta/recipes-devtools/perl/perl-native_5.24.0.bb
> @@ -106,6 +106,10 @@ do_install () {
>  	for f in `grep -Il '#! *${bindir}/perl' ${D}/${bindir}/*`; do
>  		sed -i -e 's|${bindir}/perl|/usr/bin/env nativeperl|' $f
>  	done
> +
> +	# The packlist is large with hardcoded paths meaning it needs relocating
> +	# so just remove it.
> +	rm ${D}${libdir}/perl/${PV}/.packlist
>  }
> =20
>  SYSROOT_PREPROCESS_FUNCS +=3D "perl_sysroot_create_wrapper"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWJjN/QAKCRA3VSO3ZXaA
HC0+AKCPb4ZTwKgMmj/VelX1El0IjrweLwCbBB+nkjBJ47Rd247mjMJW3ewcQU0=
=fO7J
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
