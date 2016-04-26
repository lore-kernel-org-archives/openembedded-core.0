Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1774F601A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 16:34:41 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id 206so8865248pfu.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 09:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=crIt+PH1V5ZgMY4EkqvpKnTxHp2vfgscRGTFs3X9GZ8=;
	b=nY7WCairsRQKZiOnxapHsezwRNCO2KfoCVLj/9ogTjVT6Yi4tX6hvuaVLiWLgOvNKX
	f0Bn99WOznT+2D07kN1dWB8HmSxK+Gr+UQS7jIrU/5xYNE6GX/Isz4Rd4ws2Y1mfELXr
	wZt3JhFci/fBcTz+aFL0yj0LSBQtpbJ6/lQLk4TbTMouZH1qfd0yWgkGh2dxI77Eg/2N
	Eq8q29JLm7hVXQWG3+KsX1Rnlgc5M1sp+lIY+iE5boUOM7O7+/vKk4u5BeDzXbPsPNu7
	UjIHZiNJKGYfHgnBE4Dc2m/vATW1JWf/Ahcb4dZs405DQ5tcc01EUNdlViRUx6ITuHRP
	Y7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=crIt+PH1V5ZgMY4EkqvpKnTxHp2vfgscRGTFs3X9GZ8=;
	b=DluKSzYCIHNpBfHibMdOJk858Vwmn1CeD5iyqspv8c7XvXLif6YovMCyetE0x42ADy
	0uIp4tUdMgHFLv2cO40z1IqC4PA00ZSVdAeUXwUOlgLURBhwaE6wDhuyl1SNrxU6P7iB
	jykykKt8xfmJM1RxvldVVffvL2e0SNgr4vUYAiglkh19sTkgPD4QaLBDKWTDm3V4yNf9
	zs94/2SjG1djZFPvkwc5Spzs9rGcIdEd3WiC2wn5+BK8RmFNUP52JoGaprAUp2QandzP
	XQ+Nu0pDjTCQ4FMpAgABV8puusVR/HK1lHJPpXz2E9wn5BJ/DtSVf6TIhQy0YTpxVWaS
	mu3w==
X-Gm-Message-State: AOPr4FX13JD3Ze7gGEXc6F6xAi0ccDMPQe6Zy4/7EI8HXYneHd21a2zGwvs9Wzk3fEXqOg==
X-Received: by 10.98.71.13 with SMTP id u13mr4948815pfa.123.1461688482008;
	Tue, 26 Apr 2016 09:34:42 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:b93e:176b:d03b:ac8e?
	([2601:646:8800:5a9a:b93e:176b:d03b:ac8e])
	by smtp.gmail.com with ESMTPSA id
	r191sm38256106pfr.36.2016.04.26.09.34.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Apr 2016 09:34:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1461688282.4356.31.camel@codethink.co.uk>
Date: Tue, 26 Apr 2016 09:34:36 -0700
Message-Id: <AA0B3083-2B59-4902-AA1F-7326B9E8D7A2@gmail.com>
References: <1461617044-25526-1-git-send-email-tristan.vanberkom@codethink.co.uk>
	<1461617044-25526-3-git-send-email-tristan.vanberkom@codethink.co.uk>
	<C2525670-C153-4CFC-B911-0567821B899B@gmail.com>
	<1461688282.4356.31.camel@codethink.co.uk>
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
X-List-Received-Date: Tue, 26 Apr 2016 16:34:43 -0000
X-Groupsio-MsgNum: 81272
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BB03B7D0-EBA1-41B3-BF85-CFF71F7DA501";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BB03B7D0-EBA1-41B3-BF85-CFF71F7DA501
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Apr 26, 2016, at 9:31 AM, Tristan Van Berkom =
<tristan.vanberkom@codethink.co.uk> wrote:
>=20
> On Mon, 2016-04-25 at 13:55 -0700, Khem Raj wrote:
>>> On Apr 25, 2016, at 1:44 PM, Tristan Van Berkom <tristan.vanberkom@
>>> codethink.co.uk> wrote:
>>>=20
>>> We fail to build webkit on aarch64 due to this binutils bug:
>>>=20
>>>   https://sourceware.org/bugzilla/show_bug.cgi?id=3D19353
>>>=20
>>> Applying patch which fixes this, stripped out changelog entry
>>> from patch to make it apply without error.
>>=20
>>=20
>> which branch are you proposing this for?
>> we use 2.26 on master
>=20
> We are using the jethro branch, sorry for leaving out that detail.
>=20

