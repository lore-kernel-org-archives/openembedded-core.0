Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SQCDV-0001aX-RB
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 08:42:13 +0200
Received: by wera1 with SMTP id a1so1763156wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 23:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EMsTmt46Bb6kXtn2ZMHFMxByfPzhrfObfLqi3s8hcZI=;
	b=N1Gh4W5XEWHv2t0qqRw9V1QAWt2fqmLT/oZxAeOJyfqGXnvJ8Y080e/AcHlRXHmbYw
	gpU59dYXSQMsEOt1ivxBrJi06RmVng5WLTe2wTFUhxI6+sEwyCoqYg6R8xVarGqqj92P
	eb4gXGc2ae0ADNAtGW+JLkRLVHCjPD73sFMbtMIn1BG50KT6b3izErKx61Y5G4KuNdIv
	4fdsqGVh1wlQA3rap4lNkg0rVLoZjI008OuFNM0RwmaWPKAhb/XSdPYfvSXMcpWpa1NL
	wwmTVx3NO+ONxdP5lKR69lDjPPTJjWBEfKM+OyQMFtuJDUxygNmmFGkM7xuZq9t7kSrm
	/s0Q==
Received: by 10.181.12.82 with SMTP id eo18mr9985179wid.2.1336113147629;
	Thu, 03 May 2012 23:32:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm11761794wiv.11.2012.05.03.23.32.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 23:32:26 -0700 (PDT)
Date: Fri, 4 May 2012 08:32:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120504063229.GC3163@jama.jama.net>
References: <1335968616-2436-1-git-send-email-jason.wessel@windriver.com>
	<CAMKF1soELbeTS=ZnH3bhUbJkcaUz_sdkhRcykntqc=2jNBcUrg@mail.gmail.com>
	<9295EE6F-5FFA-4FB4-B266-D8F45AAB2351@dominion.thruhere.net>
	<1336034822.30113.47.camel@ted>
	<D8900CA0-6986-4242-8AF1-7A65CC86FDDA@dominion.thruhere.net>
	<1336044241.30113.73.camel@ted>
	<481C530F-A851-4861-B261-9CBE17258D4B@dominion.thruhere.net>
	<1336045861.30113.83.camel@ted>
	<6C4B120A-3A7E-43F9-BA67-0A580B9D2911@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <6C4B120A-3A7E-43F9-BA67-0A580B9D2911@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] qemu-native: depend on unfs-server-native
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
X-List-Received-Date: Fri, 04 May 2012 06:42:13 -0000
X-Groupsio-MsgNum: 21642
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline

--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2012 at 08:13:06AM +0200, Koen Kooi wrote:
>=20
> Op 3 mei 2012, om 13:51 heeft Richard Purdie het volgende geschreven:
>=20
> > On Thu, 2012-05-03 at 13:39 +0200, Koen Kooi wrote:
> >> Op 3 mei 2012, om 13:24 heeft Richard Purdie het volgende geschreven:
> >>> The whole point with the qemu emulated machines is that you build them
> >>> and they work for new users easily and efficiently. I don't think
> >>> calling bitbake to build them and force the user into another wait is=
 a
> >>> good usability model to be promoting.
> >>=20
> >> OE-core should set the right example and teaching people that a global
> >> IMAGE_DEPENDS is OK is not the right example. Especially when it
> >> actually causes breakage, see below.
> >> If people insist that IMAGE_DEPENDS is the one and only way to provide
> >> the runqemu experience then at least put a big comment in the file
> >> saying why it's done and why people shouldn't be copy/pasting it into
> >> their layers.
> >> And an indiciation where the line is drawn would be nice as well, I
> >> can imagine that someone wants to add amazon EC2 support to runqemu
> >> and sends a patch to add the EC2 tools to IMAGE_DEPENDS.
> >=20
> > I'm happy to see a comment. The line is quite clear, the documentation
> > associated with the qemu images, the quick start guide and other manuals
> > assume we build qemu-native and friends and for usability this is a
> > clear win. The manuals do not document EC2 and it is not something we
> > expect a new user to need to do easily. Running an extra "bitbake xxx"
> > or including an extra configuration file would be perfectly reasonable
> > for those usage scenarios.
> >=20
> >>> I'm also slightly bemused that in previous discussions you've implied
> >>> build time is less relevant then functionality yet here you're taking
> >>> the opposite stance :).
> >>=20
> >> I get build *failures* for the qemu machines because I don't have mesa
> >> and sdl installed on the autobuilder. But you are right, I do think
> >> build time is less relevant than functionality.
> >=20
> > We should also consider setting up PACKAGECONFIG options in the qemu
> > recipe for these things so you can specify to build qemu-native without
> > sdl/gl easily. I appreciate that is going to be pretty nasty
> > implementation wise but I think it would help and in fact if someone
> > files the bug I'll mark it as a P1 for 1.3 since that does help
> > usability a lot.
>=20
> #2402 and it's already going the WONTFIX way

#2407 ?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+jd/0ACgkQN1Ujt2V2gByPtwCgk6hKhrGnOVAM7zcwEGs9qyW1
OZ8AoKWmvu9G1pv9OmT+U01U6Dl/evzg
=Ozet
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
