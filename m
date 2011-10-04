Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAzVl-0004Mb-Ae
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 09:33:57 +0200
Received: by bke11 with SMTP id 11so304561bke.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 00:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SyikaGIjQNUBrntX3AgGy2ltfTOEhgjfnHDXN5MEOWs=;
	b=ldWIrKE6lp9ashRj4bsEsB8R2+z7uxNO9On0D39MV1yXI24PVWaixGq9rl4eTP7PKu
	wxRZD8Eg19QRqqlmVG8LzdBNEj3YixTXMxpguGkEt4PKO54GM1vvd87MpTPh/37bgMBk
	WwtyPBoQpypZIMsWkN8QISUk+AHQc81jHHoZc=
Received: by 10.204.142.200 with SMTP id r8mr469791bku.213.1317713304220;
	Tue, 04 Oct 2011 00:28:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j16sm15535408bks.3.2011.10.04.00.28.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Oct 2011 00:28:23 -0700 (PDT)
Date: Tue, 4 Oct 2011 09:28:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111004072817.GB19366@jama.jama.net>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
	<7a380e5d1538c175e164b2d249d182c723fcda15.1317648040.git.Martin.Jansa@gmail.com>
	<1317657635.13337.10.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1317657635.13337.10.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCHv2 04/30] xf86-video-omapfb: bump SRCREV and add patch from meta-oe
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
X-List-Received-Date: Tue, 04 Oct 2011 07:33:57 -0000
X-Groupsio-MsgNum: 10462
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Content-Disposition: inline

--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 03, 2011 at 05:00:35PM +0100, Phil Blundell wrote:
> On Mon, 2011-10-03 at 15:28 +0200, Martin Jansa wrote:
> > From: Martin Jansa <martin.jansa@gmail.com>
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---

Sorry about 3 SOB lines... it's because I had it from
oe-core/master-next, but I belive RP will merge master-next first where
it's only with his and mine SOB.

> This is a bit of a lame checkin message.  "Add patch from meta-oe"
> doesn't really say anything useful about what you're changing, and there
> is no long comment at all.  Also ...

Rotation didn't work when using VFRB, this patch is fixing that and is from=
=20
koen upstream repo as patch header says and I cannot probably describe it=
=20
better then original author.

> >@@ -1,25 +1,25 @@
> >-require xorg-driver-driver.inc
> >+require xorg-driver-video.inc
> >=20
> > SUMMARY =3D "X.Org X server -- Texas Instruments OMAP framebuffer drive=
r"
> >
> > DESCRIPTION =3D "omapfb driver supports the basic Texas Instruments OMA=
P \
> > framebuffer."
> >
> >-LICENSE =3D "MIT-X"
> >-LIC_FILES_CHKSUM =3D "file://src/omapfb-driver.c;beginline=3D1;endline=
=3D30;md5=3Da44c2a37e04d1c2c5f0313afb493f833"
> >+LICENSE =3D "MIT-X & GPLv2+"
> >+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D63e2cbac53863f60e2f43343fb34=
367f"
> > DEPENDS +=3D "virtual/libx11"
>=20
> ... these changes don't seem to be covered by the description above.

because COPYING file wasn't available in SRCREV used in old oe-core
version.. so this change is just simplification and improving license
metadata, because original MIT-X src/omapfb-driver.c doesn't cover what
was explained in COPYING file:
The src/omapfb.h header is under the GPL license.

> And, finally, if this is an OMAP-specific driver, why is it in oe-core
> in the first place?  I would have thought it would be better placed in
> meta-ti or some such layer.

We've discussed it on oe-devel ML already
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-September/0347=
81.html

now we have very similar recipes in oe-core and meta-oe which is imho
worst case.. I'm fine with dropping it from oe-core and keeping it in
meta-oe, but I would prefer to keep it in meta-oe ie because
nokia900.conf is maintained in meta-smartphone layer and I don't want to
add meta-ti as dependency just because this one recipe.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6KtZEACgkQN1Ujt2V2gBz2pACeP792OS5462wxZhbDIGckwwUL
HkIAn19lGUy4WTreXXUqbfq8iF4XyXL/
=kK87
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--
