Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 63A0D71A81
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 16:09:46 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id n19so2002111vkd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 08:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gadH28hLMAD2RiRVNBlhFZtSDIslpDp9WSUt04l/86s=;
	b=BZIy89XfJtAMO+YVGIkCGE8DVFc6aoZaMJ/4LG87HvbeAMhaE4TBIFyeDOCrwGMJAM
	0JYqShxo4ChpYGhGfjdqkKUhFWD9CRcI6BgFtcT4tkr1A/4ZYjwq9qk4r1kYW7oZ5Qh8
	HSjvRtjFBpvIdCHdXT9UzbucXpdarDrWvx1AClQfCFPe3MRR8fteTQf85MPhoe3kPP+0
	Fh8jpvELBOhecTgBJaMpojQb7Ht7/BiWDbiuoWy8lH9KJnMiaAekqwbraHWBTC1lTRzV
	v6thfQ9fhWJcXCAvUWH7fe/cZo9Fxg1iaeNoGdDdWqhv3pwoGLIuN3+E0VzbnLpCV62m
	SPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gadH28hLMAD2RiRVNBlhFZtSDIslpDp9WSUt04l/86s=;
	b=Chrw+1GPjP9GfwFKLqHHxG1gMLw/cNtuogvtGxRhYdhul56kJf/G2fSZr41g8huU05
	i8vmJh2KmjWoZB2SQEmV+CVWhmE0Iujs983YfArFFUtowv80rL/MDI1DNP39RIBUxpN5
	rlrqdsbFYS6M6O8AZ/IAFAd1oVyu7R+NUwabCgm15ooMIH/Jyw22Zx+6iCluTIKi0mDs
	XaH0SsseAo8L1W1TywsfE01bBO4DWJ2awydytTyiynFBwqLyZYeWAJ0ylcNHma1P+q6j
	DVUU1+KJn+GDylrRO69Bcmj0eEFdq53DPJ+vP0m/BqdcXnoQEks8yewziDUdFzMMYSHN
	KlQA==
X-Gm-Message-State: AIkVDXLSI3eaZOqS23F23nbOr6dA2gf/wM/VAaKkFOpU0LUbgDMVxm0jUm6RI5a4QG/Rhq87t0vlB8DGc5dWnQ==
X-Received: by 10.31.115.142 with SMTP id o136mr4545815vkc.139.1484150987255; 
	Wed, 11 Jan 2017 08:09:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Wed, 11 Jan 2017 08:09:16 -0800 (PST)
In-Reply-To: <1484149497.3966.17.camel@pbcl.net>
References: <20170111035102.18447-1-raj.khem@gmail.com>
	<20170111035102.18447-2-raj.khem@gmail.com>
	<1484149497.3966.17.camel@pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Jan 2017 08:09:16 -0800
Message-ID: <CAMKF1somd9TqCZRv3=2A+==X2=VU-39GTOP+mtOemibGnp-QNg@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: Upgrade to 2.25
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
X-List-Received-Date: Wed, 11 Jan 2017 16:09:49 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 11, 2017 at 7:44 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2017-01-10 at 19:51 -0800, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> The log message for this commit is a bit misleading.  Glibc 2.25 has
> not been released (and the release is not scheduled for another three
> weeks) and we clearly can't upgrade to a version that doesn't yet
> exist.
>
> If you want to update the recipe to the current tip of master in order
> to get more testing of a 2.25 preview during the freeze period then I
> think that's a fine idea, but it should not be described as "upgrade to
> 2.25".

Agreed. I can change it to append RC, I wanted to have wider testing
before we get the final release in Feb first week. So we can weed out
issues proactively.

>
> p.
>

