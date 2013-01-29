Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U09aV-0007yf-Vv
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 12:42:55 +0100
Received: by mail-pb0-f52.google.com with SMTP id uo5so225686pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 03:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=MFz8wpgW8z0WsNT3Cwk0wtnCibcZ4lLpze0EIemX3kk=;
	b=G77jKnkl4ktf6Sv96kVexItdKlu+f+ZNVMeZvTNgKDsMkQONxJ2CCjfzLXDAckOCMB
	J4uPWohEaS4fmvD4BZGzi3e2gO/uOJZo/Bn+P2OIomho0bqB9NeJxIk2WAM1G9CH9HXh
	5Z8ZUq8Q8lLnm3iPAzdbbQfSDgYqFBDF5FeuGyCtgwB88JcaRxx+MzwTXgAit9GaMlan
	m5nFd4mnN/RfY5mHD3NvaQPPFSxZFVeCCHnIPY0UZaSeGdKobzRxF0jjIOzY/KbQvOlE
	xIpeO8VDDXcnocGgjd0FR937ZusX62J7yfbXaghakDu2DTgNAf1QXb1eJe9Ay79NauvQ
	HzLA==
X-Received: by 10.68.189.163 with SMTP id gj3mr1458875pbc.110.1359458831667;
	Tue, 29 Jan 2013 03:27:11 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id m3sm8771250pav.4.2013.01.29.03.27.08
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 03:27:10 -0800 (PST)
Date: Tue, 29 Jan 2013 12:27:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20130129112706.GL16904@jama.palm1.palmone.com>
References: <51079663.60504@topic.nl>
	<20130129094059.GI16904@jama.palm1.palmone.com>
	<5107A295.2060307@topic.nl>
MIME-Version: 1.0
In-Reply-To: <5107A295.2060307@topic.nl>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Multiple MACHINE building is broken in OE-core?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 11:42:55 -0000
X-Groupsio-MsgNum: 34630
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GviraxgP0A7vmYdC"
Content-Disposition: inline

--GviraxgP0A7vmYdC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 29, 2013 at 11:21:09AM +0100, Mike Looijmans wrote:
> On 01/29/2013 10:40 AM, Martin Jansa wrote:
> > On Tue, Jan 29, 2013 at 10:29:07AM +0100, Mike Looijmans wrote:
> >> I often have several hardware boards sharing 99% of periferals and
> >> configuration. Usually they all have the exact same CPU, and the
> >> difference is in the minor details like the screen resolution.
> >>
> >> In "classic" OE I was used to sharing the work, by just changing the
> >> MACHINE variable I could create an image for a slightly changed board =
in
> >> a matter of minutes.
> >>
> >> In OE-core this seems to be horribly broken, unless there's some other
> >> procedure to follow.
> >>
> >> If I change the MACHINE, it insists on rebuilding all kinds of packages
> >> that don't need rebuilding at all. Instead of minutes, it takes an hour
> >> to switch machines. And if I change back, the same thing happens all
> >> over again.
> >>
> >> In addition to needlessly rebuilding dozens of packages for the same
> >> architecture, it often "starts" halfway through, so it tries to run the
> >> "deploy" phase for a package while the workspace has already been
> >> removed in the rm_work phase of the previous build. Which fails, so I
> >> have to manually reset stamps for that package and let it start over
> >> again (while usually the package shouldn't be rebuilt in the first pla=
ce).
> >>
> >> Is building for several machines no longer supported in OE-core? Or is
> >> there some secret way of setting up directories and variables that will
> >> make it work as it used to?
> >
> > It's more strict and every machine now has own sysroot (so it's doing a
> > bit more after MACHINE change then it did with OE-Classic), but it still
> > works. I'm using it like this.
>=20
> How are you using it? Because for me it doesn't work at all, it results=
=20
> in build errors and needless rebuilds on every switch. I've tried in=20
> three different environments, and it never works.
>=20
> (Needless rebuild: Built package X for machine A. Switch to B, and it=20
> will build X again, which isn't needed because they're for the same=20
> architecture and the package isn't dependent on the machine. Switch back=
=20
> to A, and it will AGAIN build package X, which is beyond just needless,=
=20
> it's a bug in my opinion.)

There were some bugs (lot of them reported by me in bugzilla) but in
current state it works correctly as long as checksums are correct.

Also depends on what you mean by "build",
do_configure+do_compile+do_install+do_package? or just
do_populate_sysroot?

> > Use openembedded-core/scripts/sstate-diff-machines.sh to compare your
> > machines and make sure that different checksums are only for
> > MACHINE_ARCH recipes.
>=20
> How? The tool only explains its commandline, but doesn't explain what=20
> it's supposed to do...

There is example in script header.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GviraxgP0A7vmYdC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEHsgoACgkQN1Ujt2V2gBzUAgCghLUULYoRFn2hTROt7wH6GyIk
n9AAoJUOVNjJsGS+UOowlTbVQdqBLDOw
=X4EF
-----END PGP SIGNATURE-----

--GviraxgP0A7vmYdC--
