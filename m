Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rchcu-0002YL-3g
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 19:07:53 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Dec 2011 10:00:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97990031"
Received: from unknown (HELO [10.255.12.100]) ([10.255.12.100])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2011 10:00:25 -0800
Message-ID: <4EEF7BB8.8000702@linux.intel.com>
Date: Mon, 19 Dec 2011 10:00:24 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20111219093447.C6DBE10331@opal>
	<201112191337.39289.schnitzeltony@gmx.de>
	<4EEF71B1.8050808@intel.com>
	<DFD058B8-C462-492D-A193-9BEEB6E4B590@dominion.thruhere.net>
	<4EEF743C.80908@intel.com> <4EEF7819.2020202@windriver.com>
In-Reply-To: <4EEF7819.2020202@windriver.com>
Cc: Scott Garman <scott.a.garman@intel.com>
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
X-List-Received-Date: Mon, 19 Dec 2011 18:07:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 12/19/2011 09:44 AM, Mark Hatle wrote:
> On 12/19/11 11:28 AM, Scott Garman wrote:
>> On 12/19/2011 09:21 AM, Koen Kooi wrote:
>>>
>>> Op 19 dec. 2011, om 18:17 heeft Scott Garman het volgende geschreven:
>>>
>>>> On 12/19/2011 04:37 AM, Andreas Müller wrote:
>>>>> On Monday, December 19, 2011 10:34:47 AM git@git.openembedded.org
>>>>> wrote:
>>>>>> Module: openembedded-core.git
>>>>>> Branch: master
>>>>>> Commit: e8c194a627e091ef9da3b7fa83ea3897bd283d9e
>>>>>> URL:
>>>>>> http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=e8c194a627
>>>>>>
>>>>>> e091ef9da3b7fa83ea3897bd283d9e
>>>>>>
>>>>>> Author: Scott Garman<scott.a.garman@intel.com>
>>>>>> Date: Sun Dec 18 15:06:57 2011 -0800
>>>>>>
>>>>>> Add missing SUMMARY fields to various recipes
>>>>>>
>>>>>> This adds the SUMMARY field to the following recipes which were
>>>>>> missing it:
>>>>>>
>>>>>> * dosfstools
>>>>>> * grep
>>>>>> * icu
>>>>>> * libevent
>>>>>> * libnfsidmap
>>>>>> * qemu-helper-nativesdk
>>>>>>
>>>>>> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
>>>>>> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
>>>>>>
>>>>>> ---
>>>>>>
>>>>>> .../nfs-utils/libnfsidmap_0.24.bb | 3 ++-
>>>>>> .../recipes-devtools/dosfstools/dosfstools_2.11.bb | 2 +-
>>>>>> .../qemu/qemu-helper-nativesdk_1.0.bb | 3 ++-
>>>>>> meta/recipes-extended/grep/grep_2.9.bb | 1 +
>>>>>> meta/recipes-support/icu/icu-3.6.inc | 1 +
>>>>>> meta/recipes-support/libevent/libevent_1.4.14b.bb | 3 ++-
>>>>>> 6 files changed, 9 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
>>>>>> b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb index
>>>>>> 101ecab..eff75ec 100644
>>>>>> --- a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
>>>>>> +++ b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
>>>>>> @@ -1,4 +1,5 @@
>>>>>> -DESCRIPTION = "nfs idmapping library"
>>>>>> +SUMMARY = "NFS id mapping library"
>>>>>> +DESCRIPTION = "NFS id mapping library"
>>>>>> HOMEPAGE = "http://www.citi.umich.edu/projects/nfsv4/linux/"
>>>>>> SECTION = "libs"
>>>>>>
>>>>>> diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>>>>>> b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb index
>>>>>> ec75ac9..eca54f1 100644
>>>>>> --- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>>>>>> +++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>>>>>> @@ -1,7 +1,7 @@
>>>>>> # dosfstools OE build file
>>>>>> # Copyright (C) 2004-2006, Advanced Micro Devices, Inc. All Rights
>>>>>> Reserved # Released under the MIT license (see packages/COPYING)
>>>>>> -
>>>>>> +SUMMARY = "DOS FAT Filesystem Utilities"
>>>>>> DESCRIPTION = "DOS FAT Filesystem Utilities"
>>>>>>
>>>>>> SECTION = "base"
>>>>>> diff --git a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
>>>>>> b/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb index
>>>>>> a3dca3d..df0cae0 100644
>>>>>> --- a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
>>>>>> +++ b/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
>>>>>> @@ -1,4 +1,5 @@
>>>>>> -DESCRIPTION = "Qemu helper scripts from Poky"
>>>>>> +SUMMARY = "Qemu helper scripts"
>>>>>> +DESCRIPTION = "Qemu helper scripts"
>>>>>> LICENSE = "GPLv2"
>>>>>> RDEPENDS_${PN} = "qemu-nativesdk"
>>>>>> PR = "r9"
>>>>>> diff --git a/meta/recipes-extended/grep/grep_2.9.bb
>>>>>> b/meta/recipes-extended/grep/grep_2.9.bb index 08ac527..9099bed
>>>>>> 100644
>>>>>> --- a/meta/recipes-extended/grep/grep_2.9.bb
>>>>>> +++ b/meta/recipes-extended/grep/grep_2.9.bb
>>>>>> @@ -1,3 +1,4 @@
>>>>>> +SUMMARY = "GNU grep utility"
>>>>>> DESCRIPTION = "GNU grep utility"
>>>>>> HOMEPAGE = "http://savannah.gnu.org/projects/grep/"
>>>>>> BUGTRACKER = "http://savannah.gnu.org/bugs/?group=grep"
>>>>>> diff --git a/meta/recipes-support/icu/icu-3.6.inc
>>>>>> b/meta/recipes-support/icu/icu-3.6.inc index 8fadc92..e3f9dd2 100644
>>>>>> --- a/meta/recipes-support/icu/icu-3.6.inc
>>>>>> +++ b/meta/recipes-support/icu/icu-3.6.inc
>>>>>> @@ -1,3 +1,4 @@
>>>>>> +SUMMARY = "International Component for Unicode libraries"
>>>>>> DESCRIPTION = "The International Component for Unicode (ICU) is a
>>>>>> mature,
>>>>>> portable set of C/C++ and Java libraries for Unicode support,
>>>>>> software
>>>>>> internationalization (I18N) and globalization (G11N), giving
>>>>>> applications
>>>>>> the same results on all platforms." HOMEPAGE =
>>>>>> "http://www-01.ibm.com/software/globalization/icu/index.jsp"
>>>>>>
>>>>>> diff --git a/meta/recipes-support/libevent/libevent_1.4.14b.bb
>>>>>> b/meta/recipes-support/libevent/libevent_1.4.14b.bb index
>>>>>> 1a369b5..36468dc
>>>>>> 100644
>>>>>> --- a/meta/recipes-support/libevent/libevent_1.4.14b.bb
>>>>>> +++ b/meta/recipes-support/libevent/libevent_1.4.14b.bb
>>>>>> @@ -1,4 +1,5 @@
>>>>>> -DESCRIPTION = "an asynchronous event notification library"
>>>>>> +SUMMARY = "An asynchronous event notification library"
>>>>>> +DESCRIPTION = "An asynchronous event notification library"
>>>>>> HOMEPAGE = "http://www.monkey.org/~provos/libevent/"
>>>>>> SECTION = "libs"
>>>>> Sorry I sent it to the wrong list so now again:
>>>>>
>>>>> What is the value - apart HOB's sake - in creating redundancies by
>>>>> copying
>>>>> DESRCIPTION to SUMMARY? Why not use DESCRIPTION?
>>>>
>>>> (this is a copy of the email I sent to the oe-devel ML):
>>>>
>>>> Hi Andreas,
>>>>
>>>> I did this because SUMMARY is a required field by the HOB UI. This
>>>> was requested by Shane Wang on the oe-core ML:
>>>>
>>>> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/014600.html
>>>>
>>>>
>>>> For recipes which have short descriptions, there was little sense in
>>>> summarizing them further, so I duplicated the DESCRIPTION field.
>>>> Above you can also see an example (in the icu recipe) were I did
>>>> summarize a long DESCRIPTION field.
>>>>
>>>> Mark Hatle replied to this thread explaining why we previously
>>>> allowed SUMMARY to be an optional field and how it automatically
>>>> inherited from DESCRIPTION.
>>>
>>> So if it's automatically inherited why are these patches duplicating it?
>>
>> Hi Koen,
>>
>> Ah, I see why this is still confusing.
>>
>> Shane wrote:
>>
>> "If the summary is missing, bitbake will create a default value for
>> summary. That is PN plus string " version " plus its version."
>>
>> So apparently the HOB UI isn't actually "inheriting" the DESCRIPTION
>> field.
>>
>> Shane and Mark: can you clarify what the intended behavior is? Why would
>> the HOB UI not inherit DESCRIPTION?
>
> I don't know. Within the bitbake.conf there is:
>
> DESCRIPTION ?= "${SUMMARY}"
>
> So it should just work...
>
It does work just not what HOB is looking for, HOB seems to be looking 
for a SUMMARY not DESCRIPTION first.  So if there is no SUMMARY HOB gets 
the bitbake.conf default of: SUMMARY ?= "${PN} version ${PV}-${PR}"

Maybe HOB can be fixed to check if the ${SUMMARY} first word is ${PN} 
then use ${DESCRIPTION} instead of requiring all recipes have a SUMMARY?

my 2 cents

Sau!


> --Mark
>
>> Scott
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


