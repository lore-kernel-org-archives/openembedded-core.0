Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RcwFf-00084X-BR
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 10:44:51 +0100
Received: by eeit10 with SMTP id t10so2396838eei.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 01:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RiusCJGqLvkQaSbjQdFUrbt1ONpD3W4HngJiiP5l+o4=;
	b=HLbw7RJzMuUn1S+TenQA9P1iJ3LcvMd9YECLel15exGvFKqTXU8oVdTZ6cM+JShv+0
	fVeSalmWXIo9kfnJjHSxMLUThLcyuIgK8kyFvMCKAICCfojAfCO61yDl/nMXHYDyj+kU
	DPQMqJbvybFXDhpV7aj18BGD6udZv4OQ+eEv8=
Received: by 10.14.9.165 with SMTP id 37mr694799eet.10.1324373867686;
	Tue, 20 Dec 2011 01:37:47 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 76sm4648022eeh.0.2011.12.20.01.37.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 01:37:46 -0800 (PST)
Date: Tue, 20 Dec 2011 10:37:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111220093733.GD3946@jama.jama.net>
References: <1323851280-6342-1-git-send-email-raj.khem@gmail.com>
	<1323856946.25491.31.camel@ted>
	<CAMKF1sqLHP1cWfBswrqnwhAPj4Tt3XCV8GpQv7Dm71PX3F=rAw@mail.gmail.com>
	<1323951419.4568.17.camel@ted>
	<20111216212424.GA28832@sakrah.homelinux.org>
	<20111220090753.GC3946@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111220090753.GC3946@jama.jama.net>
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
X-List-Received-Date: Tue, 20 Dec 2011 09:44:51 -0000
X-Groupsio-MsgNum: 14512
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fOHHtNG4YXGJ0yqR"
Content-Disposition: inline

--fOHHtNG4YXGJ0yqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2011 at 10:07:56AM +0100, Martin Jansa wrote:
> On Fri, Dec 16, 2011 at 01:24:24PM -0800, Khem Raj wrote:
> > On (15/12/11 12:16), Richard Purdie wrote:
> > > On Wed, 2011-12-14 at 07:49 -0800, Khem Raj wrote:
> > > > On Wed, Dec 14, 2011 at 2:02 AM, Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > Hi Khem,
> > > > >
> > > > > What's puzzling me is that reading through this patch, we already=
 do
> > > > > what this patch is doing?
> > > > >
> > > > > Where is the difference which this patch is fixing?
> > > > >
> > > >=20
> > > > this does essentially what we were doing earlier but this one is go=
ing
> > > > to go upstream
> > >=20
> > > Yes, that is good and I'm fine with the patch for that reason.
> >=20
> > there is additional detail that this patch does which is that in order
> > to make gxx-includes to be sysroot relative --with-cxx-include option to
> > be also specified relative to initials sysroot during configure time
> >=20
> > e.g. --with-sysroot=3DSYSROOT --with-gxx-include-dir=3DSYSROOT/usr/incl=
ude/c++
> >=20
> > since the original behavior of --with-gxx-include-dir is to specify an
> > absolute path that is preserved whereas the patch we have in OE relocat=
es
> > gxx-include-dir regardless.Therefore in order to adopt this patch we ha=
ve
> > to use the above syntax which was original syntax before the above patch
> > and would make up forward compatible provided this patch makes into gcc
> > upstream.
> >=20
> > >=20
> > > >=20
> > > > > I appreciate that patch adds in the prefix to the --with-gxx-incl=
ude-dir
> > > > > option but it then removes it again during configure so this shou=
ld be a
> > > > > null op. Both versions of the patch set the "1" bit in gcc/cppdef=
ault.c.
> > > > >
> > > > > So where is the change this patch makes which fixes things?
> > > >=20
> > > > changing --with-gxx-include-dir to be within sysroot triggers the
> > > > relocation code.
> > >=20
> > > But we were already triggering the relocation code?
> > >=20
> > > I can't see *any* functionality difference between these, they should
> > > both just give the same result as far as I can tell...
> > >=20
> > same functionality but with a different usage see above
> >=20
> > > Claiming it fixes things is therefore concerning me.
> >=20
> > correct it does not fix anything actually that I know was broken before
> > Thinking out loud given that with-gxx-include-dir is absolute in nature=
 it could be
