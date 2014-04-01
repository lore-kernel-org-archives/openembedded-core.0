Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2A6BE6FA47
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:40:48 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so5639462wiv.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hPeAeyDBu6o+R/dbk9InNsak4/mwS4GaWGg81hNo6po=;
	b=NYKcFi7wPvBNgG+029aCAtQRHXfJX1aqiNRALrUGVCnpZWeIWwLUemeUXdMSjfWuS/
	rsNREaoXNqhYafnlNLApGK7ofGVjNyxqa/LYTgeurJ8u1GgvMGd27x77P++WPgPQ5MW7
	0LakcI7ontXNdyMdjE1q+CGgUL8eaBz+YhaR3l9YQO58LGxHHCwwnqLWFzTBqNH1m+J4
	knGGN87V1rTZzGWo4DO+r3/cc2gJUniH2dV1Yn7Inv9fYrEbI/T+q6tHtxD+Ouij5nyi
	z28ss20URSCkrdE4sgknF9AQ2kvmNMmTgMzU+4NQg5HYC99zjbnxzOhBWhYlaOerXhEc
	u25Q==
X-Received: by 10.194.60.37 with SMTP id e5mr24310163wjr.32.1396374048816;
	Tue, 01 Apr 2014 10:40:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bc51sm42003590eeb.22.2014.04.01.10.40.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:40:47 -0700 (PDT)
Date: Tue, 1 Apr 2014 19:40:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20140401174047.GR2425@jama>
References: <20140330013103.GD2428@jama>
 <533AF39A.6020400@windriver.com>
MIME-Version: 1.0
In-Reply-To: <533AF39A.6020400@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Quality of meta-oe metadata
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
X-List-Received-Date: Tue, 01 Apr 2014 17:40:49 -0000
X-Groupsio-MsgNum: 52049
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="msgLTjjeumHWYklJ"
Content-Disposition: inline

--msgLTjjeumHWYklJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 01, 2014 at 12:12:58PM -0500, Mark Hatle wrote:
> On 3/29/14, 8:31 PM, Martin Jansa wrote:
> > Hi, sorry for longer e-mail, this is one of topic I would like to discu=
ss
> > on OEDAM (http://openembedded.org/wiki/OEDAM), but having some feedback=
 and
> > thoughts in advance will be very useful.
> >
> > As people can notice from my "State of bitbake world" e-mails or
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> > we never had "green" builds. There are always 20+ failed tasks in those
> > big builds and just reading the numbers isn't good indicator of quality,
> > because sooner you break something in dependency tree, fewer recipes wi=
ll
> > be actually tested, so fewer failed tasks often means that something
> > important is broken.
>=20
> ...
>=20
> > 3) OE releases work great and don't invalidate sstate signatures so oft=
en, so my
> >     feeling is that most developers and projects are just using release=
s and
> >     less and less people do CI. People will start complaining that some=
thing
> >     is broken in meta-oe only when they are upgrading their project fro=
m 1.5 to
> >     1.6 when 1.6 is released and that could be too late for fixing meta=
-oe
> >     issues.
>=20
> I agree, the success of what we're doing is certainly causing us 'differe=
nt'=20
> problems.  :)
>=20
> > What I'm trying to do with it:
> >
> > a) sending those e-mails and updating wiki, so that people can easily f=
ind
> >     if some build failure is common or something which happens only for=
 them
> >     (something like oestats-client.bbclass page was providing in oe-cla=
ssic)
> >     It also includes log of QA issues which are usually easy to fix and=
 great
> >     way for new people to learn something about OE.
> > b) trying to refuse all patches which cause new world issue (or new QA
> >     warn/err) - sometimes missed in logs, because it's often "hidden" b=
y some
> >     other issue and hard to compare 40 issues from previous build with =
38
> >     from current.
> >     Also the issues are often triggered later by changes somewhere else=
=2E..
> > c) fixing build/qa issues in recipes I've never used or don't even have
> >     hardware to test - just based on assumption that something which bu=
ilds
> >     is better than broken build, even when it can have some issues in r=
untime.
> > d) contacting people who added the recipe which is now failing, often
> >     without reply for months even when I try it multiple times :/
>=20
> I agree with all of the above.  In fact I suspect you are going above and=
 beyond=20
