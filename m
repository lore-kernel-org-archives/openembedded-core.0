Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QtSix-0006RQ-Uj
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 01:07:09 +0200
Received: by vwe42 with SMTP id 42so219278vwe.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 16:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=T2oTzF19r0Dd8ZxMYTlo3xPzddIk/1I7KkkMKpN7kMA=;
	b=MRRXtIyHdrvkbD8l3Y08hqCtKw5ZE3usCuyE/iPo055ui7dFjzIgpzKxbGCAF6KXw0
	Uhd0zUipT5ynniuh9PyudfZnjwPPMeVuYCTvWEjw7f7WEhUnK1Yqqv4uJT/YfjCPM+2S
	flhoV9Q+Cq9NKT1+YTEEprGts2ZjvXmCBogi0=
Received: by 10.52.98.166 with SMTP id ej6mr289477vdb.320.1313535749135; Tue,
	16 Aug 2011 16:02:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.158.133 with HTTP; Tue, 16 Aug 2011 16:01:59 -0700 (PDT)
In-Reply-To: <4E4AE3A6.4030301@linux.intel.com>
References: <1313482064-18951-1-git-send-email-dbaryshkov@gmail.com>
	<4E4AE3A6.4030301@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Aug 2011 16:01:59 -0700
Message-ID: <CAMKF1sqeSUgNCsJUAKAxNpgJhMxrkzqrVDHM0MQ86Ap_=We3pg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH V2] binutils-2.20.1: import several patches from Debian
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
X-List-Received-Date: Tue, 16 Aug 2011 23:07:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2011 at 2:39 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 08/16/2011 01:07 AM, Dmitry Eremin-Solenikov wrote:
>>
>> Import several patches from Debian to improve --no-add-needed handling
>> vs. weak symbols and branching to weak symbols on arm.
>>
>> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
>> ---
>> =C2=A0.../152_arm_branches_to_weak_symbols.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0240
>> ++++++++++++++++++++
>> =C2=A0.../binutils-2.20.1/200_elflink_%B_fixes.patch =C2=A0 =C2=A0 | =C2=
=A0 65 ++++++
>> =C2=A0.../201_elflink_improve_noaddneeded_errors.patch =C2=A0 | =C2=A0 7=
0 ++++++
>> =C2=A0.../202_elflink_noaddneeded_vs_weak.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 87 +++++++
>> =C2=A0.../recipes-devtools/binutils/binutils_2.20.1.bb =C2=A0 | =C2=A0 =
=C2=A06 +-
>> =C2=A05 files changed, 467 insertions(+), 1 deletions(-)
>> =C2=A0create mode 100644
>> meta-oe/recipes-devtools/binutils/binutils-2.20.1/152_arm_branches_to_we=
ak_symbols.patch
>> =C2=A0create mode 100644
>> meta-oe/recipes-devtools/binutils/binutils-2.20.1/200_elflink_%B_fixes.p=
atch
>> =C2=A0create mode 100644
>> meta-oe/recipes-devtools/binutils/binutils-2.20.1/201_elflink_improve_no=
addneeded_errors.patch
>> =C2=A0create mode 100644
>> meta-oe/recipes-devtools/binutils/binutils-2.20.1/202_elflink_noaddneede=
d_vs_weak.patch
>>
> These patches need additional patch headers for OE-Core,

they are for meta-oe not for oe-core however more info on patches is
always an improvement
and helps later maintenance

 I know they already
