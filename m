Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 645E1770A6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 17:24:17 +0000 (UTC)
Received: by pacfv12 with SMTP id fv12so81916359pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 10:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=NENvACzmFJ7fhH/1QvrBwcHQHmGfz3rgV/GOeagmnsw=;
	b=pXYwIGXiljUoXdhxWD19JNpm6LLSr0vfFhluwE3vFoRDR9V09ZtjFJZMncpem0C9Sw
	cPpavls3tkRSNc7uuKham7dv81DhpI2/bHMocXH4ptBtMHH1+oCP/4QmuosrX2QVtIN7
	e5CNGwizmkJyvYB1hpCJ9kUDsHOWspd/JoQyuNbx65EZ4oR9fiWULrBMetUwjbX/j7L4
	0Pm9cPGMTX+VabdsiEIukwJCbOgeNI+oa4+5V6GtgOHp8TUEhLqgdklHEuWZaIQ2Jip7
	YU+p5uy/my6atQ5NnsrVSHG2ijz1MCDPomu1cHnXSbhq2sJQsdAyuHL1oQTMgrcfHbKg
	JEBQ==
X-Received: by 10.67.4.9 with SMTP id ca9mr13708250pad.90.1443720257357;
	Thu, 01 Oct 2015 10:24:17 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:1076:caaf:c951:400f?
	([2601:646:8601:4580:1076:caaf:c951:400f])
	by smtp.gmail.com with ESMTPSA id f5sm7807859pas.23.2015.10.01.10.24.15
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 01 Oct 2015 10:24:16 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1443713835.14733.13.camel@linuxfoundation.org>
Date: Thu, 1 Oct 2015 10:24:11 -0700
Message-Id: <3712B443-8857-41CB-87F9-DFFC12FE69E9@gmail.com>
References: <1443709445.14733.5.camel@linuxfoundation.org>
	<CAMKF1spovYNRYZQjaghtiRdJtgs3BxHqotiv-t7n2h0DStiiDA@mail.gmail.com>
	<1443713835.14733.13.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3094)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Branched for release
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
X-List-Received-Date: Thu, 01 Oct 2015 17:24:21 -0000
X-Groupsio-MsgNum: 71853
Content-Type: multipart/signed;
	boundary="Apple-Mail=_34381158-9E1E-4CBC-A422-9A685072AE1A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_34381158-9E1E-4CBC-A422-9A685072AE1A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 1, 2015, at 8:37 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Thu, 2015-10-01 at 07:28 -0700, Khem Raj wrote:
>> On Thu, Oct 1, 2015 at 7:24 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> Just a heads up for people that we've branched for release and that
>>> jethro branches are now available. Bitbake branched as 1.28, I =
decided
>>> to save bitbake 2.0 for another occasion.
>>=20
>> what would be the occasion ?
>=20
> Memory resident Bitbake? Toaster developments? Logging improvements? =
New
> shell commands?
>=20

bitbake is tied ot OE metadata, even though its a separate repository, =
it can be viewed
as any other metadata layer.Moreover I don=E2=80=99t know if there are =
any other projects besides OE using
it. All above look good features but not clear whats there relation to =
bumping major release
number. Do they make 1.9 incompatible in some different ways than that =
we don=E2=80=99t do between 1.x releases ?

>> this time lets branch consistently. Across different repositories
>> please.
>=20
> Bitbake is the only repo which doesn't use the branch codename. I did
> write at length about how version numbers as branches would actually
> cause much more pain than any problem they solve, bitbake is one of =
the
> few exceptions to that given its a tool, not metadata and has a more
> consistent history where the version number means something specific =
and
> is actively used.
>=20
>>  I would also suggest to not use codenames in branches
>> but rather the numbered release. If we want to use codenames for
>> branches then lets drop the numbered release names.
>=20
> The number does have some uses, its really not that simple.
>=20

They do tell me the chronology of releases I get that but then I don=E2=80=
=99t understand
why can=E2=80=99t be use it in name for branching then, why does it have =
to be no relation
between branch and release names ?

I am not sure if you are aware enough of the confusion it causes to new =
users, not all distros
use combo layer like tools to fudge the layer identities and create a =
new repositories where this can be less
of the problem since the new repository could have its own versioning =
scheme.


> If we want to discuss this all again, so be it, but on the eve of
> release really isn't the time to start it all again.

so when is the right time ? Do we have long enough pre-notice about when =
we the branching is going to happen?

>=20
> Cheers,
>=20
> Richard
>=20


--Apple-Mail=_34381158-9E1E-4CBC-A422-9A685072AE1A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYNbD8ACgkQuwUzVZGdMxSjWgCfRPVRL/+Kf1EgUSVKDHynXmER
YesAoJJcYSBpE2GT6c4ZTvKINdXjjd7r
=w95m
-----END PGP SIGNATURE-----

--Apple-Mail=_34381158-9E1E-4CBC-A422-9A685072AE1A--
