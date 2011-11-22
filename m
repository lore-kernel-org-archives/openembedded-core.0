Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RSkUw-0007DZ-Bg
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 08:10:31 +0100
Received: by faat2 with SMTP id t2so66076faa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 23:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7V9v1vrK4dXpTGyy9UstHj0qtvgsu9rHZeeHJ7X2WX4=;
	b=BiyV2u49b7Ukl7W5Z3l7LTf3v6cp1P2Xa/KMg1OfeDf7KcvEnUC9MfeVdiiZ8j5lu5
	Uf/J20xw8/skOkEdIywnStnWa7CJxrFZn3siLcS8msmyoU6cMcKY4mw6lSUy3XgCi6rp
	o9cTKrEsPY95sMdOpr8Arctk0YZP0XAnHFwgA=
Received: by 10.152.105.211 with SMTP id go19mr10917267lab.31.1321945436002;
	Mon, 21 Nov 2011 23:03:56 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hh9sm11783362lab.1.2011.11.21.23.03.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Nov 2011 23:03:55 -0800 (PST)
Date: Tue, 22 Nov 2011 08:03:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111122070353.GO3565@jama.jama.net>
References: <1321899155-19575-1-git-send-email-koen@dominion.thruhere.net>
	<1321899155-19575-2-git-send-email-koen@dominion.thruhere.net>
	<20111122070241.GN3565@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111122070241.GN3565@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC][PATCH 2/2] pulseaudio: update to 1.1, delete 0.9.x
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
X-List-Received-Date: Tue, 22 Nov 2011 07:10:32 -0000
X-Groupsio-MsgNum: 12699
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OmL7C/BU0IhhC9Of"
Content-Disposition: inline

--OmL7C/BU0IhhC9Of
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2011 at 08:02:41AM +0100, Martin Jansa wrote:
> On Mon, Nov 21, 2011 at 07:12:35PM +0100, Koen Kooi wrote:
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > ---
> >=20
> > As indicated in the subject, this is an RFC, please review and test.
> >=20
> > 1) the ARM_INSTRUCTIONSET workarounds have been removed, so for people =
using thumb1, please test
>=20
> where is libjson?
> ERROR: Nothing PROVIDES 'libjson' (but
> /OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseau=
dio_1.1.bb
> DEPENDS on or otherwise requires it

nevermind, I'm still sleeping, now I see 1/1 too

sorry
>=20
> Cheers,
>=20
> > 2) this is only buildtested on armv7a, more buildtests and runtime test=
s are on their way, so please test=20



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OmL7C/BU0IhhC9Of
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7LSVkACgkQN1Ujt2V2gBz3NwCgupU3lf1P6pZ2qslxfgcEOxB8
IG8Anj3JdfzLBZdmUUgxHaKFCCZRb4l6
=v61J
-----END PGP SIGNATURE-----

--OmL7C/BU0IhhC9Of--
