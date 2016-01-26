Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f194.google.com (mail-lb0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id DDA867704E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 23:22:50 +0000 (UTC)
Received: by mail-lb0-f194.google.com with SMTP id oe3so8935695lbb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 15:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KJP0UUJ+dFjqgsvyUJIbRnzVh0GovH97NJuI2wwv1bI=;
	b=FuFSzDzUv6EVWDiw+GpWyW0qqTIvjAV9cG2nIQfvwVUk2lIndHCvlW5qqjKzHmnPD4
	1OI3Ef1Py+nabZkqDD3D031R0vvWBBz7D7a+SiNBmFSKsK69YZoc8fJXNunTOeSL5RdS
	lSn2TmjAVK8Fl2NX6BIXWAPZPLdw2CFZBcg06qzjb6V81B9dmw7zwWrlTFwDPpAmei7f
	xUnLjVzXukvlRhixv7U2aNQ438Ksigfv8GbnilsXbJUSiqnyMqjOFrCBZkRHGp6iV+j5
	VMKJx7xXB/jnbqjJAMlHVbboZxA1IncdhGbimFOAGSTbMto+URDJcP1aiFm8KL+B3VBX
	Txmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=KJP0UUJ+dFjqgsvyUJIbRnzVh0GovH97NJuI2wwv1bI=;
	b=C/J1/6GaivF6VwliPBhRl+QwwI3VnMHKTGo4mOpJY/zIARmh4Nn4yi7yBXVe5yDT14
	7GVvKweT+zZUWFOzjut8Y9buarT3DR4689fjb6ZY0XTJnJp5XeBcE9chXfwgs09AGPdM
	bMarLSsPexSf6Z7YKVdmQsnGrwV95xJLhZISiowUaPuM5qlzgKv1HmWMnxpkpYE71pl0
	OI0vDJw0ZWH8J+DLxq7xat1RDs3sHVUOANK5WsRaXwQ2RUj1KUdybJPHfc7ig3yKWCU8
	mxikoDvCuPrJ2kbKNGxI3uBckPO2u4Afs0q+dBS9Jd3y/0OFaUsaF1X6ral33kMqDWIv
	I2gQ==
X-Gm-Message-State: AG10YOS+UReBqRR9R2Ehd51Q9t6tfOfq9u8RKQdIj7J2BjregsYT4TWzZ3QbfYWLoT2X6cLdj8i0KLFenZeeqg==
MIME-Version: 1.0
X-Received: by 10.112.170.101 with SMTP id al5mr9555487lbc.92.1453850569695;
	Tue, 26 Jan 2016 15:22:49 -0800 (PST)
Received: by 10.114.19.35 with HTTP; Tue, 26 Jan 2016 15:22:49 -0800 (PST)
In-Reply-To: <56A7EF65.60909@gmail.com>
References: <1451999565-3502-1-git-send-email-liu.ming50@gmail.com>
	<1451999565-3502-2-git-send-email-liu.ming50@gmail.com>
	<569E90F9.6020806@windriver.com> <569EB15C.9040502@gmail.com>
	<569F1086.6030400@windriver.com> <56A01873.8010604@gmail.com>
	<56A29386.1090600@windriver.com> <56A7EF65.60909@gmail.com>
Date: Wed, 27 Jan 2016 00:22:49 +0100
Message-ID: <CAAQYJAtdatk62e+UmydFZnhpdDv7MOZG05YH0uC-s_DV7bvZbA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>, "Tao,
	Yue" <Yue.Tao@windriver.com>,
	Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 26 Jan 2016 23:22:53 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 26, 2016 at 11:12 PM, Ming Liu <liu.ming50@gmail.com> wrote:
>
>
> On 01/22/2016 09:39 PM, Bruce Ashfield wrote:
>>
>> On 16-01-20 6:29 PM, Ming Liu wrote:
>>>
>>>
>>>
>>> On 01/20/2016 05:43 AM, Bruce Ashfield wrote:
>>>>
>>>> On 2016-01-19 4:57 PM, Ming Liu wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 01/19/2016 08:39 PM, Bruce Ashfield wrote:
>>>>>>
>>>>>> On 16-01-05 08:12 AM, Ming Liu wrote:
>>>>>>>
>>>>>>> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>>>>>>>
>>>>>>> It makes no sense to install a initramfs bundled kernel image since
>>>>>>> do_package does not depend on do_bundle_initramfs at all,
>>>>>>> otherwise, it
>>>>>>> leads to a implicit kernel-image package depending on do_package run
>>>>>>> before
>>>>>>> or after do_bundle_initramfs.
>>>>>>
>>>>>>
>>>>>> Again. So why not just add the ordering in the task dependencies ?
>>>>>
>>>>> If we add a intertask dependency like:
>>>>> add bundle_initramfs before do_install after do_deploy do_package
>>>>>
>>>>> Then it will somehow introduce a circular dependency as I described in
>>>>> another mail.
>>>>>>
>>>>>>
>>>>>> I'm probably missing something, which just means we need to tweak
>>>>>> the commit log a bit more.
>>>>>
>>>>> Maybe I should add some description in commit log about why I think we
>>>>> could not introduce a intertask dependency as a fix.
>>>>>
>>>>
>>>> That would be ideal, the more information the better.
>>>>
>>>>>>
>>>>>> The code you are removing is conditional, and is run after an
>>>>>> explicit kernel_do_compile is called, to rebuild the existing
>>>>>> kernel configuration with an embedded initramfs (via alternate
>>>>>> initrd).
>>>>>> So outside of some ordering/parallel execution issues, I'm not seeing
>>>>>> it as broken.
>>>>>
>>>>> Yes, I agree, it will not break the kernel re-compiling, the problem I
>>>>> want to fix here is just that it does not provide a certain way that we
>>>>> could add initramfs bundled kernel image into a rootfs.
>>>>>
>>>>
>>>> Speaking of breaking. What happens to existing users of INITRAMFS_IMAGE?
>>>> Do their existing image types and bundling continue to work without
>>>> modification ?
>>>
>>> That depends, the existing users always can find the INITRAMFS_IMAGE
>>> bundled kernel in DEPLOY_DIR with or without my patches, it is not
>>> broken. But if they want it installed in the rootfs, for some reasons,
>>> they will have the problem, like in my company, we want to boot the
>>> kernel from /boot/ on a USB disk, but it is not guaranteed we will get
>>> the INITRAMFS_IMAGE bundled kernel there during the build.
>>
>>
>> Right. And if someone isn't doing any initramfs bundling, is there
>> any impact ? No variables to change, etc ?
>
> Would not impact, no need to change any variables.
>
>>
>> I'd suggest double checking meta-initramfs:
>>
>>
>> http://layers.openembedded.org/layerindex/branch/master/layer/meta-initramfs/
>>
> OK, I will do that and let you know the results.
>
>> And checking with Andrea to be sure that none of the existing use
>> cases are broken.
>>
> OK, I will check with Andrea after I finished the tests with meta-initramfs
> layer.
>
>
> //Ming Liu
>>
>> Bruce
>>
>>>
>>> //Ming Liu
>>>>
>>>>
>>>> Bruce
>>>>
>>>>> //Ming Liu
>>>>>>
>>>>>>
>>>>>> Bruce
>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>>>>>>> ---
>>>>>>>   meta/classes/kernel.bbclass | 4 ----
>>>>>>>   1 file changed, 4 deletions(-)
>>>>>>>
>>>>>>> diff --git a/meta/classes/kernel.bbclass
>>>>>>> b/meta/classes/kernel.bbclass
>>>>>>> index 4ce1611..d1ca614 100644
>>>>>>> --- a/meta/classes/kernel.bbclass
>>>>>>> +++ b/meta/classes/kernel.bbclass
>>>>>>> @@ -179,10 +179,6 @@ do_bundle_initramfs () {
>>>>>>>           kernel_do_compile
>>>>>>>           mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
>>>>>>>           mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
>>>>>>> -        # Update install area
>>>>>>> -        echo "There is kernel image bundled with initramfs:
>>>>>>> ${B}/${KERNEL_OUTPUT}.initramfs"
>>>>>>> -        install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs
>>>>>>> ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
>>>>>>> -        echo "${B}/${KERNEL_OUTPUT}.initramfs"
>>>>>>>       fi
>>>>>>>   }
>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
>

Hi,

I could not yet test the proposed changes.
For a quick test please do build initramfs-kexecboot-klibc-image for qemu.
Thanks

Andrea

P.S. We did restore the old documentation about plain embedded
initramfs, pls have a look at the (outdated) msg:
https://github.com/kexecboot/kexecboot/wiki/oe-yocto

