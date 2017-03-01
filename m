Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id DF83B730CC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 15:52:43 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id v186so113719007wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Mar 2017 07:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2DY7Jx84qfGARAlTukeFNt8ZTCLDlfDy9mawKSPCvyY=;
	b=QpJRJV89QNnFxtA4yodXw1w34iTVb/YTMNySclsj37l5hQFcYBwwgz/Q6be77Eizlf
	fqY2HgoeozKgytsNYGWqjgbZF/lnaRRqcqbBs/aAeEmky0Iu+RLX+Z8fP7I71gFraeq8
	wWK+d6FrcuhqKWSPLbJheC8KGitKwRVCBReYWMvGRCNwsD3NRYC+i1SL9B9oLPbWUpNZ
	gDgHll3F6iokRbIqxkZUcKG0c5MzlRVZXhy+wDGs5rb0TdQlwFEqzC7jMX9cY1GBYWXC
	y5XDJqRUTcQUuvo6i/iSDCAODT+MCOw5YzOv1CzASi2G1t6MhgjV0r/w9rPi33NHzdXN
	k+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2DY7Jx84qfGARAlTukeFNt8ZTCLDlfDy9mawKSPCvyY=;
	b=btOTZb0qm43S/zcPqHlrw9aR2KrIS+10RIo1Lp7tcaf+XE4L0BHgt8cMnIzqNqgt8s
	mKHJ5Hc7tkWyT/ItqkNAXPNhgPNZCvlrqSMAN5mKVq2q/vCBKs4claQs1B2gxk5Yo5wq
	/41QWqz1OVGV2ui0AMvyvEUMZipAXTQQZTgwwVY9o9Pa+PvIaVTuJmBr7wfItCLcNcwB
	8qD2BoT54cpmdjfL7aE7cYIh3Rzk6VLP3UKZE/CsnVdyemhxoX4t3ZevB2w7lWpULiJR
	r4E2IrYim4tvEsZq3dOFNQQP6PKTdx3c9IJQB9RivMCOHAOZyevTydZIFHk2QlBosjHM
	hJ7w==
X-Gm-Message-State: AMke39meVqpK4JkoxV1615o6Ob4pQVrwrc4/KROFDgNOUXndMrI353AyeQ+IGmkWEdDPhQ==
X-Received: by 10.28.98.194 with SMTP id w185mr4266669wmb.84.1488383564619;
	Wed, 01 Mar 2017 07:52:44 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c133sm7464993wmd.13.2017.03.01.07.52.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Mar 2017 07:52:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Mar 2017 16:52:43 +0100
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170301155243.GA3290@jama>
References: <cover.1483696378.git.patrick.ohly@intel.com>
	<6787329b6c24642352cd015ae22b5dfa579ca010.1483696378.git.patrick.ohly@intel.com>
	<CA+chaQebkND=ipbVvDGAJo=o79SsucECyyNgaaMRYyiOuVqZ2g@mail.gmail.com>
	<1487240814.13854.449.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1487240814.13854.449.camel@intel.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] rm_work.bbclass: clean up sooner
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
X-List-Received-Date: Wed, 01 Mar 2017 15:52:45 -0000
X-Groupsio-MsgNum: 94106
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline

--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2017 at 11:26:54AM +0100, Patrick Ohly wrote:
> On Wed, 2017-02-15 at 19:32 +0100, Martin Jansa wrote:
> > Are all changes necessary for this to work already in master?
>=20
> Yes.
>=20
> > Yesterday I've noticed that rm_work for some components which are
> > early in the dependency (like qtbase) are executed relatively late
> > (together with do_package_qa).
>=20
> Could do_rm_work run before do_package_qa? rm_work.bbclass doesn't know
> that, and therefore schedules do_rm_work after do_package_qa.
>=20
> If yes, then adding a list of tasks that can be ignored would be
> trivial. This can be a variable, so a recipe can even add their own
> ones, if necessary.

That's now what I've meant.

I believe that rm_work needs to be executed after do_package_qa, but I
don't understand the scheduler code enough (at least not yet) to say
that higher priority of rm_work task also makes all the tasks rm_work
depends on e.g. do_package_qa to be executed sooner.

=46rom my observation it looked like do_package_qa is still executed
"late", but immediately followed by rm_work thanks to its high priority
(so it's executed as soon as it can, but it's still late in progress of
the whole build).

