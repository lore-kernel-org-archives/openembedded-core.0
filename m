Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 091D171633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 16:19:42 +0000 (UTC)
Received: by pabzx8 with SMTP id zx8so67403902pab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 09:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=F1Y/fA8NzuyUET7YWa4e/XTDPTenfrRE9IMJONAIwcY=;
	b=jNGrPqJ0LKB5Yq2BIWXNYt9IA/Vba6P5TC+xive78D5gKGHUtPQg8oZu+0D3kwV60B
	fkEm8g2itDPvQZzN3ebylc44um70ZJKizfePXxv+jh8xU+HCFPwfhTvQTROcr//Clr78
	0jGGax7ENdNB5+EthQPD+5qIlOabVADAn5AoRJ3uxr5lOfcpalBGtAMJ7A0Fca94WxZc
	ehjhK0mz1C+Q8Ka1r202zpRa94vVx5fhPxtc2RLBDpXq7vhEMmM+Zus8DgXcUN9IAQfb
	sL6JS1JDxWRWfhvYrqoCBjJDdE9a8T1uGM8mAcEIOQJdUHrqfstJQWqblXV43sMEFRUw
	1NSA==
X-Received: by 10.66.219.5 with SMTP id pk5mr16383712pac.111.1440778782639;
	Fri, 28 Aug 2015 09:19:42 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:a198:973e:c045:c666?
	([2601:646:8601:4580:a198:973e:c045:c666])
	by smtp.gmail.com with ESMTPSA id a2sm6256434pas.47.2015.08.28.09.19.40
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Aug 2015 09:19:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55E0821B.6000207@windriver.com>
Date: Fri, 28 Aug 2015 09:19:36 -0700
Message-Id: <D973C45A-59AB-4706-B45B-BAC5062A15E6@gmail.com>
References: <1440731387-19733-1-git-send-email-Randy.MacLeod@windriver.com>
	<55DFD2BC.7070405@windriver.com>
	<CAMKF1sqfoWLWxvEGbo_fLHjZOd2au=YAC-Hx4z8JJ=tNQoZfBg@mail.gmail.com>
	<55E0821B.6000207@windriver.com>
To: Randy MacLeod <randy.macleod@windriver.com>
X-Mailer: Apple Mail (2.2104)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-source: exlude from world
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
X-List-Received-Date: Fri, 28 Aug 2015 16:19:44 -0000
X-Groupsio-MsgNum: 70252
Content-Type: multipart/signed;
	boundary="Apple-Mail=_182C7CAF-78E8-44A1-9586-E2C494DD5202";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_182C7CAF-78E8-44A1-9586-E2C494DD5202
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 28, 2015, at 8:45 AM, Randy MacLeod =
<randy.macleod@windriver.com> wrote:
>=20
> On 2015-08-27 11:27 PM, Khem Raj wrote:
>> On Thu, Aug 27, 2015 at 8:17 PM, Randy MacLeod
>> <randy.macleod@windriver.com> wrote:
>>>=20
>>> I've sent the parent email to fix
>>> $ bitbake -c <stage> world.
>>> I've confirmed that my change works for:
>>> $ bitbake -c configure world
>>>=20
>>> I wasn't sure if I should leave gcc-source as
>>> is or change it to be similar to kernel-devsrc
>>> because meta/recipes-devtools/gcc/gcc-source.inc does:
>>>=20
>>> deltask do_configure
>>> deltask do_compile
>>> deltask do_package
>>=20
>> if a task is deleted and you do -c <that-task> then you should get an
>> error. deltask would create no stamps as opposed to noop tasks. May =
be
>> it can be turned into warning ( not convinced for that too)
>> but excluding it world doesn't sound a good solution here.
>=20
> I'd be happy to change the deltask lines to do_foo[noexec] =3D "1"
> if people agree on that. Would that work for you Khem?
>=20

it should work for the toolchain bootstrapping. If it does then probably =
we can live with it

