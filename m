Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6CF6FF7D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 00:17:35 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id yy13so236660196pab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 16:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=MRjXrpybCIXA/zEWZfeyVeuEVOVrj6LYGCh14qvv73I=;
	b=VWpktZz6kn//nG3R4FFeVn4R8jpBuMCQEHtXjodwX4zuf/ee3SE7nTyWtv32JHAjn9
	qHDOTw377kHonkiGenbIhaj+dQqncxX4OPNqNNyLNxJeKemrAjeWd1ww/8S9jYMMSEIt
	XdJP+XiQqH43PDj1BMd5yyQzBPeRELSdOkhSKwElCzWN2LqOo25IIg5Rfpa3gMhON4Lj
	jnGhcDxMdyQn+QSnHt4yjtzKXkAgCNJR2ldJvhIZP82Gb5T3p70VquSNJbm9DHNW8wsS
	d66UOxNina3awU6+HJdcsphUjynzkocpSdoNgac9t3i/k+t7aRo/yPFcLV5WhDZmB1OC
	h9uw==
X-Received: by 10.67.3.170 with SMTP id bx10mr151076640pad.34.1452557856684;
	Mon, 11 Jan 2016 16:17:36 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:409b:83af:918e:bae1?
	([2601:646:8802:5d5c:409b:83af:918e:bae1])
	by smtp.gmail.com with ESMTPSA id
	b28sm25707743pfd.24.2016.01.11.16.17.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 16:17:35 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1452555303.28375.1.camel@linuxfoundation.org>
Date: Mon, 11 Jan 2016 16:17:25 -0800
Message-Id: <07532094-8D88-49CD-8CF2-42C0F2B46CA4@gmail.com>
References: <1452277369.7598.136.camel@linuxfoundation.org>
	<10682729.sQ8qah7Y6F@peggleto-mobl.ger.corp.intel.com>
	<E820897B-DAC3-4691-A276-923CB1C48FB0@gmail.com>
	<1731469.ftd10BAJx1@peggleto-mobl.ger.corp.intel.com>
	<67FE2658-C78E-468E-9D8E-6EE0CB927555@gmail.com>
	<1452555303.28375.1.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3112)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 12 Jan 2016 00:17:36 -0000
