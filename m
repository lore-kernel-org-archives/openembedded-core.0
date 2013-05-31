Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 98462608F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 17:34:38 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id q15so1957913ead.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 10:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iXvEakE6+Pw+Nk0bF2QuzbK7DCFWOAOi8Co7l1iRi7Y=;
	b=iCKynQZJMxXZv4tAX6phVC8IJc2msPihyMXCgCh08xdgsFJ59nFRyX0VjCSWPpQpYF
	V2SzTvzNmE7JCrQA5E05fzPXKfOFXxL1FyADYbK5R5DBigYxX4gIzwRD1VX6gzSh1ZHg
	iTpR3N6B7igd1YSSbH+xza9JyslNkhTr7O+yIwPX69WqZo+7e6eihkUepv5e5Q2zhcXa
	8mteL2FUwyH/jaW4f1WwHHRADa8rw+m+1hxlv3s6K/vq5uRBB/5xlEezxMEQNS7TcTtz
	EKixaWtLvtn6aGtZYdJle0flaJJKROigccLQXCruwNHTV7xzdWt5NBXam1x61/AYzSWw
	9TCw==
X-Received: by 10.15.68.194 with SMTP id w42mr621623eex.59.1370021678681;
	Fri, 31 May 2013 10:34:38 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e1sm34013028eem.10.2013.05.31.10.34.36 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 31 May 2013 10:34:37 -0700 (PDT)
Date: Fri, 31 May 2013 19:34:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130531173450.GC23802@jama>
References: <51781746.2000509@linux.intel.com>
 <2278334.0GkpBHEP1r@helios>
MIME-Version: 1.0
In-Reply-To: <2278334.0GkpBHEP1r@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Darren Hart <dvhart@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "Garman,
	Scott A" <scott.a.garman@intel.com>
Subject: Re: Stable Release Process
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
X-List-Received-Date: Fri, 31 May 2013 17:34:39 -0000
X-Groupsio-MsgNum: 40087
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8NvZYKFJsRX2Djef"
Content-Disposition: inline

--8NvZYKFJsRX2Djef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2013 at 05:34:51PM +0100, Paul Eggleton wrote:
> Hi Darren,
>=20
> Sorry it's taken me so long to reply to this.
>=20
> On Wednesday 24 April 2013 10:32:54 Darren Hart wrote:
> > As the stable releases become first class citizens, we should probably
> > look at streamlining the process of getting patches to them.
> >=20
> > The maintainer for the stable release currently changes by release,
> > which undoubtedly creates some confusion of where to send patches and
> > who to CC. These maintainers currently attempt to track these
> > patches via email filters searching for release branch names and such,
> > which is proving tedious and prone to missing patches.
> >=20
> > Other projects have seen good results using a stable list for this
> > purpose. This would both make it obvious when a patch is intended for a
> > stable release as well as remove any confusion about who to Cc as it
> > would be the same list for all releases. Perhaps something like
> > openembedded-core-stable@lists.openembedded.org?
>=20
> In the OE-Classic days we used to have an openembedded-stablebranch maili=
ng=20
> list for the same purpose. I don't recall anyone complaining about that w=
hen=20
> we had it, so this sounds like it could help with the aforementioned issu=
es.
>=20
> The downside I can see is that it's one more mailing list with the associ=
ated=20
> problems of not everyone monitoring it ("that patch of mine shouldn't hav=
e=20
> been backported!" or "you backported one of my patches but missed an=20
> associated one"), and new users erroneously emailing it with requests for=
 help=20
> that should have gone to the normal mailing list. That could however be=
=20
> outweighed by the advantage of stable branch patches not being drowned ou=
t by=20
> the rest of the patches as they currently can be.
>=20
> > In addition to the list, some policy would need to be documented on how
> > to use the list. For example, it should always be Cc'd, and never
> > emailed with patches directly that don't go first to the master branch.
> > Backports being the exception. A policy could also be put in place to
> > aid in automatic processing, such as that employed by the Linux kernel
> > stable project. The following would request that the patch be applied to
> > the denzil and danny stable releases:
> >=20
> > Cc: <openembedded-core-stable@lists.openembedded.org> # denzil
> > Cc: <openembedded-core-stable@lists.openembedded.org> # danny
> > Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> >=20
> > The advantage here over something like a subject tag, "[danny]" is that
> > it scales a bit better to sending a patch for multiple releases.
> >=20
> > There are certainly other approaches, I mention this one as it has a
> > proven track record and I don't have a reason to deviate from it.
>=20
> I'm not familiar with this, but I've never had any direct contact with th=
e=20
> kernel patch submission process so that might explain it. I have to say I=
'm=20
> not unhappy with the existing convention we have of marking it in the tit=
le of=20
> the email though.
>=20
> I'd like to hear more opinions from others, particularly submitters of st=
able=20
> branch patches and other stable branch maintainers who have been doing it=
=20
> longer than I have. Ping...?

I like subject tags, at least because they are nicely shown in patchwork
subject, so I can easily sort incoming patches to right bundles.

And this problem with scaling when sending a patch for multiple
releases we already have when tagging multiple affected layers (which happe=
ns
more often for meta-oe layers then multiple releases).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8NvZYKFJsRX2Djef
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGo3zoACgkQN1Ujt2V2gBzG4gCgiLOD79q65ftWpXxBMDAffuZA
Rf4AoKxOxNyX1I5FFsZLCbQ2WHixHuy4
=FXcs
-----END PGP SIGNATURE-----

--8NvZYKFJsRX2Djef--
