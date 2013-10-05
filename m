Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 54DD460FA7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2013 12:16:42 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c1so2233807eek.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Oct 2013 05:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=W7GmuvvkOvPqxHRjBS0jAkbLZ9hLvSSHugHulLc7rI8=;
	b=bAm83izJioLb494nGnZXmZOHaU/sCEiidxZkWxrWY/KVvZVej21o5QvrB3qWHmW5uD
	tq8uSLw0xcZvs29qP5R57JNpBM+6CsPL88R29fXr3Y5lLDkapSmm74cvpERyccE4zLDW
	dnXSENicOKYsazj9xfQy8sv8MUl1xSt6SNw1SPhLBGuBR/teRkdqaQvpcj3c49WUtI7I
	fPABe+PKjCjZE5HsR7yagM4gAdxuN70IrIVwRn6twMcjDXoFKSDotuJ9obyqfGVmr4xU
	BYfsRtLpzVzMhLzaNSVlvm8dsjV9Cr0YxPfljFX1C3bCGIdxoIntelAAGBRHWv0WfRiB
	zrjg==
X-Received: by 10.14.4.1 with SMTP id 1mr30651886eei.21.1380975403731;
	Sat, 05 Oct 2013 05:16:43 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a43sm39151533eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 05 Oct 2013 05:16:43 -0700 (PDT)
Date: Sat, 5 Oct 2013 14:16:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20131005121650.GO6240@jama>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
	<20130910185427.GV11500@jama>
MIME-Version: 1.0
In-Reply-To: <20130910185427.GV11500@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [WIP][PATCH 00/20] Deterministic dependencies II
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
X-List-Received-Date: Sat, 05 Oct 2013 12:16:44 -0000
X-Groupsio-MsgNum: 45601
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="S0GG+JvAI2G0KxBG"
Content-Disposition: inline

--S0GG+JvAI2G0KxBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2013 at 08:54:27PM +0200, Martin Jansa wrote:
> On Thu, Aug 29, 2013 at 06:02:47PM +0200, Martin Jansa wrote:
> > WIP because verification build is still running and I must admit that I=
'm mostly
> > testing that all dependencies are correctly "disabled" and in the end d=
eterministic.
> >=20
> > I'm not testing if every possible combination of PACKAGECONFIG options =
provide sufficient
> > dependency tree.
> >=20
> > But it would be nice to get some review in advance and be able to get t=
his
> > in 1.5 if I manage to fix all possible review comments and/or issues di=
scovered
> > in my builds in time.
>=20
> FYI: I didn't have time to finish this in last 2 weeks and will be very
> busy for next 2 weeks so I'm OK with leaving this for 1.5.1 or something
> like that after 1.5 release. I did some changes from review comments, so
> the branch has slightly newer versions.
>=20
> If you see something you really want to have in release please speak up
> and review/confirm it for me.
>=20
> The same does apply for longer meta-openembedded patchset with
> dependencies.

These patches:
pick 6467505 librsvg: Fix dependencies for PACKAGECONFIG gdkpixbuf
pick db92df6 libmatchbox: Add PACKAGECONFIG for png
pick 7c66af8 weston: Add PACKAGECONFIG for poppler
pick 6284f74 guile: Add PACKAGECONFIG for readline
pick 2cb5d37 consolekit: Add patch to explicitly disable polkit when not en=
abled
pick fa00e58 qemu: Add PACKAGECONFIG for nss, uuid, tls and curses

need a bit more work, but others are ready for merge (verified in last
test-dependencies build).

I'll send v2 in a minute.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--S0GG+JvAI2G0KxBG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJQAzIACgkQN1Ujt2V2gBx3VwCdG2GPHAKm+IML/NT/T+0lfBD4
D1MAoKyqR61iC/kGKCy8ltjQm60EuAah
=dpCp
-----END PGP SIGNATURE-----

--S0GG+JvAI2G0KxBG--
