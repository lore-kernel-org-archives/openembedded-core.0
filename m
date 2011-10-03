Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAg0j-0000fF-Gs
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 12:44:38 +0200
Received: by bke11 with SMTP id 11so5197318bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 03:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=G2UB4770sqxhoMx+mdUF719uA0/LKk4z/0k5f/kSih4=;
	b=cDSzeGWndVGzbUy41nJJ6/Vthndfl99BZqN0qx57vrT4pz0HawVwPT5l/l3GYz6Lj7
	+4vp/2gAkYbSGPr9g/LH1+CxJTdD6An9IAQRG39cQi4oh27ZoDt35omemQLZc9mp0wZt
	6VQSLNEY8BaEPpdniXnYsZ6gfk+PvvszDmhQ0=
Received: by 10.204.155.74 with SMTP id r10mr3211947bkw.244.1317638345304;
	Mon, 03 Oct 2011 03:39:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z7sm12723865bkt.5.2011.10.03.03.39.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 03:39:01 -0700 (PDT)
Date: Mon, 3 Oct 2011 12:38:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111003103855.GN7364@jama.jama.net>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
	<1317382126.12332.167.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1317382126.12332.167.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 00/13] Xorg related changes
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
X-List-Received-Date: Mon, 03 Oct 2011 10:44:38 -0000
X-Groupsio-MsgNum: 10388
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="um2V5WpqCyd73IVb"
Content-Disposition: inline

--um2V5WpqCyd73IVb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 12:28:39PM +0100, Richard Purdie wrote:
> On Fri, 2011-09-30 at 09:26 +0200, Martin Jansa wrote:
> > Hi,
> >=20
> > this patchset brings meta-oe and oe-core xorg stuff together and most o=
f=20
> > xorg recipes will be removed from meta-oe (sending another pull request=
 now).
> >=20
> > This step is needed to be able to separate common x11 to meta-x11 or wh=
atever later.
> >=20
> > The following changes since commit 96241de59fdf548ae0f80cc9e4668f9ba119=
24ef:
> >=20
> >   Fix flac build on e500mc cores (2011-09-29 19:31:38 +0100)
> >=20
> > are available in the git repository at:
> >   git://git.openembedded.org/openembedded-core-contrib jansa/x11
> >   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?=
h=3Djansa/x11
> >=20
> > Martin Jansa (13):
> >  xorg-driver: rename .inc files and merge some changes from meta-oe
> >  libxft, libxrender, renderproto: add native BBCLASSEXTEND
> >  xorg-app-common: merge some changes from meta-oe
> >  xf86-video-omapfb: bump SRCREV and add patch from meta-oe
> >  rgb: import from meta-oe layer
> >  libdrm: improve packaging
>=20
> I'll take these ones. I've queued them on a master-next branch for now
> as I want to give other people some time to comment on them. If there
> isn't negative feedback I'll take them in ~24 hours.
>=20
> I've given feedback on why I think these need further work:
>=20
> >   xserver-xf86: upgrade to 1.11.0 and move shared definitions to .inc
> >     files
> >   xserver-xf86-dri-lite: remove COMPATIBLE_HOST
> >   libx11: upgrade to 1.4.4
> >   default-providers: define PREFERRED_PROVIDER_virtual/libx11-native
> >   xserver-nodm-init: merge some changes from meta-oe
> >  glx-use-tls: add from meta-oe layer
> >  mesa: upgrade to 7.11

I've updated jansa/x11 branch according to your comments, now 17 patches
instead of 7 :).

Before I send updated pull-request, what do you think about renaming
xserver-xf86 to xserver-xorg which is closer to upstream naming and
that's how it's named in OE-classic and meta-oe? It would make meta-oe
transition easier and better to do it now then convert meta-oe to
xserver-xf86 and then rename it back later.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--um2V5WpqCyd73IVb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6JkL8ACgkQN1Ujt2V2gBzsyQCguoX85HeWl32dfF6vKrawzcYf
5TkAoI9qBSo1qWn/2o+uGvKi1ZOH1LVl
=e+BD
-----END PGP SIGNATURE-----

--um2V5WpqCyd73IVb--
