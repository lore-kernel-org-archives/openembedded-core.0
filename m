Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QquEH-0004OK-U6
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 23:52:53 +0200
Received: by ewy5 with SMTP id 5so308893ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 14:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=4MYLiUpolH7taLFy2sISv57NwN0S9YyIULTPXlcuOD0=;
	b=mgGWwKsCseSgkO6MFj6l+0de/grfpVhcB5Be8Jqa2ZNI6+qq2jeo4+rMPXENpYlXM5
	XxcOnsMznvhhfsuEFgzfcUT6bekdU7cOh1eG/j0vRJUdZmJ5Vg87swC1IdGkxQqa91k+
	cwetgybXRMlzhCOGy5ite6MBcysZ4RZckISqw=
MIME-Version: 1.0
Received: by 10.213.102.9 with SMTP id e9mr1692312ebo.91.1312926504294; Tue,
	09 Aug 2011 14:48:24 -0700 (PDT)
Received: by 10.213.114.20 with HTTP; Tue, 9 Aug 2011 14:48:24 -0700 (PDT)
In-Reply-To: <CA+T6QPmN5HC=HxscTzckcxpGjm7oEnvX4s0Y1Zu+TWJX5RfOvQ@mail.gmail.com>
References: <CAD=GYpYwTkfShO4KhzDfH=xpka3t9SDtqZaunsTN7vi5ESm3Zg@mail.gmail.com>
	<CA+T6QPmN5HC=HxscTzckcxpGjm7oEnvX4s0Y1Zu+TWJX5RfOvQ@mail.gmail.com>
Date: Tue, 9 Aug 2011 16:48:24 -0500
Message-ID: <CAD=GYpbX24u+Pc7d7OVHjCy_B52pzupexKz=dx40WkyrS3uk4w@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Kooi, Koen" <k-kooi@ti.com>, "Kridner, Jason" <jdk@ti.com>,
	steve@sakoman.com
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
X-List-Received-Date: Tue, 09 Aug 2011 21:52:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Jason,

Thanks,

On Tue, Aug 9, 2011 at 3:48 PM, Jason Kridner <jkridner@beagleboard.org> wr=
ote:
> Adding Steve...
>
> On Tue, Aug 9, 2011 at 4:19 PM, Joel A Fernandes <agnel.joel@gmail.com> w=
rote:
>> I am seeing some very erratic memory corruption issues all morning,
>> both with NFS and MMC cards. The traces are at the end of this email.
>>
>> I have narrowed down the issue to one of the 13 Sakoman patches:
>> =A0 =A0 =A0 =A0 =A0 =A0file://sakoman/0001-mmc-don-t-display-single-bloc=
k-read-console-messages.patch
>> \
>
> Safe.
>
>> =A0 =A0 =A0 =A0 =A0 =A0file://sakoman/0002-omap-Change-omap_device-activ=
ate-dectivate-latency-m.patch
>> \
>
> Safe.
>
>> =A0 =A0 =A0 =A0 =A0 =A0file://sakoman/0003-OMAP-DSS2-add-bootarg-for-sel=
ecting-svideo-or-compos.patch
>> \
>
> Not likely an issue.
>
>> =A0 =A0 =A0 =A0 =A0 =A0file://sakoman/0004-mtd-nand-Eliminate-noisey-unc=
orrectable-error-messag.patch
>> \
>
> Safe.
>
>> =A0 =A0 =A0 =A0 =A0 =A0file://sakoman/0005-video-add-timings-for-hd720.p=
atch \
>
> Highly unlikely to be an issue and very important for enabling
> displays. =A0Really needs to be pushed upstream.
>
>> =A0 =A0 =A0 =A0 =A0 =A0file://sakoman/0006-drivers-net-smsc911x-return-E=
NODEV-if-device-is-not-.patch
>> \
>
> Highly unlikely to be an issue.
>
>> =A0 =A0 =A0 =A0 =A0 =A0file://sakoman/0007-drivers-input-touchscreen-ads=
7846-return-ENODEV-if-d.patch
>> \
>
> Not likely an issue.
>
>> =A0 =A0 =A0 =A0 =A0 =A0file://sakoman/0008-Revert-omap2_mcspi-Flush-post=
ed-writes.patch \
>
> This one is a bit odd. =A0Not sure why the other ADS driver should be
> hurt by not having this one. =A0I'd look at excluding it.
>
>> =A0 =A0 =A0 =A0 =A0 =A0file://sakoman/0009-rtc-twl-Switch-to-using-threa=
ded-irq.patch \
>
> I'm not familiar with the impact or the arguments being passed. =A0If
> some upstream changes happened in this area, this one might be a bit
> dangerous.
>

This is it! Adding 0009 back causes the same irq problems to show up.
Do we need this patch for now?

[   13.945648] LR is at run_timer_softirq+0x18c/0x22c
[..]
[   14.091674] [<c0077744>] (run_timer_softirq+0x18c/0x22c) from
[<c0073064>] (__do_softirq+0x6c/0xf4)
[   14.101165] [<c0073064>] (__do_softirq+0x6c/0xf4) from [<c0073228>]
(irq_exit+0x40/0x8c)
[   14.109619] [<c0073228>] (irq_exit+0x40/0x8c) from [<c003c064>]
(asm_do_IRQ+0x64/0x84)
[   14.117919] [<c003c064>] (asm_do_IRQ+0x64/0x84) from [<c0041278>]
(__irq_svc+0x38/0xc0)
[   14.126281] Exception stack(0xc0655f40 to 0xc0655f88)
[   14.131591] 5f40: c065bd80 c067dea0 40000013 40000013 00000c0e
00000000 f3b00000 000039bd
[   14.140136] 5f60: 3dd059da 00000003 ffff70f5 ffff70f5 00000108
c0655f88 c0068718 c00915ac
[   14.148681] 5f80: 40000013 ffffffff
[   14.152343] [<c0041278>] (__irq_svc+0x38/0xc0) from [<c00915ac>]
(tick_nohz_stop_sched_tick+0x35c/0x3a4)
[   14.162261] [<c00915ac>] (tick_nohz_stop_sched_tick+0x35c/0x3a4)
from [<c00425e8>] (cpu_idle+0x1c/0xac)
[   14.172088] [<c00425e8>] (cpu_idle+0x1c/0xac) from [<c0008904>]
(start_kernel+0x290/0x2f0)
[   14.180755] [<c0008904>] (start_kernel+0x290/0x2f0) from
[<8000803c>] (0x8000803c)
[   14.188659] Code: 00000000 00000000 00000000 c37e0000 (e7f39999)
[   14.195648] ---[ end trace c21d9089cb6595cf ]---
[   14.200469] Kernel panic - not syncing: Fatal exception in interrupt


Thanks,
Joel


