Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3695678C80
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 23:19:51 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id o82-v6so1624565vko.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 16:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wZ4DfaEx+qn0GduuUQJvJ3OrdesGC1DZVFESimCHh5k=;
	b=swp4vYgpQkIhZiNjUmb7RUukaaa8KPXaqJ5ai9bzShd5WxY778Vox8D9FVzg0s5Jnm
	ytLtM4WWFPcElCGcrdDUT3kHWJYbKlWQdgSBQoX6+JavCzUPT/gMF9gpvF01y8BNEyga
	QpLI135VoOc5WJNuWFuWzU5oYKV9PL6zYa7EJIgXRTBM/F814sTw09mUDanui2wEBKpm
	acoF6771aBhl2blNcAN+Tb/CJT23HR1T4p2oLSylzP6UFaD+I8iRnGUNUWlf5+VQ6Z/8
	SBcHrMtICC8wLlti3/mNVmfSuzV3YVVXWYzjvpP+82ikd+VS/jIkdwUKlwlc0ESJT/Eg
	SVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wZ4DfaEx+qn0GduuUQJvJ3OrdesGC1DZVFESimCHh5k=;
	b=TrWr5VvO0kHWDFRq+PZZoIwfgcQ3BH9Stp2qgSpwVbYALrDV8Ri9MRb+VGmr2VmlM3
	dZkf2PsnPljkFUhlMV9C78SKWxIRbD7ezPTj0CYFT1jLIx2skrIc48L1aKXlmjeJOgl2
	0rkj1qOoH+qNYs/OFxN3sm6V6Bu92KCt1gOv+4/Eytfg62ieVOv6fdgztI+WhkKoypvG
	FmFF2djhFmGI+ZNZVAiWGGcuaQUX41YXiYiD9SSg8xWfbI+wyycYwF3DXiUM4+pZLQKb
	QFVDan/gklnruvVZmwMxQrsexjrHgPne5BGJr3JbqOEenQbF9wh1H30jmvjVmGN4e/5N
	trXQ==
X-Gm-Message-State: AOUpUlF4MsfmAPtbaC6ix78hlT+9jXFFQYcCRFBkVBsip7cgmIb/sqZl
	nDOY7L1e689vU+OonL5UDZUNcw+NwbHrnXRJcYI=
X-Google-Smtp-Source: AAOMgpc8fQ0SVu2m0mYfKKI3RqcbK7HKGmnJ709lsbhmytpRFlXeE9X7LCn+7MyQRjtcckf2hvGB5bVlq2xnR55EsuM=
X-Received: by 2002:a1f:5fc5:: with SMTP id
	t188-v6mr2514212vkb.86.1532647191913; 
	Thu, 26 Jul 2018 16:19:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Thu, 26 Jul 2018 16:19:51 -0700 (PDT)
In-Reply-To: <87sh46c4fd.fsf@adiPC.i-did-not-set--mail-host-address--so-tickle-me>
References: <20180726135835.17632-1-adrian.ratiu@ni.com>
	<CA+chaQfGatvA-7UQSvrBZXG58QNLf0M0UcNbSNp+9JJ==GuQ2g@mail.gmail.com>
	<CA+chaQfwS7VFTYwR+LfiSV1xGfmdSVY8fuNJ0+Kkdfi3g8nbMw@mail.gmail.com>
	<87sh46c4fd.fsf@adiPC.i-did-not-set--mail-host-address--so-tickle-me>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 26 Jul 2018 16:19:51 -0700
Message-ID: <CAJ86T=VZwcyX58h5yH0FLrNENGL=jP06vcw+_r7sYx-38tFRow@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux.inc: add fallocate only for class-target
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
X-List-Received-Date: Thu, 26 Jul 2018 23:19:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 26, 2018 at 10:06 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> Thank you Martin! The different behaviours between combinations of
> appends and overrides has always been confusing to me.

You're not alone. The behaviour of += with an over-ride is a trap
which catches most users at some point.

