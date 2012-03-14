Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1S7jtI-000578-0H; Wed, 14 Mar 2012 09:49:04 +0100
Received: by wibhj13 with SMTP id hj13so5837759wib.6
	for <multiple recipients>; Wed, 14 Mar 2012 01:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DqXaGvGonqmimstFAsG/WrmN6uHFdAg/EwnhPjEyT1k=;
	b=nf1yznUoURad512ET0fPoK+3Ep3eiAUMQSzMEtXmyxRNDzQ2CxQx6g47C6huwgISXk
	QYQE8d5iTs6PKdywz4n6ssj9/ASVeB9XoBosSKGpoiLVhTLaozWI7KgZpmMMyLrjq89+
	ITM5nhKMfGzu8Iq/F8qT4xF/A+QqeKHcwn9Mrj0o8vn+5mLiorOl9le2cIO2FXlU9aL3
	o+i2sxktVAbL+zq1ySxMv9JoGC67UluaLuajpLDSl4wYEZKbCJM+C0DxdBgfJQprVD/D
	hkN254ISPTa27PwDaOE5IBqgvRLxBfHLO6myK2YnuIg0iaFO6OA1fKtgGqbPpqla2kGb
	Tr+Q==
Received: by 10.180.95.74 with SMTP id di10mr10659621wib.1.1331714418999;
	Wed, 14 Mar 2012 01:40:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fi4sm9921478wib.4.2012.03.14.01.40.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Mar 2012 01:40:18 -0700 (PDT)
Date: Wed, 14 Mar 2012 09:40:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120314084016.GD3919@jama.jama.net>
References: <20120313114820.9572210335@opal>
	<20120314070803.GB3919@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120314070803.GB3919@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Andreas Oberritter : qt4: fix deps in libQtWebkit.la and QtWebKit.pc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Mar 2012 08:49:04 -0000
X-Groupsio-MsgNum: 18783
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MAH+hnPXVZWQ5cD/"
Content-Disposition: inline

--MAH+hnPXVZWQ5cD/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 14, 2012 at 08:08:03AM +0100, Martin Jansa wrote:
> On Tue, Mar 13, 2012 at 11:48:20AM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 4c41a3204ef72f53813ddc86fe525fa9c6714daa
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3D4c41a3204ef72f53813ddc86fe525fa9c6714daa
> >=20
> > Author: Andreas Oberritter <obi@opendreambox.org>
> > Date:   Wed Mar  7 21:36:28 2012 +0100
> >=20
> > qt4: fix deps in libQtWebkit.la and QtWebKit.pc
> >=20
> > * Both files contain -L../../WebCore/release -L../../JavaScriptCore/rel=
ease -lwebcore -ljscore
> > * These paths and libs don't get installed.
> > * When building a shared lib with libtool, that links
> >   with libQtWebKit, libtool adds these unneeded parameters
> >   to the linker command-line, thus linking fails.
>=20
> BTW: here with bitbake having R/W to rootfs every qt4-x11-free build
> creates /include/WebCore/libdummy.prl (yes really in root)
> anynone seen this?
> -rw-r--r-- 1 bitbake bitbake 680 Mar 14 01:13 /include/WebCore/libdummy.p=
rl
>=20
> Maybe it's sign of another small issue in qt4 build.

It's created during do_configure and probably caused by
=2E/qt-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/WebKit2/M=
akefile:all: Makefile /include/WebCore/libdummy.prl  /include/WebCore/$(TAR=
GET)
=2E/qt-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/WebKit2/M=
akefile:/include/WebCore/libdummy.prl:

But in unpacked sources closest thing to libdummy.prl is=20
=2E/Source/WebKit2/DerivedSources.pro:TARGET =3D dummy

Any idea if we really need that?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MAH+hnPXVZWQ5cD/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9gWXAACgkQN1Ujt2V2gBxovQCfSe9eTx+s+dV+mCMczSi80KuA
2osAn2DxZstfmWh1UK7Bl+jKwQRv1yj6
=UTSN
-----END PGP SIGNATURE-----

--MAH+hnPXVZWQ5cD/--
