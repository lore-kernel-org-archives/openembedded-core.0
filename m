Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T1xd7-0002o3-Rh
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 12:48:45 +0200
Received: by weyr6 with SMTP id r6so1704879wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 03:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WDoipcic2Sr/dZoFODGTtkqwPdIH+dhQRc+CgOeXhRM=;
	b=jBsqCFWCPHbXZojTh7mqoWEQ9EhaBTAVcXG3T1BTBtc1WhV8GklIQ1UzQYy7IAhQ+x
	ZeM1x4sYOpqqB7N/wwB5oAb1HYxvQAJX8Ol5cjv2U7Yxsd1Jqe9eYQalB0YQkpiBi8gd
	AtKTRsItg1eXfFIKCHMku1gyUCtck3UppPrOhogXLxGw+wbM5hQAcJDnz9cwxTbmj5Gj
	Wyhc6t6XG7LNSqbk/0yyAbkSBELlAAe5P6JgM3R49f+afVxoumOwLLG39651AU34Avfz
	D7MlcKTBXa0pQ2GLQBl3HRROX3yDot3n0W2k/xxFoTaRFLUVtQCnVPlrbVpNqzZ7im8T
	3/7Q==
Received: by 10.180.105.6 with SMTP id gi6mr2077685wib.4.1345113408807;
	Thu, 16 Aug 2012 03:36:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm3165704wib.2.2012.08.16.03.36.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 03:36:47 -0700 (PDT)
Date: Thu, 16 Aug 2012 12:36:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120816103644.GB32088@jama.jama.net>
References: <CAMKF1sokpajrms4PACKOSt8CYFt+6JEQ2Fre=QpzJfQF-KLrKA@mail.gmail.com>
	<20120809131016.GA3273@jama.jama.net>
	<CAMKF1sqC-_YTdwsLvVoVyz04ndMxNt6W1z__f_9nUTfb6aF8GQ@mail.gmail.com>
	<20120809145732.GD3273@jama.jama.net>
	<20120811080416.GA3258@jama.jama.net>
	<CAMKF1sqDmRKA=eaTbZesfDFd9axJXUbHDR-7b-0vpF1SMu9RSw@mail.gmail.com>
	<20120812061425.GA3290@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120812061425.GA3290@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@linuxtogo.org
Subject: Re: binutils 2.23 call for testing the recipes
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
X-List-Received-Date: Thu, 16 Aug 2012 10:48:45 -0000
X-Groupsio-MsgNum: 27567
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Content-Disposition: inline

--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 12, 2012 at 08:14:25AM +0200, Martin Jansa wrote:
> On Sat, Aug 11, 2012 at 10:30:25PM -0700, Khem Raj wrote:
> > On Sat, Aug 11, 2012 at 1:04 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> > >
> > > | =3D=3D=3D If you get failures below, please file a bug describing t=
he error
> > > | =3D=3D=3D and your environment (compiler and linker versions), and =
use
> > > | =3D=3D=3D --disable-elf-hack until this is fixed.
> > > | =3D=3D=3D
> > > | /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-egli=
bc/work/armv7a-vfp-neon-oe-linux-gnueabi/firefox-10.0.2-r2/mozilla-release/=
build/unix/elfhack/elfhack -b test.so
> > > | test.so: terminate called after throwing an instance of 'std::runti=
me_error'
> > > |   what():  Unsupported relocation type
> > > | make[7]: *** [test.so] Aborted (core dumped)
> > > | make[7]: Leaving directory `/var/lib/jenkins/jobs/shr-core-branches=
/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/firefo=
x-10.0.2-r2/mozilla-release/build/unix/elfhack'
> >=20
> > it might be you are seeing same bug in elfhack as described here
> >=20
> > https://bugzilla.mozilla.org/show_bug.cgi?id=3D632920
>=20
> I've disabled elf hack yesterday
> https://github.com/OSSystems/meta-browser/commit/5d176cb405497e5c5823fa14=
dbae353a2e1e3730
> and it did build fine with 2.22 as well as 23, but GNUtoo then reported t=
hat=20
> it still produces Illegal instructions.

Another issue I've noticed today is gtk-update-icon-cache failing on
armv4t with
Illegal instruction (even without gold enabled). Not 100% sure it's
because of switch from binutils-2.22 to 2.23, but it still works in my
other builddirs (without binutils-2.23). Will debug this a bit more when
I find some time.

SHR root@gjama ~ $ gtk-update-icon-cache -q /usr/share/icons/shr/
Illegal instruction

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAszTwACgkQN1Ujt2V2gByeOQCcCZSX/n9zVbuNuDnjbLztjTFi
zDEAnjm9pMjKWuhxSy7Ggk8OWhipXCvn
=C9F7
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--
