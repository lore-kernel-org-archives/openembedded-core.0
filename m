Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9F8A26D74F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 16:20:13 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id d10so2380222eaj.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 08:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gJDnJc21S3Hp5APml0RM20nMZ5lKYkWdtodMcO8HZ2g=;
	b=CIA4MtQ0bEsfLXwp0CxSYNOcbgppMUug7HLZX1TOKKWUAJZEP6LiVPclT1WxtENY6w
	YmOBt+ELxTkltt5wOSp6DuEpnLAjPfqSQ6DYneKpgtJ/WBwuL4B8HCbQyx21/e8y66f3
	uKlLXgzZhtb83VFXo8bRXF6QMH8jtO6qdbs7EKi1GYC03CNZTPswJiX5sa0xWWRgIvsi
	QvVCjBjd+Ww54SEOWckfZcmOPw6MT1uzv25xOYPRys5Y75t/iHLamhg+CoR5eP0GqdNb
	aYqEXDFfhKayC202LcWE/w19UlYtAz38isXhKsBq3mJeZNLimUih7iZ23MKdldBarFt9
	0ulA==
X-Received: by 10.15.61.134 with SMTP id i6mr4304290eex.48.1384791614913;
	Mon, 18 Nov 2013 08:20:14 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	g47sm39310421eeo.19.2013.11.18.08.20.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 08:20:14 -0800 (PST)
Date: Mon, 18 Nov 2013 17:20:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Message-ID: <20131118162014.GH3727@jama>
References: <CANyK_8c67C4NL7mNf3LTDwurtfpeU+S5ts4+O2t+HiDv84YgaQ@mail.gmail.com>
	<52898177.5000303@windriver.com> <20131118114000.GB3727@jama>
	<1384775852.6460.214.camel@ted>
	<CANyK_8eR05HauKBOd3AoTMjibYBgZEhBSv5pN5Yt_+s2CavsNA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANyK_8eR05HauKBOd3AoTMjibYBgZEhBSv5pN5Yt_+s2CavsNA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg dependencies and update-alternatives
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
X-List-Received-Date: Mon, 18 Nov 2013 16:20:14 -0000
X-Groupsio-MsgNum: 47236
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kH8JNVvasRCCW1Oz"
Content-Disposition: inline

--kH8JNVvasRCCW1Oz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2013 at 03:31:09PM +0000, Paul Barker wrote:
> On 18 November 2013 11:57, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2013-11-18 at 12:40 +0100, Martin Jansa wrote:
> >>
> >> FWIW: current u-a implementation provided by opkg is in OE-classic and
> >> was in older poky/oe-core provided also in standalone recipe
> >> update-alternatives-cworth
> >>
> >> http://git.openembedded.org/openembedded/tree/recipes/update-alternati=
ves/update-alternatives-cworth_0.99.154.bb
> >>
> >> commit 44b538eedab7c255051fa3375f9f2439cd2db3dd
> >> Author: Marcin Juszkiewicz <hrw@openedhand.com>
> >> Date:   Wed Mar 19 15:36:01 2008 +0000
> >>
> >>     update-alternatives-cworth: dropped as they are now generated with=
 opkg recipe
> >
> > Turning this back into a standalone recipe might be worthwhile and seems
> > like the best way to address the problems.
> >
> > Paul: Have you any opinion of moving update-alternatives to its own
> > repository separate from opkg? or just check it into OE-Core as its just
> > a single script? Its not as if it really needs much from opkg at this
> > point?
>=20
> I'd be quite happy to break it out into a separate repo. I think
> that's better than direct inclusion into oe-core so that it remains
> easily usable by non-oe systems.

What about including it in opkg-utils repo? And maybe even providing u-a
by opkg-utils.bb?

opkg-utils.bb doesn't have any DEPENDS (Only python RDEPENDS) so it
would be good compromise between opkg and completely new recipe.

> >
> > I'm also wondering how it compares to the dpkg version (which is C
> > iirc). Should we switch to that? Does it give better performance?
> >
>=20
> The dpkg version does have more features but the dpkg recipe in
> oe-core says that it can't provide
> "virtual/update-alternative-native". I think the reason there is that
> it doesn't support installing to an offline target filesystem. I don't
> know how the performance compares but I don't think it's critical as
> it isn't a program that will be running very often on a target. The
> opkg version is probably more lightweight as it is a short shell
> script vs the 2,700 lines of C which make up the dpkg version.
>=20
> There is also an "alternatives" program in chkconfig which is listed
> as a possible provider of "virtual/update-alternatives" but again,
> trying to use in causes a dependency loop. I haven't given this
> version more than a quick glance though.
>=20
> Personally I'd say the dpkg version looks the best as it allows a user
> or script to query or change which alternative is selected whereas the
> opkg version only allows alternatives to be installed or removed. It
> would just need someone with the time to look into how it can be made
> to install links to a target filesystem rather than to the host
> filesystem. Unfortunately that isn't me at the moment.
>=20
> --=20
> Paul Barker
>=20
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kH8JNVvasRCCW1Oz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEUEARECAAYFAlKKPj4ACgkQN1Ujt2V2gBzewACWK2DEpb08pNYd0phDdl2brM9A
3gCeLK4PmtyB/y1pJjY2JkAS0WlR/5E=
=Ggw1
-----END PGP SIGNATURE-----

--kH8JNVvasRCCW1Oz--
