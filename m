Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1T8p2E-00021G-E2; Tue, 04 Sep 2012 11:03:02 +0200
Received: by bkcik5 with SMTP id ik5so3112581bkc.6
	for <multiple recipients>; Tue, 04 Sep 2012 01:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=05vFC9ES3jFi5CjrNMNaVzEr/dnOwevFmQ+pRcl25IQ=;
	b=KT25IKIp/NXMY/L26LkYeebVhG98xhdbaFgxLg2Jb2RvSalm839rjie9MrA2xqgQOn
	5ygAynCbFiIBGO0UiPpU668I9O/WELDS7t3/62UNzQb3bvCzhvdB0unEqMbjzc/pUBcs
	mB1j3lH/1dSPPvyNPAagJc9nnOKSQ6z3kHJRMzTURwZGhUJYlL4Rj1Rl+0Nmx36w4QBT
	zBpwn9lw6ssC5KrXSCBMeWO3NvAnAHjueVKs26wuyNByHVT8PEYJmrWpD5bjxh+94dki
	VQ3Ebo85C/DwRSKGNHr0+F+9WwD73Zrrenybn8mAhUKSJQIHXalGxy+aIhajjtx3Uf0+
	/nlg==
Received: by 10.204.155.69 with SMTP id r5mr7727106bkw.49.1346748640905;
	Tue, 04 Sep 2012 01:50:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id he8sm9587577bkc.3.2012.09.04.01.50.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 01:50:39 -0700 (PDT)
Date: Tue, 4 Sep 2012 10:51:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120904085106.GB3372@jama.jama.net>
References: <20120902125724.B93CA10357@opal>
	<20120904081858.GA3372@jama.jama.net>
	<1346747458.30964.14.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1346747458.30964.14.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : perl: Fix various nativesdk build issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 09:03:02 -0000
X-Groupsio-MsgNum: 28612
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline

