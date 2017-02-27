Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 56041719BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 22:24:35 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ciTie-0002gO-RN from Joe_MacDonald@mentor.com ;
	Mon, 27 Feb 2017 14:24:36 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 27 Feb 2017 14:24:36 -0800
Received: by burninator (Postfix, from userid 1000)	id 797C75805F3; Mon, 27
	Feb 2017 17:24:35 -0500 (EST)
Date: Mon, 27 Feb 2017 17:24:35 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <20170227222434.GB1688@mentor.com>
References: <1487908800-18064-1-git-send-email-joe_macdonald@mentor.com>
	<20170227183329.9748.13885@do.openembedded.org>
	<20170227200624.GA1688@mentor.com>
	<1488227103.28256.31.camel@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1488227103.28256.31.camel@linux.intel.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGRlcHJlY2F0ZWQuYmJjbGFzczogQWRkIGEgUE5ERVBSRUNBVEVEIHZhcmlhYmxlIGZvciByZWNpcGVzIChyZXYzKQ==?=
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
X-List-Received-Date: Mon, 27 Feb 2017 22:24:36 -0000
X-Groupsio-MsgNum: 94031
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Content-Disposition: inline

--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [OE-core] =E2=9C=97 patchtest: failure for deprecated.bbclass: Add a P=
NDEPRECATED variable for recipes (rev3)] On 17.02.27 (Mon 14:25) Leonardo S=
andoval wrote:

> On Mon, 2017-02-27 at 15:06 -0500, Joe MacDonald wrote:
> > [=E2=9C=97 patchtest: failure for deprecated.bbclass: Add a PNDEPRECATE=
D variable for recipes (rev3)] On 17.02.27 (Mon 18:33) Patchwork wrote:
> >=20
> > > =3D=3D Series Details =3D=3D
> > >=20
> > > Series: deprecated.bbclass: Add a PNDEPRECATED variable for recipes (=
rev3)
> > > Revision: 3
> > > URL   : https://patchwork.openembedded.org/series/5489/
> > > State : failure
> > >=20
> > > =3D=3D Summary =3D=3D
> > >=20
> > >=20
> > > Thank you for submitting this patch series to OpenEmbedded Core. This=
 is
> > > an automated response. Several tests have been executed on the propos=
ed
> > > series by patchtest resulting in the following failures:
> > >=20
> > >=20
> > >=20
> > > * Issue             Series does not apply on top of target branch [te=
st_series_merge_on_head]=20
> > >   Suggested fix    Rebase your series on top of targeted branch
> > >   Targeted branch  master (currently at 65cfc8aca3)
> >=20
> > I had been out of date, but this time I'm reasonably confident v3 is
> > still directly on top of master.
> >=20
> > yocto-mainline> git config --local --get-regexp '^remote'
> > remote.yocto.url git://git.yoctoproject.org/poky
> > remote.yocto.projectname poky
> > remote.yocto.fetch +refs/heads/*:refs/remotes/yocto/*
> > yocto-mainline> git pull
> > Already up-to-date.
> > yocto-mainline> git status
> > On branch master
> > Your branch is ahead of 'yocto/master' by 1 commit.
> >   (use "git push" to publish your local commits)
> >=20
> > nothing to commit, working directory clean
> >=20
> > Is patchtest having a bad day?
>=20
> yes,  there were some issues with the cron job running patchtest but
> that is now solved. The problem is that your patch is a documentation
> patch, not a oe-core patch, so it does not apply into oe-core. Send it
> to the correct list (yocto@yoctoproject.org) if necessary.

It's actually both a change to oe-core and the accompanying
documentation.  I wasn't aware that they needed to be sent to separate
lists when introducing a change to meta/ and documentation/ (to document
the change in meta/, obviously).  Seems like an odd thing to do, but
I'll break them up into separate commits, I guess.

-J.

>=20
>=20
>=20
>=20
>=20
> >=20
> > > If you believe any of these test results are incorrect, please reply =
to the
> > > mailing list (openembedded-core@lists.openembedded.org) raising your =
concerns.
> > > Otherwise we would appreciate you correcting the issues and submittin=
g a new
> > > version of the patchset if applicable. Please ensure you add/incremen=
t the
> > > version number when sending the new version (i.e. [PATCH] -> [PATCH v=
2] ->
> > > [PATCH v3] -> ...).
> > >=20
> > > ---
> > > Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> > > Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> > >=20
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20

--=20
-Joe MacDonald.
:wq

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYtKciAAoJEEn8ffcsOfaWsnQIALqbjtzxyWmI5oijl4YZnVHy
qGIUxQPL6/CUjwjXTByl//vfgB2Ns2rxi1aamkKfXl7sD+eCST/XpJu9FzkDV/Ud
wSrsTP1eDlbucjpfkSZQNhy/ha8Epg9jSTe9hq/ddM0BibrEi8s/5a9+/N66uW2P
du2ka9G3GdQjLFUXfxTnLyqC2+t8J5n6kpUrvp3MI/2O+neebwFJZOD9RsKPSmWP
/S+9NrBkoQ4DkNRrWR0jv4huBouAnG/i+Q2CBS/XbgVtfCJhcJrADM2pFG4kI6y8
w6TpZlpuer7fDe78IXrbHsvl3973Gkzbs9JB7oO0ULhb6JjhKKFUy8BAxOSl1YE=
=jH2a
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
