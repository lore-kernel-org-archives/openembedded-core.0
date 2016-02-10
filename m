Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id AD30673163
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 18:53:53 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id w128so778310pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 10:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=WULGFiWlsRpuFCqDXsuqy0TfwTFIWL/SuZ0gANazTWw=;
	b=lpXTHgEjQ2WLOKNuOZQr2lGGOoRgbH1tttnA1sP5u1O+yPEFkHqRtxKd6S2X+saFDP
	NQUCC7Ng0ttsgUg5fFrfqMPr5UdFZVjc0GthHhG8kA2oQZ2CB0WW9QUHidf+1FiQg8t3
	k2GTbW/xQ4LuILEqX8LzAhRDVc0DPCCmfwHakTaIasqqMKCgBD2exPAhvfI91eY6v2sA
	NYTYHk6qnbBgYsWc3q8u3hVS7VDYhJ9wc/uoSx7R+feDSTDqEwbmjWJBkz12Ohc6v43P
	EmPfGNTCQmqm5iobWuJtAJDgORpghcbb0aGiiAfDMAnBF92MKtoQksbPjWAnEfkKOpsO
	XE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=WULGFiWlsRpuFCqDXsuqy0TfwTFIWL/SuZ0gANazTWw=;
	b=CqPoAiHx3JTsCopQj9Yb0YikJb/LaC7lRpycs+Uy1atUXpORSjhyueYqxfxo53NS7I
	2lfUj8UeRgovHn1p3niLe1BR7E2clei6+6RKUaMXntNcPO6IBDWzEcLwxzGNaHbi1FiC
	shkHVCUffQCftp0xPYjrtQwgLiGRGa6LEMFLSZCgCKSM296Ac8kr16xVOuneaHCqvvDk
	0bEWLg6oCbo6uU9qiml5iUuZF/LQIQ6bQkqlbB7f0mVxeWGkGTpG4FICiH/Sl1oW7GO+
	7W3LUAZiRZqGucvjT1zxS4jef/Jg0C9d+VvQXFF5wlqDQp17jJvsJ4eQqyoBG/8PvG/G
	2Eiw==
X-Gm-Message-State: AG10YOQhgxHR4Rl+/oEF5udVI5xqdqGIRxDCGlHgVmACFrAnEGZc17dUHQp5b+1wiqKKwg==
X-Received: by 10.98.17.129 with SMTP id 1mr61060816pfr.30.1455130434338;
	Wed, 10 Feb 2016 10:53:54 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:cc82:3541:372c:9294?
	([2601:646:8802:5d5c:cc82:3541:372c:9294])
	by smtp.gmail.com with ESMTPSA id yx4sm6897546pac.5.2016.02.10.10.53.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Feb 2016 10:53:53 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1455128957.16142.182.camel@linuxfoundation.org>
Date: Wed, 10 Feb 2016 10:53:48 -0800
Message-Id: <618CD371-F838-4F4E-B511-70D0C49E97B4@gmail.com>
References: <cover.1455126045.git.raj.khem@gmail.com>
	<d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
	<1455128957.16142.182.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/9] distutils: Consider S != B case
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
X-List-Received-Date: Wed, 10 Feb 2016 18:53:54 -0000
X-Groupsio-MsgNum: 77961
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DA11324C-B8D2-4C2D-938E-2F185589AD4D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DA11324C-B8D2-4C2D-938E-2F185589AD4D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Feb 10, 2016, at 10:29 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Wed, 2016-02-10 at 17:43 +0000, Khem Raj wrote:
>> out of tree builds can break the assumption about setup.py being in
>> the
>> current directory, seen especially with devtool when using
>> externalsrc
>> many python modules cant build since it cant find setup.py in devtool
>> workspace
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> meta/classes/distutils.bbclass  | 27 +++++++++++++++++----------
>> meta/classes/distutils3.bbclass | 26 +++++++++++++++++++-------
>> 2 files changed, 36 insertions(+), 17 deletions(-)
>>=20
>> diff --git a/meta/classes/distutils.bbclass
>> b/meta/classes/distutils.bbclass
>> index cd06713..d9e0086 100644
>> --- a/meta/classes/distutils.bbclass
>> +++ b/meta/classes/distutils.bbclass
>> @@ -8,44 +8,51 @@ DISTUTILS_INSTALL_ARGS ?=3D =
"--prefix=3D${D}/${prefix}
>> \
>>     --install-data=3D${D}/${datadir}"
>>=20
>> distutils_do_compile() {
>> -         STAGING_INCDIR=3D${STAGING_INCDIR} \
>> -         STAGING_LIBDIR=3D${STAGING_LIBDIR} \
>> -         BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
>> -         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
>> setup.py build ${DISTUTILS_BUILD_ARGS} || \
>> -         bbfatal "${PYTHON_PN} setup.py build execution failed."
>> +        cwd=3D$PWD;cd ${S}
>> +        STAGING_INCDIR=3D${STAGING_INCDIR} \
>> +        STAGING_LIBDIR=3D${STAGING_LIBDIR} \
>> +        BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
>> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
>> ${S}/setup.py build --build-base=3D${B} ${DISTUTILS_BUILD_ARGS} || \
>> +        bbfatal "${PYTHON_PN} setup.py build execution failed."
>> +        cd $cwd
>> }
>=20
> I still can't help feeling we're putting far too much boiler plate =
into
> these functions and putting in too many redundant checks, "just to be
> sure=E2=80=9D.

it could be, but I thought there are so many python modules in other =
layers
that it could be safer to stay this way. but I agree

>=20

> If we really want to add the cd and so on, the [dirs] function flag
> should be used rather than playing with cwd like this IMO.
>=20

thats a good idea. I am testing this now
=
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/pu&=
id=3D49dd32007d7cc4f1c3fb97e0437223b5b2b1630c

> Cheers,
>=20
> Richard


--Apple-Mail=_DA11324C-B8D2-4C2D-938E-2F185589AD4D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAla7h0AACgkQuwUzVZGdMxRl7ACfR1wjpNKWq6G8BR4rtu2+NwEn
7G0AnitzbPV4d9SCT353J8QWknn6uT1e
=JHX4
-----END PGP SIGNATURE-----

--Apple-Mail=_DA11324C-B8D2-4C2D-938E-2F185589AD4D--
