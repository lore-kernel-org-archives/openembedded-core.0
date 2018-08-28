Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4740478E25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 20:13:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7SKD2u9009759
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Aug 2018 13:13:02 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 28 Aug 2018 13:13:01 -0700
To: Andrej Valek <andrej.valek@siemens.com>, Andre McCurdy
	<armccurdy@gmail.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20180820024616.12501-1-pkj@axis.com>
	<9efc95dd0b5186463b9e35dfa6d572513ed8e525.camel@linuxfoundation.org>
	<CAMKF1soPC5rCXEzZN78NuQS3qyFNQMv03QQVF8w3kduJn59tRQ@mail.gmail.com>
	<CAJ86T=U_bNmw77eL-F7GJFUVe_zDzEMBpzRiHS397C1wxMwO7Q@mail.gmail.com>
	<49a3ae3e0305424992d5683f84b82816@XBOX02.axis.com>
	<CAJ86T=UuQq0V4V76TA6iyY9aYPO_wAd_wo5Dy+gSGoNx3ZGbjA@mail.gmail.com>
	<faded12e-0d33-4329-bb9f-e9ba8d19a945@siemens.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <9f007790-74c3-d1b5-d287-5f8d963440a8@windriver.com>
Date: Tue, 28 Aug 2018 16:12:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <faded12e-0d33-4329-bb9f-e9ba8d19a945@siemens.com>
X-Originating-IP: [172.25.44.4]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: Add a dependency on virtual/crypt
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
X-List-Received-Date: Tue, 28 Aug 2018 20:13:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 08/27/2018 02:42 AM, Andrej Valek wrote:
> Did you find some final solution?

Since no one has replied, it seems that the answer is to omit the
virtual/crypt dependency.

> For me, we can make it enabled by default. Anyone could use custom
> defconfig in own layer.

Right.


I would be nice get the package update done since 1.27.x is
about a year old and M3 is yesterday/this week.
We can settle this potential dependency as a defect if someone
finds such a bug.

../Randy


> 
> Cheers,
> Andrej
> 
> On 08/20/18 23:28, Andre McCurdy wrote:
>> On Mon, Aug 20, 2018 at 2:03 PM, Peter Kjellerstedt
>> <peter.kjellerstedt@axis.com> wrote:
>>>> -----Original Message-----
>>>> From: Andre McCurdy <armccurdy@gmail.com>
>>>> Sent: den 20 augusti 2018 22:23
>>>> To: Khem Raj <raj.khem@gmail.com>
>>>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>; Peter
>>>> Kjellerstedt <peter.kjellerstedt@axis.com>; Patches and discussions
>>>> about the oe-core layer <openembedded-core@lists.openembedded.org>
>>>> Subject: Re: [OE-core] [PATCH] busybox: Add a dependency on
>>>> virtual/crypt
>>>>
>>>> On Mon, Aug 20, 2018 at 12:45 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>> On Mon, Aug 20, 2018 at 2:45 AM Richard Purdie
>>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>>>
>>>>>> On Mon, 2018-08-20 at 04:46 +0200, Peter Kjellerstedt wrote:
>>>>>>> busybox needs crypt() if CONFIG_USE_BB_CRYPT is not defined.
>>>>>>>
>>>>>>> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>>>>>>> ---
>>>>>>>   meta/recipes-core/busybox/busybox.inc | 3 ++-
>>>>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-
>>>>>>> core/busybox/busybox.inc
>>>>>>> index 8c6dbbaf9b..a8ba10d21c 100644
>>>>>>> --- a/meta/recipes-core/busybox/busybox.inc
>>>>>>> +++ b/meta/recipes-core/busybox/busybox.inc
>>>>>>> @@ -3,7 +3,8 @@ DESCRIPTION = "BusyBox combines tiny versions of
>>>> many
>>>>>>> common UNIX utilities into
>>>>>>>   HOMEPAGE = "http://www.busybox.net"
>>>>>>>   BUGTRACKER = "https://bugs.busybox.net/"
>>>>>>>
>>>>>>> -DEPENDS += "kern-tools-native"
>>>>>>> +# Depend on virtual/crypt in case CONFIG_USE_BB_CRYPT is not
>>>> defined
>>>>>>> +DEPENDS += "kern-tools-native virtual/crypt"
>>>>>>
>>>>>> I'm not a bug fan of adding dependencies which might not be needed.
>>>> How
>>>>>> common is CONFIG_USE_BB_CRYPT not being defined? I assume that isn't
>>>>>> our default config?
>>>>>
>>>>> yes perhaps it should be packageconfig
>>>>
>>>> Busybox doesn't use PACKAGECONFIG. Conditional configuration is
>>>> handled by adding / removing cfg fragments and testing whether SRC_URI
>>>> contains "foo.cfg" (and also parsing the final .config within tasks
>>>> such as do_install). Unfortunately that approach doesn't work so well
>>>> for conditional build dependencies...
>>>>
>>>> Our Busybox defconfig does enable CONFIG_USE_BB_CRYPT (and there's no
>>>> cfg fragment to disable it) so the virtual/crypt dependency isn't
>>>> needed in our default builds.
>>>
>>> In our case we have our own defconfig. I am not responsible for it, it is
>>> maintained by our busybox maintainer, and he has apparently decided that
>>> we don't want CONFIG_USE_BB_CRYPT enabled.
>>
>> Could you ask him about it? Maybe there's some advantage to it that isn't clear.
>>
>> The general OE approach is to use system libraries when possible so
>> using external libcrypt does actually align to that.
>>
>> Maybe we should use external libcrypt by default (with the option to
>> switch back to the built-in crypt functions via a cfg fragment)?
>>
>>> I can of course add the dependency via a bbappend, but having to do that
>>> seems wrong given how the rest of busybox is configured (with defconfig
>>> and cfg fragments) and where enabling some options that don't happen to
>>> be enabled in the OE-Core default configuration will then break the build.
>>>
>>>> Disabling busybox's internal crypt functions doesn't seem like a very
>>>> common thing to want to do.
>>>>
>>>> config USE_BB_CRYPT
>>>>      bool "Use internal crypt functions"
>>>>      default y
>>>>      help
>>>>        Busybox has internal DES and MD5 crypt functions.
>>>>        They produce results which are identical to corresponding
>>>>        standard C library functions.
>>>>
>>>>        If you leave this disabled, busybox will use the system's
>>>>        crypt functions. Most C libraries use large (~70k)
>>>>        static buffers there, and also combine them with more general
>>>>        DES encryption/decryption.
>>>>
>>>>        For busybox, having large static buffers is undesirable,
>>>>        especially on NOMMU machines. Busybox also doesn't need
>>>>        DES encryption/decryption and can do with smaller code.
>>>>
>>>>        If you enable this option, it will add about 4.8k of code
>>>>        if you are building dynamically linked executable.
>>>>        In static build, it makes code _smaller_ by about 1.2k,
>>>>        and likely many kilobytes less of bss.
>>>
>>> //Peter
>>>


-- 
# Randy MacLeod
# Wind River Linux

