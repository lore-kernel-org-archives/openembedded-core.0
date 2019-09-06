Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 516997D075
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 00:10:19 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id y5so280209pfo.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 17:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=subject:to:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=51aLQrdSLYK7vTi3wSXBIC9bsv/qJ++1/viZ62x1Xtw=;
	b=ON/l2djnRAPzShnKMho3TmPU860GKVGvztYJ+oRc0W5GhKd3FJkVTeNOWrmPlumVca
	YABj07p8thHuYot9YRT5vWTVcndFDN0AryBOUBPUCqu/rth2nmvLHEdX7/snMI6yzuZE
	lIAfeYWHsZsYQCdw4jTW4/ZWRyyoZ0Im4VySQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=51aLQrdSLYK7vTi3wSXBIC9bsv/qJ++1/viZ62x1Xtw=;
	b=e3CgnE0QWfAtie9Qzo9QyYPNr4v0LSWVbmtneskWZ7sgrI1g5d2oCkZXQq/y3e4EMP
	yMjYeWL0YiJggMlAPFOV4bdNH2ocn7dn16Q0H4tArFHX8v87P4uCNQb+87cawtS2ayvd
	DcOseFnxrw1TssYgixCwyaKsV1wAWQ+rh0MVhhI3fwh8Ra6RITNELAyZZFSiOMDIu1XV
	pdXj1meFsyYUTWQHoPZzRqLHrtvsAFhyPd8uiR1CCBksVsGVjSSF9H0N6t1r0qr2BhaA
	Z0AIPGF/iTN08jn7NuypuJJ3r3O2nUUwjv8+euN1Vx76SMWBpZGWmaZvVQjsiCz+wN3q
	BC9Q==
X-Gm-Message-State: APjAAAWP8JeVHYVQW103gancoFtweEbw0syECpTv0ri5CbsNtgvnvabe
	n73wazzFWYX3d5WBP2bVJvxs7F4iBkU=
X-Google-Smtp-Source: APXvYqzdSzcvXnQDGObhH6df9uv5E83AEiLcIIhcTWqOvbt7AX65nUugX8a2+GoICOk9qQZsDNubaA==
X-Received: by 2002:a63:125c:: with SMTP id 28mr5587954pgs.255.1567728619682; 
	Thu, 05 Sep 2019 17:10:19 -0700 (PDT)
Received: from [10.0.0.244] (c-67-189-24-112.hsd1.or.comcast.net.
	[67.189.24.112])
	by smtp.gmail.com with ESMTPSA id g18sm5817785pgm.9.2019.09.05.17.10.18
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 05 Sep 2019 17:10:18 -0700 (PDT)
To: richard.purdie@linuxfoundation.org,
	Mark Asselstine <mark.asselstine@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20190822155616.35046-1-mark.asselstine@windriver.com>
	<25701351.g1SN1yf5Qq@yow-masselst-lx1>
	<ed991280f92d2eaf14dadb912d86cd88601b2284.camel@linuxfoundation.org>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Openpgp: preference=signencrypt
Autocrypt: addr=mhalstead@linuxfoundation.org; prefer-encrypt=mutual; keydata=
	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
	6RA=
Organization: Linux Foundation
Message-ID: <c20767b7-a549-5075-20a0-ac115bbc1bbd@linuxfoundation.org>
Date: Thu, 5 Sep 2019 17:10:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <ed991280f92d2eaf14dadb912d86cd88601b2284.camel@linuxfoundation.org>
Subject: Re: [PATCH][V2] sdkext: use simpler kernel module for devtool test
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
X-List-Received-Date: Fri, 06 Sep 2019 00:10:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 9/5/19 2:27 PM, richard.purdie@linuxfoundation.org wrote:
> On Thu, 2019-09-05 at 13:54 -0400, Mark Asselstine wrote:
>> On Thursday, August 22, 2019 11:56:16 A.M. EDT Mark Asselstine wrote:
>>> The current devtool test for the building of an out-of-tree kernel
>>> module uses something which requires several "high order" kconfigs
>>> to
>>> be set. This results in the test failing, not for expected reasons,
>>> but rather because it depends on specific kernel configuration.
>>>
>>> You will get error messages such as
>>>
>>>   ERROR: "video_ioctl2"
>>>  
>>> [.../1.0-r5/testsdkext/workspace/sources/v4l2loopback-
>>> driver/v4l2loopback.k
>>> o] undefined!
>>>   ERROR: "video_unregister_device"
>>>  
>>> [.../1.0-r5/testsdkext/workspace/sources/v4l2loopback-
>>> driver/v4l2loopback.k
>>> o] undefined!
>>>
>>> Using a simpler hello-world kernel module example will only require
>>> that CONFIG_MODULE is enabled, thus avoiding a false positive.
>>>
>>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>>> ---
>>>
>>> **V2**
>>>  - also updated the CROPS manual test json file
>>>    (I have no idea how to run this so untested but this is a
>>> straight
>>>     substition)
>>>  - continue to use github until we can move the sample to somewhere
>>>    like git.yoctoproject.org
>> Richard, are you thinking we need to figure out the
>> git.yoctoproject.org repo 
>> before we can move ahead with merging this?
> I would like to fix that, yes. I could ask Michael for help but I do
> have access to sort it myself too.
>
> I'm also trying to sort out a few other issues before -next can merge.
>
> Since I'm failing to get to it,
>
> Michael,
>
> Could you clone:
>
> https://github.com/masselstine/kernel-module-hello-world.git 
>
> onto git.yp.org as a new repo and give write access to it for Mark,
> myself, Bruce and Ross please?

This repo is ready at
git@push.yoctoproject.org:kernel-module-hello-world for the four of you.

It is available read-only for anyone at,

git://git.yoctoproject.org/kernel-module-hello-world

and

https://git.yoctoproject.org/git/pokykernel-module-hello-world

>
> Cheers,
>
> Richard
>
>
>
-- 
Michael Halstead
Linux Foundation / SysAdmin


