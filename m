Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UbaT8-00035V-5B
	for openembedded-core@lists.openembedded.org;
	Sun, 12 May 2013 19:54:22 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 May 2013 10:35:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,657,1363158000"; d="scan'208";a="312275308"
Received: from unknown (HELO [10.255.12.109]) ([10.255.12.109])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2013 10:35:47 -0700
Message-ID: <518FD2F2.5070105@linux.intel.com>
Date: Sun, 12 May 2013 10:35:46 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1368356739-17625-1-git-send-email-sgw@linux.intel.com>
	<9E4F6205-6171-4D60-A669-609A49F763C1@gmail.com>
In-Reply-To: <9E4F6205-6171-4D60-A669-609A49F763C1@gmail.com>
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC] tcmode-default: Set 4.8 as default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 May 2013 17:54:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2013 09:29 AM, Khem Raj wrote:
> Hi Saul
>
> There is one serious problem that I ran into was that qemuarm 3.8 kernel segfaulted
> is it working for you ?
>
Nope your right there does appear to be a problem with ARM, I thought we 
where have sanity test issues again, I just completed a build and 
verified that I get a Kernel paninc with 3.8 Kernel and 4.8 GCC.

Not ready yet!

Khem, are you looking into it?  I have CC'ed Bruce for the kernel also.

Sau!


> -Khem
>
> On May 12, 2013, at 4:05 AM, Saul Wold <sgw@linux.intel.com> wrote:
>
>> This changes the default GCC to 4.8, it has been tested with OE-Core
>> and a number of layers have been testing with it for the last few weeks.
>>
>> There are some minor issues outside of OE-Core. These will be addressed
>> with time.
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> Cc: Khem Raj <raj.khem@gmail.com>
>>
>> ---
>> meta/conf/distro/include/tcmode-default.inc | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
>> index 88d109b..f3942b5 100644
>> --- a/meta/conf/distro/include/tcmode-default.inc
>> +++ b/meta/conf/distro/include/tcmode-default.inc
>> @@ -17,7 +17,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${TCLIBC}-initial"
>> PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial = "nativesdk-${TCLIBC}-initial"
>> PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>>
>> -GCCVERSION ?= "4.7%"
>> +GCCVERSION ?= "4.8%"
>> SDKGCCVERSION ?= "${GCCVERSION}"
>> BINUVERSION ?= "2.23.2"
>> EGLIBCVERSION ?= "2.17"
>> --
>> 1.8.0.2
>>
>


