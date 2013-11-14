Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 36CF66D747
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 16:18:10 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id jt11so2237241pbb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 08:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=roK2KlKKErv3SrsMzZBDNkyPBNwjWg4Tuexb/k3YvcY=;
	b=b5SeypO8EJR845zn/0gEkuvfHnjmN+SqkterYT1d2YJtpB7AALsaig2yUbB27ZYovz
	WwpSN+Jl5Fl6eX1iV+i1CG8hbXLK6spD6L3tjS9MdklBrQbEq7aRHu4TkRhrUKcKKX8c
	cwlwaCRpxTtQuwz7OhnifrDNvpJjKbAbK89zaH9lOUklTWHJ1/Qe+K1nWtWwdlnKqWIY
	3SKFJrEQORMqa9gHwDyqHEQkYnHZfUms/3LzHd4Uk7Enuo75ssBUfWjzrBJdorir+Nf+
	iiDTD5YgZKbhagrbkYwmQjDe6e3Y726uhYZ/S8S8hG0b6cFbk+3dA2T3ntloUjxabcT2
	To0A==
MIME-Version: 1.0
X-Received: by 10.66.161.138 with SMTP id xs10mr2296560pab.56.1384445892152;
	Thu, 14 Nov 2013 08:18:12 -0800 (PST)
Received: by 10.68.109.228 with HTTP; Thu, 14 Nov 2013 08:18:12 -0800 (PST)
In-Reply-To: <5284F5D1.4010004@linux.intel.com>
References: <1383312696-421-1-git-send-email-otavio@ossystems.com.br>
	<5283F507.7050607@linux.intel.com>
	<CAP9ODKotnjmFwd3SqG_=HDpDWXBDkuaJsqUerM_8BnT9mPU0GQ@mail.gmail.com>
	<CADkTA4M8GkRVnHr5bW-1=Ff2PSdsYaOo6ROisjZDybnNpom2OA@mail.gmail.com>
	<5284F5D1.4010004@linux.intel.com>
Date: Thu, 14 Nov 2013 11:18:12 -0500
Message-ID: <CADkTA4ObDkKgm+_-RG650m2TtugDh4tZ+OHyOateGSUvv9hmhQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] lttng-modules: Update revision to grab last bugfix releases
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
X-List-Received-Date: Thu, 14 Nov 2013 16:18:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 14, 2013 at 11:09 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 11/13/2013 07:08 PM, Bruce Ashfield wrote:
>>
>> On Wed, Nov 13, 2013 at 8:45 PM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>>>
>>> On Wed, Nov 13, 2013 at 7:54 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>>>
>>>> On 11/01/2013 06:31 AM, Otavio Salvador wrote:
>>>>>
>>>>>
>>>>> This updates lttng-modules for 2.3.2 and also includes a bugfix
>>>>> imported from 3.4 kernel. The changes included are:
>>>>>
>>>>> 6c26b01 Blacklist Linux kernels 3.10+
>>>>> b97d469 LTTng trace-clock: shrink kernel blacklist
>>>>> 7d40f8e Version 2.3.1
>>>>> 2aecb9b Blacklist kernels 3.10.13 and 3.11.2
>>>>> 4f1217f Version 2.3.2
>>>>> 92fff0c Import fix from LTSI: 3.4+ RT kernels use
>>>>> CONFIG_PREEMPT_RT_FULL
>>>>> 1874075 lttng-statedump-impl: Fix lttng_list_interrupts for empty
>>>>> implementation
>>>>>
>>>>
>>>> Otavio,
>>>>
>>>> Tried to build this locally and got the following failure with
>>>> genericx86
>>>> and master:
>>>>
>>>> |   CC [M]
>>>>
>>>> /srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/lttng-ring-buffer-client-discard.o
>>>> | In file included from
>>>>
>>>> /srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/lttng-tracer.h:37:0,
>>>> |                  from
>>>>
>>>> /srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/lttng-ring-buffer-client-discard.c:24:
>>>> |
>>>>
>>>> /srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/wrapper/trace-clock.h:40:2:
>>>> error: #error "Linux kernels 3.10 and 3.11 introduce a deadlock in the
>>>> timekeeping subsystem. Fixed by commit
>>>> 7bd36014460f793c19e7d6c94dab67b0afcfcb7f \"timekeeping: Fix HRTICK
>>>> related
>>>> deadlock from ntp lock changes\" in Linux."
>>>> |  #error "Linux kernels 3.10 and 3.11 introduce a deadlock in the
>>>> timekeeping subsystem. Fixed by commit
>>>> 7bd36014460f793c19e7d6c94dab67b0afcfcb7f \"timekeeping: Fix HRTICK
>>>> related
>>>> deadlock from ntp lock changes\" in Linux."
>>>> |   ^
>>>> | make[2]: ***
>>>>
>>>> [/srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/lttng-ring-buffer-client-discard.o]
>>>> Error 1
>>>> | make[1]: ***
>>>>
>>>> [_module_/srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git]
>>>> Error 2
>>>> | make[1]: Leaving directory
>>>> `/srv/ssd/sgw/builds/world/tmp/sysroots/genericx86/usr/src/kernel'
>>>> | make: *** [default] Error 2
>>>> | ERROR: oe_runmake failed
>>>>
>>>> So I am going to hold off on this patch set until you can resolve this.
>>>
>>>
>>> Yes; this is becase the linux-yocto seems to not have been updated to
>>>>
>>>> 3.10.13; so in fact it is failing to build to avoid people to
>>>
>>> trigger the deadlock.
>>>
>>> The change which introduces this in lttng-modules is:
>>>
>>>
>>> http://git.lttng.org/?p=lttng-modules.git;a=commit;h=2aecb9b1cbb63f6c524ad9195d8fd06299ef9296
>>>
>>> I can update this patch as 2.3.3 has been released and it includes the
>>> 3.12 fixes but please check when linux-yocto will be updated so we can
>>> fix it.
>>
>>
>> Saul: What board are you building ? I've had linux-yocto on 3.10.17
>> for over a week
>> now.
>
>
> As mentioned above this is for genericx86, so maybe not all the BSPs are
> updated yet.

Buried in the context, sorry about missing that.

Yes, I'm about to update the reference boards, but there's a install
error that I'm fixing first, but I'll have the series out by end of day.

Bruce

>
> Sau!
>
>
>>
>> The meta-yocto-bsps need a SRCREV bump, which I was just about to send
>> out, but the code has been in tree for some time yet, and all the qemu*
>> BSPs are already running at that revision.
>>
>> Bruce
>>
>>>
>>> Regards,
>>>
>>>
>>> --
>>> Otavio Salvador                             O.S. Systems
>>> http://www.ossystems.com.br        http://code.ossystems.com.br
>>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>
>>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

