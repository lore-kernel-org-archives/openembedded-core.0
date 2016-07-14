Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 086256FFE2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 22:01:29 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id q2so5149679pap.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 15:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=yVNhuUBxojdPrPV0TyrusHagOXyjqWz/LAg+lcSRBP4=;
	b=JWhe8gOp+VJhPsphFrFR7aIENzWe2nc3wlv6VGIrdmPsx5H4sEVpE0tNVGVVyYwPQg
	uMlgvGFHynGDIm6mHWnKr6YB2c9AIEh498e1RJeTybSOZIO81FUV9ykaG9OXEUx/IOGE
	J45TFx9SD9zbzAEZ85iTFg4X1G89ZMXoevZLr69bwZ5qoG5KA2Y8MrP0X5GzP60LzH+O
	5R/kmmCZxyE2QxQ+MglVlOIo/IgKChK4j9SSRktDnUiOB7+xaWycC/1QzRHWtnBfsEQs
	7qafMCjTsyVa4CWgo9y6r8Edw0tO35ldVVXFQWbpAS89i5ZjaVFLN28RxNFY/HfrHn3u
	Cg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=yVNhuUBxojdPrPV0TyrusHagOXyjqWz/LAg+lcSRBP4=;
	b=VafwwnfTxT5ciyCR3qSq6SSaNiMRlxSQrgdS29xU4VsAgeXle/QDtyMFllkR/frmHi
	vE2LDfyCclTb0h1fYUbVQVhnXkyiwIhevfJyAO4H0StUbF10kBFRlVUwCM4ycIuKrOpp
	tCnMekJMqyna39OrgSICgWLK3Qnv+yMhE14tlEH0Ec1ajluPPOMqEb9rnDdGYPioNiPD
	2Tz2piTs+zxVkKYKVONRzmXUO5XtR9qwvJigC4o3egYtT7tzxeTMv15asREY3NN/+S6W
	WNB97LzypJ58EMh2VRUYsxnMJxe7Gbci+03m3vF4bTwG18zEw9ie9D4gk5d2R0ZzH7Ea
	yRAw==