X-Groupsio-MsgNum: 75889
Content-Type: multipart/signed;
	boundary="Apple-Mail=_00ED7DE8-CA69-43E8-AFCB-F0D2848C4913";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_00ED7DE8-CA69-43E8-AFCB-F0D2848C4913
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 11, 2016, at 3:35 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Mon, 2016-01-11 at 15:21 -0800, Khem Raj wrote:
>>> On Jan 11, 2016, at 2:36 PM, Paul Eggleton <
>>> paul.eggleton@linux.intel.com> wrote:
>>>=20
>>> On Mon, 11 Jan 2016 13:17:14 Khem Raj wrote:
>>>>> On Jan 11, 2016, at 1:07 PM, Paul Eggleton <
>>>>> paul.eggleton@linux.intel.com>
>>>>> wrote:>
>>>>> On Mon, 11 Jan 2016 09:36:36 Paul Eggleton wrote:
>>>>>> On Mon, 11 Jan 2016 09:26:39 Paul Eggleton wrote:
>>>>>>> On Fri, 08 Jan 2016 18:22:49 Richard Purdie wrote:
>>>>>>>> xz gives better compression results than bzip/gz but is
>>>>>>>> often slower.
>>>>>>>> Using parallel compression mitigates this somewhat and is
>>>>>>>> particularly
>>>>>>>> useful for the SDK.
>>>>>>>>=20
>>>>>>>> Signed-off-by: Richard Purdie <
>>>>>>>> richard.purdie@linuxfoundation.org>
>>>>>>>>=20
>>>>>>>> diff --git a/meta/recipes-support/pixz/pixz_1.0.6.bb
>>>>>>>> b/meta/recipes-support/pixz/pixz_1.0.6.bb new file mode
>>>>>>>> 100644
>>>>>>>> index 0000000..e6e4ac2
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/meta/recipes-support/pixz/pixz_1.0.6.bb
>>>>>>>> @@ -0,0 +1,14 @@
>>>>>>>> +SUMMARY =3D "Parallel, indexed xz compressor"
>>>>>>>> +
>>>>>>>> +DEPENDS =3D "xz libarchive"
>>>>>>>> +
>>>>>>>> +SRC_URI =3D
>>>>>>>> "https://github.com/vasi/pixz/releases/download/v${PV}/${
>>>>>>>> BPN}-${PV}.tar
>>>>>>>> .
>>>>>>>> xz
>>>>>>>> "
>>>>>>>=20
>>>>>>> Can we rely on this never changing? I thought we'd
>>>>>>> experienced problems
>>>>>>> with github's release tarballs being generated on the fly
>>>>>>> in the past...
>>>>>>=20
>>>>>> Another thing, this seems to fail to build without asciidoc:
>>>>>>=20
>>>>>> ------------ snip ------------
>>>>>> checking for src/pixz.1... no
>>>>>> checking for a2x... no
>>>>>> configure: error: AsciiDoc not found, not able to generate
>>>>>> the man page.
>>>>>> ------------ snip ------------
>>>>>>=20
>>>>>> This is also related to not supporting B !=3D S, since
>>>>>> src/pixz.1 does
>>>>>> exist,
>>>>>> just in S and not B. If you inherit autotools-brokensep
>>>>>> instead of
>>>>>> autotools it works.
>>>>>=20
>>>>> Possibly a bit obvious, but even inheriting autotools-brokensep
>>>>> isn't
>>>>> enough, because if it runs "make clean" on re-executing
>>>>> do_configure,
>>>>> src/pixz.1 gets deleted and you get the same issue.
>>>>=20
>>>> Adding --without-manpage might get you past this issue.
>>>=20
>>> I'm afraid that's not a valid option for this configure script.
>>>=20
>>> I had more shenanigans trying to build the target version. In the
>>> end I needed
>>> to add "ac_cv_file_src_pixz_1=3Dyes" to EXTRA_OECONF and inherit
>>> pkgconfig.
>>>=20
>>=20
>> I think you are missing
>> https://github.com/vasi/pixz/commit/936d8068ae19d95260d3058f41dd6cf71
>> 8101cd6
>>=20
>> which is committed after 1.0.6 release. It should be back ported.
>> may be not use tarball but straight use
>> SRCREV=3D=E2=80=9C936d8068ae19d95260d3058f41dd6cf718101cd6=E2=80=9D
>> with git fetcher might be better.
>=20
> As Randy mentions, should we use the -T option to xz instead though?

that might be ok too

xz /tmp/xx.tar  19.65s user 0.07s system 100% cpu 19.714 total
XZ_DEFAULTS=3D"-T 0" xz /tmp/xx.tar  22.35s user 0.49s system 360% cpu =
6.340 total
pixz /tmp/xx.tar /tmp/xx.tar.xz  26.56s user 0.45s system 456% cpu 5.917 =
total

a little slower than pixz and doesnt seem to use all cores with pixz I =
had 450% CPU on same load.

using pixz is simpler though. It can also be called integrated with tar. =
for XZ we need to set this env
variable to enable parallelism with pixz its not needed.

>=20
> Cheers,
>=20
> Richard


--Apple-Mail=_00ED7DE8-CA69-43E8-AFCB-F0D2848C4913
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaURh4ACgkQuwUzVZGdMxTM0wCdE7TmyXxXDjqxihzXA0HxdLm3
2fAAni17t2m+OD3AcV9aFtXRdPI5PuVN
=zYFz
-----END PGP SIGNATURE-----

--Apple-Mail=_00ED7DE8-CA69-43E8-AFCB-F0D2848C4913--
