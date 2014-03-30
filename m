Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1503D6F75F;
	Sun, 30 Mar 2014 15:14:00 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so5802650eek.34
	for <multiple recipients>; Sun, 30 Mar 2014 08:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=k9m2wyhVxGCe9eMIkTbN8zzfrXrGTlIFCAwEBzSv1RY=;
	b=nY6PcclqFiw6p5+PiqlILvGs55ZEZ58uA+DHumc2dZBf9pS75v6eJRpO7dY9KsBVSw
	IxQxawQmESKC+a1rGLlNMvYaRDT75H3y+R8ZLM1DUNKv8d58CbR7nXOYjcRwrqgLWHpX
	cjMrS4Nm2fwhEiyvBimCy+4OZ+HYJXno+3TNxr/1J2Iigc58LAM6s2YrkowTbGviTb1f
	eExeI8o7b4cdLsjlINUgWY8hc+3BK/WwzO+zBH/i5/yca2dJuihORR5PaW0aLxng+3eI
	VO2ZabgAR3kHVciZ5UVojnVhcW2XA9MC0TsW/I/fYQlSzzHPKgKHe8AHrAxBOVVz0C2H
	NCxw==
X-Received: by 10.15.90.201 with SMTP id q49mr1225511eez.65.1396192440732;
	Sun, 30 Mar 2014 08:14:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	48sm26377471eei.24.2014.03.30.08.13.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Mar 2014 08:13:59 -0700 (PDT)
Date: Sun, 30 Mar 2014 17:14:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Message-ID: <20140330151403.GG2428@jama>
References: <20140330013103.GD2428@jama>
	<CANyK_8ebvHy7peb9i7ttLhn4zSOXPOi=RSPGQztJHSUb_Dk3nw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANyK_8ebvHy7peb9i7ttLhn4zSOXPOi=RSPGQztJHSUb_Dk3nw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sun, 30 Mar 2014 15:14:03 -0000
X-Groupsio-MsgNum: 51878
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KIzF6Cje4W/osXrF"
Content-Disposition: inline

--KIzF6Cje4W/osXrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 30, 2014 at 03:48:09PM +0100, Paul Barker wrote:
> Are you discussing meta-oe alone here or all layers in meta-openembedded?

basically all of the layers which are included in my world builds, so it
includes all layers in meta-openembedded, most from meta-smartphone,
meta-browser, meta-qt5..

> I've got a few ideas thinking slightly outside the box, so these may
> or may not be workable:
>=20
> - It might help to try to split the layers down further and reduce the
> size of meta-oe (for example, create a meta-python layer for all the
> python libraries that aren't direct dependencies of something
> non-python in meta-oe) and then try get new maintainers for these
> sub-layers so that the workload is spread better.

Agreed I would be happy to accept patches creating meta-python layer,
ideally sent by someone who will volunteer to maintain it.

> - We could create a new layer for unstable recipes which are 'use at
> your own risk'. That may be a good place for recipes which don't work
> on the jenkins builds but do work for some people and are in use (and
> so probably don't belong in nonworking). This is similar to the
> meta-broken or meta-nonworking layer idea but would take slightly more
> recipes in.

The difference between meta-broken and meta-unstable from my POV is
that, "broken" should be just temporary place and someone should
eventually fix it, but if we move stuff to meta-unstable and stop
testing it, then I fear that it will became just junkyard.

If some recipe works fine for someone when building for arm, but
triggers "jenkins/world" build issues for x86* then lets restrict it
only for arm with comment which shows the error - that's better than
moving it to "broken" or "unstable".
=20
> - It may be worth taking some aggressive action in sync with the
> upcoming oe-core release to get us to a green build, possibly by
> throwing things into meta-nonworking and meta-unstable layers. That
> may break a few people's builds, but the fix for them should just be
> to add the meta-unstable layer. If they're building against the master
> branch that should be tolerable and it won't affect anyone building
> from a released/stable branch until the next oe-core release in 6
> months time. Once we have a green build it'll be much easier to QA
> patches and reject those which break the build.

you mean being aggressive before or after creating the "next-release"
branch? I would prefer to be aggressive before to have green builds in
release branch.

> I don't have much time to give to fixing this myself as I'm busy with
> other projects. I do have idle computer time though so could run an
> automated build regularly (probably just a script and a cron job
> rather than buildbot/jenkins/etc). I won't be able to do a world build
> for every layer for multiple machines, but I should be able to do some
> subset. I may also be able to commandeer a spare server over the next
> few weeks. Is there any particular config which would be beneficial to
> build regularly?

Doing "big" builds in different setups is of course useful, but right
now I think we already have "more logs than what we're processing".

So I think that building not whole world, but those recipes which are
regularly failing would be good start, if people cannot reproduce some
issues which are shown in my jenkins builds we should compare the builds
and narrow possible reasons (e.g. failing only with dash, failing only
with some PACKAGECONFIG enabled or disabled).

I'm trying to stay close to distroless config, but some tweaks are
needed in order to have bigger test coverage (e.g. enabling some
PACKAGECONFIGs which are disabled by default, but something requires
them, or changing P_V to newer again because something else needs it,
enabling gold, because it's more strict so it can catch more issues..)

Jenkins builds are running almost non-stop (because it usually takes
around 24 hours per architecture), so often when I want to debug the
issue directly on that server in WORKDIR where it failed it's already
gone from tmpfs and the workspace is already "blocked" by next build.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KIzF6Cje4W/osXrF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM4NLsACgkQN1Ujt2V2gBxzIQCgnBPBuH2e142e3zBFI6unF/Js
dIoAn203SXQkyviJyavzn6DtifiMRPJq
=4a2l
-----END PGP SIGNATURE-----

--KIzF6Cje4W/osXrF--
