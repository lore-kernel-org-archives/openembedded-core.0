Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rd27J-00086r-SQ
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 17:00:38 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Dec 2011 07:53:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104258461"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by fmsmga002.fm.intel.com with ESMTP; 20 Dec 2011 07:53:12 -0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 20 Dec 2011 23:53:11 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Tue, 20 Dec 2011 23:53:10 +0800
From: "Wang, Shane" <shane.wang@intel.com>
To: Mark Hatle <mark.hatle@windriver.com>, Saul Wold <sgw@linux.intel.com>
Date: Tue, 20 Dec 2011 23:53:08 +0800
Thread-Topic: [OE-core] [oe-commits] Scott Garman : Add missing SUMMARY
	fields to various recipes
Thread-Index: Acy+eX9dpW230UDSRT6+dPL+w9veKQAtQKrg
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12ED757D6D@shsmsx501.ccr.corp.intel.com>
References: <20111219093447.C6DBE10331@opal>
	<201112191337.39289.schnitzeltony@gmx.de> <4EEF71B1.8050808@intel.com>
	<DFD058B8-C462-492D-A193-9BEEB6E4B590@dominion.thruhere.net>
	<4EEF743C.80908@intel.com> <4EEF7819.2020202@windriver.com>
	<4EEF7BB8.8000702@linux.intel.com> <4EEF7E0C.6070902@windriver.com>
In-Reply-To: <4EEF7E0C.6070902@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "Garman, Scott A" <scott.a.garman@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 20 Dec 2011 16:00:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Mark Hatle wrote on=A02011-12-20:

