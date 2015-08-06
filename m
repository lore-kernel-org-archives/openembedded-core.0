Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 211E1734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 13:24:29 +0000 (UTC)
Received: by ykax123 with SMTP id x123so62145272yka.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 06:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=na6VmEniWj0oZxmopVgQZjARPyx3WJEk1A10aQaBKtg=;
	b=MbkJVXziY4JRNDuXgNpS8CU3uRoGAz0wsiWyqL/gE4rLJTUnWELoSiYVquvlLam9sv
	mrC/fVdn37W3L56KTHcc/8n8JvQKCb2NZTJwwAmEqkgq8w0cNZSsEekV6Rci6oCL4Qdj
	TM2FNAyk2WFQSPIqyz4vg9v2LMtHsd58vRSJaFYHP5iL8GVVPpmOm5JjpMuxw3YFcmPZ
	m8FX4yoBGEBddcPp8TC+DGDha+uji07Xkccntt2Swk9xxHxN1AgfgulhxuaZkkdMovyL
	fSgfEIV6y/xtKdQ2deHGTpQLgzxZnmKzV+YEg1aU9t5mktdC5jHj6/JBTdeFMi1INLSG
	/xUQ==
MIME-Version: 1.0
X-Received: by 10.170.134.210 with SMTP id a201mr1406415ykc.62.1438867141170; 
	Thu, 06 Aug 2015 06:19:01 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Thu, 6 Aug 2015 06:19:01 -0700 (PDT)
In-Reply-To: <55C30B7F.2050909@ni.com>
References: <1438674108-24258-1-git-send-email-adrian.ratiu@ni.com>
	<CADkTA4PEZCM151f7Z72jcr-4H3MQqusdPr9WkO-jwUxrufPsTw@mail.gmail.com>
	<OF2F3F95BE.08ECF07F-ONC2257E98.002DF696-C2257E98.002F92BC@ni.com>
	<CADkTA4POzofrpfDEp8_bRokSoPV+2pb_RimQ+PrrZ2guqfPGNw@mail.gmail.com>
	<55C30B7F.2050909@ni.com>
Date: Thu, 6 Aug 2015 09:19:01 -0400
Message-ID: <CADkTA4Mp_vF2uUdCSJ0TDVYapL-DuaLzHCvKsy6bLnytwAM76w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: do_configme: Add $TOOLCHAIN_OPTIONS to CFLAGS
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
X-List-Received-Date: Thu, 06 Aug 2015 13:24:30 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 6, 2015 at 3:23 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> On 05.08.2015 16:50, Bruce Ashfield wrote:
>>
>> On Wed, Aug 5, 2015 at 4:39 AM, Adrian Ratiu <adrian.ratiu@ni.com> wrote:
>>>
>>> Bruce Ashfield <bruce.ashfield@gmail.com> wrote on 05.08.2015 05:17:14:
>>>
>>>> On Tue, Aug 4, 2015 at 4:41 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>>>> wrote:
>>>>>
>>>>> The kernel configure step was broken by the sysroot poisoning in [1].
>>>>
>>>>
>>>> Can you be more precise here ? Configuration certainly works for me ..
>>>> and
>>>> has been working since last October.
>>>
>>>
>>> This works because it was fixed in linux-yocto.inc *after* the sysroot
>>> poisoning.
>>> I've mentioned this in the next line :) But this is not what this fix is
>>> for,
>>> this fix should have been done at the same time with adding
>>> $TOOLCHAIN_OPTIONS
>>> to $KERNEL_CC in linux-yocto.inc.
>>>
>>> This bug was missed because there is NO error reporting in
>>> yocto-kernel-tools
>>> merge_configs.sh and the build continues despite the error. I've sent a
>>> patch to
>>> fail loudly in case merge_configs.sh fails in yocto-kernel-tools. You
>>> know
>>> about
>>> it because you responded to that mail :) These issues are related.
>>
>>
>> right. And as you saw there .. I don't need that patch. So we might as
>> well
>> let this one sit as well.
>
>
> It's great if these issues were already fixed somehow different than how I
> proposed. Are those local changes pushed to a public branch yet? I would
> really like to test the new code.

The solution is similar in the end, I just came to adding extra error checking
via a different route (missing .cfg fragments not being reported and stopping
the build).

They are unfortunately back on my development machine, and I'm on
vacation at the moment. But I will be back near that equipment next
week!

Cheers,

Bruce

>
> P.S. Sorry for the html crap in my previous mail, I hope it's gone now.



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

