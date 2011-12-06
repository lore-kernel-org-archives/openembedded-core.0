Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXtVo-0004oG-R1
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 12:48:41 +0100
Received: by yenq1 with SMTP id q1so1753754yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 03:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=YiDpFvzRJsBcQ3uLyEHzvrIXuJB7sKYbgLfOM0lcuPs=;
	b=axZ2oiXLhWsCMksIq0wvIhevbUcDZF0RPZeGPZz2wql6mATmXYdrLs+9+8bfJMSAYi
	IJL/aHvgOUJOnAOgSRNMvUrImr40gt46eSuy3DGqJQbN04pnyAJPwKNfz7oZnokNPCCO
	bRun8UdoN1/Vtt6cmb8UcjL6uqiIELL5t3Cew=
MIME-Version: 1.0
Received: by 10.236.185.133 with SMTP id u5mr17986267yhm.106.1323171711774;
	Tue, 06 Dec 2011 03:41:51 -0800 (PST)
Received: by 10.146.76.12 with HTTP; Tue, 6 Dec 2011 03:41:51 -0800 (PST)
In-Reply-To: <09058d57658d20d3f71f149a879563393f6fb313.1323148566.git.raj.khem@gmail.com>
References: <cover.1323148566.git.raj.khem@gmail.com>
	<2f734b193f63f8fe0625c758bc5c696bf93166ac.1323148566.git.raj.khem@gmail.com>
	<09058d57658d20d3f71f149a879563393f6fb313.1323148566.git.raj.khem@gmail.com>
Date: Tue, 6 Dec 2011 12:41:51 +0100
Message-ID: <CA+chaQfBfNs57Be9N-T1QzfZ=aXzDMN7QjKeKV8ZGnULORZjng@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] cloog-ppl,ppl: Add new recipes
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
X-List-Received-Date: Tue, 06 Dec 2011 11:48:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 6, 2011 at 6:21 AM, Khem Raj <raj.khem@gmail.com> wrote:
> These are supporting libraries needed if we want
> to build gcc with graphite support which does better
> job on loop optimizarions.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/recipes-support/cloog-ppl/cloog-ppl.inc =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A06 +
> =C2=A0.../recipes-support/cloog-ppl/cloog-ppl_0.15.11.bb | =C2=A0 13 +
> =C2=A0.../ppl/ppl-0.11.2/ppl_autoreconf.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|17034 ++++++++++++++++++++
> =C2=A0meta/recipes-support/ppl/ppl.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A06 +
> =C2=A0meta/recipes-support/ppl/ppl_0.11.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 16 +
> =C2=A0meta/recipes-support/ppl/ppl_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 17 +
> =C2=A06 files changed, 17092 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 meta/recipes-support/cloog-ppl/cloog-ppl.inc
> =C2=A0create mode 100644 meta/recipes-support/cloog-ppl/cloog-ppl_0.15.11=
.bb
> =C2=A0create mode 100644 meta/recipes-support/ppl/ppl-0.11.2/ppl_autoreco=
nf.patch
> =C2=A0create mode 100644 meta/recipes-support/ppl/ppl.inc
> =C2=A0create mode 100644 meta/recipes-support/ppl/ppl_0.11.2.bb
> =C2=A0create mode 100644 meta/recipes-support/ppl/ppl_git.bb

While testing this changes I got this from ppl build

| ../arm-oe-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dlink
arm-oe-linux-gnueabi-g++  -march=3Darmv7-a -fno-tree-vectorize
-mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8
--sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900  -O2
-frounding-math -O2 -pipe -g -feliminate-unused-debug-types
-fpermissive -fvisibility-inlines-hidden -W -Wall  -version-info 9:0:0
-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o libppl.la -rpath
/usr/lib Box.lo checked.lo Checked_Number.lo Float.lo fpu-ia32.lo
Constraint.lo Constraint_System.lo Congruence.lo Congruence_System.lo
Generator_System.lo Grid_Generator_System.lo Generator.lo
Grid_Generator.lo Init.lo Coefficient.lo Linear_Expression.lo
Linear_System.lo Matrix.lo Scalar_Products.lo MIP_Problem.lo
PIP_Tree.lo PIP_Problem.lo Poly_Con_Relation.lo Poly_Gen_Relation.lo
BHRZ03_Certificate.lo H79_Certificate.lo Grid_Certificate.lo
Partial_Function.lo Polyhedron_nonpublic.lo Polyhedron_public.lo
Polyhedron_chdims.lo Polyhedron_widenings.lo C_Polyhedron.lo
NNC_Polyhedron.lo Grid_nonpublic.lo Grid_public.lo Grid_chdims.lo
Grid_widenings.lo BD_Shape.lo Octagonal_Shape.lo PERROR: Function
'do_compile' failed (see
/OE/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/ppl-0.11.2-r0=
/temp/log.do_compile.4745
for further information)
| ointset_Powerset.lo Row.lo Linear_Row.lo Bit_Matrix.lo Bit_Row.lo
Ph_Status.lo Grid_Status.lo Variable.lo Variables_Set.lo conversion.lo
minimize.lo simplify.lo Grid_conversion.lo Grid_simplify.lo
stdiobuf.lo c_streambuf.lo globals.lo mp_std_bits.lo
Weight_Profiler.lo version.lo    termination.lo wrap_string.lo
-L/usr/lib -lgmpxx -L/usr/lib -lgmp
| arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-g++
-march=3Darmv7-a -fno-tree-vectorize      -mthumb-interwork
-mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8
--sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900  -fPIC -DPIC
-shared -nostdlib
/OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/crti.o
/OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/arm-oe-linux-gnueabi/4.6.=
3/crtbeginS.o
 .libs/Box.o .libs/checked.o .libs/Checked_Number.o .libs/Float.o
