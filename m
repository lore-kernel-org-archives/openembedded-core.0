Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id D48036FEFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 14:24:38 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id 90so7124581qgz.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 07:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=X5OHxeIGXIJ1hIOFfLILGF1yPuUgSxCoIprTgI86eC4=;
	b=xlY38NK4x3MMPMkoHL1lVFUFV/aX4O/yFrbcw3/FYEGK+KcLuXn9H+vY935mEPM0Ql
	0iFuhxE7Nkf5qZ9kx6fyx73NjzTP06MEGk84SmYVIKU8CTCzvwNhvIP2eILod9sob7by
	FPUfpjz1JYKH3A2bl/ffCwYpl7cpcQvK47z/bRCBvlBwdkc6ykTKJMnciL/VMjdPeWai
	6jP90XpfGr3EJlsSs/fCfKHJ5qI1vqVaRCzRHV3pVze37RKjzexspiquiSIy7KCipz29
	R+wkOME8y74kgxUW9nVqyQ6eJjf3U9JELk13W+xsnOk29IvMNvlrhFKYTfO2f0wyRmcA
	Z+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=X5OHxeIGXIJ1hIOFfLILGF1yPuUgSxCoIprTgI86eC4=;
	b=mQ+NAEEUeR5Nbmxqvr7FcUaRcQnzYkgNF/gFj/or6so9UQmSVX1pGdQbfQJOm8L1IG
	HL1Ac4QsQiocZVC9j+NrxqWRNRk7hVcalBZmCAFX38Gvf24rlggCCKFnMq6pWDnjwh9R
	halA+d0QukvbSWjlWY9BwhrhzcAvjIF4CZsT0K7YbmvB5pL2p4HTJQmWtaiwS2CPL4dQ
	AjETbJqR3nx39Nyp1ucLGT15ZN9t91DN5hyLPcxSPwNol2HaupU8NySPkylKQonppIGW
	TFv71s5eJ86yjDMtuo2GfSAAWj5VqZvCJZQzhIQCrbetoiTo8pQqHyvhWG6EcEmCK7mV
	3Viw==
X-Gm-Message-State: AOPr4FWNwxV9kSxizpBzaWYogr0TFAUgsWOBueAHpSxIfgSuBSei6C+gvm5LsbvzvZUDVBR+ql1IHZbXt7t55g==
MIME-Version: 1.0
X-Received: by 10.140.92.175 with SMTP id b44mr40411707qge.104.1462890278787; 
	Tue, 10 May 2016 07:24:38 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Tue, 10 May 2016 07:24:38 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Tue, 10 May 2016 07:24:38 -0700 (PDT)
In-Reply-To: <5731DD32.9050200@windriver.com>
References: <1461793180-7861-1-git-send-email-tristan.vanberkom@codethink.co.uk>
	<CAMKF1sqp-kXUScfm5aZt2YeATAUQTmw77sgMAVtqm+tWVZWUqA@mail.gmail.com>
	<5731DD32.9050200@windriver.com>
Date: Tue, 10 May 2016 07:24:38 -0700
Message-ID: <CAMKF1soSRCin--Ljdxs=VEE8cBa15Oj2JNzvw=Nsj_vkapTDzg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][jethro] binutils: backport bug fix to the 2.25 branch for jethro
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
X-List-Received-Date: Tue, 10 May 2016 14:24:39 -0000
Content-Type: multipart/alternative; boundary=001a11399e2e69c40f05327daf2b

--001a11399e2e69c40f05327daf2b
Content-Type: text/plain; charset=UTF-8

Yes
On May 10, 2016 6:08 AM, "Robert Yang" <liezhi.yang@windriver.com> wrote:

