Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8D5DF6F70D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 22:05:34 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so4648802eek.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 15:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hng5DfQCvgPzuTDexIBUU97H69LJbuj1M5JP03a6COU=;
	b=C+w9tfnYhlfzERSIVMRAI9erC9xLYecaQFCiZ5Oq9WYctVjTj1/c7ua8X54DBjFUcH
	kNQt1cbSuT0/GC95RoUrhC//LzfuYdBRGiD/oFvPL15/jFgwb8AdUmUKmn0Xg4P0geId
	yPxnHNlGos/eOHp+ccuTTuRmxz/I6BVhYmn9fyj/vPjDMdHswimeeLWoK5U/ZDOtW6LY
	/NQr16M/AFt7TTqGV206wDYWHCQXpg7EPBbdkyx5yjsgVElz4tBZ2A9mMRhjgYusLdZj
	so8KSaVhBKriin9ZJsRAsGKjmEbFONkyt/zAfLAvtTSRi0BiK2ptHP8UojvpRB7v17aR
	7wlA==
X-Received: by 10.15.54.137 with SMTP id t9mr26021413eew.39.1395093935399;
	Mon, 17 Mar 2014 15:05:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x45sm42414760eef.15.2014.03.17.15.05.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Mar 2014 15:05:33 -0700 (PDT)
Date: Mon, 17 Mar 2014 23:05:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140317220552.GK3725@jama>
References: <cover.1394948105.git.raj.khem@gmail.com>
	<1395055876.3808.38.camel@ted>
	<CAMKF1sp+=gNJGsgAQAEhg2z_F1_fMG0_E7_j0ekBi+d_dPO-og@mail.gmail.com>
	<1395093175.3808.54.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1395093175.3808.54.camel@ted>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] systemd-211 upgrade and uclibc fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Mar 2014 22:05:36 -0000
X-Groupsio-MsgNum: 51297
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Mit9XoPEfICDqq/V"
Content-Disposition: inline

--Mit9XoPEfICDqq/V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2014 at 09:52:55PM +0000, Richard Purdie wrote:
> On Mon, 2014-03-17 at 09:06 -0700, Khem Raj wrote:
> > On Mon, Mar 17, 2014 at 4:31 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Sat, 2014-03-15 at 22:42 -0700, Khem Raj wrote:
> > >> Finally, managed to get systemd 211 to boot on uclibc and eglibc
> > >> on all supported qemu machines, this should fix bug #5940
> > >>
> > >> Additional functionality in uclibc is needed to support this
> > >> systemd
> > >>
> > >> gnutls, glib-2.0, intltool fixes are uclibc specific and are needed
> > >> to get uclibc images going
> > >>
> > >> util-linux fix is moulded to support uclibc
> > >>
> > >> I have been testing this fix on the qemuarm/qemuppc/qemumips/qemux86=
/qemux86-64
> > >> on both uclibc/eglibc images and its been working good.
> > >>
> > >> The following changes since commit 58aae40bbf8edd9c5ca70b2094eeb7243=
91f1993:
> > >>
> > >>   eglibc: Update SRC_URI to point to final download location (2014-0=
3-13 20:44:48 -0700)
> > >>
> > >> are available in the git repository at:
> > >>
> > >>   git://git.openembedded.org/openembedded-core-contrib kraj/systemd-=
211
> > >>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/lo=
g/?h=3Dkraj/systemd-211
> > >>
> > >> Khem Raj (7):
> > >>   uclibc: Implement clock_adjtime()
> > >>   uclibc: Remove iconv.h
> > >>   gnutls: Link in pthread explicitly for uclibc
> > >>   glib-2.0: Fix localedir expectations for uclibc
> > >>   util-linux: scanf_cv_alloc_modifier changed from 'as' -> 'ms'
> > >>   intltool: Define DATADIRNAME=3Dshare for uclibc based systems
> > >>   Upgrade to systemd 211+
> > >
> > > I tried this on the autobuilder, with and without the pulseaudio 4->5
> > > upgrade. The result was:
> > >
> > > http://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/=
builds/111
> > > http://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/=
builds/112
> > >
> > > so I'm afraid I can't take the systemd part of this series. Its getti=
ng
> > > late in the cycle for a pulseaudio 4->5 upgrade too :/
> >=20
> > I was fighting with runtime issues than the build time so I was
> > building minimal images for quick debug/test cycles.
> > my bad since I kept pulseaudio out of this pull request the systemd
> > patch that Martin had
> > was also left out.
> >=20
> >=20
> > >
> > > Does anyone have any strong opinions on this?
> >=20
> > Give it a shot, if you can otherwise it can wait, 208 still shows
> > issues with journald where journal
> > sometimes misses chunks of logs of chatty daemons for an interval of
> > time after few hours of running, I haven't seen this issue with 211
> > yet so this is an improvement.
> > however 208 will keep getting fixes it probably isnt a bad choice to
> > stick with for this release.
>=20
> FWIW Martin's patch showed a green build. I'm therefore more widely
> testing that combination.

I should say that my pulseaudio change was also motivated mostly to get
green build and to allow me to flash new image on my MACHINEs, and test sys=
temd
in runtime, but then I don't use pulseaudio in runtime, so it wasn't proper=
ly
tested there.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Mit9XoPEfICDqq/V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMnccAACgkQN1Ujt2V2gBzWDwCglumyyi+HL2lG0sBQE4/W+pzL
Ik4An2rv54+x8eetZmyxPFg0CTInPQ14
=CwgE
-----END PGP SIGNATURE-----

--Mit9XoPEfICDqq/V--
