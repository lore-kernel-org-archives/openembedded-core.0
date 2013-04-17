Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USOPQ-0007gQ-8Z
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 11:12:18 +0200
Received: by mail-da0-f45.google.com with SMTP id v40so690582dad.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 01:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=H2sayJnvrgJ3erf/z6jx4jz0ATcMXtmB+BSNb4mDcbQ=;
	b=Ra6p7wqGdm7UjZJ3WQLv5ZUTgvccF5HaUJtj0K7m+Z8RSJgWrxowqxy/SKeggQQ81P
	rNqfct9xNHQT+gIK5ijL8P1t6FqoyqHoVO0Im0DZ98+w22b9glA8sqFfLZCCxuITSxLQ
	kCrrFydP3O8m+r68bb5qG7ELE6oIkKmoQ+mw3Bc8pd9oRVClvm1VDTP3UKc+HgmAOuKY
	ooNYgUvrk3LO4u8SfoKTcZal+zP8oFtYIpovmeuznXmwa567LqHll/CAtzAYeNACokdB
	5NpieXmr0XlYabAZ4Ytw/ukq8WTmFXO6oDypDlWrbCm9oHbXU68synz7nj+2I2BmUcbN
	HYhQ==
X-Received: by 10.66.167.69 with SMTP id zm5mr7826303pab.90.1366188876222;
	Wed, 17 Apr 2013 01:54:36 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id br2sm5504419pbc.46.2013.04.17.01.54.33
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 01:54:35 -0700 (PDT)
Date: Wed, 17 Apr 2013 10:54:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130417085434.GA26007@jama>
References: <cover.1365797632.git.paul.eggleton@linux.intel.com>
	<1366146366.8670.102.camel@ted>
	<20130416214108.GD29302@jama.dyndns-home.com>
	<3552064.n2jxC3Or99@helios>
MIME-Version: 1.0
In-Reply-To: <3552064.n2jxC3Or99@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] classes/sanity: fix handling of bblayers.conf updating
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
X-List-Received-Date: Wed, 17 Apr 2013 09:12:24 -0000
X-Groupsio-MsgNum: 38056
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline

--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2013 at 12:25:14AM +0100, Paul Eggleton wrote:
> On Tuesday 16 April 2013 23:41:08 Martin Jansa wrote:
> > On Tue, Apr 16, 2013 at 10:06:06PM +0100, Richard Purdie wrote:
> > > On Tue, 2013-04-16 at 19:09 +0200, Martin Jansa wrote:
> > > > OK, so it's different than hangs I'm seeing here, because I'm still
> > > > seeing them with latest oe-core>=20
> > > Yes, that was almost certainly a different issue.
> > >=20
> > > > $ . ./oe-init-bitbake-build-env && bitbake my-image
> > > > Altered environment for machine@distro development (this is from
> > > > oe-init-bitbake-build-env) # and nothing else is shown after that
> > >=20
> > > So just to ensure I understand this, it never prints any messages at
> > > all?
> >=20
> > yes nothing at all from bitbake, only that echo from setup script
> > (oe-init-bitbake-build-env)
>=20
> Are you sure it's not getting stuck doing a fetch as a result of a non-fu=
lly-
> specified SRCREV?

That would show some git process in ps/htop tree and got stuck after
showing build summary.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFuY0oACgkQN1Ujt2V2gBwomACeLqVh0hCm8ow8FK31Oeojst3m
0SYAmQHWYbfSLCLeqvB/MlLkqqV5AdDw
=4J1Y
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
