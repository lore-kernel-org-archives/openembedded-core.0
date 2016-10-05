Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E4414719C5;
	Wed,  5 Oct 2016 13:48:05 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f193so20061615wmg.2;
	Wed, 05 Oct 2016 06:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8H4n5bae2sk7PgW9YbmYVWcppqhKIRU4UkC+ii5sh4Y=;
	b=M+5CWqEDEeDqIn4p1T/b02qT+LewaqQ/ztiwFI1m6cJ8pYmnoKcGM6XhHG7uMGmJeV
	9jFmpGYqtObEifKGPEOgjONfanWXxrYA/liMRSUlRV7Gbqc29/p8xKcUeFimW44MPAaa
	S9gaPAqCAPbqUin6CW3ZBeBZCUNN96QC8xeqmpguqB6Oq4gwYUQnK4da5pwh64ZZ23op
	YN7PxEtbJDGdP6Ex7UENIp4hIiW9wpGRHenPjWfvb3Aaf0+9v8GCSmrBC56vNFQW9q97
	kyiUGAlFds/qWOMLbqT7fRw611UB5MDRJuoy36r/4Yn15aJBFrib3KQXCA9mFS90ho99
	B0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8H4n5bae2sk7PgW9YbmYVWcppqhKIRU4UkC+ii5sh4Y=;
	b=NnBczxlxy0rN8h7xkoOTPblcWGndq+/Q11F5njDaJUvPABB+MX/ZpcMU+YaDf9ufAS
	SMsHaCp7L9NCwLSOit2Qal/0dYba3CVfn/gA5AqLqINLz5LzYV/pwP5HnPIKCDZkC7ps
	5M6HPjAoOH4qR7zyqXopBeghQuSN1+PyvlLL976H680HeQdMW1i0kh6AVUDYqGvzXwJk
	944DcWthETylRwLqE8nCKyTjfWf8th4nqUUlsbpzAc1wUy9tVGURHd+NGdB4IH+nkZ0v
	EyGKaNuMmTxNpB1bhZzuaFH4lF/HgrUgOE1hj6wkuF4P7NLl6JDp587YstzXbG0nxqBH
	zfPQ==
X-Gm-Message-State: AA6/9RlPTlbQAR8HGBeJOYG/ocILtR5Kuo7thDyHVqXit6/SVlsvV/yOUepeIbwH4LHiaQ==
X-Received: by 10.194.16.161 with SMTP id h1mr7785760wjd.164.1475675286117;
	Wed, 05 Oct 2016 06:48:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id c5sm9078664wjw.29.2016.10.05.06.48.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Oct 2016 06:48:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Oct 2016 15:48:07 +0200
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20161005134807.GB2926@jama>
References: <20161005131408.GA2926@jama>
	<CALbNGRRDzx-2FPMd_hgfoEMQgHPGFjfjViMSCAfJaBZRg=c9ig@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRRDzx-2FPMd_hgfoEMQgHPGFjfjViMSCAfJaBZRg=c9ig@mail.gmail.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world 2016-10-04
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
X-List-Received-Date: Wed, 05 Oct 2016 13:48:10 -0000
X-Groupsio-MsgNum: 87896
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline

--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2016 at 03:29:25PM +0200, Andreas M=FCller wrote:
> > =3D=3D=3D qemuarm (1) =3D=3D=3D
> >     * meta-openembedded/meta-filesystems/recipes-support/physfs/physfs_=
git.bb:do_populate_lic
> ^ This one was fixed during run - correct?
> >
> > =3D=3D=3D qemux86 (2) =3D=3D=3D
> >     * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do=
_compile
> >     * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:=
do_compile
> >
> > =3D=3D=3D qemux86_64 (1) =3D=3D=3D
> >     * meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6=
=2Ebb:do_compile
> >
>=20
> ...
>=20
> >
> > =3D=3D Tested changes (nocluded in master yet:
> > ad9b1ce firefox: Fix build using gcc 6
> ^ Where does this one come from?

https://patchwork.openembedded.org/patch/126075/

probably

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlf1BHEACgkQN1Ujt2V2gBzJ1wCdF/otkEP/VWIc1GKTPDTRMCMr
vFYAn0Ner+gwNXZ5JFKkanTneJAkmAAZ
=L+Js
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--
