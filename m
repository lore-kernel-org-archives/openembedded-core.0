Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TOOJ6-00036r-Oi
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 09:44:49 +0200
Received: by mail-wi0-f169.google.com with SMTP id hq4so231922wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 00:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=t0iwesRuQzDsLyLa8+MYCKWCj78dZ3q7ThIYgnF2Jc4=;
	b=FLYR/10J8W7KSWDO+GZdozhRO98B5ffyCqdlhJMV2/WjP9gXFh1gI6eP5Uk1vROtQr
	d969BnwNZdY71Su+S+tRs/5bCuId8LlTPMWVYK1BEmJwBYXzP0jsRs5UgDylu6Ain8Bk
	2KqCru8/D/sohFke9FfH/vL3XUBQhSTl+oVdksY0izf3oswV+5cCRWru9di5V0b5b+2P
	hBDYZ5IPgdKBAoJlHg4JwixDw7oPZnKOdKsoc1TrANFKTmu6EGhL+wYX55xBRWI4Nfb6
	/aHg9JNL6BODsnNzxf8fCGheRU1FC45Ex/4nkwv2qxKlrOWbVDkmy06em2Jufqzda90M
	/e8A==
Received: by 10.180.99.133 with SMTP id eq5mr2005096wib.21.1350459091037;
	Wed, 17 Oct 2012 00:31:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gm7sm26200518wib.10.2012.10.17.00.31.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 00:31:28 -0700 (PDT)
Date: Wed, 17 Oct 2012 09:31:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patrick Turley <PatrickTurley@gamestop.com>
Message-ID: <20121017073136.GF3405@jama.jama.net>
References: <1350424046-18863-1-git-send-email-ferlandm@sonatest.com>
	<1350424046-18863-2-git-send-email-ferlandm@sonatest.com>
	<20121016223739.GB3405@jama.jama.net> <71077863.US7FUzvX2E@helios>
	<242F788A-5F02-496B-B9DF-F8F3B0633992@gamestop.com>
MIME-Version: 1.0
In-Reply-To: <242F788A-5F02-496B-B9DF-F8F3B0633992@gamestop.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"<openembedded-core@lists.openembedded.org>"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lmsensors: Initial commit.
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
X-List-Received-Date: Wed, 17 Oct 2012 07:44:49 -0000
X-Groupsio-MsgNum: 30618
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SxgehGEc6vB0cZwN"
Content-Disposition: inline

--SxgehGEc6vB0cZwN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 17, 2012 at 12:29:21AM +0000, Patrick Turley wrote:
> On Oct 16, 2012, at 6:28 PM, Paul Eggleton <paul.eggleton@linux.intel.com=
> wrote:
>=20
> > On Wednesday 17 October 2012 00:37:39 Martin Jansa wrote:
> >> On Tue, Oct 16, 2012 at 05:47:26PM -0400, Marc Ferland wrote:
> >>> Adds the lm_sensors applications. These consists of:
> >> Is it really needed in oe-core? why not meta-oe?
> >=20
> > I'm thinking meta-oe is the place for this. As a bonus, rrdtool is alre=
ady=20
> > there.
>=20
> I am not qualified to have an opinion either way - but I *am* curious abo=
ut the motivating rationale. What are the reasons that this should appear i=
n meta-oe?

oe-core as *core* for other layers, should have only the most important
metadata which are needed for all other layers, like toolchain etc.

A lot of embedded images does not include or need lmsensors, so it's
kind of extra package which does not need to be included in *core*.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SxgehGEc6vB0cZwN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlB+XtgACgkQN1Ujt2V2gBw2dgCcDVpBPWJtjD6CvTr1WKgxuTx4
/j0AoJT/oxs19gHZnYXGlrR4u9Ctu/1h
=hQgh
-----END PGP SIGNATURE-----

--SxgehGEc6vB0cZwN--
