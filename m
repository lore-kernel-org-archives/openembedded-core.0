Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1889B73167
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 20:47:50 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id r184so51137387qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 13:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K4G/NVk9we7VFJIyUP0lpC/2t+0F+SUvF3wXZWzFkBk=;
	b=JGpN1CQnk2HCnakHGD9blUVZhL3iMyw2OPSf9SSvFkQIQhfTXA5OTiePyd7R9mQ5Qf
	nlGFHURK6BjgZc9Zp+jEI9SwGfMgcXlHjMsU6cIJIKw3q7XT8mDcie5xlX0vzEkBE0MK
	zd0zrdZN0hRaTxWC6iFf9vcbNHhm9Xg8CqcOWQ16VxY7ZBYkims34g0dDA5W6ltYKn03
	fHf7zHBJOXQPa2xVWHQiKz9NyjY89Ml0/y4iKFN/kVsCZlTI85N6V4t0GUfNVvBmt3lU
	UbIzVbCgCVPhy0ZcPw1kTEo3m8d8kyc1cCyjLGWlHs2Jf3s8ozPcOvXsnC3HuTPWK00g
	qjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K4G/NVk9we7VFJIyUP0lpC/2t+0F+SUvF3wXZWzFkBk=;
	b=GknviS6duJ3/LVd4z4APEYGmp1IAuQRpNHc2XeIqYCWcyXy16dylbKS0A6sWRZyxAm
	/nciIEbLoaZSSMfk0OJd75egyO/Ja+DiXZUpBRyKDYsAnyJp6SfHcbmWyONTh9oDUK4U
	7SYnK+LrP/YgqdviOS3bWk60mGCfJTGJgV70ciOaXCZ/KkWV8mWwf46uBUsVBczLG7ht
	88xjydnXhYoUIzR6fpVlomPCd4x/xDhWoj0KkK6F3OW5c6ncnYpJGtVDFskF0Trl7VA3
	JcF59HjSOv2S6lsStVfSsCAHzVR2IMGgQC4zXyd8/jPR1untDVs/MZYfKZU8mbdMtCX7
	fHkQ==
X-Gm-Message-State: AOPr4FUMLQVIypgXM80DsooZn7uOfh+rjCQW8HjiWthk8HzhoxOwDihRMnql4JfnJ5foUmjTyXypnCLidon9xw==
X-Received: by 10.55.200.137 with SMTP id t9mr22944451qkl.41.1461962871558;
	Fri, 29 Apr 2016 13:47:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Fri, 29 Apr 2016 13:47:22 -0700 (PDT)
In-Reply-To: <1461793180-7861-1-git-send-email-tristan.vanberkom@codethink.co.uk>
References: <1461793180-7861-1-git-send-email-tristan.vanberkom@codethink.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Apr 2016 13:47:22 -0700
Message-ID: <CAMKF1sqp-kXUScfm5aZt2YeATAUQTmw77sgMAVtqm+tWVZWUqA@mail.gmail.com>
To: Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>
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
X-List-Received-Date: Fri, 29 Apr 2016 20:47:51 -0000
Content-Type: text/plain; charset=UTF-8

this is ok to install.