Another interesting test from today was to run:
# rm -rf tmp-glibc/*
# bitbake -n zlib | tee log.zlib.rm_work
# cd oe-core; git revert -1 936179754c8d0f98e1196ddc6796fdfd72c0c3b4; cd ..
# rm -rf tmp-glibc/*
# bitbake -n zlib | tee log.zlib.rm_work.revert

and it shows interesting difference that many rm_work tasks aren't
executed at all:

# grep rm_work log.zlib.rm_work* | grep zlib_
log.zlib.rm_work:NOTE: Running task 526 of 527 (/OE/build/oe-core/openembed=
ded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work)
log.zlib.rm_work.revert:NOTE: Running task 128 of 721 (virtual:native:/OE/b=
uild/oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_w=
ork)
log.zlib.rm_work.revert:NOTE: Running task 717 of 721 (/OE/build/oe-core/op=
enembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work)
log.zlib.rm_work.revert:NOTE: Running task 721 of 721 (/OE/build/oe-core/op=
enembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work_all)

# grep rm_work log.zlib.rm_work* | grep gcc
log.zlib.rm_work.revert:NOTE: Running task 2 of 721 (/OE/build/oe-core/open=
embedded-core/meta/recipes-devtools/gcc/gcc-source_6.3.bb:do_rm_work)
log.zlib.rm_work.revert:NOTE: Running task 240 of 721 (/OE/build/oe-core/op=
enembedded-core/meta/recipes-devtools/gcc/gcc-cross-initial_6.3.bb:do_rm_wo=
rk)
log.zlib.rm_work.revert:NOTE: Running task 250 of 721 (/OE/build/oe-core/op=
enembedded-core/meta/recipes-devtools/gcc/libgcc-initial_6.3.bb:do_rm_work)
log.zlib.rm_work.revert:NOTE: Running task 634 of 721 (/OE/build/oe-core/op=
enembedded-core/meta/recipes-devtools/gcc/gcc-cross_6.3.bb:do_rm_work)
log.zlib.rm_work.revert:NOTE: Running task 674 of 721 (/OE/build/oe-core/op=
enembedded-core/meta/recipes-devtools/gcc/libgcc_6.3.bb:do_rm_work)
log.zlib.rm_work.revert:NOTE: Running task 678 of 721 (/OE/build/oe-core/op=
enembedded-core/meta/recipes-devtools/gcc/gcc-runtime_6.3.bb:do_rm_work)

# grep -c rm_work log.zlib.rm_work*
log.zlib.rm_work:1
log.zlib.rm_work.revert:63

I'll check if it's something in my setup or if this happens everywhere now.

> > So I've tried very naive way to find out if the rm_work tasks are
> > executed sooner or not just by comparing Task IDs in build of the same
> > image built from scratch (without sstate) with Dizzy, Morty and
> > current master.
>=20
> Interesting, I hadn't thought of testing it like that.
>=20
> > If we dismiss the strange case in rm_work.tasks.master.qemux86 then it
> > seems to perform at least as good as old completion BB_SCHEDULER.
> >=20
> >=20
> > But I wanted to ask if there is something else we can do or you were
> > planing to do, because IIRC you shared some longer analysis of what
> > could be improved here and I'm not sure if you managed to implement it
> > all.
>=20
> The other ideas that I mentioned at some point didn't pan out as
> intended. In particular allowing do_rm_work tasks to run when the normal
> task limit was reached didn't have a big effect and the implementation
> was a hack, so I dropped that.
>=20
> > It feels to me that rm_work has high priority, but still it's
> > "blocked" by e.g. do_package_qa which gets executed late and then
> > immediately followed by rm_work.
>=20
> That should be easy to change, perhaps like this (untested):
>=20
> RM_WORK_TASKS_WHITELIST =3D "do_build do_package_qa"
>=20
>         deps =3D set(bb.build.preceedtask('do_build', True, d))
> 	whitelist =3D d.getVar('RM_WORK_TASKS_WHITELIST').split()
>         deps.difference_update(whitelist)
>         # In practice, addtask() here merely updates the dependencies.
>         bb.build.addtask('do_rm_work', 'do_build', ' '.join(deps), d)
>=20
>=20
> --=20
> Best Regards, Patrick Ohly
>=20
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>=20
>=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWLbuSgAKCRA3VSO3ZXaA
HI9oAJ4qlBx3pw33CrjSsudZSX7hgPqZugCgnvGsnQKnqINI4JY5rDjyIQUzP8o=
=9RYz
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
