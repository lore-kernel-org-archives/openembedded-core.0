Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QCRWX-00078m-V3
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2011 09:08:29 +0200
Received: by fxm19 with SMTP id 19so308509fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2011 00:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=cu2p4JuDZsnxe3UBGN3sGssU+5dzn7R4aHXNv3gvf5k=;
	b=IQAtYS0F45BC4Gl+lb2GKNnTn/qDFko0N/5aN4GRgL7qrR3qaxuWEirJSpFNelP20o
	0XAbiw9Qn2PzDL8tQdDl8Dg9S2kka1cRdm8ikZA1FLHR7XqNumTOJOM9gD942jJ3UztV
	1e8diNGJsg03OPqmld6XHOvvWUeySjhN/i6nU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent;
	b=JYJswyJvhaXR9sBGcKs/xH6wHpgYVeVO6PAzADdyy+UH75xik5kyYGR1tVpYDVLJJ2
	EeTJD/fimOhzJ7fm7qqfytIv35/aGD02xP5P+PjAi0w7exi69eBGxGs03Uas4z/sciOh
	q94ifFAjCHwC6pYOvbIIv5yuFOrcttd7Aaj80=
Received: by 10.223.161.133 with SMTP id r5mr1697058fax.78.1303283167523;
	Wed, 20 Apr 2011 00:06:07 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id g5sm186271faa.2.2011.04.20.00.06.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2011 00:06:06 -0700 (PDT)
Date: Wed, 20 Apr 2011 09:06:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110420070605.GC5675@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <F7021822-B24C-446D-9A4E-8B1F7DAD9791@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/4] xf86-video-omapfb: add SRCREV to recipe
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
X-List-Received-Date: Wed, 20 Apr 2011 07:08:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2011 at 10:03:05AM +0200, Koen Kooi wrote:
>=20
> Op 18 apr 2011, om 10:00 heeft Martin Jansa het volgende geschreven:
>=20
> > * taken from meta/conf/distro/include/poky-default-revisions.inc for
> >  those who want xf86-video-omapfb and are not using poky
>=20
> Use the one in meta-oe :)

Koen: I do, just got this recipe once and wanted to make it usable. Not all
people using oe-core use poky as distro or their include files.

RP: Is there any problem with those 2 SRCREV patches? I've sent both twice
already.

Koen's advertiesment of meta-oe version is not reason to ignore oe-core
recipe I guess..

> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > .../xorg-driver/xf86-video-omapfb_git.bb           |    1 +
> > 1 files changed, 1 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb=
 b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
> > index 2714786..5281665 100644
> > --- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
> > +++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
> > @@ -13,6 +13,7 @@ PE =3D "1"
> > PR =3D "r1"
> > PV =3D "0.1.1+git${SRCPV}"
> >=20
> > +SRCREV =3D "044617665d6737f4909aab96f91b06261dff05d2"
> > SRC_URI =3D "git://git.pingu.fi/xf86-video-omapfb.git;protocol=3Dhttp \
> >             file://omap-revert-set-CRTC-limit.patch \
> >             file://omap-revert-set-virtual-size.patch \
> > --=20
> > 1.7.5.rc1

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


