Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SsCWG-0003aC-Ul
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 14:41:21 +0200
Received: by wgbdr1 with SMTP id dr1so3379132wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 05:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+1T6bNPZAmeW6xvnENEI91BsbdvDGuQ0aNlmwoxp7vw=;
	b=CB5oRztXLHQSgk0s0qSATo7T7Jdf0u/58N1y+qXD/g5HNgbfTlThHzRr96mqTspZmV
	BEmvDZws7oVBZMRGFreUtFV7EFNfqrR/jKgxsbTk04POWYirH2QY+Ft6/xAOA3FrpbPO
	iS0tuCKaEBXaqx1HySKw4pWlp2E8Gr+tPTgyF0za8XJVU8cXlKADoeXHNSs2d2oNoHix
	Vpyjyeo8IMd29oqccPc/Mg6kn0yYsSdxmcHGMa4jS7YvzQ3j88jzmGzk71E73nHYJiIO
	GufLxU+pmFVtkfAFOHArManKDZtCE4i+8tDNO12b9ooshfBSbVjhBb2SeZu084etnra9
	Mzow==
Received: by 10.216.220.89 with SMTP id n67mr3993256wep.73.1342787397789;
	Fri, 20 Jul 2012 05:29:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm14708610wib.0.2012.07.20.05.29.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 05:29:56 -0700 (PDT)
Date: Fri, 20 Jul 2012 14:30:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120720123008.GF3534@jama.jama.net>
References: <lyk3xy7mlu.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20120720104117.GE3534@jama.jama.net>
	<1342782398.21788.7.camel@ted>
	<ly629i7inz.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1342785890.21788.10.camel@ted>
	<ly1uk67hna.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1342787283.21788.13.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1342787283.21788.13.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Broken parallel build of gcc*
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
X-List-Received-Date: Fri, 20 Jul 2012 12:41:21 -0000
X-Groupsio-MsgNum: 25852
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IvGM3kKqwtniy32b"
Content-Disposition: inline

--IvGM3kKqwtniy32b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 20, 2012 at 01:28:03PM +0100, Richard Purdie wrote:
> On Fri, 2012-07-20 at 14:15 +0200, Enrico Scholz wrote:
> > Richard Purdie
> > <richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> > writes:
> >=20
> > >> Is there a way to exclude such tasks from the signature handling?
> > >
> > > The easiest option is probably something like:
> > >
> > > do_rm_old_works[vardepexclude] =3D "PN"
> >=20
> > I tried this but it is not really an option because there must be added
> > a lot of completely unrelated variables:
> >=20
> >  $ bitbake-diffsigs gcc-runtime*do_rm_old_work.sigdata* libgcc*do_rm_ol=
d_work.sigdata*
> >=20
> >  Dependency on variable gcc_cv_collect2_libs was added
> >  Variable CPPFLAGS value changed from  to ${TARGET_CPPFLAGS}
> >=20
> > (none of these is used within do_rm_old_works).
>=20
> Can you point me at a copy of the class your using and the full diffsigs
> output please?

Mine is here
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dblob;f=3Dmeta-s=
hr/classes/rm_old_work.bbclass;h=3Ddb13aa677958a52cd2c1b9efd6b90e38eadba41d=
;hb=3Drefs/heads/shr
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IvGM3kKqwtniy32b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAJT1AACgkQN1Ujt2V2gBySegCfbAt/AAGosbP4SAQZzIlSFdVs
gOcAoI3kNDEuTLNZgsONVkwCOMyHD8DT
=eeQi
-----END PGP SIGNATURE-----

--IvGM3kKqwtniy32b--
