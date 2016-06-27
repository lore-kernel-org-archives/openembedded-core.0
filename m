Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id C8F8360123
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 02:58:28 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id ts6so14159412pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jun 2016 19:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=Iv38EXs+4VJmnvOoA8pDLU2iaE9bzR82KjQzk5nrr6M=;
	b=EshQTxve0KIKbFfVuEroevWfmknWUo1lMo1cPD64Wmng84+qsuYqU/QGYvFqhZ+54u
	ndnyX9Uw+UmkeX7F+QdYK9qbXDzcRMMTQVSj8vVFF9dlvH+ttUugM+FvBAFgoalHNEz6
	O/Fl17b+zZHY12fE+nIAiCAspFEPCpc7HO3F2XgxpiNDzz/HDrqY89ndxyvKOqUSh5Yr
	Rqq8MK7fUCnxNDsLLwI4eiuRjImmW2T38YZasPHL/CG/J80WGSvv/oR1sr1sA958gMo4
	0wh1SvlUtRqa5ivILeS3mo+oxgMYjw8++CtnxnpdZMPmMsSnyixFehfUOIyTYcZf0XTj
	q00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Iv38EXs+4VJmnvOoA8pDLU2iaE9bzR82KjQzk5nrr6M=;
	b=NmjJGVczTckSg/rH1586GWHJQjJ9Pd8ST5cqzuCn8/mDK+0rRFTLOFgCm/XDv0AL2U
	rnO9FCoYdwRnIGmCTf0Fzyqe+Z2RKPk9CTA/NMUoThERozFupjbfWtXNwZkWQh5jEPfA
	JINNff9CF4mEBHuHbkUhf6PMnNTq3xntmVrHzJQsQ1tTjOQPgjEODkT2VvpTjiOAeH2k
	7bKcTvdoNGXRwNszBhqItM/dWrnzTBMfc2f230IXZNtWMICL0kKPQlpPFRZr44egJdeq
	tmH4jXF8mVOERVnDkb3ds6CKriw6IHCQwhgWLgbgr1XwWdADDFSd1NWKDrYc0xfH8qwU
	pSOw==
X-Gm-Message-State: ALyK8tJNbff6ammwQFquy7fgb0ySyCpImXyTqIsgOkOU9fSBoW00SDquE6HIVQd2g4EZ+g==
X-Received: by 10.66.196.203 with SMTP id io11mr29647840pac.107.1466996309085; 
	Sun, 26 Jun 2016 19:58:29 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:89ec:27f0:d3bb:fd18?
	([2601:646:8882:b8c:89ec:27f0:d3bb:fd18])
	by smtp.gmail.com with ESMTPSA id
	b186sm1965867pfa.61.2016.06.26.19.58.27
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Jun 2016 19:58:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <577088D3.5060307@windriver.com>
Date: Sun, 26 Jun 2016 19:58:20 -0700
Message-Id: <2BCD5189-07DA-4AC9-9060-501A86AE5D18@gmail.com>
References: <1458264628.9397.10.camel@intel.com>
	<576CD0F6.2050408@windriver.com>
	<CAMKF1sorf1ALWRyUj=CPG5be=gdC1Zw8=2H9Ef-QWg4OTJTrPg@mail.gmail.com>
	<577088D3.5060307@windriver.com>
To: ChenQi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.3124)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] grub: add -Wno-error=trampolines to native CFLAGS
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
X-List-Received-Date: Mon, 27 Jun 2016 02:58:29 -0000
X-Groupsio-MsgNum: 83888
Content-Type: multipart/signed;
	boundary="Apple-Mail=_30718050-0CBD-420B-B7D1-E2F6B42D5963";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_30718050-0CBD-420B-B7D1-E2F6B42D5963
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 26, 2016, at 7:00 PM, ChenQi <Qi.Chen@windriver.com> wrote:
>=20
> On 06/24/2016 10:04 PM, Khem Raj wrote:
>> On Thu, Jun 23, 2016 at 11:19 PM, ChenQi <Qi.Chen@windriver.com> =
wrote:
>>> Hi,
>>>=20
>>> Is the error still there for gcc6 without this option for CFLAGS?
>>> The problem is that gcc on some old hosts don't support this option.
>> how old is the host. We should start recommending minimum required =
GCC
>> version on build host.
>> Sometimes a newer gcc is available for older distros too as =
alternative package.
>=20
> That is centos6.

we can recommend additional feeds for centos6 then ?
something like

http://people.centos.org/tru/devtools-2

Which will make gcc 4.8 available for centos6 along with 4.4 which is =
the default

If one wants to use devtools-3 then they can get gcc-4.9 as well, =
however its only
available for x86_64

>=20
> Best Regards,
> Chen Qi
>=20
>>> Best Regards,
>>> Chen Qi
>>>=20
>>> On 03/18/2016 09:30 AM, Randle, William C wrote:
>>>> Previous patch was not against master. Updated against master =
branch.
>>>>=20
>>>> Fixes YOCTO 9201
>>>> Adds -Wno-error=3Dtrampolines to native CFLAGS prevent multiple =
compile
>>>> errors when using gcc 5.3.0 for gentoo.
>>>>=20
>>>> Signed-off-by: Bill Randle <william.c.randle@intel.com>
>>>> ---
>>>>   meta/recipes-bsp/grub/grub-efi_2.00.bb | 4 ++++
>>>>   1 file changed, 4 insertions(+)
>>>>=20
>>>> diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb
>>>> b/meta/recipes-bsp/grub/grub-efi_2.00.bb
>>>> index 4e80e18..ca73234 100644
>>>> --- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
>>>> +++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
>>>> @@ -35,6 +35,10 @@ EXTRA_OECONF =3D "--with-platform=3Defi
>>>> --disable-grub-mkfont \
>>>>     EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'largefile',
>>>> '--enable-largefile ac_cv_sizeof_off_t=3D8', '--disable-largefile', =
d)}"
>>>>   +# ldm.c:114:7: error: trampoline generated for nested function =
'hook'
>>>> [-Werror=3Dtrampolines]
>>>> +# and many other places in the grub code when compiled with some =
native
>>>> gcc 5.3 compilers
>>>> +CFLAGS_append_class-native =3D " -Wno-error=3Dtrampolines"
>>>> +
>>>>   do_install_class-native() {
>>>>      install -d ${D}${bindir}
>>>>      install -m 755 grub-mkimage ${D}${bindir}
>>>> --
>>>> 2.5.0
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


--Apple-Mail=_30718050-0CBD-420B-B7D1-E2F6B42D5963
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldwllQACgkQuwUzVZGdMxS7/ACfU6ud+Nygwe/R5qgTfwpUOYHK
vUMAmwXgAiLHLaDj8fV6eKdbBL1etnb/
=514Q
-----END PGP SIGNATURE-----

--Apple-Mail=_30718050-0CBD-420B-B7D1-E2F6B42D5963--
