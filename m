Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id CFF8160670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 23:07:10 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id q63so53241375pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 15:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=DnJWLUcOnjWNzw+F8LBVSrS/wsdagSzsATEmZRWfySU=;
	b=PWLbIHEOZKZAb0lHdY2RE1ncHZjUKHSc8POKbs3mRgCgcnToTEXhwVjAC5Edd1ijWs
	M+mthzQ8lv+/oWOQ+Igf8r+q3NaStkdYlbC6/Xrip9LUxNWseb9Pf8YoQLCFQlhuCrAD
	CsUZu6fkCQEPtwcwHMwuSg1btWQsg3oOveHAHC9YsMj0kRTga07m8qySsMLTCRzZnV+0
	lvjrqocz7tS44y2+r8SU7WTKif4ueQxsueaxjYFHVGWpiex2H0fPEVv/AFBDMZLw02th
	0fVgC+SkPGTAn6061qvni0S1Sh5caqNaqw92l19PJy/z6bZ12Yg51apC4Pd9g4ayTU1x
	aknw==
X-Received: by 10.98.76.92 with SMTP id z89mr29869120pfa.91.1452553631287;
	Mon, 11 Jan 2016 15:07:11 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:409b:83af:918e:bae1?
	([2601:646:8802:5d5c:409b:83af:918e:bae1])
	by smtp.gmail.com with ESMTPSA id
	h66sm25562453pfj.52.2016.01.11.15.07.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 15:07:10 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1731469.ftd10BAJx1@peggleto-mobl.ger.corp.intel.com>
Date: Mon, 11 Jan 2016 15:07:05 -0800
Message-Id: <C1F08604-80FD-4923-9BD1-C9CD282EB733@gmail.com>
References: <1452277369.7598.136.camel@linuxfoundation.org>
	<10682729.sQ8qah7Y6F@peggleto-mobl.ger.corp.intel.com>
	<E820897B-DAC3-4691-A276-923CB1C48FB0@gmail.com>
	<1731469.ftd10BAJx1@peggleto-mobl.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pixz: Add 1.0.6
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
X-List-Received-Date: Mon, 11 Jan 2016 23:07:11 -0000
X-Groupsio-MsgNum: 75883
Content-Type: multipart/signed;
	boundary="Apple-Mail=_12EA8D0A-EA57-44F9-ADB3-D6D6AB934893";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_12EA8D0A-EA57-44F9-ADB3-D6D6AB934893
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 11, 2016, at 2:36 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> On Mon, 11 Jan 2016 13:17:14 Khem Raj wrote:
>>> On Jan 11, 2016, at 1:07 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com>
>>> wrote:>
>>> On Mon, 11 Jan 2016 09:36:36 Paul Eggleton wrote:
>>>> On Mon, 11 Jan 2016 09:26:39 Paul Eggleton wrote:
>>>>> On Fri, 08 Jan 2016 18:22:49 Richard Purdie wrote:
>>>>>> xz gives better compression results than bzip/gz but is often =
slower.
>>>>>> Using parallel compression mitigates this somewhat and is =
particularly
>>>>>> useful for the SDK.
>>>>>>=20
>>>>>> Signed-off-by: Richard Purdie =
<richard.purdie@linuxfoundation.org>
>>>>>>=20
>>>>>> diff --git a/meta/recipes-support/pixz/pixz_1.0.6.bb
>>>>>> b/meta/recipes-support/pixz/pixz_1.0.6.bb new file mode 100644
>>>>>> index 0000000..e6e4ac2
>>>>>> --- /dev/null
>>>>>> +++ b/meta/recipes-support/pixz/pixz_1.0.6.bb
>>>>>> @@ -0,0 +1,14 @@
>>>>>> +SUMMARY =3D "Parallel, indexed xz compressor"
>>>>>> +
>>>>>> +DEPENDS =3D "xz libarchive"
>>>>>> +
>>>>>> +SRC_URI =3D
>>>>>> =
"https://github.com/vasi/pixz/releases/download/v${PV}/${BPN}-${PV}.tar
>>>>>> .
>>>>>> xz
>>>>>> "
>>>>>=20
>>>>> Can we rely on this never changing? I thought we'd experienced =
problems
>>>>> with github's release tarballs being generated on the fly in the =
past...
>>>>=20
>>>> Another thing, this seems to fail to build without asciidoc:
>>>>=20
>>>> ------------ snip ------------
>>>> checking for src/pixz.1... no
>>>> checking for a2x... no
>>>> configure: error: AsciiDoc not found, not able to generate the man =
page.
>>>> ------------ snip ------------
>>>>=20
>>>> This is also related to not supporting B !=3D S, since src/pixz.1 =
does
>>>> exist,
>>>> just in S and not B. If you inherit autotools-brokensep instead of
>>>> autotools it works.
>>>=20
>>> Possibly a bit obvious, but even inheriting autotools-brokensep =
isn't
>>> enough, because if it runs "make clean" on re-executing =
do_configure,
>>> src/pixz.1 gets deleted and you get the same issue.
>>=20
>> Adding --without-manpage might get you past this issue.
>=20
> I'm afraid that's not a valid option for this configure script.

I was checking the source code on github and now I tried it locally.
the option does exist

git clone https://github.com/vasi/pixz.git
cd pixz
/configure

and it complains

configure: error: AsciiDoc not found, not able to generate the man page.


./configure --without-manpage

succeeds.


>=20
> I had more shenanigans trying to build the target version. In the end =
I needed
> to add "ac_cv_file_src_pixz_1=3Dyes" to EXTRA_OECONF and inherit =
pkgconfig.
>=20

it should be set to =E2=80=98no=E2=80=99 if manpages were to be =
disabled. so I wonder setting it to yes
is just bypassing the configure time check but should fail at =
compile/install time.

> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


--Apple-Mail=_12EA8D0A-EA57-44F9-ADB3-D6D6AB934893
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaUNZ0ACgkQuwUzVZGdMxT9KgCfeigDMtRm0afxJtnXMb1xXv3a
wdsAnR+hAd9m5ELwdRPwvexL/bBUJSDY
=O/bp
-----END PGP SIGNATURE-----

--Apple-Mail=_12EA8D0A-EA57-44F9-ADB3-D6D6AB934893--
