Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id E33C878203
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 14:40:57 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id h75so222003pfh.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 07:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c0oizro4XaV8F0WER/zG8KG/mJLspFRXYvWBpXtGcyo=;
	b=OGmtYes2rK4KV7GG1aIwZwDGXycToYu5V2LAHJ26mHIUsrC2cjM3xOki/0X8VeyAfC
	ojdoVWO65DJC9iQAnP82xA8kQppG7LWcbrv0JtpWR+OnFb0PfwNYZ/75CtdUYHthmH/G
	FpmxpVGNbTLy9QsVHsvs0ouZ4nnTBEBPJfHgAlY9sEM4Bxv7X7glPZ3rOUrF5KpGinU1
	7Tnuf/BpKI9aPMP3pfwhFsyjeQaaC7Kq4+5bD7E05BdS5BTbn3qHKZ5celf5/KlBLweD
	ny6Vg+nhW1FPPWkLZ+8823cpGfPxgPV3tdc9Bq20XVTAQaCHqx7GpelXWzrZG1tc83Dy
	bxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c0oizro4XaV8F0WER/zG8KG/mJLspFRXYvWBpXtGcyo=;
	b=RhUOS3PlhmJ0wpne+R5V+hh6bewXDU/16wosEj9xlY48Jn2Ww1CyMK81wGrG4CMvxD
	f6Fqs52uKwU49jjjlV5C04q14h4bpVMDnV5ceX0mxtckJhAVyDYifWg040KrL11B83hh
	MyRc7MxyOXscPh7fLWmzT2BOEr2SCj9/Odc6SGFRTVD0yNIfQG6CpauIGWm54stb7kjf
	4AnEAkSvg92HEiXgQD4jvQbNe1/PNT1oeD0J33qDMyFUNcrCYA96L+SM6A/3yiTKkN5l
	5Fp5DsoMWJyJsD+Oxbou+xxfV9UqFpuX1F3qxOOnVUcEaS4DK9HwiJtTog8TjOiGXR7M
	csVw==
X-Gm-Message-State: AHYfb5i9GRTsHTAHrsqMkmScKrkNothVZHjxHwt9gsEnW3VJ6z9RO2ht
	8/mDewgwI4mu2sOUni/dvq937k/Txw==
X-Received: by 10.99.126.94 with SMTP id o30mr2956881pgn.436.1503499258612;
	Wed, 23 Aug 2017 07:40:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Wed, 23 Aug 2017 07:40:28 -0700 (PDT)
In-Reply-To: <c24b84e6-3fa5-371b-e7f4-71055be6814a@windriver.com>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
	<ab92e7d90c416d6e5cdb17cdba269e09ec967607.1503283308.git.bruce.ashfield@windriver.com>
	<CAMKF1soEQpj++eDz_Cq23t-OEJGi8jJW7V2sYStEyMHwrUrm2g@mail.gmail.com>
	<c24b84e6-3fa5-371b-e7f4-71055be6814a@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Aug 2017 07:40:28 -0700
Message-ID: <CAMKF1so-ifGj68AZj6WxFeFRrmDZMq9KcvpQsXYzdi_N5W89-A@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/9] kernel-yocto: ensure that only valid BSPs are built
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
X-List-Received-Date: Wed, 23 Aug 2017 14:40:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 23, 2017 at 5:37 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 08/22/2017 11:40 PM, Khem Raj wrote:
>>
>> On Sun, Aug 20, 2017 at 7:58 PM, Bruce Ashfield
>> <bruce.ashfield@windriver.com> wrote:
>>>
>>> There was a bug in the search routines responsible for locating
>>> BSP definitions which returned a valid match if only the ktype
>>> matched.
>>>
>>> This meant that someone looking for "qemux86foo" (which is an
>>> invalid definition) would potentially end up building "qemuarm"
>>> and be none the wiser (until it didn't boot).
>>>
>>> With this fix to the tools search routine, and improved return
>>> code testing, we will now stop the build and report and error to
>>> the user.
>>>
>>> [YOCTO: #11878]
>>>
>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>> ---
>>>   meta/classes/kernel-yocto.bbclass                       | 3 +++
>>>   meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
>>>   2 files changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/kernel-yocto.bbclass
>>> b/meta/classes/kernel-yocto.bbclass
>>> index 1ca0756c4959..3c6df92131bc 100644
>>> --- a/meta/classes/kernel-yocto.bbclass
>>> +++ b/meta/classes/kernel-yocto.bbclass
>>> @@ -143,6 +143,9 @@ do_kernel_metadata() {
>>>
>>>          # expand kernel features into their full path equivalents
>>>          bsp_definition=$(spp ${includes} --find -DKMACHINE=${KMACHINE}
>>> -DKTYPE=${LINUX_KERNEL_TYPE})
>>> +       if [ $? -ne 0 ] || [ -z "${bsp_definition}" ]; then
>>> +               bbfatal_log "Could not locate BSP definiton for
>>> ${KMACHINE}/${LINUX_KERNEL_TYPE}."
>>> +       fi
>>
>>
>> this breaks non linux-yocto kernels which are using the kernel infra
>> from OE-Core
>> since they may not have kmeta structure and bsp_definition may be empty
>> for them
>> so either provide a way to override bsp_definition to something dummy or
>> infact
>> fall back to dummy by default with a warning or note during parse
>> time. fatal is a bit harsh here.
>
>
> Fair enough. I can make it a warning versus fatal, or only make it
> fatal if I detect a defconfig.
>
> The issue is that the tools haven't found a configuration entry point
> and could end up building a garbage/invalid configuration. A defconfig
> could stand in as a 'valid entry' point, since it signifies a baseline
> configuration.
>
> Also, I do have completed code to move fragment merging into a common
> location and avoid things like this .. once it goes through some more
> compatibility testing, I'll post it to the list.


Irrespective this was merged today into master, can you send a followup
quickly so we can unbreak meta-raspberrypi

>
> Bruce
>
>
>>
>>>          meta_dir=$(kgit --meta)
>>>
>>>          # run1: pull all the configuration fragments, no matter where
>>> they come from
>>> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>>> b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>>> index 2217a31076a2..4a78b897d34f 100644
>>> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>>> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>>> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =
>>> "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1b
>>>
>>>   DEPENDS = "git-native"
>>>
>>> -SRCREV = "9cd2b626d652bec10c6bc75275b35bfee74d447c"
>>> +SRCREV = "0571411cc033c11df7827508dd786876ce2f8c83"
>>>   PR = "r12"
>>>   PV = "0.2+git${SRCPV}"
>>>
>>> --
>>> 2.5.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

