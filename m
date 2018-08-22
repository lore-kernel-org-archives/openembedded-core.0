Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id AB9C7793D7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 20:36:29 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id m13-v6so3754588qth.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=d5x9mmZjOasg4j0bzrTNqLTJDkyCvsoqsubL+n4Bkro=;
	b=uS47NpvdX+r5M+AlHI3gK6RJURxcTtLUSJevZcFdPdKqmz+jfESQzrEWBFIiSk447c
	RuDj/VCDFZbDY9w1iiTQslpJtSr3yV4IfpuaOWhaHC2XDE5M30t7fZwRqlOVuVpLN5Rb
	rSBfFXqAKmFLe/JWB5+q21CsSMbNK6dAI0SzmaAw7DA5u2tkNgj49BHFlu9RIxaaSOpN
	s8JofePIJp7C373wShjWA9zPIWFR4ORvbZzKM6ctBDRStlc8z9kjmlwjv2BHdSPJNdjw
	3NAI81yn0LjreXlMns0YLXiBDAkFJbo1qgSP1LAt4E9rgxT8pnBlhhdhRB2hAsWhMoNk
	BBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=d5x9mmZjOasg4j0bzrTNqLTJDkyCvsoqsubL+n4Bkro=;
	b=lrFbsV5BJEgLBXAmKFsJe3bbLBpwyyaW3pTeoI1mdLfdIz+noR7N1olOxBDaA9ov9M
	YPlJ8apIcHf1rYUhaSTyTZzodOxsswJJ0LodnZ3ZPTROtWgeU1n+d7/WCmQTt8bIqg5Y
	vzTYKaFW0Y7ECjSZBNzymACmGz+kUY5on3O5L3/wmMekyY1AIOQ7lYzpfo4OEe1zPoYP
	0o4Dk6EykKA8pDS97zqkpdTgzcFoGSOq+5yyYMpimuLuw+EVvS00BVxXLE6MLQKSZS6w
	muif7GccywoLKsarhcXc2Uqc3rTjS/pcxpGdk7oY8i4q/uEMA0xGhEjKPhPT6e5TFSXJ
	2Eiw==
X-Gm-Message-State: AOUpUlFU7BorXUbmYzE8tTIRzAVKxq8+gjqi9HuMI5W6PwPW9H1z0zP6
	zrWTvt/HBHA+C584tf0nHbvr3R3ZZocN5Jz4kBw=
X-Google-Smtp-Source: AA+uWPzZ81UGuqH8u/ofDuzl+h2laT0H4npj+pZi53LAuC2P3OppdqY+Pba2vROmatAMX4m/OXnRsXs9apiQwnpG4XA=
X-Received: by 2002:ac8:758d:: with SMTP id
	s13-v6mr21337119qtq.161.1534970190293; 
	Wed, 22 Aug 2018 13:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
	<CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
	<CAD0U-hLEPce-+gJcBcqQHFPkiHr1CPBEvaM6s1f1VTkEzpNnfQ@mail.gmail.com>
	<CA+chaQezPDFAP1L0NYCaoFDjPfriUt3_wh9QKTaa0ZwWBHtKYQ@mail.gmail.com>
	<CAD0U-hJHddn43O0WVxDqUft74RoHxfCQBb9XV-pG+GYqNU0iVQ@mail.gmail.com>
	<CA+chaQc2EUcz+PHi=BT5RrMQsCqegytxgLd6gzpH-PUYvt59Mw@mail.gmail.com>
	<CAD0U-hL6Mvxf+NYVJS64ygh+bMR2RMxwa=okW6g+yOGb-Xb7mA@mail.gmail.com>
In-Reply-To: <CAD0U-hL6Mvxf+NYVJS64ygh+bMR2RMxwa=okW6g+yOGb-Xb7mA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Aug 2018 13:36:04 -0700
Message-ID: <CAMKF1sp3t1VrPrrwfoLgMNpxRXW2PmcrkQgNXxn4d2GShfu-xQ@mail.gmail.com>
To: Ryan Harkin <ryan.harkin@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	daiane.angolini@nxp.com, patches@linaro.org
Subject: Re: [RFC 3/3] linux-firmware: MACHINEOVERRIDES for BCM43430 NVRAM
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
X-List-Received-Date: Wed, 22 Aug 2018 20:36:29 -0000
Content-Type: text/plain; charset="UTF-8"

