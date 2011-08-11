Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QrP4x-0006D7-7b
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 08:49:19 +0200
Received: by fxg11 with SMTP id 11so1656647fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 23:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=voT0vaeewO6nn9QLgY0bqhlLwFa8CMoUgykwELWsdH8=;
	b=unsx8hNF55kw7Szb5SV0T3utB6UvHzjPTaiaeMUV/pJuMBRpc2r+avKz+bCUkS7Hts
	Bj3INS6PA8tiuOHGCtyy9iOCnHUcSom5ZF+plxPzvM4DbKduWaPLa3HojBciIGNOTj5I
	x9Mo+3+4qJAiCjBJi+F4Gw/F4becwHZwztANg=
Received: by 10.223.59.208 with SMTP id m16mr12381343fah.47.1313045088231;
	Wed, 10 Aug 2011 23:44:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x2sm1309571fal.44.2011.08.10.23.44.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Aug 2011 23:44:46 -0700 (PDT)
Date: Thu, 11 Aug 2011 08:44:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110811064438.GB2214@jama.jama.net>
References: <1309358918.2551.48.camel@phil-desktop>
	<1309359293.2551.49.camel@phil-desktop>
	<A0B5F234-A33C-47D6-AD2E-D6E37479333C@dominion.thruhere.net>
	<1309360040.2551.56.camel@phil-desktop>
	<1309360263.2551.59.camel@phil-desktop>
	<1312973314.6733.37.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1312973314.6733.37.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: bitbake -b busted again?
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
X-List-Received-Date: Thu, 11 Aug 2011 06:49:19 -0000
X-Groupsio-MsgNum: 7951
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BwCQnh7xodEAoBMC"
Content-Disposition: inline

--BwCQnh7xodEAoBMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2011 at 11:48:33AM +0100, Phil Blundell wrote:
> On Wed, 2011-06-29 at 16:11 +0100, Phil Blundell wrote:
> > Also, it does seem that "bitbake -e -b ..." really is broken.  I get:
> >=20
> > ERROR: Command execution failed: Traceback (most recent call last):
> >   File "/home/pb/oe/bitbake/lib/bb/command.py", line 102, in runAsyncCo=
mmand
> >     commandmethod(self.cmds_async, self, options)
> >   File "/home/pb/oe/bitbake/lib/bb/command.py", line 272, in showEnviro=
nment
> >     command.cooker.showEnvironment(bfile)
> >   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 259, in showEnviron=
ment
> >     fn =3D self.matchFile(buildfile)
> >   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 753, in matchFile
> >     matches =3D self.matchFiles(buildfile)
> >   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 736, in matchFiles
> >     filelist, masked =3D self.collect_bbfiles()
> >   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 997, in collect_bbf=
iles
> >     files.sort( key=3Dlambda fileitem: self.calc_bbfile_priority(fileit=
em) )
> >   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 997, in <lambda>
> >     files.sort( key=3Dlambda fileitem: self.calc_bbfile_priority(fileit=
em) )
> >   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 463, in calc_bbfile=
_priority
> >     for _, _, regex, pri in self.status.bbfile_config_priorities:
> > AttributeError: 'NoneType' object has no attribute 'bbfile_config_prior=
ities'
> >=20
> > Using an absolute path to the .bb file doesn't seem to help in this
> > case, and I also verified that it does build successfully without the
> > -e.
>=20
> FWIW, I just re-tested with bitbake master from today and this still
> seems to be broken.

RP's patch makes -e working again, but local files are still not found
when used with -b. Something like ignoring FILESDIR/FILESPATH..

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BwCQnh7xodEAoBMC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5DelYACgkQN1Ujt2V2gBytzQCcCcuvqp0KIUUwRn+UdQzQh85e
wOQAn1R5r1wm1EQcSloaaygKAeRKNlJd
=NVvs
-----END PGP SIGNATURE-----

--BwCQnh7xodEAoBMC--
