Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CBBC7710B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 19:53:53 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XM0Kw-0005yo-2H from Yasir_Khan@mentor.com ;
	Mon, 25 Aug 2014 12:53:54 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 25 Aug 2014 12:53:53 -0700
Received: from EU-MBX-04.mgc.mentorg.com ([169.254.4.250]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.02.0247.003; Mon, 25 Aug 2014 20:53:52 +0100
From: "Khan, Yasir" <Yasir_Khan@mentor.com>
To: Mark Hatle <mark.hatle@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] prelink: apply patch for ARM IFUNC support
Thread-Index: AQHPtsczP8GoEVH8KUK+eM1qPoeGcpvOj7WAgBM9SyA=
Date: Mon, 25 Aug 2014 19:53:51 +0000
Message-ID: <428317DA8188854B9B82598D29DA15E24E0F36A1@EU-MBX-04.mgc.mentorg.com>
References: <1407914400-50293-1-git-send-email-yasir_khan@mentor.com>,
	<53EB7D09.8090202@windriver.com>
In-Reply-To: <53EB7D09.8090202@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
X-OriginalArrivalTime: 25 Aug 2014 19:53:53.0982 (UTC)
	FILETIME=[4C9DF5E0:01CFC09E]
Subject: Re: [PATCH] prelink: apply patch for ARM IFUNC support
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
X-List-Received-Date: Mon, 25 Aug 2014 19:53:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Below are the details of the patch from the link which couldn't be opened.=
=0A=
=0A=
Authors:=0A=
Kyle McMartin  <kmcmartin@redhat.com>=0A=
Jakub Jelinek  <jakub@redhat.com>=0A=
Julian Brown  <julian@codesourcery.com>=0A=
=0A=
Description : "Implement IFUNC support in the prelinker for ARM"=0A=
The prelinker patch is a bug-fixed version of the patch from:=0A=
https://bugzilla.redhat.com/show_bug.cgi?id=3D1009601=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Mark Hatle [mark.hatle@windrive=
r.com]=0A=
Sent: Wednesday, August 13, 2014 7:58 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH] prelink: apply patch for ARM IFUNC support=
=0A=
=0A=
Just an FYI, this does not apply with the top of the tree cross-prelink.  (=
I=0A=
have attempted to apply it to the staging tree, but I'm unclear who the ori=
ginal=0A=
author is of this..)=0A=
=0A=
The change has been made to the cross_prelink_staging branch, see:=0A=
=0A=
http://git.yoctoproject.org/cgit/cgit.cgi/prelink-cross/commit/?h=3Dcross_p=
relink_staging&id=3D3b381e6595be052baa7705ddb318ea3bf9b95cf2=0A=
=0A=
If this is not correct (especially the patch author or other attributions,=
=0A=
please let me know...)=0A=
=0A=
Also if you could verify the problem being fixed/new feature, I would appre=
ciate=0A=
it..=0A=
=0A=
On 8/13/14, 2:20 AM, Yasir Khan wrote:=0A=
> From: Yasir-Khan <yasir_khan@mentor.com>=0A=
>=0A=
>  From Julian Brown, see=0A=
> http://sourcery.sje.mentorg.com/pipermail/gnu-arm-releases/2014-April/015=
072.html.=0A=
=0A=
Also the above appears to be an internal to Mentor address.  Since we can't=
 read=0A=
