Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rd2BQ-0008EH-Rg
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 17:04:53 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 Dec 2011 07:55:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="87720014"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by azsmga001.ch.intel.com with ESMTP; 20 Dec 2011 07:55:45 -0800
Received: from pgsmsx151.gar.corp.intel.com (172.30.236.41) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 20 Dec 2011 23:55:43 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX151.gar.corp.intel.com (172.30.236.41) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Tue, 20 Dec 2011 23:55:42 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Tue, 20 Dec 2011 23:55:41 +0800
From: "Wang, Shane" <shane.wang@intel.com>
To: "Garman, Scott A" <scott.a.garman@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 20 Dec 2011 23:55:39 +0800
Thread-Topic: [OE-core] [oe-commits] Scott Garman : Add missing SUMMARY
	fields to various recipes
Thread-Index: Acy+c6SBDtby+jSATLOW0+g1uj00CQAu+Ivg
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12ED757D6E@shsmsx501.ccr.corp.intel.com>
References: <20111219093447.C6DBE10331@opal>
	<201112191337.39289.schnitzeltony@gmx.de> <4EEF71B1.8050808@intel.com>
	<DFD058B8-C462-492D-A193-9BEEB6E4B590@dominion.thruhere.net>
	<4EEF743C.80908@intel.com>
In-Reply-To: <4EEF743C.80908@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 20 Dec 2011 16:04:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Scott Garman wrote on=A02011-12-20:

