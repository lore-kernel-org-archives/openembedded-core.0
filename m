Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9AADF60269
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 13:57:39 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 17so4906882pfn.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 06:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WbG4nOOtSYMSqEqxUFCXzJ5Wo240YB2vqLSizr4yxPM=;
	b=WJW+s+HCSEv7R/X+/4i8Fu9wPgDflPXJ0wbA3rAAC54YhZgkTtf3v5x/SdpNqYHNGi
	543v8YcI7K1ECcYqGv+xfm188kKU7DvmAQfEIHpyX8QCJ6f3KPEXOK25zgq5TXrt4pWU
	hVAr2lpRX3SUxOr4Cfo+XpLLW1VKvzGQjxmudWwTklF3vTTVAHXeM/dizWMUSBzAlyUO
	Vw00+SACfKGklTBz8Rwp3H2yCG7FsnFkuQdZqFcHdIxYtF/RMTrSg+RBfs8b+6ZYU0go
	VF9IGd1x8qndg+NiK1vFoNhfzDEnqxugrK8/2nQXpQAwPJ2VSAHRViou3NBIG/9dM1dI
	A5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WbG4nOOtSYMSqEqxUFCXzJ5Wo240YB2vqLSizr4yxPM=;
	b=RoYjGvONw56veZO0l6+ORLmA4MsvzC/1ODKmQNNAAhgIbVkPmqT7DbdEb50QE4OrF+
	d6kUPdG9p8G+DNS4Z9+WkyBlQ8It5+/fdLcnJGDAg8nCiFL/G4UjHevsgoo47DiasTIh
	HY6/OlshyrVmFWtCtvZJBMoJVrvTixJJZ+EaHipYdpEeRr8//E2IFxAX1No8U4NltBAk
	F7TUelVShuur4sL3AYOCeMW+mGkWpkOGpxmWeADQwR+ZVuy0vD0Yg+vXlLmavy43//l5
	OLzuhJnJhUi1Vkgm0uGbA+rBRk8dr/VOHVLiMUzPAMxqGuQmMcDupJu+JQC8gf3eSLtW
	N6rA==
X-Gm-Message-State: AMCzsaWF+EgbOS96Qh0tGU1H1N+/eq7A6Yo0nxgGxQDYWMW0plH87Yhp
	2ht8p/90fZPGCcspygAB8lrH1AHJfTYvW7dK9N4=
X-Google-Smtp-Source: AOwi7QBnoMeLMDmmQjDh9FJr2jqPSNJHYWjb7sjPPH8waLm1cpqQ2jit8KLKzn80DuiQRmjRRSQVoyLhZVZN+6gZ5qU=
X-Received: by 10.98.2.200 with SMTP id 191mr2274525pfc.285.1507816660989;
	Thu, 12 Oct 2017 06:57:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Thu, 12 Oct 2017 06:57:10 -0700 (PDT)
In-Reply-To: <3f064a29-c6ce-11e8-ce96-69a6affa474d@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
	<c0a64a67f9b38870e57ad6b2870b56a4bec3ab3b.1507735448.git.alexander.kanavin@linux.intel.com>
	<CAMKF1srBmLrP=7suUdZEhRDUWzjYD3B6CMTpL8qtaZv6nVkJ5Q@mail.gmail.com>
	<3f064a29-c6ce-11e8-ce96-69a6affa474d@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Oct 2017 06:57:10 -0700
Message-ID: <CAMKF1sruM1-yPd-QZXw9astRqND1yqOz743urK8kBe7AfvPLiQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 26/50] webkitgtk: update to 2.18.0
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
X-List-Received-Date: Thu, 12 Oct 2017 13:57:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 12, 2017 at 5:55 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 10/12/2017 08:09 AM, Khem Raj wrote:
>>>
>>> +Upstream-Status: Inappropriate [needs to use musl-specific defines to be
>>> upstreamable]
>>
>>
>> I think using __GLIBC__ is sub optimal here. So this change should be
>> upstreamable.
>>
>>> +-#if OS(DARWIN) || ((OS(FREEBSD) || defined(__GLIBC__)) && (CPU(X86) ||
>>> CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
>>> ++#if OS(DARWIN) || ((OS(FREEBSD) || defined(__linux__)) && (CPU(X86) ||
>>> CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
>>
>>
>> We should probably use (OS(LINUX)  instead of defined(__linux__)
>> and this could be upstreamed too.
>>
>
> I'm not sure if LINUX or __linux___ is optimal either. Perhaps__GLIBC___ ||
> __musl___ would be better?
>

musl intentionally does not have a define to identify C library, since this has
historicslly made libc hide lot of trash under this carpet.
most of times people assume __GLIBC__ == linux which ofcourse it not true.

>
> I've changed the upstream-status to Pending in the branch.
>

OK


> Alex