this, it would be helpful to quote the relevant information into the commit=
=0A=
message, as I can only guess [based on what this is doing] as to why the ch=
ange=0A=
is needed.=0A=
=0A=
--Mark=0A=
=0A=
> Signed-off-by: Christopher Larson <kergoth@gmail.com>=0A=
> Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>=0A=
> ---=0A=
>   .../prelink/prelink/arm-ifunc.patch                |  264 +++++++++++++=
+++++++=0A=
>   meta/recipes-devtools/prelink/prelink_git.bb       |    4 +-=0A=
>   2 files changed, 267 insertions(+), 1 deletion(-)=0A=
>   create mode 100644 meta/recipes-devtools/prelink/prelink/arm-ifunc.patc=
h=0A=
>=0A=
> diff --git a/meta/recipes-devtools/prelink/prelink/arm-ifunc.patch b/meta=
/recipes-devtools/prelink/prelink/arm-ifunc.patch=0A=
> new file mode 100644=0A=
> index 0000000..b63affc=0A=
> --- /dev/null=0A=
> +++ b/meta/recipes-devtools/prelink/prelink/arm-ifunc.patch=0A=
> @@ -0,0 +1,264 @@=0A=
> +Kyle McMartin  <kmcmartin@redhat.com>=0A=
> +Jakub Jelinek  <jakub@redhat.com>=0A=
> +Julian Brown  <julian@codesourcery.com>=0A=
> +=0A=
> +* testsuite/ifunc.h: Add ARM support.=0A=
> +* src/prelink.h (R_ARM_IRELATIVE): Define.=0A=
> +* src/arch-arm.c (arm_adjust_rel, arm_adjust_rela)=0A=
> +(arm_prelink_rel, arm_prelink_rela, arm_apply_conflict_rela)=0A=
> +(arm_rela_to_rel, arm_rel_to_rela, arm_undo_prelink_rel):=0A=
> +Handle R_ARM_IRELATIVE.=0A=
> +(arm_prelink_conflict_rel, arm_prelink_conflict_rela): Handle=0A=
> +R_ARM_IRELATIVE, ifunc conflicts.=0A=
> +=0A=
> +Upstream-Status: Pending [This is applied to the CodeBench toolchain, bu=
t not to upstream prelink, nor to prelink-cross]=0A=
> +=0A=
> +Index: trunk/src/arch-arm.c=0A=
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
> +--- trunk.orig/src/arch-arm.c        2014-04-25 16:07:02.190843841 -0700=
=0A=
> ++++ trunk/src/arch-arm.c     2014-04-25 16:08:12.211355745 -0700=0A=
> +@@ -1,4 +1,4 @@=0A=
> +-/* Copyright (C) 2001, 2002, 2004, 2009, 2011 Red Hat, Inc.=0A=
> ++/* Copyright (C) 2001, 2002, 2004, 2009, 2011, 2013 Red Hat, Inc.=0A=
> +    Written by Jakub Jelinek <jakub@redhat.com>, 2001.=0A=
> +=0A=
> +    This program is free software; you can redistribute it and/or modify=
=0A=
> +@@ -80,6 +80,7 @@=0A=
> +     {=0A=
> +     case R_ARM_RELATIVE:=0A=
> +     case R_ARM_JUMP_SLOT:=0A=
> ++    case R_ARM_IRELATIVE:=0A=
> +       data =3D read_une32 (dso, rel->r_offset);=0A=
> +       if (data >=3D start)=0A=
> +     write_ne32 (dso, rel->r_offset, data + adjust);=0A=
> +@@ -97,6 +98,7 @@=0A=
> +   switch (GELF_R_TYPE (rela->r_info))=0A=
> +     {=0A=
> +     case R_ARM_RELATIVE:=0A=
> ++    case R_ARM_IRELATIVE:=0A=
> +       if ((Elf32_Addr) rela->r_addend >=3D start)=0A=
> +     {=0A=
> +       rela->r_addend +=3D (Elf32_Sword) adjust;=0A=
> +@@ -123,6 +125,7 @@=0A=
> +   Elf32_Sword val;=0A=
> +=0A=
> +   if (GELF_R_TYPE (rel->r_info) =3D=3D R_ARM_RELATIVE=0A=
> ++      || GELF_R_TYPE (rel->r_info) =3D=3D R_ARM_IRELATIVE=0A=
> +       || GELF_R_TYPE (rel->r_info) =3D=3D R_ARM_NONE)=0A=
> +     /* Fast path: nothing to do.  */=0A=
> +     return 0;=0A=
> +@@ -212,6 +215,7 @@=0A=
> +   Elf32_Sword val;=0A=
> +=0A=
> +   if (GELF_R_TYPE (rela->r_info) =3D=3D R_ARM_RELATIVE=0A=
> ++      || GELF_R_TYPE (rela->r_info) =3D=3D R_ARM_IRELATIVE=0A=
> +       || GELF_R_TYPE (rela->r_info) =3D=3D R_ARM_NONE)=0A=
> +     /* Fast path: nothing to do.  */=0A=
> +     return 0;=0A=
> +@@ -293,6 +297,8 @@=0A=
> + arm_apply_conflict_rela (struct prelink_info *info, GElf_Rela *rela,=0A=
> +                      char *buf, GElf_Addr dest_addr)=0A=
> + {=0A=
> ++  GElf_Rela *ret;=0A=
> ++=0A=
> +   switch (GELF_R_TYPE (rela->r_info))=0A=
> +     {=0A=
> +     case R_ARM_GLOB_DAT:=0A=
> +@@ -300,6 +306,16 @@=0A=
> +     case R_ARM_ABS32:=0A=
> +       buf_write_ne32 (info->dso, buf, rela->r_addend);=0A=
> +       break;=0A=
> ++    case R_ARM_IRELATIVE:=0A=
> ++      if (dest_addr =3D=3D 0)=0A=
> ++    return 5;=0A=
> ++      ret =3D prelink_conflict_add_rela (info);=0A=
> ++      if (ret =3D=3D NULL)=0A=
> ++    return 1;=0A=
> ++      ret->r_offset =3D dest_addr;=0A=
> ++      ret->r_info =3D GELF_R_INFO (0, R_ARM_IRELATIVE);=0A=
> ++      ret->r_addend =3D rela->r_addend;=0A=
> ++      break;=0A=
> +     default:=0A=
> +       abort ();=0A=
> +     }=0A=
> +@@ -399,35 +415,31 @@=0A=
> +   GElf_Rela *ret;=0A=
> +=0A=
> +   if (GELF_R_TYPE (rel->r_info) =3D=3D R_ARM_RELATIVE=0A=
> +-      || GELF_R_TYPE (rel->r_info) =3D=3D R_ARM_NONE=0A=
> +-      || info->dso =3D=3D dso)=0A=
> ++      || GELF_R_TYPE (rel->r_info) =3D=3D R_ARM_NONE)=0A=
> +     /* Fast path: nothing to do.  */=0A=
> +     return 0;=0A=
> +   conflict =3D prelink_conflict (info, GELF_R_SYM (rel->r_info),=0A=
> +                            GELF_R_TYPE (rel->r_info));=0A=
> +   if (conflict =3D=3D NULL)=0A=
> +     {=0A=
> +-      if (info->curtls =3D=3D NULL)=0A=
> +-    return 0;=0A=
> +-=0A=
> +       switch (GELF_R_TYPE (rel->r_info))=0A=
> +     {=0A=
> +     /* Even local DTPMOD and TPOFF relocs need conflicts.  */=0A=
> +     case R_ARM_TLS_DTPMOD32:=0A=
> +     case R_ARM_TLS_TPOFF32:=0A=
> ++      if (info->curtls =3D=3D NULL || info->dso =3D=3D dso)=0A=
> ++        return 0;=0A=
> ++      break;=0A=
> ++    /* Similarly IRELATIVE relocations always need conflicts.  */=0A=
> ++    case R_ARM_IRELATIVE:=0A=
> +       break;=0A=
> +-=0A=
> +     default:=0A=
> +       return 0;=0A=
> +     }=0A=
> +       value =3D 0;=0A=
> +     }=0A=
> +-  else if (conflict->ifunc)=0A=
> +-    {=0A=
> +-      error (0, 0, "%s: STT_GNU_IFUNC not handled on ARM yet",=0A=
> +-         dso->filename);=0A=
> +-      return 1;=0A=
> +-    }=0A=
> ++  else if (info->dso =3D=3D dso && !conflict->ifunc)=0A=
> ++    return 0;=0A=
> +   else=0A=
> +     {=0A=
> +       /* DTPOFF32 wants to see only real conflicts, not lookups=0A=
> +@@ -450,6 +462,11 @@=0A=
> +     case R_ARM_GLOB_DAT:=0A=
> +     case R_ARM_JUMP_SLOT:=0A=
> +       ret->r_addend =3D (Elf32_Sword) value;=0A=
> ++      if (conflict !=3D NULL && conflict->ifunc)=0A=
> ++    ret->r_info =3D GELF_R_INFO (0, R_ARM_IRELATIVE);=0A=
> ++      break;=0A=
> ++    case R_ARM_IRELATIVE:=0A=
> ++      ret->r_addend =3D (Elf32_Sword) read_une32 (dso, rel->r_offset);=
=0A=
> +       break;=0A=
> +     case R_ARM_ABS32:=0A=
> +     case R_ARM_PC24:=0A=
> +@@ -508,8 +525,7 @@=0A=
> +   Elf32_Sword val;=0A=
> +=0A=
> +   if (GELF_R_TYPE (rela->r_info) =3D=3D R_ARM_RELATIVE=0A=
> +-      || GELF_R_TYPE (rela->r_info) =3D=3D R_ARM_NONE=0A=
> +-      || info->dso =3D=3D dso)=0A=
> ++      || GELF_R_TYPE (rela->r_info) =3D=3D R_ARM_NONE)=0A=
> +     /* Fast path: nothing to do.  */=0A=
> +     return 0;=0A=
> +   conflict =3D prelink_conflict (info, GELF_R_SYM (rela->r_info),=0A=
> +@@ -517,27 +533,24 @@=0A=
> +=0A=
> +   if (conflict =3D=3D NULL)=0A=
> +     {=0A=
> +-      if (info->curtls =3D=3D NULL)=0A=
> +-    return 0;=0A=
> +-=0A=
> +       switch (GELF_R_TYPE (rela->r_info))=0A=
> +     {=0A=
> +     /* Even local DTPMOD and TPOFF relocs need conflicts.  */=0A=
> +     case R_ARM_TLS_DTPMOD32:=0A=
> +     case R_ARM_TLS_TPOFF32:=0A=
> ++      if (info->curtls =3D=3D NULL || info->dso =3D=3D dso)=0A=
> ++        return 0;=0A=
> ++      break;=0A=
> ++    /* Similarly IRELATIVE relocations always need conflicts.  */=0A=
> ++    case R_ARM_IRELATIVE:=0A=
> +       break;=0A=
> +-=0A=
> +     default:=0A=
> +       return 0;=0A=
> +     }=0A=
> +       value =3D 0;=0A=
> +     }=0A=
> +-  else if (conflict->ifunc)=0A=
> +-    {=0A=
> +-      error (0, 0, "%s: STT_GNU_IFUNC not handled on ARM yet",=0A=
> +-         dso->filename);=0A=
> +-      return 1;=0A=
> +-    }=0A=
> ++  else if (info->dso =3D=3D dso && !conflict->ifunc)=0A=
> ++    return 0;=0A=
> +   else=0A=
> +     {=0A=
> +       /* DTPOFF32 wants to see only real conflicts, not lookups=0A=
> +@@ -560,7 +573,10 @@=0A=
> +     case R_ARM_GLOB_DAT:=0A=
> +     case R_ARM_JUMP_SLOT:=0A=
> +     case R_ARM_ABS32:=0A=
> ++    case R_ARM_IRELATIVE:=0A=
> +       ret->r_addend =3D (Elf32_Sword) (value + rela->r_addend);=0A=
> ++      if (conflict && conflict->ifunc)=0A=
> ++    ret->r_info =3D GELF_R_INFO (0, R_ARM_IRELATIVE);=0A=
> +       break;=0A=
> +     case R_ARM_PC24:=0A=
> +       val =3D value + rela->r_addend - rela->r_offset;=0A=
> +@@ -625,6 +641,7 @@=0A=
> +       /* We should be never converting .rel.plt into .rela.plt.  */=0A=
> +       abort ();=0A=
> +     case R_ARM_RELATIVE:=0A=
> ++    case R_ARM_IRELATIVE:=0A=
> +     case R_ARM_ABS32:=0A=
> +     case R_ARM_TLS_TPOFF32:=0A=
> +     case R_ARM_TLS_DTPOFF32:=0A=
> +@@ -656,6 +673,7 @@=0A=
> +      and thus never .rela.plt back to .rel.plt.  */=0A=
> +       abort ();=0A=
> +     case R_ARM_RELATIVE:=0A=
> ++    case R_ARM_IRELATIVE:=0A=
> +     case R_ARM_ABS32:=0A=
> +     case R_ARM_TLS_TPOFF32:=0A=
> +     case R_ARM_TLS_DTPOFF32:=0A=
> +@@ -794,6 +812,7 @@=0A=
> +   switch (GELF_R_TYPE (rel->r_info))=0A=
> +     {=0A=
> +     case R_ARM_RELATIVE:=0A=
> ++    case R_ARM_IRELATIVE:=0A=
> +     case R_ARM_NONE:=0A=
> +       break;=0A=
> +     case R_ARM_JUMP_SLOT:=0A=
> +Index: trunk/src/prelink.h=0A=
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
> +--- trunk.orig/src/prelink.h 2014-04-25 16:07:02.000000000 -0700=0A=
> ++++ trunk/src/prelink.h      2014-04-25 16:08:12.235355916 -0700=0A=
> +@@ -145,6 +145,10 @@=0A=
> + #define R_390_IRELATIVE             61=0A=
> + #endif=0A=
> +=0A=
> ++#ifndef R_ARM_IRELATIVE=0A=
> ++#define R_ARM_IRELATIVE             160=0A=
> ++#endif=0A=
> ++=0A=
> + struct prelink_entry;=0A=
> + struct prelink_info;=0A=
> + struct PLArch;=0A=
> +Index: trunk/testsuite/ifunc.h=0A=
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
> +--- trunk.orig/testsuite/ifunc.h     2014-04-25 16:07:02.000000000 -0700=
=0A=
> ++++ trunk/testsuite/ifunc.h  2014-04-25 16:08:43.831585698 -0700=0A=
> +@@ -35,6 +35,25 @@=0A=
> +      IFUNC_ASM (PICK (fn1, fn2))                    \=0A=
> +      "\t.size " #name ", .-.L" #name "\n")=0A=
> + # endif=0A=
> ++#elif defined __arm__=0A=
> ++# ifdef __thumb__=0A=
> ++#  define PIPE_OFFSET "4"=0A=
> ++# else=0A=
> ++#  define PIPE_OFFSET "8"=0A=
> ++# endif=0A=
> ++# define IFUNC_ASM(fn)                                      \=0A=
> ++     "\tldr r0, .L" fn "\n"                         \=0A=
> ++   "1:\tadd r0, pc, r0\n"                           \=0A=
> ++     "\tmov pc, lr\n"                                       \=0A=
> ++     ".L" fn ": .long " fn " - 1b - " PIPE_OFFSET "\n"=0A=
> ++# define IFUNC_DECL(name, hidden, fn1, fn2)         \=0A=
> ++asm (".text\n"                                              \=0A=
> ++     "\t.globl " #name "\n"                         \=0A=
> ++     "\t" hidden " " #name "\n"                             \=0A=
> ++     "\t.type " #name ", %gnu_indirect_function\n"  \=0A=
> ++     #name ":\n"                                    \=0A=
> ++     IFUNC_ASM (PICK (fn1, fn2))                    \=0A=
> ++     "\t.size " #name ", .-" #name "\n")=0A=
> + #else=0A=
> + # error Architecture not supported=0A=
> + #endif=0A=
> diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-=
devtools/prelink/prelink_git.bb=0A=
> index 3288822..5aa850d 100644=0A=
> --- a/meta/recipes-devtools/prelink/prelink_git.bb=0A=
> +++ b/meta/recipes-devtools/prelink/prelink_git.bb=0A=
> @@ -30,7 +30,9 @@ SRC_URI =3D "git://git.yoctoproject.org/prelink-cross.g=
it;branch=3Dcross_prelink \=0A=
>              file://prelink.conf \=0A=
>              file://prelink.cron.daily \=0A=
>              file://prelink.default \=0A=
> -        file://macros.prelink"=0A=
> +        file://macros.prelink \=0A=
> +           file://arm-ifunc.patch \=0A=
> +"=0A=
>=0A=
>   TARGET_OS_ORIG :=3D "${TARGET_OS}"=0A=
>   OVERRIDES_append =3D ":${TARGET_OS_ORIG}"=0A=
>=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