> The kernel-devsrc and gcc-source packages are really
> a different class of recipes from -native or target and if
> we had more than two of them, we should create a class to
> encapsulate their behaviour and ensure that they don't
> break bitbake -c <stage> world builds. I haven't tried that
> yet but I expect the class would just have the do_foo[noexec] =3D "1"
> so you don't have to type it in each of the two recipes of this
> type that we currently have! :)
>=20
> I'd like to do the:
>   do_foo[noexec] =3D "1"
> now and figure out how to handle foo-source in 2.1. Agreed?
>=20
> I'll include the [YOCTO #7878] in a v2 once I get some
> guidance on what is acceptable.
>=20
> ../Randy
>=20
>=20
>>=20
>>> ...
>>>=20
>>> whereas meta/recipes-kernel/linux/kernel-devsrc.bb does:
>>> # There's nothing to do here, except install the source where we can =
package
>>> it
>>> do_fetch[noexec] =3D "1"
>>> do_unpack[noexec] =3D "1"
>>> do_patch[noexec] =3D "1"
>>> ...
>>>=20
>>> The kernel-devsrc approach doesn't break world builds
>>> but it's probably slightly less efficient.
>>>=20
>>> Also do people care about consistency in naming:
>>>   gcc-source.inc vs
>>>   kernel-devsrc.bb
>>> ? There are only two such 'source' packages so it's not a big deal.
>>>=20
>>> ../Randy
>>>=20
>>>=20
>>>=20
>>> On 2015-08-27 11:09 PM, Randy MacLeod wrote:
>>>>=20
>>>> Exclude all versions of gcc-source from world builds so that:
>>>>     bitbake -c <stage> world
>>>> will work. gcc-source deletes most bitbake build stages
>>>> since it is a source-only package.
>>>>=20
>>>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>>>> ---
>>>>   meta/recipes-devtools/gcc/gcc-source_4.8.bb | 2 ++
>>>>   meta/recipes-devtools/gcc/gcc-source_4.9.bb | 2 ++
>>>>   meta/recipes-devtools/gcc/gcc-source_5.2.bb | 2 ++
>>>>   3 files changed, 6 insertions(+)
>>>>=20
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-source_4.8.bb
>>>> b/meta/recipes-devtools/gcc/gcc-source_4.8.bb
>>>> index 234b82e..b890fa3 100644
>>>> --- a/meta/recipes-devtools/gcc/gcc-source_4.8.bb
>>>> +++ b/meta/recipes-devtools/gcc/gcc-source_4.8.bb
>>>> @@ -1,2 +1,4 @@
>>>>   require recipes-devtools/gcc/gcc-${PV}.inc
>>>>   require recipes-devtools/gcc/gcc-source.inc
>>>> +
>>>> +EXCLUDE_FROM_WORLD =3D "1"
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-source_4.9.bb
>>>> b/meta/recipes-devtools/gcc/gcc-source_4.9.bb
>>>> index 234b82e..b890fa3 100644
>>>> --- a/meta/recipes-devtools/gcc/gcc-source_4.9.bb
>>>> +++ b/meta/recipes-devtools/gcc/gcc-source_4.9.bb
>>>> @@ -1,2 +1,4 @@
>>>>   require recipes-devtools/gcc/gcc-${PV}.inc
>>>>   require recipes-devtools/gcc/gcc-source.inc
>>>> +
>>>> +EXCLUDE_FROM_WORLD =3D "1"
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-source_5.2.bb
>>>> b/meta/recipes-devtools/gcc/gcc-source_5.2.bb
>>>> index 234b82e..b890fa3 100644
>>>> --- a/meta/recipes-devtools/gcc/gcc-source_5.2.bb
>>>> +++ b/meta/recipes-devtools/gcc/gcc-source_5.2.bb
>>>> @@ -1,2 +1,4 @@
>>>>   require recipes-devtools/gcc/gcc-${PV}.inc
>>>>   require recipes-devtools/gcc/gcc-source.inc
>>>> +
>>>> +EXCLUDE_FROM_WORLD =3D "1"
>>>>=20
>>>=20
>>>=20
>>> --
>>> # Randy MacLeod. SMTS, Linux, Wind River
>>> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, =
Canada,
>>> K2K 2W5
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20
> --
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, =
Canada, K2K 2W5


--Apple-Mail=_182C7CAF-78E8-44A1-9586-E2C494DD5202
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXgihsACgkQuwUzVZGdMxS7eACeNDcQkFRiCUftTM4wwt9YSIbQ
9JoAn3lqefekQIapvKWQBpTc4spK9Kcq
=lSHH
-----END PGP SIGNATURE-----

--Apple-Mail=_182C7CAF-78E8-44A1-9586-E2C494DD5202--