X-Gm-Message-State: ALyK8tKym1djBdzawPQIhQ2EzORuzxivfJ7BEcbAveXTPhD+29YBWOuSbXGGfJHVs22JcA==
X-Received: by 10.66.253.38 with SMTP id zx6mr26306393pac.19.1468533690123;
	Thu, 14 Jul 2016 15:01:30 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:cc93:e3c4:4659:ad1c?
	([2601:646:8882:b8c:cc93:e3c4:4659:ad1c])
	by smtp.gmail.com with ESMTPSA id t1sm4473648pfa.86.2016.07.14.15.01.28
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jul 2016 15:01:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1468526377-32121-1-git-send-email-ross.burton@intel.com>
Date: Thu, 14 Jul 2016 15:01:24 -0700
Message-Id: <64EEA74C-7012-414F-AC0E-1644D7895A4A@gmail.com>
References: <1468526377-32121-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] binutils: backport fix for TLSDESC relocations with no TLS segment on arch64
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
X-List-Received-Date: Thu, 14 Jul 2016 22:01:30 -0000
X-Groupsio-MsgNum: 84519
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0FA4839A-36DE-4659-940C-EFBD5B1914C0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0FA4839A-36DE-4659-940C-EFBD5B1914C0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 14, 2016, at 12:59 PM, Ross Burton <ross.burton@intel.com> =
wrote:
>=20
> As exposed by WebKit on aarch64 hosts, which causes binutils to throw =
an
> internal error.
>=20
> [ YOCTO #9509 ]

This is ok

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> meta/recipes-devtools/binutils/binutils-2.26.inc   |   1 +
> .../binutils/binutils/aarch64-tls.patch            | 177 =
+++++++++++++++++++++
> 2 files changed, 178 insertions(+)
> create mode 100644 =
meta/recipes-devtools/binutils/binutils/aarch64-tls.patch
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils-2.26.inc =
b/meta/recipes-devtools/binutils/binutils-2.26.inc
> index 82cb7f5..1f7bee2 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.26.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.26.inc
> @@ -35,6 +35,7 @@ SRC_URI =3D "\
>      =
file://0013-Fix-GOT-address-computations-in-initial-PLT-entries-.patch \
>      file://0014-Correct-nios2-_gp-address-computation.patch \
>      =
file://0015-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
> +     file://aarch64-tls.patch \
> "
> S  =3D "${WORKDIR}/git"
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils/aarch64-tls.patch =
b/meta/recipes-devtools/binutils/binutils/aarch64-tls.patch
> new file mode 100644
> index 0000000..6b123ac
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/aarch64-tls.patch
> @@ -0,0 +1,177 @@
> +Building WebKit on an aarch64 host will fail:
> +
> +gold/ld-new: internal error in relocate_tls, at =
../../binutils/gold/aarch64.cc:7418
> +
> +This was a binutils bug, so backport the fix.
> +
> +https://sourceware.org/bugzilla/show_bug.cgi?id=3D19353
> +
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +=46rom d21f123b0ead1806416cf0dafae12bec4cca8920 Mon Sep 17 00:00:00 =
2001
> +From: Cary Coutant <ccoutant@gmail.com>
> +Date: Mon, 11 Jan 2016 23:57:44 -0800
> +Subject: [PATCH] Fix internal error when applying TLSDESC relocations =
with no TLS segment.
> +
> +gold/
> +	PR gold/19353
> +	* aarch64.cc (Target_aarch64::relocate_tls): Don't insist that
> +	we have a TLS segment for GD-to-IE optimization.
> +	* i386.cc (Target_i386::tls_gd_to_ie): Remove tls_segment =
parameter.
> +	Adjust all calls.
> +	(Target_i386::tls_desc_gd_to_ie): Likewise.
> +	(Target_i386::relocate_tls): Don't insist that we have a TLS =
segment
> +	for TLSDESC GD-to-IE optimizations.
> +	* x86_64.cc (Target_x86_64::tls_gd_to_ie): Remove tls_segment =
parameter.
> +	Adjust all calls.
> +	(Target_x86_64::tls_desc_gd_to_ie): Likewise.
> +	(Target_x86_64::relocate_tls): Don't insist that we have a TLS =
segment
> +	for TLSDESC GD-to-IE optimizations.
> +---
> + gold/ChangeLog  |   16 ++++++++++++++++
> + gold/aarch64.cc |    6 ------
> + gold/i386.cc    |   14 ++------------
> + gold/x86_64.cc  |   14 ++------------
> + 4 files changed, 20 insertions(+), 30 deletions(-)
> +
> +diff --git a/gold/aarch64.cc b/gold/aarch64.cc
> +index 20f2f4f..5ad061b 100644
> +--- a/gold/aarch64.cc
> ++++ b/gold/aarch64.cc
> +@@ -7422,12 +7422,6 @@ Target_aarch64<size, =
big_endian>::Relocate::relocate_tls(
> + 	      }
> + 	    if (tlsopt =3D=3D tls::TLSOPT_TO_IE)
> + 	      {
> +-		if (tls_segment =3D=3D NULL)
> +-		  {
> +-		    gold_assert(parameters->errors()->error_count() > 0
> +-				|| issue_undefined_symbol_error(gsym));
> +-		    return aarch64_reloc_funcs::STATUS_BAD_RELOC;
> +-		  }
> + 		return tls_desc_gd_to_ie(relinfo, target, rela, r_type,
> + 					 view, psymval, =
got_entry_address,
> + 					 address);
> +diff --git a/gold/i386.cc b/gold/i386.cc
> +index 82886d4..a7168a8 100644
> +--- a/gold/i386.cc
> ++++ b/gold/i386.cc
> +@@ -668,7 +668,6 @@ class Target_i386 : public Sized_target<32, =
false>
> +     // Do a TLS General-Dynamic to Initial-Exec transition.
> +     inline void
> +     tls_gd_to_ie(const Relocate_info<32, false>*, size_t relnum,
> +-		 Output_segment* tls_segment,
> + 		 const elfcpp::Rel<32, false>&, unsigned int r_type,
> + 		 elfcpp::Elf_types<32>::Elf_Addr value,
> + 		 unsigned char* view,
> +@@ -687,7 +686,6 @@ class Target_i386 : public Sized_target<32, =
false>
> +     // transition.
> +     inline void
> +     tls_desc_gd_to_ie(const Relocate_info<32, false>*, size_t =
relnum,
> +-		      Output_segment* tls_segment,
> + 		      const elfcpp::Rel<32, false>&, unsigned int =
r_type,
> + 		      elfcpp::Elf_types<32>::Elf_Addr value,
> + 		      unsigned char* view,
> +@@ -3054,7 +3052,7 @@ Target_i386::Relocate::relocate_tls(const =
Relocate_info<32, false>* relinfo,
> + 	    }
> + 	  if (optimized_type =3D=3D tls::TLSOPT_TO_IE)
> + 	    {
> +-	      this->tls_gd_to_ie(relinfo, relnum, tls_segment, rel, =
r_type,
> ++	      this->tls_gd_to_ie(relinfo, relnum, rel, r_type,
> + 				 got_offset, view, view_size);
> + 	      break;
> + 	    }
> +@@ -3116,13 +3114,7 @@ Target_i386::Relocate::relocate_tls(const =
Relocate_info<32, false>* relinfo,
> + 	    }
> + 	  if (optimized_type =3D=3D tls::TLSOPT_TO_IE)
> + 	    {
> +-	      if (tls_segment =3D=3D NULL)
> +-		{
> +-		  gold_assert(parameters->errors()->error_count() > 0
> +-			      || issue_undefined_symbol_error(gsym));
> +-		  return;
> +-		}
> +-	      this->tls_desc_gd_to_ie(relinfo, relnum, tls_segment, rel, =
r_type,
> ++	      this->tls_desc_gd_to_ie(relinfo, relnum, rel, r_type,
> + 				      got_offset, view, view_size);
> + 	      break;
> + 	    }
> +@@ -3354,7 +3346,6 @@ Target_i386::Relocate::tls_gd_to_le(const =
Relocate_info<32, false>* relinfo,
> + inline void
> + Target_i386::Relocate::tls_gd_to_ie(const Relocate_info<32, false>* =
relinfo,
> + 				    size_t relnum,
> +-				    Output_segment*,
> + 				    const elfcpp::Rel<32, false>& rel,
> + 				    unsigned int,
> + 				    elfcpp::Elf_types<32>::Elf_Addr =
value,
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
> +@@ -816,7 +816,6 @@ class Target_x86_64 : public Sized_target<size, =
false>
> +     // Do a TLS General-Dynamic to Initial-Exec transition.
> +     inline void
> +     tls_gd_to_ie(const Relocate_info<size, false>*, size_t relnum,
> +-		 Output_segment* tls_segment,
> + 		 const elfcpp::Rela<size, false>&, unsigned int r_type,
> + 		 typename elfcpp::Elf_types<size>::Elf_Addr value,
> + 		 unsigned char* view,
> +@@ -835,7 +834,6 @@ class Target_x86_64 : public Sized_target<size, =
false>
> +     // Do a TLSDESC-style General-Dynamic to Initial-Exec =
transition.
> +     inline void
> +     tls_desc_gd_to_ie(const Relocate_info<size, false>*, size_t =
relnum,
> +-		      Output_segment* tls_segment,
> + 		      const elfcpp::Rela<size, false>&, unsigned int =
r_type,
> + 		      typename elfcpp::Elf_types<size>::Elf_Addr value,
> + 		      unsigned char* view,
> +@@ -3733,7 +3731,7 @@ Target_x86_64<size>::Relocate::relocate_tls(
> + 	  if (optimized_type =3D=3D tls::TLSOPT_TO_IE)
> + 	    {
> + 	      value =3D target->got_plt_section()->address() + =
got_offset;
> +-	      this->tls_gd_to_ie(relinfo, relnum, tls_segment, rela, =
r_type,
> ++	      this->tls_gd_to_ie(relinfo, relnum, rela, r_type,
> + 				 value, view, address, view_size);
> + 	      break;
> + 	    }
> +@@ -3800,14 +3798,8 @@ Target_x86_64<size>::Relocate::relocate_tls(
> + 	    }
> + 	  if (optimized_type =3D=3D tls::TLSOPT_TO_IE)
> + 	    {
> +-	      if (tls_segment =3D=3D NULL)
> +-		{
> +-		  gold_assert(parameters->errors()->error_count() > 0
> +-			      || issue_undefined_symbol_error(gsym));
> +-		  return;
> +-		}
> + 	      value =3D target->got_plt_section()->address() + =
got_offset;
> +-	      this->tls_desc_gd_to_ie(relinfo, relnum, tls_segment,
> ++	      this->tls_desc_gd_to_ie(relinfo, relnum,
> + 				      rela, r_type, value, view, =
address,
> + 				      view_size);
> + 	      break;
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
> --
> 2.8.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_0FA4839A-36DE-4659-940C-EFBD5B1914C0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleIC7cACgkQuwUzVZGdMxTmEACfefez0/MYK4m+FXH93Ug/DnJA
MAoAoIPcxdWXxkdpnOPGpdidrzq1+vdH
=amNi
-----END PGP SIGNATURE-----

--Apple-Mail=_0FA4839A-36DE-4659-940C-EFBD5B1914C0--
