Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8C30960667;
	Wed,  2 Dec 2015 18:03:35 +0000 (UTC)
Received: by wmec201 with SMTP id c201so69429433wme.1;
	Wed, 02 Dec 2015 10:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+7JFKGLb3PfEomr9Sr40g064TFT5y0Y1K68D+jAjhPQ=;
	b=xcIV631DgEujpB843QgYVukKLEviVzrHVw21ztWe3frNXpFw33R7bmncTxTyWFlvSD
	e71KRuf+tQsmpEsPBZvS4gP7igpBomLwisK2CuDXpQir4KTRktMDBnMestWfHvbd1c1e
	UZz9gVEjsiEifAvlSBO4AczKn3M67U+CbiV420f8TpawwsDuk7XLgoRX+HszjomWZODq
	aihd+T63ifiSDGu75X5QdZuMW07vjd6M9wnBVmMR+FZDuAkwSPWS/rvdxuYj48xjfk3O
	0WG2LgY01+ZcVxNCCmNYRXQo6+xAd6J4U72Xy3l8nbw+NIwbhtTkXv4IGrZ6ZuVBJE94
	RvCA==
X-Received: by 10.28.147.129 with SMTP id v123mr7613793wmd.98.1449079416348;
	Wed, 02 Dec 2015 10:03:36 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id hw1sm3873287wjb.6.2015.12.02.10.03.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Dec 2015 10:03:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Dec 2015 19:04:40 +0100
To: "Barros Pena, Belen" <belen.barros.pena@intel.com>
Message-ID: <20151202180440.GC2248@jama>
References: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
	<41399562.aYmIK0zX5I@peggleto-mobl.ger.corp.intel.com>
	<20151201104720.GB2251@jama>
	<9135219.GRnf9JIkFP@peggleto-mobl.ger.corp.intel.com>
	<20151202081713.GA2248@jama>
	<D2847D54.6BF8A%belen.barros.pena@intel.com>
	<D2847EE2.6BF9C%belen.barros.pena@intel.com>
MIME-Version: 1.0
In-Reply-To: <D2847EE2.6BF9C%belen.barros.pena@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, "Lespiau,
	Damien" <damien.lespiau@intel.com>,
	"openembedded-architecture@lists.openembedded.org"
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patchwork & patch handling improvements
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
X-List-Received-Date: Wed, 02 Dec 2015 18:03:38 -0000
X-Groupsio-MsgNum: 74268
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d01dLTUuW90fS44H"
Content-Disposition: inline

