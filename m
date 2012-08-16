Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1T28L7-0004lX-OH; Fri, 17 Aug 2012 00:14:53 +0200
Received: by weyr6 with SMTP id r6so2147518wey.6
	for <multiple recipients>; Thu, 16 Aug 2012 15:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kU00X04ew81uoyzMSA6KgXLtANKlY5+U4tWJQ5kWceo=;
	b=AU0iDQrvrs3ImjoMhMBHKkzBpc8c4qCgYGDkgHOBhVMd5MgnUkQ0LeJbCSZTXPCSlN
	ZtuWoqmEd4CHzdUTt3sYj/56htW91SU6Mq4E3rYdrCCEFp5eHG6O3TtZadmiDVdZIYa1
	vH3MtNn+JTYKVYxP9BhPn+VEIuD1Lgl5CyIBYCeI94W/IOvSFRDVWxQ0gjtr6LmrBOyQ
	b8YmBu4LEocvqMsCj9/QDSo/reIL75l/exPcJdgkEnAzVJzu4pqg+bz08nMHfefeUhjG
	JwLK2z3bp3TYRfOYmDs5kQl8HzGOC91lsdHNtAvEl/A7deDC0z2KKphp0TTBEFtPUTzS
	eY8A==
Received: by 10.180.79.69 with SMTP id h5mr6487081wix.6.1345154576007;
	Thu, 16 Aug 2012 15:02:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k2sm9138447wiz.7.2012.08.16.15.02.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 15:02:55 -0700 (PDT)
Date: Fri, 17 Aug 2012 00:02:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Message-ID: <20120816220251.GC3625@jama.jama.net>
References: <20120815133202.50B6D10218@opal>
	<20120816103308.GA32088@jama.jama.net>
	<20120816124239.GC32088@jama.jama.net>
	<1B858668EC6A94408DCA5225FDFA85AA576F7B28@ALA-MBA.corp.ad.wrs.com>
	<20120816143559.GD32088@jama.jama.net>
	<1B858668EC6A94408DCA5225FDFA85AA576F7B6D@ALA-MBA.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA576F7B6D@ALA-MBA.corp.ad.wrs.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Zhao,
	Zhenfeng" <Zhenfeng.Zhao@windriver.com>,
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
X-List-Received-Date: Thu, 16 Aug 2012 22:14:54 -0000
X-Groupsio-MsgNum: 27645
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qtZFehHsKgwS5rPz"
Content-Disposition: inline

--qtZFehHsKgwS5rPz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 16, 2012 at 03:06:35PM +0000, Huang, Jie (Jackie) wrote:
> >
> >On Thu, Aug 16, 2012 at 02:30:51PM +0000, Huang, Jie (Jackie) wrote:
> >> >
> >> >On Thu, Aug 16, 2012 at 12:33:08PM +0200, Martin Jansa wrote:
> >> >> On Wed, Aug 15, 2012 at 01:32:02PM +0000, git@git.openembedded.org =
wrote:
> >> >> > Module: openembedded-core.git
> >> >> > Branch: master
> >> >> > Commit: 1d4fbe4761d3d97e3c4b6e894719ee41b21559b2
> >> >> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=
=3Dcommit;h=3D1d4fbe4761d3d97e3c4b6e894719ee41b21559b2
> >> >> >
> >> >> > Author: Jackie Huang <jackie.huang@windriver.com>
> >> >> > Date:   Thu Aug  9 10:30:30 2012 +0800
> >> >> >
> >> >> > gdk-pixbuf: fix the postinstall script failure when no icon is in=
stalled
> >> >> >
> >> >> > If gtk+ is added to core-image-minimal, postinstall script failed=
 on boot:
> >> >> >
> >> >> > Running postinst /etc/rpm-postinsts/104...
> >> >> > gtk-update-icon-cache: No theme index file.
> >> >> > ERROR: postinst /etc/rpm-postinsts/104 failed.
> >> >> >
> >> >> > This patch fixed the postinstall script to check for the icon
> >> >> > file first and not run the gtk-update-icon-cache if no icon
> >> >> > is installed.
> >> >> >
> >> >> > [YOCTO #2905]
> >> >> >
> >> >> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> >> >> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >> >>
> >> >>
> >> >> Even with this patch I get:
> >> >> Configuring gdk-pixbuf-loader-png.
> >> >> gtk-update-icon-cache: No theme index file.
> >> >> Configuring gdk-pixbuf-loader-jpeg.
> >> >> gtk-update-icon-cache: No theme index file.
> >> >> Configuring gdk-pixbuf-loader-xpm.
> >> >> gtk-update-icon-cache: No theme index file.
> >> >> Configuring gdk-pixbuf-loader-gif.
> >> >> gtk-update-icon-cache: No theme index file.
> >> >> Collected errors:
> >> >>  * pkg_run_script: package "gdk-pixbuf-loader-png" postinst script
> >> >>  * returned status 1.
> >> >>  * opkg_configure: gdk-pixbuf-loader-png.postinst returned 1.
> >> >>  * pkg_run_script: package "gdk-pixbuf-loader-jpeg" postinst script
> >> >>  * returned status 1.
> >> >>  * opkg_configure: gdk-pixbuf-loader-jpeg.postinst returned 1.
> >> >>  * pkg_run_script: package "gdk-pixbuf-loader-xpm" postinst script
> >> >>  * returned status 1.
> >> >>  * opkg_configure: gdk-pixbuf-loader-xpm.postinst returned 1.
> >> >>  * pkg_run_script: package "gdk-pixbuf-loader-gif" postinst script
> >> >>  * returned status 1.
> >> >>  * opkg_configure: gdk-pixbuf-loader-gif.postinst returned 1.
> >> >
> >> >This problem is caused by
> >> >openembedded-core/meta/recipes-graphics/xcursor-transparent-theme/xcu=
rsor-transparent-theme_0.1.1.bb
> >> >which does not provide index.theme file
> >> >
> >>
> >> Well, in my case, there is no icon installed so there is on ${datadir}=
/icons at all.
> >
> >So it's fine to break postinst for everyone else who has
>=20
> This fix is for the case when there is no icon/theme installed. When we f=
ound the bug,
> the postinst was calling the gtk-update-icon-cache for the hicolor theme =
which is not installed.

Yes, but you could also execute it only if hicolor exists or add
hicolor-icon-theme to RDEPENDS, executing gtk-update-icon-cache for each
subdirectory is not what I would expect from that commit message.

> >xcursor-transparent-theme or are you going to fix that?
>=20
> For xcursor-transparent-theme not providing the index.theme file, yeah it=
's really a problem,
> I can fix that, but maybe we should open another bug for it?

And do we need to call gtk-update-icon-cache in
xcursor-transparent-theme or in any other directory which happens to be
in ${datadir}/icons? Why not call it only for subdirs with index.theme?

> Thanks,
> Jackie
>=20
> >
> >Thanks,
> >
> >>
> >> Thanks,
> >> Jackie
> >>
> >> >and commit message of this change should be something like
> >> >gdk-pixbuf: call gtk-update-icon-cache for each subdir of ${datadir}/=
icons
> >> >not
> >> >gdk-pixbuf: fix the postinstall script failure when no icon is instal=
led
> >> >
> >> >Cheers,
> >> >
> >> >> > -test -x ${bindir}/gtk-update-icon-cache && gtk-update-icon-cache=
  -q ${datadir}/icons/hicolor
> >> >> > +if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/ico=
ns ]; then
> >> >> > +    for icondir in /usr/share/icons/*; do
> >> >> > +        if [ -d ${icondir} ]; then
> >> >> > +            gtk-update-icon-cache -q ${icondir}
> >> >> > +        fi
> >> >> > +    done
> >> >> > +fi
> >> >> >  }
> >> >> >
> >> >> >  PACKAGES_DYNAMIC +=3D "gdk-pixbuf-loader-*"
> >> >> >
> >> >> >
> >> >> > _______________________________________________
> >> >> > Openembedded-commits mailing list
> >> >> > Openembedded-commits@lists.openembedded.org
> >> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
commits
> >> >>
> >> >> --
> >> >> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >> >
> >> >
> >> >
> >> >--
> >> >Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >> >
> >
> >--
> >Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qtZFehHsKgwS5rPz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAtbgsACgkQN1Ujt2V2gByYDACgtpA5pwNuhvVHb9i7XWtgOqdD
3OkAoIFx6bA1f20JImGwKZ7w4WW+Zza6
=IRvR
-----END PGP SIGNATURE-----

--qtZFehHsKgwS5rPz--