> On 12/19/11 12:00 PM, Saul Wold wrote:
>> On 12/19/2011 09:44 AM, Mark Hatle wrote:
>>> On 12/19/11 11:28 AM, Scott Garman wrote:
>>>> On 12/19/2011 09:21 AM, Koen Kooi wrote:
>>>>>=20
>>>>> Op 19 dec. 2011, om 18:17 heeft Scott Garman het volgende geschreven:
>>>>>=20
>>>>>> On 12/19/2011 04:37 AM, Andreas M=FCller wrote:
>>>>>>> On Monday, December 19, 2011 10:34:47 AM git@git.openembedded.org
>>>>>>> wrote:
>>>>>>>> Module: openembedded-core.git
>>>>>>>> Branch: master
>>>>>>>> Commit: e8c194a627e091ef9da3b7fa83ea3897bd283d9e
>>>>>>>> URL:
>>>>>>>>=20
> http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit;h=3De8
> c194a627
>>>>>>>>=20
>>>>>>>> e091ef9da3b7fa83ea3897bd283d9e
>>>>>>>>=20
>>>>>>>> Author: Scott Garman<scott.a.garman@intel.com>
>>>>>>>> Date: Sun Dec 18 15:06:57 2011 -0800
>>>>>>>>=20
>>>>>>>> Add missing SUMMARY fields to various recipes
>>>>>>>>=20
>>>>>>>> This adds the SUMMARY field to the following recipes which were
>>>>>>>> missing it:
>>>>>>>>=20
>>>>>>>> * dosfstools
>>>>>>>> * grep
>>>>>>>> * icu
>>>>>>>> * libevent
>>>>>>>> * libnfsidmap
>>>>>>>> * qemu-helper-nativesdk
>>>>>>>>=20
>>>>>>>> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
>>>>>>>> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
>>>>>>>>=20
>>>>>>>> ---
>>>>>>>>=20
>>>>>>>> .../nfs-utils/libnfsidmap_0.24.bb | 3 ++-
>>>>>>>> .../recipes-devtools/dosfstools/dosfstools_2.11.bb | 2 +-
>>>>>>>> .../qemu/qemu-helper-nativesdk_1.0.bb | 3 ++-
>>>>>>>> meta/recipes-extended/grep/grep_2.9.bb | 1 +
>>>>>>>> meta/recipes-support/icu/icu-3.6.inc | 1 +
>>>>>>>> meta/recipes-support/libevent/libevent_1.4.14b.bb | 3 ++-
>>>>>>>> 6 files changed, 9 insertions(+), 4 deletions(-)
>>>>>>>>=20
>>>>>>>> diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.=
bb
>>>>>>>> b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb index
>>>>>>>> 101ecab..eff75ec 100644
>>>>>>>> --- a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
>>>>>>>> +++ b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
>>>>>>>> @@ -1,4 +1,5 @@
>>>>>>>> -DESCRIPTION =3D "nfs idmapping library"
>>>>>>>> +SUMMARY =3D "NFS id mapping library"
>>>>>>>> +DESCRIPTION =3D "NFS id mapping library"
>>>>>>>> HOMEPAGE =3D "http://www.citi.umich.edu/projects/nfsv4/linux/"
>>>>>>>> SECTION =3D "libs"
>>>>>>>>=20
>>>>>>>> diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>>>>>>>> b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb index
>>>>>>>> ec75ac9..eca54f1 100644 ---
>>>>>>>> a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb +++
>>>>>>>> b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb @@ -1,7
>>>>>>>> +1,7 @@ # dosfstools OE build file # Copyright (C) 2004-2006,
>>>>>>>> Advanced Micro Devices, Inc. All Rights Reserved # Released under
>>>>>>>> the MIT license (see packages/COPYING) - +SUMMARY =3D "DOS FAT
>>>>>>>> Filesystem Utilities" DESCRIPTION =3D "DOS FAT Filesystem Utilitie=
s"
>>>>>>>>=20
>>>>>>>> SECTION =3D "base" diff --git
>>>>>>>> a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
>>>>>>>> b/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb index
>>>>>>>> a3dca3d..df0cae0 100644 ---
>>>>>>>> a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb +++
>>>>>>>> b/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb @@ -1,4
>>>>>>>> +1,5 @@ -DESCRIPTION =3D "Qemu helper scripts from Poky" +SUMMARY =
=3D
>>>>>>>> "Qemu helper scripts" +DESCRIPTION =3D "Qemu helper scripts"
>>>>>>>> LICENSE =3D "GPLv2" RDEPENDS_${PN} =3D "qemu-nativesdk" PR =3D "r9=
"
>>>>>>>> diff --git a/meta/recipes-extended/grep/grep_2.9.bb
>>>>>>>> b/meta/recipes-extended/grep/grep_2.9.bb index 08ac527..9099bed
>>>>>>>> 100644 --- a/meta/recipes-extended/grep/grep_2.9.bb +++
>>>>>>>> b/meta/recipes-extended/grep/grep_2.9.bb @@ -1,3 +1,4 @@ +SUMMARY
>>>>>>>> =3D "GNU grep utility" DESCRIPTION =3D "GNU grep utility" HOMEPAGE=
 =3D
