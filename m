Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id BA1447453F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 03:41:13 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id c29-v6so10267438lfj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 20:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=go0ZNxwrapKVV2aANm8fkA+3Crs/WyMia5DoB/BkIpE=;
	b=Subjh9Y4B28DtofnabVIF16ofLN2aKZuMZ/OibtzHlJ5WBcAMnOvwGDmYNnfzI0wX6
	FFb+6CxYZ97mPXy6hGY5rRydIX2M/wlLV+mEQ/mQNHER7sqlAHDOmCeI1MxixFopcFaq
	ynxT5M4OxTj4UZf4DmDO2mN0nZaQcFw6XLO36I2/Q1A3gVmuUThl2iQjb+axnB/XDSRg
	PiWdtGL8zPgcF8OQT5a34uH3r8MIbjbEr25vp0Igr3FTIiNy9nfbhaqUj1cMrfMfBw/t
	kGRv6L7/2X8L1xEZd0ek3vGxADMaet5yKyg87n1TTToDnWm1yw5Yz05x+OsYQzLfsxBe
	//ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=go0ZNxwrapKVV2aANm8fkA+3Crs/WyMia5DoB/BkIpE=;
	b=q1s2a+eRgWBj1A5TaGqQ9wkN82FS/VQKGgpv+b0cGoF4sfO8gSkoLtPoPEk07Vbeu9
	Se6H2E7QmlTAMiPjBtup5bTYsc0m8iU+4Zxm6R5Kr8NaAq+9NpqTdxKESIgZyPDF3ObB
	F2Zvt29y08xLmC/GhCeJ0rWaJZIYfF3TgjZaQ8yy9UM8fNG/U3DRT5/bMnxnBEZnYIay
	gpEgt4HI0ohidfirz+9i/jOLtNPxJw/FEW1FhsVZPn2LbaIRKOgaTjcCezcrUCOEQTeB
	qWdNzxuhqvN2OrZjY1R2QxzVCW/QSs424vZMDuXlsQM/Q4Qf2oNdYQZvWCBROgqNkAgd
	WYCg==
X-Gm-Message-State: APzg51AwxYA8jqvTlFhDO3xUF4L3o1iPpBRWjdie4QG66CGe8wSG1vu3
	HXgr9uY9pxocR6td0K7aRGs2fQ/uLO8keFTsGy176w==
X-Google-Smtp-Source: ANB0VdYduJ0BCIwQZiDa9J+wb2husiPN/OnvWrmP+DD7CMCc9S89qK2HIhVxIE4AccORPMK+V4JYSzwNd/47fX3J1Oc=
X-Received: by 2002:a19:f817:: with SMTP id
	a23-v6mr3820187lff.67.1537501273983; 
	Thu, 20 Sep 2018 20:41:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP; Thu, 20 Sep 2018 20:41:13
	-0700 (PDT)
In-Reply-To: <19f3527f-5dda-6f8e-cea5-beed6a76cf1f@windriver.com>
References: <20180909104450.11900-1-hongzhi.song@windriver.com>
	<bdb5a4f9-4982-8472-e063-e005a846c748@windriver.com>
	<19f3527f-5dda-6f8e-cea5-beed6a76cf1f@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 20 Sep 2018 23:41:13 -0400
Message-ID: <CADkTA4NNgAVJ3hEOjHTv+YL45pfktwQyR22XXaSbEuv7sGyLWQ@mail.gmail.com>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto-rt: Add paravirt_kvm support for qemux86-64
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
X-List-Received-Date: Fri, 21 Sep 2018 03:41:14 -0000
Content-Type: text/plain; charset="UTF-8"

Confirmed.  It was already in my queue. It will go out shortly.

Bruce

On Thu, Sep 20, 2018 at 10:26 PM, Hongzhi, Song
<hongzhi.song@windriver.com> wrote:
> Hi Bruce,
>
> I just want to confirm that you doesn't forget this patch.
>
> This is not an emergency.
>
>
> Thanks,
>
> Hongzhi
>
>
>
> On 09/11/2018 11:15 AM, Bruce Ashfield wrote:
>>
>> On 2018-09-09 6:44 AM, Hongzhi.Song wrote:
>>>
>>> This feature includes paravirtualized KVM guest support, including
>>> KVMCLOCK for enhancing clock accuracy of guest OS.
>>>
>>
>> This is fine with me. I'll pull it into my queue. I expect my next pull
>> request to be on Wednesday.
>>
>> Bruce
>>
>>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>>> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>>> ---
>>>   meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb | 2 +-
>>>   meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb | 2 +-
>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
>>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
>>> index d9953c32be..ab088f4d18 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
>>> @@ -38,4 +38,4 @@ KERNEL_EXTRA_FEATURES ?=
>>> "features/netfilter/netfilter.scc features/taskstats/ta
>>>   KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>>>   KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>>   KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>> -KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>>> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
>>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
>>> index 5b102069f1..de3b538b5d 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
>>> @@ -40,4 +40,4 @@ KERNEL_EXTRA_FEATURES ?=
>>> "features/netfilter/netfilter.scc features/taskstats/ta
>>>   KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>>>   KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>>   KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>> -KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>>> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>>
>>
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