> On Thu, 26 Jul 2018, Martin Jansa <martin.jansa@gmail.com> wrote:
>> I went ahead and sent v2 with the fix as I had it locally already anyway.
>>
>> To illustrate what was wrong with using the override, see following output
>> from bitbake -e:
>>
>> env.util-linux.append+override:ALTERNATIVE_util-linux="dmesg kill more
>> mkswap blockdev pivot_root switch_root hexdump last lastb logger mesg
>> renice wall unshare setsid chrt flock utmpdump eject nologin taskset
>> fallocate"
>> env.util-linux.before:ALTERNATIVE_util-linux="dmesg kill more mkswap
>> blockdev pivot_root switch_root hexdump last lastb logger mesg renice wall
>> fallocate unshare setsid chrt flock utmpdump eject nologin taskset"
>> env.util-linux.override:ALTERNATIVE_util-linux=" fallocate"
>>
>> # $ALTERNATIVE_util-linux [2 operations]
>> #   rename from ALTERNATIVE_${PN} data.py:116 [expandKeys]
>> #     "dmesg kill more mkswap blockdev pivot_root switch_root hexdump last
>> lastb logger mesg renice wall unshare setsid chrt flock utmpdump eject
>> nologin taskset"
>> #   override[class-target]:rename from ALTERNATIVE_${PN}_class-target
>> data_smart.py:641 [renameVar]
>> #     " fallocate"
>> # pre-expansion value:
>> #   " fallocate"
>> ALTERNATIVE_util-linux=" fallocate"
>>
>> # $ALTERNATIVE_util-linux_class-target
>> #   rename from ALTERNATIVE_${PN}_class-target data_smart.py:641 [renameVar]
>> #     " fallocate"
>> ALTERNATIVE_util-linux_class-target=" fallocate"
>>
>> # $ALTERNATIVE [19 operations]
>> #   set /OE/build/oe-core/openembedded-core/meta/conf/documentation.conf:63
>> #     [doc] "Lists commands in a package that need an alternative binary
>> naming scheme."
>> #   override[util-linux-hwclock]:set
>> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:245
>> #     "hwclock"
>> #   override[util-linux-fdisk]:set
>> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:248
>> #     "fdisk"
>> #   override[util-linux-fstrim]:set
>> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:251
>> #     "fstrim"
>> #   override[util-linux-agetty]:set
>> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:254
>> #     "getty"
>> #   override[util-linux-mount]:set
>> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:258
>> #     "mount"
>> #   override[util-linux-umount]:set
>> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:261
>> #     "umount"
>> #   override[util-linux-readprofile]:set
>> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:264
>> #     "readprofile"
>> #   override[util-linux-losetup]:set
>> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:267
>> #     "losetup"
>> #   override[util-linux-swaponoff]:set
>> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:270
>> #     "swapoff swapon"
>> #   override[util-linux-fsck]:set
>> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:274
>> #     "fsck"
>> #   override[util-linux-blkid]:set
>> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:277
>> #     "blkid"
>> #   override[util-linux-rfkill]:set
>> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:280
>> #     "rfkill"
>> #   override[util-linux-getopt]:set
>> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:283
>> #     "getopt"
>> #   override[util-linux-sulogin]:set
>> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:286
>> #     "sulogin"
>> #   override[util-linux-mountpoint]:set
>> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:289
>> #     "mountpoint"
>> #   override[util-linux]:rename from ALTERNATIVE_${PN} data.py:116
>> [expandKeys]
>> #     "dmesg kill more mkswap blockdev pivot_root switch_root hexdump last
>> lastb logger mesg renice wall unshare setsid chrt flock utmpdump eject
>> nologin taskset"
>> #   override[util-linux_class-target]:rename from
>> ALTERNATIVE_${PN}_class-target data_smart.py:641 [renameVar]
>> #     " fallocate"
>> #   override[util-linux-doc]:rename from ALTERNATIVE_${PN}-doc data.py:116
>> [expandKeys]
>> #     "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8
>> utmpdump.1 rfkill.8 kill.1 libblkid.3 blkid.8 findfs.8 fsck.8 uuid.3
>> eject.1 logger.1"
>> # pre-expansion value:
>> #   "None"
>>
>> On Thu, Jul 26, 2018 at 4:00 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>>> This probably doesn't do what you're expecting it to do, use
>>> ALTERNATIVE_${PN}_append_class-target = " fallocate"
>>>
>>> You can check with bitbake -e to see what's the difference between these 2.
>>>
>>> On Thu, Jul 26, 2018 at 3:56 PM Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>>> wrote:
>>>
>>>> Because the util-linux_2.32.bb recipe explicitely disables fallocate
>>>> for nativesdk triggering build warnings:
>>>>
>>>> WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux:
>>>> alternative target (sdk/usr/bin/fallocate or
>>>> sdk/usr/bin/fallocate.util-linux)
>>>> does not exist, skipping...
>>>> WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: NOT adding
>>>> alternative provide sdk/usr/bin/fallocate:
>>>> sdk/usr/bin/fallocate.util-linux
>>>> does not exist
>>>> WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: alt_link ==
>>>> alt_target: sdk/usr/bin/fallocate == sdk/usr/bin/fallocate
>>>>
>>>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>>>> ---
>>>>  meta/recipes-core/util-linux/util-linux.inc | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-core/util-linux/util-linux.inc
>>>> b/meta/recipes-core/util-linux/util-linux.inc
>>>> index ed5c618750..504f3c5b61 100644
>>>> --- a/meta/recipes-core/util-linux/util-linux.inc
>>>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>>>> @@ -206,8 +206,9 @@ do_install_append_class-native () {
>>>>  ALTERNATIVE_PRIORITY = "80"
>>>>
>>>>  ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root
>>>> switch_root"
>>>> -ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall
>>>> fallocate unshare"
>>>> +ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall unshare"
>>>>  ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject nologin taskset"
>>>> +ALTERNATIVE_${PN}_class-target += "fallocate"
>>>>
>>>>  ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
>>>>  ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
>>>> --
>>>> 2.18.0
>>>>
>>>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

