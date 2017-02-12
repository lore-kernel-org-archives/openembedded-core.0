Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 73CD6608B7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Feb 2017 07:37:12 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id r136so5600586vke.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Feb 2017 23:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=12lES6jec6dV5S2ZsmTsxvSYnHQ8LHl21JaCyxZ5vxM=;
	b=LrQe9vQXlmrPwXIhouL6D1kkWDtl/pMEHuHYYU1mTASDYqcLNJx9WYKeE/eXO0pGRl
	PWqiAitU+3E0l5kf4wBSpfmqUcrK9AZ9zrbh1CC6V6iIOSj17/4pptbI4jXnnE36X8Ck
	LmGCKHIjTJDd1fkBsCc7UeqMYaH1wL9wN1OKGa4YSgC0oDVL1AGzyHcvLM5xCnwkm6aq
	fOT4WtrCN0pyIEJMlVOTd6drMU0I2yVEheq8WuWPcO0g7AFQmRA8mu/Q/oeZAsZ/bxFx
	PPyjbf1ksrvKlKjQR1xA8NB4t4eqGbgTrOg5cuadRbYVfHExm+ekzMDSJwhzBYvH5axX
	vwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=12lES6jec6dV5S2ZsmTsxvSYnHQ8LHl21JaCyxZ5vxM=;
	b=ne3NBWy4um1Qt9xrAJa/aitKfv6wIOZ77CJcO4OcKctcRixnoZB45zcBxOkNVipjkV
	yMLohTv6CX6kQupYGbNlM0FFqlKGnOfmAKX/ypXOGF/RwUhLfmSZWf4QeF5mocfZ+NgP
	cf3l+nkCj4P0LFPZRpAJs+kTEfEyiZ3ZCHPFW7CL5pIypCJZ9G5iQPgwHVhTCAqDAkTU
	4B2BYetVtKoFdNbgnHcKNWwj3wLAoaxppovQSgDw0q3gp/Gkg1mLbu5ZAoV6on8mVNPi
	b72FjXhbjidMxjLarRZTMsT5HqMQ7fPKhTeVHQUb3gHcncT7Qmb6reaxGkG4GjBo3GhR
	4/eQ==
X-Gm-Message-State: AMke39nxbx52d9NMV/vq5BGoAL34qVZC9jd3C0RUHGeRpCw/Lrz3mnlDeJJWR3/PrHjqPAqtgYwT/b1Pl1eZAg==
X-Received: by 10.31.153.8 with SMTP id b8mr8574490vke.140.1486885032526; Sat,
	11 Feb 2017 23:37:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Sat, 11 Feb 2017 23:36:42 -0800 (PST)
In-Reply-To: <1486562436.24931.8.camel@linuxfoundation.org>
References: <20170207042405.22707-1-raj.khem@gmail.com>
	<CAJTo0LaapTyVGhiB9AfnWznNU1z8-dbJC=7+JOThYHb2HEM2=A@mail.gmail.com>
	<1486562436.24931.8.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Feb 2017 23:36:42 -0800
Message-ID: <CAMKF1srfQPkcNdyZu0ZFqdzObx7ukHjrAaQZ+nwfTUNxLUEVGA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Sun, 12 Feb 2017 07:37:13 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 8, 2017 at 6:00 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2017-02-07 at 17:35 +0000, Burton, Ross wrote:
>>
>> On 7 February 2017 at 04:24, Khem Raj <raj.khem@gmail.com> wrote:
>> > This is converging the recipes for go from
>> > meta-virtualization and oe-meta-go
>> >
>> I'm still of the opinion that this should be in meta-go, not oe-
>> core...
>>
>> (but totally agree that converging is essential)
>
> I've just been reading the various responses.
>
> The benefit of core would be that it would get included in some of the
> core test builds/coverage and that we've have the maintainer structure
> that core has to help ensure patches get merged, if that has been a
> problem in the past.
>
> The downside is more pressure onto the OE-Core maintainers in various
> ways.
>
> I would like to see the duplication removed and have one good solution
> for it. If adding it to core is how we achieve that, great, I can work
> with that (and we can always split it out again) but I'm open to other
> ideas too, if they can work...

There are more layers which are using go for application development
e.g. meta-mender etc. I think ecosystem will benefit if it was in
OE-Core and second best solution would be to start a layer e.g.
meta-go on yp.org. I am fine with either approach in that order.