I wonder how it work with meta-raspverrypi now that it has its own
packing for firmware
On Wed, Aug 22, 2018 at 1:10 PM Ryan Harkin <ryan.harkin@linaro.org> wrote:
>
>
>
> On Wed, 22 Aug 2018, 20:02 Martin Jansa, <martin.jansa@gmail.com> wrote:
>>
>> Your 1st parameter is wrong, compare again with the example I gave you (don't include "brcm/" path in 1st param, because you want the symlink to point to just brcmfmac43430-sdio.AP6212.txt like you did in the version after cd).
>
>
> That doesn't work either. I tried it with the same result, but didn't send a log of it. That works for you?
>
>
>> On Wed, Aug 22, 2018 at 7:11 PM Ryan Harkin <ryan.harkin@linaro.org> wrote:
>>>
>>> This is curious!
>>>
>>> On 22 August 2018 at 17:56, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>>
>>>> cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt
>>>>
>>>> is the same as
>>>>
>>>> ln -sf brcmfmac43430-sdio.AP6212.txt ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt
>>>
>>>
>>> On my system, this is what happens when I'm in the root of the linux-firmware repo:
>>>
>>> $ ls -al brcm/*.txt
>>> -rw-rw-r-- 1 ryan ryan 875 Aug 22 18:08 brcm/brcmfmac43430-sdio.AP6212.txt
>>> -rw-rw-r-- 1 ryan ryan 831 Aug 21 14:48 brcm/brcmfmac43430-sdio.MUR1DX.txt
>>>
>>> $ ln -sf brcm/brcmfmac43430-sdio.AP6212.txt brcm/brcmfmac43430-sdio.txt
>>>
>>> $ ls -al brcm/*.txt
>>> -rw-rw-r-- 1 ryan ryan 875 Aug 22 18:08 brcm/brcmfmac43430-sdio.AP6212.txt
>>> -rw-rw-r-- 1 ryan ryan 831 Aug 21 14:48 brcm/brcmfmac43430-sdio.MUR1DX.txt
>>> lrwxrwxrwx 1 ryan ryan  34 Aug 22 18:08 brcm/brcmfmac43430-sdio.txt -> brcm/brcmfmac43430-sdio.AP6212.txt
>>>
>>> And the file is not valid.
>>>
>>> $ cat brcm/brcmfmac43430-sdio.txt
>>> cat: brcm/brcmfmac43430-sdio.txt: No such file or directory
>>>
>>> So perhaps I'm doing something wrong. I tried your suggestion originally and it didn't work for me. Maybe I made a typo or something?
>>>
>>>
>>>>
>>>> On Wed, Aug 22, 2018 at 6:47 PM Ryan Harkin <ryan.harkin@linaro.org> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 22 August 2018 at 17:41, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>>>>
>>>>>> The "cd ${D}${nonarch_base_libdir}/firmware/brcm/" doesn't seem to be needed, just include the path in 2nd ln parameter.
>>>>>
>>>>>
>>>>> I don't think that works, or at least, it doesn't work for me, so I may be doing something wrong. I'm also copying the example used in the do_install() a few lines up as I figured that would be the preferred style for this recipe.
>>>>>
>>>>>>
>>>>>> On Wed, Aug 22, 2018 at 6:30 PM Ryan Harkin <ryan.harkin@linaro.org> wrote:
>>>>>>>
>>>>>>> The Linux kernel currently expects a single NVRAM file for BCM43430
>>>>>>> named brcmfmac43430-sdio.txt.
>>>>>>>
>>>>>>> Allow the machine to specify an override to link its module specific
>>>>>>> NVRAM to the filename expected by the kernel.
>>>>>>>
>>>>>>> Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
>>>>>>> ---
>>>>>>>  meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 12 ++++++++++++
>>>>>>>  1 file changed, 12 insertions(+)
>>>>>>>
>>>>>>> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>>>>>> index 8c54f28..b647abc 100644
>>>>>>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>>>>>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>>>>>> @@ -226,6 +226,18 @@ do_install() {
>>>>>>>         ( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf ti-connectivity/* . )
>>>>>>>  }
>>>>>>>
>>>>>>> +# Adding bcm43430-nvram-{module type} to MACHINEOVERRIDES will create a
>>>>>>> +# softlink for the module specific NVRAM file to the filename expected
>>>>>>> +# by the Linux kernel
>>>>>>> +FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-mur1dx = " ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
>>>>>>> +do_install_append_bcm43430-nvram-mur1dx() {
>>>>>>> +       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)
>>>>>>> +}
>>>>>>> +FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-ap6212 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
>>>>>>> +do_install_append_bcm43430-nvram-ap6212() {
>>>>>>> +       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt)
>>>>>>> +}
>>>>>>> +
>>>>>>>
>>>>>>>  PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
>>>>>>>               ${PN}-mt7601u-license ${PN}-mt7601u \
>>>>>>> --
>>>>>>> 2.7.4
>>>>>>>
>>>>>
>>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

