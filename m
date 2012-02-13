Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RwqmY-0004gM-Dl
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Feb 2012 08:57:06 +0100
Received: by eekd41 with SMTP id d41so1464268eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Feb 2012 23:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BeGM34Nfm7aLakjcQLVQM1XRtxkNTDRd8OE2gmzNW/8=;
	b=TCRWGLvp+5rWXWJWsEoyxzegMY4cnr8mvAVFybC00n+5uVD1+z7Rq3888qKNA/6Qq/
	94KuyYTRbFFUemnM/pKsGHZkJzinM1k9BoRhgIqWXAGtVm6XC/xZOGQNl9uLKiWxbIjJ
	hUF/DPI8fhkpJk+SZ7uFhE15PtSggIyEkRzGU=
Received: by 10.14.98.135 with SMTP id v7mr5044010eef.27.1329119336771;
	Sun, 12 Feb 2012 23:48:56 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z47sm58268593eeh.9.2012.02.12.23.48.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 12 Feb 2012 23:48:55 -0800 (PST)
Date: Mon, 13 Feb 2012 08:48:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120213074852.GA3832@jama.jama.net>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<c68f6de298c35c25638ea3a5adeb06c97cd74036.1328510189.git.raj.khem@gmail.com>
	<4F30DC16.1050506@linux.intel.com>
	<CAMKF1sqTc3PA_4xNbp1751tA73pRazsvrFdwhomdELtb-25ZGg@mail.gmail.com>
	<4F314A73.8070406@linux.intel.com>
	<20120207231245.GA13160@sakrah.homelinux.org>
	<4F31BF7B.4040303@linux.intel.com>
	<CAMKF1sqCgiu0TnTj_rgvDgZ5+JE3uX+Y_5KvKmcfd4LDOAoF2Q@mail.gmail.com>
	<CAGDS+nmdBg8QyBPx6iuG0p0aaPfAU3kvE6jJbekvC2ne0XBedw@mail.gmail.com>
	<54DBF0D0-65DA-4444-8EF5-3E14ED8FE44F@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <54DBF0D0-65DA-4444-8EF5-3E14ED8FE44F@dominion.thruhere.net>
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
X-List-Received-Date: Mon, 13 Feb 2012 07:57:06 -0000
X-Groupsio-MsgNum: 17460
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline

--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 11, 2012 at 06:09:52AM +0100, Koen Kooi wrote:
>=20
> Op 11 feb. 2012, om 06:05 heeft Steve Sakoman het volgende geschreven:
>=20
> > On Tue, Feb 7, 2012 at 6:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> On Tue, Feb 7, 2012 at 4:19 PM, Saul Wold <sgw@linux.intel.com> wrote:
> >>>=20
> >>> Can you verify if you have a .la file in you sysroot?
> >>=20
> >>=20
> >> No its not there and thats the point we probably should learn to live
> >> with out it
> >> actually one of radical ideas I have is to get rid of all .la files in
> >> OE completely
> >> right now python modules e.g.  have them and thats wrong since they ne=
ver use it
> >> and there are other packages like that.
> >=20
> > FWIW, after a pull of oe-core today that included the zlib update I am
> > getting similar failures on meta/recipes-gnome/gtk+/gtk+_2.24.8.bb:
> >=20
> > | /bin/grep: /media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la:
> > No such file or directory
> > | /bin/sed: can't read
> > /media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la: No such
> > file or directory
> > | arm-poky-linux-gnueabi-libtool: link:
> > `/media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la' is not a
> > valid libtool archive
> > | make[4]: *** [libgdk-x11-2.0.la] Error 1
>=20
>=20
> It works if you -c cleansstate on a bunch of recipes, pango, cairo, fontc=
onfig, gtk+, etc

list for me

evas ecore fsogsmd pidgin elementary fsodeviced fsoaudiod subversion
python-evas libsoup-2.4 libeflvala efreet fsotdld poppler fsosystemd=20
fsousaged fsonetworkd gtk+ python-gst emotion mysql5 libfsotransport
libfsobasics gd libgsm0710mux gst-plugins-base iksemel fsodatad
webkit-gtk fsodatad epdf librsvg curl libsexy libfsosystem orbit2
libfso-glib pango eeze libshr-glib farsight2 id3lib gst-plugins-good=20
gst-plugins-ugly libnice libgpewidget matchbox-panel-2 edbus vte ethumb
glib-networking libgisi libfsoresource edje libfsoframework gconf file
libglade json-glib ethumb libcroco gnome-keyring libsdl-image neon
qt4-x11-free python-pygobject msmcomm-specs gnome-keyring libphone-ui
shr-wizard matchbox-keyboard matchbox-panel-2

And this isn't even on fully built feed :/.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk84wGQACgkQN1Ujt2V2gBz2VgCgoplaf6tl8tjyWPDH/BcIQWrl
olcAniGsdZzKh76GwdyOW8KAGM0YL9fO
=BoES
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
