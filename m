Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id BC8E5607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 16:53:00 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id zm5so9509266pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 09:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=LDc8mfdypcevmHogy9UE/PC+FlXJBd75TErg0UJizCM=;
	b=1EzLR3Tml4c3Bv/HYS03zYSWTOPuapqSqjtrmSkO3pp/P57PUeHyW23bU+ACK8ukKN
	TQJ/Nc2kR2uWwkplngJW+evFBVr6qHaI+CUYfSe6X4hRuJYw+7vU+cbnNFRQ9NmwGoDi
	l1ncGy7ZY6Aj7G8oL+maqV040sNgbzWIGXhYg0kucj8YCfXqY+WHuZ58F43ODjYINlVv
	YokJMsURgQ8od9dxgrsNgTJnp1XxxnBd9XUSbphqil46y1i9alfvC3wLF/EyIFLXwNJm
	73FgJkzyFtmIygCxxgdm/NIyekOq8mhJIKvKo8NTlDQ75SxAm0Y15KSBmV6dw2vlHO13
	fYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=LDc8mfdypcevmHogy9UE/PC+FlXJBd75TErg0UJizCM=;
	b=g4WjWP0b33gm65n+m+fps+wbYmWPXo0MDuQc1Bnog1r9B0mkIRCUNuH4bU+oNU09rk
	nAAsFRwohRc6EAfeGsE4eRCyAUrtfiLIZMFUzvgRV93HEXlfsioYZyeX5+FVxRVAmGpo
	X3lafNXc7CERSCRUmuOi/jpbye6UiXpEbbjFGgBDIC5Xi1XQU9J/3OORn8lnmlOBXMk0
	IbNs/LgzYg4ePwW/LOh7aJwjdltYem8mo0dPUYo6SQevYUHLZJK893+ydwHEQsrrt3R1
	8NgB3f3vCZtRLEgy7+Fde03tQ82jECmE1LnJFf+hkoY5hrdn6BeLEMQrEhuVsSKD+rIu
	0BpA==
X-Gm-Message-State: AOPr4FWBl2oIJpuc/PjTCYDmWPa2EUXNGSUxUwCkeN6YdBb1J5rOLaHfz255AI+W2rZFPA==
X-Received: by 10.66.65.133 with SMTP id x5mr5181288pas.108.1461689581045;
	Tue, 26 Apr 2016 09:53:01 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:b93e:176b:d03b:ac8e?
	([2601:646:8800:5a9a:b93e:176b:d03b:ac8e])
	by smtp.gmail.com with ESMTPSA id
	ut1sm39583631pac.46.2016.04.26.09.53.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Apr 2016 09:53:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1461660076.31320.145.camel@linuxfoundation.org>
Date: Tue, 26 Apr 2016 09:52:59 -0700
Message-Id: <A81C2DE0-AC8A-49FD-95B7-C8C8F3BBEFD8@gmail.com>
References: <1461617044-25526-1-git-send-email-tristan.vanberkom@codethink.co.uk>
	<1461660076.31320.145.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] gcc-cross-initial: Split all-gcc and configure-target-libgcc
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
X-List-Received-Date: Tue, 26 Apr 2016 16:53:00 -0000
X-Groupsio-MsgNum: 81275
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6FB995E1-1B8F-42B3-970E-FD1721021885";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6FB995E1-1B8F-42B3-970E-FD1721021885
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Apr 26, 2016, at 1:41 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Mon, 2016-04-25 at 16:44 -0400, Tristan Van Berkom wrote:
>> Serializing this fixes build on aarch64
>> ---
>> meta/recipes-devtools/gcc/gcc-cross-initial.inc | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
>> b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
>> index c0fa139..98aae45 100644
>> --- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
>> @@ -43,7 +43,8 @@ do_configure_prepend () {
>> }
>>=20
>> do_compile () {
>> -    oe_runmake all-gcc configure-target-libgcc
>> +    oe_runmake all-gcc
>> +    oe_runmake configure-target-libgcc
>> }
>> do_install () {
>> 	( cd ${B}/${TARGET_SYS}/libgcc; oe_runmake 'DESTDIR=3D${D}'
>> install-unwind_h )
>=20
> I'd note we have been doing aarch64 builds for a while and not run =
into
> this. What was the actual failure?
>=20
> Can we fix the underlying aarch64 problem, rather than breaking
> parallelism for everyone else this appears to be working for?
>=20

I agree. and please add the relevant short error message that you were =
seeing

> Cheers,
>=20
> Richard
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_6FB995E1-1B8F-42B3-970E-FD1721021885
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcfnOsACgkQuwUzVZGdMxScOQCeITKxhrJkWLnmX/kFd5xdS658
EBsAoIc33iypv0AYm6WT3b5cssU3yYcN
=Wjbw
-----END PGP SIGNATURE-----

--Apple-Mail=_6FB995E1-1B8F-42B3-970E-FD1721021885--
