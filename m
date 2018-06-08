Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id EFD2D6E671
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 01:48:06 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id 31-v6so7267575plc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2018 18:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WXqTrmQFkT4lzU0OOj1pWxJCR9TSDdNjpRLZXYr0KSA=;
	b=Qrb+40MdFxjgddDMSft/piCRO1pd1D/a66JgUqRsvtW7rMOvIavMehPs5Lc4+fqgv4
	d6C/wsai2ddePS3vmKQ8CuD+hKeQCm2PuAzS83vAKfge8pW3qJli+aL70x8YVSxVj3Mf
	6b0GoIyScNcBfuU3cCnJda6k1Bvf7ZmNKMciJpJcNCXISRKzcx/DIRO9Sf9xhZCspBA6
	fs1ldPfA7Mz3vmNckTPuk+P3mQmYd9AWnuk1wHNrzIDmbzxAHhfwpr+0CO1Gil23sxTO
	VSoaj1uCGX+tuSZ/HqgL48TLwC7OO/1Tz0qx+019lJWZexPxQJ3EP63IgA0nNTP7BRlk
	rmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=WXqTrmQFkT4lzU0OOj1pWxJCR9TSDdNjpRLZXYr0KSA=;
	b=jcHMyGzC/flwFJugbGk00Lm8m/krq14QrBFMpTlP/Kq1AmjK+mDz1HtRxy9Ac0EdeL
	MH20L+q1qQ2h8DPj28KC9dGAQQSBCTr/OhSSXO8KNW+vpUm3qtCPwDrZvpFLVYMlaBe7
	DTr3COMQBE9uFHHm5RQTcmE4nug9/ziwTx0TQa4b2oJ/y/XVt5f1tQJz+YT4fxLMYcwf
	UhbhCfRgYiFNNmefosl8hyx3Odv2Mi+5cWbRI6igRoUCzt1qb7RpJxPvg6V/H4AhbdBw
	tw+lGWGbrTqkfHW/SJVJYIqdnsXJbyov5dCiuCmeHfdMrsPJnODv0DVQdqi9nPgT38Mo
	bqVQ==
X-Gm-Message-State: APt69E2mkcp4JoxNQlN09UtFH3Hs4DdD2eeAkJPcGRUNpbfnUjwGsH+C
	pPRnGeMLVuHiM3i3SdQSyNd+WoH/
X-Google-Smtp-Source: ADUXVKK3kMzxm34+lBGXheCi7WA8uGGJnl7Btx1ncGmFD+wZd1sxLsD4RYfE0C92og/Yp942IuVlMw==
X-Received: by 2002:a17:902:c6b:: with SMTP id
	98-v6mr4287678pls.37.1528422487503; 
	Thu, 07 Jun 2018 18:48:07 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:4576:376:b010:94ac])
	by smtp.gmail.com with ESMTPSA id
	h27-v6sm80906306pfk.160.2018.06.07.18.48.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 18:48:06 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>
References: <cover.1528320772.git.raj.khem@gmail.com>
	<635c8757bf852c8a4248009f241c19146431cacd.1528320772.git.raj.khem@gmail.com>
	<CAJ86T=U5WPudMu_VBL_Y00DQrOjRb91=x+6+21V0ZQKhCQ7ThA@mail.gmail.com>
	<CAMKF1so4AMMhXS4VRNV2CPjvPRbzkPWEW3f=iTNio2jNC1Fgxw@mail.gmail.com>
	<CAJ86T=VCqqt_7OXT__NLtH_uayoSX_rFS=vXEyOZY3BQz3+FKQ@mail.gmail.com>
	<5c57a121-c4cd-e548-cd26-182076deb917@gmail.com>
	<CAJ86T=U12bdRd=GtseZc8DSKOyEm=OdM=JJZB_6Uu4c0e5__1w@mail.gmail.com>
	<CAMKF1srdYY8MXiFWjk7Khh2TsDQ0faTPV4gn5tRfUwrXEUYpUA@mail.gmail.com>
	<CAJ86T=UTpUaBVcrp-6g_A7e51WhjiSuE7i8wjxzct1ii-xCuqw@mail.gmail.com>
	<d9536882-8db8-9fb0-91c1-fe1f023efb49@gmail.com>
	<CAJ86T=UvPRe9QxL_DP+ZKhCbgCe2AFxqPzixkcmxi_w9WxzHPg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <82c10a06-6e71-a6e5-d20f-3e326be8369f@gmail.com>
