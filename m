Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rd2SP-0000H4-U5
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 17:22:26 +0100
Received: by eeit10 with SMTP id t10so2734021eei.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 08:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YfovRj7xzkXvvDy5LQmfcKAVRH9JWc43VND1yNxFD4Y=;
	b=EkK3vL340cF3v4cuf7CIu+3wYpqYme6fsUuR226K7INoGI1Qe4OZKcZL/vD0MMlGll
	zPSRDzYR61EMxKO23+rqzwWTNQcLrrpU4uKcJ6o9WeJ/9Vp7SutR8iAVIvU+nG89wdjP
	iQA1D6tP8ZwiOwwNp1oiJ0RcHqeuXv9Gc5els=
Received: by 10.213.2.82 with SMTP id 18mr665675ebi.43.1324397718270;
	Tue, 20 Dec 2011 08:15:18 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j20sm8457446eej.8.2011.12.20.08.15.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 08:15:16 -0800 (PST)
Date: Tue, 20 Dec 2011 17:15:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111220161504.GA12791@jama.jama.net>
References: <1323851280-6342-1-git-send-email-raj.khem@gmail.com>
	<1323856946.25491.31.camel@ted>
	<CAMKF1sqLHP1cWfBswrqnwhAPj4Tt3XCV8GpQv7Dm71PX3F=rAw@mail.gmail.com>
	<1323951419.4568.17.camel@ted>
	<20111216212424.GA28832@sakrah.homelinux.org>
	<20111220090753.GC3946@jama.jama.net>
	<20111220093733.GD3946@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111220093733.GD3946@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] gcc-4.6: Let G++ relocate gxx-include-dir when using --sysroot option
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
X-List-Received-Date: Tue, 20 Dec 2011 16:22:26 -0000
X-Groupsio-MsgNum: 14523
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline

--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2011 at 10:37:34AM +0100, Martin Jansa wrote:
> On Tue, Dec 20, 2011 at 10:07:56AM +0100, Martin Jansa wrote:
> > On Fri, Dec 16, 2011 at 01:24:24PM -0800, Khem Raj wrote:
> > > On (15/12/11 12:16), Richard Purdie wrote:
> > > > On Wed, 2011-12-14 at 07:49 -0800, Khem Raj wrote:
> > > > > On Wed, Dec 14, 2011 at 2:02 AM, Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > > Hi Khem,
> > > > > >
> > > > > > What's puzzling me is that reading through this patch, we alrea=
dy do
> > > > > > what this patch is doing?
> > > > > >
> > > > > > Where is the difference which this patch is fixing?
> > > > > >
> > > > >=20
> > > > > this does essentially what we were doing earlier but this one is =
going
> > > > > to go upstream
> > > >=20
> > > > Yes, that is good and I'm fine with the patch for that reason.
> > >=20
> > > there is additional detail that this patch does which is that in order
> > > to make gxx-includes to be sysroot relative --with-cxx-include option=
 to
