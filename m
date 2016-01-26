Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3222C6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 22:12:55 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id n70so10255036lfn.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 14:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=eEjpuYxj3Hy78wvQYeXThQQYAGNWmYDC43EsiEDgB/I=;
	b=wsDB9IrzscxAl6KMted0+l15gmxUQk1pEQIcD7SBz/OhjAkQ954mR6zSAUh76Rl1qI
	zQeBRfFB1CJqpekiIXtfTXNh+3mG/JX9qipLL2+ON+ek/RPA8jDPZ3hZ46pvBshTEH1K
	kP+P1BYR2QdwDdPyXNryDDSL8KpJ2uRaldVDaYHD+oMMCGfbsQrDrwMUVx86QqDZbl0u
	5R2GGFwBr6spw2uAV+fk/ZFXX96zysHgi85stkZKW3HrnmzXO5HtER58oFEdZ+JcD29M
	zYCa7SVHAmVEiSabh9u86hkGBr9KDISFH6LIVb/45PZWEZBql9/5kOg3TyZCyu8gBQHy
	Foww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=eEjpuYxj3Hy78wvQYeXThQQYAGNWmYDC43EsiEDgB/I=;
	b=W1WnhgHh8qNuaUKDEMM+uV1EKT/0oeUo4NFudk24XRkkrbs4z4pwXZiUCoogWJQNhR
	zGNoVOT/3ktMLegg3fmxsRA9pLtxBjQ9HOcaYzVfIjBXN6RJdeSM3n0rMw38OqRlrmvH
	3oKEHii1c4gET+Q4LPh4N+QaPJBPwsq8svqj5siWgu367LENfqnC+9Rz17ryPYEzjn9J
	GGQgd6zgVe7eMvfTL7WZJfXhy4PTiBfSdOUPTMXc0ljckJd1hD4jQZ8qo10ntCjGlA4Q
	Q+cnWbrOXMp0U+P2cuUqIheGx0AxGiDqUx2DtEBRNg7G1OTBLvuMlMZRMYlbrTPLt1KU
	5efQ==
X-Gm-Message-State: AG10YOQ4hT0JzRNo2j6CeD+EETXuAl+VsTPJGqTWbHrYVnw0KTATv2OmlHFeD2hynnwoqw==
X-Received: by 10.25.145.14 with SMTP id t14mr10455749lfd.100.1453846375285;
	Tue, 26 Jan 2016 14:12:55 -0800 (PST)
Received: from [192.168.0.12] (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231])
	by smtp.gmail.com with ESMTPSA id h72sm433077lfe.33.2016.01.26.14.12.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jan 2016 14:12:54 -0800 (PST)
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <1451999565-3502-1-git-send-email-liu.ming50@gmail.com>
	<1451999565-3502-2-git-send-email-liu.ming50@gmail.com>
	<569E90F9.6020806@windriver.com> <569EB15C.9040502@gmail.com>
	<569F1086.6030400@windriver.com> <56A01873.8010604@gmail.com>
	<56A29386.1090600@windriver.com>
