Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RFjvK-0000Sq-Bi
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 11:55:59 +0200
Received: by bkat8 with SMTP id t8so5585099bka.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 02:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Gr8EKshp/C6CNET/Qik6rpH1U5ZL046eFmldINwLKE4=;
	b=YwoitGr+rgc9ZTlQcJnhG4IFxvQj7MqFGR1s3kbbNhPnhkc9Tz4fPPBIJNe4wWn3Dq
	Rd6uCqy2gAQK3uOg+QkheowXEzDTo81QNJzOByZASgrMa+T1zU3EUiKHn2O3h6gmAIrN
	efZV71u5OK+wVWPXpnJ402j0Mr2VPjcIJXrw0=
Received: by 10.204.136.16 with SMTP id p16mr13772564bkt.61.1318845010019;
	Mon, 17 Oct 2011 02:50:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w8sm2815752bks.11.2011.10.17.02.50.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 02:50:08 -0700 (PDT)
Date: Mon, 17 Oct 2011 11:50:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111017095002.GG12684@jama.jama.net>
References: <1318674260-8320-1-git-send-email-Martin.Jansa@gmail.com>
	<1318674260-8320-2-git-send-email-Martin.Jansa@gmail.com>
	<1318689013.3158.7.camel@lenovo.internal.reciva.com>
	<20111015143444.GD12684@jama.jama.net>
	<1318689610.3158.8.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1318689610.3158.8.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/2] mesa-dri: move extra DRIMODULES to EXTRA_DRIMODULES
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
X-List-Received-Date: Mon, 17 Oct 2011 09:56:00 -0000
X-Groupsio-MsgNum: 11113
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HKEL+t8MFpg/ASTE"
Content-Disposition: inline

--HKEL+t8MFpg/ASTE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 15, 2011 at 03:40:10PM +0100, Phil Blundell wrote:
> On Sat, 2011-10-15 at 16:34 +0200, Martin Jansa wrote:
> > On Sat, Oct 15, 2011 at 03:30:13PM +0100, Phil Blundell wrote:
> > > On Sat, 2011-10-15 at 12:24 +0200, Martin Jansa wrote:
> > > > * this way we can use
> > > >   EXTRA_DRIMODULES_armv4t +=3D ",glamo" in meta-openmoko layer and
> > > >   EXTRA_DRIMODULES_armv4t +=3D ",foo" in meta-bar layer without kno=
wledge
> > > >   of other modules in other layers in stack
> > >=20
> > > Is this really better than using "DRIMODULES_append_armv4t =3D ..."? =
=20
> >=20
> > the point is that you don't need to know who is setting swrast there for
> > armv4t...
>=20
> I'm not sure I understand what you're saying there.  Can you be more
> concrete?
>=20
> > >=20
> > > It's not really true that you can do it without any knowledge of what
> > > other layers are doing since if you end up with two competing
> > > EXTRA_DRIMODULES_foo overrides then one of them will get lost.
> > >=20
> >=20
> > so EXTRA_DRIMODULES_append_armv4t should be fine, right?
>=20
> Well, yes, but in that case it doesn't seem as though the EXTRA_ bit
> (and this patch) buys anything.

OK, forget this patch.. I've forgot this behavior of _append_armv4t
syntax.. and I've changed meta-openmoko to use this too.

can we change x86 and x86-64 examples in mesa-dri.inc to
DRIDRIVERS_append_x86 =3D ",i915,i965"
DRIDRIVERS_append_x86-64 =3D ",i915,i965"
so it will work as example for BSP layer maintainers that thay don't
need to care about setting
DRIDRIVERS =3D "swrast"
for their arch?

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HKEL+t8MFpg/ASTE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6b+koACgkQN1Ujt2V2gBwCiwCgn3vjuwkwjF2uGJdtZ5vZ+Y7I
9ToAnixKs0Fm0oYFL+7E0KwhcZAVljmL
=7Eb+
-----END PGP SIGNATURE-----

--HKEL+t8MFpg/ASTE--
