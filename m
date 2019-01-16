Return-Path: <andrej.valek@siemens.com>
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id 3121B7C137
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 07:23:08 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x0G7N5aI017039
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 16 Jan 2019 08:23:05 +0100
Received: from [192.168.253.100] (MD1JJJ2C.ad001.siemens.net [163.242.44.88])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x0G7N4wU022889;
	Wed, 16 Jan 2019 08:23:04 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Mark Hatle <mark.hatle@windriver.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <05af53a7-6ed6-9615-be2e-d8c31dbfb321@siemens.com>
	<CAJTo0LbHTnSYrjm6QWGbXFJFj8jUGuk07t6hAhgB8dUnSYkAxw@mail.gmail.com>
	<d2772c25-a1ee-d20a-d913-323784db6933@windriver.com>
	<CAJTo0LYJyuYgj2MUnKPN8X2JNOK9AGFmDbcJ=-9EjPBoMDDGXQ@mail.gmail.com>
	<7497c039-7951-ee51-7506-300a74d0b558@windriver.com>
	<fa30e51479e77bed2b7ca05049bed3c65f3efe2b.camel@linuxfoundation.org>
From: Andrej Valek <andrej.valek@siemens.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrej.valek@siemens.com; prefer-encrypt=mutual; keydata=
	mQENBFkSzTcBCADSJTRk7YudjxZ/ma2IXPV4Y5gkACJKDOYAZcRqNjDbIFUmc7ck3KeuUGKy
	ifrpWD6/7YPXbixv4sAlFly6sNL31agVHLO4BCCE77DaZ2smiN0JaLYzmMdr0BPLMsL96nBO
	UDo8o2a1NwU+GpD8a0/vcovro+NgLvfk9xP4rYAve09VYvF4DbQNW9Y+8reqWFnBI8EN5Fps
	vPCUr/TSuxk3VpU//8QtP7WqyRA31qiWFDxE2dqSnrpUBojxQMY94tDP7kjQtzD2ZpaDt1oL
	PDE/n6qtYG792JVvNjuo1QpfPo8a8I4HvMmbh/Orv0fniauB229OaWNPp27ln55xG8FvABEB
	AAG0J0FuZHJlaiBWYWxlayA8YW5kcmVqLnZhbGVrQHNpZW1lbnMuY29tPokBPgQTAQIAKAUC
	WRLNNwIbAwUJA8JnAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQ3npj5PmioO8DZQgA
	ibpOwfxDw3qlSEHDE395Tf+bEAYWjjNz9OQB4nnhq1Ql9jbUhfQQk/equaxoIfNHyLNDbeUU
	8ULLXJS+nDRi13yf2w/9L386fd5V63cdP6no2dpnEhwOKV1miiUtvcjDCe3bjm7WHVfg9OsF
	4AWox+/GR6sGJHRestHeXIJthmru8dB57oKy2fPgPpY1Ld1Wwb4okZgIi+1sKx19fk2xX9lc
	KpdvCXx+6FB3a9+sJTmb12meeGtKWC7BeElM2sG5NK7yx9zFNqSRebilwNankSE0QzWwmu4M
	bW6OTuxv/3qeHIvFH3EhrEmnd68Zm4+/jx2ZN5Ax23ZaGD8pabuO57kBDQRZEs03AQgA0oCu
	faa9qlV0iYK+XlLcW6u55/o5psqtwoUCo8u18v8j4qB80r9latFKsO/SOjhVOYgIuzTTftQs
	Di71i9GJwK8Kk2FMo0YuJ9J9xdcvmjUI2vNUbOcaz2V0tRC9P/P5UaIltQAMVxbFHDwj17UA
	7YpEUL3ixxMs/usIKKGA+jIvsBdcn1WFji/NXLffwQ+zrAoT3q8EuGn4jSdROND16e9ynKgk
	D5D+EoA5RoFi8y3tRHJsi/dNlaUISsQOux/MgXsk1UU2lkmq7uxddRw8xwzG5dhx79sQp4Dt
	YpSfZBylD3DnCTg3ajdWCHGVyBdMLVncfj8sPDsVkCozTaSqFwARAQABiQElBBgBAgAPBQJZ
	Es03AhsMBQkDwmcAAAoJEN56Y+T5oqDv8EEH/0qUECI1OpJS5R9Di9yc6YOfyNdCFHJ5rnUx
	dTr5+U3z30HBpzv1yPtO0fRQPulFRp2T81nhzT07B6Jce/pPUPE4QUVuwkM80KUbveJSNVHH
	Vp+9MGHEmpSevVHGKwzr+/7n5KJd5+SX3Y0mFxbu7GUZTMvM9Ra/p7lu0DsAH1CgEzKf3KTx
	FrUN9oSYETbN3l6+pxO3RYAxtCVRMCOCJ7skHkfPH0ADxsbecaKo2CHqcDJigqZBKxjnWYsm
	0+8mRhIQs3JuF0z7hKJGRacdGvKdQbCo0swLT9NVWU0IcUc/gwsCzQu/0Iml1x6MbgameiX4
	emYHzsJ3+vLapH+kAEI=
