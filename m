Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 381A07457C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2018 00:29:18 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id u86so7209687pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 17:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0QQTZELAUqeaMQ3CXXoLr8peeusoHQ4fV8DwobBW6GE=;
	b=XJblNMAao5bc2Us1zU1KmFiCvpunXV5hTEeWb1b5Rn/Sot2yBdi3gDZR+fZgZpT2Rj
	9v2VgdBBZC0SSdvdGJenbmeaBShBUp3d30leH4bRoypWAWM/Lle9UOFFHg19f/haoNzG
	y6w7UcvvaUywGrwuUQMhzwekQRPIaupgpwGRZ2eiJ26z5XUjx6GRZFCpVbpvNODR2ND6
	TqJGelwOaGG7ffnl0v3Be3w4QWOF49mKJwZ1HLQfdcvUCN1H+gD2XsoWPfToTv34bmsT
	FwXHdaiVGTPdBZBhS+evenpzf99+eofiKMAOuhFCka306dn+NVxaTpnPEXpasazl6XWg
	lntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=0QQTZELAUqeaMQ3CXXoLr8peeusoHQ4fV8DwobBW6GE=;
	b=aDdysJYT7EaRXx4SmCV2e52Y2RD/tjRNgHmuOrxfjSeD0npOCq9GmV2zqI5Y63BCS+
	Dz8fy6Ag3P1AHkDjsmzvnQJd+9oa3OPAGnVlJV5Ec0nWvXc/tARZH/nWKLvku52Rn+ls
	/f8GGZygAJL+1tO8AjvCldJVMCvxlfCKGaeqNM+5ryCDVemODV3YzSdd9JwZjCXPbr+r
	H9tWqAINcvLGRvu6hKNgHHcYJGGI63XR0otqZ9NGUOcnRplyrjRkg2Uw7K2yVTQvRNfP
	5qnOW2SGTYrTaUQ5C22N5LV1dWX1NLmj+dhqNufhSEgBV2+rw47Ot/7KHZTAt9qHIweQ
	uDrg==
X-Gm-Message-State: ALQs6tB8OxwrwMg7IlGuQ07wRGLQ/avGkAyUDgRYD5/Ho86mItNhFz2n
	qlaS1oFiCq4V2EcA8jWmuFKqwJK4
X-Google-Smtp-Source: AIpwx499HHeRxrOFo9VEi2Hr+xXBSvSXozcB66ebN77HdUL1WKYEMRvODCW19zeYaPLUp/u0Q1YAlg==
X-Received: by 10.101.92.139 with SMTP id a11mr5520591pgt.92.1523665759999;
	Fri, 13 Apr 2018 17:29:19 -0700 (PDT)
Received: from hermes.local ([2601:646:8880:466c:4caf:c486:61ac:d2f7])
	by smtp.gmail.com with ESMTPSA id
	l64sm12182591pga.33.2018.04.13.17.29.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Apr 2018 17:29:19 -0700 (PDT)
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1523387170-30191-1-git-send-email-denis@denix.org>
	<CAJTo0La0UV_6yYzdPsFnBtak0JfX0QQU-24JFN1_N7te8=Mepw@mail.gmail.com>
	<CAJTo0LY3uVhbN+97EQSXVmLGzgM-JZm33Sy-Mp11MJFWDmNLMA@mail.gmail.com>
	<2181952.fkZBnDg1uM@peggleto-mobl.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <b9524332-efb4-9211-26d6-0bac84408582@gmail.com>
Date: Fri, 13 Apr 2018 17:29:18 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <2181952.fkZBnDg1uM@peggleto-mobl.ger.corp.intel.com>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 2/2] weston: upgrade to 4.0.0
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
X-List-Received-Date: Sat, 14 Apr 2018 00:29:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/11/18 3:11 PM, Paul Eggleton wrote:
> Yes, this is a bit of a known bug although I didn't actually file one until
> now:
> 
>    https://bugzilla.yoctoproject.org/show_bug.cgi?id=12674
> 
> Cheers,
> Paul
> 
> On Wednesday, 11 April 2018 11:17:51 AM NZST Burton, Ross wrote:
>> Ah presumably this is because the U-S is after the scissors.  Denys,
>> when you add it back, can you put it above the ---?
>>

Upstream-Status is a Yocto project invention that can confuse other 
communities when submitting the patches for those packages upstream and 
Sign-off-by is also in same bucket in many upstream packages. We need to 
be able to support patch headers that are git am'able upstream as well 
as to openembedded recipe created trees.

One still has to delete these tags but if you forget its still is ok 
since they will be ignored with git am.

>> Ross
>>
>> On 11 April 2018 at 00:16, Burton, Ross <ross.burton@intel.com> wrote:
>>> On 10 April 2018 at 20:06, Denys Dmytriyenko <denis@denix.org> wrote:
>>>> diff --git a/meta/recipes-graphics/wayland/weston/0001-make-error-
> portable.patch b/meta/recipes-graphics/wayland/weston/0001-make-error-
> portable.patch
>>>> index 0671a45..6799254 100644
>>>> --- a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
>>>> +++ b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
>>>> @@ -1,26 +1,25 @@
>>>> -From c22e90365d89346258394833cbcad03ff32b2e27 Mon Sep 17 00:00:00 2001
>>>> +From ad1d2161c811cff25d1684c33611f300adb753bc Mon Sep 17 00:00:00 2001
>>>>   From: Khem Raj <raj.khem@gmail.com>
>>>>   Date: Fri, 29 May 2015 20:56:00 -0700
>>>> -Subject: [PATCH weston] make error() portable
>>>> +Subject: [PATCH] make error() portable
>>>>
>>>>   error() is not posix but gnu extension so may not be available on all
>>>>   kind of systemsi e.g. musl.
>>>>
>>>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ----
>>>> -Upstream-Status: Submitted
>>>
>>> Ah, I've seen this before and was wondering if it was a genuine
>>> mistake or devtool being bad.
>>>
>>> devtool refresh is doing A Bad Thing and for some reason dropping the
>>> Upstream-Status tag.  Alex, can you see why this is?  Denys, can you
>>> edit it back in?
>>>
>>> Ross
>>
> 
> 

