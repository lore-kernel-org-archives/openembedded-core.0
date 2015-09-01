Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1160076B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 17:21:07 +0000 (UTC)
Received: by padan5 with SMTP id an5so2179052pad.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 10:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=NYWIsBHgDiYtLVaJfDg2UOrQfKvRYNFttQcHooGAMFE=;
	b=vebSeP/T3rLUQvY22Rbsz0dFgb6ZFeVZLRNgivUwd7GTz+VqL6JfyKxB3FJ0HUt4mZ
	/YmuWDtqciNYMpIYWz7hKGaWhS1SUHB464iJUpGrtPMvZLItFX/chtugIqvmHM8vQFnB
	kCKb8ZTbj/6YZ+H0gdp6ZZYjfregtba7CaJ7Z9Eg3E1iw4+rKRMFIUrcLL1cQy3+oErm
	QLF3j8eUJWTGsGdNvo2iAst3YLl3GzbjytJEjHQFAmxYXyjS1JXggdLXwe+fXUsUU1jH
	PGML8jhMi3VAKvibXItp+f5VSL0KoNZF0ALlnwCdYN4UH/rAEq3z9Z+cGgpwsB1xoEb2
	2u+w==
X-Received: by 10.68.168.161 with SMTP id zx1mr48870965pbb.35.1441128067327;
	Tue, 01 Sep 2015 10:21:07 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:f406:2324:ffaf:a6f9?
	([2601:646:8601:4580:f406:2324:ffaf:a6f9])
	by smtp.gmail.com with ESMTPSA id
	o3sm18589352pap.37.2015.09.01.10.21.06
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Sep 2015 10:21:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55E4AE5F.9080804@windriver.com>
Date: Tue, 1 Sep 2015 10:21:01 -0700
Message-Id: <8D7C11A3-E025-42B1-AA13-545BCBE17226@gmail.com>
References: <1440952270-9085-1-git-send-email-raj.khem@gmail.com>
	<CAPhnLPBue6s_m7rYYyuy6hyxdBTz8y1MedgspDeOLcL1XaunYQ@mail.gmail.com>
	<CAMKF1srWus=7f3EoCGtMVez0FbsFPsa1g8COMM87pqxxpkg2zw@mail.gmail.com>
	<CABcZANmWhU5sFXSU1j=3GOPu0gOCY3Nt_b54oQkRLhzs=ERSYQ@mail.gmail.com>
	<55E4940B.5050105@windriver.com>
	<CAMKF1sqSTenmfkQst644-c0yGHmheSE0APwOR7cHK_5-T_d4mQ@mail.gmail.com>
	<55E4AE5F.9080804@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.2104)
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xz: Correctly specify GPL-3.0 with autoconf exception
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
X-List-Received-Date: Tue, 01 Sep 2015 17:21:10 -0000
X-Groupsio-MsgNum: 70422
Content-Type: multipart/signed;
	boundary="Apple-Mail=_619E5708-7529-4F58-8771-410E91450DF6";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_619E5708-7529-4F58-8771-410E91450DF6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 31, 2015, at 12:43 PM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
>=20
> On 8/31/15 2:20 PM, Khem Raj wrote:
>> On Mon, Aug 31, 2015 at 10:51 AM, Mark Hatle =
<mark.hatle@windriver.com> wrote:
>>>=20
>>> The way the recipe 'LICENSE =3D' field was defined, AFAIK, was that =
it was the
>>> license of the source used to construct the binaries.
>>>=20
>>> So if the autoconf was GPLv3, but the package and it's sources are =
GPLv2+, it
>>> would be listed as GPLv2+.
>>>=20
>>> Making this assumption allows us to be confident that the general =
license of
>>> recipe matches the binaries constructed by the recipe, allowing =
LICENSE-${PN} =3D
>>> ${LICENSE} in the general case.
>>>=20
>>=20
>> it seems in your view the build system or generator files are
>> excluded. Which we can not say untill and until the generator files
>> say that explicitly like the autoconf exception.  In my understanding
>> the build scripts and files also form the part of compilatiion
>> process.
>=20
> My interpretation of many licenses is that the build system does not =
get
> compiled into the binary.  Thus the binary does not get impacted by =
the build
> system's license.

Not entirely always the case. e.g. autotools generate config.h that your =
program will use.
and unless automake license gives you that exception your assumption is =
invalid, thats one example
there are many such cases with other build systems you might use which =
has different license cadence
then the code that produce what you call binary. e.g. With gplv3 the =
process of creation is also included
as part of compliance.

