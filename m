Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1QqufM-0005IH-60
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 00:20:52 +0200
Received: by vxj14 with SMTP id 14so450597vxj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 15:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=fmR5/Y5HPrWeEY9t8I6aIiKDRxrHD7zGigDKra7YAjU=;
	b=Qu1BpYXU9MTANVHjId9xA87OhwlxoCD6AbIiSL7ywbsUle+SHwrF6QW8KmazY0FXoR
	gFtt598cw73ZmWa0a3sBZTwzfBwqkP9n3W0YLNSvOhljsoMmPX4vzqMWIjvX2XdI7GI9
	qoV8GzP/7ycKOQ5eFdj6Q3HmZSPA51MPXph4w=
MIME-Version: 1.0
Received: by 10.52.33.67 with SMTP id p3mr2549365vdi.353.1312928182000; Tue,
	09 Aug 2011 15:16:22 -0700 (PDT)
Received: by 10.52.188.65 with HTTP; Tue, 9 Aug 2011 15:16:21 -0700 (PDT)
In-Reply-To: <CA+T6QPmgo-t+5D547ANO=O=nTs4um9Ga=aum3H61Dex4OJ+BqA@mail.gmail.com>
References: <CAD=GYpYwTkfShO4KhzDfH=xpka3t9SDtqZaunsTN7vi5ESm3Zg@mail.gmail.com>
	<CA+T6QPmN5HC=HxscTzckcxpGjm7oEnvX4s0Y1Zu+TWJX5RfOvQ@mail.gmail.com>
	<CAD=GYpbX24u+Pc7d7OVHjCy_B52pzupexKz=dx40WkyrS3uk4w@mail.gmail.com>
	<CA+T6QPmgo-t+5D547ANO=O=nTs4um9Ga=aum3H61Dex4OJ+BqA@mail.gmail.com>
Date: Tue, 9 Aug 2011 15:16:21 -0700
Message-ID: <CAGDS+nm38n=H-52URUvGL7tXqdPGiL-8uzSytadqDZMte_pcJA@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Kridner, Jason" <jdk@ti.com>, "Kooi, Koen" <k-kooi@ti.com>
Subject: Re: [meta-ti] Kernel 3.0 meta-ti recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Aug 2011 22:20:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 9, 2011 at 2:57 PM, Jason Kridner <jkridner@beagleboard.org> wr=
ote:
> On Tue, Aug 9, 2011 at 5:48 PM, Joel A Fernandes <agnel.joel@gmail.com> w=
rote:
>> Hi Jason,
>>
>> Thanks,
>>
>> On Tue, Aug 9, 2011 at 3:48 PM, Jason Kridner <jkridner@beagleboard.org>=
 wrote:
>>> Adding Steve...
>>>
>>> On Tue, Aug 9, 2011 at 4:19 PM, Joel A Fernandes <agnel.joel@gmail.com>=
 wrote:
>>>> I am seeing some very erratic memory corruption issues all morning,
>>>> both with NFS and MMC cards. The traces are at the end of this email.
>>>>
>>>> I have narrowed down the issue to one of the 13 Sakoman patches:
> ...
>>>> =A0 =A0 =A0 =A0 =A0 =A0file://sakoman/0009-rtc-twl-Switch-to-using-thr=
eaded-irq.patch \
>>>
>>> I'm not familiar with the impact or the arguments being passed. =A0If
>>> some upstream changes happened in this area, this one might be a bit
>>> dangerous.
>>>
>>
>> This is it! Adding 0009 back causes the same irq problems to show up.
>> Do we need this patch for now?

Interesting -- that patch has been queued for inclusion upstream and
I've been using it for a while with no issues.  I wonder what is
different in our setups.

Looking at linux-omap I see that a new version of the patch was
submitted on July 27:

[PATCH 1/2] rtc: twl: Use threaded IRQ, remove IRQ enable in interrupt hand=
ler
[PATCH 2/2] rtc: twl: Fix registration vs. init order

Steve

>
> I think you can leave it out for now. =A0Are all the other ones back in?
> =A0Will you be sharing another test image?
>
>>
>> [ =A0 13.945648] LR is at run_timer_softirq+0x18c/0x22c
>> [..]
>> [ =A0 14.091674] [<c0077744>] (run_timer_softirq+0x18c/0x22c) from
>> [<c0073064>] (__do_softirq+0x6c/0xf4)
>> [ =A0 14.101165] [<c0073064>] (__do_softirq+0x6c/0xf4) from [<c0073228>]
>> (irq_exit+0x40/0x8c)
>> [ =A0 14.109619] [<c0073228>] (irq_exit+0x40/0x8c) from [<c003c064>]
>> (asm_do_IRQ+0x64/0x84)
>> [ =A0 14.117919] [<c003c064>] (asm_do_IRQ+0x64/0x84) from [<c0041278>]
>> (__irq_svc+0x38/0xc0)
>> [ =A0 14.126281] Exception stack(0xc0655f40 to 0xc0655f88)
>> [ =A0 14.131591] 5f40: c065bd80 c067dea0 40000013 40000013 00000c0e
>> 00000000 f3b00000 000039bd
>> [ =A0 14.140136] 5f60: 3dd059da 00000003 ffff70f5 ffff70f5 00000108
>> c0655f88 c0068718 c00915ac
>> [ =A0 14.148681] 5f80: 40000013 ffffffff
>> [ =A0 14.152343] [<c0041278>] (__irq_svc+0x38/0xc0) from [<c00915ac>]
>> (tick_nohz_stop_sched_tick+0x35c/0x3a4)
>> [ =A0 14.162261] [<c00915ac>] (tick_nohz_stop_sched_tick+0x35c/0x3a4)
>> from [<c00425e8>] (cpu_idle+0x1c/0xac)
>> [ =A0 14.172088] [<c00425e8>] (cpu_idle+0x1c/0xac) from [<c0008904>]
>> (start_kernel+0x290/0x2f0)
>> [ =A0 14.180755] [<c0008904>] (start_kernel+0x290/0x2f0) from
>> [<8000803c>] (0x8000803c)
>> [ =A0 14.188659] Code: 00000000 00000000 00000000 c37e0000 (e7f39999)
>> [ =A0 14.195648] ---[ end trace c21d9089cb6595cf ]---
>> [ =A0 14.200469] Kernel panic - not syncing: Fatal exception in interrup=
t
>>
>>
>> Thanks,
>> Joel
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


