Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EF9066148C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 19:42:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 Nov 2013 11:42:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,746,1378882800"; d="scan'208";a="437539973"
Received: from unknown (HELO [10.255.15.149]) ([10.255.15.149])
	by fmsmga002.fm.intel.com with ESMTP; 21 Nov 2013 11:42:50 -0800
Message-ID: <528E6239.8040507@linux.intel.com>
Date: Thu, 21 Nov 2013 11:42:49 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1385039538.git.hongxu.jia@windriver.com>	<0e29f77b1778e75f547289c20e670fc0ffd5e070.1385039538.git.hongxu.jia@windriver.com>	<528E541B.7000104@linux.intel.com>
	<528E6199.80306@windriver.com>
In-Reply-To: <528E6199.80306@windriver.com>
Subject: Re: [PATCH 4/4] qemu: add bash and python to qemu's RDEPENDS
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
X-List-Received-Date: Thu, 21 Nov 2013 19:42:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/2013 11:40 AM, Mark Hatle wrote:
> On 11/21/13, 12:42 PM, Saul Wold wrote:
>>
>> Why are you adding bash to qemu?
>
> My understanding is that there was a bash script that was added as well,
> once the python rdepends was resolved.
>
Any chance of "de-bashing" the script?

Sau!
> --Mark
>
>> Sau!
>>
>>
>> On 11/21/2013 05:14 AM, Hongxu Jia wrote:
>>> | Note: adding Smart RPM DB channel
>>> |
>>> | Note: to be installed:  qemu@x86_64 run-postinsts@x86_64
>>> kernel-modules@qemux86_64 packagegroup-core-boot@qemux86_64
>>> | Loading cache...
>>> | Updating cache...
>>> ######################################## [100%]
>>> |
>>> | Computing transaction...error: Can't install
>>> qemu-1.5.0-r0.0@x86_64: no package provides /usr/bin/python
>>> |
>>> | Saving cache...
>>> |
>>> | WARNING: exit code 1 from a shell command.
>>> | ERROR: Function failed: do_rootfs (log file is located at
>>> tmp/work/qemux86_64-wrs-linux/wrlinux-image-glibc-small/1.0-r1/temp/do_rootfs/log.do_rootfs.21373)
>>>
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>>>    meta/recipes-devtools/qemu/qemu.inc | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-devtools/qemu/qemu.inc
>>> b/meta/recipes-devtools/qemu/qemu.inc
>>> index 21ce489..3f3431d 100644
>>> --- a/meta/recipes-devtools/qemu/qemu.inc
>>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>>> @@ -5,6 +5,7 @@ DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11
>>> pixman dtc libsdl"
>>>    DEPENDS_class-native = "zlib-native alsa-lib-native
>>> glib-2.0-native pixman-native dtc-native"
>>>    DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl
>>> nativesdk-glib-2.0 nativesdk-pixman nativesdk-dtc"
>>>    RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"
>>> +RDEPENDS_${PN}_class-target += "bash python"
>>>
>>>    require qemu-targets.inc
>>>    inherit autotools
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