.libs/fpu-ia32.o .libs/Constraint.o .libs/Constraint_System.o
.libs/Congruence.o .libs/Congruence_System.o .libs/Generator_System.o
.libs/Grid_Generator_System.o .libs/Generator.o .libs/Grid_Generator.o
.libs/Init.o .libs/Coefficient.o .libs/Linear_Expression.o
.libs/Linear_System.o .libs/Matrix.o .libs/Scalar_Products.o
.libs/MIP_Problem.o .libs/PIP_Tree.o .libs/PIP_Problem.o
.libs/Poly_Con_Relation.o .libs/Poly_Gen_Relation.o
.libs/BHRZ03_Certificate.o .libs/H79_Certificate.o
.libs/Grid_Certificate.o .libs/Partial_Function.o
.libs/Polyhedron_nonpublic.o .libs/Polyhedron_public.o
.libs/Polyhedron_chdims.o .libs/Polyhedron_widenings.o
.libs/C_Polyhedron.o .libs/NNC_Polyhedron.o .libs/Grid_nonpublic.o
.libs/Grid_public.o .libs/Grid_chdims.o .libs/Grid_widenings.o
.libs/BD_Shape.o .libs/Octagonal_Shape.o .libs/Pointset_Powerset.o
.libs/Row.o .libs/Linear_Row.o .libs/Bit_Matrix.o .libs/Bit_Row.o
.libs/Ph_Status.o .libs/Grid_Status.o .libs/Variable.o
.libs/Variables_Set.o .libs/conversion.o .libs/minimize.o
.libs/simplify.o .libs/Grid_conversion.o .libs/Grid_simplify.o
.libs/stdiobuf.o .libs/c_streambuf.o .libs/globals.o
.libs/mp_std_bits.o .libs/Weight_Profiler.o .libs/version.o
.libs/termination.o .libs/wrap_string.o   -L/usr/lib -lgmpxx -lgmp
-L/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-vfp-neon-oe-=
linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.3
-L/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-vfp-neon-oe-=
linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.3/../../../../../arm-oe-linux-gn=
ueabi/lib
-L/OE/shr-core/tmp-eglibc/sysroots/nokia900/lib
-L/OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/arm-oe-linux-gnueabi/4.=
6.3
-L/OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib
/OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libstdc++.so -lm -lc
-lgcc_s /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/arm-oe-linux-gnue=
abi/4.6.3/crtendS.o
/OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/crtn.o
-march=3Darmv7-a -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon
-mtune=3Dcortex-a8 --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900
-O2 -O2 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed   -Wl,-soname
-Wl,libppl.so.9 -o .libs/libppl.so.9.0.0
| /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv7a-vfp-neon=
-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.3/ld:
warning: library search path "/usr/lib" is unsafe for
cross-compilation
| /usr/lib/libgmpxx.so: file not recognized: File format not recognized
| collect2: ld returned 1 exit status
| make[3]: *** [libppl.la] Error 1
| make[3]: Leaving directory
`/OE/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/ppl-0.11.2-r=
0/ppl-0.11.2/src'
| make[2]: *** [all] Error 2
| make[2]: Leaving directory
`/OE/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/ppl-0.11.2-r=
0/ppl-0.11.2/src'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/OE/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/ppl-0.11.2-r=
0/ppl-0.11.2'
| make: *** [all] Error 2
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1
NOTE: package ppl-0.11.2-r0: task do_compile: Failed
ERROR: Task 7 (/OE/shr-core/openembedded-core/meta/recipes-support/ppl/ppl_=
0.11.2.bb,
do_compile) failed with exit code '1'
ERROR: '/OE/shr-core/openembedded-core/meta/recipes-support/ppl/ppl_0.11.2.=
bb'
failed

libgmp was built, but wrong one is used, from config.log:

configure:10139: checking how to link with libgmp
configure:10612: result: /usr/lib/libgmp.so
configure:10654: checking how to link with libgmpxx
configure:11127: result: /usr/lib/libgmpxx.so /usr/lib/libgmp.so
configure:11173: checking for the GMP library version 4.1.3 or above
...
ac_cv_libgmp_cppflags=3D
ac_cv_libgmp_libs=3D/usr/lib/libgmp.so
ac_cv_libgmp_ltlibs=3D'-L/usr/lib -lgmp'
ac_cv_libgmp_prefix=3D/usr
ac_cv_libgmpxx_cppflags=3D
ac_cv_libgmpxx_libs=3D'/usr/lib/libgmpxx.so /usr/lib/libgmp.so'
ac_cv_libgmpxx_ltlibs=3D'-L/usr/lib -lgmpxx -L/usr/lib -lgmp'
ac_cv_libgmpxx_prefix=3D/usr

OE @ ~/shr-core/tmp-eglibc $ find sysroots/nokia900/usr/lib/ -name libgmp\*
sysroots/nokia900/usr/lib/libgmp.so.10.0.2
sysroots/nokia900/usr/lib/libgmp.la
sysroots/nokia900/usr/lib/libgmpxx.a
sysroots/nokia900/usr/lib/libgmpxx.so.4
sysroots/nokia900/usr/lib/libgmp.so.10
sysroots/nokia900/usr/lib/libgmpxx.la
sysroots/nokia900/usr/lib/ssl/engines/libgmp.so
sysroots/nokia900/usr/lib/libgmp.so
sysroots/nokia900/usr/lib/libgmpxx.so.4.2.2
sysroots/nokia900/usr/lib/libgmp.a
sysroots/nokia900/usr/lib/libgmpxx.so

Maybe we should pass --with-gmp-build or improve m4/ac_check_gmp.m4 to
detect gmp in sysroot?


