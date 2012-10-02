Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TIxfT-0004M7-AH
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 10:17:28 +0200
Received: by wibhj13 with SMTP id hj13so397104wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2012 01:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ta0iukfLaQf8TW7J7CpRKuMKGECWZbrF1ve+Dm5QKJ8=;
	b=OQKt/3iCqe5xjM7VvplCdZITvyyLn79zkWN6Ws3PVp6HjgcrgQRBi6/tJnkFMpdIfz
	tzV3/LuFP6SCyxyIjA2jJ1ZDFh3Dwv06u0Ra/gD/fQYtYznYXtYKEYBywwLZXatMT8sT
	n65j1q2yTAtjrHktAafgY5n+/ZXTmmTSOutgjTrJ8rl+fK2WRupReg3SPGWVEuCVGiHX
	tf0xCgyCR15UqBIizgQ7ybr+AAOkMuHA21zy+lRrlY+9keJoevqLaULHY6kjawmkH/es
	H9qO0wPlSxZg1MckkZNFTXu3tVgi6ZcTQke5R7rbWKb0tAWPZzP8ClaIDJ4J44+AOiYG
	qtcA==
Received: by 10.216.198.80 with SMTP id u58mr8574488wen.204.1349165069298;
	Tue, 02 Oct 2012 01:04:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm20469640wib.10.2012.10.02.01.04.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Oct 2012 01:04:27 -0700 (PDT)
Date: Tue, 2 Oct 2012 10:04:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121002080430.GF3454@jama.jama.net>
References: <1348866282-30437-1-git-send-email-koen@dominion.thruhere.net>
	<1348867656.15753.86.camel@ted>
	<BCD7AC26-F8DD-4A25-92CC-9E8324C9AC09@dominion.thruhere.net>
	<1349097681.15753.100.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1349097681.15753.100.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "opkg svn: respect to the arch priority"
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
X-List-Received-Date: Tue, 02 Oct 2012 08:17:28 -0000
X-Groupsio-MsgNum: 30203
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3yNHWXBV/QO9xKNm"
Content-Disposition: inline

--3yNHWXBV/QO9xKNm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 01, 2012 at 02:21:21PM +0100, Richard Purdie wrote:
> On Sat, 2012-09-29 at 15:34 +0200, Koen Kooi wrote:
> > Op 28 sep. 2012, om 23:27 heeft Richard Purdie <richard.purdie@linuxfou=
ndation.org> het volgende geschreven:
> >=20
> > > On Fri, 2012-09-28 at 23:04 +0200, Koen Kooi wrote:
> > >> This completely breaks installing packages from feeds:
> > >>=20
> > >> root@bone-mainline:~# opkg install libgtk-2.0
> > >> Installing libgtk-2.0 (2.24.8-r7.1) to root...
> > >> Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk=
/eglibc/armv7a-vfp-neon/base/libgtk-2.0_2.24.8-r7.1_armv7a-vfp-neon.ipk.
> > >> Installing pango (1.30.0-r1.1) to root...
> > >> Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk=
/eglibc/armv7a-vfp-neon/base/pango_1.30.0-r1.1_armv7a-vfp-neon.ipk.
> > >> Installing pango-module-basic-x (1.30.0-r1.1) to root...
> > >> Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk=
/eglibc/armv7a-vfp-neon/base/pango-module-basic-x_1.30.0-r1.1_armv7a-vfp-ne=
on.ipk.
> > >> Installing pango-module-basic-fc (1.30.0-r1.1) to root...
> > >> Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk=
/eglibc/armv7a-vfp-neon/base/pango-module-basic-fc_1.30.0-r1.1_armv7a-vfp-n=
eon.ipk.
> > >> Installing shared-mime-info (0.91-r4.9) to root...
> > >> Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk=
/eglibc/armv7a-vfp-neon/base/shared-mime-info_0.91-r4.9_armv7a-vfp-neon.ipk.
> > >> Installing gdk-pixbuf-loader-png (2.24.1-r7.1) to root...
> > >> Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk=
/eglibc/armv7a-vfp-neon/base/gdk-pixbuf-loader-png_2.24.1-r7.1_armv7a-vfp-n=
eon.ipk.
> > >> Installing gdk-pixbuf-loader-jpeg (2.24.1-r7.1) to root...
> > >> Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk=
/eglibc/armv7a-vfp-neon/base/gdk-pixbuf-loader-jpeg_2.24.1-r7.1_armv7a-vfp-=
neon.ipk.
> > >> Installing libjpeg8 (8d+1.2.1-r1.1) to root...
> > >> Configuring pango-module-basic-x.
> > >> Configuring pango.
> > >> Configuring pango-module-basic-fc.
> > >> Configuring shared-mime-info.
> > >> Configuring hicolor-icon-theme.
> > >> //var/lib/opkg/info/hicolor-icon-theme.postinst: line 11: gtk-update=
-icon-cache: command not found
> > >> Configuring gdk-pixbuf-loader-png.
> > >> Collected errors:
> > >> * opkg_download_pkg: Package libjpeg8 is not available from any conf=
igured src.
> > >> * opkg_install_pkg: Failed to download libjpeg8. Perhaps you need to=
 run 'opkg update'?
> > >> * opkg_install_cmd: Cannot install package libgtk-2.0.
> > >> * pkg_run_script: package "hicolor-icon-theme" postinst script retur=
ned status 127.
> > >> * opkg_configure: hicolor-icon-theme.postinst returned 127.
> > >=20
> > > I'm not entirely seeing the connection to this patch based on the abo=
ve
> > > errors.=20
> > >=20
> > > Also did you try opkg with the new options? I'm not saying there isn'=
t a
> > > problem but some help in figuring out how to resolve this would be go=
od.
> >=20
> > I'll see if the new option help next week, but even if they do, needing=
 to use opkg install --unbreak-me is unacceptable.
>=20
> What I'm wondering if whether we can change the default and make
> everyone happy. I'm waiting to hear back on the test to decide what to
> do here.

I can confirm that opkg upgrades and images are broken now.

e.g. tzdata is now allarch, since
http://git.openembedded.org/openembedded-core/commit/?id=3D23bf856215fa7c34=
a71d6086ee355f7c0672dbab

but opkg is installing old 2012d-r0 and trying to downgrade it on images
built with older opkg:
"Not downgrading package tzdata on root from 2012d-r2 to 2012d-r0."

It was in arch with higher prio (exactly the use-case I said in original di=
scussion of this patch).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3yNHWXBV/QO9xKNm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBqoA4ACgkQN1Ujt2V2gBx+zwCeODmoP/9gbzrZNmpTF/6kw1bL
xDEAnA2U7o8AX8Fhw7fH7PYStozkOVSA
=OD98
-----END PGP SIGNATURE-----

--3yNHWXBV/QO9xKNm--
