Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4455F77516
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 18:47:27 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g10so6653219wrg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Mar 2017 10:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8THUc0ivLSyLNqZSxxCr9Ij48AV/GHttUpPl0tLaolY=;
	b=IfzhzGjQAudJb/M0itjiAO/1SAw/1bI5IYxa4mWVOljlra/gN5GbkksAGBWm+1TrfK
	9hHUTmNQAIfifPcdFudovHEgjuLI8jViw4H/5enUNNQYRkh0JUyQVhQxH73eN936lbau
	uV4rh14DnHLZlhIutJa6Wy7g7194+O/o0Gj9XhnK4+6Mooy/oDAP87U/I5jpVJdRpWPy
	TGh7x97U10J7S2U4DuxbpRo50DO+3S7LqIAwdvSdwpZgA/jCF1KNDQ6Id4PAR4DkeJ0d
	3ZAfjDJNPpVVyGISHt2M6Y2hPKVFuqXTWVjMHLFIe2TIjMGfJAbC9fFS610EP1O2Z/yX
	FQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8THUc0ivLSyLNqZSxxCr9Ij48AV/GHttUpPl0tLaolY=;
	b=jYRenhRNyzd3E0ixiW7Co9HHAhNdOYmljf9gSiJYWJQE7cTAVZvGcjyF3rqIf2vQ2g
	+tw8rh4DlfKV3NIbzEmYfKLkUov8LM/JEPC938HaiVOh/9rbWkP7ijuOIFA8+HXhTr7A
	QJNkYFy1ExvXFsNKTuNdfKKcXNcjqwv2p+ag40JRCQadce0s2M1S1quzru5h8tRfOJY3
	xvR3dZvw8xxfgJzxTPBDFFDpNc7nZnQrTZjotosstz66dDVVuUuzkf+ZiSJAoEkuTa3g
	KzhiRIKja1+uIvCQTUVZ7TcETrQ/IWoBDDB0ehe3J7SAZ8sl4c4kM0mSnUBRetRqFlxM
	90fA==
X-Gm-Message-State: AMke39lNs3w6vC5VDP6C1hHNzMKinI1zqaoB9BobaSmjYdMq2z4+Xsiio5L+pJldeCeztg==
X-Received: by 10.223.161.213 with SMTP id v21mr8063838wrv.144.1488394048195; 
	Wed, 01 Mar 2017 10:47:28 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 65sm7684877wri.53.2017.03.01.10.47.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Mar 2017 10:47:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Mar 2017 19:47:27 +0100
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170301184727.GB3290@jama>
References: <cover.1483696378.git.patrick.ohly@intel.com>
	<6787329b6c24642352cd015ae22b5dfa579ca010.1483696378.git.patrick.ohly@intel.com>
	<CA+chaQebkND=ipbVvDGAJo=o79SsucECyyNgaaMRYyiOuVqZ2g@mail.gmail.com>
	<1487240814.13854.449.camel@intel.com> <20170301155243.GA3290@jama>
	<1488386693.7785.172.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1488386693.7785.172.camel@intel.com>
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
X-List-Received-Date: Wed, 01 Mar 2017 18:47:28 -0000
X-Groupsio-MsgNum: 94132
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline

--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 01, 2017 at 05:44:53PM +0100, Patrick Ohly wrote:
> On Wed, 2017-03-01 at 16:52 +0100, Martin Jansa wrote:
> > On Thu, Feb 16, 2017 at 11:26:54AM +0100, Patrick Ohly wrote:
> > > On Wed, 2017-02-15 at 19:32 +0100, Martin Jansa wrote:
> > > > Are all changes necessary for this to work already in master?
> > >=20
> > > Yes.
> > >=20
> > > > Yesterday I've noticed that rm_work for some components which are
> > > > early in the dependency (like qtbase) are executed relatively late
> > > > (together with do_package_qa).
> > >=20
> > > Could do_rm_work run before do_package_qa? rm_work.bbclass doesn't kn=
ow
> > > that, and therefore schedules do_rm_work after do_package_qa.
> > >=20
> > > If yes, then adding a list of tasks that can be ignored would be
> > > trivial. This can be a variable, so a recipe can even add their own
> > > ones, if necessary.
> >=20
> > That's now what I've meant.
> >=20
> > I believe that rm_work needs to be executed after do_package_qa, but I
> > don't understand the scheduler code enough (at least not yet) to say
> > that higher priority of rm_work task also makes all the tasks rm_work
> > depends on e.g. do_package_qa to be executed sooner.
>=20
> I see. do_package_qa should have a high priority, but it's still blocked
> by its dependencies. Building those dependencies only gets an indirect
> boost from scheduling recipes that many other recipes depend on first (a
> feature of the normal scheduler).
>=20
> I suspect the problem with do_package_qa is similar to the problem with
> do_build before: it depends on do_package_qa of everything a recipe
> depends on, and thus finishing the build of those other recipes also
> blocks finishing the current recipe. That creates very deep dependency
> chains and thus increases the number of recipes which are "in progress"
> at the same time.