> On 12/19/2011 09:21 AM, Koen Kooi wrote:
>>=20
>> Op 19 dec. 2011, om 18:17 heeft Scott Garman het volgende geschreven:
>>=20
>>> On 12/19/2011 04:37 AM, Andreas M=FCller wrote:
>>>> On Monday, December 19, 2011 10:34:47 AM
> git@git.openembedded.org wrote:
>>>>> Module: openembedded-core.git
>>>>> Branch: master
>>>>> Commit: e8c194a627e091ef9da3b7fa83ea3897bd283d9e
>>>>> URL:
>>>>>=20
> http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit;h=3De8
> c194a627
>>>>> e091ef9da3b7fa83ea3897bd283d9e
>>>>>=20
>>>>> Author: Scott Garman<scott.a.garman@intel.com>
>>>>> Date:   Sun Dec 18 15:06:57 2011 -0800
>>>>>=20
>>>>> Add missing SUMMARY fields to various recipes
>>>>>=20
>>>>> This adds the SUMMARY field to the following recipes which were
>>>>> missing it:
>>>>>=20
>>>>> * dosfstools
>>>>> * grep
>>>>> * icu
>>>>> * libevent
>>>>> * libnfsidmap
>>>>> * qemu-helper-nativesdk
>>>>>=20
>>>>> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
>>>>> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
>>>>>=20
>>>>> ---
>>>>>=20
>>>>>   .../nfs-utils/libnfsidmap_0.24.bb                  |    3 ++-
>>>>>   .../recipes-devtools/dosfstools/dosfstools_2.11.bb |    2 +-
>>>>>   .../qemu/qemu-helper-nativesdk_1.0.bb              |    3 ++-
>>>>>   meta/recipes-extended/grep/grep_2.9.bb             |    1 +
>>>>>   meta/recipes-support/icu/icu-3.6.inc               |    1 +
>>>>>   meta/recipes-support/libevent/libevent_1.4.14b.bb  |    3 ++- 6
>>>>>   files changed, 9 insertions(+), 4 deletions(-)
>>>>> diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
>>>>> b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb index
>>>>> 101ecab..eff75ec 100644
>>>>> --- a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
>>>>> +++ b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
>>>>> @@ -1,4 +1,5 @@
>>>>> -DESCRIPTION =3D "nfs idmapping library"
>>>>> +SUMMARY =3D "NFS id mapping library"
>>>>> +DESCRIPTION =3D "NFS id mapping library"
>>>>>   HOMEPAGE =3D "http://www.citi.umich.edu/projects/nfsv4/linux/"
>>>>>   SECTION =3D "libs"
>>>>> diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>>>>> b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb index
>>>>> ec75ac9..eca54f1 100644
>>>>> --- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>>>>> +++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>>>>> @@ -1,7 +1,7 @@
>>>>>   # dosfstools OE build file
>>>>>   # Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights
>>>>> Reserved # Released under the MIT license (see packages/COPYING)
>>>>> -
>>>>> +SUMMARY =3D "DOS FAT Filesystem Utilities"
>>>>>   DESCRIPTION =3D "DOS FAT Filesystem Utilities"
>>>>>  =20
>>>>>   SECTION =3D "base"
>>>>> diff --git a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
>>>>> b/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb index
>>>>> a3dca3d..df0cae0 100644 ---
>>>>> a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb +++
>>>>> b/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb @@ -1,4
>>>>> +1,5 @@ -DESCRIPTION =3D "Qemu helper scripts from Poky" +SUMMARY =3D
>>>>> "Qemu helper scripts" +DESCRIPTION =3D "Qemu helper scripts"
>>>>>   LICENSE =3D "GPLv2"
>>>>>   RDEPENDS_${PN} =3D "qemu-nativesdk"
>>>>>   PR =3D "r9"
>>>>> diff --git a/meta/recipes-extended/grep/grep_2.9.bb
>>>>> b/meta/recipes-extended/grep/grep_2.9.bb index 08ac527..9099bed
>>>>> 100644 --- a/meta/recipes-extended/grep/grep_2.9.bb +++
>>>>> b/meta/recipes-extended/grep/grep_2.9.bb @@ -1,3 +1,4 @@ +SUMMARY =3D
>>>>> "GNU grep utility"
>>>>>   DESCRIPTION =3D "GNU grep utility"
>>>>>   HOMEPAGE =3D "http://savannah.gnu.org/projects/grep/"
>>>>>   BUGTRACKER =3D "http://savannah.gnu.org/bugs/?group=3Dgrep"
>>>>> diff --git a/meta/recipes-support/icu/icu-3.6.inc
>>>>> b/meta/recipes-support/icu/icu-3.6.inc index 8fadc92..e3f9dd2 100644
>>>>> --- a/meta/recipes-support/icu/icu-3.6.inc
>>>>> +++ b/meta/recipes-support/icu/icu-3.6.inc
>>>>> @@ -1,3 +1,4 @@
>>>>> +SUMMARY =3D "International Component for Unicode libraries"
>>>>>   DESCRIPTION =3D "The International Component for Unicode (ICU) is
> a mature,
>>>>> portable set of C/C++ and Java libraries for Unicode support, softwar=
e
>>>>> internationalization (I18N) and globalization (G11N), giving applicat=
ions
>>>>> the same results on all platforms." HOMEPAGE =3D
>>>>> "http://www-01.ibm.com/software/globalization/icu/index.jsp"
>>>>>=20
>>>>> diff --git a/meta/recipes-support/libevent/libevent_1.4.14b.bb
>>>>> b/meta/recipes-support/libevent/libevent_1.4.14b.bb index
>>>>> 1a369b5..36468dc 100644 ---
>>>>> a/meta/recipes-support/libevent/libevent_1.4.14b.bb +++
>>>>> b/meta/recipes-support/libevent/libevent_1.4.14b.bb @@ -1,4 +1,5 @@
>>>>> -DESCRIPTION =3D "an asynchronous event notification library" +SUMMAR=
Y
>>>>> =3D "An asynchronous event notification library" +DESCRIPTION =3D "An
>>>>> asynchronous event notification library"
>>>>>   HOMEPAGE =3D "http://www.monkey.org/~provos/libevent/"
>>>>>   SECTION =3D "libs"
>>>> Sorry I sent it to the wrong list so now again:
>>>>=20
>>>> What is the value - apart HOB's sake - in creating redundancies by
>>>> copying DESRCIPTION to SUMMARY? Why not use DESCRIPTION?
>>>=20
>>> (this is a copy of the email I sent to the oe-devel ML):
>>>=20
>>> Hi Andreas,
>>>=20
>>> I did this because SUMMARY is a required field by the HOB UI. This was
>>> requested by Shane Wang on the oe-core ML:
>>>=20
>>>=20
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/0
> 14600.html
>>>=20
>>> For recipes which have short descriptions, there was little sense in
> summarizing them further, so I duplicated the DESCRIPTION field. Above yo=
u
> can also see an example (in the icu recipe) were I did summarize a long
> DESCRIPTION field.
>>>=20
>>> Mark Hatle replied to this thread explaining why we previously allowed
> SUMMARY to be an optional field and how it automatically inherited from
> DESCRIPTION.
>>=20
>> So if it's automatically inherited why are these patches duplicating it?
>=20
> Hi Koen,
>=20
> Ah, I see why this is still confusing.
>=20
> Shane wrote:
>=20
> "If the summary is missing, bitbake will create a default value for
> summary. That is PN plus string " version " plus its version."
>=20
> So apparently the HOB UI isn't actually "inheriting" the DESCRIPTION fiel=
d.
>=20
> Shane and Mark: can you clarify what the intended behavior is? Why would
> the HOB UI not inherit DESCRIPTION?
>=20
> Scott
>

I don't why. From the HOB 1.1 code, it started to use SUMMARY instead of DE=
SCRIPTION.
Is DESCRIPTION required for a recipe?

--
Shane