>
> Hi Khem,
>
> What did you mean, please ? I assume ok to backport ?
>
> // Robert
>
> On 04/30/2016 04:47 AM, Khem Raj wrote:
>
>> this is ok to install.
>>
>> On Wed, Apr 27, 2016 at 2:39 PM, Tristan Van Berkom
>> <tristan.vanberkom@codethink.co.uk> wrote:
>>
>>> We fail to build webkit on aarch64 due to this binutils bug:
>>>
>>>     https://sourceware.org/bugzilla/show_bug.cgi?id=19353
>>>
>>> Applying patch which fixes this, stripped out changelog entry
>>> from patch to make it apply without error.
>>> ---
>>>   meta/recipes-devtools/binutils/binutils-2.25.1.inc |   1 +
>>>   ...plying-TLSDESC-relocs-without-TLS-segment.patch | 166
>>> +++++++++++++++++++++
>>>   2 files changed, 167 insertions(+)
>>>   create mode 100644
>>> meta/recipes-devtools/binutils/binutils/fix-internal-error-when-applying-TLSDESC-relocs-without-TLS-segment.patch
>>>
>>> diff --git a/meta/recipes-devtools/binutils/binutils-2.25.1.inc
>>> b/meta/recipes-devtools/binutils/binutils-2.25.1.inc
>>> index f3817fa..c7db9e0 100644
>>> --- a/meta/recipes-devtools/binutils/binutils-2.25.1.inc
>>> +++ b/meta/recipes-devtools/binutils/binutils-2.25.1.inc
>>> @@ -35,6 +35,7 @@ SRC_URI = "\
>>>
>>>  file://0015-Fix-dynamic-list-so-that-symbols-not-in-the-list-are.patch \
>>>        file://binutils-octeon3.patch \
>>>        file://add-thunderx-support-for-gas.patch \
>>> +
>>>  file://fix-internal-error-when-applying-TLSDESC-relocs-without-TLS-segment.patch
>>> \
>>>        "
>>>   S  = "${WORKDIR}/git"
>>>
>>> diff --git
>>> a/meta/recipes-devtools/binutils/binutils/fix-internal-error-when-applying-TLSDESC-relocs-without-TLS-segment.patch
>>> b/meta/recipes-devtools/binutils/binutils/fix-internal-error-when-applying-TLSDESC-relocs-without-TLS-segment.patch
>>> new file mode 100644
>>> index 0000000..df9d54c
>>> --- /dev/null
>>> +++
>>> b/meta/recipes-devtools/binutils/binutils/fix-internal-error-when-applying-TLSDESC-relocs-without-TLS-segment.patch
>>> @@ -0,0 +1,166 @@
>>> +From d21f123b0ead1806416cf0dafae12bec4cca8920 Mon Sep 17 00:00:00 2001
>>> +From: Cary Coutant <ccoutant@gmail.com>
>>> +Date: Mon, 11 Jan 2016 23:57:44 -0800
>>> +Subject: [PATCH] Fix internal error when applying TLSDESC relocations
>>> with no TLS segment.
>>> +
>>> +gold/
>>> +       PR gold/19353
>>> +       * aarch64.cc (Target_aarch64::relocate_tls): Don't insist that
>>> +       we have a TLS segment for GD-to-IE optimization.
>>> +       * i386.cc (Target_i386::tls_gd_to_ie): Remove tls_segment
>>> parameter.
>>> +       Adjust all calls.
>>> +       (Target_i386::tls_desc_gd_to_ie): Likewise.
>>> +       (Target_i386::relocate_tls): Don't insist that we have a TLS
>>> segment
>>> +       for TLSDESC GD-to-IE optimizations.
>>> +       * x86_64.cc (Target_x86_64::tls_gd_to_ie): Remove tls_segment
>>> parameter.
>>> +       Adjust all calls.
>>> +       (Target_x86_64::tls_desc_gd_to_ie): Likewise.
>>> +       (Target_x86_64::relocate_tls): Don't insist that we have a TLS
>>> segment
>>> +       for TLSDESC GD-to-IE optimizations.
>>> +---
>>> + gold/aarch64.cc |    6 ------
>>> + gold/i386.cc    |   14 ++------------
>>> + gold/x86_64.cc  |   14 ++------------
>>> + 4 files changed, 20 insertions(+), 30 deletions(-)
>>> +
>>> +diff --git a/gold/aarch64.cc b/gold/aarch64.cc
>>> +index 20f2f4f..5ad061b 100644
>>> +--- a/gold/aarch64.cc
>>> ++++ b/gold/aarch64.cc
>>> +@@ -7422,12 +7422,6 @@ Target_aarch64<size,
>>> big_endian>::Relocate::relocate_tls(
>>> +             }
>>> +           if (tlsopt == tls::TLSOPT_TO_IE)
>>> +             {
>>> +-              if (tls_segment == NULL)
>>> +-                {
>>> +-                  gold_assert(parameters->errors()->error_count() > 0
>>> +-                              || issue_undefined_symbol_error(gsym));
>>> +-                  return aarch64_reloc_funcs::STATUS_BAD_RELOC;
>>> +-                }
>>> +               return tls_desc_gd_to_ie(relinfo, target, rela, r_type,
>>> +                                        view, psymval,
>>> got_entry_address,
>>> +                                        address);
>>> +diff --git a/gold/i386.cc b/gold/i386.cc
>>> +index 82886d4..a7168a8 100644
>>> +--- a/gold/i386.cc
>>> ++++ b/gold/i386.cc
>>> +@@ -668,7 +668,6 @@ class Target_i386 : public Sized_target<32, false>
>>> +     // Do a TLS General-Dynamic to Initial-Exec transition.
>>> +     inline void
>>> +     tls_gd_to_ie(const Relocate_info<32, false>*, size_t relnum,
>>> +-               Output_segment* tls_segment,
>>> +                const elfcpp::Rel<32, false>&, unsigned int r_type,
>>> +                elfcpp::Elf_types<32>::Elf_Addr value,
>>> +                unsigned char* view,
>>> +@@ -687,7 +686,6 @@ class Target_i386 : public Sized_target<32, false>
>>> +     // transition.
>>> +     inline void
>>> +     tls_desc_gd_to_ie(const Relocate_info<32, false>*, size_t relnum,
>>> +-                    Output_segment* tls_segment,
>>> +                     const elfcpp::Rel<32, false>&, unsigned int r_type,
>>> +                     elfcpp::Elf_types<32>::Elf_Addr value,
>>> +                     unsigned char* view,
>>> +@@ -3054,7 +3052,7 @@ Target_i386::Relocate::relocate_tls(const
>>> Relocate_info<32, false>* relinfo,
>>> +           }
>>> +         if (optimized_type == tls::TLSOPT_TO_IE)
>>> +           {
>>> +-            this->tls_gd_to_ie(relinfo, relnum, tls_segment, rel,
>>> r_type,
>>> ++            this->tls_gd_to_ie(relinfo, relnum, rel, r_type,
>>> +                                got_offset, view, view_size);
>>> +             break;
>>> +           }
>>> +@@ -3116,13 +3114,7 @@ Target_i386::Relocate::relocate_tls(const
>>> Relocate_info<32, false>* relinfo,
>>> +           }
>>> +         if (optimized_type == tls::TLSOPT_TO_IE)
>>> +           {
>>> +-            if (tls_segment == NULL)
>>> +-              {
>>> +-                gold_assert(parameters->errors()->error_count() > 0
>>> +-                            || issue_undefined_symbol_error(gsym));
>>> +-                return;
>>> +-              }
>>> +-            this->tls_desc_gd_to_ie(relinfo, relnum, tls_segment, rel,
>>> r_type,
>>> ++            this->tls_desc_gd_to_ie(relinfo, relnum, rel, r_type,
>>> +                                     got_offset, view, view_size);
>>> +             break;
>>> +           }
>>> +@@ -3354,7 +3346,6 @@ Target_i386::Relocate::tls_gd_to_le(const
>>> Relocate_info<32, false>* relinfo,
>>> + inline void
>>> + Target_i386::Relocate::tls_gd_to_ie(const Relocate_info<32, false>*
>>> relinfo,
>>> +                                   size_t relnum,
>>> +-                                  Output_segment*,
>>> +                                   const elfcpp::Rel<32, false>& rel,
>>> +                                   unsigned int,
>>> +                                   elfcpp::Elf_types<32>::Elf_Addr
>>> value,
>>> +@@ -3449,7 +3440,6 @@ inline void
>>> + Target_i386::Relocate::tls_desc_gd_to_ie(
>>> +     const Relocate_info<32, false>* relinfo,
>>> +     size_t relnum,
>>> +-    Output_segment*,
>>> +     const elfcpp::Rel<32, false>& rel,
>>> +     unsigned int r_type,
>>> +     elfcpp::Elf_types<32>::Elf_Addr value,
>>> +diff --git a/gold/x86_64.cc b/gold/x86_64.cc
>>> +index 3cfc064..4ad5afc 100644
>>> +--- a/gold/x86_64.cc
>>> ++++ b/gold/x86_64.cc
>>> +@@ -816,7 +816,6 @@ class Target_x86_64 : public Sized_target<size,
>>> false>
>>> +     // Do a TLS General-Dynamic to Initial-Exec transition.
>>> +     inline void
>>> +     tls_gd_to_ie(const Relocate_info<size, false>*, size_t relnum,
>>> +-               Output_segment* tls_segment,
>>> +                const elfcpp::Rela<size, false>&, unsigned int r_type,
>>> +                typename elfcpp::Elf_types<size>::Elf_Addr value,
>>> +                unsigned char* view,
>>> +@@ -835,7 +834,6 @@ class Target_x86_64 : public Sized_target<size,
>>> false>
>>> +     // Do a TLSDESC-style General-Dynamic to Initial-Exec transition.
>>> +     inline void
>>> +     tls_desc_gd_to_ie(const Relocate_info<size, false>*, size_t relnum,
>>> +-                    Output_segment* tls_segment,
>>> +                     const elfcpp::Rela<size, false>&, unsigned int
>>> r_type,
>>> +                     typename elfcpp::Elf_types<size>::Elf_Addr value,
>>> +                     unsigned char* view,
>>> +@@ -3733,7 +3731,7 @@ Target_x86_64<size>::Relocate::relocate_tls(
>>> +         if (optimized_type == tls::TLSOPT_TO_IE)
>>> +           {
>>> +             value = target->got_plt_section()->address() + got_offset;
>>> +-            this->tls_gd_to_ie(relinfo, relnum, tls_segment, rela,
>>> r_type,
>>> ++            this->tls_gd_to_ie(relinfo, relnum, rela, r_type,
>>> +                                value, view, address, view_size);
>>> +             break;
>>> +           }
>>> +@@ -3800,14 +3798,8 @@ Target_x86_64<size>::Relocate::relocate_tls(
>>> +           }
>>> +         if (optimized_type == tls::TLSOPT_TO_IE)
>>> +           {
>>> +-            if (tls_segment == NULL)
>>> +-              {
>>> +-                gold_assert(parameters->errors()->error_count() > 0
>>> +-                            || issue_undefined_symbol_error(gsym));
>>> +-                return;
>>> +-              }
>>> +             value = target->got_plt_section()->address() + got_offset;
>>> +-            this->tls_desc_gd_to_ie(relinfo, relnum, tls_segment,
>>> ++            this->tls_desc_gd_to_ie(relinfo, relnum,
>>> +                                     rela, r_type, value, view, address,
>>> +                                     view_size);
>>> +             break;
>>> +@@ -3973,7 +3965,6 @@ inline void
>>> + Target_x86_64<size>::Relocate::tls_gd_to_ie(
>>> +     const Relocate_info<size, false>* relinfo,
>>> +     size_t relnum,
>>> +-    Output_segment*,
>>> +     const elfcpp::Rela<size, false>& rela,
>>> +     unsigned int,
>>> +     typename elfcpp::Elf_types<size>::Elf_Addr value,
>>> +@@ -4085,7 +4076,6 @@ inline void
>>> + Target_x86_64<size>::Relocate::tls_desc_gd_to_ie(
>>> +     const Relocate_info<size, false>* relinfo,
>>> +     size_t relnum,
>>> +-    Output_segment*,
>>> +     const elfcpp::Rela<size, false>& rela,
>>> +     unsigned int r_type,
>>> +     typename elfcpp::Elf_types<size>::Elf_Addr value,
>>> +--
>>> +1.7.1
>>> +
>>> --
>>> 2.8.0.rc3
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>

--001a11399e2e69c40f05327daf2b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Yes</p>
<div class=3D"gmail_quote">On May 10, 2016 6:08 AM, &quot;Robert Yang&quot;=
 &lt;<a href=3D"mailto:liezhi.yang@windriver.com">liezhi.yang@windriver.com=
</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Hi Khem,<br>
<br>
What did you mean, please ? I assume ok to backport ?<br>
<br>
// Robert<br>
<br>
On 04/30/2016 04:47 AM, Khem Raj wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
this is ok to install.<br>
<br>
On Wed, Apr 27, 2016 at 2:39 PM, Tristan Van Berkom<br>
&lt;<a href=3D"mailto:tristan.vanberkom@codethink.co.uk" target=3D"_blank">=
tristan.vanberkom@codethink.co.uk</a>&gt; wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
We fail to build webkit on aarch64 due to this binutils bug:<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D=
19353" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/bugzilla=
/show_bug.cgi?id=3D19353</a><br>
<br>
Applying patch which fixes this, stripped out changelog entry<br>
from patch to make it apply without error.<br>
---<br>
=C2=A0 meta/recipes-devtools/binutils/binutils-2.25.1.inc |=C2=A0 =C2=A01 +=
<br>
=C2=A0 ...plying-TLSDESC-relocs-without-TLS-segment.patch | 166 +++++++++++=
++++++++++<br>
=C2=A0 2 files changed, 167 insertions(+)<br>
=C2=A0 create mode 100644 meta/recipes-devtools/binutils/binutils/fix-inter=
nal-error-when-applying-TLSDESC-relocs-without-TLS-segment.patch<br>
<br>
diff --git a/meta/recipes-devtools/binutils/binutils-2.25.1.inc b/meta/reci=
pes-devtools/binutils/binutils-2.25.1.inc<br>
index f3817fa..c7db9e0 100644<br>
--- a/meta/recipes-devtools/binutils/binutils-2.25.1.inc<br>
+++ b/meta/recipes-devtools/binutils/binutils-2.25.1.inc<br>
@@ -35,6 +35,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0015-Fix-dynamic-list-so-that-symbols-not=
-in-the-list-are.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0file://binutils-octeon3.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0file://add-thunderx-support-for-gas.patch \<br>
+=C2=A0 =C2=A0 =C2=A0file://fix-internal-error-when-applying-TLSDESC-relocs=
-without-TLS-segment.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0 S=C2=A0 =3D &quot;${WORKDIR}/git&quot;<br>
<br>
diff --git a/meta/recipes-devtools/binutils/binutils/fix-internal-error-whe=
n-applying-TLSDESC-relocs-without-TLS-segment.patch b/meta/recipes-devtools=
/binutils/binutils/fix-internal-error-when-applying-TLSDESC-relocs-without-=
TLS-segment.patch<br>
new file mode 100644<br>
index 0000000..df9d54c<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/binutils/binutils/fix-internal-error-when-apply=
ing-TLSDESC-relocs-without-TLS-segment.patch<br>
@@ -0,0 +1,166 @@<br>
+From d21f123b0ead1806416cf0dafae12bec4cca8920 Mon Sep 17 00:00:00 2001<br>
+From: Cary Coutant &lt;<a href=3D"mailto:ccoutant@gmail.com" target=3D"_bl=
ank">ccoutant@gmail.com</a>&gt;<br>
+Date: Mon, 11 Jan 2016 23:57:44 -0800<br>
+Subject: [PATCH] Fix internal error when applying TLSDESC relocations with=
 no TLS segment.<br>
+<br>
+gold/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PR gold/19353<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* aarch64.cc (Target_aarch64::relocate_tls): Do=
n&#39;t insist that<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0we have a TLS segment for GD-to-IE optimization=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* i386.cc (Target_i386::tls_gd_to_ie): Remove t=
ls_segment parameter.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Adjust all calls.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Target_i386::tls_desc_gd_to_ie): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Target_i386::relocate_tls): Don&#39;t insist t=
hat we have a TLS segment<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for TLSDESC GD-to-IE optimizations.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* x86_64.cc (Target_x86_64::tls_gd_to_ie): Remo=
ve tls_segment parameter.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Adjust all calls.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Target_x86_64::tls_desc_gd_to_ie): Likewise.<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Target_x86_64::relocate_tls): Don&#39;t insist=
 that we have a TLS segment<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for TLSDESC GD-to-IE optimizations.<br>
+---<br>
+ gold/aarch64.cc |=C2=A0 =C2=A0 6 ------<br>
+ gold/i386.cc=C2=A0 =C2=A0 |=C2=A0 =C2=A014 ++------------<br>
+ gold/x86_64.cc=C2=A0 |=C2=A0 =C2=A014 ++------------<br>
+ 4 files changed, 20 insertions(+), 30 deletions(-)<br>
+<br>
+diff --git a/gold/aarch64.cc b/gold/aarch64.cc<br>
+index 20f2f4f..5ad061b 100644<br>
+--- a/gold/aarch64.cc<br>
++++ b/gold/aarch64.cc<br>
+@@ -7422,12 +7422,6 @@ Target_aarch64&lt;size, big_endian&gt;::Relocate::r=
elocate_tls(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tlsopt =3D=3D tls::TLSOPT_TO_=
IE)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tls_segment =3D=3D N=
ULL)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gold_asser=
t(parameters-&gt;errors()-&gt;error_count() &gt; 0<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || issue_undefined_symbol_error(gsym));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return aar=
ch64_reloc_funcs::STATUS_BAD_RELOC;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return tls_desc_gd_=
to_ie(relinfo, target, rela, r_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 view, ps=
ymval, got_entry_address,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 address)=
;<br>
+diff --git a/gold/i386.cc b/gold/i386.cc<br>
+index 82886d4..a7168a8 100644<br>
+--- a/gold/i386.cc<br>
++++ b/gold/i386.cc<br>
+@@ -668,7 +668,6 @@ class Target_i386 : public Sized_target&lt;32, false&g=
t;<br>
+=C2=A0 =C2=A0 =C2=A0// Do a TLS General-Dynamic to Initial-Exec transition=
.<br>
+=C2=A0 =C2=A0 =C2=A0inline void<br>
+=C2=A0 =C2=A0 =C2=A0tls_gd_to_ie(const Relocate_info&lt;32, false&gt;*, si=
ze_t relnum,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Output_segment* tl=
s_segment,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const elfcpp::Rel&=
lt;32, false&gt;&amp;, unsigned int r_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elfcpp::Elf_types&=
lt;32&gt;::Elf_Addr value,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned char* vie=
w,<br>
+@@ -687,7 +686,6 @@ class Target_i386 : public Sized_target&lt;32, false&g=
t;<br>
+=C2=A0 =C2=A0 =C2=A0// transition.<br>
+=C2=A0 =C2=A0 =C2=A0inline void<br>
+=C2=A0 =C2=A0 =C2=A0tls_desc_gd_to_ie(const Relocate_info&lt;32, false&gt;=
*, size_t relnum,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Out=
put_segment* tls_segment,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0const elfcpp::Rel&lt;32, false&gt;&amp;, unsigned int r_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0elfcpp::Elf_types&lt;32&gt;::Elf_Addr value,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0unsigned char* view,<br>
+@@ -3054,7 +3052,7 @@ Target_i386::Relocate::relocate_tls(const Relocate_i=
nfo&lt;32, false&gt;* relinfo,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (optimized_type =3D=3D tls::TLSOPT_TO=
_IE)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;tls_gd_to_ie(relinfo, =
relnum, tls_segment, rel, r_type,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;tls_gd_to_ie(relinfo, =
relnum, rel, r_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 got_offset, view, view_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -3116,13 +3114,7 @@ Target_i386::Relocate::relocate_tls(const Relocate_=
info&lt;32, false&gt;* relinfo,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (optimized_type =3D=3D tls::TLSOPT_TO=
_IE)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tls_segment =3D=3D NULL)<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gold_assert(param=
eters-&gt;errors()-&gt;error_count() &gt; 0<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 || issue_undefined_symbol_error(gsym));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;tls_desc_gd_to_ie(reli=
nfo, relnum, tls_segment, rel, r_type,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;tls_desc_gd_to_ie(reli=
nfo, relnum, rel, r_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0got_offset, view=
, view_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -3354,7 +3346,6 @@ Target_i386::Relocate::tls_gd_to_le(const Relocate_i=
nfo&lt;32, false&gt;* relinfo,<br>
+ inline void<br>
+ Target_i386::Relocate::tls_gd_to_ie(const Relocate_info&lt;32, false&gt;*=
 relinfo,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t relnum,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Output_segment*,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const elfcpp::Rel&lt;32=
, false&gt;&amp; rel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elfcpp::Elf_types&lt;32=
&gt;::Elf_Addr value,<br>
+@@ -3449,7 +3440,6 @@ inline void<br>
+ Target_i386::Relocate::tls_desc_gd_to_ie(<br>
+=C2=A0 =C2=A0 =C2=A0const Relocate_info&lt;32, false&gt;* relinfo,<br>
+=C2=A0 =C2=A0 =C2=A0size_t relnum,<br>
+-=C2=A0 =C2=A0 Output_segment*,<br>
+=C2=A0 =C2=A0 =C2=A0const elfcpp::Rel&lt;32, false&gt;&amp; rel,<br>
+=C2=A0 =C2=A0 =C2=A0unsigned int r_type,<br>
+=C2=A0 =C2=A0 =C2=A0elfcpp::Elf_types&lt;32&gt;::Elf_Addr value,<br>
+diff --git a/gold/x86_64.cc b/gold/x86_64.cc<br>
+index 3cfc064..4ad5afc 100644<br>
+--- a/gold/x86_64.cc<br>
++++ b/gold/x86_64.cc<br>
+@@ -816,7 +816,6 @@ class Target_x86_64 : public Sized_target&lt;size, fal=
se&gt;<br>
+=C2=A0 =C2=A0 =C2=A0// Do a TLS General-Dynamic to Initial-Exec transition=
.<br>
+=C2=A0 =C2=A0 =C2=A0inline void<br>
+=C2=A0 =C2=A0 =C2=A0tls_gd_to_ie(const Relocate_info&lt;size, false&gt;*, =
size_t relnum,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Output_segment* tl=
s_segment,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const elfcpp::Rela=
&lt;size, false&gt;&amp;, unsigned int r_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typename elfcpp::E=
lf_types&lt;size&gt;::Elf_Addr value,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned char* vie=
w,<br>
+@@ -835,7 +834,6 @@ class Target_x86_64 : public Sized_target&lt;size, fal=
se&gt;<br>
+=C2=A0 =C2=A0 =C2=A0// Do a TLSDESC-style General-Dynamic to Initial-Exec =
transition.<br>
+=C2=A0 =C2=A0 =C2=A0inline void<br>
+=C2=A0 =C2=A0 =C2=A0tls_desc_gd_to_ie(const Relocate_info&lt;size, false&g=
t;*, size_t relnum,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Out=
put_segment* tls_segment,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0const elfcpp::Rela&lt;size, false&gt;&amp;, unsigned int r_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0typename elfcpp::Elf_types&lt;size&gt;::Elf_Addr value,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0unsigned char* view,<br>
+@@ -3733,7 +3731,7 @@ Target_x86_64&lt;size&gt;::Relocate::relocate_tls(<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (optimized_type =3D=3D tls::TLSOPT_TO=
_IE)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D target-&gt;got_p=
lt_section()-&gt;address() + got_offset;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;tls_gd_to_ie(relinfo, =
relnum, tls_segment, rela, r_type,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;tls_gd_to_ie(relinfo, =
relnum, rela, r_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value, view, address, view_size);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -3800,14 +3798,8 @@ Target_x86_64&lt;size&gt;::Relocate::relocate_tls(<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (optimized_type =3D=3D tls::TLSOPT_TO=
_IE)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tls_segment =3D=3D NULL)<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gold_assert(param=
eters-&gt;errors()-&gt;error_count() &gt; 0<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 || issue_undefined_symbol_error(gsym));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D target-&gt;got_p=
lt_section()-&gt;address() + got_offset;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;tls_desc_gd_to_ie(reli=
nfo, relnum, tls_segment,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;tls_desc_gd_to_ie(reli=
nfo, relnum,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rela, r_type, va=
lue, view, address,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0view_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+@@ -3973,7 +3965,6 @@ inline void<br>
+ Target_x86_64&lt;size&gt;::Relocate::tls_gd_to_ie(<br>
+=C2=A0 =C2=A0 =C2=A0const Relocate_info&lt;size, false&gt;* relinfo,<br>
+=C2=A0 =C2=A0 =C2=A0size_t relnum,<br>
+-=C2=A0 =C2=A0 Output_segment*,<br>
+=C2=A0 =C2=A0 =C2=A0const elfcpp::Rela&lt;size, false&gt;&amp; rela,<br>
+=C2=A0 =C2=A0 =C2=A0unsigned int,<br>
+=C2=A0 =C2=A0 =C2=A0typename elfcpp::Elf_types&lt;size&gt;::Elf_Addr value=
,<br>
+@@ -4085,7 +4076,6 @@ inline void<br>
+ Target_x86_64&lt;size&gt;::Relocate::tls_desc_gd_to_ie(<br>
+=C2=A0 =C2=A0 =C2=A0const Relocate_info&lt;size, false&gt;* relinfo,<br>
+=C2=A0 =C2=A0 =C2=A0size_t relnum,<br>
+-=C2=A0 =C2=A0 Output_segment*,<br>
+=C2=A0 =C2=A0 =C2=A0const elfcpp::Rela&lt;size, false&gt;&amp; rela,<br>
+=C2=A0 =C2=A0 =C2=A0unsigned int r_type,<br>
+=C2=A0 =C2=A0 =C2=A0typename elfcpp::Elf_types&lt;size&gt;::Elf_Addr value=
,<br>
+--<br>
+1.7.1<br>
+<br>
--<br>
2.8.0.rc3<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></blockquote>
</blockquote></div>

--001a11399e2e69c40f05327daf2b--
