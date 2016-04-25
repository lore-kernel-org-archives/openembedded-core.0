Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id A0EE66067C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 20:55:52 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id y69so51509153pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 13:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=phXiKIrAFjqncWS6KFVbfoDmk2h7cWC88BrdXnT6EIE=;
	b=MtutMOeRp2kOrAtnVWuagvBvX3FL+DXFIUHCW5DLDHtY6J7djffqGKOh6rPdG+H97N
	LxPILNZO7YG89ypHU4YOowZG818OAkGG3QPswCEPDnPPkGILVhWRYryXBrZYggtOf8sr
	r7nsAjk7xqC3KdvknrM1xobS++Jyb/OJekKLAtzReDDaFOKgEXsLMy1QYztftdScymfr
	Vl/7tAbtRVNBtCVip2Rbu8NJgP7ZfqZ/lHHTdt/ofk32Mfuv1M4MdZPHZYzL+5WdCp6q
	H/7ZcCVMch/5Ox1Fp5sW4A7VibvQhDSF6QhSzMfdZksntfzE4UWFUa+r9mpZBgS3XcH1
	ryVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=phXiKIrAFjqncWS6KFVbfoDmk2h7cWC88BrdXnT6EIE=;
	b=ELZAwSwjVcmmtaMg3ETu2g+bbeOMKEkOsSBOlrAv49HcxZuj39UAA1NpcwUSEsuwb6
	mXco7SNGZGhfwq4b1D0rLs3KcleZuQgTFOSOei8AnBFerHakMLD9lQnkk2LB8hqPeE1M
	0UWSO8KLuIvmhVSoauvntU9eX1mgJ2BYYdtcpPMfcbLbRMVlPIBcWgPXii4owyJqw/6w
	aDa+npNr4f41jeMso9kKJVehCpPUHi51PGO7UyDAosRCEgIf+gs/JkYZPh4dlTEa4wXy
	D3oj1P7gcyL5Z+UjxvHHQAO7k8+gU3SqzPN/7iTbIJXB3YmdBVsue0E3mZD7sTmIxzGc
	loTA==
X-Gm-Message-State: AOPr4FWywrIoQbhzTdum6C1yrfrVGnOLrK4aByN9iSeW+Pgm8FqMsJZGhHcsMteKuo/Y2A==
X-Received: by 10.98.21.131 with SMTP id 125mr42318016pfv.92.1461617753570;
	Mon, 25 Apr 2016 13:55:53 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:d002:4b31:2124:3a01?
	([2601:646:8800:5a9a:d002:4b31:2124:3a01])
	by smtp.gmail.com with ESMTPSA id
	we8sm32272485pac.29.2016.04.25.13.55.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2016 13:55:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1461617044-25526-3-git-send-email-tristan.vanberkom@codethink.co.uk>
Date: Mon, 25 Apr 2016 13:55:48 -0700
Message-Id: <C2525670-C153-4CFC-B911-0567821B899B@gmail.com>
References: <1461617044-25526-1-git-send-email-tristan.vanberkom@codethink.co.uk>
	<1461617044-25526-3-git-send-email-tristan.vanberkom@codethink.co.uk>
To: Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] Backporting binutils bug fix to the 2.25 branch
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
X-List-Received-Date: Mon, 25 Apr 2016 20:55:55 -0000
X-Groupsio-MsgNum: 81228
Content-Type: multipart/signed;
	boundary="Apple-Mail=_34F64536-5A76-4F4B-A834-9339C84520A3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_34F64536-5A76-4F4B-A834-9339C84520A3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Apr 25, 2016, at 1:44 PM, Tristan Van Berkom =
<tristan.vanberkom@codethink.co.uk> wrote:
>=20
> We fail to build webkit on aarch64 due to this binutils bug:
>=20
>   https://sourceware.org/bugzilla/show_bug.cgi?id=3D19353
>=20
> Applying patch which fixes this, stripped out changelog entry
> from patch to make it apply without error.


which branch are you proposing this for?
we use 2.26 on master

> ---
> meta/recipes-devtools/binutils/binutils-2.25.1.inc |   1 +
> ...plying-TLSDESC-relocs-without-TLS-segment.patch | 166 =
+++++++++++++++++++++
> 2 files changed, 167 insertions(+)
> create mode 100644 =
meta/recipes-devtools/binutils/binutils/fix-internal-error-when-applying-T=
LSDESC-relocs-without-TLS-segment.patch
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils-2.25.1.inc =
b/meta/recipes-devtools/binutils/binutils-2.25.1.inc
> index f3817fa..c7db9e0 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.25.1.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.25.1.inc
> @@ -35,6 +35,7 @@ SRC_URI =3D "\
>      =
file://0015-Fix-dynamic-list-so-that-symbols-not-in-the-list-are.patch \
>      file://binutils-octeon3.patch \
>      file://add-thunderx-support-for-gas.patch \
> +     =
file://fix-internal-error-when-applying-TLSDESC-relocs-without-TLS-segment=
.patch \
>      "
> S  =3D "${WORKDIR}/git"
>=20
> diff --git =
a/meta/recipes-devtools/binutils/binutils/fix-internal-error-when-applying=
-TLSDESC-relocs-without-TLS-segment.patch =
b/meta/recipes-devtools/binutils/binutils/fix-internal-error-when-applying=
-TLSDESC-relocs-without-TLS-segment.patch
> new file mode 100644
> index 0000000..df9d54c
> --- /dev/null
> +++ =
b/meta/recipes-devtools/binutils/binutils/fix-internal-error-when-applying=
-TLSDESC-relocs-without-TLS-segment.patch
> @@ -0,0 +1,166 @@
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
> +
> --
> 2.8.0.rc3
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_34F64536-5A76-4F4B-A834-9339C84520A3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcehFgACgkQuwUzVZGdMxT7BgCfTNlbaeDFgap4uG6J/xhd+pu8
SrsAn3VZHFBtLgJP9KnD2sZ0M0/lSUl0
=2Rff
-----END PGP SIGNATURE-----

--Apple-Mail=_34F64536-5A76-4F4B-A834-9339C84520A3--
