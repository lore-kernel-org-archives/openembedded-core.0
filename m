Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id B0BE36E648
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 00:43:47 +0000 (UTC)
Received: by pdbqm3 with SMTP id qm3so14401049pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 17:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=RcAnZs0A8mI4UA7Zgovg6earSb3E6BvsqMe1CwntQcg=;
	b=qbBIY3ldnkfJRotmjp7ptKoR/1lPVAuuPSn/7Xl4MHDsFJViPOMzfn7slKAe4o+T1F
	cfPmKAieJGpSmza+MNiZz/a7R9YsCSEjYO8jOvaMebi/u0kupWcTfOuTBDm5XfdZAkav
	I/UgocfhRqWJnz4/E5nfoJDnENCUdVdyPEH7aT+4HJ+brZAJfEU6Qw6jreNiQJbaAkGx
	pv3hHbxy1Ygh+VlH8L040+n4NIRl7Q7e+Bh54xA+2CsAWSGwhp0i+SqqLJJHLiPWVF4j
	o1pr8rp26lU9+oaaXC1Bqp8cFsDobbZSWea/WrBf/do0S2tmldN+pbOSFeyLEKe9g3D9
	hCJA==
X-Received: by 10.68.224.162 with SMTP id rd2mr2531165pbc.2.1436921028017;
	Tue, 14 Jul 2015 17:43:48 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:31eb:847b:a3f8:c16b?
	([2601:646:8601:4580:31eb:847b:a3f8:c16b])
	by smtp.gmail.com with ESMTPSA id
	fy5sm2545637pdb.93.2015.07.14.17.43.46
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 14 Jul 2015 17:43:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=VE7a7rUMZMB8LTX0emuqkLOE=E_PvARh4JcQwZuJ+WCw@mail.gmail.com>
Date: Tue, 14 Jul 2015 17:43:41 -0700
Message-Id: <A4E25F8E-FBB2-4DF9-B208-3A58A2DC71C3@gmail.com>
References: <261F5389-C495-4B05-B79E-309AE0E0F0CA@gmail.com>
	<CAJ86T=VE7a7rUMZMB8LTX0emuqkLOE=E_PvARh4JcQwZuJ+WCw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.2102)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] glibc 2.22
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
X-List-Received-Date: Wed, 15 Jul 2015 00:43:52 -0000
X-Groupsio-MsgNum: 67961
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2F5E034C-5B4F-43EC-A984-B7313D556DA4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2F5E034C-5B4F-43EC-A984-B7313D556DA4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 14, 2015, at 2:56 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> Hi Khem,
>=20
> On Mon, Jul 13, 2015 at 10:37 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> Hi All
>>=20
>> glibc 2.22 will release end of this month. For some time I have put =
together the update here
>>=20
>> =
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/mas=
ter&id=3D02e73ea526d94f21c7ef82eb96b062eff8ebb825
>>=20
>> It works pretty well for machines I have tested it on ( arm/x86 ) but =
would be interested if more wider trial could be carried
>> out and issues reported between now and release can be addressed.
>>=20
>> Please give it a try if you have spare cycles
>=20
> This was building OK yesterday, but today
> "0027-eglibc-use-option-groups-Conditionally-exclude-c-tes.patch" is
> failing to apply due to this upstream change:
>=20
>  =
https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;h=3Dedcfe9eab03ea=
3dd1b3e04b6056a7663c40265c4

Thanks for reporting. It has been fixed and branch rebased
=
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/mas=
ter&id=3Dc43cd1969696970affb094fc0b20ca02c966ecbd
is new commit in rebased tree

>=20
>>=20
>> Thanks
>> -Khem
>>=20
>> --
>> _______________________________________________
>> yocto mailing list
>> yocto@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/yocto
>>=20


--Apple-Mail=_2F5E034C-5B4F-43EC-A984-B7313D556DA4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlWlrMEACgkQuwUzVZGdMxQwDwCeJ1YUgilexeDuixyfouOmpzZU
NWcAn0dHyBOt3B8Gow8ikjMv5yze1hp8
=rLeZ
-----END PGP SIGNATURE-----

--Apple-Mail=_2F5E034C-5B4F-43EC-A984-B7313D556DA4--
