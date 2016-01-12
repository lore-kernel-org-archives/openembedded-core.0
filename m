Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 81A466FF84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 01:22:08 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id yy13so237528241pab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 17:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=L4zYCkgTEGJsr6fAX0mQiocuhgnWUhKdmH/B9LDUhNA=;
	b=yPKDwtfIoFR2hKX+H9qWiAl4Y3W4mQrnf4MBi98ZCeJmKvUelXjlIxTTzLs5knploZ
	B0IdW8wu3M7Lv3YbwMsbFI7SgHB6wcWGIZgBGJ5dAlZjAKcG+LIX9msBU8JHZ3PKDvJ4
	XQSoHwH1Q3BXUTyYevNJ5gGqedNjMjefs7gV4ctRJCnhJZgG0kyLzoYRVHCrzLn7z0HR
	bno3/VC2LvJop1QForLLV7xG9lK+369GZfQCaeVQXKBcVJkHqK6wtD6ShXHe/wDQ0MCi
	AXfjFth395iEbWkAOGrfhVPu3j0BxdVzbB8FUe0ABNda+JQUmKXlH0qMvaalaq3x+8Ye
	Webw==
X-Received: by 10.67.24.104 with SMTP id ih8mr185580427pad.124.1452561729570; 
	Mon, 11 Jan 2016 17:22:09 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:409b:83af:918e:bae1?
	([2601:646:8802:5d5c:409b:83af:918e:bae1])
	by smtp.gmail.com with ESMTPSA id
	y76sm25885011pfi.39.2016.01.11.17.22.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 17:22:08 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <56945377.8090400@windriver.com>
Date: Mon, 11 Jan 2016 17:22:03 -0800
Message-Id: <A9378EF7-4AEB-481E-B110-FE1B872BE173@gmail.com>
References: <cover.1452472146.git.hongxu.jia@windriver.com>
	<f0764a042c923ae4be18160a550873524df057dd.1452472146.git.hongxu.jia@windriver.com>
	<56945377.8090400@windriver.com>
To: Randy MacLeod <randy.macleod@windriver.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/9] pax-utils: 1.0.5 -> 1.1.4
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
X-List-Received-Date: Tue, 12 Jan 2016 01:22:09 -0000
X-Groupsio-MsgNum: 75894
Content-Type: multipart/signed;
	boundary="Apple-Mail=_407B3E84-147E-4C69-A449-CDF822441637";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_407B3E84-147E-4C69-A449-CDF822441637
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 11, 2016, at 5:14 PM, Randy MacLeod =
<randy.macleod@windriver.com> wrote:
>=20
> On 2016-01-10 07:30 PM, Hongxu Jia wrote:
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>  .../pax-utils/{pax-utils_1.0.5.bb =3D> pax-utils_1.1.4.bb}           =
   | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta/recipes-devtools/pax-utils/{pax-utils_1.0.5.bb =3D> =
pax-utils_1.1.4.bb} (83%)
>>=20
>> diff --git a/meta/recipes-devtools/pax-utils/pax-utils_1.0.5.bb =
b/meta/recipes-devtools/pax-utils/pax-utils_1.1.4.bb
>> similarity index 83%
>> rename from meta/recipes-devtools/pax-utils/pax-utils_1.0.5.bb
>> rename to meta/recipes-devtools/pax-utils/pax-utils_1.1.4.bb
>> index 0716a08..6c96780 100644
>> --- a/meta/recipes-devtools/pax-utils/pax-utils_1.0.5.bb
>> +++ b/meta/recipes-devtools/pax-utils/pax-utils_1.1.4.bb
>> @@ -9,8 +9,8 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Deb723b61539feef013de476e68b5c50a"
>>=20
>>  SRC_URI =3D =
"http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz"
>>=20
>> -SRC_URI[md5sum] =3D "d731f5385682a7a62ee2e7b7dacc13a7"
>> -SRC_URI[sha256sum] =3D =
"f69a9938e4af7912d26d585094bc0203e43571a990fdd048319088a8b8ad906f"
>> +SRC_URI[md5sum] =3D "1bfbb5237881f0c5e476b2f7ffcc00d5"
>> +SRC_URI[sha256sum] =3D =
"796860fbd48c5f811e699e8492dc1110459bad0a62efa8d346b74a4f6f556414"
>>=20
>>  RDEPENDS_${PN} +=3D "bash python"
>>=20
>=20
> FYI,
>=20
> This looked like it might be a significant upgrade but
> I checked it out and it's not that big a deal as shown below.