From: Ming Liu <liu.ming50@gmail.com>
Message-ID: <56A7EF65.60909@gmail.com>
Date: Tue, 26 Jan 2016 23:12:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <56A29386.1090600@windriver.com>
Cc: "Tao, Yue" <Yue.Tao@windriver.com>,
	Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: Re: [PATCH 1/3] kernel.bbclass: do not install initramfs bundled kernel image
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
X-List-Received-Date: Tue, 26 Jan 2016 22:13:04 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 01/22/2016 09:39 PM, Bruce Ashfield wrote:
> On 16-01-20 6:29 PM, Ming Liu wrote:
>>
>>
>> On 01/20/2016 05:43 AM, Bruce Ashfield wrote:
>>> On 2016-01-19 4:57 PM, Ming Liu wrote:
>>>>
>>>>
>>>> On 01/19/2016 08:39 PM, Bruce Ashfield wrote:
>>>>> On 16-01-05 08:12 AM, Ming Liu wrote:
>>>>>> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>>>>>>
>>>>>> It makes no sense to install a initramfs bundled kernel image since
>>>>>> do_package does not depend on do_bundle_initramfs at all,
>>>>>> otherwise, it
>>>>>> leads to a implicit kernel-image package depending on do_package run
>>>>>> before
>>>>>> or after do_bundle_initramfs.
>>>>>
>>>>> Again. So why not just add the ordering in the task dependencies ?
>>>> If we add a intertask dependency like:
>>>> add bundle_initramfs before do_install after do_deploy do_package
>>>>
>>>> Then it will somehow introduce a circular dependency as I described in
>>>> another mail.
>>>>>
>>>>> I'm probably missing something, which just means we need to tweak
>>>>> the commit log a bit more.
>>>> Maybe I should add some description in commit log about why I think we
>>>> could not introduce a intertask dependency as a fix.
>>>>
>>>
>>> That would be ideal, the more information the better.
>>>
>>>>>
>>>>> The code you are removing is conditional, and is run after an
>>>>> explicit kernel_do_compile is called, to rebuild the existing
>>>>> kernel configuration with an embedded initramfs (via alternate 
>>>>> initrd).
>>>>> So outside of some ordering/parallel execution issues, I'm not seeing
>>>>> it as broken.
>>>> Yes, I agree, it will not break the kernel re-compiling, the problem I
>>>> want to fix here is just that it does not provide a certain way 
>>>> that we
>>>> could add initramfs bundled kernel image into a rootfs.
>>>>
>>>
>>> Speaking of breaking. What happens to existing users of 
>>> INITRAMFS_IMAGE?
>>> Do their existing image types and bundling continue to work without
>>> modification ?
>> That depends, the existing users always can find the INITRAMFS_IMAGE
>> bundled kernel in DEPLOY_DIR with or without my patches, it is not
>> broken. But if they want it installed in the rootfs, for some reasons,
>> they will have the problem, like in my company, we want to boot the
>> kernel from /boot/ on a USB disk, but it is not guaranteed we will get
>> the INITRAMFS_IMAGE bundled kernel there during the build.
>
> Right. And if someone isn't doing any initramfs bundling, is there
> any impact ? No variables to change, etc ?
Would not impact, no need to change any variables.

>
> I'd suggest double checking meta-initramfs:
>
> http://layers.openembedded.org/layerindex/branch/master/layer/meta-initramfs/ 
>
>
OK, I will do that and let you know the results.

> And checking with Andrea to be sure that none of the existing use
> cases are broken.
>
OK, I will check with Andrea after I finished the tests with 
meta-initramfs layer.

//Ming Liu
> Bruce
>
>>
>> //Ming Liu
>>>
>>> Bruce
>>>
>>>> //Ming Liu
>>>>>
>>>>> Bruce
>>>>>
>>>>>>
>>>>>> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>>>>>> ---
>>>>>>   meta/classes/kernel.bbclass | 4 ----
>>>>>>   1 file changed, 4 deletions(-)
>>>>>>
>>>>>> diff --git a/meta/classes/kernel.bbclass 
>>>>>> b/meta/classes/kernel.bbclass
>>>>>> index 4ce1611..d1ca614 100644
>>>>>> --- a/meta/classes/kernel.bbclass
>>>>>> +++ b/meta/classes/kernel.bbclass
>>>>>> @@ -179,10 +179,6 @@ do_bundle_initramfs () {
>>>>>>           kernel_do_compile
>>>>>>           mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
>>>>>>           mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
>>>>>> -        # Update install area
>>>>>> -        echo "There is kernel image bundled with initramfs:
>>>>>> ${B}/${KERNEL_OUTPUT}.initramfs"
>>>>>> -        install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs
>>>>>> ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
>>>>>> -        echo "${B}/${KERNEL_OUTPUT}.initramfs"
>>>>>>       fi
>>>>>>   }
>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
>


