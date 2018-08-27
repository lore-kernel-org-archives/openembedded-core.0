Return-Path: <andrej.valek@siemens.com>
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id 06AEA78741
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 06:42:52 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id w7R6gpVf029377
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 27 Aug 2018 08:42:52 +0200
Received: from [192.168.253.100] ([163.242.57.90])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id w7R6gp1f009377;
	Mon, 27 Aug 2018 08:42:51 +0200
To: Andre McCurdy <armccurdy@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20180820024616.12501-1-pkj@axis.com>
	<9efc95dd0b5186463b9e35dfa6d572513ed8e525.camel@linuxfoundation.org>
	<CAMKF1soPC5rCXEzZN78NuQS3qyFNQMv03QQVF8w3kduJn59tRQ@mail.gmail.com>
	<CAJ86T=U_bNmw77eL-F7GJFUVe_zDzEMBpzRiHS397C1wxMwO7Q@mail.gmail.com>
	<49a3ae3e0305424992d5683f84b82816@XBOX02.axis.com>
	<CAJ86T=UuQq0V4V76TA6iyY9aYPO_wAd_wo5Dy+gSGoNx3ZGbjA@mail.gmail.com>
From: Andrej Valek <andrej.valek@siemens.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrej.valek@siemens.com; prefer-encrypt=mutual; keydata=
	xsBNBFkSzTcBCADSJTRk7YudjxZ/ma2IXPV4Y5gkACJKDOYAZcRqNjDbIFUmc7ck3KeuUGKy
	ifrpWD6/7YPXbixv4sAlFly6sNL31agVHLO4BCCE77DaZ2smiN0JaLYzmMdr0BPLMsL96nBO
	UDo8o2a1NwU+GpD8a0/vcovro+NgLvfk9xP4rYAve09VYvF4DbQNW9Y+8reqWFnBI8EN5Fps
	vPCUr/TSuxk3VpU//8QtP7WqyRA31qiWFDxE2dqSnrpUBojxQMY94tDP7kjQtzD2ZpaDt1oL
	PDE/n6qtYG792JVvNjuo1QpfPo8a8I4HvMmbh/Orv0fniauB229OaWNPp27ln55xG8FvABEB
	AAHNJ0FuZHJlaiBWYWxlayA8YW5kcmVqLnZhbGVrQHNpZW1lbnMuY29tPsLAfgQTAQIAKAUC
	WRLNNwIbAwUJA8JnAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQ3npj5PmioO8DZQgA
	ibpOwfxDw3qlSEHDE395Tf+bEAYWjjNz9OQB4nnhq1Ql9jbUhfQQk/equaxoIfNHyLNDbeUU
	8ULLXJS+nDRi13yf2w/9L386fd5V63cdP6no2dpnEhwOKV1miiUtvcjDCe3bjm7WHVfg9OsF
	4AWox+/GR6sGJHRestHeXIJthmru8dB57oKy2fPgPpY1Ld1Wwb4okZgIi+1sKx19fk2xX9lc
	KpdvCXx+6FB3a9+sJTmb12meeGtKWC7BeElM2sG5NK7yx9zFNqSRebilwNankSE0QzWwmu4M
	bW6OTuxv/3qeHIvFH3EhrEmnd68Zm4+/jx2ZN5Ax23ZaGD8pabuO587ATQRZEs03AQgA0oCu
	faa9qlV0iYK+XlLcW6u55/o5psqtwoUCo8u18v8j4qB80r9latFKsO/SOjhVOYgIuzTTftQs
	Di71i9GJwK8Kk2FMo0YuJ9J9xdcvmjUI2vNUbOcaz2V0tRC9P/P5UaIltQAMVxbFHDwj17UA
	7YpEUL3ixxMs/usIKKGA+jIvsBdcn1WFji/NXLffwQ+zrAoT3q8EuGn4jSdROND16e9ynKgk
	D5D+EoA5RoFi8y3tRHJsi/dNlaUISsQOux/MgXsk1UU2lkmq7uxddRw8xwzG5dhx79sQp4Dt
	YpSfZBylD3DnCTg3ajdWCHGVyBdMLVncfj8sPDsVkCozTaSqFwARAQABwsBlBBgBAgAPBQJZ
	Es03AhsMBQkDwmcAAAoJEN56Y+T5oqDv8EEH/0qUECI1OpJS5R9Di9yc6YOfyNdCFHJ5rnUx
	dTr5+U3z30HBpzv1yPtO0fRQPulFRp2T81nhzT07B6Jce/pPUPE4QUVuwkM80KUbveJSNVHH
	Vp+9MGHEmpSevVHGKwzr+/7n5KJd5+SX3Y0mFxbu7GUZTMvM9Ra/p7lu0DsAH1CgEzKf3KTx
	FrUN9oSYETbN3l6+pxO3RYAxtCVRMCOCJ7skHkfPH0ADxsbecaKo2CHqcDJigqZBKxjnWYsm
	0+8mRhIQs3JuF0z7hKJGRacdGvKdQbCo0swLT9NVWU0IcUc/gwsCzQu/0Iml1x6MbgameiX4
	emYHzsJ3+vLapH+kAEI=