On Wed, Apr 27, 2016 at 2:39 PM, Tristan Van Berkom
<tristan.vanberkom@codethink.co.uk> wrote:
> We fail to build webkit on aarch64 due to this binutils bug:
>
>    https://sourceware.org/bugzilla/show_bug.cgi?id=19353
>
> Applying patch which fixes this, stripped out changelog entry
> from patch to make it apply without error.
> ---
>  meta/recipes-devtools/binutils/binutils-2.25.1.inc |   1 +
>  ...plying-TLSDESC-relocs-without-TLS-segment.patch | 166 +++++++++++++++++++++
>  2 files changed, 167 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/fix-internal-error-when-applying-TLSDESC-relocs-without-TLS-segment.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.25.1.inc b/meta/recipes-devtools/binutils/binutils-2.25.1.inc
> index f3817fa..c7db9e0 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.25.1.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.25.1.inc
> @@ -35,6 +35,7 @@ SRC_URI = "\
>       file://0015-Fix-dynamic-list-so-that-symbols-not-in-the-list-are.patch \
>       file://binutils-octeon3.patch \
>       file://add-thunderx-support-for-gas.patch \
> +     file://fix-internal-error-when-applying-TLSDESC-relocs-without-TLS-segment.patch \
>       "
>  S  = "${WORKDIR}/git"
>
> diff --git a/meta/recipes-devtools/binutils/binutils/fix-internal-error-when-applying-TLSDESC-relocs-without-TLS-segment.patch b/meta/recipes-devtools/binutils/binutils/fix-internal-error-when-applying-TLSDESC-relocs-without-TLS-segment.patch
> new file mode 100644
> index 0000000..df9d54c
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/fix-internal-error-when-applying-TLSDESC-relocs-without-TLS-segment.patch
> @@ -0,0 +1,166 @@
> +From d21f123b0ead1806416cf0dafae12bec4cca8920 Mon Sep 17 00:00:00 2001
> +From: Cary Coutant <ccoutant@gmail.com>
> +Date: Mon, 11 Jan 2016 23:57:44 -0800
> +Subject: [PATCH] Fix internal error when applying TLSDESC relocations with no TLS segment.
> +
> +gold/
> +       PR gold/19353
> +       * aarch64.cc (Target_aarch64::relocate_tls): Don't insist that
> +       we have a TLS segment for GD-to-IE optimization.
> +       * i386.cc (Target_i386::tls_gd_to_ie): Remove tls_segment parameter.
> +       Adjust all calls.
> +       (Target_i386::tls_desc_gd_to_ie): Likewise.
> +       (Target_i386::relocate_tls): Don't insist that we have a TLS segment
> +       for TLSDESC GD-to-IE optimizations.
> +       * x86_64.cc (Target_x86_64::tls_gd_to_ie): Remove tls_segment parameter.
> +       Adjust all calls.
> +       (Target_x86_64::tls_desc_gd_to_ie): Likewise.
> +       (Target_x86_64::relocate_tls): Don't insist that we have a TLS segment
> +       for TLSDESC GD-to-IE optimizations.
> +---
> + gold/aarch64.cc |    6 ------
> + gold/i386.cc    |   14 ++------------
> + gold/x86_64.cc  |   14 ++------------
> + 4 files changed, 20 insertions(+), 30 deletions(-)
> +
> +diff --git a/gold/aarch64.cc b/gold/aarch64.cc
> +index 20f2f4f..5ad061b 100644
> +--- a/gold/aarch64.cc
> ++++ b/gold/aarch64.cc
> +@@ -7422,12 +7422,6 @@ Target_aarch64<size, big_endian>::Relocate::relocate_tls(
> +             }
> +           if (tlsopt == tls::TLSOPT_TO_IE)
> +             {
> +-              if (tls_segment == NULL)
> +-                {
> +-                  gold_assert(parameters->errors()->error_count() > 0
> +-                              || issue_undefined_symbol_error(gsym));
> +-                  return aarch64_reloc_funcs::STATUS_BAD_RELOC;
> +-                }
> +               return tls_desc_gd_to_ie(relinfo, target, rela, r_type,
> +                                        view, psymval, got_entry_address,
> +                                        address);
> +diff --git a/gold/i386.cc b/gold/i386.cc
> +index 82886d4..a7168a8 100644
> +--- a/gold/i386.cc
> ++++ b/gold/i386.cc
> +@@ -668,7 +668,6 @@ class Target_i386 : public Sized_target<32, false>
> +     // Do a TLS General-Dynamic to Initial-Exec transition.
> +     inline void
> +     tls_gd_to_ie(const Relocate_info<32, false>*, size_t relnum,
> +-               Output_segment* tls_segment,
> +                const elfcpp::Rel<32, false>&, unsigned int r_type,
> +                elfcpp::Elf_types<32>::Elf_Addr value,
> +                unsigned char* view,
> +@@ -687,7 +686,6 @@ class Target_i386 : public Sized_target<32, false>
> +     // transition.
> +     inline void
> +     tls_desc_gd_to_ie(const Relocate_info<32, false>*, size_t relnum,
> +-                    Output_segment* tls_segment,
> +                     const elfcpp::Rel<32, false>&, unsigned int r_type,
> +                     elfcpp::Elf_types<32>::Elf_Addr value,
> +                     unsigned char* view,
> +@@ -3054,7 +3052,7 @@ Target_i386::Relocate::relocate_tls(const Relocate_info<32, false>* relinfo,
> +           }
> +         if (optimized_type == tls::TLSOPT_TO_IE)
> +           {
> +-            this->tls_gd_to_ie(relinfo, relnum, tls_segment, rel, r_type,
> ++            this->tls_gd_to_ie(relinfo, relnum, rel, r_type,
> +                                got_offset, view, view_size);
> +             break;
> +           }
> +@@ -3116,13 +3114,7 @@ Target_i386::Relocate::relocate_tls(const Relocate_info<32, false>* relinfo,
> +           }
> +         if (optimized_type == tls::TLSOPT_TO_IE)
> +           {
> +-            if (tls_segment == NULL)
> +-              {
> +-                gold_assert(parameters->errors()->error_count() > 0
> +-                            || issue_undefined_symbol_error(gsym));
> +-                return;
> +-              }
> +-            this->tls_desc_gd_to_ie(relinfo, relnum, tls_segment, rel, r_type,
> ++            this->tls_desc_gd_to_ie(relinfo, relnum, rel, r_type,
> +                                     got_offset, view, view_size);
> +             break;
> +           }
> +@@ -3354,7 +3346,6 @@ Target_i386::Relocate::tls_gd_to_le(const Relocate_info<32, false>* relinfo,
> + inline void
> + Target_i386::Relocate::tls_gd_to_ie(const Relocate_info<32, false>* relinfo,
> +                                   size_t relnum,
> +-                                  Output_segment*,
> +                                   const elfcpp::Rel<32, false>& rel,
> +                                   unsigned int,
> +                                   elfcpp::Elf_types<32>::Elf_Addr value,
> +@@ -3449,7 +3440,6 @@ inline void
> + Target_i386::Relocate::tls_desc_gd_to_ie(
> +     const Relocate_info<32, false>* relinfo,
> +     size_t relnum,
> +-    Output_segment*,
> +     const elfcpp::Rel<32, false>& rel,
> +     unsigned int r_type,
> +     elfcpp::Elf_types<32>::Elf_Addr value,
> +diff --git a/gold/x86_64.cc b/gold/x86_64.cc
> +index 3cfc064..4ad5afc 100644
> +--- a/gold/x86_64.cc
> ++++ b/gold/x86_64.cc
> +@@ -816,7 +816,6 @@ class Target_x86_64 : public Sized_target<size, false>
> +     // Do a TLS General-Dynamic to Initial-Exec transition.
> +     inline void
> +     tls_gd_to_ie(const Relocate_info<size, false>*, size_t relnum,
> +-               Output_segment* tls_segment,
> +                const elfcpp::Rela<size, false>&, unsigned int r_type,
> +                typename elfcpp::Elf_types<size>::Elf_Addr value,
> +                unsigned char* view,
> +@@ -835,7 +834,6 @@ class Target_x86_64 : public Sized_target<size, false>
> +     // Do a TLSDESC-style General-Dynamic to Initial-Exec transition.
> +     inline void
> +     tls_desc_gd_to_ie(const Relocate_info<size, false>*, size_t relnum,
> +-                    Output_segment* tls_segment,
> +                     const elfcpp::Rela<size, false>&, unsigned int r_type,
> +                     typename elfcpp::Elf_types<size>::Elf_Addr value,
> +                     unsigned char* view,
> +@@ -3733,7 +3731,7 @@ Target_x86_64<size>::Relocate::relocate_tls(
> +         if (optimized_type == tls::TLSOPT_TO_IE)
> +           {
> +             value = target->got_plt_section()->address() + got_offset;
> +-            this->tls_gd_to_ie(relinfo, relnum, tls_segment, rela, r_type,
> ++            this->tls_gd_to_ie(relinfo, relnum, rela, r_type,
> +                                value, view, address, view_size);
> +             break;
> +           }
> +@@ -3800,14 +3798,8 @@ Target_x86_64<size>::Relocate::relocate_tls(
> +           }
> +         if (optimized_type == tls::TLSOPT_TO_IE)
> +           {
> +-            if (tls_segment == NULL)
> +-              {
> +-                gold_assert(parameters->errors()->error_count() > 0
> +-                            || issue_undefined_symbol_error(gsym));
> +-                return;
> +-              }
> +             value = target->got_plt_section()->address() + got_offset;
> +-            this->tls_desc_gd_to_ie(relinfo, relnum, tls_segment,
> ++            this->tls_desc_gd_to_ie(relinfo, relnum,
> +                                     rela, r_type, value, view, address,
> +                                     view_size);
> +             break;
> +@@ -3973,7 +3965,6 @@ inline void
> + Target_x86_64<size>::Relocate::tls_gd_to_ie(
> +     const Relocate_info<size, false>* relinfo,
> +     size_t relnum,
> +-    Output_segment*,
> +     const elfcpp::Rela<size, false>& rela,
> +     unsigned int,
> +     typename elfcpp::Elf_types<size>::Elf_Addr value,
> +@@ -4085,7 +4076,6 @@ inline void
> + Target_x86_64<size>::Relocate::tls_desc_gd_to_ie(
> +     const Relocate_info<size, false>* relinfo,
> +     size_t relnum,
> +-    Output_segment*,
> +     const elfcpp::Rela<size, false>& rela,
> +     unsigned int r_type,
> +     typename elfcpp::Elf_types<size>::Elf_Addr value,
> +--
> +1.7.1
> +
> --
> 2.8.0.rc3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

