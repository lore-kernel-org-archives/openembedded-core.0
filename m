Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SujHL-0003gV-QA; Fri, 27 Jul 2012 14:04:23 +0200
Received: by weyr6 with SMTP id r6so1832409wey.6
	for <multiple recipients>; Fri, 27 Jul 2012 04:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2723DI0IiM/UgRsyZMFmdW/wHZ8fFtK+2j/8eU0XXoc=;
	b=ovBMWC1Bcoda8RAUP7np6OYEAnJBSaAQK2TiaQ2UWFMBIjYKRS8eucPilwgBoW/cPe
	qycuSTLEyAv6vfGO25fJKdb6j3PUvDyAFFIbrCysyzjwcijphR6W1Ul1ARtjM9vavjpF
	H/j03j2UfXOABZe5EFu2EGGkIBdHCoqEpkpDNK3JXo5FOfnCzH8BYaFk3kY3BL2lN00N
	HQmHCkHNcEsaU3EU9qFVsh5gY/V8iZS+xuxeNfZSEyU0OstqU45iWgYDcKBzUKD7iFLN
	ESsD1W6JsoWpjE6CNBzaQ72Pn0nWeB7X96DOuxWRLXnYz6xKz7GbVazpvn8iq31hz+jg
	Uoqg==
Received: by 10.180.83.234 with SMTP id t10mr6817717wiy.0.1343389972069;
	Fri, 27 Jul 2012 04:52:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm13523923wib.5.2012.07.27.04.52.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jul 2012 04:52:51 -0700 (PDT)
Date: Fri, 27 Jul 2012 13:52:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Cristian Iorga <cristian.iorga@intel.com>
Message-ID: <20120727115256.GK3621@jama.jama.net>
References: <20120726135324.6971710217@opal>
	<20120727110521.GH3621@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120727110521.GH3621@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Cristian Iorga : libpcap: upgrade to ver. 1.3
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
X-List-Received-Date: Fri, 27 Jul 2012 12:04:23 -0000
X-Groupsio-MsgNum: 26377
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gBYU9MM4gf8jKg2V"
Content-Disposition: inline

--gBYU9MM4gf8jKg2V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 27, 2012 at 01:05:21PM +0200, Martin Jansa wrote:
> On Thu, Jul 26, 2012 at 01:53:24PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 3f0cc742ea5d4788df26bb0592c294e5a67e1093
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3D3f0cc742ea5d4788df26bb0592c294e5a67e1093
> >=20
> > Author: Cristian Iorga <cristian.iorga@intel.com>
> > Date:   Tue Jul 24 08:36:57 2012 +0300
> >=20
> > libpcap: upgrade to ver. 1.3
> >=20
> > Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> This changes .so version so now libpcap package is renamed to libpcap1
> and breaks at least ppp and tcpdump recipes:
>=20
> /OE/openembedded-core/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
> /OE/meta-openembedded/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb
>=20
> I'll send PR bumps for those 2, but maybe there are more recipes
> depending on now non-existent libpcap.

And even with those PR bumps, upgrade path is broken and needs manuall
step

Upgrading tcpdump on root from 4.1.1-r1 to 4.1.1-r2...
Downloading http://jama.dyndns-home.com/org.openembedded.shr-core//armv4t/t=
cpdump_4.1.1-r2_armv4t.ipk.
Installing libpcap1 (1.3.0-r2.0) to root...
Downloading http://jama.dyndns-home.com/org.openembedded.shr-core//armv4t/l=
ibpcap1_1.3.0-r2.0_armv4t.ipk.
Upgrading ppp on root from 2.4.5-r5 to 2.4.5-r6...
Downloading http://jama.dyndns-home.com/org.openembedded.shr-core//armv4t/p=
pp_2.4.5-r6_armv4t.ipk.
Installing libpcap1 (1.3.0-r2.0) to root...
Collected errors:
 * check_data_file_clashes: Package libpcap1 wants to install file /usr/lib=
/libpcap.so.1
        But that file is already provided by package  * libpcap
 * check_data_file_clashes: Package libpcap1 wants to install file /usr/lib=
/libpcap.so.1
        But that file is already provided by package  * libpcap

RREPLACES_${PN} +=3D "libpcap" would probably help in this case.

Cheers,

>=20
> Cheers,
>=20
> > ---
> >=20
> >  .../{libpcap-1.2.1 =3D> libpcap-1.3.0}/aclocal.patch |    0
> >  .../ieee80215-arphrd.patch                         |    0
> >  .../libpcap/{libpcap_1.2.1.bb =3D> libpcap_1.3.0.bb} |    4 ++--
> >  3 files changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-connectivity/libpcap/libpcap-1.2.1/aclocal.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap-1.3.0/aclocal.patch
> > similarity index 100%
> > rename from meta/recipes-connectivity/libpcap/libpcap-1.2.1/aclocal.pat=
ch
> > rename to meta/recipes-connectivity/libpcap/libpcap-1.3.0/aclocal.patch
> > diff --git a/meta/recipes-connectivity/libpcap/libpcap-1.2.1/ieee80215-=
arphrd.patch b/meta/recipes-connectivity/libpcap/libpcap-1.3.0/ieee80215-ar=
phrd.patch
> > similarity index 100%
> > rename from meta/recipes-connectivity/libpcap/libpcap-1.2.1/ieee80215-a=
rphrd.patch
> > rename to meta/recipes-connectivity/libpcap/libpcap-1.3.0/ieee80215-arp=
hrd.patch
> > diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.2.1.bb b/meta/=
recipes-connectivity/libpcap/libpcap_1.3.0.bb
> > similarity index 73%
> > rename from meta/recipes-connectivity/libpcap/libpcap_1.2.1.bb
> > rename to meta/recipes-connectivity/libpcap/libpcap_1.3.0.bb
> > index 91bedf7..717e0e8 100644
> > --- a/meta/recipes-connectivity/libpcap/libpcap_1.2.1.bb
> > +++ b/meta/recipes-connectivity/libpcap/libpcap_1.3.0.bb
> > @@ -5,8 +5,8 @@ PR =3D "${INC_PR}.0"
> >  SRC_URI +=3D "file://aclocal.patch \
> >              file://ieee80215-arphrd.patch"
> > =20
> > -SRC_URI[md5sum] =3D "06046e0e81efc60566daf1cc96c77d46"
> > -SRC_URI[sha256sum] =3D "a135a6ef7e539729a57c7ed345bdb9b64159e134041740=
06a7972eb33f00debd"
> > +SRC_URI[md5sum] =3D "f78455a92622b7a3c05c58b6ad1cec7e"
> > +SRC_URI[sha256sum] =3D "41cbd9ed68383afd9f1fda279cb78427d36879d9e34ee7=
07e31a16a1afd872b9"
> > =20
> >  #
> >  # make install doesn't cover the shared lib
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

--gBYU9MM4gf8jKg2V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlASgRgACgkQN1Ujt2V2gBz+NwCeOJt7yfR4pQXWVWh8yMbtDmYV
TagAoKIcHAWoWoXEjbK9AHFoxpCvkwP8
=xbn5
-----END PGP SIGNATURE-----

--gBYU9MM4gf8jKg2V--