> > > be also specified relative to initials sysroot during configure time
> > >=20
> > > e.g. --with-sysroot=3DSYSROOT --with-gxx-include-dir=3DSYSROOT/usr/in=
clude/c++
> > >=20
> > > since the original behavior of --with-gxx-include-dir is to specify an
> > > absolute path that is preserved whereas the patch we have in OE reloc=
ates
> > > gxx-include-dir regardless.Therefore in order to adopt this patch we =
have
> > > to use the above syntax which was original syntax before the above pa=
tch
> > > and would make up forward compatible provided this patch makes into g=
cc
> > > upstream.
> > >=20
> > > >=20
> > > > >=20
> > > > > > I appreciate that patch adds in the prefix to the --with-gxx-in=
clude-dir
> > > > > > option but it then removes it again during configure so this sh=
ould be a
> > > > > > null op. Both versions of the patch set the "1" bit in gcc/cppd=
efault.c.
> > > > > >
> > > > > > So where is the change this patch makes which fixes things?
> > > > >=20
> > > > > changing --with-gxx-include-dir to be within sysroot triggers the
> > > > > relocation code.
> > > >=20
> > > > But we were already triggering the relocation code?
> > > >=20
> > > > I can't see *any* functionality difference between these, they shou=
ld
> > > > both just give the same result as far as I can tell...
> > > >=20
> > > same functionality but with a different usage see above
> > >=20
> > > > Claiming it fixes things is therefore concerning me.
> > >=20
> > > correct it does not fix anything actually that I know was broken befo=
re
> > > Thinking out loud given that with-gxx-include-dir is absolute in natu=
re it could be
> > > the original patch we have, does not work in some weird case since the
> > > absolute path we use is still /usr/include/c++ during configure time.
> > > although I would expect that the include poisoning warning will repor=
t it if that
> > > happened
> > >=20
> > > -Khem
> >=20
> > Is there some pending patch for meta-oe/gcc?
> >=20
> > I have some issues while rebuilding toolchain from scratch after this
> > patchset:
> >=20
> > armv7a:
> > | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-=
branch/gcc/rtl.h:2163:12: note: expected 'enum machine_mode' but argument i=
s of type 'int'
> > | gcc -c   -isystem/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/in=
clude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-stri=
ngs -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmissing-format-a=
ttribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-stri=
ngs -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -I. -I/OE/shr=
-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc -I=
/OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch=
/gcc/. -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4=
_6-branch/gcc/../include -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+sv=
nr181430-r23/gcc-4_6-branch/gcc/../libcpp/include  -I/OE/shr-core/tmp-eglib=
c/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc/../libdecnumber -=
I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branc=
h/gcc/../libdecnumber/dpd -I../libdecnumber    /OE/shr-core/tmp-eglibc/work=
-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc/calls.c -o calls.o
> > | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-=
branch/gcc/calls.c: In function 'initialize_argument_information':
> > | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-=
branch/gcc/calls.c:1089:9: error: 'STACK_CHECK_MAX_VAR_SIZE' undeclared (fi=
rst use in this function)
> > | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-=
branch/gcc/calls.c:1089:9: note: each undeclared identifier is reported onl=
y once for each function it appears in
> > | make[2]: *** [calls.o] Error 1
> >=20
> > armv4t:
> > | gcc -c   -isystem/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/in=
clude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-stri=
ngs -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmissing-format-a=
ttribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-stri=
ngs -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -I. -I/OE/shr=
-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc -I=
/OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch=
/gcc/. -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4=
_6-branch/gcc/../include -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+sv=
nr181430-r23/gcc-4_6-branch/gcc/../libcpp/include  -I/OE/shr-core/tmp-eglib=
c/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc/../libdecnumber -=
I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branc=
h/gcc/../libdecnumber/dpd -I../libdecnumber    insn-output.c -o insn-output=
=2Eo
> > | In file included from insn-emit.c:23:0:
> > | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-=
branch/gcc/config/arm/constraints.md: In function 'satisfies_constraint_Uu':
> > | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-=
branch/gcc/config/arm/constraints.md:353:6: warning: implicit declaration o=
f function 'thumb1_legitimate_address_p' [-Wimplicit-function-declaration]
> > | insn-opinit.c: In function 'init_all_optabs':
> > | insn-opinit.c:25:5: warning: implicit declaration of function 'set_wi=
dening_optab_handler' [-Wimplicit-function-declaration]
> > | insn-opinit.c:30:7: error: 'TARGET_IDIV' undeclared (first use in thi=
s function)
> > | insn-opinit.c:30:7: note: each undeclared identifier is reported only=
 once for each function it appears in
> > | insn-opinit.c:813:32: error: 'vec_load_lanes_optab' undeclared (first=
 use in this function)
> > | insn-opinit.c:833:32: error: 'vec_store_lanes_optab' undeclared (firs=
t use in this function)
> > | insn-opinit.c:1009:24: error: 'vec_widen_sshiftl_lo_optab' undeclared=
 (first use in this function)
> > | insn-opinit.c:1011:24: error: 'vec_widen_ushiftl_lo_optab' undeclared=
 (first use in this function)
> > | insn-opinit.c:1021:24: error: 'vec_widen_sshiftl_hi_optab' undeclared=
 (first use in this function)
> > | insn-opinit.c:1023:24: error: 'vec_widen_ushiftl_hi_optab' undeclared=
 (first use in this function)
> > | make[2]: *** [insn-opinit.o] Error 1
> > | make[2]: *** Waiting for unfinished jobs....
>=20
> and different one for armv5te too:
> | GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -Wcast-qual -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-format-attribute -pedanti=
c -Wno-long-long -Wno-variadic-macros -Wno-overlength-strings -Wold-style-d=
efinition -Wc++-compat   -DHAVE_CONFIG_H -I. -I. -I/OE/shr-core/tmp-eglibc/=
work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc -I/OE/shr-core/tmp-=
eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc/. -I/OE/shr-=
core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc/../=
include -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-=
4_6-branch/gcc/../libcpp/include  -I/OE/shr-core/tmp-eglibc/work-shared/gcc=
-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc/../libdecnumber -I/OE/shr-core/tmp=
-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc/../libdecnu=
mber/dpd -I../libdecnumber    /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2=
+svnr181430-r23/gcc-4_6-branch/gcc/cgraphbuild.c -o cgraphbuild.o
> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-br=
anch/gcc/config/arm/arm.c: In function 'bounds_check':
> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-br=
anch/gcc/config/arm/arm.c:9204:5: warning: format not a string literal and =
no format arguments [-Wformat-security]
> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-br=
anch/gcc/config/arm/arm.c: In function 'arm_print_operand':
> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-br=
anch/gcc/config/arm/arm.c:16786:4: warning: format not a string literal and=
 no format arguments [-Wformat-security]
> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-br=
anch/gcc/config/arm/arm.c: In function 'arm_init_neon_builtins':
> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-br=
anch/gcc/config/arm/arm.c:19270:4: error: 'neon_struct_operand' undeclared =
(first use in this function)
> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-br=
anch/gcc/config/arm/arm.c:19270:4: note: each undeclared identifier is repo=
rted only once for each function it appears in
> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-br=
anch/gcc/config/arm/arm.c: At top level:
> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-br=
anch/gcc/config/arm/arm.c:6753:1: warning: 'arm_legitimate_constant_p' defi=
ned but not used [-Wunused-function]
> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-br=
anch/gcc/config/arm/arm.c:22697:1: warning: 'arm_array_mode_supported_p' de=
fined but not used [-Wunused-function]
> | make[2]: *** [arm.o] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | rm gcov.pod cpp.pod gfdl.pod gcc.pod fsf-funding.pod
> | make[2]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv5te-oe-lin=
ux-gnueabi/gcc-cross-initial/4.6.2+svnr181430-r23/gcc-4_6-branch/build.x86_=
64-linux.arm-oe-linux-gnueabi/gcc'
> | make[1]: *** [all-gcc] Error 2
> | make[1]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv5te-oe-lin=
ux-gnueabi/gcc-cross-initial/4.6.2+svnr181430-r23/gcc-4_6-branch/build.x86_=
64-linux.arm-oe-linux-gnueabi'
> | make: *** [all] Error 2

without
PARALLEL_MAKE=3D"-j4"
BB_NUMBER_THREADS =3D "2"
I've managed to build toolchain for one arch, but after switching MACHINE i=
t fails again:

| Checking multilib configuration for libgcc...
| Configuring in arm-oe-linux-gnueabi/libgcc
| configure: loading cache ./config.cache
| configure: error: `CC' has changed since the previous run:
| configure:   former value:  ` /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-li=
nux-gnueabi/gcc-cross/4.6.2+svnr181430-r23/gcc-4_6-branch/build.x86_64-linu=
x.arm-oe-linux-gnueabi/./gcc/xgcc -B/OE/shr-core/tmp/work/armv7a-vfp-neon-o=
e-linux-gnueabi/gcc-cross/4.6.2+svnr181430-r23/gcc-4_6-branch/build.x86_64-=
linux.arm-oe-linux-gnueabi/./gcc/ -march=3Darmv7-a -fno-tree-vectorize     =
 -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -is=
ystem/OE/shr-core/tmp/sysroots/nokia900/usr/include -B/OE/shr-core/tmp/sysr=
oots/x86_64-linux/usr/arm-oe-linux-gnueabi/bin/ -B/OE/shr-core/tmp/sysroots=
/x86_64-linux/usr/arm-oe-linux-gnueabi/lib/ -isystem /OE/shr-core/tmp/sysro=
ots/x86_64-linux/usr/arm-oe-linux-gnueabi/include -isystem /OE/shr-core/tmp=
/sysroots/x86_64-linux/usr/arm-oe-linux-gnueabi/sys-include --sysroot=3D/OE=
/shr-core/tmp/sysroots/nokia900  '
| configure:   current value: ` /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-li=
nux-gnueabi/gcc-cross/4.6.2+svnr181430-r23/gcc-4_6-branch/build.x86_64-linu=
x.arm-oe-linux-gnueabi/./gcc/xgcc -B/OE/shr-core/tmp/work/armv7a-vfp-neon-o=
e-linux-gnueabi/gcc-cross/4.6.2+svnr181430-r23/gcc-4_6-branch/build.x86_64-=
linux.arm-oe-linux-gnueabi/./gcc/ -march=3Darmv7-a -fno-tree-vectorize     =
 -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -is=
ystem/OE/shr-core/tmp/sysroots/palmpre/usr/include -B/OE/shr-core/tmp/sysro=
ots/x86_64-linux/usr/arm-oeERROR: Function 'do_compile' failed (see /OE/shr=
-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/gcc-cross/4.6.2+svnr181430-=
r23/temp/log.do_compile.13936 for further information)
| -linux-gnueabi/bin/ -B/OE/shr-core/tmp/sysroots/x86_64-linux/usr/arm-oe-l=
inux-gnueabi/lib/ -isystem /OE/shr-core/tmp/sysroots/x86_64-linux/usr/arm-o=
e-linux-gnueabi/include -isystem /OE/shr-core/tmp/sysroots/x86_64-linux/usr=
/arm-oe-linux-gnueabi/sys-include --sysroot=3D/OE/shr-core/tmp/sysroots/pal=
mpre  '
| configure: error: in `/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnue=
abi/gcc-cross/4.6.2+svnr181430-r23/gcc-4_6-branch/build.x86_64-linux.arm-oe=
-linux-gnueabi/arm-oe-linux-gnueabi/libgcc':
| configure: error: changes in the environment can compromise the build
| configure: error: run `make distclean' and/or `rm ./config.cache' and sta=
rt over
| make: *** [configure-target-libgcc] Error 1
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1
NOTE: package gcc-cross-4.6.2+svnr181430-r23: task do_compile: Failed
ERROR: Task 131 (/OE/shr-core/openembedded-core/meta/recipes-devtools/gcc/g=
cc-cross_4.6.bb, do_compile) failed with exit code '1'

maybe it's because something was reused from work-shared?

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7wtIgACgkQN1Ujt2V2gBzVvwCeOStKhErsd3nMQkoRRcTKqFvQ
vHAAn2jIhif4pWe43CIw1Fy479xtK0Sa
=MmQI
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
