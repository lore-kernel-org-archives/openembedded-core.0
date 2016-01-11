Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 413CF60670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 21:17:19 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id 65so50452840pff.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 13:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=MDI2fAujBnMa75Ik7CwVpJ/wlopfeG7jcQ1GOQDpEeE=;
	b=kPXvUuDDfnhgaHfabUaNIjVbHmWTuP3cLflktp+gsZlOcP0YhEa5fSRJI8EM1QtwBn
	l4Tvf0Z0r5LQ6rTlAEi8W2z8II83uisKQWMDIlNkZALHaWjNMmmLG5dE6TkVkzJD9LHt
	ykDP1LnJAq+d3WHsebCcbcPKYDn7mVhPahtJTdy+WXGLo0mjUbY3HpVum0gC+1x03nsj
	prUXNHvyRINZa49f2MKAcxs7W4JfcHW6LB5q5Xj79TbfzkFODAULE+QkFPQw8j+dkYqr
	1fODnJzUZDRl03CqnePVhuEBrdLyulZMFsBZ7pVzM8YDwJ3EAAfkfvCeiEwJADmahG3u
	DNKQ==
X-Received: by 10.98.87.204 with SMTP id i73mr29227821pfj.63.1452547040476;
	Mon, 11 Jan 2016 13:17:20 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:409b:83af:918e:bae1?
	([2601:646:8802:5d5c:409b:83af:918e:bae1])
	by smtp.gmail.com with ESMTPSA id
	r89sm25310303pfa.57.2016.01.11.13.17.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 13:17:19 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <10682729.sQ8qah7Y6F@peggleto-mobl.ger.corp.intel.com>
Date: Mon, 11 Jan 2016 13:17:14 -0800
Message-Id: <E820897B-DAC3-4691-A276-923CB1C48FB0@gmail.com>
References: <1452277369.7598.136.camel@linuxfoundation.org>
	<3794662.0pqDkncOgQ@peggleto-mobl.ger.corp.intel.com>
	<1771478.km9IAYYp8Q@peggleto-mobl.ger.corp.intel.com>
	<10682729.sQ8qah7Y6F@peggleto-mobl.ger.corp.intel.com>
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
X-List-Received-Date: Mon, 11 Jan 2016 21:17:20 -0000
X-Groupsio-MsgNum: 75879
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4B2AF48D-0ED4-4F37-A29F-1E1E7ACDE8A7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4B2AF48D-0ED4-4F37-A29F-1E1E7ACDE8A7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 11, 2016, at 1:07 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> On Mon, 11 Jan 2016 09:36:36 Paul Eggleton wrote:
>> On Mon, 11 Jan 2016 09:26:39 Paul Eggleton wrote:
>>> On Fri, 08 Jan 2016 18:22:49 Richard Purdie wrote:
>>>> xz gives better compression results than bzip/gz but is often =
slower.
>>>> Using parallel compression mitigates this somewhat and is =
particularly
>>>> useful for the SDK.
>>>>=20
>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>>=20
>>>> diff --git a/meta/recipes-support/pixz/pixz_1.0.6.bb
>>>> b/meta/recipes-support/pixz/pixz_1.0.6.bb new file mode 100644
>>>> index 0000000..e6e4ac2
>>>> --- /dev/null
>>>> +++ b/meta/recipes-support/pixz/pixz_1.0.6.bb
>>>> @@ -0,0 +1,14 @@
>>>> +SUMMARY =3D "Parallel, indexed xz compressor"
>>>> +
>>>> +DEPENDS =3D "xz libarchive"
>>>> +
>>>> +SRC_URI =3D
>>>> =
"https://github.com/vasi/pixz/releases/download/v${PV}/${BPN}-${PV}.tar.
>>>> xz
>>>> "
>>>=20
>>> Can we rely on this never changing? I thought we'd experienced =
problems
>>> with github's release tarballs being generated on the fly in the =
past...
>> Another thing, this seems to fail to build without asciidoc:
>>=20
>> ------------ snip ------------
>> checking for src/pixz.1... no
>> checking for a2x... no
>> configure: error: AsciiDoc not found, not able to generate the man =
page.
>> ------------ snip ------------
>>=20
>> This is also related to not supporting B !=3D S, since src/pixz.1 =
does exist,
>> just in S and not B. If you inherit autotools-brokensep instead of =
autotools
>> it works.
>=20
> Possibly a bit obvious, but even inheriting autotools-brokensep isn't =
enough,
> because if it runs "make clean" on re-executing do_configure, =
src/pixz.1 gets
> deleted and you get the same issue.

Adding --without-manpage might get you past this issue.

>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_4B2AF48D-0ED4-4F37-A29F-1E1E7ACDE8A7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaUG94ACgkQuwUzVZGdMxQvlgCfZKx7VtXruiyWO8CXW5yliszP
f/8An1/Y5ylxO//7lrBM17FTdDjIj8pG
=pWQC
-----END PGP SIGNATURE-----

--Apple-Mail=_4B2AF48D-0ED4-4F37-A29F-1E1E7ACDE8A7--
