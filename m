Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T0Rcq-0002ib-Ud
	for openembedded-core@linuxtogo.org; Sun, 12 Aug 2012 08:26:12 +0200
Received: by wibhr14 with SMTP id hr14so1867887wib.7
	for <openembedded-core@linuxtogo.org>;
	Sat, 11 Aug 2012 23:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BdxAp+KH68OOnvKrkl5WH9yOeh8MTqWIk+HvtxAleTo=;
	b=CyzK26EwyKJfRnI8J/2d0fp0G/No1UXH5foF5wYO0utqQbuWGpu0L3saCZYoavnPb+
	Hgi/vIXfNZecej/JC2F2IFKOtaXfvj3XDidCENDXAIp/afx+ccMN/1loisGGqzpwlFQL
	uDVdrXp7fF9NGgLilAkU5TonS/4jR68lezkzS+XfonbCDJGDP5RsMGPyES9riuvEMM1U
	kvsj3kZOhnh3m96Ed88CAUWZsmxjTRnPSdQM7T107YGa+e5TxmW5yvgDESn9Jfx+uPOi
	HMk0OpUSttHUezDc28f10fuvv74lhVmgDFQhp3cfPuH5HVLhoGZLYx7iwuXPKAoyNT21
	0DnA==
Received: by 10.180.97.106 with SMTP id dz10mr8482978wib.21.1344752061226;
	Sat, 11 Aug 2012 23:14:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm12141465wiy.4.2012.08.11.23.14.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 11 Aug 2012 23:14:20 -0700 (PDT)
Date: Sun, 12 Aug 2012 08:14:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120812061425.GA3290@jama.jama.net>
References: <CAMKF1sokpajrms4PACKOSt8CYFt+6JEQ2Fre=QpzJfQF-KLrKA@mail.gmail.com>
	<20120809131016.GA3273@jama.jama.net>
	<CAMKF1sqC-_YTdwsLvVoVyz04ndMxNt6W1z__f_9nUTfb6aF8GQ@mail.gmail.com>
	<20120809145732.GD3273@jama.jama.net>
	<20120811080416.GA3258@jama.jama.net>
	<CAMKF1sqDmRKA=eaTbZesfDFd9axJXUbHDR-7b-0vpF1SMu9RSw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqDmRKA=eaTbZesfDFd9axJXUbHDR-7b-0vpF1SMu9RSw@mail.gmail.com>
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
X-List-Received-Date: Sun, 12 Aug 2012 06:26:13 -0000
X-Groupsio-MsgNum: 27290
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline

--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 11, 2012 at 10:30:25PM -0700, Khem Raj wrote:
> On Sat, Aug 11, 2012 at 1:04 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> >
> > | =3D=3D=3D If you get failures below, please file a bug describing the=
 error
> > | =3D=3D=3D and your environment (compiler and linker versions), and use
> > | =3D=3D=3D --disable-elf-hack until this is fixed.
> > | =3D=3D=3D
> > | /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc=
/work/armv7a-vfp-neon-oe-linux-gnueabi/firefox-10.0.2-r2/mozilla-release/bu=
ild/unix/elfhack/elfhack -b test.so
> > | test.so: terminate called after throwing an instance of 'std::runtime=
_error'
> > |   what():  Unsupported relocation type
> > | make[7]: *** [test.so] Aborted (core dumped)
> > | make[7]: Leaving directory `/var/lib/jenkins/jobs/shr-core-branches/w=
orkspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/firefox-=
10.0.2-r2/mozilla-release/build/unix/elfhack'
>=20
> it might be you are seeing same bug in elfhack as described here
>=20
> https://bugzilla.mozilla.org/show_bug.cgi?id=3D632920

I've disabled elf hack yesterday
https://github.com/OSSystems/meta-browser/commit/5d176cb405497e5c5823fa14db=
ae353a2e1e3730
and it did build fine with 2.22 as well as 23, but GNUtoo then reported tha=
t=20
it still produces Illegal instructions.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAnScEACgkQN1Ujt2V2gBzq+gCglYEcJJ+k5B4nY+byrzgWCtVR
epUAnRXWIOlMYQU/rdMHwykOP5+7Xhnj
=c3AJ
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
