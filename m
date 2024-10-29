Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65280D3A672
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 16:32:36 +0000 (UTC)
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
 by mx.groups.io with SMTP id smtpd.web10.1040.1730219551139292468
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 09:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=qYh9JPNB;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=qYh9JPNB;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 81.2.195.163, mailfrom: andrej.v@skyrain.eu)
Received: from [172.25.231.43] ([85.248.43.180])
	by cmgsmtp with ESMTPSA
	id 5p8utg9kFeqGt5p8utz69m; Tue, 29 Oct 2024 17:32:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1730219548; bh=U6ZThQHwME4kkhuszhlq9WSsraAHfo/TBOjkG0JyVx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=qYh9JPNBxJtV0WqFPEiufokvWCypo0nHICSGhGYUC0MMOfvTUrRYgaQeP1lC+2RZf
	 hgzVljyvGevkITj7vy0yxVMIga8+0G53W0p7lg7INGS2On8gSRyRaXJD6UskQ/w203
	 ycLMUhfHlT5JqmG0P4Vt9UHjTo9CyLwCKBNWtPLPXejYezsq+InZ7Zk+guMN1pe/Dh
	 yEb8JbEG7Eam2cYGh7dMCm9ZKuAREd0rr+vKc+ilrYpLl/US0x6lccL90VQqG935Zl
	 yfcaNxSs5FIitqQrs1PxgOcFh7O/vZPIGnUrVckSGu+W0UmdseeXxmaE/9zu1NIdhk
	 4rw680qmBlEyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1730219548; bh=U6ZThQHwME4kkhuszhlq9WSsraAHfo/TBOjkG0JyVx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=qYh9JPNBxJtV0WqFPEiufokvWCypo0nHICSGhGYUC0MMOfvTUrRYgaQeP1lC+2RZf
	 hgzVljyvGevkITj7vy0yxVMIga8+0G53W0p7lg7INGS2On8gSRyRaXJD6UskQ/w203
	 ycLMUhfHlT5JqmG0P4Vt9UHjTo9CyLwCKBNWtPLPXejYezsq+InZ7Zk+guMN1pe/Dh
	 yEb8JbEG7Eam2cYGh7dMCm9ZKuAREd0rr+vKc+ilrYpLl/US0x6lccL90VQqG935Zl
	 yfcaNxSs5FIitqQrs1PxgOcFh7O/vZPIGnUrVckSGu+W0UmdseeXxmaE/9zu1NIdhk
	 4rw680qmBlEyQ==
Message-ID: <203632ac-7a95-40db-aaab-54bca3861e52@skyrain.eu>
Date: Tue, 29 Oct 2024 17:32:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/9] busybox: disable defconfig options from
 simpler fragments
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: yocto@pengutronix.de, openembedded-core@lists.openembedded.org
References: <20241028082913.418505-1-ejo@pengutronix.de>
 <20241028082913.418505-3-ejo@pengutronix.de>
 <824ea7ce-b5d0-4da3-8e3d-5445373e1e9a@skyrain.eu>
 <6649f86317aa3a1eafdb3d98c7f814b6e4807d94.camel@pengutronix.de>
Content-Language: en-US
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <6649f86317aa3a1eafdb3d98c7f814b6e4807d94.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfKZDdk4Ul6fiRSDVdnBxOPw5P9KxoRJpeSmUj0dTzikh/OxJcwfRGdp8/FVn85bMyTHBSJUMu2861+x3FfHTsSs8RTF5BKk2yOMx+5iwyeq+K29vHU3a
 cDH6gAHVyPAtlh/IzHUMJOmEVa2s5hA+jxaHN46eHI7Yh0Ng3Tk2U3BADGOmaLE4usUNVCBEHHfYfQjYCwnLgKOHRKLGvgmhvj93cOgTwOs0uFVxKwsl7O0g
 OOInqJ87EI1/dB0TLV3oe4iP5lqgy/PAZEC3p+oKb/RJEibBCmJx9cvI4SK3d44X6RNWnWWSMzggHz+8pLRJy7szHjVLBJADFibhL6h/tTg=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 16:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206508

Hello Enrico,

