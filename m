Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1T21Me-0001QA-Pm; Thu, 16 Aug 2012 16:48:00 +0200
Received: by weyr6 with SMTP id r6so1860645wey.6
	for <multiple recipients>; Thu, 16 Aug 2012 07:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=j0xZ9XbB8AmM2crn629dk1wD8fA+HLa7I4tf1DDnrAc=;
	b=lEJXwGyqyqIr98qLQBvqbwP22bLXD/EH+uAMJYcziz2B4Hk2Xk+hId+ZIri8udds5F
	dBXuefk048Nky58yrayAD4xivET36CWwL+8lOW6zMuRfMxAtz2tQhWbSbCH+sbX5XCqd
	eHTzNU5N3q5bhkvaTQr6yzsp/0L/H8/KzEHq5X5ngh+1m3bjggj5Nt7Vin3T0WWcMA32
	jxfGC88SLhpMCfLrCYOhSscK4dkLGF08WA/wmwvyXEfjs07pWZbv5GUutzDQhV02kh6e
	VcYaF8O94w9DzsJFIWrmWf2GdPGUNCMw2Ul0YhFYKN+oXsh4jK3lM6Dj8JOA3R/v7+Gi
	7E+g==
Received: by 10.180.81.38 with SMTP id w6mr3663425wix.10.1345127763421;
	Thu, 16 Aug 2012 07:36:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fb20sm6234107wid.1.2012.08.16.07.36.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 07:36:02 -0700 (PDT)
Date: Thu, 16 Aug 2012 16:35:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Message-ID: <20120816143559.GD32088@jama.jama.net>
References: <20120815133202.50B6D10218@opal>
	<20120816103308.GA32088@jama.jama.net>
	<20120816124239.GC32088@jama.jama.net>
	<1B858668EC6A94408DCA5225FDFA85AA576F7B28@ALA-MBA.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA576F7B28@ALA-MBA.corp.ad.wrs.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
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
X-List-Received-Date: Thu, 16 Aug 2012 14:48:01 -0000
X-Groupsio-MsgNum: 27583
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jCrbxBqMcLqd4mOl"
Content-Disposition: inline

--jCrbxBqMcLqd4mOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 16, 2012 at 02:30:51PM +0000, Huang, Jie (Jackie) wrote:
> >
> >On Thu, Aug 16, 2012 at 12:33:08PM +0200, Martin Jansa wrote:
> >> On Wed, Aug 15, 2012 at 01:32:02PM +0000, git@git.openembedded.org wro=
te:
> >> > Module: openembedded-core.git
> >> > Branch: master
> >> > Commit: 1d4fbe4761d3d97e3c4b6e894719ee41b21559b2
> >> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dc=
ommit;h=3D1d4fbe4761d3d97e3c4b6e894719ee41b21559b2
> >> >
> >> > Author: Jackie Huang <jackie.huang@windriver.com>
> >> > Date:   Thu Aug  9 10:30:30 2012 +0800
> >> >
> >> > gdk-pixbuf: fix the postinstall script failure when no icon is insta=
lled
> >> >
> >> > If gtk+ is added to core-image-minimal, postinstall script failed on=
 boot:
> >> >
> >> > Running postinst /etc/rpm-postinsts/104...
> >> > gtk-update-icon-cache: No theme index file.
> >> > ERROR: postinst /etc/rpm-postinsts/104 failed.
> >> >
> >> > This patch fixed the postinstall script to check for the icon
> >> > file first and not run the gtk-update-icon-cache if no icon
> >> > is installed.
> >> >
> >> > [YOCTO #2905]
> >> >
> >> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> >> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >>
> >>
> >> Even with this patch I get:
> >> Configuring gdk-pixbuf-loader-png.
> >> gtk-update-icon-cache: No theme index file.
> >> Configuring gdk-pixbuf-loader-jpeg.
> >> gtk-update-icon-cache: No theme index file.
> >> Configuring gdk-pixbuf-loader-xpm.
> >> gtk-update-icon-cache: No theme index file.
> >> Configuring gdk-pixbuf-loader-gif.
> >> gtk-update-icon-cache: No theme index file.
> >> Collected errors:
> >>  * pkg_run_script: package "gdk-pixbuf-loader-png" postinst script
> >>  * returned status 1.
> >>  * opkg_configure: gdk-pixbuf-loader-png.postinst returned 1.
> >>  * pkg_run_script: package "gdk-pixbuf-loader-jpeg" postinst script
> >>  * returned status 1.
> >>  * opkg_configure: gdk-pixbuf-loader-jpeg.postinst returned 1.
> >>  * pkg_run_script: package "gdk-pixbuf-loader-xpm" postinst script
> >>  * returned status 1.
> >>  * opkg_configure: gdk-pixbuf-loader-xpm.postinst returned 1.
> >>  * pkg_run_script: package "gdk-pixbuf-loader-gif" postinst script
> >>  * returned status 1.
> >>  * opkg_configure: gdk-pixbuf-loader-gif.postinst returned 1.
> >
> >This problem is caused by
> >openembedded-core/meta/recipes-graphics/xcursor-transparent-theme/xcurso=
r-transparent-theme_0.1.1.bb
> >which does not provide index.theme file
> >
>=20
> Well, in my case, there is no icon installed so there is on ${datadir}/ic=
ons at all.

So it's fine to break postinst for everyone else who has
xcursor-transparent-theme or are you going to fix that?

Thanks,

>=20
> Thanks,
> Jackie
>=20
> >and commit message of this change should be something like
> >gdk-pixbuf: call gtk-update-icon-cache for each subdir of ${datadir}/ico=
ns
> >not
> >gdk-pixbuf: fix the postinstall script failure when no icon is installed
> >
> >Cheers,
> >
> >> > -test -x ${bindir}/gtk-update-icon-cache && gtk-update-icon-cache  -=
q ${datadir}/icons/hicolor
> >> > +if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons =
]; then
> >> > +    for icondir in /usr/share/icons/*; do
> >> > +        if [ -d ${icondir} ]; then
> >> > +            gtk-update-icon-cache -q ${icondir}
> >> > +        fi
> >> > +    done
> >> > +fi
> >> >  }
> >> >
> >> >  PACKAGES_DYNAMIC +=3D "gdk-pixbuf-loader-*"
> >> >
> >> >
> >> > _______________________________________________
> >> > Openembedded-commits mailing list
> >> > Openembedded-commits@lists.openembedded.org
> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-com=
mits
> >>
> >> --
> >> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> >
> >
> >--
> >Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jCrbxBqMcLqd4mOl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAtBU8ACgkQN1Ujt2V2gBz8BwCfRD7vLNnE1YnJm1ptLyaIS8ZR
h9oAn2f/cWtoEgUqpmECW8rvf0kqYeFH
=db/k
-----END PGP SIGNATURE-----

--jCrbxBqMcLqd4mOl--
