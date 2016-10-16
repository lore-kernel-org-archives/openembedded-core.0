Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id E3DF471A56
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2016 18:35:05 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id fn2so7471820pad.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2016 11:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=Q7HEqydcfQyN+a98G12cFzZn5s/gStdleX74wrLrXZQ=;
	b=cudFGJ9xn3hhRHQQZtzpRWREsHp/zdPsc2JF9fu5UNRs7ezI95ufVuOuV4r9N2SWHs
	s52FVRV79qE7wxZ6f/uwWKDPPOY9AkrD0w7XooF9061wSKV5EtTpeYswLBACjSphG1DA
	XmAybMEswlOULFwdPaP53hiDEXHYhTZ70CF7HHbVrt6CYFtsDsn2FswlTT+JmaoC9e1E
	RcwaVsRf8hOjqna3VCmFygVeAIm6tv3UxBOgkrsPWhK3PxCqJTKfAU51cAvaI+SwKg/x
	9Fz5ufTFJ/rlS/Df2f6JAvz+J77CGOrDznfDPKycCjE5o01nTagUCDACfH2eWIH5FOBu
	qSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Q7HEqydcfQyN+a98G12cFzZn5s/gStdleX74wrLrXZQ=;
	b=mKAevJwiIEH/7TIZDJMVAnyw2Dob8K0ZqwO5oX74GEFXik7l0ykSEb9NoRmVQM29Tg
	GBs3vl/fPW9J0Bw1rNgBxUxeJ5tgpfiF/ODQTtotEv1RagaO0IqttkX//DFks+tVEMOX
	yXjiHIQH4TNfQhiCvOZt5NaxHClHUeQ61pY0D6Lzpdtg7LrVgndlkQIw/KixyTNPmk+e
	30GBSCVao8hUCv0cq7G6ksujhV7x5B9paibyknjGGAj9Pto7fOOm2Z0JDOoYdcYNenDj
	Asv3PiZci4UVm9KVAC8D9L+zJjlVeNBjSvxOWwqeO/GGoX2fh5+wzHjJR+ZYrYa1tE8G
	r46A==
X-Gm-Message-State: AA6/9RmOcMbfu/7l4gILlMrHu6VRV9CA1uQBKSswF7PZS2YhaBZlSe6EKfzax5IcCxkaYw==
X-Received: by 10.66.187.136 with SMTP id fs8mr27693026pac.181.1476642906908; 
	Sun, 16 Oct 2016 11:35:06 -0700 (PDT)
Received: from [192.168.1.2] (6.sub-70-197-7.myvzw.com. [70.197.7.6])
	by smtp.gmail.com with ESMTPSA id
	f2sm42105561pfj.68.2016.10.16.11.35.05
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 16 Oct 2016 11:35:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=UMHN9voJDxSYPf3aizy8eDsVV8k2XPjDOHGwrbR9R2Ww@mail.gmail.com>
Date: Sun, 16 Oct 2016 11:35:03 -0700
Message-Id: <C8790C9C-FFD9-4F82-9905-B97EECAD9216@gmail.com>
References: <1476276760-56560-1-git-send-email-Zubair.Kakakhel@imgtec.com>
	<CAJ86T=UMHN9voJDxSYPf3aizy8eDsVV8k2XPjDOHGwrbR9R2Ww@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gmp: Disable assembly for MIPS R6
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
X-List-Received-Date: Sun, 16 Oct 2016 18:35:06 -0000
X-Groupsio-MsgNum: 88213
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C3F123C9-7239-4FF5-9874-47EB783A34E6";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C3F123C9-7239-4FF5-9874-47EB783A34E6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 12, 2016, at 12:03 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> On Wed, Oct 12, 2016 at 5:52 AM, Zubair Lutfullah Kakakhel
> <Zubair.Kakakhel@imgtec.com> wrote:
>> gmplib has some assembly routines. These have not been optimized
>> for MIPS R6 yet. Add --disable-assembly so that the C implementation
>> is used.
>>=20
>> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>> ---
>> meta/recipes-support/gmp/gmp_6.1.1.bb | 4 ++++
>> 1 file changed, 4 insertions(+)
>>=20
>> diff --git a/meta/recipes-support/gmp/gmp_6.1.1.bb =
b/meta/recipes-support/gmp/gmp_6.1.1.bb
>> index 303c3ef..430ce93 100644
>> --- a/meta/recipes-support/gmp/gmp_6.1.1.bb
>> +++ b/meta/recipes-support/gmp/gmp_6.1.1.bb
>> @@ -21,6 +21,10 @@ SRC_URI[sha256sum] =3D =
"a8109865f2893f1373b0a8ed5ff7429de8db696fc451b1036bd7bdf95b
>> acpaths =3D ""
>>=20
>> EXTRA_OECONF +=3D " --enable-cxx=3Ddetect"
>> +EXTRA_OECONF_mipsisa32r6el +=3D " --disable-assembly"
>> +EXTRA_OECONF_mipsisa32r6   +=3D " --disable-assembly"
>> +EXTRA_OECONF_mipsisa64r6el +=3D " --disable-assembly"
>> +EXTRA_OECONF_mipsisa64r6   +=3D " --disable-assembly"
>=20
> These over-rides will cause --disable-assembly to completely replace
> the original value of EXTRA_OECONF, rather than being appended to it.
>=20
> A typical solution is to use an intermediate variable, something like:
>=20
> DISABLE_ASSEMBLY ?=3D ""
> DISABLE_ASSEMBLY_mipsisa32r6 =3D "--disable-assembly"
> DISABLE_ASSEMBLY_mipsisa32r6el =3D "--disable-assembly"
> DISABLE_ASSEMBLY_mipsisa64r6 =3D "--disable-assembly"
> DISABLE_ASSEMBLY_mipsisa64r6el =3D "--disable-assembly"
>=20
> EXTRA_OECONF +=3D "${DISABLE_ASSEMBLY}=E2=80=9D

Or use _append instead of +=3D in original patch.

>=20
>=20
>>=20
>> PACKAGES =3D+ "libgmpxx"
>> FILES_libgmpxx =3D "${libdir}/libgmpxx${SOLIBS}"
>> --
>> 1.9.1
>>=20
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_C3F123C9-7239-4FF5-9874-47EB783A34E6
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgDyFcACgkQuwUzVZGdMxQXJwCcC8+QrAuzgcfPDDPBTJGISQbw
4BgAn2sOdhY+tqhzbp/1trS4P9O5A44s
=ctP8
-----END PGP SIGNATURE-----

--Apple-Mail=_C3F123C9-7239-4FF5-9874-47EB783A34E6--
