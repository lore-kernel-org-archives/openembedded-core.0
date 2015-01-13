Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6627765C7B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 02:39:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="55958372"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jan 2015 10:35:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0D2cYKI028535;
	Tue, 13 Jan 2015 10:38:35 +0800
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Tue, 13 Jan 2015 10:39:11 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "Peter A. Bigot" <pab@pabigot.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] gcc: upgrade to 4.9.2 and fix the bug #6824
Thread-Index: AQHQLmS0+510mBkRd0meRqksA+u7hJy9UlzA
Date: Tue, 13 Jan 2015 02:39:17 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDAE51B8@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1421032337-50265-1-git-send-email-leimaohui@cn.fujitsu.com>
	<54B3C03C.7060609@pabigot.com>
In-Reply-To: <54B3C03C.7060609@pabigot.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.48]
MIME-Version: 1.0
Subject: Re: [PATCH] gcc: upgrade to 4.9.2 and fix the bug #6824
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
X-List-Received-Date: Tue, 13 Jan 2015 02:39:15 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Peter

> As gcc is (IMO) one of the most critical components of Yocto I think we n=
eed
> to be very clear about what changes are being made to it and why.
>=20

Yes ,It does.

> In addition to missing SOB lines, these patches at a minimum should refer=
ence
> the upstream bug that they supposedly patch.  That would be
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D63908

I got it.

>=20
> Ideally, the patch would be taken from upstream, being created by
> git-format-patch with the SHA1 of the relevant change as retrieved from:
> git://gcc.gnu.org/git/gcc.git

Yes, but the patches created by git-format-patch from upstream can't be app=
lied to 4.9 branch directly.
I tried to backport the patches to 4.9.1 for minimum patch, But I failed.

>=20
> It worries me that these patches, though present in upstream trunk, have =
not
> been back-ported to gcc-4_9-branch.  There may be a reason for that, and =
the
> fact backports have not (yet) been done should be noted in the OE patch h=
eader.

It does make sense. I hope these patches can be backported to gcc-4_9-branc=
h by gcc member.
But I didn't get the answer from gcc Bugzilla.
I think the https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D6824 is a a=
 serious bug. So I did it by myself. :)



Cheers,
Lei


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Pe=
ter
> A. Bigot
> Sent: Monday, January 12, 2015 8:38 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] gcc: upgrade to 4.9.2 and fix the bug #682=
4
>=20
> On 01/11/2015 09:12 PM, Lei Maohui wrote:
> > fix the yocto bug #6824
> > backport from gcc
> >
> > Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> > ---
> >   meta/recipes-devtools/gcc/gcc-4.9.inc              |  12 +-
> >   ...e500-double-in-SPE_SIMD_REGNO_P-registers.patch |  13 ++
> >   .../0061-Fix-for-unwinder-aborts-on-e500.patch     | 161
> +++++++++++++++++++++
> >   3 files changed, 180 insertions(+), 6 deletions(-)
> >   create mode 100644
> meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-double-in-SPE_SIMD=
_
> REGNO_P-registers.patch
> >   create mode 100644
> > meta/recipes-devtools/gcc/gcc-4.9/0061-Fix-for-unwinder-aborts-on-e500
> > .patch
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc
> > b/meta/recipes-devtools/gcc/gcc-4.9.inc
> > index 2568e99..c4ec40d 100644
> > --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> > @@ -2,11 +2,11 @@ require gcc-common.inc
> >
> >   # Third digit in PV should be incremented after a minor release
> >
> > -PV =3D "4.9.1"
> > +PV =3D "4.9.2"
> >
> >   # BINV should be incremented to a revision after a minor gcc release
> >
> > -BINV =3D "4.9.1"
> > +BINV =3D "4.9.2"
> >
> >   FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc-4.9:"
> >
> > @@ -69,11 +69,11 @@ SRC_URI =3D "\
> >       file://0051-eabispe.patch \
> >
> file://0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch \
> >       file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
> > -    file://0055-PR-rtl-optimization-61801.patch \
> >       file://0056-top-level-reorder_gcc-bug-61144.patch \
> > -    file://0057-aarch64-config.patch \
> >       file://0058-gcc-r212171.patch \
> >       file://0059-gcc-PR-rtl-optimization-63348.patch \
> > +
> file://0060-Only-allow-e500-double-in-SPE_SIMD_REGNO_P-registers.patch \
> > +    file://0061-Fix-for-unwinder-aborts-on-e500.patch \
> >   "
> >   SRC_URI[md5sum] =3D "fddf71348546af523353bd43d34919c1"
> >   SRC_URI[sha256sum] =3D
> "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
> > @@ -125,8 +125,8 @@ EXTRA_OECONF_INTERMEDIATE =3D "\
> >   EXTRA_OECONF_append_libc-uclibc =3D " --disable-decimal-float "
> >
> >   EXTRA_OECONF_PATHS =3D "\
> > -    --with-gxx-include-dir=3D/not/exist{target_includedir}/c++/${BINV}=
 \
