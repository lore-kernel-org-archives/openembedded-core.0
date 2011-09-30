Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9bOf-0005un-Gc
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 13:36:53 +0200
Received: by bke11 with SMTP id 11so1680553bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 04:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Okh5lrWCjD39HKtNecE/dl8Kma0BH3MoGLLqxiwC8JI=;
	b=nh3Bkt9EM2w4bSlJ4s6O9vvFgB7ypVa+yByqD+KSmxNlHp/9TCwrwRxIF9bkS4ct2Q
	YtVjaBoO5SXklDNe30V+7cVTU3xwZ1k+3Z8EsheWPAl6OSXLp6qbh8a2AGVYmRcS528e
	WndaP+GwU1eEw5QKI+FSttgDCqPMIPTJtS4fA=
Received: by 10.204.145.15 with SMTP id b15mr7191896bkv.372.1317382283587;
	Fri, 30 Sep 2011 04:31:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w3sm4635390bkp.10.2011.09.30.04.31.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 04:31:22 -0700 (PDT)
Date: Fri, 30 Sep 2011 13:31:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110930113116.GC15856@jama.jama.net>
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
X-List-Received-Date: Fri, 30 Sep 2011 11:36:53 -0000
X-Groupsio-MsgNum: 10279
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Clx92ZfkiYIKRjnr"
Content-Disposition: inline

--Clx92ZfkiYIKRjnr
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

Thanks,
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

I'll send updated patchset for this 7.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Clx92ZfkiYIKRjnr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6FqIMACgkQN1Ujt2V2gByhiwCZAUU4EEM7Z3P+9EIC9/YQFdCR
9UgAoLNu/mVvcu4QIo5wufDoIGKiSto5
=V1mF
-----END PGP SIGNATURE-----

--Clx92ZfkiYIKRjnr--