>>>>>>>> "http://savannah.gnu.org/projects/grep/" BUGTRACKER =3D
>>>>>>>> "http://savannah.gnu.org/bugs/?group=3Dgrep" diff --git
>>>>>>>> a/meta/recipes-support/icu/icu-3.6.inc
>>>>>>>> b/meta/recipes-support/icu/icu-3.6.inc index 8fadc92..e3f9dd2
>>>>>>>> 100644 --- a/meta/recipes-support/icu/icu-3.6.inc +++
>>>>>>>> b/meta/recipes-support/icu/icu-3.6.inc @@ -1,3 +1,4 @@ +SUMMARY =
=3D
>>>>>>>> "International Component for Unicode libraries" DESCRIPTION =3D
>>>>>>>> "The International Component for Unicode (ICU) is a mature,
>>>>>>>> portable set of C/C++ and Java libraries for Unicode support,
>>>>>>>> software internationalization (I18N) and globalization (G11N),
>>>>>>>> giving applications the same results on all platforms." HOMEPAGE
>>>>>>>> =3D "http://www-01.ibm.com/software/globalization/icu/index.jsp"
>>>>>>>>=20
>>>>>>>> diff --git a/meta/recipes-support/libevent/libevent_1.4.14b.bb
>>>>>>>> b/meta/recipes-support/libevent/libevent_1.4.14b.bb index
>>>>>>>> 1a369b5..36468dc
>>>>>>>> 100644
>>>>>>>> --- a/meta/recipes-support/libevent/libevent_1.4.14b.bb
>>>>>>>> +++ b/meta/recipes-support/libevent/libevent_1.4.14b.bb
>>>>>>>> @@ -1,4 +1,5 @@
>>>>>>>> -DESCRIPTION =3D "an asynchronous event notification library"
>>>>>>>> +SUMMARY =3D "An asynchronous event notification library"
>>>>>>>> +DESCRIPTION =3D "An asynchronous event notification library"
>>>>>>>> HOMEPAGE =3D "http://www.monkey.org/~provos/libevent/"
>>>>>>>> SECTION =3D "libs"
>>>>>>> Sorry I sent it to the wrong list so now again:
>>>>>>>=20
>>>>>>> What is the value - apart HOB's sake - in creating redundancies by
>>>>>>> copying
>>>>>>> DESRCIPTION to SUMMARY? Why not use DESCRIPTION?
>>>>>>=20
>>>>>> (this is a copy of the email I sent to the oe-devel ML):
>>>>>>=20
>>>>>> Hi Andreas,
>>>>>>=20
>>>>>> I did this because SUMMARY is a required field by the HOB UI. This
>>>>>> was requested by Shane Wang on the oe-core ML:
>>>>>>=20
>>>>>>=20
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/0
> 14600.html
>>>>>>=20
>>>>>>=20
>>>>>> For recipes which have short descriptions, there was little sense in
>>>>>> summarizing them further, so I duplicated the DESCRIPTION field.
>>>>>> Above you can also see an example (in the icu recipe) were I did
>>>>>> summarize a long DESCRIPTION field.
>>>>>>=20
>>>>>> Mark Hatle replied to this thread explaining why we previously
>>>>>> allowed SUMMARY to be an optional field and how it automatically
>>>>>> inherited from DESCRIPTION.
>>>>>=20
>>>>> So if it's automatically inherited why are these patches duplicating =
it?
>>>>=20
>>>> Hi Koen,
>>>>=20
>>>> Ah, I see why this is still confusing.
>>>>=20
>>>> Shane wrote:
>>>>=20
>>>> "If the summary is missing, bitbake will create a default value for
>>>> summary. That is PN plus string " version " plus its version."
>>>>=20
>>>> So apparently the HOB UI isn't actually "inheriting" the DESCRIPTION
>>>> field.
>>>>=20
>>>> Shane and Mark: can you clarify what the intended behavior is? Why
>>>> would the HOB UI not inherit DESCRIPTION?
>>>=20
>>> I don't know. Within the bitbake.conf there is:
>>>=20
>>> DESCRIPTION ?=3D "${SUMMARY}"
>>>=20
>>> So it should just work...
>=20
> I just realized, I had it backwards.. DESCRIPTION automatically inherits
> SUMMARY if SUMMARY is empty..  SUMMARY thought is simply the version
> string.
>=20
>> It does work just not what HOB is looking for, HOB seems to be looking
>> for a SUMMARY not DESCRIPTION first.  So if there is no SUMMARY HOB
>> gets the bitbake.conf default of: SUMMARY ?=3D "${PN} version ${PV}-${PR=
}"
>>=20
>> Maybe HOB can be fixed to check if the ${SUMMARY} first word is ${PN}
>> then use ${DESCRIPTION} instead of requiring all recipes have a
> SUMMARY?
>=20
> Hmm..  I don't think that is the right solution.  If HOB wants a SUMMARY
> then SUMMARY is correct.. if it want's more descriptive info then it
> should go to DESCRIPTION.
>=20
> It sounds like these packages either need the DESCRIPTION changed to
> SUMMARY -- or we need to change the way we're inheriting the variables.=20
> It's been too long now since the original implementation to remember all
> of the permutations...
>=20
> --Mark
>=20
>> my 2 cents
>>=20
>> Sau!
>>=20
>>=20
>>> --Mark
>>>=20
>>>> Scott
>>>>=20

I agree with Mark at this point. Another case is what if a recipe has a sum=
mary but the summary starts with ${PN}? Extremely the summary *is* ${PN} ve=
rsion ${PV}-${PR}, then we get the description as the replacement, that is =
wrong.

HOB could get either summary or description or whatever, are both optional?

--
Shane


