Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id E24BE60601
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 09:07:19 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id x12so17989761wgg.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 01:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hF+10Kt/TIIEDWF0hR44l3ILjspWNgkGgQxudYlaqzs=;
	b=YFH09ZX0uo/MCpyN/70Uw/dtd8ilnXF/k4Bci6ONrXtFAfsJA8WYI9vULaTHQkQQ8o
	s5xeH04PCR5uPYMCULocON7lJskrDIunt0uSLUdKPKzLPSR3QpTM6WmBo418kXIU1T71
	M2+1mgdiQJLF+Hbjakz+2WLJn2MA+pa5PZNwa7/c/mYO4AbIoRBdphSQyikrm9HVVf7I
	xzTQEP9r/GwaUUB6q+Omsa6iAs2QBMSSz8R+Mu5nhIdvoZKV1KQ3lF3PQEG1rkflmdOy
	kBPFJLa5u2w2k6MU0Oo65PmiatzQxAEuHTz4UI9kJtnNT/gliTboIKO5eMSGJffa1PFy
	/7BQ==
MIME-Version: 1.0
X-Received: by 10.194.243.1 with SMTP id wu1mr55493231wjc.69.1421053639136;
	Mon, 12 Jan 2015 01:07:19 -0800 (PST)
Received: by 10.194.7.170 with HTTP; Mon, 12 Jan 2015 01:07:19 -0800 (PST)
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FDAE4EFF@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1421032337-50265-1-git-send-email-leimaohui@cn.fujitsu.com>
	<54B348C7.4040101@gmail.com>
	<1B56A49860EB2D45ADE3731B15C959FDAE4EFF@G08CNEXMBPEKD01.g08.fujitsu.local>
Date: Mon, 12 Jan 2015 10:07:19 +0100
Message-ID: <CA+chaQcYhZmxaceUAn0Ej3E829piPyG4-xnEHBF+Frw_ru3T3A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 12 Jan 2015 09:07:20 -0000
Content-Type: multipart/alternative; boundary=089e013d1d525e1db6050c70d586

--089e013d1d525e1db6050c70d586
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Why did you revert default sysroot poisoning?

On Mon, Jan 12, 2015 at 5:18 AM, Lei, Maohui <leimaohui@cn.fujitsu.com>
wrote:

> Hi Armin
>
> > I think all the two patches need an "Upstream-Status:" statement.
> >
>
> OK. I will modify my patch and submit it again.
>
>
> Cheers
>
> Lei Maohui
>
>
>
> > -----Original Message-----
> > From: akuster808 [mailto:akuster808@gmail.com]
> > Sent: Monday, January 12, 2015 12:09 PM
> > To: Lei, Maohui/=E9=9B=B7 =E8=8C=82=E6=85=A7; openembedded-core@lists.o=
penembedded.org
> > Subject: Re: [OE-core] [PATCH] gcc: upgrade to 4.9.2 and fix the bug
> #6824
> >
> > Lei,
> >
> > I think all the two patches need an "Upstream-Status:" statement.
> >
> > - Armin
> >
> > On 01/11/2015 07:12 PM, Lei Maohui wrote:
> > > fix the yocto bug #6824
> > > backport from gcc
> > >
> > > Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> > > ---
> > >   meta/recipes-devtools/gcc/gcc-4.9.inc              |  12 +-
> > >   ...e500-double-in-SPE_SIMD_REGNO_P-registers.patch |  13 ++
> > >   .../0061-Fix-for-unwinder-aborts-on-e500.patch     | 161
> > +++++++++++++++++++++
> > >   3 files changed, 180 insertions(+), 6 deletions(-)
> > >   create mode 100644
> >
> meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-double-in-SPE_SIMD=
_
> > REGNO_P-registers.patch
> > >   create mode 100644
> > > meta/recipes-devtools/gcc/gcc-4.9/0061-Fix-for-unwinder-aborts-on-e50=
0
> > > .patch
> > >
> > > diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc
> > > b/meta/recipes-devtools/gcc/gcc-4.9.inc
> > > index 2568e99..c4ec40d 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> > > @@ -2,11 +2,11 @@ require gcc-common.inc
> > >
> > >   # Third digit in PV should be incremented after a minor release
> > >
> > > -PV =3D "4.9.1"
> > > +PV =3D "4.9.2"
> > >
> > >   # BINV should be incremented to a revision after a minor gcc releas=
e
> > >
> > > -BINV =3D "4.9.1"
> > > +BINV =3D "4.9.2"
> > >
> > >   FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc-4.9:"
> > >
> > > @@ -69,11 +69,11 @@ SRC_URI =3D "\
> > >       file://0051-eabispe.patch \
> > >
> > file://0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch =
\
> > >       file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch=
 \