> contain some info, but please add Signed-off-by and Upstream-Status (if
> appropriate).
>
> http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines
>
> Thanks
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Sau!
>
>
>> diff --git
>> a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/152_arm_branches_to_=
weak_symbols.patch
>> b/meta-oe/recipes-devtools/binutils/binutils-2.20.1/152_arm_branches_to_=
weak_symbols.patch
>> new file mode 100644
>> index 0000000..48523f8
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-devtools/binutils/binutils-2.20.1/152_arm_branches_to_=
weak_symbols.patch
>> @@ -0,0 +1,240 @@
>> +#!/bin/sh -e
>> +## 152_arm_branches_to_weak_symbols.dpatch
>> +##
>> +## DP: Description:
>> http://sourceware.org/ml/binutils/2010-04/msg00446.html
>> +## DP: Description: taken from the trunk
>> +
>> +if [ $# -ne 1 ]; then
>> + =C2=A0 =C2=A0echo>&2 "`basename $0`: script expects -patch|-unpatch as=
 argument"
>> + =C2=A0 =C2=A0exit 1
>> +fi
>> +
>> +[ -f debian/patches/00patch-opts ]&& =C2=A0. debian/patches/00patch-opt=
s
>> +patch_opts=3D"${patch_opts:--f --no-backup-if-mismatch}"
>> +
>> +case "$1" in
>> + =C2=A0 =C2=A0 =C2=A0 -patch) patch $patch_opts -p0< =C2=A0$0;;
>> + =C2=A0 =C2=A0 =C2=A0 -unpatch) patch $patch_opts -p0 -R< =C2=A0$0;;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo>&2 "`basen=
ame $0`: script expects -patch|-unpatch as
>> argument"
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1;;
>> +esac
>> +
>> +exit 0
>> +
>> +gas/
>> +
>> +2010-05-04 =C2=A0Nick Clifton<nickc@redhat.com>
>> +
>> + =C2=A0 =C2=A0 =C2=A0 * write.c (fixup_segment): Revert previous delta.
>> + =C2=A0 =C2=A0 =C2=A0 * config/tc-arm.h (TC_FORCE_RELOCATION_LOCAL): Al=
so force the
>> + =C2=A0 =C2=A0 =C2=A0 generation of relocations for fixups against weak=
 symbols.
>> +
>> +2010-04-29 =C2=A0Nathan Sidwell<nathan@codesourcery.com>
>> +
>> + =C2=A0 =C2=A0 =C2=A0 * write.c (fixup_segment): Do not assume we know =
the section a
>> + =C2=A0 =C2=A0 =C2=A0 defined weak symbol is in.
>> + =C2=A0 =C2=A0 =C2=A0 * config/tc-arm.c (relax_adr, relax_branch, md_ap=
ply_fix): Treat
>> + =C2=A0 =C2=A0 =C2=A0 weak symbols as not known to be in the same secti=
on, even if they
>> + =C2=A0 =C2=A0 =C2=A0 are defined.
>> +
>> +gas/testsuite/
>> +
>> +2010-04-29 =C2=A0Nathan Sidwell<nathan@codesourcery.com>
>> +
>> + =C2=A0 =C2=A0 =C2=A0 * gas/arm/weakdef-1.s: New.
>> + =C2=A0 =C2=A0 =C2=A0 * gas/arm/weakdef-1.d: New.
>> + =C2=A0 =C2=A0 =C2=A0 * gas/arm/weakdef-2.s: New.
>> + =C2=A0 =C2=A0 =C2=A0 * gas/arm/weakdef-2.d: New.
>> + =C2=A0 =C2=A0 =C2=A0 * gas/arm/weakdef-2.l: New.
>> +
>> +@DPATCH@
>> +diff -urN gas.orig/config/tc-arm.c gas/config/tc-arm.c
>> +--- a/gas/config/tc-arm.c =C2=A0 =C2=A0 =C2=A02010-02-22 08:06:52.00000=
0000 +0000
>> ++++ b/gas/config/tc-arm.c =C2=A0 =C2=A0 =C2=A02010-05-06 12:52:25.39108=
5365 +0000
>> +@@ -18207,7 +18207,8 @@
>> +
>> + =C2=A0 /* Assume worst case for symbols not known to be in the same se=
ction.
>> =C2=A0*/
>> + =C2=A0 if (!S_IS_DEFINED (fragp->fr_symbol)
>> +- =C2=A0 =C2=A0 =C2=A0|| sec !=3D S_GET_SEGMENT (fragp->fr_symbol))
>> ++ =C2=A0 =C2=A0 =C2=A0|| sec !=3D S_GET_SEGMENT (fragp->fr_symbol)
>> ++ =C2=A0 =C2=A0 =C2=A0|| S_IS_WEAK (fragp->fr_symbol))
>> + =C2=A0 =C2=A0 return 4;
>> +
>> + =C2=A0 val =3D relaxed_symbol_addr (fragp, stretch);
>> +@@ -18250,7 +18251,8 @@
>> +
>> + =C2=A0 /* Assume worst case for symbols not known to be in the same se=
ction.
>> =C2=A0*/
>> + =C2=A0 if (!S_IS_DEFINED (fragp->fr_symbol)
>> +- =C2=A0 =C2=A0 =C2=A0|| sec !=3D S_GET_SEGMENT (fragp->fr_symbol))
>> ++ =C2=A0 =C2=A0 =C2=A0|| sec !=3D S_GET_SEGMENT (fragp->fr_symbol)
>> ++ =C2=A0 =C2=A0 =C2=A0|| S_IS_WEAK (fragp->fr_symbol))
>> + =C2=A0 =C2=A0 return 4;
>> +
>> + #ifdef OBJ_ELF
>> +@@ -19463,22 +19465,23 @@
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0not have a reloc for it, so tc_gen_reloc wi=
ll reject it. =C2=A0*/
>> + =C2=A0 =C2=A0 =C2=A0 fixP->fx_done =3D 1;
>> +
>> +- =C2=A0 =C2=A0 =C2=A0if (fixP->fx_addsy
>> +- =C2=A0 =C2=A0 =C2=A0&& =C2=A0! S_IS_DEFINED (fixP->fx_addsy))
>> ++ =C2=A0 =C2=A0 =C2=A0if (fixP->fx_addsy)
>> + =C2=A0 =C2=A0 =C2=A0 {
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0as_bad_where (fixP->fx_file, fixP->fx_line=
,
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0_("undefined symbol %s used as an immediate
>> value"),
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0S_GET_NAME (fixP->fx_addsy));
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> +- =C2=A0 =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *msg =3D 0;
>> +
>> +- =C2=A0 =C2=A0 =C2=A0if (fixP->fx_addsy
>> +- =C2=A0 =C2=A0 =C2=A0&& =C2=A0S_GET_SEGMENT (fixP->fx_addsy) !=3D seg)
>> +- =C2=A0 =C2=A0 =C2=A0{
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0as_bad_where (fixP->fx_file, fixP->fx_line=
,
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0_("symbol %s is in a different section"),
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0S_GET_NAME (fixP->fx_addsy));
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (! S_IS_DEFINED (fixP->fx_addsy))
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D _("undefined symbol %s used=
 as an immediate value");
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (S_GET_SEGMENT (fixP->fx_addsy) !=
=3D seg)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D _("symbol %s is in a differ=
ent section");
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (S_IS_WEAK (fixP->fx_addsy))
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D _("symbol %s is weak and ma=
y be overridden later");
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (msg)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0as_bad_where (fixP->fx_file,=
 fixP->fx_line,
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0msg, S_GET_NAME (fixP->fx_addsy));
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> + =C2=A0 =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 =C2=A0 newimm =3D encode_arm_immediate (value);
>> +@@ -19504,24 +19507,25 @@
>> + =C2=A0 =C2=A0 =C2=A0 unsigned int highpart =3D 0;
>> + =C2=A0 =C2=A0 =C2=A0 unsigned int newinsn =C2=A0=3D 0xe1a00000; /* nop=
. =C2=A0*/
>> +
>> +- =C2=A0 =C2=A0 =C2=A0if (fixP->fx_addsy
>> +- =C2=A0 =C2=A0 =C2=A0&& =C2=A0! S_IS_DEFINED (fixP->fx_addsy))
>> ++ =C2=A0 =C2=A0 =C2=A0if (fixP->fx_addsy)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0as_bad_where (fixP->fx_file, fixP->=
fx_line,
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0_("undefined symbol %s used as an immediate
>> value"),
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0S_GET_NAME (fixP->fx_addsy));
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *msg =3D 0;
>> +
>> +- =C2=A0 =C2=A0 =C2=A0if (fixP->fx_addsy
>> +- =C2=A0 =C2=A0 =C2=A0&& =C2=A0S_GET_SEGMENT (fixP->fx_addsy) !=3D seg)
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0as_bad_where (fixP->fx_file, fixP->=
fx_line,
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0_("symbol %s is in a different section"),
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0S_GET_NAME (fixP->fx_addsy));
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (! S_IS_DEFINED (fixP->fx_addsy)=
)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D _("undefined symbol =
%s used as an immediate value");
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (S_GET_SEGMENT (fixP->fx_ad=
dsy) !=3D seg)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D _("symbol %s is in a=
 different section");
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (S_IS_WEAK (fixP->fx_addsy)=
)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D _("symbol %s is weak=
 and may be overridden later");
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (msg)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0as_bad_where (fixP->f=
x_file, fixP->fx_line,
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg, S_GET_NAME (fixP->fx_addsy));
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> +-
>> ++
>> + =C2=A0 =C2=A0 =C2=A0 newimm =3D encode_arm_immediate (value);
>> + =C2=A0 =C2=A0 =C2=A0 temp =3D md_chars_to_number (buf, INSN_SIZE);
>> +
>> +diff -urN gas.orig/config/tc-arm.h gas/config/tc-arm.h
>> +--- a/gas/config/tc-arm.h =C2=A0 =C2=A0 =C2=A02009-09-01 00:24:01.00000=
0000 +0000
>> ++++ b/gas/config/tc-arm.h =C2=A0 =C2=A0 =C2=A02010-05-06 12:53:42.78483=
5970 +0000
>> +@@ -183,6 +183,7 @@
>> + =C2=A0 (!(FIX)->fx_pcrel =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> + =C2=A0 =C2=A0|| (FIX)->fx_r_type =3D=3D BFD_RELOC_ARM_GOT32 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \
>> + =C2=A0 =C2=A0|| (FIX)->fx_r_type =3D=3D BFD_RELOC_32 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> ++ =C2=A0 || ((FIX)->fx_addsy !=3D NULL&& =C2=A0S_IS_WEAK ((FIX)->fx_add=
sy)) =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> + =C2=A0 =C2=A0|| TC_FORCE_RELOCATION (FIX))
>> +
>> + /* Force output of R_ARM_REL32 relocations against thumb function
>> symbols.
>> +diff -urN gas.orig/testsuite/gas/arm/weakdef-1.d
>> gas/testsuite/gas/arm/weakdef-1.d
>> +--- a/gas/testsuite/gas/arm/weakdef-1.d =C2=A0 =C2=A0 =C2=A0 =C2=A01970=
-01-01
>> 00:00:00.000000000 +0000
>> ++++ b/gas/testsuite/gas/arm/weakdef-1.d =C2=A0 =C2=A0 =C2=A0 =C2=A02010=
-05-06
>> 12:52:25.391085365 +0000
>> +@@ -0,0 +1,20 @@
>> ++# name: Thumb branch to weak
>> ++# as:
>> ++# objdump: -dr
>> ++# This test is only valid on ELF based ports.
>> ++#not-target: *-*-*coff *-*-pe *-*-wince *-*-*aout* *-*-netbsd
>> *-*-riscix*
>> ++
>> ++.*: +file format .*arm.*
>> ++
>> ++
>> ++Disassembly of section .text:
>> ++
>> ++0+000<Weak>:
>> ++ =C2=A0 0: e7fe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b.n =C2=A0 =
=C2=A0 2<Strong>
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A00: R_ARM_THM_JUMP11 =C2=A0 =C2=A0 Strong
>> ++
>> ++0+002<Strong>:
>> ++ =C2=A0 2: f7ff bffe =C2=A0 =C2=A0 =C2=A0 b.w =C2=A0 =C2=A0 0<Random>
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A02: R_ARM_THM_JUMP24 =C2=A0 =C2=A0 Random
>> ++ =C2=A0 6: f7ff bffe =C2=A0 =C2=A0 =C2=A0 b.w =C2=A0 =C2=A0 0<Weak>
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A06: R_ARM_THM_JUMP24 =C2=A0 =C2=A0 Weak
>> +diff -urN gas.orig/testsuite/gas/arm/weakdef-1.s
>> gas/testsuite/gas/arm/weakdef-1.s
>> +--- a/gas/testsuite/gas/arm/weakdef-1.s =C2=A0 =C2=A0 =C2=A0 =C2=A01970=
-01-01
>> 00:00:00.000000000 +0000
>> ++++ b/gas/testsuite/gas/arm/weakdef-1.s =C2=A0 =C2=A0 =C2=A0 =C2=A02010=
-05-06
>> 12:52:25.391085365 +0000
>> +@@ -0,0 +1,18 @@
>> ++ =C2=A0 =C2=A0 =C2=A0.syntax unified
>> ++ =C2=A0 =C2=A0 =C2=A0.text
>> ++ =C2=A0 =C2=A0 =C2=A0.thumb
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0.globl =C2=A0Weak
>> ++ =C2=A0 =C2=A0 =C2=A0.weak =C2=A0 Weak
>> ++ =C2=A0 =C2=A0 =C2=A0.thumb_func
>> ++ =C2=A0 =C2=A0 =C2=A0.type =C2=A0 Weak, %function
>> ++Weak:
>> ++ =C2=A0 =C2=A0 =C2=A0b =C2=A0 =C2=A0 =C2=A0 Strong
>> ++ =C2=A0 =C2=A0 =C2=A0.size =C2=A0 Weak, .-Weak
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0.globl =C2=A0Strong
>> ++ =C2=A0 =C2=A0 =C2=A0.type =C2=A0 Strong, %function
>> ++Strong:
>> ++ =C2=A0 =C2=A0 =C2=A0b =C2=A0 =C2=A0 =C2=A0 Random
>> ++ =C2=A0 =C2=A0 =C2=A0b =C2=A0 =C2=A0 =C2=A0 Weak
>> ++ =C2=A0 =C2=A0 =C2=A0.size =C2=A0 Strong, .-Strong
>> +diff -urN gas.orig/testsuite/gas/arm/weakdef-2.d
>> gas/testsuite/gas/arm/weakdef-2.d
>> +--- a/gas/testsuite/gas/arm/weakdef-2.d =C2=A0 =C2=A0 =C2=A0 =C2=A01970=
-01-01
>> 00:00:00.000000000 +0000
>> ++++ b/gas/testsuite/gas/arm/weakdef-2.d =C2=A0 =C2=A0 =C2=A0 =C2=A02010=
-05-06
>> 12:52:25.391085365 +0000
>> +@@ -0,0 +1,5 @@
>> ++# name: adr of weak
>> ++# as:
>> ++# error-output: weakdef-2.l
>> ++# This test is only valid on ELF based ports.
>> ++#not-target: *-*-*coff *-*-pe *-*-wince *-*-*aout* *-*-netbsd
>> *-*-riscix*
>> +diff -urN gas.orig/testsuite/gas/arm/weakdef-2.l
>> gas/testsuite/gas/arm/weakdef-2.l
>> +--- a/gas/testsuite/gas/arm/weakdef-2.l =C2=A0 =C2=A0 =C2=A0 =C2=A01970=
-01-01
>> 00:00:00.000000000 +0000
>> ++++ b/gas/testsuite/gas/arm/weakdef-2.l =C2=A0 =C2=A0 =C2=A0 =C2=A02010=
-05-06
>> 12:52:25.391085365 +0000
>> +@@ -0,0 +1,3 @@
>> ++[^:]*: Assembler messages:
>> ++[^:]*:9: Error: symbol Weak is weak and may be overridden later
>> ++[^:]*:10: Error: symbol Weak is weak and may be overridden later
>> +diff -urN gas.orig/testsuite/gas/arm/weakdef-2.s
>> gas/testsuite/gas/arm/weakdef-2.s
>> +--- a/gas/testsuite/gas/arm/weakdef-2.s =C2=A0 =C2=A0 =C2=A0 =C2=A01970=
-01-01
>> 00:00:00.000000000 +0000
>> ++++ b/gas/testsuite/gas/arm/weakdef-2.s =C2=A0 =C2=A0 =C2=A0 =C2=A02010=
-05-06
>> 12:52:25.391085365 +0000
>> +@@ -0,0 +1,10 @@
>> ++ =C2=A0 =C2=A0 =C2=A0.syntax unified
>> ++ =C2=A0 =C2=A0 =C2=A0.text
>> ++ =C2=A0 =C2=A0 =C2=A0.globl =C2=A0Strong
>> ++Strong:
>> ++ =C2=A0 =C2=A0 =C2=A0adrl =C2=A0 =C2=A0r0,Strong
>> ++ =C2=A0 =C2=A0 =C2=A0adr =C2=A0 =C2=A0 r0,Strong
>> ++ =C2=A0 =C2=A0 =C2=A0.globl =C2=A0Weak
>> ++ =C2=A0 =C2=A0 =C2=A0.weak =C2=A0 Weak
>> ++Weak: adrl =C2=A0 =C2=A0r0,Weak
>> ++ =C2=A0 =C2=A0 =C2=A0adr =C2=A0 =C2=A0 r0,Weak
>> diff --git
>> a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/200_elflink_%B_fixes=
.patch
>> b/meta-oe/recipes-devtools/binutils/binutils-2.20.1/200_elflink_%B_fixes=
.patch
>> new file mode 100644
>> index 0000000..ac81685
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-devtools/binutils/binutils-2.20.1/200_elflink_%B_fixes=
.patch
>> @@ -0,0 +1,65 @@
>> +#! /bin/sh /usr/share/dpatch/dpatch-run
>> +## 200_elflink_%B_fixes.dpatch by<kirr@landau.phys.spbu.ru>
>> +##
>> +## All lines beginning with `## DP:' are a description of the patch.
>> +## DP: Description: Fixes several msgs; needed for later elflink patche=
s
>> +## DP: Upstream status: submitted upstream for binutils-2_20-branch
>> +
>> +2010-08-07 =C2=A0Kirill Smelkov<kirr@landau.phys.spbu.ru>
>> +
>> + =C2=A0 =C2=A0 =C2=A0 Backport from mainline:
>> + =C2=A0 =C2=A0 =C2=A0 2009-10-12 =C2=A0Roland McGrath<roland@frob.com>
>> +
>> + =C2=A0 =C2=A0 =C2=A0 * elflink.c (elf_link_add_object_symbols, _bfd_el=
f_merge_symbol):
>> + =C2=A0 =C2=A0 =C2=A0 Fix %s that should be %B in several message forma=
ts.
>> +
>> +@DPATCH@
>> +diff --git a/bfd/elflink.c b/bfd/elflink.c
>> +index c42c6e1..4a348de 100644
>> +--- a/bfd/elflink.c
>> ++++ b/bfd/elflink.c
>> +@@ -1110,19 +1110,19 @@ _bfd_elf_merge_symbol (bfd *abfd,
>> +
>> + =C2=A0 =C2=A0 =C2=A0 if (tdef&& =C2=A0ntdef)
>> + =C2=A0 =C2=A0 =C2=A0 (*_bfd_error_handler)
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0(_("%s: TLS definition in %B section %A mi=
smatches non-TLS
>> definition in %B section %A"),
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0(_("%B: TLS definition in %B section %A mi=
smatches non-TLS
>> definition in %B section %A"),
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tbfd, tsec, ntbfd, ntsec, h->root.ro=
ot.string);
>> + =C2=A0 =C2=A0 =C2=A0 else if (!tdef&& =C2=A0!ntdef)
>> + =C2=A0 =C2=A0 =C2=A0 (*_bfd_error_handler)
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0(_("%s: TLS reference in %B mismatches non=
-TLS reference in
>> %B"),
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0(_("%B: TLS reference in %B mismatches non=
-TLS reference in
>> %B"),
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tbfd, ntbfd, h->root.root.string);
>> + =C2=A0 =C2=A0 =C2=A0 else if (tdef)
>> + =C2=A0 =C2=A0 =C2=A0 (*_bfd_error_handler)
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0(_("%s: TLS definition in %B section %A mi=
smatches non-TLS
>> reference in %B"),
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0(_("%B: TLS definition in %B section %A mi=
smatches non-TLS
>> reference in %B"),
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tbfd, tsec, ntbfd, h->root.root.stri=
ng);
>> + =C2=A0 =C2=A0 =C2=A0 else
>> + =C2=A0 =C2=A0 =C2=A0 (*_bfd_error_handler)
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0(_("%s: TLS reference in %B mismatches non=
-TLS definition in %B
>> section %A"),
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0(_("%B: TLS reference in %B mismatches non=
-TLS definition in %B
>> section %A"),
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tbfd, ntbfd, ntsec, h->root.root.str=
ing);
>> +
>> + =C2=A0 =C2=A0 =C2=A0 bfd_set_error (bfd_error_bad_value);
>> +@@ -4437,7 +4437,7 @@ error_free_dyn:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((elf_dyn_lib_class (abfd=
)& =C2=A0DYN_NO_NEEDED) !=3D 0)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (*_bfd_error_h=
andler)
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(_("%s:=
 invalid DSO for symbol `%s' definition"),
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(_("%B:=
 invalid DSO for symbol `%s' definition"),
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a=
bfd, name);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bfd_set_error =
(bfd_error_bad_value);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error_fre=
e_vers;
>> +@@ -12495,7 +12495,7 @@ _bfd_elf_get_dynamic_reloc_section (bfd *
>> abfd,
>> + =C2=A0 =C2=A0section does not exist it is created and attached to the =
DYNOBJ
>> + =C2=A0 =C2=A0bfd and stored in the SRELOC field of SEC's elf_section_d=
ata
>> + =C2=A0 =C2=A0structure.
>> +-
>> ++
>> + =C2=A0 =C2=A0ALIGNMENT is the alignment for the newly created section =
and
>> + =C2=A0 =C2=A0IS_RELA defines whether the name should be .rela.<SEC's n=
ame>
>> + =C2=A0 =C2=A0or .rel.<SEC's name>. =C2=A0The section name is looked up=
 in the
>> +--
>> +1.7.2.1.44.g721e7
>> +
>> diff --git
>> a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/201_elflink_improve_=
noaddneeded_errors.patch
>> b/meta-oe/recipes-devtools/binutils/binutils-2.20.1/201_elflink_improve_=
noaddneeded_errors.patch
>> new file mode 100644
>> index 0000000..85675a3
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-devtools/binutils/binutils-2.20.1/201_elflink_improve_=
noaddneeded_errors.patch
>> @@ -0,0 +1,70 @@
>> +#! /bin/sh /usr/share/dpatch/dpatch-run
>> +## 201_elflink_improve_errors.dpatch by<kirr@landau.phys.spbu.ru>
>> +##
>> +## All lines beginning with `## DP:' are a description of the patch.
>> +## DP: Improves error messages regarding -no-add-needed cases; needed f=
or
>> +## DP: later elflink patches
>> +## DP: Upstream status: submitted upstream for binutils-2_20-branch
>> +
>> +2010-08-07 =C2=A0Kirill Smelkov<kirr@landau.phys.spbu.ru>
>> +
>> + =C2=A0 =C2=A0 =C2=A0 Backport from mainline:
>> + =C2=A0 =C2=A0 =C2=A0 2009-11-05 =C2=A0Nick Clifton<nickc@redhat.com>
>> +
>> + =C2=A0 =C2=A0 =C2=A0 * elflink.c (elf_link_add_object_symbols): Improv=
e error
>> + =C2=A0 =C2=A0 =C2=A0 message generated when a symbol is left unresolve=
d because a
>> + =C2=A0 =C2=A0 =C2=A0 --no-add-needed command line option has prevented=
 the
>> + =C2=A0 =C2=A0 =C2=A0 inclusion of the DSO defining it.
>> +
>> +@DPATCH@
>> +diff --git a/bfd/elflink.c b/bfd/elflink.c
>> +index 4a348de..10eee8c 100644
>> +--- a/bfd/elflink.c
>> ++++ b/bfd/elflink.c
>> +@@ -3866,6 +3866,7 @@ error_free_dyn:
>> + =C2=A0 =C2=A0 =C2=A0 bfd_boolean common;
>> + =C2=A0 =C2=A0 =C2=A0 unsigned int old_alignment;
>> + =C2=A0 =C2=A0 =C2=A0 bfd *old_bfd;
>> ++ =C2=A0 =C2=A0 =C2=A0bfd * undef_bfd =3D NULL;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 override =3D FALSE;
>> +
>> +@@ -4097,6 +4098,20 @@ error_free_dyn:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D newname;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> +
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If this is a definition of a previously=
 undefined symbol
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 make a note of the bfd that contai=
ned the reference in
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case we need to refer to it later =
on in error messages. =C2=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (! bfd_is_und_section (sec))
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0h =3D elf_link_hash_lookup (=
elf_hash_table (info), name,
>> FALSE, FALSE, FALSE);
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (h !=3D NULL
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& =C2=A0(h->root.typ=
e =3D=3D bfd_link_hash_undefined
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|| h->root.type =3D=3D bfd_link_hash_undefweak)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& =C2=A0h->root.u.un=
def.abfd)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0undef_bfd =3D h->root=
.u.undef.abfd;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> ++
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!_bfd_elf_merge_symbol (abfd, info, na=
me, isym,&sec,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &value,&old_alignment,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sym_hash,&skip,&ove=
rride,
>> +@@ -4437,9 +4452,12 @@ error_free_dyn:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((elf_dyn_lib_class (abfd=
)& =C2=A0DYN_NO_NEEDED) !=3D 0)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (*_bfd_error_h=
andler)
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(_("%B:=
 invalid DSO for symbol `%s' definition"),
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(_("%B:=
 undefined reference to symbol '%s'"),
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 undef_=
bfd =3D=3D NULL ? info->output_bfd : undef_bfd,
>> name);
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*_bfd_error_h=
andler)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(_("not=
e: '%s' is defined in DSO %B so try adding it
>> to the linker command line"),
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a=
bfd, name);
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bfd_set_error =
(bfd_error_bad_value);
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bfd_set_error =
(bfd_error_invalid_operation);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error_fre=
e_vers;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> +
>> +--
>> +1.7.2.1.44.g721e7
>> +
>> diff --git
>> a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/202_elflink_noaddnee=
ded_vs_weak.patch
>> b/meta-oe/recipes-devtools/binutils/binutils-2.20.1/202_elflink_noaddnee=
ded_vs_weak.patch
>> new file mode 100644
>> index 0000000..a7dbc7a
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-devtools/binutils/binutils-2.20.1/202_elflink_noaddnee=
ded_vs_weak.patch
>> @@ -0,0 +1,87 @@
>> +#! /bin/sh /usr/share/dpatch/dpatch-run
>> +## 202_elflink_noaddneeded_vs_weak.dpatch by<kirr@landau.phys.spbu.ru>
>> +##
>> +## All lines beginning with `## DP:' are a description of the patch.
>> +## DP: Fixes '-no-add-needed breaks linking with weak symbols'
>> +## DP: Upstream status: submitted upstream for binutils-2_20-branch
>> +
>> +
>> +2010-08-07 =C2=A0Kirill Smelkov<kirr@landau.phys.spbu.ru>
>> +
>> + =C2=A0 =C2=A0 =C2=A0 Backport from mainline:
>> + =C2=A0 =C2=A0 =C2=A0 2010-01-21 =C2=A0Nick Clifton<nickc@redhat.com>
>> +
>> + =C2=A0 =C2=A0 =C2=A0 * elflink.c (elf_link_add_object_symbols): Look u=
p name of
>> + =C2=A0 =C2=A0 =C2=A0 undefined symbol both before and after versioning=
 has been
>> + =C2=A0 =C2=A0 =C2=A0 applied. =C2=A0Do not bother with symbols that ar=
e weakly undefined.
>> +
>> +
>> +@DPATCH@
>> +diff --git a/bfd/elflink.c b/bfd/elflink.c
>> +index 10eee8c..e058064 100644
>> +--- a/bfd/elflink.c
>> ++++ b/bfd/elflink.c
>> +@@ -3991,6 +3991,20 @@ error_free_dyn:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int vernum =3D 0;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 bfd_boolean skip;
>> +
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If this is a definition of a symbol whi=
ch was previously
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 referenced in a non-weak manner th=
en make a note of the bfd
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 that contained the reference. =C2=
=A0This is used if we need to
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 refer to the source of the referen=
ce later on. =C2=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (! bfd_is_und_section (sec))
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0h =3D elf_link_hash_lookup (=
elf_hash_table (info), name,
>> FALSE, FALSE, FALSE);
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (h !=3D NULL
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& =C2=A0h->root.type=
 =3D=3D bfd_link_hash_undefined
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& =C2=A0h->root.u.un=
def.abfd)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0undef_bfd =3D h->root=
.u.undef.abfd;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> ++
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ever =3D=3D NULL)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info->default_imported_s=
ymver)
>> +@@ -4098,16 +4112,15 @@ error_free_dyn:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D newname;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> +
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If this is a definition of a previously=
 undefined symbol
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 make a note of the bfd that contai=
ned the reference in
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case we need to refer to it later =
on in error messages. =C2=A0*/
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0if (! bfd_is_und_section (sec))
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If necessary, make a second attempt to =
locate the bfd
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 containing an unresolved, non-weak=
 reference to the
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 current symbol. =C2=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (! bfd_is_und_section (sec)&& =C2=A0und=
ef_bfd =3D=3D NULL)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h =3D elf_link_hash_lookup (=
elf_hash_table (info), name,
>> FALSE, FALSE, FALSE);
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (h !=3D NULL
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& =C2=A0(h->root.typ=
e =3D=3D bfd_link_hash_undefined
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|| h->root.type =3D=3D bfd_link_hash_undefweak)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& =C2=A0h->root.type=
 =3D=3D bfd_link_hash_undefined
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 && =C2=A0h->root.u.un=
def.abfd)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 undef_bfd =3D h->root=
.u.undef.abfd;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> +@@ -4448,12 +4461,14 @@ error_free_dyn:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* A symbol from a library l=
oaded via DT_NEEDED of some
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0other library i=
s referenced by a regular object.
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Add a DT_NEEDED=
 entry for it. =C2=A0Issue an error if
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --no-add-needed is u=
sed. =C2=A0*/
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((elf_dyn_lib_class (abfd=
)& =C2=A0DYN_NO_NEEDED) !=3D 0)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --no-add-needed is u=
sed and the reference was not
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a weak one. =C2=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (undef_bfd !=3D NULL
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& =C2=A0(elf_dyn_lib=
_class (abfd)& =C2=A0DYN_NO_NEEDED) !=3D 0)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (*_bfd_error_h=
andler)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (_("%B:=
 undefined reference to symbol '%s'"),
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 undef_=
bfd =3D=3D NULL ? info->output_bfd : undef_bfd,
>> name);
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 undef_=
bfd, name);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (*_bfd_error_h=
andler)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (_("not=
e: '%s' is defined in DSO %B so try adding it
>> to the linker command line"),
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a=
bfd, name);
>> +--
>> +1.7.2.1.44.g721e7
>> +
>> diff --git a/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
>> b/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
>> index 6961a46..2558bda 100644
>> --- a/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
>> +++ b/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
>> @@ -1,6 +1,6 @@
>> =C2=A0require binutils.inc
>>
>> -PR =3D "r5"
>> +PR =3D "r6"
>>
>> =C2=A0LIC_FILES_CHKSUM=3D"\
>> =C2=A0 =C2=A0 =C2=A0file://src-release;endline=3D17;md5=3D4830a9ef968f3b=
18dd5e9f2c00db2d35\
>> @@ -30,6 +30,10 @@ SRC_URI =3D "\
>> =C2=A0 =C2=A0 =C2=A0 file://libiberty_path_fix.patch \
>> =C2=A0 =C2=A0 =C2=A0 file://binutils-poison.patch \
>> =C2=A0 =C2=A0 =C2=A0 file://libtool-rpath-fix.patch \
>> + =C2=A0 =C2=A0 file://152_arm_branches_to_weak_symbols.patch \
>> + =C2=A0 =C2=A0 file://200_elflink_%B_fixes.patch \
>> + =C2=A0 =C2=A0 file://201_elflink_improve_noaddneeded_errors.patch \
>> + =C2=A0 =C2=A0 file://202_elflink_noaddneeded_vs_weak.patch \
>> =C2=A0 =C2=A0 =C2=A0 "
>>
>> =C2=A0SRC_URI[md5sum] =3D "9cdfb9d6ec0578c166d3beae5e15c4e5"
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


