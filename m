Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SoLl0-0004UR-FQ
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 23:44:38 +0200
Received: by wgbdr1 with SMTP id dr1so10842102wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 14:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=N+kOfjdnYBQRBDkR15QZXRu3mf+lyLqpbnEyYobjHFY=;
	b=kDNYmIlezj1snMxS38w45yMDMVngVvG5G0OBXUcm1eg0/AG7NynySmLH7T/NGp10Fp
	HeBVHjRQyVwKC0HfBBxW0ErbzKIKIq5qDKVQLJx01h7ACEBa41cL/zeRUll4DOLG/vvg
	sMAJ1xIi7OzTL4mVRXKb6uhbwAw+V1tObHLBAgtTsrTyv9y/wcGNPodt1zJQqxBbxAPZ
	3DA4QRKvunu+eRJcJNDtX/CiY6o3zRgmknqCQa69C0VqsgOaw/lEw74uoLrIDUHltv/Z
	K4ke3RbjDOXsaMEjmoMBxb+X5jJTuhmKCFBLS9l4jon1Wr3CIdosE9ecDoEa9Mb7w501
	+ezw==
Received: by 10.216.90.19 with SMTP id d19mr16618642wef.113.1341869608594;
	Mon, 09 Jul 2012 14:33:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e9sm37821556wiw.10.2012.07.09.14.33.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jul 2012 14:33:27 -0700 (PDT)
Date: Mon, 9 Jul 2012 23:33:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120709213324.GI6308@jama.jama.net>
References: <CAJTo0LZ1W6mD2mdadeqdvyVubgGSozcF_Nw8xbvr4fAsRgJK8A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ1W6mD2mdadeqdvyVubgGSozcF_Nw8xbvr4fAsRgJK8A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: The Mythical Sato Replacement
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
X-List-Received-Date: Mon, 09 Jul 2012 21:44:38 -0000
X-Groupsio-MsgNum: 25020
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="54ZiyWcDhi/7bWb8"
Content-Disposition: inline

--54ZiyWcDhi/7bWb8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 09, 2012 at 10:06:11PM +0100, Burton, Ross wrote:
> Hi all,
>=20
> I've been mulling over a replacement for the Sato environment for some
> time now, so I think it's time to talk about my thoughts and get more
> feedback from users of oe-core.
>=20
> Some background: back in 2007[1] Sato was designed to be an
> reference/demo PDA environment for mobile devices with (relatively!)
> high-DPI but physically small screens[2], such as the Sharp Zaurus and
> Nokia 770/N800/N810/etc.  It was designed to look visually distinctive
> compared to the competition at the time, and demonstrate all the
> features that a handheld PDA should have (at the time).  I think it's
> fair to say it mostly succeeded at that although it didn't exactly set
> the world on fire.
>=20
> Fast-forward five years: Sato is still part of oe-core and showing
> it's age and unsuitability for the requirements that oe-core now has
> compared to the original design requirements for Sato.
>=20
> So, what does oe-core require from a graphical environment?  As this
> is oe-core the list should be fairly short, so how about:
> - some way of launching arbitrary applications
> - a terminal
> - a text editor
> - a web browser
> - network configuration
> - an interactive test suite for verifying that various pieces of
> hardware are working: play a media file, show touchscreen events,
> display key events, and so on.  More about this later.
> - lightweight
>=20
> There's also a set of anti-requirements:
> - no half-baked PIM suite
> - no games
> - no giant dependency stack or tight integration into the rest of
> oe-core.  Pulling the Sato replacement out entirely, or reusing parts
> of it, should be easily done.
>=20
> Re-using an existing environment is one option but I don't think it's
> a great one.  LXDE is very minimal but the Windows 95 aesthetic isn't
> exactly attractive, XFCE is surprisingly large these days.  We don't
> really want much, so I think maintaining our own shell is a worthwhile
> investment.
>=20
> Hopefully there aren't any objections so far?  I'll assume not, and
> introduce my proposal for Project Shuku[3].
>=20
> Shuku will be a descendent of Sato, that is continue to use the
> Matchbox Window Manager, Desktop, and Panel; although the latter two
> will be updated for GTK+ 3.  All applications will be removed and
> fully reconsidered when adding back, so the text editor might well
> change from leafpad to something that had a release in two years,
> Midori is looking like a good web browser choice instead of Web, the
> PIM suite removed, and so on.
>=20
> The interesting bit is then the test application.  We need a graphical
> environment so that we can run applications specific to our needs (and
> the desktop handles this fine already) and verify that the system is
> in fact working correctly.  Currently this is done in an ad-hoc
> manner: using the music player to play audio files, gst-launch to play
> videos, poking at the the touchscreen to verify that it works.  I'm
> proposing a specific test application so that instead of attempting to
> use general purpose applications as test tools, we have a specific
> tool.
>=20
> For example, when playing back a video file it's important that any
> hardware acceleration available is actually used.  The test tool could
> play the file using GStreamer's playbin and then display the resulting
> pipeline so you can verify that VAAPI is being used, the correct audio
> sink, the correct network source, and so on.  To verify that the input
> devices are working, list them at the evdev level and let you see the
> raw events, display touches, and so on.
>=20
> I've also been considering the brave new world of Wayland.  Whilst
> porting to GTK+ 3 all of the X11-specific code can be logically
> separated so that a small Weston plugin can be written that integrates
> the pieces together.  This will give a Wayland-native graphical
> environment that is visually identical to the X environment.
>=20
> There's plenty of other things to discuss -- visual design and so on
> -- but that can wait for another day.
>=20
> So those are my thoughts.  Any comments?

Why not use enlightenment? It works good with meta-efl layer and it
looks like there will be E17 release after all :)
http://e17releasemanager.wordpress.com/
so we won't need to use so much stuff from svn recipes.

Cheers,

>=20
> Ross
>=20
> [1] Five years ago!
> http://www.burtonini.com/wordpress/2007/08/01/poky-linux-3-0-blinky-relea=
sed/
> [2] QVGA, for example, was explicitly not a target.  The Sharp Zaurus,
> a typical test device, had a VGA screen.
> [3] In the glorious tradition of naming projects by translating words
> to other languages, I ended up with =E5=B0=97 (U+5C17) which means "young=
er of
> brothers", and Shuku is one of the pronunciations.
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--54ZiyWcDhi/7bWb8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/7TiQACgkQN1Ujt2V2gBzwOwCeLaPdhnIWMoXwzvsfIG3i0s+g
EFIAnjLnGHyVJW6NLQpCdD+wwsRsxOCh
=+rAd
-----END PGP SIGNATURE-----

--54ZiyWcDhi/7bWb8--