On 28.10.2024 11:39, Enrico Jörns wrote:
> Hej Andrej,
>
> Am Montag, dem 28.10.2024 um 10:06 +0100 schrieb Andrej Valek:
>>   Hello Enrico,
>>   
>>   I tried to follow (and applied) your patch, but it looks little bit inconsistent to me. In the
>> first round you enabled SHAx_HWACCEL, which is broken on some architectures. That's the reason,
>> why is disabled by default. Ok, so first apply looks like this:
> let me rephrase my commit message.
>
> The SHAx_HWACCEL is broken on some architectures, right.
> However, when you take the defconfig, without the fragments, it will currently be enabled.
> Regardless of what's in my patch.
>
> Why? Because CONFIG_SHA1_HWACCEL in Busybox' kconfig is 'default y', has no dependency on other
> options and is not listed in the 'defconfig' file so far.
>
> Thus, my first patch should not change the current situation.
Ok, I see the point. So basically you can drop the sha1sum.cfg and 
sha256sum.cfg and merge it to defconfing. The result will be, that the 
acceleration is disabled.
>>    # CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
>>    CONFIG_PASSWORD_MINLEN=6
>>    CONFIG_MD5_SMALL=1
>>   +CONFIG_SHA1_SMALL=3
>>   +CONFIG_SHA1_HWACCEL=y
>>   +CONFIG_SHA256_HWACCEL=y
>>    CONFIG_SHA3_SMALL=1
>>    CONFIG_FEATURE_NON_POSIX_CP=y
>>    # CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set
>>   @@ -884,6 +887,7 @@ CONFIG_FEATURE_HWIB=y
>>   
>>   Then I applied next patch:
>>   
>>    # CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
>>    CONFIG_PASSWORD_MINLEN=6
>>    CONFIG_MD5_SMALL=1
>>   +CONFIG_SHA1_SMALL=3
>>   +CONFIG_SHA1_HWACCEL=y
>>   +CONFIG_SHA256_HWACCEL=y
>>    CONFIG_SHA3_SMALL=1
>>    CONFIG_FEATURE_NON_POSIX_CP=y
>>    # CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set
>>   @@ -278,8 +281,8 @@ CONFIG_FEATURE_LS_USERNAME=y
>>    CONFIG_FEATURE_LS_COLOR=y
>>    # CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
>>    CONFIG_MD5SUM=y
>>   -CONFIG_SHA1SUM=y
>>   -CONFIG_SHA256SUM=y
>>   +# CONFIG_SHA1SUM is not set
>>   +# CONFIG_SHA256SUM is not set
>>    # CONFIG_SHA512SUM is not set
>>    # CONFIG_SHA3SUM is not set
>>    
>>   @@ -383,8 +386,8 @@ CONFIG_DEFAULT_SETFONT_DIR=""
>>   
>>   and you disabled CONFIG_SHA1SUM, but keep enabled the acceleration? Is there any special reason
>> for that?
> There is one, because its the inverse of what the fragments apply, which is:
>
>    $ cat ./meta/recipes-core/busybox/busybox/sha1sum.cfg
>    CONFIG_SHA1SUM=y
>    CONFIG_SHA1_SMALL=3
>    # CONFIG_SHA1_HWACCEL is not set
>
>    $ cat ./meta/recipes-core/busybox/busybox/sha256sum.cfg
>    CONFIG_SHA256SUM=y
>    # CONFIG_SHA256_HWACCEL is not set
>
> I'm pretty sure not having touched the fragments.
>
> The CONFIG_SHA1_HWACCEL options could have been changed in the defconfig, too.
> But this is nothing that I've brought in. It's a result of
> https://github.com/openembedded/openembedded-core/commit/21753f16a364e32050cf8d79bfa7e0f89be52ce7
>
> Thus I'd assume my changes are consistent. Am I wrong?
No no, it's ok.
>
>>   Anyway, there was one commit in the usptream which was touching the acceleration. So I have to
>> try it on the broken machine and see if it's still broken or not.
> If you refer to oe-core upstream, yes there have been changes.
> This is why I needed to rebase and rework my branch.
> Or are there other changes I am not aware of, yet?
Not sure if you caught the point. I mean, that I will take a look on the 
upstream fixes for acceleration and then we can enable it by default.
>>> On Fri, 2024-10-25 at 19:26 +0200, Andrej wrote:
>>>   
>>>> Ok, I was thinking that it was done by intention, but it happened 14y
>>>> ago
>>>> https://github.com/openembedded/openembedded-core/commit/615a98ed9a02
>>>> 1da245513790c064761a0a5a67e9 . So I guess not.
>>   
>>> I am not sure if I fully understand what you are referring to here.
>>> Could you provide some details about what happened there?
>>> OE didn't have those fragments 14y ago I guess.
>>   So the idea behind is that you're going to remove the fragments and keep just a one defconfig.
>> But according to your commits you kept the fragments there, even if you put some values into
>> defconfig.
> Still not sure. I had no intention of removing the fragments.
> And I'm unsure how this relates to the referenced commit.
> My intention was to actually make them useful again, which is quite the opposite I guess.
>
>
> Regards, Enrico
>
>>   Regards,
>>   Andrej
>>
>>   
>> On 28.10.2024 09:29, Enrico Jörns wrote:
>>   
>>> This disables options from the defconfig file that are enabled by
>>> explicit config fragments.
>>>
>>> Having them enabled in the defconfig renders the fragments useless and
>>> takes away the ability to disable options with
>>>
>>>    SRC_URI:remove = "<fragment>.cfg".
>>>
>>> The respective options were all deactivated once but got accidentally
>>> enabled in 4335cd24 ("busybox: refresh the defconfig from 1.33.0").
>>>
>>> This commit disables the features for:
>>>
>>> - sha1sum.cfg
>>> - sha256sum.cfg
>>> - resize.cfg
>>> - pgrep.cfg
>>> - rev.cfg
>>>
>>> Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
>>> ---
>>>   meta/recipes-core/busybox/busybox/defconfig | 12 ++++++------
>>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-
>>> core/busybox/busybox/defconfig
>>> index 6c5a8764ce..0ec65c65af 100644
>>> --- a/meta/recipes-core/busybox/busybox/defconfig
>>> +++ b/meta/recipes-core/busybox/busybox/defconfig
>>> @@ -281,8 +281,8 @@ CONFIG_FEATURE_LS_USERNAME=y
>>>   CONFIG_FEATURE_LS_COLOR=y
>>>   # CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
>>>   CONFIG_MD5SUM=y
>>> -CONFIG_SHA1SUM=y
>>> -CONFIG_SHA256SUM=y
>>> +# CONFIG_SHA1SUM is not set
>>> +# CONFIG_SHA256SUM is not set
>>>   # CONFIG_SHA512SUM is not set
>>>   # CONFIG_SHA3SUM is not set
>>>   
>>> @@ -386,8 +386,8 @@ CONFIG_DEFAULT_SETFONT_DIR=""
>>>   CONFIG_LOADKMAP=y
>>>   CONFIG_OPENVT=y
>>>   CONFIG_RESET=y
>>> -CONFIG_RESIZE=y
>>> -CONFIG_FEATURE_RESIZE_PRINT=y
>>> +# CONFIG_RESIZE is not set
>>> +# CONFIG_FEATURE_RESIZE_PRINT is not set
>>>   CONFIG_SETCONSOLE=y
>>>   # CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
>>>   # CONFIG_SETKEYCODES is not set
>>> @@ -689,7 +689,7 @@ CONFIG_RDATE=y
>>>   # CONFIG_RDEV is not set
>>>   # CONFIG_READPROFILE is not set
>>>   CONFIG_RENICE=y
>>> -CONFIG_REV=y
>>> +# CONFIG_REV is not set
>>>   # CONFIG_RTCWAKE is not set
>>>   # CONFIG_SCRIPT is not set
>>>   # CONFIG_SCRIPTREPLAY is not set
>>> @@ -1070,7 +1070,7 @@ CONFIG_KILLALL=y
>>>   # CONFIG_LSOF is not set
>>>   # CONFIG_MPSTAT is not set
>>>   # CONFIG_NMETER is not set
>>> -CONFIG_PGREP=y
>>> +# CONFIG_PGREP is not set
>>>   # CONFIG_PKILL is not set
>>>   CONFIG_PIDOF=y
>>>   # CONFIG_FEATURE_PIDOF_SINGLE is not set
>>   
>>   
So if the result is, that the configuration hasn't been changed at the 
end, I'm fine with the changes you did ;).

Regards,
Andrej