--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 04, 2012 at 09:30:58AM +0100, Richard Purdie wrote:
> On Tue, 2012-09-04 at 10:18 +0200, Martin Jansa wrote:
> > >  meta/recipes-devtools/perl/perl_5.14.2.bb |   12 +++++++-----
> > >  1 files changed, 7 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes=
-devtools/perl/perl_5.14.2.bb
> > > index 9db3805..3c1360f 100644
> > > --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
> > > +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
> > > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://Copying;md5=3D2b4c6ffbcf=
cbdee469f02565f253d81a \
> > >  # We need gnugrep (for -I)
> > >  DEPENDS =3D "virtual/db grep-native"
> > >  DEPENDS +=3D "gdbm zlib"
> > > -PR =3D "r8"
> > > +PR =3D "r9"
> > > =20
> > >  # 5.10.1 has Module::Build built-in
> > >  PROVIDES +=3D "libmodule-build-perl"
> > > @@ -90,6 +90,8 @@ export PERLHOSTLIB =3D "${STAGING_LIBDIR_NATIVE}/pe=
rl-native/perl/${PV}/"
> > >  # LDFLAGS for shared libraries
> > >  export LDDLFLAGS =3D "${LDFLAGS} -shared"
> > > =20
> > > +LDFLAGS_append =3D " -fstack-protector"
> > > +
> > >  # We're almost Debian, aren't we?
> > >  CFLAGS +=3D "-DDEBIAN"
> > > =20
> > > @@ -148,10 +150,10 @@ do_configure() {
> > >                 -e 's,@ARCH@-thread-multi,,g' \
> > >                 -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
> > >                 -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
> > > -               -e "s%/usr/include%${STAGING_INCDIR}%g" \
> > > -	       -e 's,/usr/lib/,${libdir}/,g' \
> > > -	       -e 's,/usr/,${exec_prefix}/,g' \
> > > -	       -e 's,/perl5,/perl,g' \
> > > +               -e "s%\([ \"^\',=3D]\+\)/usr/include%\1${STAGING_INCD=
IR}%g" \
> > > +	       -e "s%\([ \"^\',=3D]\+\)/usr/lib/%\1${libdir}/%g" \
> > > +	       -e "s%\([ \"^\',=3D]\+\)/usr/%\1${exec_prefix}/%g" \
> > > +	       -e "s%/perl5%/perl%g" \
> > >              config.sh-${TARGET_ARCH}-${TARGET_OS}
> > > =20
> > >  	case "${TARGET_ARCH}" in
> >=20
> > Not sure if it's caused by this,=20
>=20
>=20
> FWIW we never used to build nativesdk-perl at all. So bugs here are new
> and due to the system being more correct about missing dependencies. Of
> course nativesdk-perl should build, I just want to be clear this is a
> new issue.

Ah I haven't discovered that commit:
nativesdk: Switch to using nativesdk as a prefix, not a suffix
also adds BBCLASSEXTEND to perl

>=20
> > but nativesdk-perl now fails to
> > do_install()
> >=20
> > make[1]: Nothing to be done for `install.man'.
> > make[1]: Leaving directory `/OE/shr-core/tmp-eglibc/work/i686-nativesdk=
-oesdk-linux/nativesdk-perl-5.14.2-r9/perl-5.14.2'
> > ln: failed to create symbolic link '/OE/shr-core/tmp-eglibc/work/i686-n=
ativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image/usr/local/oecore-i686/s=
ysroots/i686-oesdk-linux/usr/bin/perl': No such file or directory
> > ln: failed to create symbolic link '/OE/shr-core/tmp-eglibc/work/i686-n=
ativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image//usr/local/oecore-i686/=
sysroots/i686-oesdk-linux/usr/lib/perl5': No such file or directory
> > rmdir: failed to remove '/OE/shr-core/tmp-eglibc/work/i686-nativesdk-oe=
sdk-linux/nativesdk-perl-5.14.2-r9/image//usr/local/oecore-i686/sysroots/i6=
86-oesdk-linux/usr/lib/perl/site_perl/5.14.2': No such file or directory
> > rmdir: failed to remove '/OE/shr-core/tmp-eglibc/work/i686-nativesdk-oe=
sdk-linux/nativesdk-perl-5.14.2-r9/image//usr/local/oecore-i686/sysroots/i6=
86-oesdk-linux/usr/lib/perl/site_perl': No such file or directory
> > mv: cannot stat '/OE/shr-core/tmp-eglibc/work/i686-nativesdk-oesdk-linu=
x/nativesdk-perl-5.14.2-r9/image//usr/local/oecore-i686/sysroots/i686-oesdk=
-linux/usr/lib/perl/5.14.2/CORE/libperl.so': No such file or directory
> > ln: failed to create symbolic link '/OE/shr-core/tmp-eglibc/work/i686-n=
ativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image//usr/local/oecore-i686/=
sysroots/i686-oesdk-linux/usr/lib/libperl.so.5': No such file or directory
> > ln: failed to create symbolic link '/OE/shr-core/tmp-eglibc/work/i686-n=
ativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image//usr/local/oecore-i686/=
sysroots/i686-oesdk-linux/usr/lib/perl/5.14.2/CORE/libperl.so': No such fil=
e or directory
> > install: cannot create regular file '/OE/shr-core/tmp-eglibc/work/i686-=
nativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image/usr/local/oecore-i686/=
sysroots/i686-oesdk-linux/usr/lib/perl': No such file or directory
> > ln: failed to create symbolic link '/OE/shr-core/tmp-eglibc/work/i686-n=
ativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image/usr/local/oecore-i686/s=
ysroots/i686-oesdk-linux/usr/lib/perl/5.14.2/Config_heavy-target.pl': No su=
ch file or directory
> >=20
> > And files are all installed in wrong directory (sysroot path repeated t=
wice):
> > OE @ ~/shr-core/tmp-eglibc/work/i686-nativesdk-oesdk-linux/nativesdk-pe=
rl-5.14.2-r9/perl-5.14.2 $ ls /OE/shr-core/tmp-eglibc/work/i686-nativesdk-o=
esdk-linux/nativesdk-perl-
> > 5.14.2-r9/image/usr/local/oecore-i686/sysroots/i686-oesdk-linux/usr/loc=
al/oecore-i686/sysroots/i686-oesdk-linux/usr/bin/
> > a2p          corelist   cpanp           enc2xs     h2xs       libnetcfg=
   perlbug  perlthanks  pod2latex  pod2usage   prove    ptar      s2p     x=
subpp
> > c2ph         cpan       cpanp-run-perl  find2perl  instmodsh  perl     =
   perldoc  piconv      pod2man    podchecker  psed     ptardiff  shasum
> > config_data  cpan2dist  dprofpp         h2ph       json_pp    perl5.14.=
2  perlivp  pl2pm       pod2text   podselect   pstruct  ptargrep  splain
>=20
> This is likely a sign that some sed is happening twice to the perl
> config files. You can see my patch above fixes some of them, looks like
> there is still another one somewhere in there :(
>=20
> Cheers,
>=20
> Richard
>=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBFwPoACgkQN1Ujt2V2gBzX5QCglogR3t/Z2N16vzTaandkBTMZ
VTMAnRFEXaWdrfiwQh1ArUXvFI2h+fnS
=GnRP
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
