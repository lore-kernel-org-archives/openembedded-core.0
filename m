Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 86FD06A463;
	Thu,  9 Jan 2014 15:22:56 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id e53so334275eek.28
	for <multiple recipients>; Thu, 09 Jan 2014 07:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=h4JRpu883ugmFukZ6EUUrhu6J0uWbckC06cBBD1MnUc=;
	b=ULya+uEx7sJBtiAvqWNfg7lu3u1+K3wSJ9uw/p/nQpYXTBxvCh8/DwFk4OJ6nCMdlu
	HrFcjPFsKCBlM5KuJGE+2N/1orPzOBC27skgiCvKR/tfWTr6jBGO4hVT8t+LdL62YnRJ
	Schq8MK3T8AdRlDyHNx7zGqsg4ARpGCSFmcvtIOFj3ImRXFEWHPOECXXZIVNUuAX4YWy
	Go0FwQDk4XzZ27bNOXyNQAAU8Z79W1vjPqtqUuFC+TRfnn5IglKfiku+1T6K8WPP26L9
	ZGJY+7/rzz1ULFT3z4u3olv955O1n2/+O6JHt4qoJfEAEvgKibT2XJrE4QcYyaPFaZ6L
	sRBw==
X-Received: by 10.15.53.200 with SMTP id r48mr3589622eew.111.1389280977113;
	Thu, 09 Jan 2014 07:22:57 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id e43sm6415389eep.7.2014.01.09.07.22.56
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 07:22:56 -0800 (PST)
Date: Thu, 9 Jan 2014 16:23:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20140109152308.GI3709@jama>
References: <20140109144626.GG3709@jama>
	<CALbNGRQ5jDLUA80jmXeoHU8g-0k04UwgXGtdjL3xTJdG6heSKg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQ5jDLUA80jmXeoHU8g-0k04UwgXGtdjL3xTJdG6heSKg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2014-01-09
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
X-List-Received-Date: Thu, 09 Jan 2014 15:22:57 -0000
X-Groupsio-MsgNum: 48772
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x2HNTtYOBsOEDsnN"
Content-Disposition: inline

--x2HNTtYOBsOEDsnN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2014 at 04:12:52PM +0100, Andreas M=FCller wrote:
> On Thu, Jan 9, 2014 at 3:46 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >
> > =3D=3D Failed tasks 2014-01-09 =3D=3D
> >
> > =3D=3D=3D common (6) =3D=3D=3D
> >     * meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb, =
do_configure
> >     * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_g=
it.bb, do_fetch
> >     * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_=
compile
> >     * meta-openembedded/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.=
bb, do_compile
> >     * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, =
do_compile
> >     * meta-qt5/recipes-qt/qt5/qtwayland_git.bb, do_compile
>=20
> I have problems with qtwayland too and think that I am close to
> understand what's going on (on 5.2 branch). Where do I find logs for
> this error?

Links for each machine are on the bottom of the e-mail:

http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/...

qtwayland builds for me fine with oe-core only and also in qt5-5.2.0 +
webos-ports, so I haven't looked much into it yet.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--x2HNTtYOBsOEDsnN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLOvtwACgkQN1Ujt2V2gBy2GwCguVo9m6C1feKr5BxhXxayTBFP
j0QAoIXTxnerCLekI+sviVRVe4qQ8V7P
=MUGe
-----END PGP SIGNATURE-----

--x2HNTtYOBsOEDsnN--