it seems to indicate that it will use pkg-config to detect libcap
but the dependency is floating as recipe doesnt express this either
using DEPENDS or some other exclusion logic if this dep is to be =
disabled by default.

>=20
> I like to see a diffstat and if present a ChangeLog diff
> on package uprev. Do people think that's worthwhile
> so that there's evidence that we've looked at the package
> changes and thought about the impact to the YP build?
> Again, in this case, there's no ChangeLog and the commits
> and diffstat don't reveal interesting new functionality to me
> at least.

I think that would be an improvement. A link to diffs on upstream SCM  =
should be enough too.

>=20
>=20
> ../Randy
>=20
>=20
> $ git clone git://anongit.gentoo.org/proj/pax-utils.git pax-utils.git
> $ cd pax-utils.git
> $ git diff v1.0.5..v1.1.4 | diffstat
> b/Makefile        |   57 ++++++-----
> b/Makefile.am     |   52 +++++++++-
> b/configure.ac    |   18 +++
> b/dumpelf.c       |    1
> b/lddtree.py      |    6 -
> b/lddtree.sh      |   20 +++
> b/make-tarball.sh |    2
> b/paxelf.c        |    2
> b/paxinc.h        |    7 +
> b/paxmacho.h      |    2
> b/porting.h       |   23 +++-
> b/pspax.c         |    4
> b/scanelf.c       |   81 +++++++++-------
> b/scanmacho.c     |    5
> b/security.c      |  272 +++++++++++++++++++++++++++++++++++++++++...+
> b/security.h      |   29 +++++
> man/.cvsignore    |    1
> 17 files changed, 507 insertions(+), 75 deletions(-)
>=20
> $ git log --oneline v1.0.5..v1.1.4 | wc -l
> 22
>=20
> $ git log --oneline v1.0.5..v1.1.4
> 353a328 security: whitelist the getcwd syscall
> a7ec3aa porting: fix android builds
> 9575f81 security: fix build on systems w/out si_syscall
> 1f7a936 security: whitelist the futex syscall
> ee6925b security: whitelist dup syscalls
> 6fa4f46 security: do not warn when seccomp is disabled in the kernel
> c39a557 security: whitelist fakeroot syscalls
> bcb6683 security: add a debug handler for seccomp
> 9d0a60f build: add plumbing for building w/debug code
> 6e0e840 security: clean up syscall ifdefs
> d6fcdb5 security: use seccomp to lock ourselves down
> bdf41eb security: lock down privs a bit via prctl
> a743806 security: leverage namespaces to restrict the runtime a bit
> ef15f60 lddtree.sh: fix interp handling when doing a full listing
> 5e8a1d4 lddtree.py: fix glob handling w/ld.so.conf
> 0fccfd9 avoid using \n with warn macros
> 99f303d build: refresh autotool regen logic for git
> ce30b2e build: use pkg-config for libcap settings
> 0afc2cc scanelf: fix memory leak with the -s option
> 51d892d debug: improve cleanup logic
> cf37405 build: use pkg-config for libcap settings
> ca9a45b use __typeof__ instead of typeof to build with stricter =
standards
>=20
> --
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, =
Canada, K2K 2W5
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_407B3E84-147E-4C69-A449-CDF822441637
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaUVUAACgkQuwUzVZGdMxRxgwCfWPmb1gNTu4ACjPM//GBReS/q
NoUAn2qK7lWVDF2dEF7/0FP7eoSZxPn2
=IOua
-----END PGP SIGNATURE-----

--Apple-Mail=_407B3E84-147E-4C69-A449-CDF822441637--
