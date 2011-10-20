Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGtwG-0000Gn-JN
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 16:49:44 +0200
Received: by bkat8 with SMTP id t8so3825070bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 07:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/yYTTAJwCFlJKA3HnknhhZMMqgSJGAijNGJB3vGoYgg=;
	b=QxSRgpN/uA3YFKAIFgnqrUyQOPst9fKEpR+wcY63F2Fh4EWD+DBroou2v06iMP+lbK
	OyIn7n94UulpdYOTi2cBI1pFCUJNZ8a5FDD3/gr29j5OHPl5w/1Vx73t7/IgsXt4FgNw
	RGVZv7UWAvdRF3XS7BQeCuF6xW7RNy71NlsnU=
Received: by 10.204.7.198 with SMTP id e6mr8284182bke.80.1319121398797;
	Thu, 20 Oct 2011 07:36:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u18sm10041329bkn.6.2011.10.20.07.36.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 07:36:37 -0700 (PDT)
Date: Thu, 20 Oct 2011 16:36:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111020143631.GJ3522@jama.jama.net>
References: <9DA5872FEF993D41B7173F58FCF6BE94E2F42F6A@orsmsx504.amr.corp.intel.com>
	<158EAB1C-0C40-4C5B-B47A-A4B8C90A2055@dominion.thruhere.net>
	<1319042998.22985.257.camel@phil-desktop>
	<4E9F018D.7030703@intel.com>
	<CAMKF1srj1OrgnSwihsVGDCVasAc6zTHRJkfAkjFOpM80mUFM9A@mail.gmail.com>
	<4E9F0CCF.3070404@intel.com>
	<CAMKF1sqffiB0WMnhv3wVNseaMcL8TjXUePYXhvdUcwwk4roPag@mail.gmail.com>
	<CAP9ODKoFRiVnimZ3MDvK9S2v8JLykpR2-pWmmwz_2ua0pr-HfA@mail.gmail.com>
	<4E9F5E5A.6040002@intel.com> <1319120752.2410.34.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1319120752.2410.34.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [CONSOLIDATED PULL 14/16] distro-tracking: update data for some toolchain recipes
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
X-List-Received-Date: Thu, 20 Oct 2011 14:49:44 -0000
X-Groupsio-MsgNum: 11328
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ah9ph+G2cWRpKogL"
Content-Disposition: inline

--Ah9ph+G2cWRpKogL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 03:25:52PM +0100, Richard Purdie wrote:
> On Wed, 2011-10-19 at 16:33 -0700, Saul Wold wrote:
> > On 10/19/2011 12:00 PM, Otavio Salvador wrote:
> > > On Wed, Oct 19, 2011 at 16:30, Khem Raj<raj.khem@gmail.com>  wrote:
> > > ...
> > >>>>> Many upstreams we can't track if updates are required automagical=
ly, so
> > >>>>> we
> > >>>>> need a place to record when the last manual check was, also possi=
ble
> > >>>>> reasons
> > >>>>> why we should not update to newer versions, ...
> > >>
> > >> hmm manual check means it has to be done manually is there any thing
> > >> that needs it ?
> > >>
> > >> I think unless they are distro specific which seems not since they a=
re
> > >> in oe-core
> > >> they could exist in recipes  thats my opinion.
> > >
> > > I agree that this should be put into the recipes. Besides this allows
> > > for checking if it was updated when the version has been updated.
> > >
> > > If done right, when updating the version this data will be updated
> > > together. I see no change in the amount of changes.
> > >
> > > A plus of this choice is it will be more difficult to forget to update
> > > that info. This happened in last qt update for an example.
> > >
> >=20
> > This may need to be something that the TSC brings up, possibly we can=
=20
> > talk about it in Prague next week.
>=20
> So just to give some background here, the information in those files was
> added by Yocto people to give some idea of the update status of various
> recipes. This included when the version was last checked/updated for
> recipes which we can't automate that process for, when certain cleanup
> checks were made, what the general state of the recipe was and who on
> the Yocto team was specifically looking after given recipes.
>=20
> When it was discussed, some of it was Yocto specific, some of it wasn't
> and popular opinion was against it going into the recipes themselves. I
> was ok with that given we have the pn- overrides and can handle the
> problem that way just fine.
>=20
> OE-Core happened and we kept the data with OE-Core at least for now. We
> have several options:
>=20
> a) Keep the data where it is
> b) Merge the data into the recipes
> c) Move the data out of OE-Core
>=20
> Since a lot of that data is fairly Yocto process specific, it may make
> sense to move it over to meta-yocto...

I don't like "global" files where many people should maintain their info
and it's so easy to forgot when it's somewhere else then real changes
(like it was with checksums.ini and sane-src*.ini).

So I vote for b) Merge the data into the recipes, only problem with this
is that if we have 2 versions of foo (foo_1.0.bb, foo_git.bb) without
any foo.inc, will we create foo.inc just for distro-tracking info? Maybe
we should and move at least DESCRIPTION and similar variables too.

c) moving it to meta-yocto will probably make distro-tracking info even
more outdated as sometimes different people then who did upgrade in
oe-core will have to update distro-tracking info in this layer (this is
also the case now sometimes, but with distro-tracking info in recipe we
can try better to update it with upgrades).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Ah9ph+G2cWRpKogL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6gMe8ACgkQN1Ujt2V2gBywogCgicEU9TViGNf9961LiU8LxV49
jCoAnRk49VRN/1MArqgTY5MwSXGANPdB
=OKII
-----END PGP SIGNATURE-----

--Ah9ph+G2cWRpKogL--
