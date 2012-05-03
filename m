Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SPsVg-0005iS-Ch
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 11:39:40 +0200
Received: by bkcjm2 with SMTP id jm2so1258796bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 02:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=A6BWjDaaTyL6p9+RDuTsXk/2jLLzMWbiXBJ/2xHcBWI=;
	b=iwDw98LOR+kXipBgAcnJWJqBXv/MBK2+4w4MIlFGPCvA3vrANm5by6sBi0LwZPliFt
	uyoVLP7Epal1Tr+DGDNO34KV+gemEi1YBkuOYW2AaQ5VCWsQR+jSteCM/kUa8fgk1B/u
	WnKpKT9C4GuoHrKODJobtcs3nqj7xFmzi9DWSOI5wek4zJDc7TCxx7rseiNBrJwYDsJe
	ApRnJz2gRP0R82AXmeFi5S24CZ5W9+sB0/1MDzWa/5+2rMrntA43Z/FlvZGBdtZsm/9/
	J31n7oKyXl8yuxcmkO2pUFFLxMzguUtW/C29H7hNBXPWM/ejICb5N1Ztzv2NXXZNyfxr
	QJcQ==
Received: by 10.204.152.203 with SMTP id h11mr452818bkw.122.1336037395082;
	Thu, 03 May 2012 02:29:55 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fw10sm1432184bkc.11.2012.05.03.02.29.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 02:29:54 -0700 (PDT)
Date: Thu, 3 May 2012 11:29:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120503092955.GE4658@jama.jama.net>
References: <cover.1335967122.git.Martin.Jansa@gmail.com>
	<eec6dc7f29ff7e5297e2827196cc81ffd9a76831.1335967122.git.Martin.Jansa@gmail.com>
	<20120502140940.GB3682@jama.jama.net> <4FA1A25F.9030502@gmail.com>
	<20120503053806.GC4658@jama.jama.net>
	<CAMKF1so4ut2C8xKXqSV9KXG1pYN9bqqbDCXFYiyR0L+x_rHJbg@mail.gmail.com>
	<20120503054649.GD4658@jama.jama.net>
	<1336035344.30113.51.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1336035344.30113.51.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] site/arm-common: alignment values for guin32, guin64 and unsigned long
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
X-List-Received-Date: Thu, 03 May 2012 09:39:40 -0000
X-Groupsio-MsgNum: 21561
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FEz7ebHBGB6b2e8X"
Content-Disposition: inline

--FEz7ebHBGB6b2e8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 03, 2012 at 09:55:44AM +0100, Richard Purdie wrote:
> On Thu, 2012-05-03 at 07:46 +0200, Martin Jansa wrote:
> > On Wed, May 02, 2012 at 10:44:05PM -0700, Khem Raj wrote:
> > > On Wed, May 2, 2012 at 10:38 PM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
> > > > On Wed, May 02, 2012 at 02:08:47PM -0700, Khem Raj wrote:
> > > >> -----BEGIN PGP SIGNED MESSAGE-----
> > > >> Hash: SHA1
> > > >>
> > > >> On 05/02/2012 07:09 AM, Martin Jansa wrote:
> > > >> > On Wed, May 02, 2012 at 03:59:45PM +0200, Martin Jansa wrote:
> > > >> >> From: Tomas Frydrych <tomas@sleepfive.com>
> > > >> >>
> > > >> >> These are required to build recent versions of glib-2.0
> > > >> >
> > > >> > similar patch is needed also for other site files, just noticed =
it
> > > >> > while building for qemux86-64
> > > >>
> > > >> would you also include rest of architectures too please ?
> > > >
> > > > I did for x86 and x86-64, for the rest I don't know the right value=
s or
> > > > care enough to find them somewhere.
> > >=20
> > > will this upgrade break glib for architectures that have wrong values
> > > for these vars ?
> > > if answer is yes then I think we should do that before applying this
> > > upgrade otherwise
> > > it will be a regression
> >=20
> > glib-2.32.1 will build there fine, but glib-2.32.2 will fail during
> > do_configure, so yes someone should add those.
>=20
> Lets be really clear about this, glib 2.32.1 will build fine but crash
> at runtime due to divide by zero errors.

FWIW: I've seen it on one device and only in midori (in same batch of
upgrades with bring newer midori and newer gcc, so at the time I was
sending glib-2.32.1 I didn't know midori fails and it was working for me
in other apps).

That's why I sent follow-up patch to upgrade to 2.32.2 which will not
build on architectures without this so it will never go to runtime and
people which are building for e.g. mips will notice that soon enough.
=20
> I'm not taking any glib patches until we have this working on the core
> architectures we support.

True, hopefully now the maintainers or even owners of those
architectures will do their job and add those site config values.
=20
> Please can people not send upgrades which knowingly break things. I'm
> fine having a fairly aggressive set of updates but anything with serious
> breakage like this will get reverted and cause me to consider patches
> from those person long and hard with a lot of testing before merging in
> future.

And I'm pretty sad from contributing something in my free time and then
being asked over and over again to fix stuff I've never used/built
before. So this patchset is probably last one from me to oe-core/meta-oe
and now I'll care only about stuff in meta-smartphone and for other
layers just fill bug reports/feature requests to keep paid developers
busy and enjoy my free time in other ways..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FEz7ebHBGB6b2e8X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+iUBMACgkQN1Ujt2V2gBzYrgCfZiK3/2MB7gvL5adnmuHcrU1F
w/8An19VW7epVIF/jQ+jQqJD+GEg496A
=RgXy
-----END PGP SIGNATURE-----

--FEz7ebHBGB6b2e8X--