OK, add [jethro] to patch subject line then, so it gets attention of
release maintainers.

> Cheers,
>     -Tristan
>=20
>>=20
>>> ---
>>> meta/recipes-devtools/binutils/binutils-2.25.1.inc |   1 +
>>> ...plying-TLSDESC-relocs-without-TLS-segment.patch | 166
>>> +++++++++++++++++++++
>>> 2 files changed, 167 insertions(+)
>>> create mode 100644 meta/recipes-devtools/binutils/binutils/fix-
>>> internal-error-when-applying-TLSDESC-relocs-without-TLS-
>>> segment.patch
>>>=20
>>> diff --git a/meta/recipes-devtools/binutils/binutils-2.25.1.inc
>>> b/meta/recipes-devtools/binutils/binutils-2.25.1.inc
>>> index f3817fa..c7db9e0 100644
>>> --- a/meta/recipes-devtools/binutils/binutils-2.25.1.inc
>>> +++ b/meta/recipes-devtools/binutils/binutils-2.25.1.inc
>>> @@ -35,6 +35,7 @@ SRC_URI =3D "\
>>>      file://0015-Fix-dynamic-list-so-that-symbols-not-in-the-list-
>>> are.patch \
>>>      file://binutils-octeon3.patch \
>>>      file://add-thunderx-support-for-gas.patch \
>>> +     file://fix-internal-error-when-applying-TLSDESC-relocs-
>>> without-TLS-segment.patch \
>>>      "
>>> S  =3D "${WORKDIR}/git"
>>>=20
>>> diff --git a/meta/recipes-devtools/binutils/binutils/fix-internal-
>>> error-when-applying-TLSDESC-relocs-without-TLS-segment.patch
>>> b/meta/recipes-devtools/binutils/binutils/fix-internal-error-when-
>>> applying-TLSDESC-relocs-without-TLS-segment.patch
>>> new file mode 100644
>>> index 0000000..df9d54c
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/binutils/binutils/fix-internal-error-
>>> when-applying-TLSDESC-relocs-without-TLS-segment.patch
>>> @@ -0,0 +1,166 @@
>>> +=46rom d21f123b0ead1806416cf0dafae12bec4cca8920 Mon Sep 17 00:00:00
>>> 2001
>>> +From: Cary Coutant <ccoutant@gmail.com>
>>> +Date: Mon, 11 Jan 2016 23:57:44 -0800
>>> +Subject: [PATCH] Fix internal error when applying TLSDESC
>>> relocations with no TLS segment.
>>> +
>>> +gold/
>>> +	PR gold/19353
>>> +	* aarch64.cc (Target_aarch64::relocate_tls): Don't insist
>>> that
>>> +	we have a TLS segment for GD-to-IE optimization.
>>> +	* i386.cc (Target_i386::tls_gd_to_ie): Remove tls_segment
>>> parameter.
>>> +	Adjust all calls.
>>> +	(Target_i386::tls_desc_gd_to_ie): Likewise.
>>> +	(Target_i386::relocate_tls): Don't insist that we have a
>>> TLS segment
>>> +	for TLSDESC GD-to-IE optimizations.
>>> +	* x86_64.cc (Target_x86_64::tls_gd_to_ie): Remove
>>> tls_segment parameter.
>>> +	Adjust all calls.
>>> +	(Target_x86_64::tls_desc_gd_to_ie): Likewise.
>>> +	(Target_x86_64::relocate_tls): Don't insist that we have a
>>> TLS segment
>>> +	for TLSDESC GD-to-IE optimizations.
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
>>> + 	      }
>>> + 	    if (tlsopt =3D=3D tls::TLSOPT_TO_IE)
>>> + 	      {
>>> +-		if (tls_segment =3D=3D NULL)
>>> +-		  {
>>> +-		    gold_assert(parameters->errors()-
>>>> error_count() > 0
>>> +-				||
>>> issue_undefined_symbol_error(gsym));
>>> +-		    return aarch64_reloc_funcs::STATUS_BAD_RELOC;
>>> +-		  }
>>> + 		return tls_desc_gd_to_ie(relinfo, target, rela,
>>> r_type,
>>> + 					 view, psymval,
>>> got_entry_address,
>>> + 					 address);
>>> +diff --git a/gold/i386.cc b/gold/i386.cc
>>> +index 82886d4..a7168a8 100644
>>> +--- a/gold/i386.cc
>>> ++++ b/gold/i386.cc
>>> +@@ -668,7 +668,6 @@ class Target_i386 : public Sized_target<32,
>>> false>
>>> +     // Do a TLS General-Dynamic to Initial-Exec transition.
>>> +     inline void
>>> +     tls_gd_to_ie(const Relocate_info<32, false>*, size_t relnum,
>>> +-		 Output_segment* tls_segment,
>>> + 		 const elfcpp::Rel<32, false>&, unsigned int
>>> r_type,
>>> + 		 elfcpp::Elf_types<32>::Elf_Addr value,
>>> + 		 unsigned char* view,
>>> +@@ -687,7 +686,6 @@ class Target_i386 : public Sized_target<32,
>>> false>
>>> +     // transition.
>>> +     inline void
>>> +     tls_desc_gd_to_ie(const Relocate_info<32, false>*, size_t
>>> relnum,
>>> +-		      Output_segment* tls_segment,
>>> + 		      const elfcpp::Rel<32, false>&, unsigned int
>>> r_type,
>>> + 		      elfcpp::Elf_types<32>::Elf_Addr value,
>>> + 		      unsigned char* view,
>>> +@@ -3054,7 +3052,7 @@ Target_i386::Relocate::relocate_tls(const
>>> Relocate_info<32, false>* relinfo,
>>> + 	    }
>>> + 	  if (optimized_type =3D=3D tls::TLSOPT_TO_IE)
>>> + 	    {
>>> +-	      this->tls_gd_to_ie(relinfo, relnum, tls_segment,
>>> rel, r_type,
>>> ++	      this->tls_gd_to_ie(relinfo, relnum, rel, r_type,
>>> + 				 got_offset, view, view_size);
>>> + 	      break;
>>> + 	    }
>>> +@@ -3116,13 +3114,7 @@ Target_i386::Relocate::relocate_tls(const
>>> Relocate_info<32, false>* relinfo,
>>> + 	    }
>>> + 	  if (optimized_type =3D=3D tls::TLSOPT_TO_IE)
>>> + 	    {
>>> +-	      if (tls_segment =3D=3D NULL)
>>> +-		{
>>> +-		  gold_assert(parameters->errors()->error_count()
>>>> 0
>>> +-			      ||
>>> issue_undefined_symbol_error(gsym));
>>> +-		  return;
>>> +-		}
>>> +-	      this->tls_desc_gd_to_ie(relinfo, relnum,
>>> tls_segment, rel, r_type,
>>> ++	      this->tls_desc_gd_to_ie(relinfo, relnum, rel,
>>> r_type,
>>> + 				      got_offset, view,
>>> view_size);
>>> + 	      break;
>>> + 	    }
>>> +@@ -3354,7 +3346,6 @@ Target_i386::Relocate::tls_gd_to_le(const
>>> Relocate_info<32, false>* relinfo,
>>> + inline void
>>> + Target_i386::Relocate::tls_gd_to_ie(const Relocate_info<32,
>>> false>* relinfo,
>>> + 				    size_t relnum,
>>> +-				    Output_segment*,
>>> + 				    const elfcpp::Rel<32, false>&
>>> rel,
>>> + 				    unsigned int,
>>> + 				    elfcpp::Elf_types<32>::Elf_Ad
>>> dr value,
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
>>> +@@ -816,7 +816,6 @@ class Target_x86_64 : public
>>> Sized_target<size, false>
>>> +     // Do a TLS General-Dynamic to Initial-Exec transition.
>>> +     inline void
>>> +     tls_gd_to_ie(const Relocate_info<size, false>*, size_t
>>> relnum,
>>> +-		 Output_segment* tls_segment,
>>> + 		 const elfcpp::Rela<size, false>&, unsigned int
>>> r_type,
>>> + 		 typename elfcpp::Elf_types<size>::Elf_Addr
>>> value,
>>> + 		 unsigned char* view,
>>> +@@ -835,7 +834,6 @@ class Target_x86_64 : public
>>> Sized_target<size, false>
>>> +     // Do a TLSDESC-style General-Dynamic to Initial-Exec
>>> transition.
>>> +     inline void
>>> +     tls_desc_gd_to_ie(const Relocate_info<size, false>*, size_t
>>> relnum,
>>> +-		      Output_segment* tls_segment,
>>> + 		      const elfcpp::Rela<size, false>&, unsigned
>>> int r_type,
>>> + 		      typename elfcpp::Elf_types<size>::Elf_Addr
>>> value,
>>> + 		      unsigned char* view,
>>> +@@ -3733,7 +3731,7 @@ Target_x86_64<size>::Relocate::relocate_tls(
>>> + 	  if (optimized_type =3D=3D tls::TLSOPT_TO_IE)
>>> + 	    {
>>> + 	      value =3D target->got_plt_section()->address() +
>>> got_offset;
>>> +-	      this->tls_gd_to_ie(relinfo, relnum, tls_segment,
>>> rela, r_type,
>>> ++	      this->tls_gd_to_ie(relinfo, relnum, rela, r_type,
>>> + 				 value, view, address,
>>> view_size);
>>> + 	      break;
>>> + 	    }
>>> +@@ -3800,14 +3798,8 @@
>>> Target_x86_64<size>::Relocate::relocate_tls(
>>> + 	    }
>>> + 	  if (optimized_type =3D=3D tls::TLSOPT_TO_IE)
>>> + 	    {
>>> +-	      if (tls_segment =3D=3D NULL)
>>> +-		{
>>> +-		  gold_assert(parameters->errors()->error_count()
>>>> 0
>>> +-			      ||
>>> issue_undefined_symbol_error(gsym));
>>> +-		  return;
>>> +-		}
>>> + 	      value =3D target->got_plt_section()->address() +
>>> got_offset;
>>> +-	      this->tls_desc_gd_to_ie(relinfo, relnum,
>>> tls_segment,
>>> ++	      this->tls_desc_gd_to_ie(relinfo, relnum,
>>> + 				      rela, r_type, value, view,
>>> address,
>>> + 				      view_size);
>>> + 	      break;
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
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20
>=20


--Apple-Mail=_BB03B7D0-EBA1-41B3-BF85-CFF71F7DA501
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcfmJ8ACgkQuwUzVZGdMxSAKwCfcvwc4n5NHcHLTQVVreJAC6ZJ
fAQAnj8deh4jFahWsclz6fjQN5trgUEB
=EpuS
-----END PGP SIGNATURE-----

--Apple-Mail=_BB03B7D0-EBA1-41B3-BF85-CFF71F7DA501--