> what you really need to.  Kudos for that BTW.
>=20
> > e) moving to "nonworking" directory to mark it as "known-to-be-broken",
> >     last resort for recipes where the fix is complicated and it's not k=
nown
> >     if someone is actually using it (because it was broken for months a=
nd
> >     nobody replied).
> >     + easy to find them, because they are still in repository (instead =
of
> >       git rm + revert when someone fixes it)
> >     - layer index probably doesn't find them, because "nonworking" dire=
ctory
> >       level isn't in BBFILES, so maybe meta-broken or meta-nonworking w=
ould be
> >       better
> >     ? some recipes are "broken" just because their dependency is broken=
, what
> >       to do with such recipe, I usually just say that in commit message=
 when
> >       I'm moving them to "nonworking" with their broken dep.
>=20
> Have you considered using the blacklist system for this?
>=20
> You could do something like:
>=20
> conf/layer.conf:
> include ${LAYERDIR}/conf/broken.inc
>=20
> conf/broken.inc:
>=20
> <can we ensure the blacklist system is in the system>
>=20
> BROKENMSG_layername =3D "The recipe is disabled due to a build failure.  =
If you=20
> need this recipe, or have gotten it to work.  Please submit patches to <p=
ath>.=20
> Otherwise this recipe will be removed in the future."
>=20
> # Recipe FOO is broken as of 2014-03-14, see ...
> PNBLACKLIST[FOO] =3D "${BROKENMSG_layername}"
>=20
> # Recipe BAR is broken as of 2013-06-13, see ...
> PNBLACKLIST[BAR] =3D "${BROKENMSG_layername}"
>=20
>=20
> Then after a given amount of time, say one year? on the broken list -- we=
 can=20
> then remove the items.
>=20
> If the format of the comments is such that it can be easily parsed, then =
we can=20
> even automate tracking of these things.
>=20
> (In cases where dependencies are causing the breakage, the message cause =
be=20
> augmented with that information as well...)
>=20
> The advantage of the blacklist system is that if a user tries to use the =
recipe=20
> they will hopefully see the blacklist message, it prevents having to git =
mv=20
> recipes, and should be easier for people to find/fix the bad code via a s=
imple=20
> patch.  (And hopefully easier to remove old cruft!)

Yes, that's another way of doing that and I was using it on world builds
as well (but without including it in layer and layer.conf to make it
"public")

e.g.
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
40329_001343.log/world_mask.inc

It definitely has the advantage that you can "document" it in the
message and few more details in the file itself.

Disadvantage from my POV was that I never included and enabled it in
repo, so new people didn't know about it and will still see the issues
when they try to build something broken.

Another disadvantage was that I always felt, OK I'll mark this as broken
with PNBLACKLIST and lets forget that it ever existed (sometimes I've
uncommented include lines for this just to confirm that everything still
fails - but not so often as "regular" builds).

And last one: if I recall correctly, when I was using this it was hard
to unblacklist something in your config, so if you wanted to test newer
version or something you had to modify world_mask.inc first, which won't
be very good for people if we include it by default.

Regards,

> --Mark
>=20
> > What can we do better? How to motivate more people to do CI and send fi=
xes?
> > When we get to "green" state it will be easier to quickly spot new issu=
es and
> > easier to fix them, because it will be clear what's causing them.
> >
> >
> >
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--msgLTjjeumHWYklJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM6+h8ACgkQN1Ujt2V2gBxUPgCguFw7cm7HgTZpbSFwUpeYXNCj
QGIAn3aVXcOLPuFgFZk/YX3pTZYyCvl2
=o2HA
-----END PGP SIGNATURE-----

--msgLTjjeumHWYklJ--
