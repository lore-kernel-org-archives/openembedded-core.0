Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9479B6FEE0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 23:21:37 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id q63so53413049pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 15:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=QMDKx3UCCK/OWA9hXilmqNk6D+VygqHEC60oEVThRVg=;
	b=OH3ftZIOBCskmC5Mi0DJVH+CNvmue3mCMYfxCj2zPOtskVUtI1sKECtBxk0/gKSWn9
	ASQ0/PiWiynKaecTGu78YWIKLXojXUq4N0ywq49Ojt45Ozp6DTf+sNApf101DI/tNnfy
	hvnAI2O20QXBy5vR6N8fXFjcIjYDxOvQg6B6nIUIvMXa655vgMnJF/3IYgTFQzBWZuIA
	iUIjaHzjwvC+NxEhgLe7rUpkMPY826xOz2g0eHuFNhzTe867ngDbU1h7az15/VsZY4/e
	IYm7uIyxALLsskMu44TROJ3MSgD7XBhGUJGpv0e1i2V5HK0q9b5gVPtVIw8wMRjxTna0
	ktXA==
X-Received: by 10.98.9.220 with SMTP id 89mr30192922pfj.17.1452554498767;
	Mon, 11 Jan 2016 15:21:38 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:409b:83af:918e:bae1?
	([2601:646:8802:5d5c:409b:83af:918e:bae1])
	by smtp.gmail.com with ESMTPSA id
	z15sm25615854pfa.71.2016.01.11.15.21.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 15:21:38 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1731469.ftd10BAJx1@peggleto-mobl.ger.corp.intel.com>
Date: Mon, 11 Jan 2016 15:21:37 -0800
Message-Id: <67FE2658-C78E-468E-9D8E-6EE0CB927555@gmail.com>
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
X-List-Received-Date: Mon, 11 Jan 2016 23:21:40 -0000
X-Groupsio-MsgNum: 75887
Content-Type: multipart/signed;
	boundary="Apple-Mail=_800B599E-20B6-46E9-A042-5494B21DD42F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_800B599E-20B6-46E9-A042-5494B21DD42F
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
>=20
> I had more shenanigans trying to build the target version. In the end =
I needed
> to add "ac_cv_file_src_pixz_1=3Dyes" to EXTRA_OECONF and inherit =
pkgconfig.
>=20

I think you are missing
=
https://github.com/vasi/pixz/commit/936d8068ae19d95260d3058f41dd6cf718101c=
d6

which is committed after 1.0.6 release. It should be back ported.
may be not use tarball but straight use =
SRCREV=3D=E2=80=9C936d8068ae19d95260d3058f41dd6cf718101cd6=E2=80=9D
with git fetcher might be better.

> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


--Apple-Mail=_800B599E-20B6-46E9-A042-5494B21DD42F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaUOQEACgkQuwUzVZGdMxQTuwCfTzBIOEd/BwP659TMmv3hLK/U
9aYAni50nKrKu3/cSDmv7svh5TgJCVWi
=F7Pa
-----END PGP SIGNATURE-----

--Apple-Mail=_800B599E-20B6-46E9-A042-5494B21DD42F--