>=20
> That isn't to say that autoconf isn't GPLv3, just that it doesn't =
contaminate
> the binaries in question, under normal usage.  (If a build component, =
or the
> output of a component WERE to influence the license of the produced =
executable
> -- then I would expect it to be listed in the LICENSE field....)
>=20
> If every package that included autoconf now had to have GPLv3 listed =
in it, I
> think this would diminish the usefulness of the LICENSE field.  This =
would
> effectively confuse the developers into thinking that suddenly =
-everything-
> autoconf is now GPLv3, even though it isn't in my opinion.

with auto tools issue is moot since by default it adds the exception to =
generated artifacts
but it could be valid if some component does not want the defaults.

>=20
> The majority of the developers in my experience really don't care =
about source
> code license -- they care about the license of the binaries in their =
deployed
> products.  (The license of the binaries over source is an important =
distinction.
> I ship binaries to my customers, as such I'm required to full fill the
> obligations of the software license to those binaries.  Many open =
sources
> license require you to redistribute the corresponding sources with the =
binaries,
> and some have been interpreted to say you need to include the =
instructions for
> building them as well.)

again you are painting it with a broad brush, where as you have to be =
particular about
component licenses, each one has its own obligations, in the end ODM is =
one who have to split
the hairs but if OE could help in this regard is what we are discussing =
here and adding
a source license is a good step.

>=20
> Declaring the licenses based on the source code used to produce the =
output is
> the standard way of handling this from my experiences.  This matches =
the way
> Debian and other distributions recognized sources and have dealt with =
the
> license fields in their distributions, such as Debian, Fedora, etc.  I =
think
> it's a pretty major change to start including the license of all files =
in a
> source archive in the recipe.  (Especially if the files are never =
distributed
> except as part of the 'original source code' for a program.)
>=20
> If that is the way we want to move forward, then my recommendation =
would be to
> add a new field for that.
>=20
> LICENSE-SRC =3D "source license list"
> LICENSE =3D "declared license for the expected output of the build"
> LICENSE_<package> =3D "The license for the items in this specific =
package"
>=20
> Where:
>=20
> LICENSE ?=3D "${LICENSE-SRC}"
>=20
> LICENSE_<package> ?=3D "${LICENSE}"
>=20
> I see a lot of potential work here, but I don't see the benefit =
though.
>=20
> I don't know of any cases where someone has gotten in trouble, or even
> questioned, when the build system has a slightly different license =
then output
> of the build.  The GNU build tools are definitely the biggest example =
I can give
> here.

if we help with compliance, chances of trouble decreases


>=20
>>> This does certainly put in an interesting situation though if there =
is an
>>> obscure license where the binaries and sources are effectively under =
different
>>> restrictions.  (Perhaps if a build environment contained a license =
that required
>>> an advertising clause, but the produced binaries did not include it. =
 The
>>> obligation to advertise or not could be up for some debate by a =
lawyer, even
>>> though the source code may need to be redistributed.)
>>=20
>> We may not treat build system differently than other sources of =
component.
>=20
> Here I disagree.  I think as long as the build system doesn't change =
the license
> of the resulting binaries in anyway, and the build system doesn't have =
a license
> that conflicts with the resulting binaries, then we can certainly =
treat the
> results differently.
>=20
> (I'm not a lawyer, and frankly this is getting into the position where =
a lawyer,
> if one were inclined, should be consulted for advice.)
>=20
> As usual the goal here is to give the technical people the information =
they need
> to have a reasonable chance of being compliant with the license =
requirements of
> the binaries/systems/devices they are creating -- as well as giving =
them at
> least some assistance in being a 'good' open source citizen to be able =
to
> redistribute the sources for the Open Source components they have =
used.)
>=20
>>>=20
>>> Do you know of any cases where this may be true or where end users =
may have
>>> concerns that a license is not properly represented?
>>=20
>> proprietary components based on some external build systems may be
>>=20
>=20


--Apple-Mail=_619E5708-7529-4F58-8771-410E91450DF6
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXl3oEACgkQuwUzVZGdMxQtKgCfZou6AYPeVmbyApF+QKe1NMOg
B1QAnjzm2Z3S4rrVEeG3sR9EIHPCEjjl
=pauA
-----END PGP SIGNATURE-----

--Apple-Mail=_619E5708-7529-4F58-8771-410E91450DF6--
