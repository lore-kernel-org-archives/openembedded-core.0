Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1T1zaz-0005P3-28; Thu, 16 Aug 2012 14:54:41 +0200
Received: by weyr6 with SMTP id r6so1777411wey.6
	for <multiple recipients>; Thu, 16 Aug 2012 05:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LTspmlYOelPDdEoNmfustZRp6p0OETMI7LRviHdHsxk=;
	b=tMSziFxwmY3q/UJlYs832CsQwnoNPH/m5Pk+nOI7z0EiANxxc+nhbqA72AjwIVJlmM
	1xZ7suMav5Wpj0dgoYM3UTdl3d/UN/TLO3VsHPlByJgJdZlMrceE9QZWLIHIDdLPXpU9
	WbQxWxDtL+AJTRaNZXh51GxN1UPvmbGovMnoUGdLCzBAhIy9ta7vMUqLHQlsBZKFKo8R
	L9bpVnCEHp0uQsmHsMuzU9bBvWaOUUB4Q+Gz6qadXRrqDiW/1bg+PLdVrhNM7Ys0BFNE
	r2m4AFLyfQHHQoD5hlzXDQuFtKTCuKXl+yLrxASw9ROhU90/mdwphoqaA0V68YF32HPd
	xm3w==
Received: by 10.216.227.205 with SMTP id d55mr647241weq.23.1345120963717;
	Thu, 16 Aug 2012 05:42:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm3623203wiv.11.2012.08.16.05.42.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 05:42:42 -0700 (PDT)
Date: Thu, 16 Aug 2012 14:42:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120816124239.GC32088@jama.jama.net>
References: <20120815133202.50B6D10218@opal>
	<20120816103308.GA32088@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120816103308.GA32088@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Jackie Huang : gdk-pixbuf: fix the postinstall script failure when no icon is installed
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
X-List-Received-Date: Thu, 16 Aug 2012 12:54:41 -0000
X-Groupsio-MsgNum: 27572
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kfjH4zxOES6UT95V"
Content-Disposition: inline

--kfjH4zxOES6UT95V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 16, 2012 at 12:33:08PM +0200, Martin Jansa wrote:
> On Wed, Aug 15, 2012 at 01:32:02PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 1d4fbe4761d3d97e3c4b6e894719ee41b21559b2
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3D1d4fbe4761d3d97e3c4b6e894719ee41b21559b2
> >=20
> > Author: Jackie Huang <jackie.huang@windriver.com>
> > Date:   Thu Aug  9 10:30:30 2012 +0800
> >=20
> > gdk-pixbuf: fix the postinstall script failure when no icon is installed
> >=20
> > If gtk+ is added to core-image-minimal, postinstall script failed on bo=
ot:
> >=20
> > Running postinst /etc/rpm-postinsts/104...
> > gtk-update-icon-cache: No theme index file.
> > ERROR: postinst /etc/rpm-postinsts/104 failed.
> >=20
> > This patch fixed the postinstall script to check for the icon
> > file first and not run the gtk-update-icon-cache if no icon
> > is installed.
> >=20
> > [YOCTO #2905]
> >=20
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
>=20
> Even with this patch I get:
> Configuring gdk-pixbuf-loader-png.
> gtk-update-icon-cache: No theme index file.
> Configuring gdk-pixbuf-loader-jpeg.
> gtk-update-icon-cache: No theme index file.
> Configuring gdk-pixbuf-loader-xpm.
> gtk-update-icon-cache: No theme index file.
> Configuring gdk-pixbuf-loader-gif.
> gtk-update-icon-cache: No theme index file.
> Collected errors:
>  * pkg_run_script: package "gdk-pixbuf-loader-png" postinst script
>  * returned status 1.
>  * opkg_configure: gdk-pixbuf-loader-png.postinst returned 1.
>  * pkg_run_script: package "gdk-pixbuf-loader-jpeg" postinst script
>  * returned status 1.
>  * opkg_configure: gdk-pixbuf-loader-jpeg.postinst returned 1.
>  * pkg_run_script: package "gdk-pixbuf-loader-xpm" postinst script
>  * returned status 1.
>  * opkg_configure: gdk-pixbuf-loader-xpm.postinst returned 1.
>  * pkg_run_script: package "gdk-pixbuf-loader-gif" postinst script
>  * returned status 1.
>  * opkg_configure: gdk-pixbuf-loader-gif.postinst returned 1.

This problem is caused by=20
openembedded-core/meta/recipes-graphics/xcursor-transparent-theme/xcursor-t=
ransparent-theme_0.1.1.bb
which does not provide index.theme file

and commit message of this change should be something like
gdk-pixbuf: call gtk-update-icon-cache for each subdir of ${datadir}/icons
not
gdk-pixbuf: fix the postinstall script failure when no icon is installed

Cheers,

> > -test -x ${bindir}/gtk-update-icon-cache && gtk-update-icon-cache  -q $=
{datadir}/icons/hicolor
> > +if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons ]; =
then
> > +    for icondir in /usr/share/icons/*; do
> > +        if [ -d ${icondir} ]; then
> > +            gtk-update-icon-cache -q ${icondir}
> > +        fi
> > +    done
> > +fi
> >  }
> > =20
> >  PACKAGES_DYNAMIC +=3D "gdk-pixbuf-loader-*"
> >=20
> >=20
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kfjH4zxOES6UT95V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAs6r8ACgkQN1Ujt2V2gBwSiwCgiZ8gEXk+nF70aA0y5g63QcXL
kcAAoI1X1fPZuiC3nfCSPMBRZCsvrdp5
=Qs6d
-----END PGP SIGNATURE-----

--kfjH4zxOES6UT95V--
