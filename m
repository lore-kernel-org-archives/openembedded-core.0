Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sp196-0003Ru-EL
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 19:56:16 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Jul 2012 10:45:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="170589804"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by orsmga002.jf.intel.com with ESMTP; 11 Jul 2012 10:45:03 -0700
Message-ID: <4FFDBB9E.1070101@linux.intel.com>
Date: Wed, 11 Jul 2012 10:45:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341977966-14246-1-git-send-email-msm@freescale.com>
	<CAEsOVNdxqbWTrSScnsTYEqB8LazSBm3cbo6FwfFCwptf96AWOQ@mail.gmail.com>
In-Reply-To: <CAEsOVNdxqbWTrSScnsTYEqB8LazSBm3cbo6FwfFCwptf96AWOQ@mail.gmail.com>
Subject: Re: [PATCH] gcc-configure-common.inc: use --with-long-double-128 on powerpc to comply with ABI
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
X-List-Received-Date: Wed, 11 Jul 2012 17:56:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2012 08:59 PM, McClintock Matthew-B29882 wrote:
> On Tue, Jul 10, 2012 at 10:39 PM, Matthew McClintock <msm@freescale.com> wrote:
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-4.7.inc              |    2 +-
>>   meta/recipes-devtools/gcc/gcc-configure-common.inc |    4 ++++
>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
>> index 3b6e313..ece32c1 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
>> @@ -1,6 +1,6 @@
>>   require gcc-common.inc
>>
>> -PR = "r5"
>> +PR = "r6"
>
> This patch has the wrong PR bump here, but the version in my tree is fixed up:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=mattsm/master
>
Merged into OE-Core

Thanks
	Sau!
> -M
>
>>
>>   # Third digit in PV should be incremented after a minor release
>>   # happens from this branch on gcc e.g. currently its 4.7.1
>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> index 3dd9de7..908ad3e 100644
>> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> @@ -61,6 +61,10 @@ EXTRA_OECONF_append_mips64el    = " --with-abi=64 --with-arch-64=mips64 --with-t
>>   EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
>>   CPPFLAGS = ""
>>
>> +# powerpc needs this to comply with the ABI
>> +EXTRA_OECONF_append_powerpc = " --with-long-double-128"
>> +EXTRA_OECONF_append_powerpc64 = " --with-long-double-128"
>> +
>>   # Used by configure to define additional values for FLAGS_FOR_TARGET -
>>   # passed to all the compilers.
>>   ARCH_FLAGS_FOR_TARGET = "${TARGET_CC_ARCH}"
>> --
>> 1.7.10
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



