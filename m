Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RchNf-0001nc-Bl
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 18:52:07 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBJHiwnC005956
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Dec 2011 09:44:58 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 19 Dec 2011 09:44:58 -0800
Message-ID: <4EEF7819.2020202@windriver.com>
Date: Mon, 19 Dec 2011 11:44:57 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Scott Garman <scott.a.garman@intel.com>
References: <20111219093447.C6DBE10331@opal>
	<201112191337.39289.schnitzeltony@gmx.de>
	<4EEF71B1.8050808@intel.com>
	<DFD058B8-C462-492D-A193-9BEEB6E4B590@dominion.thruhere.net>
	<4EEF743C.80908@intel.com>
In-Reply-To: <4EEF743C.80908@intel.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	pBJHiwnC005956
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 19 Dec 2011 17:52:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12/19/11 11:28 AM, Scott Garman wrote:
> On 12/19/2011 09:21 AM, Koen Kooi wrote:
>>
>> Op 19 dec. 2011, om 18:17 heeft Scott Garman het volgende geschreven:
>>
>>> On 12/19/2011 04:37 AM, Andreas M=FCller wrote:
>>>> On Monday, December 19, 2011 10:34:47 AM git@git.openembedded.org wr=
ote:
>>>>> Module: openembedded-core.git
>>>>> Branch: master
>>>>> Commit: e8c194a627e091ef9da3b7fa83ea3897bd283d9e
>>>>> URL:
>>>>> http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit;h=
=3De8c194a627
>>>>> e091ef9da3b7fa83ea3897bd283d9e
>>>>>
>>>>> Author: Scott Garman<scott.a.garman@intel.com>
>>>>> Date:   Sun Dec 18 15:06:57 2011 -0800
>>>>>
>>>>> Add missing SUMMARY fields to various recipes
>>>>>
>>>>> This adds the SUMMARY field to the following recipes which were
>>>>> missing it:
>>>>>
>>>>> * dosfstools
>>>>> * grep
>>>>> * icu
>>>>> * libevent
>>>>> * libnfsidmap
>>>>> * qemu-helper-nativesdk
>>>>>
>>>>> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
>>>>> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
>>>>>
>>>>> ---
>>>>>
>>>>>    .../nfs-utils/libnfsidmap_0.24.bb                  |    3 ++-
>>>>>    .../recipes-devtools/dosfstools/dosfstools_2.11.bb |    2 +-
>>>>>    .../qemu/qemu-helper-nativesdk_1.0.bb              |    3 ++-
>>>>>    meta/recipes-extended/grep/grep_2.9.bb             |    1 +
>>>>>    meta/recipes-support/icu/icu-3.6.inc               |    1 +
>>>>>    meta/recipes-support/libevent/libevent_1.4.14b.bb  |    3 ++-
>>>>>    6 files changed, 9 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.b=
b
>>>>> b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb index
>>>>> 101ecab..eff75ec 100644
>>>>> --- a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
>>>>> +++ b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
>>>>> @@ -1,4 +1,5 @@
>>>>> -DESCRIPTION =3D "nfs idmapping library"
>>>>> +SUMMARY =3D "NFS id mapping library"
>>>>> +DESCRIPTION =3D "NFS id mapping library"
>>>>>    HOMEPAGE =3D "http://www.citi.umich.edu/projects/nfsv4/linux/"
>>>>>    SECTION =3D "libs"
>>>>>
>>>>> diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>>>>> b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb index
>>>>> ec75ac9..eca54f1 100644
>>>>> --- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>>>>> +++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>>>>> @@ -1,7 +1,7 @@
>>>>>    # dosfstools OE build file
>>>>>    # Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rig=
hts
>>>>> Reserved # Released under the MIT license (see packages/COPYING)
>>>>> -
>>>>> +SUMMARY =3D "DOS FAT Filesystem Utilities"
>>>>>    DESCRIPTION =3D "DOS FAT Filesystem Utilities"
>>>>>
>>>>>    SECTION =3D "base"
>>>>> diff --git a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.b=
b
>>>>> b/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb index
>>>>> a3dca3d..df0cae0 100644
>>>>> --- a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
>>>>> +++ b/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
>>>>> @@ -1,4 +1,5 @@
>>>>> -DESCRIPTION =3D "Qemu helper scripts from Poky"
>>>>> +SUMMARY =3D "Qemu helper scripts"
>>>>> +DESCRIPTION =3D "Qemu helper scripts"
>>>>>    LICENSE =3D "GPLv2"
>>>>>    RDEPENDS_${PN} =3D "qemu-nativesdk"
>>>>>    PR =3D "r9"
>>>>> diff --git a/meta/recipes-extended/grep/grep_2.9.bb
>>>>> b/meta/recipes-extended/grep/grep_2.9.bb index 08ac527..9099bed 100=
644
>>>>> --- a/meta/recipes-extended/grep/grep_2.9.bb
>>>>> +++ b/meta/recipes-extended/grep/grep_2.9.bb
>>>>> @@ -1,3 +1,4 @@
>>>>> +SUMMARY =3D "GNU grep utility"
>>>>>    DESCRIPTION =3D "GNU grep utility"
>>>>>    HOMEPAGE =3D "http://savannah.gnu.org/projects/grep/"
>>>>>    BUGTRACKER =3D "http://savannah.gnu.org/bugs/?group=3Dgrep"
>>>>> diff --git a/meta/recipes-support/icu/icu-3.6.inc
>>>>> b/meta/recipes-support/icu/icu-3.6.inc index 8fadc92..e3f9dd2 10064=
4
>>>>> --- a/meta/recipes-support/icu/icu-3.6.inc
>>>>> +++ b/meta/recipes-support/icu/icu-3.6.inc
>>>>> @@ -1,3 +1,4 @@
>>>>> +SUMMARY =3D "International Component for Unicode libraries"
>>>>>    DESCRIPTION =3D "The International Component for Unicode (ICU) i=
s a mature,
>>>>> portable set of C/C++ and Java libraries for Unicode support, softw=
are
>>>>> internationalization (I18N) and globalization (G11N), giving applic=
ations
>>>>> the same results on all platforms." HOMEPAGE =3D
>>>>> "http://www-01.ibm.com/software/globalization/icu/index.jsp"
>>>>>
>>>>> diff --git a/meta/recipes-support/libevent/libevent_1.4.14b.bb
>>>>> b/meta/recipes-support/libevent/libevent_1.4.14b.bb index 1a369b5..=
36468dc
>>>>> 100644
>>>>> --- a/meta/recipes-support/libevent/libevent_1.4.14b.bb
>>>>> +++ b/meta/recipes-support/libevent/libevent_1.4.14b.bb
>>>>> @@ -1,4 +1,5 @@
>>>>> -DESCRIPTION =3D "an asynchronous event notification library"
>>>>> +SUMMARY =3D "An asynchronous event notification library"
>>>>> +DESCRIPTION =3D "An asynchronous event notification library"
>>>>>    HOMEPAGE =3D "http://www.monkey.org/~provos/libevent/"
>>>>>    SECTION =3D "libs"
>>>> Sorry I sent it to the wrong list so now again:
>>>>
>>>> What is the value - apart HOB's sake - in creating redundancies by c=
opying
>>>> DESRCIPTION to SUMMARY? Why not use DESCRIPTION?
>>>
>>> (this is a copy of the email I sent to the oe-devel ML):
>>>
>>> Hi Andreas,
>>>
>>> I did this because SUMMARY is a required field by the HOB UI. This wa=
s requested by Shane Wang on the oe-core ML:
>>>
>>> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/=
014600.html
>>>
>>> For recipes which have short descriptions, there was little sense in =
summarizing them further, so I duplicated the DESCRIPTION field. Above yo=
u can also see an example (in the icu recipe) were I did summarize a long=
 DESCRIPTION field.
>>>
>>> Mark Hatle replied to this thread explaining why we previously allowe=
d SUMMARY to be an optional field and how it automatically inherited from=
 DESCRIPTION.
>>
>> So if it's automatically inherited why are these patches duplicating i=
t?
>
> Hi Koen,
>
> Ah, I see why this is still confusing.
>
> Shane wrote:
>
> "If the summary is missing, bitbake will create a default value for
> summary. That is PN plus string " version " plus its version."
>
> So apparently the HOB UI isn't actually "inheriting" the DESCRIPTION fi=
eld.
>
> Shane and Mark: can you clarify what the intended behavior is? Why woul=
d
> the HOB UI not inherit DESCRIPTION?

I don't know.  Within the bitbake.conf there is:

DESCRIPTION ?=3D "${SUMMARY}"

So it should just work...

--Mark

> Scott
>