Date: Thu, 7 Jun 2018 18:48:05 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=UvPRe9QxL_DP+ZKhCbgCe2AFxqPzixkcmxi_w9WxzHPg@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] tune/arm: Set -mtune instead of -mcpu
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
X-List-Received-Date: Fri, 08 Jun 2018 01:48:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/7/18 6:20 PM, Andre McCurdy wrote:
> On Thu, Jun 7, 2018 at 5:57 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On 6/7/18 4:38 PM, Andre McCurdy wrote:
>>> On Thu, Jun 7, 2018 at 7:04 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Thu, Jun 7, 2018 at 12:14 AM, Andre McCurdy <armccurdy@gmail.com>
>>>> wrote:
>>>>> On Wed, Jun 6, 2018 at 10:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>> On 6/6/18 4:42 PM, Andre McCurdy wrote:
>>>>>>> On Wed, Jun 6, 2018 at 3:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>>>
>>>>>>> The -mcpu, -march and -mtune options are not new and gcc 6 and 7 catch
>>>>>>> the same conflicts. It doesn't make sense that gcc8 is just catching
>>>>>>> more issues.
>>>>>>
>>>>>> It does make sense. the option parsing for these specific options on
>>>>>> arm
>>>>>> have been revamped after gcc7, see
>>>>>>
>>>>>> https://github.com/kraj/gcc/compare/a99ae290af49793cd3db7a74f3dbc59e64d356a1...68b54adbd7b10c66d968d74b96fba552bd46ebb7
>>>>>
>>>>> Thanks. These commits seem to be related to handling of options like
>>>>> "-mcpu=cortexa9+nosimd". Was that the error you saw in testing?
>>>>>
>>>>> If you can provide the command line that caused the error then it
>>>>> should be quick to establish whether it's gcc8 being more picky.
>>>>>
>>>>> Or perhaps there's always been a warning and -Werror has been added to
>>>>> a gcc8 Makefile where it wasn't before?
>>>>>
>>>>>>> If we are trying to build something which is reusable across multiple
>>>>>>> machines with the same architecture then it's a bug to be passing
>>>>>>> machine specific CFLAGS. Making the machine specific CFLAGS more
>>>>>>> generic is not the right solution.
>>>>>>
>>>>>> being reusable is a side-effect and a good one. Real problem is we are
>>>>>> not
>>>>>> matching to what we say in package arches, Probably you are confusing
>>>>>> tunes
>>>>>> to be meant for static code generation for a given CPU.
>>>>>
>>>>> Sorry, I don't really follow what you mean?
>>>>>
>>>>>> I am interested to
>>>>>> hear more ideas to what would be right solution if this is not it.
>>>>>
>>>>> I'd like to understand what the problem is first before trying to
>>>>> propose any solutions.
>>>>>
>>>>> ie what specifically has changed with gcc8 to cause the error which
>>>>> wasn't seen before?
>>>>
>>>> I would suggest take this gcc8 patch series and revert this one then
>>>> build
>>>> gcc-runtime for rpi3
>>>
>>> That's the answer to "how do I reproduce the issue" not to "what is the
>>> issue".
>>
>> another way to nudge for some help :) Thanks for digging further details.
>>
>>> Anyway, I can reproduce the issue. The root cause is that gcc-runtime
>>> libatomic tries to support runtime selection between different
>>> implementations of a few low level functions by making use of the gcc
>>> "ifunc" function attribute:
>>>
>>> https://gcc.gnu.org/onlinedocs/gcc-8.1.0/gcc/Common-Function-Attributes.html#index-ifunc-function-attribute
>>>
>>> ie libatomic can contain versions of functions specific to armv6 or
>>> armv7 with selection between them being made at runtime via ifunc.
>>>
>>> In order to build the armv7 versions of these few functions, the
>>> libatomic Makefiles selectively add -march=armv7-a to CFLAGS. This
>>> isn't new - it goes back to at least 2012 in gcc git history.
>>>
>>>     https://gcc.gnu.org/ml/gcc/2014-01/msg00141.html
>>>
>>> What _is_ new is that for ARM, support for ifunc function attributes
>>> was not enabled prior to gcc8. ie when building with gcc7, the
>>> libatomic configure script determines that the toolchain doesn't
>>> support ifunc and libatomic therefore builds without support for
>>> runtime function selection... since it never needs to compile armv7
>>> specific versions of the runtime selectable functions the -march -vs-
>>> -mcpu conflict never happens.
>>>
>>>     https://gcc.gnu.org/ml/gcc-patches/2017-10/msg00521.html
>>>
>>> (Note that ifunc support for ARM in gcc8 is still only enabled for
>>> glibc, so this issue doesn't show up at all with musl).
>>>
>>> Various solutions are possible:
>>>
>>> 1) Let libatomic continue to build with ifunc support enabled, but
>>> avoid -march -vs- mcpu conflicts by dropping -mcpu from OE's CFLAGS in
>>> the gcc-runtime recipe.
>>
>> I don't think this is required. Even though it might be useful for other
>> reasons.
>>
>>> 2) Let libatomic continue to build with ifunc support enabled, but
>>> avoid -march -vs- -mcpu conflicts by updating the libatomic Makefiles
>>> so that they always safely over-ride any combination of -march, -mcpu,
>>> etc passed in from the build environment. ie patch the libatomic
>>> Makefiles to replace:
>>>
>>>     IFUNC_OPTIONS = -march=armv7-a+fp -DHAVE_KERNEL64
>>>
>>> with:
>>>
>>>     IFUNC_OPTIONS = -march=armv7-a+fp -mcpu=generic-armv7-a -DHAVE_KERNEL64
>>>
>>> (Regardless of the solution we pick for OE, I think that fix should be
>>> submitted upstream to libatomic. There's no need for libatomic to risk
>>> build errors by not defining -mcpu in cases where it specifically
>>> wants to target armv7a).
>>
>> I think this is better. Now my memory serves me right I had a local patch
>> few months ago which I discarded where I was using -march with armv7ve but
>> it was limiting for other reasons. I think it would be better to drop -march
>> completely.
>>
>> IFUNC_OPTIONS = -mcpu=generic-armv7-a -DHAVE_KERNEL64
>>
>> I will test it out locally and see if that works.
> 
> If you only set -mcpu then you're likely to run into issues when
> -march is set externally to something incompatible.

yes that is right.

> 
>>> 3) Prevent libatomic from building with ifunc support enabled for ARM
>>> by forcing "libat_cv_have_ifunc=no" from the gcc-runtime recipe.
>>
>> This would be ok too for OE ifuncs dont serve much since we target a
>> specific CPU anyway.
> 
> Right. This is the one I'd vote for. For ARM there's little point
> including runtime alternatives when we always compile everything in
> rootfs for one particular target architecture level anyway.
> 

I think we can have both 2 and 3 where 2 is more upstreamworthy and 3 we 
can keep for OE

