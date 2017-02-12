Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id D35C271C9A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Feb 2017 14:20:52 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id v186so141163929wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Feb 2017 06:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8XMdbqJR39R9lIi1845/m8FBQGHO37OgJO8lfAOZZEk=;
	b=joOWr1+1SEaSTjm4i/czeV3xu7T1cJkeTywgLM30i/+DLXfrNDMDYXEB+tCUic8/9L
	yUc9qinw708Bao2ZuIG28waDDeW1G3aiFlO9jOwljn5TF6m+Z1cxlSit9jvRRyOqzjGz
	Kibi+VpmuZxjVZf2GdnQ+qCk0FcArqjv1HB7gDuJsOD38t4LCjQcrUz9QQ9hn9bPentJ
	R0boNujDq3Swwgt2+Y25sm2h5/MVlQd2YoUnw8eWkujEfwcSHVXNXrSbDNhAFZkW2Ldh
	WfPWjOhzPjPID1i4oE+Q5azUxABbNyWn11cTS5N62JXhd11RiTj/0tmRDYvSeh09g/6D
	RG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8XMdbqJR39R9lIi1845/m8FBQGHO37OgJO8lfAOZZEk=;
	b=pG3rx47hcqGRmDSPV92HAsWtVcWpJWHTsJ9VnTrK86rUVlmpKMJdsFdQa6rCZZX7Qc
	xm4iRogTAlkCNiKQwZQQrdOB3Ue68d4F3qMvX6WbmFHD2nPqtYrAS0Ep/1Y5cPzE3wqI
	9Ek+G7AGzdmeFIhCpodEf5j4cSshq5q07WFnnB96sZmbIJnj/7PdXibMDHhzFnN+k8iF
	k/c7b3P4NcIWOKjbKnGKeZPjtmutlbLcw6eyvOIHsHFjITJzK42aKC8Ero0QVzAjQ/7I
	N8PtDpusQcDSRNK+H3337z43nbME7jZuyw09GhsSqvN0vP4CWV74zrqzpAo0nJRlVyEL
	HQiQ==
X-Gm-Message-State: AMke39lHEs+tqGdyuwTfGtfTrUb3vWVYr/UyGtwGSpB4rtSJ9ydRbuuykTITakYlFXWKtoTv4Vpk6uL1Gk5HKw==
X-Received: by 10.28.4.216 with SMTP id 207mr14370628wme.45.1486909252124;
	Sun, 12 Feb 2017 06:20:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.52.78 with HTTP; Sun, 12 Feb 2017 06:20:31 -0800 (PST)
In-Reply-To: <CAMKF1srfQPkcNdyZu0ZFqdzObx7ukHjrAaQZ+nwfTUNxLUEVGA@mail.gmail.com>
References: <20170207042405.22707-1-raj.khem@gmail.com>
	<CAJTo0LaapTyVGhiB9AfnWznNU1z8-dbJC=7+JOThYHb2HEM2=A@mail.gmail.com>
	<1486562436.24931.8.camel@linuxfoundation.org>
	<CAMKF1srfQPkcNdyZu0ZFqdzObx7ukHjrAaQZ+nwfTUNxLUEVGA@mail.gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Sun, 12 Feb 2017 15:20:31 +0100
Message-ID: <CAD4b0_JZqi_m-iBfEbomzMOXNjo04LDFnjDVLu1+5q+yEZYSTw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Sun, 12 Feb 2017 14:20:56 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 12, 2017 at 8:36 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Feb 8, 2017 at 6:00 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Tue, 2017-02-07 at 17:35 +0000, Burton, Ross wrote:
>>>
>>> On 7 February 2017 at 04:24, Khem Raj <raj.khem@gmail.com> wrote:
>>> > This is converging the recipes for go from
>>> > meta-virtualization and oe-meta-go
>>> >
>>> I'm still of the opinion that this should be in meta-go, not oe-
>>> core...
>>>
>>> (but totally agree that converging is essential)
>>
>> I've just been reading the various responses.
>>
>> The benefit of core would be that it would get included in some of the
>> core test builds/coverage and that we've have the maintainer structure
>> that core has to help ensure patches get merged, if that has been a
>> problem in the past.
>>
>> The downside is more pressure onto the OE-Core maintainers in various
>> ways.
>>
>> I would like to see the duplication removed and have one good solution
>> for it. If adding it to core is how we achieve that, great, I can work
>> with that (and we can always split it out again) but I'm open to other
>> ideas too, if they can work...
>
> There are more layers which are using go for application development
> e.g. meta-mender etc. I think ecosystem will benefit if it was in
> OE-Core and second best solution would be to start a layer e.g.
> meta-go on yp.org. I am fine with either approach in that order.

Alternatively, I think that OE maintainers would not mind carrying
meta-go in their meta-openembedded. There's already a couple of
important languages there (eg. Lua, albeit in meta-oe) and a number of
language specific layers (meta-python, meta-ruby, meta-perl). There's
additional benefit of being included in 'bitbake world' jobs.

-- 
Maciej Borzecki
RnDity