> > the original patch we have, does not work in some weird case since the
> > absolute path we use is still /usr/include/c++ during configure time.
> > although I would expect that the include poisoning warning will report =
it if that
> > happened
> >=20
> > -Khem
>=20
> Is there some pending patch for meta-oe/gcc?
>=20
> I have some issues while rebuilding toolchain from scratch after this
> patchset:
>=20
> armv7a:
> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-br=
anch/gcc/rtl.h:2163:12: note: expected 'enum machine_mode' but argument is =
of type 'int'
> | gcc -c   -isystem/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/incl=
ude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmissing-format-att=
ribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-string=
s -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -I. -I/OE/shr-c=
ore/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc -I/O=
E/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/g=
cc/. -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6=
-branch/gcc/../include -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr=
181430-r23/gcc-4_6-branch/gcc/../libcpp/include  -I/OE/shr-core/tmp-eglibc/=
work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc/../libdecnumber -I/=
OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/=
gcc/../libdecnumber/dpd -I../libdecnumber    /OE/shr-core/tmp-eglibc/work-s=
hared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc/calls.c -o calls.o
> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-br=
anch/gcc/calls.c: In function 'initialize_argument_information':
> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-br=
anch/gcc/calls.c:1089:9: error: 'STACK_CHECK_MAX_VAR_SIZE' undeclared (firs=
t use in this function)
> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-br=
anch/gcc/calls.c:1089:9: note: each undeclared identifier is reported only =
once for each function it appears in
> | make[2]: *** [calls.o] Error 1
>=20
> armv4t:
> | gcc -c   -isystem/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/incl=
ude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmissing-format-att=
ribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-string=
s -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -I. -I/OE/shr-c=
ore/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc -I/O=
E/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/g=
cc/. -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6=
-branch/gcc/../include -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr=
181430-r23/gcc-4_6-branch/gcc/../libcpp/include  -I/OE/shr-core/tmp-eglibc/=
work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc/../libdecnumber -I/=
OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/=
gcc/../libdecnumber/dpd -I../libdecnumber    insn-output.c -o insn-output.o
> | In file included from insn-emit.c:23:0:
> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-br=
anch/gcc/config/arm/constraints.md: In function 'satisfies_constraint_Uu':
> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-br=
anch/gcc/config/arm/constraints.md:353:6: warning: implicit declaration of =
function 'thumb1_legitimate_address_p' [-Wimplicit-function-declaration]
> | insn-opinit.c: In function 'init_all_optabs':
> | insn-opinit.c:25:5: warning: implicit declaration of function 'set_wide=
ning_optab_handler' [-Wimplicit-function-declaration]
> | insn-opinit.c:30:7: error: 'TARGET_IDIV' undeclared (first use in this =
function)
> | insn-opinit.c:30:7: note: each undeclared identifier is reported only o=
nce for each function it appears in
> | insn-opinit.c:813:32: error: 'vec_load_lanes_optab' undeclared (first u=
se in this function)
> | insn-opinit.c:833:32: error: 'vec_store_lanes_optab' undeclared (first =
use in this function)
> | insn-opinit.c:1009:24: error: 'vec_widen_sshiftl_lo_optab' undeclared (=
first use in this function)
> | insn-opinit.c:1011:24: error: 'vec_widen_ushiftl_lo_optab' undeclared (=
first use in this function)
> | insn-opinit.c:1021:24: error: 'vec_widen_sshiftl_hi_optab' undeclared (=
first use in this function)
> | insn-opinit.c:1023:24: error: 'vec_widen_ushiftl_hi_optab' undeclared (=
first use in this function)
> | make[2]: *** [insn-opinit.o] Error 1
> | make[2]: *** Waiting for unfinished jobs....

and different one for armv5te too:
| GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -Wcast-qual -Ws=
trict-prototypes -Wmissing-prototypes -Wmissing-format-attribute -pedantic =
-Wno-long-long -Wno-variadic-macros -Wno-overlength-strings -Wold-style-def=
inition -Wc++-compat   -DHAVE_CONFIG_H -I. -I. -I/OE/shr-core/tmp-eglibc/wo=
rk-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc -I/OE/shr-core/tmp-eg=
libc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc/. -I/OE/shr-co=
re/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc/../in=
clude -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_=
6-branch/gcc/../libcpp/include  -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4=
=2E6.2+svnr181430-r23/gcc-4_6-branch/gcc/../libdecnumber -I/OE/shr-core/tmp=
-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc/../libdecnu=
mber/dpd -I../libdecnumber    /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2=
+svnr181430-r23/gcc-4_6-branch/gcc/cgraphbuild.c -o cgraphbuild.o
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-bran=
ch/gcc/config/arm/arm.c: In function 'bounds_check':
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-bran=
ch/gcc/config/arm/arm.c:9204:5: warning: format not a string literal and no=
 format arguments [-Wformat-security]
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-bran=
ch/gcc/config/arm/arm.c: In function 'arm_print_operand':
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-bran=
ch/gcc/config/arm/arm.c:16786:4: warning: format not a string literal and n=
o format arguments [-Wformat-security]
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-bran=
ch/gcc/config/arm/arm.c: In function 'arm_init_neon_builtins':
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-bran=
ch/gcc/config/arm/arm.c:19270:4: error: 'neon_struct_operand' undeclared (f=
irst use in this function)
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-bran=
ch/gcc/config/arm/arm.c:19270:4: note: each undeclared identifier is report=
ed only once for each function it appears in
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-bran=
ch/gcc/config/arm/arm.c: At top level:
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-bran=
ch/gcc/config/arm/arm.c:6753:1: warning: 'arm_legitimate_constant_p' define=
d but not used [-Wunused-function]
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-bran=
ch/gcc/config/arm/arm.c:22697:1: warning: 'arm_array_mode_supported_p' defi=
ned but not used [-Wunused-function]
| make[2]: *** [arm.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| rm gcov.pod cpp.pod gfdl.pod gcc.pod fsf-funding.pod
| make[2]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv5te-oe-linux=
-gnueabi/gcc-cross-initial/4.6.2+svnr181430-r23/gcc-4_6-branch/build.x86_64=
-linux.arm-oe-linux-gnueabi/gcc'
| make[1]: *** [all-gcc] Error 2
| make[1]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv5te-oe-linux=
-gnueabi/gcc-cross-initial/4.6.2+svnr181430-r23/gcc-4_6-branch/build.x86_64=
-linux.arm-oe-linux-gnueabi'
| make: *** [all] Error 2

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fOHHtNG4YXGJ0yqR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7wV10ACgkQN1Ujt2V2gBxN9ACfVvtPvvrH4jg8z5NlrmfTO+If
IxcAn1zkzDBSYhUjqrfgsN6o7aCPNUB6
=5E/a
-----END PGP SIGNATURE-----

--fOHHtNG4YXGJ0yqR--