> > -    --with-sysroot=3D/not/exist \
> > +
> --with-gxx-include-dir=3D${STAGING_DIR_TARGET}${target_includedir}/c++/${=
BIN
> V} \
> > +    --with-sysroot=3D${STAGING_DIR_TARGET} \
> >       --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> >   "
> >
> > diff --git
> > a/meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-double-in-SPE
> > _SIMD_REGNO_P-registers.patch
> > b/meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-double-in-SPE
> > _SIMD_REGNO_P-registers.patch
>=20
> As gcc is (IMO) one of the most critical components of Yocto I think we n=
eed
> to be very clear about what changes are being made to it and why.
>=20
> In addition to missing SOB lines, these patches at a minimum should refer=
ence
> the upstream bug that they supposedly patch.  That would be
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D63908
>=20
> Ideally, the patch would be taken from upstream, being created by
> git-format-patch with the SHA1 of the relevant change as retrieved from:
> git://gcc.gnu.org/git/gcc.git
>=20
> It worries me that these patches, though present in upstream trunk, have =
not
> been back-ported to gcc-4_9-branch.  There may be a reason for that, and =
the
> fact backports have not (yet) been done should be noted in the OE patch h=
eader.
>=20
> This first patch is apparently upstream commit
> 5c0092070253113cf0d9c45eacc884b3ecc34d81.
>=20
> > new file mode 100644
> > index 0000000..810ff90
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-double-in
> > +++ -SPE_SIMD_REGNO_P-registers.patch
> > @@ -0,0 +1,13 @@
> > +diff --git a/gcc/config/rs6000/rs6000.c b/gcc/config/rs6000/rs6000.c
> > +index 512e7d6..292fb2c 100644
> > +--- a/gcc/config/rs6000/rs6000.c
> > ++++ b/gcc/config/rs6000/rs6000.c
> > +@@ -1704,7 +1704,7 @@ rs6000_hard_regno_nregs_internal (int regno, enu=
m
> machine_mode mode)
> > +      SCmode so as to pass the value correctly in a pair of
> > +      registers.  */
> > +   else if (TARGET_E500_DOUBLE && FLOAT_MODE_P (mode) && mode !=3D SCm=
ode
> > +-	   && !DECIMAL_FLOAT_MODE_P (mode))
> > ++           && !DECIMAL_FLOAT_MODE_P (mode) && SPE_SIMD_REGNO_P
> > ++ (regno))
> > +     reg_size =3D UNITS_PER_FP_WORD;
> > +
> > +   else
> > diff --git
> > a/meta/recipes-devtools/gcc/gcc-4.9/0061-Fix-for-unwinder-aborts-on-e5
> > 00.patch
> > b/meta/recipes-devtools/gcc/gcc-4.9/0061-Fix-for-unwinder-aborts-on-e5
> > 00.patch
> > new file mode 100644
>=20
> This patch appears to combine c0235a33de8c4f78cce35b2a8c2035c83fe1bd14
> with 4fd39f1329379e00f958394adde6be96f0caf21f.
>=20
> > index 0000000..c37a4c3
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-4.9/0061-Fix-for-unwinder-aborts-o
> > +++ n-e500.patch
> > @@ -0,0 +1,161 @@
> > +diff --git a/gcc/defaults.h b/gcc/defaults.h index f94ae17..80a798f
> > +100644
> > +--- a/gcc/defaults.h
> > ++++ b/gcc/defaults.h
> > +@@ -438,6 +438,11 @@ see the files COPYING3 and COPYING.RUNTIME
> > +respectively.  If not, see  #define DWARF_FRAME_REGNUM(REG)
> > +DBX_REGISTER_NUMBER (REG)  #endif
> > +
> > ++/* The mapping from dwarf CFA reg number to internal dwarf reg
> > ++numbers.  */ #ifndef DWARF_REG_TO_UNWIND_COLUMN #define
> > ++DWARF_REG_TO_UNWIND_COLUMN(REGNO) (REGNO) #endif
> > ++
> > + /* Map register numbers held in the call frame info that gcc has
> > +    collected using DWARF_FRAME_REGNUM to those that should be output =
in
> > +    .debug_frame and .eh_frame.  */
> > +diff --git a/gcc/dwarf2cfi.c b/gcc/dwarf2cfi.c index abcdeb3..4e59dfe
> > +100644
> > +--- a/gcc/dwarf2cfi.c
> > ++++ b/gcc/dwarf2cfi.c
> > +@@ -252,7 +252,60 @@ init_return_column_size (enum machine_mode mode, =
rtx
> mem, unsigned int c)
> > + 		  gen_int_mode (size, mode));
> > + }
> > +
> > +-/* Generate code to initialize the register size table.  */
> > ++/* Datastructure used by expand_builtin_init_dwarf_reg_sizes and
> > ++   init_one_dwarf_reg_size to communicate on what has been done by th=
e
> > ++   latter.  */
> > ++
> > ++typedef struct
> > ++{
> > ++  /* Whether the dwarf return column was initialized.  */
> > ++  bool wrote_return_column;
> > ++
> > ++  /* For each hard register REGNO, whether init_one_dwarf_reg_size
> > ++     was given REGNO to process already.  */  bool processed_regno
> > ++ [FIRST_PSEUDO_REGISTER];
> > ++
> > ++} init_one_dwarf_reg_state;
> > ++
> > ++/* Helper for expand_builtin_init_dwarf_reg_sizes.  Generate code to
> > ++   initialize the dwarf register size table entry corresponding to re=
gister
> > ++   REGNO in REGMODE.  TABLE is the table base address, SLOTMODE is th=
e mode
> to
> > ++   use for the size entry to initialize, and INIT_STATE is the commun=
ication
> > ++   datastructure conveying what we're doing to our caller.  */
> > ++
> > ++static
> > ++void init_one_dwarf_reg_size (int regno, machine_mode regmode,
> > ++                             rtx table, machine_mode slotmode,
> > ++                             init_one_dwarf_reg_state *init_state) {
> > ++  const unsigned int dnum =3D DWARF_FRAME_REGNUM (regno);
> > ++  const unsigned int rnum =3D DWARF2_FRAME_REG_OUT (dnum, 1);
> > ++  const unsigned int dcol =3D DWARF_REG_TO_UNWIND_COLUMN (rnum);
> > ++
> > ++  const HOST_WIDE_INT slotoffset =3D dcol * GET_MODE_SIZE (slotmode);
> > ++ const HOST_WIDE_INT regsize =3D GET_MODE_SIZE (regmode);
> > ++
> > ++  init_state->processed_regno[regno] =3D true;
> > ++
> > ++  if (rnum >=3D DWARF_FRAME_REGISTERS)
> > ++    return;
> > ++
> > ++  if (dnum =3D=3D DWARF_FRAME_RETURN_COLUMN)
> > ++    {
> > ++      if (regmode =3D=3D VOIDmode)
> > ++       return;
> > ++      init_state->wrote_return_column =3D true;
> > ++    }
> > ++
> > ++  if (slotoffset < 0)
> > ++    return;
> > ++
> > ++  emit_move_insn (adjust_address (table, slotmode, slotoffset),
> > ++                 gen_int_mode (regsize, slotmode)); }
> > ++
> > ++/* Generate code to initialize the dwarf register size table located
> > ++   at the provided ADDRESS.  */
> > +
> > + void
> > + expand_builtin_init_dwarf_reg_sizes (tree address) @@ -261,37
> > ++314,41 @@ expand_builtin_init_dwarf_reg_sizes (tree address)
> > +   enum machine_mode mode =3D TYPE_MODE (char_type_node);
> > +   rtx addr =3D expand_normal (address);
> > +   rtx mem =3D gen_rtx_MEM (BLKmode, addr);
> > +-  bool wrote_return_column =3D false;
> > ++
> > ++  init_one_dwarf_reg_state init_state;  memset ((char *)&init_state,
> > ++ 0, sizeof (init_state));
> > +
> > +   for (i =3D 0; i < FIRST_PSEUDO_REGISTER; i++)
> > +     {
> > +-      unsigned int dnum =3D DWARF_FRAME_REGNUM (i);
> > +-      unsigned int rnum =3D DWARF2_FRAME_REG_OUT (dnum, 1);
> > ++      machine_mode save_mode;
> > ++      rtx span;
> > +
> > +-      if (rnum < DWARF_FRAME_REGISTERS)
> > +-	{
> > +-	  HOST_WIDE_INT offset =3D rnum * GET_MODE_SIZE (mode);
> > +-	  enum machine_mode save_mode =3D reg_raw_mode[i];
> > +-	  HOST_WIDE_INT size;
> > ++      /* No point in processing a register multiple times.  This coul=
d
> happen
> > ++         with register spans, e.g. when a reg is first processed as a=
 piece
> of
> > ++         a span, then as a register on its own later on.  */
> > +
> > +-	  if (HARD_REGNO_CALL_PART_CLOBBERED (i, save_mode))
> > +-	    save_mode =3D choose_hard_reg_mode (i, 1, true);
> > +-	  if (dnum =3D=3D DWARF_FRAME_RETURN_COLUMN)
> > +-	    {
> > +-	      if (save_mode =3D=3D VOIDmode)
> > +-		continue;
> > +-	      wrote_return_column =3D true;
> > +-	    }
> > +-	  size =3D GET_MODE_SIZE (save_mode);
> > +-	  if (offset < 0)
> > +-	    continue;
> > ++      if (init_state.processed_regno[i])
> > ++        continue;
> > +
> > +-	  emit_move_insn (adjust_address (mem, mode, offset),
> > +-			  gen_int_mode (size, mode));
> > ++      save_mode =3D reg_raw_mode[i];
> > ++      if (HARD_REGNO_CALL_PART_CLOBBERED (i, save_mode))
> > ++        save_mode =3D choose_hard_reg_mode (i, 1, true);
> > ++
> > ++      span =3D targetm.dwarf_register_span (gen_rtx_REG (save_mode, i=
));
> > ++      if (!span)
> > ++        init_one_dwarf_reg_size (i, save_mode, mem, mode, &init_state=
);
> > ++      else
> > ++        {
> > ++           for (int si =3D 0; si < XVECLEN (span, 0); si++)
> > ++	    {
> > ++               rtx reg =3D XVECEXP (span, 0, si);
> > ++               init_one_dwarf_reg_size
> > ++                 (REGNO (reg), GET_MODE (reg), mem, mode, &init_state=
);
> > ++            }
> > + 	}
> > +     }
> > +
> > +-  if (!wrote_return_column)
> > ++  if (!init_state.wrote_return_column)
> > +     init_return_column_size (mode, mem, DWARF_FRAME_RETURN_COLUMN);
> > +
> > + #ifdef DWARF_ALT_FRAME_RETURN_COLUMN diff --git
> > +a/libgcc/unwind-dw2.c b/libgcc/unwind-dw2.c index 55fc4bc..37f0ae2
> > +100644
> > +--- a/libgcc/unwind-dw2.c
> > ++++ b/libgcc/unwind-dw2.c
> > +@@ -55,10 +55,6 @@
> > + #define PRE_GCC3_DWARF_FRAME_REGISTERS DWARF_FRAME_REGISTERS  #endif
> > +
> > +-#ifndef DWARF_REG_TO_UNWIND_COLUMN
> > +-#define DWARF_REG_TO_UNWIND_COLUMN(REGNO) (REGNO) -#endif
> > +-
> > + /* ??? For the public function interfaces, we tend to gcc_assert that=
 the
> > +    column numbers are in range.  For the dwarf2 unwind info this does=
 happen,
> > +    although so far in a case that doesn't actually matter.
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

