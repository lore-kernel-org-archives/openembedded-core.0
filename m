Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id EA7696D87A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 01:45:53 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id k1so1520927oag.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 17:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=1sPHPW8iPU5F60aE8r3yXNIfyalX0LpZkxwDx3Z2Z2Q=;
	b=aAi3euqIlN7WNPQMfhbIUGZKtCMJuvasjCG1eU9N3l43ZiBgY5wxGUdZ7MAtfIRDcD
	2qJgpTxIECmaEeOZD/OBWIwoNWkr20QX1szNTlGBlTrk8CicJNxfoewNlPQtSeoMD96Z
	ygApp1jJr3BaOrc7geEnXDME8kU+78ij21EDgdjfXEEmMFbyvazxXjGE0BJ+Y5MQnZnb
	W2++fUPTwujb9LHh4f0DhSu3PjdsTfaMrgTK1ceeTQ89MKFqKhZ4xHOXvK1rJINLRA+I
	gCSt88k+fyqJ+aSAycrIlJnExM4Hbbsohu0uzKBUb2khcq5MFizBfbByuvo5pzuTZBf8
	z/fQ==
MIME-Version: 1.0
X-Received: by 10.60.60.71 with SMTP id f7mr4951194oer.82.1384393555101; Wed,
	13 Nov 2013 17:45:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 13 Nov 2013 17:45:54 -0800 (PST)
In-Reply-To: <5283F507.7050607@linux.intel.com>
References: <1383312696-421-1-git-send-email-otavio@ossystems.com.br>
	<5283F507.7050607@linux.intel.com>
Date: Wed, 13 Nov 2013 23:45:54 -0200
X-Google-Sender-Auth: 27GCtWMulO9mSPtPMldX61ER2ao
Message-ID: <CAP9ODKotnjmFwd3SqG_=HDpDWXBDkuaJsqUerM_8BnT9mPU0GQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
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
X-List-Received-Date: Thu, 14 Nov 2013 01:45:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 13, 2013 at 7:54 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 11/01/2013 06:31 AM, Otavio Salvador wrote:
>>
>> This updates lttng-modules for 2.3.2 and also includes a bugfix
>> imported from 3.4 kernel. The changes included are:
>>
>> 6c26b01 Blacklist Linux kernels 3.10+
>> b97d469 LTTng trace-clock: shrink kernel blacklist
>> 7d40f8e Version 2.3.1
>> 2aecb9b Blacklist kernels 3.10.13 and 3.11.2
>> 4f1217f Version 2.3.2
>> 92fff0c Import fix from LTSI: 3.4+ RT kernels use CONFIG_PREEMPT_RT_FULL
>> 1874075 lttng-statedump-impl: Fix lttng_list_interrupts for empty
>> implementation
>>
>
> Otavio,
>
> Tried to build this locally and got the following failure with genericx86
> and master:
>
> |   CC [M]
> /srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/lttng-ring-buffer-client-discard.o
> | In file included from
> /srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/lttng-tracer.h:37:0,
> |                  from
> /srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/lttng-ring-buffer-client-discard.c:24:
> |
> /srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/wrapper/trace-clock.h:40:2:
> error: #error "Linux kernels 3.10 and 3.11 introduce a deadlock in the
> timekeeping subsystem. Fixed by commit
> 7bd36014460f793c19e7d6c94dab67b0afcfcb7f \"timekeeping: Fix HRTICK related
> deadlock from ntp lock changes\" in Linux."
> |  #error "Linux kernels 3.10 and 3.11 introduce a deadlock in the
> timekeeping subsystem. Fixed by commit
> 7bd36014460f793c19e7d6c94dab67b0afcfcb7f \"timekeeping: Fix HRTICK related
> deadlock from ntp lock changes\" in Linux."
> |   ^
> | make[2]: ***
> [/srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/lttng-ring-buffer-client-discard.o]
> Error 1
> | make[1]: ***
> [_module_/srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git]
> Error 2
> | make[1]: Leaving directory
> `/srv/ssd/sgw/builds/world/tmp/sysroots/genericx86/usr/src/kernel'
> | make: *** [default] Error 2
> | ERROR: oe_runmake failed
>
> So I am going to hold off on this patch set until you can resolve this.

Yes; this is becase the linux-yocto seems to not have been updated to
> 3.10.13; so in fact it is failing to build to avoid people to
trigger the deadlock.

The change which introduces this in lttng-modules is:

http://git.lttng.org/?p=lttng-modules.git;a=commit;h=2aecb9b1cbb63f6c524ad9195d8fd06299ef9296

I can update this patch as 2.3.3 has been released and it includes the
3.12 fixes but please check when linux-yocto will be updated so we can
fix it.

Regards,


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