--d01dLTUuW90fS44H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 02, 2015 at 10:59:17AM +0000, Barros Pena, Belen wrote:
>=20
>=20
> On 02/12/2015 10:54, "openembedded-core-bounces@lists.openembedded.org on
> behalf of Barros Pena, Belen"
> <openembedded-core-bounces@lists.openembedded.org on behalf of
> belen.barros.pena@intel.com> wrote:
>=20
> >
> >
> >On 02/12/2015 08:17, "openembedded-core-bounces@lists.openembedded.org on
> >behalf of Martin Jansa" <openembedded-core-bounces@lists.openembedded.org
> >on behalf of martin.jansa@gmail.com> wrote:
> >
> >>On Wed, Dec 02, 2015 at 04:01:40PM +1300, Paul Eggleton wrote:
> >>> On Tue, 01 Dec 2015 11:47:20 Martin Jansa wrote:
> >>> > On Tue, Dec 01, 2015 at 07:49:50AM +1300, Paul Eggleton wrote:
> >>> > > Hi Trevor,
> >>> > >=20
> >>> > > On Mon, 30 Nov 2015 10:19:35 Trevor Woerner wrote:
> >>> > > > On 11/26/15 16:00, Paul Eggleton wrote:
> >>> > > > > I'm also
> >>> > > > > trying to ensure that the patch validation is generic enough =
so
> >>>it can
> >>> > > > > live in OE-Core, and thus we can easily update and refine it
> >>>over time
> >>> > > > > in
> >>> > > > > line with the code itself as well as encourage submitters to
> >>>use the
> >>> > > > > script on their own changes before sending.
> >>> > > >=20
> >>> > > > This all sounds like an improvement and is therefore a step in
> >>>the right
> >>> > > > direction :-)
> >>> > > >=20
> >>> > > > A while back I had the idea of "porting" the kernel's
> >>>"checkpatch.pl" to
> >>> > > > The Yocto Project (it was around the same time that I was trying
> >>>to
> >>> > > > float the whole "Maintainers File" idea too, since I was also
> >>>trying to
> >>> > > > re-purpose "get-maintainer.pl" as well). About one minute into
> >>>that
> >>> > > > effort I realized the existing *.bb files were all over the pla=
ce
> >>>in
> >>> > > > terms of the order of statements and the order of the blocks of
> >>> > > > statements. At that time I found one recipe style guide from OE,
> >>>and
> >>> > > > another one from The Yocto Project, each of which described a
> >>>slightly
> >>> > > > different preference. So I asked on the mailing list and quickly
> >>> > > > discovered that both groups prefer a different style.
> >>> > > >=20
> >>> > > > I'm not saying this job isn't worth doing, but I am pointing out
> >>>there's
> >>> > > > the potential for feathers to be ruffled on both sides if someo=
ne
> >>>tries
> >>> > > > to produce a definitive style guide for recipe files and then
> >>>enforces
> >>> > > > it in an automated way. Since it is the OpenEmbedded Project's
> >>>job to
> >>> > > > provide the recipes for The Yocto Project, I'm guessing this
> >>>question
> >>> > > > needs to be decided by them? If that sounds reasonable, then
> >>>maybe The
> >>> > > > Yocto Project needs to acquiesce to OE's decision?
> >>> > >=20
> >>> > > I don't think there's that much of a division. I don't recall if =
it
> >>>was
> >>> > > you
> >>> > > that raised it at the time but the issue of having two style guid=
es
> >>>did
> >>> > > get
> >>> > > rectified - I changed the one on the Yocto Project wiki to simply
> >>>be a
> >>> > > link to the OE style guide in June last year. It certainly didn't
> >>>come
> >>> > > about through a conscious decision to have a different style.
> >>> > >=20
> >>> > > However there is a minor disagreement over indentation for shell
> >>>functions
> >>> > > between OE-Core and other layers - this persists because of the
> >>> > > backporting
> >>> > > pain a blanket replacement would potentially lead to. As I recall
> >>>this did
> >>> > > get discussed at the OE TSC level. I think that's one thing we
> >>>could just
> >>> > > not evaluate (or make an option) until such time as we resolve the
> >>> > > difference - and I do mean to see it resolved at some point in the
> >>> > > future.
> >>> >=20
> >>> > Using consistent indentation (4 spaces) at least for new metadata
> >>>would
> >>> > be step in right direction.
> >>> >=20
> >>> > With the amount of changes which are backported to older releases I
> >>> > still don't see this "backporting pain" argument. Doing it just
> >>>before
> >>> > the release is of course useful, because e.g. now more changes will
> >>>be
> >>> > backported to Jethro than to Fido or Dizzy. So having consistent
> >>> > indentation in Jethro and master would prevent 95% of "backporting
> >>> > pain". Maybe some Yocto 10.0 will finally get the meaning of
> >>> > "consistent" indentation.
> >>>=20
> >>> I agree it's not ideal. I said above, I do want to see it resolved.
> >>>=20
> >>> Leaving indentation aside for a moment do you have any comments on my
> >>> proposal?
> >>
> >>I'm not familiar with FDO fork, so I don't know how it looks and
> >>behaves,
> >
> >This is how it looks like currently
> >
> >http://patchwork.freedesktop.org/project/intel-gfx/patches/
> >
> >> but any improvement on patchwork side is definitely welcome and
> >>I appreciate it.
> >>
> >>Does it support e.g. moving the patches to given bundle based on some
> >>substring in subject? To sort e.g. meta-networking, meta-java,
> >>meta-browser, .. patches automatically?
> >
> >Mmm, you might not like this, but we are thinking of getting rid of
> >bundles. Basically, we assumed bundles were a manual way of creating pat=
ch
> >series. The new Patchwork can identify series, so we thought: great!
> >Bundles no longer needed.
> >
> >There are other features been considered that might be an alternative to
> >bundles, like tagging
>=20
> sorry: pressed 'send' too soon :/ As I was saying, tagging
>=20
> https://github.com/dlespiau/patchwork/issues/36
>=20
> Or supporting several projects within the same mailing list (in your case,
> one per layer)
>=20
> https://github.com/dlespiau/patchwork/issues/77
>=20
> >
> >
> >>
> >>I don't expect FDO fork to provide other features I'm used to from
> >>gerrit like cherry-picking to selected branch from the UI or doing the
> >>review there. But still if we're stuck with patchwork forever (because
> >>some people hate gerrit), then any improvement is really appreciated,
> >>thanks for looking into it.
> >>
> >>My only concern is about migrating current database, do you know if the
> >>migration will keep the database
>=20
> I don't know, but I can find out.
>=20
> >>including bundles
>=20
> If we remove the bundles, then I guess the migration might not keep the
> bundles.=20

OK, then can we please postpone this upgrade (or run both patchworks in
parallel) until these 2 features are implemented and working?

I'm depending on bundles heavily, to "mark" the patches for layers with
dedicated maintainer and also for extra "status" like merged in
"master-next" branch for jenkins build, because standard status values
aren't fine-grained enough.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--d01dLTUuW90fS44H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZfMrcACgkQN1Ujt2V2gBxWUwCfaglquREmEQ9LMTTwRrddJpY7
W2kAnitz7n2EZW9YzYCAT+tGWcyIoXj+
=k17z
-----END PGP SIGNATURE-----

--d01dLTUuW90fS44H--
