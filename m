Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rch0t-0006j5-Lv
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 18:28:35 +0100
Received: by wgbds11 with SMTP id ds11so9364980wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 09:21:29 -0800 (PST)
Received: by 10.227.59.204 with SMTP id m12mr12733886wbh.10.1324315289057;
	Mon, 19 Dec 2011 09:21:29 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id b5sm26472806wbh.4.2011.12.19.09.21.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Dec 2011 09:21:28 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Mon, 19 Dec 2011 18:21:24 +0100
In-Reply-To: <4EEF71B1.8050808@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20111219093447.C6DBE10331@opal>
	<201112191337.39289.schnitzeltony@gmx.de>
	<4EEF71B1.8050808@intel.com>
Message-Id: <DFD058B8-C462-492D-A193-9BEEB6E4B590@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [oe-commits] Scott Garman : Add missing SUMMARY fields to various recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Dec 2011 17:28:35 -0000
X-Groupsio-MsgNum: 14471
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6A274915-3C22-4223-AF76-4285776E481D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6A274915-3C22-4223-AF76-4285776E481D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 19 dec. 2011, om 18:17 heeft Scott Garman het volgende geschreven:

> On 12/19/2011 04:37 AM, Andreas M=FCller wrote:
>> On Monday, December 19, 2011 10:34:47 AM git@git.openembedded.org =
wrote:
>>> Module: openembedded-core.git
>>> Branch: master
>>> Commit: e8c194a627e091ef9da3b7fa83ea3897bd283d9e
>>> URL:
>>> =
http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit;h=3De8c1=
94a627
>>> e091ef9da3b7fa83ea3897bd283d9e
>>>=20
>>> Author: Scott Garman<scott.a.garman@intel.com>
>>> Date:   Sun Dec 18 15:06:57 2011 -0800
>>>=20
>>> Add missing SUMMARY fields to various recipes
>>>=20
>>> This adds the SUMMARY field to the following recipes which were
>>> missing it:
>>>=20
>>> * dosfstools
>>> * grep
>>> * icu
>>> * libevent
>>> * libnfsidmap
>>> * qemu-helper-nativesdk
>>>=20
>>> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
>>> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
>>>=20
>>> ---
>>>=20
>>>  .../nfs-utils/libnfsidmap_0.24.bb                  |    3 ++-
>>>  .../recipes-devtools/dosfstools/dosfstools_2.11.bb |    2 +-
>>>  .../qemu/qemu-helper-nativesdk_1.0.bb              |    3 ++-
>>>  meta/recipes-extended/grep/grep_2.9.bb             |    1 +
>>>  meta/recipes-support/icu/icu-3.6.inc               |    1 +
>>>  meta/recipes-support/libevent/libevent_1.4.14b.bb  |    3 ++-
>>>  6 files changed, 9 insertions(+), 4 deletions(-)
>>>=20
>>> diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
>>> b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb index
>>> 101ecab..eff75ec 100644
>>> --- a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
>>> +++ b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
>>> @@ -1,4 +1,5 @@
>>> -DESCRIPTION =3D "nfs idmapping library"
>>> +SUMMARY =3D "NFS id mapping library"
>>> +DESCRIPTION =3D "NFS id mapping library"
>>>  HOMEPAGE =3D "http://www.citi.umich.edu/projects/nfsv4/linux/"
>>>  SECTION =3D "libs"
>>>=20
>>> diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>>> b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb index
>>> ec75ac9..eca54f1 100644
>>> --- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>>> +++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>>> @@ -1,7 +1,7 @@
>>>  # dosfstools OE build file
>>>  # Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights
>>> Reserved # Released under the MIT license (see packages/COPYING)
>>> -
>>> +SUMMARY =3D "DOS FAT Filesystem Utilities"
>>>  DESCRIPTION =3D "DOS FAT Filesystem Utilities"
>>>=20
>>>  SECTION =3D "base"
>>> diff --git a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
>>> b/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb index
>>> a3dca3d..df0cae0 100644
>>> --- a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
>>> +++ b/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
>>> @@ -1,4 +1,5 @@
>>> -DESCRIPTION =3D "Qemu helper scripts from Poky"
>>> +SUMMARY =3D "Qemu helper scripts"
>>> +DESCRIPTION =3D "Qemu helper scripts"
>>>  LICENSE =3D "GPLv2"
>>>  RDEPENDS_${PN} =3D "qemu-nativesdk"
>>>  PR =3D "r9"
>>> diff --git a/meta/recipes-extended/grep/grep_2.9.bb
>>> b/meta/recipes-extended/grep/grep_2.9.bb index 08ac527..9099bed =
100644
>>> --- a/meta/recipes-extended/grep/grep_2.9.bb
>>> +++ b/meta/recipes-extended/grep/grep_2.9.bb
>>> @@ -1,3 +1,4 @@
>>> +SUMMARY =3D "GNU grep utility"
>>>  DESCRIPTION =3D "GNU grep utility"
>>>  HOMEPAGE =3D "http://savannah.gnu.org/projects/grep/"
>>>  BUGTRACKER =3D "http://savannah.gnu.org/bugs/?group=3Dgrep"
>>> diff --git a/meta/recipes-support/icu/icu-3.6.inc
>>> b/meta/recipes-support/icu/icu-3.6.inc index 8fadc92..e3f9dd2 100644
>>> --- a/meta/recipes-support/icu/icu-3.6.inc
>>> +++ b/meta/recipes-support/icu/icu-3.6.inc
>>> @@ -1,3 +1,4 @@
>>> +SUMMARY =3D "International Component for Unicode libraries"
>>>  DESCRIPTION =3D "The International Component for Unicode (ICU) is a =
mature,
>>> portable set of C/C++ and Java libraries for Unicode support, =
software
>>> internationalization (I18N) and globalization (G11N), giving =
applications
>>> the same results on all platforms." HOMEPAGE =3D
>>> "http://www-01.ibm.com/software/globalization/icu/index.jsp"
>>>=20
>>> diff --git a/meta/recipes-support/libevent/libevent_1.4.14b.bb
>>> b/meta/recipes-support/libevent/libevent_1.4.14b.bb index =
1a369b5..36468dc
>>> 100644
>>> --- a/meta/recipes-support/libevent/libevent_1.4.14b.bb
>>> +++ b/meta/recipes-support/libevent/libevent_1.4.14b.bb
>>> @@ -1,4 +1,5 @@
>>> -DESCRIPTION =3D "an asynchronous event notification library"
>>> +SUMMARY =3D "An asynchronous event notification library"
>>> +DESCRIPTION =3D "An asynchronous event notification library"
>>>  HOMEPAGE =3D "http://www.monkey.org/~provos/libevent/"
>>>  SECTION =3D "libs"
>> Sorry I sent it to the wrong list so now again:
>>=20
>> What is the value - apart HOB's sake - in creating redundancies by =
copying
>> DESRCIPTION to SUMMARY? Why not use DESCRIPTION?
>=20
> (this is a copy of the email I sent to the oe-devel ML):
>=20
> Hi Andreas,
>=20
> I did this because SUMMARY is a required field by the HOB UI. This was =
requested by Shane Wang on the oe-core ML:
>=20
> =
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/01460=
0.html
>=20
> For recipes which have short descriptions, there was little sense in =
summarizing them further, so I duplicated the DESCRIPTION field. Above =
you can also see an example (in the icu recipe) were I did summarize a =
long DESCRIPTION field.
>=20
> Mark Hatle replied to this thread explaining why we previously allowed =
SUMMARY to be an optional field and how it automatically inherited from =
DESCRIPTION.

So if it's automatically inherited why are these patches duplicating it?

regards,

Koen=

--Apple-Mail=_6A274915-3C22-4223-AF76-4285776E481D
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7vcpYACgkQMkyGM64RGpEWPQCgmmv4jI84lNHDd2Q1EkKn3qdA
3r0An1WofOc7P34xPYGadKrayCBV5PMt
=45oK
-----END PGP SIGNATURE-----

--Apple-Mail=_6A274915-3C22-4223-AF76-4285776E481D--
