Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rww9u-0006xl-Rj
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Feb 2012 14:41:34 +0100
Received: by eekd41 with SMTP id d41so1547713eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2012 05:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GlJt7zY210HG2nR6tg7M8vmVkB17iHMZlxUBi2+MDus=;
	b=Zp+r43c2PahDjUgf/RWDx+FoQaHYhLgn0g+2VXZ3rGftRd80afzzv7yMy1sYVhHg5d
	lcy8b04zIDVcZosv/QmIXUZ/1aT5J0SNYWmvhjb3ClpQ0ypVEJLp43J5h8QNffjq4kNz
	/Pb4arpgsDNaNAZrxAPJ4cfoab4C/gbUkQbzk=
Received: by 10.213.14.204 with SMTP id h12mr2725131eba.45.1329140004971;
	Mon, 13 Feb 2012 05:33:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v51sm61166609eef.2.2012.02.13.05.33.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 05:33:23 -0800 (PST)
Date: Mon, 13 Feb 2012 14:33:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120213133321.GC3832@jama.jama.net>
References: <4F30DC16.1050506@linux.intel.com>
	<CAMKF1sqTc3PA_4xNbp1751tA73pRazsvrFdwhomdELtb-25ZGg@mail.gmail.com>
	<4F314A73.8070406@linux.intel.com>
	<20120207231245.GA13160@sakrah.homelinux.org>
	<4F31BF7B.4040303@linux.intel.com>
	<CAMKF1sqCgiu0TnTj_rgvDgZ5+JE3uX+Y_5KvKmcfd4LDOAoF2Q@mail.gmail.com>
	<CAGDS+nmdBg8QyBPx6iuG0p0aaPfAU3kvE6jJbekvC2ne0XBedw@mail.gmail.com>
	<54DBF0D0-65DA-4444-8EF5-3E14ED8FE44F@dominion.thruhere.net>
	<20120213074852.GA3832@jama.jama.net>
	<CAGDS+nne1Xbe6XGPuLXqyMLOC_7uqYKFkbRuW77Ub672kpL7BA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGDS+nne1Xbe6XGPuLXqyMLOC_7uqYKFkbRuW77Ub672kpL7BA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 12/20] zlib: Upgrade 1.2.5 -> 1.2.6
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
X-List-Received-Date: Mon, 13 Feb 2012 13:41:35 -0000
X-Groupsio-MsgNum: 17464
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5G06lTa6Jq83wMTw"
Content-Disposition: inline

--5G06lTa6Jq83wMTw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2012 at 05:23:18AM -0800, Steve Sakoman wrote:
> On Sun, Feb 12, 2012 at 11:48 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Sat, Feb 11, 2012 at 06:09:52AM +0100, Koen Kooi wrote:
> >>
> >> Op 11 feb. 2012, om 06:05 heeft Steve Sakoman het volgende geschreven:
> >>
> >> > On Tue, Feb 7, 2012 at 6:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> >> On Tue, Feb 7, 2012 at 4:19 PM, Saul Wold <sgw@linux.intel.com> wro=
te:
> >> >>>
> >> >>> Can you verify if you have a .la file in you sysroot?
> >> >>
> >> >>
> >> >> No its not there and thats the point we probably should learn to li=
ve
> >> >> with out it
> >> >> actually one of radical ideas I have is to get rid of all .la files=
 in
> >> >> OE completely
> >> >> right now python modules e.g. =A0have them and thats wrong since th=
ey never use it
> >> >> and there are other packages like that.
> >> >
> >> > FWIW, after a pull of oe-core today that included the zlib update I =
am
> >> > getting similar failures on meta/recipes-gnome/gtk+/gtk+_2.24.8.bb:
> >> >
> >> > | /bin/grep: /media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz=
=2Ela:
> >> > No such file or directory
> >> > | /bin/sed: can't read
> >> > /media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la: No such
> >> > file or directory
> >> > | arm-poky-linux-gnueabi-libtool: link:
> >> > `/media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la' is not a
> >> > valid libtool archive
> >> > | make[4]: *** [libgdk-x11-2.0.la] Error 1
> >>
> >>
> >> It works if you -c cleansstate on a bunch of recipes, pango, cairo, fo=
ntconfig, gtk+, etc
> >
> > list for me
> >
> > evas ecore fsogsmd pidgin elementary fsodeviced fsoaudiod subversion
> > python-evas libsoup-2.4 libeflvala efreet fsotdld poppler fsosystemd
> > fsousaged fsonetworkd gtk+ python-gst emotion mysql5 libfsotransport
> > libfsobasics gd libgsm0710mux gst-plugins-base iksemel fsodatad
> > webkit-gtk fsodatad epdf librsvg curl libsexy libfsosystem orbit2
> > libfso-glib pango eeze libshr-glib farsight2 id3lib gst-plugins-good
> > gst-plugins-ugly libnice libgpewidget matchbox-panel-2 edbus vte ethumb
> > glib-networking libgisi libfsoresource edje libfsoframework gconf file
> > libglade json-glib ethumb libcroco gnome-keyring libsdl-image neon
> > qt4-x11-free python-pygobject msmcomm-specs gnome-keyring libphone-ui
> > shr-wizard matchbox-keyboard matchbox-panel-2
> >
> > And this isn't even on fully built feed :/.
>=20
> Indeed!  I gave up on trying to determine an exhaustive list and just
> blew away tmp and sstate and rebuilt everything -- including package
> repositories :-(
>=20
> We need to find a way to prevent or warn of disruptive changes like
> this zlib patch.  For those of us trying to make a living using Yocto,
> losing a day of productivity to things like this really stings.

I have 131 items in my list now, will send PR bumps today.

> Steve
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5G06lTa6Jq83wMTw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk85ESEACgkQN1Ujt2V2gBwwzgCfSWc+LNuPzTCrITMNUJHJnL5W
Re8AoJkUw9TaiuZ7CYCMnYBoD1wa09AP
=8lKu
-----END PGP SIGNATURE-----

--5G06lTa6Jq83wMTw--
