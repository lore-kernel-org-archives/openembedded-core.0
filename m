Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 46FF46D2FB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 03:08:54 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rq2so1360086pbb.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 19:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0V70LpOWZQdjBSPui0YIbiH8xmKh/FS34ELMgnqKxKQ=;
	b=cOKc1IJLvhmfMtRfWY/ld90pyMS/YTJTlTY6VRUi7jH9lx7rNy0OTufVfvswN3SqJP
	JHcnaVGRc8XeCfkG1DuJqAUduUjKoWvUEYQkmXQI0e4RB39Se9gPpb7FzEN7lAisLD6e
	qcHwRYEppI65YkLNC0unp25cgjHN98nZIJOCzltUmxxjFzjY9y0vAfmVfWEBggsQVSNz
	8eRW8QjDPKRp+8W3ijoHpPiLiDmk3lKbK1Sw1KI5UEg0oVN2UxngACMcMbmAEm3PgOVY
	EfsOJQ/uqO91ArT9jqPzIbr/wJUnBg39hZ5ELULrXxsblOeUBWt4s8uA9yFy3b8BFy1O
	uvjQ==
MIME-Version: 1.0
X-Received: by 10.66.129.141 with SMTP id nw13mr12325409pab.167.1384398535777; 
	Wed, 13 Nov 2013 19:08:55 -0800 (PST)
Received: by 10.68.109.228 with HTTP; Wed, 13 Nov 2013 19:08:55 -0800 (PST)
In-Reply-To: <CAP9ODKotnjmFwd3SqG_=HDpDWXBDkuaJsqUerM_8BnT9mPU0GQ@mail.gmail.com>
References: <1383312696-421-1-git-send-email-otavio@ossystems.com.br>
	<5283F507.7050607@linux.intel.com>
	<CAP9ODKotnjmFwd3SqG_=HDpDWXBDkuaJsqUerM_8BnT9mPU0GQ@mail.gmail.com>
Date: Wed, 13 Nov 2013 22:08:55 -0500
Message-ID: <CADkTA4M8GkRVnHr5bW-1=Ff2PSdsYaOo6ROisjZDybnNpom2OA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 14 Nov 2013 03:08:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 13, 2013 at 8:45 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Wed, Nov 13, 2013 at 7:54 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> On 11/01/2013 06:31 AM, Otavio Salvador wrote:
>>>
>>> This updates lttng-modules for 2.3.2 and also includes a bugfix
>>> imported from 3.4 kernel. The changes included are:
>>>
>>> 6c26b01 Blacklist Linux kernels 3.10+
>>> b97d469 LTTng trace-clock: shrink kernel blacklist
>>> 7d40f8e Version 2.3.1
>>> 2aecb9b Blacklist kernels 3.10.13 and 3.11.2
>>> 4f1217f Version 2.3.2
>>> 92fff0c Import fix from LTSI: 3.4+ RT kernels use CONFIG_PREEMPT_RT_FULL
>>> 1874075 lttng-statedump-impl: Fix lttng_list_interrupts for empty
>>> implementation
>>>
>>
>> Otavio,
>>
>> Tried to build this locally and got the following failure with genericx86
>> and master:
>>
>> |   CC [M]
>> /srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/lttng-ring-buffer-client-discard.o
>> | In file included from
>> /srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/lttng-tracer.h:37:0,
>> |                  from
>> /srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/lttng-ring-buffer-client-discard.c:24:
>> |
>> /srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/wrapper/trace-clock.h:40:2:
>> error: #error "Linux kernels 3.10 and 3.11 introduce a deadlock in the
>> timekeeping subsystem. Fixed by commit
>> 7bd36014460f793c19e7d6c94dab67b0afcfcb7f \"timekeeping: Fix HRTICK related
>> deadlock from ntp lock changes\" in Linux."
>> |  #error "Linux kernels 3.10 and 3.11 introduce a deadlock in the
>> timekeeping subsystem. Fixed by commit
>> 7bd36014460f793c19e7d6c94dab67b0afcfcb7f \"timekeeping: Fix HRTICK related
>> deadlock from ntp lock changes\" in Linux."
>> |   ^
>> | make[2]: ***
>> [/srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/lttng-ring-buffer-client-discard.o]
>> Error 1
>> | make[1]: ***
>> [_module_/srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git]
>> Error 2
>> | make[1]: Leaving directory
>> `/srv/ssd/sgw/builds/world/tmp/sysroots/genericx86/usr/src/kernel'
>> | make: *** [default] Error 2
>> | ERROR: oe_runmake failed
>>
>> So I am going to hold off on this patch set until you can resolve this.
>
> Yes; this is becase the linux-yocto seems to not have been updated to
>> 3.10.13; so in fact it is failing to build to avoid people to
> trigger the deadlock.
>
> The change which introduces this in lttng-modules is:
>
> http://git.lttng.org/?p=lttng-modules.git;a=commit;h=2aecb9b1cbb63f6c524ad9195d8fd06299ef9296
>
> I can update this patch as 2.3.3 has been released and it includes the
> 3.12 fixes but please check when linux-yocto will be updated so we can
> fix it.

Saul: What board are you building ? I've had linux-yocto on 3.10.17
for over a week
now.

The meta-yocto-bsps need a SRCREV bump, which I was just about to send
out, but the code has been in tree for some time yet, and all the qemu*
BSPs are already running at that revision.

Bruce

>
> Regards,
>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