> > > -    file://0055-PR-rtl-optimization-61801.patch \
> > >       file://0056-top-level-reorder_gcc-bug-61144.patch \
> > > -    file://0057-aarch64-config.patch \
> > >       file://0058-gcc-r212171.patch \
> > >       file://0059-gcc-PR-rtl-optimization-63348.patch \
> > > +
> > file://0060-Only-allow-e500-double-in-SPE_SIMD_REGNO_P-registers.patch =
\
> > > +    file://0061-Fix-for-unwinder-aborts-on-e500.patch \
> > >   "
> > >   SRC_URI[md5sum] =3D "fddf71348546af523353bd43d34919c1"
> > >   SRC_URI[sha256sum] =3D
> > "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
> > > @@ -125,8 +125,8 @@ EXTRA_OECONF_INTERMEDIATE =3D "\
> > >   EXTRA_OECONF_append_libc-uclibc =3D " --disable-decimal-float "
> > >
> > >   EXTRA_OECONF_PATHS =3D "\
> > > -    --with-gxx-include-dir=3D/not/exist{target_includedir}/c++/${BIN=
V} \
> > > -    --with-sysroot=3D/not/exist \
> > > +
> >
> --with-gxx-include-dir=3D${STAGING_DIR_TARGET}${target_includedir}/c++/${=
BIN
> > V} \
> > > +    --with-sysroot=3D${STAGING_DIR_TARGET} \
> > >       --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> > >   "
> > >
> > > diff --git
> > > a/meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-double-in-SP=
E
> > > _SIMD_REGNO_P-registers.patch
> > > b/meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-double-in-SP=
E
> > > _SIMD_REGNO_P-registers.patch
> > > new file mode 100644
> > > index 0000000..810ff90
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-double-i=
n
> > > +++ -SPE_SIMD_REGNO_P-registers.patch
> > > @@ -0,0 +1,13 @@
> > > +diff --git a/gcc/config/rs6000/rs6000.c b/gcc/config/rs6000/rs6000.c
> > > +index 512e7d6..292fb2c 100644
> > > +--- a/gcc/config/rs6000/rs6000.c
> > > ++++ b/gcc/config/rs6000/rs6000.c
> > > +@@ -1704,7 +1704,7 @@ rs6000_hard_regno_nregs_internal (int regno,
> enum
> > machine_mode mode)
> > > +      SCmode so as to pass the value correctly in a pair of
> > > +      registers.  */
> > > +   else if (TARGET_E500_DOUBLE && FLOAT_MODE_P (mode) && mode !=3D
> SCmode
> > > +-     && !DECIMAL_FLOAT_MODE_P (mode))
> > > ++           && !DECIMAL_FLOAT_MODE_P (mode) && SPE_SIMD_REGNO_P
> > > ++ (regno))
> > > +     reg_size =3D UNITS_PER_FP_WORD;
> > > +
> > > +   else
> > > diff --git
> > > a/meta/recipes-devtools/gcc/gcc-4.9/0061-Fix-for-unwinder-aborts-on-e=
5
> > > 00.patch
> > > b/meta/recipes-devtools/gcc/gcc-4.9/0061-Fix-for-unwinder-aborts-on-e=
5
> > > 00.patch
> > > new file mode 100644
> > > index 0000000..c37a4c3
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/gcc/gcc-4.9/0061-Fix-for-unwinder-aborts-=
o
> > > +++ n-e500.patch
> > > @@ -0,0 +1,161 @@
> > > +diff --git a/gcc/defaults.h b/gcc/defaults.h index f94ae17..80a798f
> > > +100644
> > > +--- a/gcc/defaults.h
> > > ++++ b/gcc/defaults.h
> > > +@@ -438,6 +438,11 @@ see the files COPYING3 and COPYING.RUNTIME
> > > +respectively.  If not, see  #define DWARF_FRAME_REGNUM(REG)
> > > +DBX_REGISTER_NUMBER (REG)  #endif
> > > +
> > > ++/* The mapping from dwarf CFA reg number to internal dwarf reg
> > > ++numbers.  */ #ifndef DWARF_REG_TO_UNWIND_COLUMN #define
> > > ++DWARF_REG_TO_UNWIND_COLUMN(REGNO) (REGNO) #endif
> > > ++
> > > + /* Map register numbers held in the call frame info that gcc has
> > > +    collected using DWARF_FRAME_REGNUM to those that should be outpu=
t
> in
> > > +    .debug_frame and .eh_frame.  */
> > > +diff --git a/gcc/dwarf2cfi.c b/gcc/dwarf2cfi.c index abcdeb3..4e59df=
e
> > > +100644
> > > +--- a/gcc/dwarf2cfi.c
> > > ++++ b/gcc/dwarf2cfi.c
> > > +@@ -252,7 +252,60 @@ init_return_column_size (enum machine_mode mode=
,
> rtx
> > mem, unsigned int c)
> > > +             gen_int_mode (size, mode));
> > > + }
> > > +
> > > +-/* Generate code to initialize the register size table.  */
> > > ++/* Datastructure used by expand_builtin_init_dwarf_reg_sizes and
> > > ++   init_one_dwarf_reg_size to communicate on what has been done by
> the
> > > ++   latter.  */
> > > ++
> > > ++typedef struct
> > > ++{
> > > ++  /* Whether the dwarf return column was initialized.  */
> > > ++  bool wrote_return_column;
> > > ++
> > > ++  /* For each hard register REGNO, whether init_one_dwarf_reg_size
> > > ++     was given REGNO to process already.  */  bool processed_regno
> > > ++ [FIRST_PSEUDO_REGISTER];
> > > ++
> > > ++} init_one_dwarf_reg_state;
> > > ++
> > > ++/* Helper for expand_builtin_init_dwarf_reg_sizes.  Generate code t=
o
> > > ++   initialize the dwarf register size table entry corresponding to
> register
> > > ++   REGNO in REGMODE.  TABLE is the table base address, SLOTMODE is
> the mode
> > to
> > > ++   use for the size entry to initialize, and INIT_STATE is the
> communication
> > > ++   datastructure conveying what we're doing to our caller.  */
> > > ++
> > > ++static
> > > ++void init_one_dwarf_reg_size (int regno, machine_mode regmode,
> > > ++                             rtx table, machine_mode slotmode,
> > > ++                             init_one_dwarf_reg_state *init_state) =
{
> > > ++  const unsigned int dnum =3D DWARF_FRAME_REGNUM (regno);
> > > ++  const unsigned int rnum =3D DWARF2_FRAME_REG_OUT (dnum, 1);
> > > ++  const unsigned int dcol =3D DWARF_REG_TO_UNWIND_COLUMN (rnum);
> > > ++
> > > ++  const HOST_WIDE_INT slotoffset =3D dcol * GET_MODE_SIZE (slotmode=
);
> > > ++ const HOST_WIDE_INT regsize =3D GET_MODE_SIZE (regmode);
> > > ++
> > > ++  init_state->processed_regno[regno] =3D true;
> > > ++
> > > ++  if (rnum >=3D DWARF_FRAME_REGISTERS)
> > > ++    return;
> > > ++
> > > ++  if (dnum =3D=3D DWARF_FRAME_RETURN_COLUMN)
> > > ++    {
> > > ++      if (regmode =3D=3D VOIDmode)
> > > ++       return;
> > > ++      init_state->wrote_return_column =3D true;
> > > ++    }
> > > ++
> > > ++  if (slotoffset < 0)
> > > ++    return;
> > > ++
> > > ++  emit_move_insn (adjust_address (table, slotmode, slotoffset),
> > > ++                 gen_int_mode (regsize, slotmode)); }
> > > ++
> > > ++/* Generate code to initialize the dwarf register size table locate=
d
> > > ++   at the provided ADDRESS.  */
> > > +
> > > + void
> > > + expand_builtin_init_dwarf_reg_sizes (tree address) @@ -261,37
> > > ++314,41 @@ expand_builtin_init_dwarf_reg_sizes (tree address)
> > > +   enum machine_mode mode =3D TYPE_MODE (char_type_node);
> > > +   rtx addr =3D expand_normal (address);
> > > +   rtx mem =3D gen_rtx_MEM (BLKmode, addr);
> > > +-  bool wrote_return_column =3D false;
> > > ++
> > > ++  init_one_dwarf_reg_state init_state;  memset ((char *)&init_state=
,
> > > ++ 0, sizeof (init_state));
> > > +
> > > +   for (i =3D 0; i < FIRST_PSEUDO_REGISTER; i++)
> > > +     {
> > > +-      unsigned int dnum =3D DWARF_FRAME_REGNUM (i);
> > > +-      unsigned int rnum =3D DWARF2_FRAME_REG_OUT (dnum, 1);
> > > ++      machine_mode save_mode;
> > > ++      rtx span;
> > > +
> > > +-      if (rnum < DWARF_FRAME_REGISTERS)
> > > +-  {
> > > +-    HOST_WIDE_INT offset =3D rnum * GET_MODE_SIZE (mode);
> > > +-    enum machine_mode save_mode =3D reg_raw_mode[i];
> > > +-    HOST_WIDE_INT size;
> > > ++      /* No point in processing a register multiple times.  This
> could
> > happen
> > > ++         with register spans, e.g. when a reg is first processed as
> a piece
> > of
> > > ++         a span, then as a register on its own later on.  */
> > > +
> > > +-    if (HARD_REGNO_CALL_PART_CLOBBERED (i, save_mode))
> > > +-      save_mode =3D choose_hard_reg_mode (i, 1, true);
> > > +-    if (dnum =3D=3D DWARF_FRAME_RETURN_COLUMN)
> > > +-      {
> > > +-        if (save_mode =3D=3D VOIDmode)
> > > +-          continue;
> > > +-        wrote_return_column =3D true;
> > > +-      }
> > > +-    size =3D GET_MODE_SIZE (save_mode);
> > > +-    if (offset < 0)
> > > +-      continue;
> > > ++      if (init_state.processed_regno[i])
> > > ++        continue;
> > > +
> > > +-    emit_move_insn (adjust_address (mem, mode, offset),
> > > +-                    gen_int_mode (size, mode));
> > > ++      save_mode =3D reg_raw_mode[i];
> > > ++      if (HARD_REGNO_CALL_PART_CLOBBERED (i, save_mode))
> > > ++        save_mode =3D choose_hard_reg_mode (i, 1, true);
> > > ++
> > > ++      span =3D targetm.dwarf_register_span (gen_rtx_REG (save_mode,
> i));
> > > ++      if (!span)
> > > ++        init_one_dwarf_reg_size (i, save_mode, mem, mode,
> &init_state);
> > > ++      else
> > > ++        {
> > > ++           for (int si =3D 0; si < XVECLEN (span, 0); si++)
> > > ++      {
> > > ++               rtx reg =3D XVECEXP (span, 0, si);
> > > ++               init_one_dwarf_reg_size
> > > ++                 (REGNO (reg), GET_MODE (reg), mem, mode,
> &init_state);
> > > ++            }
> > > +   }
> > > +     }
> > > +
> > > +-  if (!wrote_return_column)
> > > ++  if (!init_state.wrote_return_column)
> > > +     init_return_column_size (mode, mem, DWARF_FRAME_RETURN_COLUMN);
> > > +
> > > + #ifdef DWARF_ALT_FRAME_RETURN_COLUMN diff --git
> > > +a/libgcc/unwind-dw2.c b/libgcc/unwind-dw2.c index 55fc4bc..37f0ae2
> > > +100644
> > > +--- a/libgcc/unwind-dw2.c
> > > ++++ b/libgcc/unwind-dw2.c
> > > +@@ -55,10 +55,6 @@
> > > + #define PRE_GCC3_DWARF_FRAME_REGISTERS DWARF_FRAME_REGISTERS  #endi=
f
> > > +
> > > +-#ifndef DWARF_REG_TO_UNWIND_COLUMN
> > > +-#define DWARF_REG_TO_UNWIND_COLUMN(REGNO) (REGNO) -#endif
> > > +-
> > > + /* ??? For the public function interfaces, we tend to gcc_assert
> that the
> > > +    column numbers are in range.  For the dwarf2 unwind info this
> does happen,
> > > +    although so far in a case that doesn't actually matter.
> > >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e013d1d525e1db6050c70d586
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why did you revert default sysroot poisoning?</div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Jan 12, 2015 at =
5:18 AM, Lei, Maohui <span dir=3D"ltr">&lt;<a href=3D"mailto:leimaohui@cn.f=
ujitsu.com" target=3D"_blank">leimaohui@cn.fujitsu.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Hi Armin<br>
<span class=3D""><br>
&gt; I think all the two patches need an &quot;Upstream-Status:&quot; state=
ment.<br>
&gt;<br>
<br>
</span>OK. I will modify my patch and submit it again.<br>
<br>
<br>
Cheers<br>
<br>
Lei Maohui<br>
<div><div class=3D"h5"><br>
<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: akuster808 [mailto:<a href=3D"mailto:akuster808@gmail.com">akust=
er808@gmail.com</a>]<br>
&gt; Sent: Monday, January 12, 2015 12:09 PM<br>
&gt; To: Lei, Maohui/=E9=9B=B7 =E8=8C=82=E6=85=A7; <a href=3D"mailto:openem=
bedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.or=
g</a><br>
&gt; Subject: Re: [OE-core] [PATCH] gcc: upgrade to 4.9.2 and fix the bug #=
6824<br>
&gt;<br>
&gt; Lei,<br>
&gt;<br>
&gt; I think all the two patches need an &quot;Upstream-Status:&quot; state=
ment.<br>
&gt;<br>
&gt; - Armin<br>
&gt;<br>
&gt; On 01/11/2015 07:12 PM, Lei Maohui wrote:<br>
&gt; &gt; fix the yocto bug #6824<br>
&gt; &gt; backport from gcc<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@cn.fuji=
tsu.com">leimaohui@cn.fujitsu.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0meta/recipes-devtools/gcc/gcc-4.9.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +-<br>
&gt; &gt;=C2=A0 =C2=A0...e500-double-in-SPE_SIMD_REGNO_P-registers.patch |=
=C2=A0 13 ++<br>
&gt; &gt;=C2=A0 =C2=A0.../0061-Fix-for-unwinder-aborts-on-e500.patch=C2=A0 =
=C2=A0 =C2=A0| 161<br>
&gt; +++++++++++++++++++++<br>
&gt; &gt;=C2=A0 =C2=A03 files changed, 180 insertions(+), 6 deletions(-)<br=
>
&gt; &gt;=C2=A0 =C2=A0create mode 100644<br>
&gt; meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-double-in-SPE_S=
IMD_<br>
&gt; REGNO_P-registers.patch<br>
&gt; &gt;=C2=A0 =C2=A0create mode 100644<br>
&gt; &gt; meta/recipes-devtools/gcc/gcc-4.9/0061-Fix-for-unwinder-aborts-on=
-e500<br>
&gt; &gt; .patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc<br>
&gt; &gt; b/meta/recipes-devtools/gcc/gcc-4.9.inc<br>
&gt; &gt; index 2568e99..c4ec40d 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/gcc/gcc-4.9.inc<br>
&gt; &gt; +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc<br>
&gt; &gt; @@ -2,11 +2,11 @@ require gcc-common.inc<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0# Third digit in PV should be incremented after a min=
or release<br>
&gt; &gt;<br>
&gt; &gt; -PV =3D &quot;4.9.1&quot;<br>
&gt; &gt; +PV =3D &quot;4.9.2&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0# BINV should be incremented to a revision after a mi=
nor gcc release<br>
&gt; &gt;<br>
&gt; &gt; -BINV =3D &quot;4.9.1&quot;<br>
&gt; &gt; +BINV =3D &quot;4.9.2&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc-4.9:&q=
uot;<br>
&gt; &gt;<br>
&gt; &gt; @@ -69,11 +69,11 @@ SRC_URI =3D &quot;\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0051-eabispe.patch \<br>
&gt; &gt;<br>
&gt; file://0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch=
 \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0054-gcc-Makefile.in-fix-paralle=
l-building-failure.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 file://0055-PR-rtl-optimization-61801.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0056-top-level-reorder_gcc-bug-6=
1144.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 file://0057-aarch64-config.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0058-gcc-r212171.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0059-gcc-PR-rtl-optimization-633=
48.patch \<br>
&gt; &gt; +<br>
&gt; file://0060-Only-allow-e500-double-in-SPE_SIMD_REGNO_P-registers.patch=
 \<br>
&gt; &gt; +=C2=A0 =C2=A0 file://0061-Fix-for-unwinder-aborts-on-e500.patch =
\<br>
&gt; &gt;=C2=A0 =C2=A0&quot;<br>
&gt; &gt;=C2=A0 =C2=A0SRC_URI[md5sum] =3D &quot;fddf71348546af523353bd43d34=
919c1&quot;<br>
&gt; &gt;=C2=A0 =C2=A0SRC_URI[sha256sum] =3D<br>
&gt; &quot;d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e=
&quot;<br>
&gt; &gt; @@ -125,8 +125,8 @@ EXTRA_OECONF_INTERMEDIATE =3D &quot;\<br>
&gt; &gt;=C2=A0 =C2=A0EXTRA_OECONF_append_libc-uclibc =3D &quot; --disable-=
decimal-float &quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0EXTRA_OECONF_PATHS =3D &quot;\<br>
&gt; &gt; -=C2=A0 =C2=A0 --with-gxx-include-dir=3D/not/exist{target_include=
dir}/c++/${BINV} \<br>
&gt; &gt; -=C2=A0 =C2=A0 --with-sysroot=3D/not/exist \<br>
&gt; &gt; +<br>
&gt; --with-gxx-include-dir=3D${STAGING_DIR_TARGET}${target_includedir}/c++=
/${BIN<br>
&gt; V} \<br>
&gt; &gt; +=C2=A0 =C2=A0 --with-sysroot=3D${STAGING_DIR_TARGET} \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--with-build-sysroot=3D${STAGING_DIR_TA=
RGET} \<br>
&gt; &gt;=C2=A0 =C2=A0&quot;<br>
&gt; &gt;<br>
&gt; &gt; diff --git<br>
&gt; &gt; a/meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-double-i=
n-SPE<br>
&gt; &gt; _SIMD_REGNO_P-registers.patch<br>
&gt; &gt; b/meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-double-i=
n-SPE<br>
&gt; &gt; _SIMD_REGNO_P-registers.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..810ff90<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-doub=
le-in<br>
</div></div>&gt; &gt; +++ -SPE_SIMD_REGNO_P-registers.patch<br>
<span class=3D"">&gt; &gt; @@ -0,0 +1,13 @@<br>
&gt; &gt; +diff --git a/gcc/config/rs6000/rs6000.c b/gcc/config/rs6000/rs60=
00.c<br>
&gt; &gt; +index 512e7d6..292fb2c 100644<br>
&gt; &gt; +--- a/gcc/config/rs6000/rs6000.c<br>
&gt; &gt; ++++ b/gcc/config/rs6000/rs6000.c<br>
&gt; &gt; +@@ -1704,7 +1704,7 @@ rs6000_hard_regno_nregs_internal (int regn=
o, enum<br>
&gt; machine_mode mode)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 SCmode so as to pass the value correctly in=
 a pair of<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 registers.=C2=A0 */<br>
&gt; &gt; +=C2=A0 =C2=A0else if (TARGET_E500_DOUBLE &amp;&amp; FLOAT_MODE_P=
 (mode) &amp;&amp; mode !=3D SCmode<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0&amp;&amp; !DECIMAL_FLOAT_MODE_P (mode))<br=
>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; !DECIMAL_FL=
OAT_MODE_P (mode) &amp;&amp; SPE_SIMD_REGNO_P<br>
</span>&gt; &gt; ++ (regno))<br>
<span class=3D"">&gt; &gt; +=C2=A0 =C2=A0 =C2=A0reg_size =3D UNITS_PER_FP_W=
ORD;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0else<br>
&gt; &gt; diff --git<br>
&gt; &gt; a/meta/recipes-devtools/gcc/gcc-4.9/0061-Fix-for-unwinder-aborts-=
on-e5<br>
&gt; &gt; 00.patch<br>
&gt; &gt; b/meta/recipes-devtools/gcc/gcc-4.9/0061-Fix-for-unwinder-aborts-=
on-e5<br>
&gt; &gt; 00.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..c37a4c3<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-devtools/gcc/gcc-4.9/0061-Fix-for-unwinder-abo=
rts-o<br>
</span>&gt; &gt; +++ n-e500.patch<br>
&gt; &gt; @@ -0,0 +1,161 @@<br>
&gt; &gt; +diff --git a/gcc/defaults.h b/gcc/defaults.h index f94ae17..80a7=
98f<br>
&gt; &gt; +100644<br>
<span class=3D"">&gt; &gt; +--- a/gcc/defaults.h<br>
&gt; &gt; ++++ b/gcc/defaults.h<br>
&gt; &gt; +@@ -438,6 +438,11 @@ see the files COPYING3 and COPYING.RUNTIME<=
br>
</span>&gt; &gt; +respectively.=C2=A0 If not, see=C2=A0 #define DWARF_FRAME=
_REGNUM(REG)<br>
&gt; &gt; +DBX_REGISTER_NUMBER (REG)=C2=A0 #endif<br>
<span class=3D"">&gt; &gt; +<br>
&gt; &gt; ++/* The mapping from dwarf CFA reg number to internal dwarf reg<=
br>
</span>&gt; &gt; ++numbers.=C2=A0 */ #ifndef DWARF_REG_TO_UNWIND_COLUMN #de=
fine<br>
&gt; &gt; ++DWARF_REG_TO_UNWIND_COLUMN(REGNO) (REGNO) #endif<br>
<span class=3D"">&gt; &gt; ++<br>
&gt; &gt; + /* Map register numbers held in the call frame info that gcc ha=
s<br>
&gt; &gt; +=C2=A0 =C2=A0 collected using DWARF_FRAME_REGNUM to those that s=
hould be output in<br>
&gt; &gt; +=C2=A0 =C2=A0 .debug_frame and .eh_frame.=C2=A0 */<br>
</span>&gt; &gt; +diff --git a/gcc/dwarf2cfi.c b/gcc/dwarf2cfi.c index abcd=
eb3..4e59dfe<br>
&gt; &gt; +100644<br>
<span class=3D"">&gt; &gt; +--- a/gcc/dwarf2cfi.c<br>
&gt; &gt; ++++ b/gcc/dwarf2cfi.c<br>
&gt; &gt; +@@ -252,7 +252,60 @@ init_return_column_size (enum machine_mode =
mode, rtx<br>
&gt; mem, unsigned int c)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_int_mode (si=
ze, mode));<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; +-/* Generate code to initialize the register size table.=C2=A0 *=
/<br>
&gt; &gt; ++/* Datastructure used by expand_builtin_init_dwarf_reg_sizes an=
d<br>
&gt; &gt; ++=C2=A0 =C2=A0init_one_dwarf_reg_size to communicate on what has=
 been done by the<br>
&gt; &gt; ++=C2=A0 =C2=A0latter.=C2=A0 */<br>
&gt; &gt; ++<br>
&gt; &gt; ++typedef struct<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 /* Whether the dwarf return column was initialized.=C2=
=A0 */<br>
&gt; &gt; ++=C2=A0 bool wrote_return_column;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* For each hard register REGNO, whether init_one_dwarf_=
reg_size<br>
</span>&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0was given REGNO to process already.=
=C2=A0 */=C2=A0 bool processed_regno<br>
&gt; &gt; ++ [FIRST_PSEUDO_REGISTER];<br>
<span class=3D"">&gt; &gt; ++<br>
&gt; &gt; ++} init_one_dwarf_reg_state;<br>
&gt; &gt; ++<br>
&gt; &gt; ++/* Helper for expand_builtin_init_dwarf_reg_sizes.=C2=A0 Genera=
te code to<br>
&gt; &gt; ++=C2=A0 =C2=A0initialize the dwarf register size table entry cor=
responding to register<br>
&gt; &gt; ++=C2=A0 =C2=A0REGNO in REGMODE.=C2=A0 TABLE is the table base ad=
dress, SLOTMODE is the mode<br>
&gt; to<br>
&gt; &gt; ++=C2=A0 =C2=A0use for the size entry to initialize, and INIT_STA=
TE is the communication<br>
&gt; &gt; ++=C2=A0 =C2=A0datastructure conveying what we&#39;re doing to ou=
r caller.=C2=A0 */<br>
&gt; &gt; ++<br>
&gt; &gt; ++static<br>
&gt; &gt; ++void init_one_dwarf_reg_size (int regno, machine_mode regmode,<=
br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtx table, machine_mode slotmode,<=
br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0init_one_dwarf_reg_state *init_sta=
te) {<br>
</span>&gt; &gt; ++=C2=A0 const unsigned int dnum =3D DWARF_FRAME_REGNUM (r=
egno);<br>
<span class=3D"">&gt; &gt; ++=C2=A0 const unsigned int rnum =3D DWARF2_FRAM=
E_REG_OUT (dnum, 1);<br>
&gt; &gt; ++=C2=A0 const unsigned int dcol =3D DWARF_REG_TO_UNWIND_COLUMN (=
rnum);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 const HOST_WIDE_INT slotoffset =3D dcol * GET_MODE_SIZE =
(slotmode);<br>
&gt; &gt; ++ const HOST_WIDE_INT regsize =3D GET_MODE_SIZE (regmode);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 init_state-&gt;processed_regno[regno] =3D true;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (rnum &gt;=3D DWARF_FRAME_REGISTERS)<br>
&gt; &gt; ++=C2=A0 =C2=A0 return;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (dnum =3D=3D DWARF_FRAME_RETURN_COLUMN)<br>
&gt; &gt; ++=C2=A0 =C2=A0 {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 if (regmode =3D=3D VOIDmode)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 init_state-&gt;wrote_return_column =3D tru=
e;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (slotoffset &lt; 0)<br>
&gt; &gt; ++=C2=A0 =C2=A0 return;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 emit_move_insn (adjust_address (table, slotmode, slotoff=
set),<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g=
en_int_mode (regsize, slotmode)); }<br>
&gt; &gt; ++<br>
</span><span class=3D"">&gt; &gt; ++/* Generate code to initialize the dwar=
f register size table located<br>
&gt; &gt; ++=C2=A0 =C2=A0at the provided ADDRESS.=C2=A0 */<br>
&gt; &gt; +<br>
&gt; &gt; + void<br>
</span>&gt; &gt; + expand_builtin_init_dwarf_reg_sizes (tree address) @@ -2=
61,37<br>
&gt; &gt; ++314,41 @@ expand_builtin_init_dwarf_reg_sizes (tree address)<br=
>
<span class=3D"">&gt; &gt; +=C2=A0 =C2=A0enum machine_mode mode =3D TYPE_MO=
DE (char_type_node);<br>
&gt; &gt; +=C2=A0 =C2=A0rtx addr =3D expand_normal (address);<br>
&gt; &gt; +=C2=A0 =C2=A0rtx mem =3D gen_rtx_MEM (BLKmode, addr);<br>
&gt; &gt; +-=C2=A0 bool wrote_return_column =3D false;<br>
&gt; &gt; ++<br>
</span>&gt; &gt; ++=C2=A0 init_one_dwarf_reg_state init_state;=C2=A0 memset=
 ((char *)&amp;init_state,<br>
&gt; &gt; ++ 0, sizeof (init_state));<br>
<div><div class=3D"h5">&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0for (i =3D 0; i &lt; FIRST_PSEUDO_REGISTER; i++)<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 unsigned int dnum =3D DWARF_FRAME_REGNUM (=
i);<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 unsigned int rnum =3D DWARF2_FRAME_REG_OUT=
 (dnum, 1);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 machine_mode save_mode;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 rtx span;<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 if (rnum &lt; DWARF_FRAME_REGISTERS)<br>
&gt; &gt; +-=C2=A0 {<br>
&gt; &gt; +-=C2=A0 =C2=A0 HOST_WIDE_INT offset =3D rnum * GET_MODE_SIZE (mo=
de);<br>
&gt; &gt; +-=C2=A0 =C2=A0 enum machine_mode save_mode =3D reg_raw_mode[i];<=
br>
&gt; &gt; +-=C2=A0 =C2=A0 HOST_WIDE_INT size;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 /* No point in processing a register multi=
ple times.=C2=A0 This could<br>
&gt; happen<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with register spans, e.g. whe=
n a reg is first processed as a piece<br>
&gt; of<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a span, then as a register on=
 its own later on.=C2=A0 */<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 if (HARD_REGNO_CALL_PART_CLOBBERED (i, save_mode)=
)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 save_mode =3D choose_hard_reg_mode (i, 1, =
true);<br>
&gt; &gt; +-=C2=A0 =C2=A0 if (dnum =3D=3D DWARF_FRAME_RETURN_COLUMN)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (save_mode =3D=3D VOIDmode)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 wrote_return_column =3D true;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +-=C2=A0 =C2=A0 size =3D GET_MODE_SIZE (save_mode);<br>
&gt; &gt; +-=C2=A0 =C2=A0 if (offset &lt; 0)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 if (init_state.processed_regno[i])<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 emit_move_insn (adjust_address (mem, mode, offset=
),<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 gen_int_mode (size, mode));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 save_mode =3D reg_raw_mode[i];<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 if (HARD_REGNO_CALL_PART_CLOBBERED (i, sav=
e_mode))<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 save_mode =3D choose_hard_reg_mode =
(i, 1, true);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 span =3D targetm.dwarf_register_span (gen_=
rtx_REG (save_mode, i));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 if (!span)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 init_one_dwarf_reg_size (i, save_mo=
de, mem, mode, &amp;init_state);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (int si =3D 0; si =
&lt; XVECLEN (span, 0); si++)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtx reg =
=3D XVECEXP (span, 0, si);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0init_one=
_dwarf_reg_size<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
REGNO (reg), GET_MODE (reg), mem, mode, &amp;init_state);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 if (!wrote_return_column)<br>
&gt; &gt; ++=C2=A0 if (!init_state.wrote_return_column)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0init_return_column_size (mode, mem, DWARF_FR=
AME_RETURN_COLUMN);<br>
&gt; &gt; +<br>
</div></div>&gt; &gt; + #ifdef DWARF_ALT_FRAME_RETURN_COLUMN diff --git<br>
&gt; &gt; +a/libgcc/unwind-dw2.c b/libgcc/unwind-dw2.c index 55fc4bc..37f0a=
e2<br>
&gt; &gt; +100644<br>
<span class=3D"">&gt; &gt; +--- a/libgcc/unwind-dw2.c<br>
&gt; &gt; ++++ b/libgcc/unwind-dw2.c<br>
&gt; &gt; +@@ -55,10 +55,6 @@<br>
</span>&gt; &gt; + #define PRE_GCC3_DWARF_FRAME_REGISTERS DWARF_FRAME_REGIS=
TERS=C2=A0 #endif<br>
&gt; &gt; +<br>
&gt; &gt; +-#ifndef DWARF_REG_TO_UNWIND_COLUMN<br>
&gt; &gt; +-#define DWARF_REG_TO_UNWIND_COLUMN(REGNO) (REGNO) -#endif<br>
<div class=3D"HOEnZb"><div class=3D"h5">&gt; &gt; +-<br>
&gt; &gt; + /* ??? For the public function interfaces, we tend to gcc_asser=
t that the<br>
&gt; &gt; +=C2=A0 =C2=A0 column numbers are in range.=C2=A0 For the dwarf2 =
unwind info this does happen,<br>
&gt; &gt; +=C2=A0 =C2=A0 although so far in a case that doesn&#39;t actuall=
y matter.<br>
&gt; &gt;<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</div></div></blockquote></div><br></div>

--089e013d1d525e1db6050c70d586--