Another (surprising for me) output from bitbake -D -D -D:

OE qemux86@ ~/build/oe-core $ head log.zlib.rm_work.debug3.prio.*
=3D=3D> log.zlib.rm_work.debug3.prio.completion <=3D=3D
DEBUG: completion priorities (most important first):
1. ID /OE/build/oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8=
=2Ebb:do_build
2. ID /OE/build/oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8=
=2Ebb:do_rm_work
3. ID /OE/build/oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8=
=2Ebb:do_package_write_ipk
4. ID /OE/build/oe-core/openembedded-core/meta/recipes-core/expat/expat_2.2=
=2E0.bb:do_package_write_ipk
5. ID /OE/build/oe-core/openembedded-core/meta/recipes-kernel/linux-libc-he=
aders/linux-libc-headers_4.9.bb:do_package_write_ipk
6. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/libtool/lib=
tool-cross_2.4.6.bb:do_package_write_ipk
7. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/make/make_4=
=2E2.1.bb:do_package_write_ipk
8. ID /OE/build/oe-core/openembedded-core/meta/recipes-core/gettext/gettext=
_0.19.8.1.bb:do_package_write_ipk
9. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/gcc/libgcc_=
6.3.bb:do_package_write_ipk

=3D=3D> log.zlib.rm_work.debug3.prio.normal <=3D=3D
DEBUG: original priorities (most important first):
1. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt=
-native_0.65.bb:do_fetch
2. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt=
-native_0.65.bb:do_unpack
3. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt=
-native_0.65.bb:do_prepare_recipe_sysroot
4. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt=
-native_0.65.bb:do_patch
5. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt=
-native_0.65.bb:do_configure
6. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt=
-native_0.65.bb:do_compile
7. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt=
-native_0.65.bb:do_install
8. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt=
-native_0.65.bb:do_populate_sysroot
9. ID /OE/build/oe-core/openembedded-core/meta/recipes-extended/texinfo-dum=
my-native/texinfo-dummy-native.bb:do_fetch

=46rom these 2 I would expect the later one to be completion (to finish who=
le quilt-native before starting anything else
except when all quilt-native tasks are blocked waiting for dependencies and=
 BB_NUMBER_THREADS allows to run
more task).

But I understand that this isn't the actual order of tasks as explained in =
bitbake comment:
        # Group tasks of the same kind before tasks of less important
        # kinds at the head of the queue (because earlier =3D lower
        # priority number =3D runs earlier), while preserving the
        # ordering by recipe. If recipe foo is more important than
        # bar, then the goal is to work on foo's do_populate_sysroot
        # before bar's do_populate_sysroot and on the more important
        # tasks of foo before any of the less important tasks in any
        # other recipe (if those other recipes are more important than
        # foo).
        #
        # All of this only applies when tasks are runable. Explicit
        # dependencies still override this ordering by priority.
        #
        # Here's an example why this priority re-ordering helps with
        # minimizing disk usage. Consider a recipe foo with a higher
        # priority than bar where foo DEPENDS on bar. Then the
        # implicit rule (from base.bbclass) is that foo's do_configure
        # depends on bar's do_populate_sysroot. This ensures that
        # bar's do_populate_sysroot gets done first. Normally the
        # tasks from foo would continue to run once that is done, and
        # bar only gets completed and cleaned up later. By ordering
        # bar's task that depend on bar's do_populate_sysroot before foo's
        # do_configure, that problem gets avoided.

and the later one still doesn't list rm_worl task for quilt-native which is=
 the real
one I'm interested in.

