Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SzTRy-0000fR-4h
	for openembedded-core@lists.linuxtogo.org;
	Thu, 09 Aug 2012 16:10:58 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Aug 2012 06:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,739,1336374000"; d="scan'208";a="177992328"
Received: from unknown (HELO [10.255.12.203]) ([10.255.12.203])
	by orsmga001.jf.intel.com with ESMTP; 09 Aug 2012 06:58:00 -0700
Message-ID: <5023C1E7.6030101@linux.intel.com>
Date: Thu, 09 Aug 2012 16:57:59 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
References: <cover.1344341416.git.wenzong.fan@windriver.com>	<38e3b88585fd93495837f9f071887989a080ccd6.1344341416.git.wenzong.fan@windriver.com>
	<4B47D650-7569-4396-825C-92CB04489F87@dominion.thruhere.net>
	<502202B0.3060005@windriver.com>
	<359FE728-11F8-46F1-A134-B3A34F895EC6@dominion.thruhere.net>
	<50232C52.8040201@windriver.com>
In-Reply-To: <50232C52.8040201@windriver.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] sysfsutils: install libs to base_libdir
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
X-List-Received-Date: Thu, 09 Aug 2012 14:10:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2012 06:19 AM, wenzong fan wrote:
> On 08/08/2012 04:44 PM, Koen Kooi wrote:
>>
>> Op 8 aug. 2012, om 08:09 heeft wenzong fan<wenzong.fan@windriver.com>
>> het volgende geschreven:
>>
>>> On 08/07/2012 08:23 PM, Koen Kooi wrote:
>>>>
>>>> Op 7 aug. 2012, om 14:14 heeft wenzong.fan@windriver.com het
>>>> volgende geschreven:
>>>>
>>>>> From: Wenzong Fan<wenzong.fan@windriver.com>
>>>>>
>>>>> Fix the warning form pcmciautils building:
>>>>>
>>>>> "WARNING: QA Issue: pcmciautils: /sbin/pccardctl, installed in the
>>>>> base_prefix, requires a shared library under exec_prefix (/usr):
>>>>> libsysfs.so.2 =>   /usr/lib/libsysfs.so.2"
>>>>>
>>>>> Just refer to Debian/Ubuntu distributions, install sysfsutils libs
>>>>> to "/lib*" instead of "/usr/lib*".
>>>>>
>>>>> [YOCTO #2907]
>>>>>
>>>>> Signed-off-by: Wenzong Fan<wenzong.fan@windriver.com>
>>>>> ---
>>>>> meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb |    4 +++-
>>>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
>>>>> b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
>>>>> index 3e4fdda..f01d19b 100644
>>>>> --- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
>>>>> +++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
>>>>> @@ -8,7 +8,7 @@ LICENSE_libsysfs = "LGPLv2.1"
>>>>> LIC_FILES_CHKSUM =
>>>>> "file://COPYING;md5=3d06403ea54c7574a9e581c6478cc393 \
>>>>>
>>>>> file://cmd/GPL;md5=d41d4e2e1e108554e0388ea4aecd8d27 \
>>>>>
>>>>> file://lib/LGPL;md5=b75d069791103ffe1c0d6435deeff72e"
>>>>> -PR = "r3"
>>>>> +PR = "r4"
>>>>>
>>>>> SRC_URI = "${SOURCEFORGE_MIRROR}/linux-diag/sysfsutils-${PV}.tar.gz \
>>>>>       file://sysfsutils-2.0.0-class-dup.patch \
>>>>> @@ -24,3 +24,5 @@ PACKAGES =+ "libsysfs libsysfs-dev
>>>>> libsysfs-staticdev"
>>>>> FILES_libsysfs = "${libdir}/lib*${SOLIBS}"
>>>>> FILES_libsysfs-dev = "${libdir}/lib*${SOLIBSDEV} ${includedir}"
>>>>> FILES_libsysfs-staticdev = "${libdir}/lib*.a"
>>>>
>>>> Ahem! ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> Yep, this works but looks confused, do you mean the 'export libdir'
> should be put ahead of FILES_lib*?
>
>  From the build logs, only change is $libdir: '/usr/lib -> /lib',
> details please refer to attached file.
>
Wenzong,
We are looking for buildhistory info, not a diff of your build log.

buildhistory can be activated as follows in your local.conf:

INHERIT += "buildhistory"
BUILDHISTORY_COMMIT = "1"

Then you can build before and after your change, and use the script 
buildhistory_diff to produce the output we are looking for.

Thanks
	Sau!

> Thanks
> Wenzong
>
>>>>
>>>>> +
>>>>> +export libdir = "${base_libdir}"
>>>>
>>>> And can you post the buildhistory diff to see if anything else moved
>>>> when it shouldn't have e.g. package config files?
>>>
>>> I make a diff to the build dir, only the location of 'lib/' was moved:
>>
>> Please post the buildhistory diff, that is much more informative. And
>> you haven't responded to the FILES_lib* oversight.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


