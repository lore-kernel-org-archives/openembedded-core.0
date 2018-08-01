Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 46AD560190
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 21:11:23 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id b14-v6so10020636vke.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2018 14:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Hhaocws0uAtVtchqial5eZF8yoiwrA5kFgM8s4e5JfU=;
	b=Qcj61p19dKawbhLB/Bu4PJuhWwSLUNUDbZWM3Q0zjAFCspSzYFM9F5r/o/dttk+gjt
	tsyi5TLXlMpWavhxaNaH+OvEvK/yQaZUhnS/OgzAmjxLqoknInf3W6O68inTvIo1t/9+
	WagVpXwAS21CjVzbLb1/R28+6T6U6bp50SzyIPpJA+RF2E7ew5wdV3KlXwjHFTmdK0vq
	a9aThmZSqZkXET/EtYHNkUMf2iJf166Y8MfyZ6YtxLhqrRxsXsXMXTOY13BQLjjG3LM3
	8Lwymarx/5moyweu99+R8ZsbXtSnEgjLRCnRl/aOB/W4FbqXRDuh4zW1+XOZW0LqHW0+
	hdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Hhaocws0uAtVtchqial5eZF8yoiwrA5kFgM8s4e5JfU=;
	b=UOtUVH1Q6ffNGHiQCoq3QiX+ynTu1UjLbcDvJEbu/i1b8TOlT7ryguOnAACeXoKGEj
	bJ3bdMAQ3uV1EFeNgck2lvkzBIZDnVx2bM8aAfh2AVjBe+1NTBbxi++iG47foesHggec
	22NEnqA378kHsk4Vt94nCZyI9f+QJ2+KY8mHmwW9lp5MyVfKSUZQqFCCS/yO+T3FdpwP
	wYvDRbD8669qH7/izc4g40t2QhafIfAoQ7wUWkawRkv1kxdz0c4dpxlNnN1Ac+W+LCWG
	1UidLNgkHt2CLazXwDIkxNAtVPhouypUOlFDVWEzWbs09beQdmR6tj9wzM3BMOyL9B/F
	G1rA==
X-Gm-Message-State: AOUpUlEStF2Vr56fKEqijPz+SpD+xkHlvl30HWUQT/jix3laxg3qbIqP
	bcu0H5tAfzCh0J88iJsNPyD//l0p8xrV2t62OaE=
X-Google-Smtp-Source: AAOMgpeond9nEXu5hJ3FFFuLkWk3RsiIEA0pBMXq3eHnrY/6D83HcobIIZzgMNNnsgSDR2Y1w5THHw4zYz/U/9tbJOY=
X-Received: by 2002:a1f:acf:: with SMTP id 198-v6mr16442vkk.86.1533157884043; 
	Wed, 01 Aug 2018 14:11:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Wed, 1 Aug 2018 14:11:23 -0700 (PDT)
In-Reply-To: <0041e5c9-ee79-d720-c859-617107ae4001@siemens.com>
References: <1533000487-12738-1-git-send-email-armccurdy@gmail.com>
	<b9a00beb06723da9bdd5f32923057d31ccbc0941.camel@linuxfoundation.org>
	<b5b31110-b182-fc03-e648-bd5d90f025ef@siemens.com>
	<CAJ86T=UZqd5JBBaG4hQ+PAwLs-8bDaKbrQS0XHuXUquF6Qg94w@mail.gmail.com>
	<0041e5c9-ee79-d720-c859-617107ae4001@siemens.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 1 Aug 2018 14:11:23 -0700
Message-ID: <CAJ86T=VfT-HVrf56=UV=CuKY1FubqZyM6QqJsRahm0JJmJCxbA@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl_1.0: drop unnecessary dependency on makedepend-native
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
X-List-Received-Date: Wed, 01 Aug 2018 21:11:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 1, 2018 at 12:44 AM, Andrej Valek <andrej.valek@siemens.com> wrote:
> If you are pretty sure, that makedepend command will available after
> makedepend-native package dropping, I am fine with that.

I am sure that the makedepend command will NOT be available after
removing the makedepend-native dependency.

Perhaps the explanation I tried to give in the git commit wasn't as
clear as I thought... could you please read it and let me know which
part doesn't make sense?

> Cheers,
> Andrej
>
> On 07/31/18 15:34, Andre McCurdy wrote:
>> On Tue, Jul 31, 2018 at 3:24 AM, Andrej Valek <andrej.valek@siemens.com> wrote:
>>> This program is required for "oe_runmake depend" command. It runs
>>> command in MAKEDEPPROG variable, which is set to makedepend. Makedepend
>>> consists from makedepend-native package.
>>
>> That's what you might guess from casually reading the Makefile. It's
>> not what actually happens.
>>
>>> Cheers,
>>> Andrej
>>>
>>> On 07/31/18 12:08, Richard Purdie wrote:
>>>> On Mon, 2018-07-30 at 18:28 -0700, Andre McCurdy wrote:
>>>>> The openssl Configure script will only select standalone makedepend
>>>>> (vs running "$CC -M") when building with gcc < 3.x or with an Apple
>>>>> Xcode version which predates the switch to clang (in approx 2010?).
>>>>> Neither of these cases are possible when building under OE, therefore
>>>>> the dependency on makedepend-native can be dropped (ie align the
>>>>> openssl 1.0 recipe with the 1.1 recipe, which has dropped the
>>>>> makedepend-native dependency already).
>>>>>
>>>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>>>> ---
>>>>>  meta/recipes-connectivity/openssl/openssl_1.0.2o.bb | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
>>>>> b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
>>>>> index f5d3274..78c8552 100644
>>>>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
>>>>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
>>>>> @@ -8,7 +8,7 @@ SECTION = "libs/network"
>>>>>  LICENSE = "openssl"
>>>>>  LIC_FILES_CHKSUM =
>>>>> "file://LICENSE;md5=f475368924827d06d4b416111c8bdb77"
>>>>>
>>>>> -DEPENDS = "makedepend-native hostperl-runtime-native"
>>>>> +DEPENDS = "hostperl-runtime-native"
>>>>>  DEPENDS_append_class-target = " openssl-native"
>>>>>
>>>>>  PROVIDES += "openssl10"
>>>>
>>>> This was added quite 'recently' in:
>>>>
>>>> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=50c23e6c26a64b0c04e99abacb61ec00d1abace9
>>>>
>>>> I've cc'd Andrej in case he can tell us why that was needed?
>>>>
>>>> Cheers,
>>>>
>>>> Richard
>>>>