When I do the same with last rm_work.bbclass change reverted I get this:
$ head -n 12 log.zlib.rm_work.revert.debug3.prio.*
=3D=3D> log.zlib.rm_work.revert.debug3.prio.completion <=3D=3D
DEBUG: completion priorities (most important first):
1. ID /OE/build/oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8=
=2Ebb:do_rm_work_all
2. ID /OE/build/oe-core/openembedded-core/meta/recipes-support/ptest-runner=
/ptest-runner_2.0.bb:do_rm_work
3. ID virtual:native:/OE/build/oe-core/openembedded-core/meta/recipes-suppo=
rt/libpcre/libpcre_8.40.bb:do_rm_work
4. ID virtual:native:/OE/build/oe-core/openembedded-core/meta/recipes-graph=
ics/xorg-util/util-macros_1.19.0.bb:do_rm_work
5. ID virtual:native:/OE/build/oe-core/openembedded-core/meta/recipes-exten=
ded/gperf/gperf_3.0.4.bb:do_rm_work
6. ID virtual:native:/OE/build/oe-core/openembedded-core/meta/recipes-suppo=
rt/attr/attr_2.4.47.bb:do_rm_work
7. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/python/pyth=
on-native_2.7.12.bb:do_rm_work
8. ID virtual:native:/OE/build/oe-core/openembedded-core/meta/recipes-core/=
zlib/zlib_1.2.8.bb:do_rm_work
9. ID /OE/build/oe-core/openembedded-core/meta/recipes-core/expat/expat_2.2=
=2E0.bb:do_rm_work
10. ID virtual:native:/OE/build/oe-core/openembedded-core/meta/recipes-devt=
ools/gnu-config/gnu-config_git.bb:do_rm_work
11. ID virtual:native:/OE/build/oe-core/openembedded-core/meta/recipes-exte=
nded/pigz/pigz_2.3.4.bb:do_rm_work

=3D=3D> log.zlib.rm_work.revert.debug3.prio.normal <=3D=3D
DEBUG: original priorities (most important first):
1. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt=
-native_0.65.bb:do_fetch
2. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt=
-native_0.65.bb:do_unpack
3. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt=
-native_0.65.bb:do_patch
4. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt=
-native_0.65.bb:do_prepare_recipe_sysroot
5. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt=
-native_0.65.bb:do_configure
6. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt=
-native_0.65.bb:do_compile
7. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt=
-native_0.65.bb:do_install
8. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt=
-native_0.65.bb:do_populate_sysroot
9. ID /OE/build/oe-core/openembedded-core/meta/recipes-extended/texinfo-dum=
my-native/texinfo-dummy-native.bb:do_fetch
10. ID virtual:native:/OE/build/oe-core/openembedded-core/meta/recipes-devt=
ools/gnu-config/gnu-config_git.bb:do_fetch
11. ID /OE/build/oe-core/openembedded-core/meta/recipes-extended/texinfo-du=
mmy-native/texinfo-dummy-native.bb:do_unpack

Here it doesn't look so good for quilt-native:rm_work, it's included in zli=
b dependencies (thanks to the revert), but
with "speed" scheduler it's far, while "completion" puts it early:
log.zlib.rm_work.revert.debug3.prio.completion:40. ID /OE/build/oe-core/ope=
nembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_rm_work
log.zlib.rm_work.revert.debug3.prio.completion:66. ID /OE/build/oe-core/ope=
nembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_build
log.zlib.rm_work.revert.debug3.prio.completion:159. ID /OE/build/oe-core/op=
enembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_populat=
e_lic
log.zlib.rm_work.revert.debug3.prio.completion:229. ID /OE/build/oe-core/op=
enembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_populat=
e_sysroot
log.zlib.rm_work.revert.debug3.prio.completion:299. ID /OE/build/oe-core/op=
enembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_install
log.zlib.rm_work.revert.debug3.prio.completion:361. ID /OE/build/oe-core/op=
enembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_compile
log.zlib.rm_work.revert.debug3.prio.completion:423. ID /OE/build/oe-core/op=
enembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_configu=
re
log.zlib.rm_work.revert.debug3.prio.completion:484. ID /OE/build/oe-core/op=
enembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_prepare=
_recipe_sysroot
log.zlib.rm_work.revert.debug3.prio.completion:546. ID /OE/build/oe-core/op=
enembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_patch
log.zlib.rm_work.revert.debug3.prio.completion:603. ID /OE/build/oe-core/op=
enembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_unpack
log.zlib.rm_work.revert.debug3.prio.completion:660. ID /OE/build/oe-core/op=
enembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_fetch