Message-ID: <faded12e-0d33-4329-bb9f-e9ba8d19a945@siemens.com>
Date: Mon, 27 Aug 2018 08:42:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=UuQq0V4V76TA6iyY9aYPO_wAd_wo5Dy+gSGoNx3ZGbjA@mail.gmail.com>
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
X-List-Received-Date: Mon, 27 Aug 2018 06:42:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Did you find some final solution?
For me, we can make it enabled by default. Anyone could use custom
defconfig in own layer.

Cheers,
Andrej

On 08/20/18 23:28, Andre McCurdy wrote:
> On Mon, Aug 20, 2018 at 2:03 PM, Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
>>> -----Original Message-----
>>> From: Andre McCurdy <armccurdy@gmail.com>
>>> Sent: den 20 augusti 2018 22:23
>>> To: Khem Raj <raj.khem@gmail.com>
>>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>; Peter
>>> Kjellerstedt <peter.kjellerstedt@axis.com>; Patches and discussions
>>> about the oe-core layer <openembedded-core@lists.openembedded.org>
>>> Subject: Re: [OE-core] [PATCH] busybox: Add a dependency on
>>> virtual/crypt
>>>
>>> On Mon, Aug 20, 2018 at 12:45 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Mon, Aug 20, 2018 at 2:45 AM Richard Purdie
>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>>
>>>>> On Mon, 2018-08-20 at 04:46 +0200, Peter Kjellerstedt wrote:
>>>>>> busybox needs crypt() if CONFIG_USE_BB_CRYPT is not defined.
>>>>>>
>>>>>> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>>>>>> ---
>>>>>>  meta/recipes-core/busybox/busybox.inc | 3 ++-
>>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-
>>>>>> core/busybox/busybox.inc
>>>>>> index 8c6dbbaf9b..a8ba10d21c 100644
>>>>>> --- a/meta/recipes-core/busybox/busybox.inc
>>>>>> +++ b/meta/recipes-core/busybox/busybox.inc
>>>>>> @@ -3,7 +3,8 @@ DESCRIPTION = "BusyBox combines tiny versions of
>>> many
>>>>>> common UNIX utilities into
>>>>>>  HOMEPAGE = "http://www.busybox.net"
>>>>>>  BUGTRACKER = "https://bugs.busybox.net/"
>>>>>>
>>>>>> -DEPENDS += "kern-tools-native"
>>>>>> +# Depend on virtual/crypt in case CONFIG_USE_BB_CRYPT is not
>>> defined
>>>>>> +DEPENDS += "kern-tools-native virtual/crypt"
>>>>>
>>>>> I'm not a bug fan of adding dependencies which might not be needed.
>>> How
>>>>> common is CONFIG_USE_BB_CRYPT not being defined? I assume that isn't
>>>>> our default config?
>>>>
>>>> yes perhaps it should be packageconfig
>>>
>>> Busybox doesn't use PACKAGECONFIG. Conditional configuration is
>>> handled by adding / removing cfg fragments and testing whether SRC_URI
>>> contains "foo.cfg" (and also parsing the final .config within tasks
>>> such as do_install). Unfortunately that approach doesn't work so well
>>> for conditional build dependencies...
>>>
>>> Our Busybox defconfig does enable CONFIG_USE_BB_CRYPT (and there's no
>>> cfg fragment to disable it) so the virtual/crypt dependency isn't
>>> needed in our default builds.
>>
>> In our case we have our own defconfig. I am not responsible for it, it is
>> maintained by our busybox maintainer, and he has apparently decided that
>> we don't want CONFIG_USE_BB_CRYPT enabled.
> 
> Could you ask him about it? Maybe there's some advantage to it that isn't clear.
> 
> The general OE approach is to use system libraries when possible so
> using external libcrypt does actually align to that.
> 
> Maybe we should use external libcrypt by default (with the option to
> switch back to the built-in crypt functions via a cfg fragment)?
> 
>> I can of course add the dependency via a bbappend, but having to do that
>> seems wrong given how the rest of busybox is configured (with defconfig
>> and cfg fragments) and where enabling some options that don't happen to
>> be enabled in the OE-Core default configuration will then break the build.
>>
>>> Disabling busybox's internal crypt functions doesn't seem like a very
>>> common thing to want to do.
>>>
>>> config USE_BB_CRYPT
>>>     bool "Use internal crypt functions"
>>>     default y
>>>     help
>>>       Busybox has internal DES and MD5 crypt functions.
>>>       They produce results which are identical to corresponding
>>>       standard C library functions.
>>>
>>>       If you leave this disabled, busybox will use the system's
>>>       crypt functions. Most C libraries use large (~70k)
>>>       static buffers there, and also combine them with more general
>>>       DES encryption/decryption.
>>>
>>>       For busybox, having large static buffers is undesirable,
>>>       especially on NOMMU machines. Busybox also doesn't need
>>>       DES encryption/decryption and can do with smaller code.
>>>
>>>       If you enable this option, it will add about 4.8k of code
>>>       if you are building dynamically linked executable.
>>>       In static build, it makes code _smaller_ by about 1.2k,
>>>       and likely many kilobytes less of bss.
>>
>> //Peter
>>