Message-ID: <eb624819-010f-193b-c4cc-a08f694fd41c@siemens.com>
Date: Wed, 16 Jan 2019 08:23:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <fa30e51479e77bed2b7ca05049bed3c65f3efe2b.camel@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Prelink problem
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
X-List-Received-Date: Wed, 16 Jan 2019 07:23:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all

Do we found some solution? As a workaround could be just add dependency
to prelink native into rootfs if the command is really required.

Regards,
Andrej

On 1/8/19 10:46 PM, Richard Purdie wrote:
> On Tue, 2019-01-08 at 14:50 -0600, Mark Hatle wrote:
>> On 1/8/19 2:37 PM, Burton, Ross wrote:
>>> On Tue, 8 Jan 2019 at 20:15, Mark Hatle <mark.hatle@windriver.com>
>>> wrote:
>>>>> No idea why the opkg rootfs code is doing prelink operations
>>>>> when RPM
>>>>> or dpkg don't.   CCing Mark who may have an idea here.  I
>>>>> thought the
>>>>> autobuilder exerised multilib-on-opkg, but maybe not.
>>>>
>>>> They all should be doing prelink operations.  The operation
>>>> SHOULD be
>>>> generically implemented as part of the image-prelink class, which
>>>> is where I
>>>> would have expected that copy to exist.
>>>>
>>>> If any of the package types of specifically doing something, that
>>>> sounds
>>>> broken...  but the generic ones (last I looked) said to copy in
>>>> the config file
>>>> [if it didn't exist], run prelink, remove the file [if it wasn't
>>>> there to start
>>>> with].
>>>
>>> Note that it's part of the incremental code, so needs to be in the
>>> rootfs code directly I suspect. Frankly I'd love to see incremental
>>> images removed.  It makes promises it can't keep (the moment a
>>> rootfs
>>> postprocess command is used, all bets are off) and massively
>>> complicates things.
>>
>> We assume the post process command is what an 'admin' would do.  So
>> the various
>> package managers should be able to deal with it in most
>> cases.  (Note, obviously
>> it's more freeform, but I wouldn't expect everything to work in you
>> removed a
>> large part of the filesystem for instance.)
>>
>> As for prelink, I'm surprised this is in the incremental code.  I'm
>> not sure why
>> it would be necessary unless the incremental work wants to UNPRELINK
>> the rootfs
>> before performing the upgrade?
>>
>> Prelink itself should still be run as a postprocess command that
>> takes the
>> output of the filesystem and reprocesses it.
>>
>> So something seems out of sync here.. (at a minimum probably should
>> be better
>> commented on why it's needed..)
> 
> The code is there for incremental opkg multilib image support. Its
> trying to compare whether binaries are identical. To make it work, it
> has to "unprelink" the files first before comparing.
> 
> I'm not convinced this is a good idea :/. I'm wondering if incremental
> image generation makes sense at all in this context to be honest.
> 
> Cheers,
> 
> Richard
> 