log.zlib.rm_work.revert.debug3.prio.normal:1. ID /OE/build/oe-core/openembe=
dded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_fetch
log.zlib.rm_work.revert.debug3.prio.normal:2. ID /OE/build/oe-core/openembe=
dded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_unpack
log.zlib.rm_work.revert.debug3.prio.normal:3. ID /OE/build/oe-core/openembe=
dded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_patch
log.zlib.rm_work.revert.debug3.prio.normal:4. ID /OE/build/oe-core/openembe=
dded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_prepare_recip=
e_sysroot
log.zlib.rm_work.revert.debug3.prio.normal:5. ID /OE/build/oe-core/openembe=
dded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_configure
log.zlib.rm_work.revert.debug3.prio.normal:6. ID /OE/build/oe-core/openembe=
dded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_compile
log.zlib.rm_work.revert.debug3.prio.normal:7. ID /OE/build/oe-core/openembe=
dded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_install
log.zlib.rm_work.revert.debug3.prio.normal:8. ID /OE/build/oe-core/openembe=
dded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_populate_sysr=
oot
log.zlib.rm_work.revert.debug3.prio.normal:561. ID /OE/build/oe-core/openem=
bedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_populate_lic
log.zlib.rm_work.revert.debug3.prio.normal:599. ID /OE/build/oe-core/openem=
bedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_build
log.zlib.rm_work.revert.debug3.prio.normal:697. ID /OE/build/oe-core/openem=
bedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_rm_work

=46rom this it looks like setting the weight of do_rm_work above do_populat=
e_sysroot
would work with "speed" scheduler the way I was hoping for.

I'll retry the same on even smaller build and with BB_NUMBER_THREADS =3D "1=
" so that
it's easier to grasp what the completion scheduler really tries to do and h=
ow it
influences the actual order of runqueue in the end.

>=20
> > Another interesting test from today was to run:
> > # rm -rf tmp-glibc/*
> > # bitbake -n zlib | tee log.zlib.rm_work
> > # cd oe-core; git revert -1 936179754c8d0f98e1196ddc6796fdfd72c0c3b4; c=
d ..
> > # rm -rf tmp-glibc/*
> > # bitbake -n zlib | tee log.zlib.rm_work.revert
> >=20
> > and it shows interesting difference that many rm_work tasks aren't
> > executed at all:
> >=20
> > # grep rm_work log.zlib.rm_work* | grep zlib_
> > log.zlib.rm_work:NOTE: Running task 526 of 527 (/OE/build/oe-core/opene=
mbedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work)
> > log.zlib.rm_work.revert:NOTE: Running task 128 of 721 (virtual:native:/=
OE/build/oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_=
rm_work)
> > log.zlib.rm_work.revert:NOTE: Running task 717 of 721 (/OE/build/oe-cor=
e/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work)
> > log.zlib.rm_work.revert:NOTE: Running task 721 of 721 (/OE/build/oe-cor=
e/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work_all)
> >=20
> > # grep rm_work log.zlib.rm_work* | grep gcc
> > log.zlib.rm_work.revert:NOTE: Running task 2 of 721 (/OE/build/oe-core/=
openembedded-core/meta/recipes-devtools/gcc/gcc-source_6.3.bb:do_rm_work)
> > log.zlib.rm_work.revert:NOTE: Running task 240 of 721 (/OE/build/oe-cor=
e/openembedded-core/meta/recipes-devtools/gcc/gcc-cross-initial_6.3.bb:do_r=
m_work)
> > log.zlib.rm_work.revert:NOTE: Running task 250 of 721 (/OE/build/oe-cor=
e/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_6.3.bb:do_rm_w=
ork)
> > log.zlib.rm_work.revert:NOTE: Running task 634 of 721 (/OE/build/oe-cor=
e/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_6.3.bb:do_rm_work)
> > log.zlib.rm_work.revert:NOTE: Running task 674 of 721 (/OE/build/oe-cor=
e/openembedded-core/meta/recipes-devtools/gcc/libgcc_6.3.bb:do_rm_work)
> > log.zlib.rm_work.revert:NOTE: Running task 678 of 721 (/OE/build/oe-cor=
e/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_6.3.bb:do_rm_work)
> >=20
> > # grep -c rm_work log.zlib.rm_work*
> > log.zlib.rm_work:1
> > log.zlib.rm_work.revert:63
> >=20
> > I'll check if it's something in my setup or if this happens everywhere =
now.
>=20
> I'll try to double-check this myself, too.
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

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWLcP9wAKCRA3VSO3ZXaA
HLPuAJ9pa1SjkpzNhQ2CmzT3ZQCWfxFnlACfQbvJFVTTOesR1aTcKlsDDeU3O5Y=
=Ugpy
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
