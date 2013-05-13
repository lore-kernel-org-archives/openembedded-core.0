Received: from mail-lb0-f172.google.com ([209.85.217.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UbyNg-0001K4-5s
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 21:26:02 +0200
Received: by mail-lb0-f172.google.com with SMTP id y6so6796498lbh.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 12:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=oaSE1u/XKKJYpDpEiz9HoOynBN5TDbXB4uYI4ALGZFM=;
	b=K7OYFO4Dj4TCUA1vkyQpGok8LhjUu9bd3mkuGnRcd729sWWPlgrglYXfBCXJuNXnOW
	TJwdF3AHE7qnjUYADN1B6ewdQVRPKrEDyq5fQqSnPlkcm5g4M98wjpBv3uFMgwVL2ORY
	p2zvKqsq4qTuNySOlsGaGygI9NFaEpg0W6hSbSZTuheLYRY3bIxIJ/M/0gqMsnd1gRmi
	lXNrJETWUZDv5HXBPtfxRpkMusDaJWMkAchMSASvIn/KS6dgNKYB7jPeaSHOx5doO9oY
	83gjqjmPaIBF8ZPqTOTRsaLBt0e1wygzhcW0cafhebr3tAcK+IqjaCNBss2LhUDpGs7L
	HrLQ==
MIME-Version: 1.0
X-Received: by 10.112.159.136 with SMTP id xc8mr13418719lbb.57.1368472066074; 
	Mon, 13 May 2013 12:07:46 -0700 (PDT)
Received: by 10.112.234.166 with HTTP; Mon, 13 May 2013 12:07:45 -0700 (PDT)
In-Reply-To: <CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
	<203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
	<CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
Date: Mon, 13 May 2013 15:07:45 -0400
Message-ID: <CADkTA4PzaR2ERLBArRSPxpX5U=NtXfG4_2NBBymMwmONZQSV6Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 19:26:07 -0000
X-List-Received-Date: Mon, 13 May 2013 19:26:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 13, 2013 at 2:53 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> On Mon, May 13, 2013 at 2:33 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On May 13, 2013, at 9:45 AM, Trevor Woerner <twoerner@gmail.com> wrote:
>> try  runqemu qemumips64 bootparams="root=/dev/sda"
>>
>> does that boot ?
>
> It gets a little further but doesn't succeed. I have now tried booting a
> number of
> times using various combinations of "serial" and "bootparams". Currently I'm
> using:
>
>     $ runqemu qemumips64 serial bootparams="root=/dev/sda probe_mask=0x3f"
>
> How far the boot gets seems random, but sometimes I'll get the following
> panic:
>
>
> [...snip...]
> Creating 3 MTD partitions on "physmap-flash.0":
> 0x000000000000-0x000000100000 : "YAMON"
> 0x000000100000-0x0000003e0000 : "User FS"
> 0x0000003e0000-0x000000400000 : "Board Config"
> pcnet32: pcnet32.c:v1.35 21.Apr.2008 tsbogend@alpha.franken.de
> PCI: Enabling device 0000:00:0b.0 (0000 -> 0003)
> pcnet32: PCnet/PCI II 79C970A at 0x1020, 52:54:00:12:34:56 assigned IRQ 10
> pcnet32: eth0: registered as PCnet/PCI II 79C970A
> pcnet32: 1 cards_found
> ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> serio: i8042 KBD port at 0x60,0x64 irq 1
> serio: i8042 AUX port at 0x60,0x64 irq 12
> mousedev: PS/2 mouse device common for all mice
> usbcore: registered new interface driver wacom
> input: AT Raw Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
> md: linear personality registered for level -1
> md: raid0 personality registered for level 0
> md: raid1 personality registered for level 1
> input: ImExPS/2 Generic Explorer Mouse as
> /devices/platform/i8042/serio1/input/input1
> md: raid10 personality registered for level 10
> md: multipath personality registered for level -4
> md: faulty personality registered for level -5
> device-mapper: ioctl: 4.22.0-ioctl (2011-10-19) initialised:
> dm-devel@redhat.com
> usbcore: registered new interface driver usbhid
> usbhid: USB HID core driver
> Reserved instruction in kernel code[#1]:
> Cpu 0
> $ 0   : 0000000000000000 ffffffff80968790 0000000000000001 0000000000000000
> $ 4   : 0000000000000001 ffffffff80850000 ffffffffffffffff ffffffffffffffff
> $ 8   : 0000000000000000 9000000010000010 0000000000000000 0000000000000000
> $12   : 0000000000000000 0000000000000488 000000000000000f 0000000000000007
> $16   : 0000000000000006 0000000000000001 ffffffff808f0000 0000000000000000
> $20   : ffffffff809b0000 ffffffff808e0000 000000000000008b ffffffff809b0000
> $24   : 0000000000000000 0000000000000000
> $28   : 9800000007c80000 9800000007c83cd0 9800000007c83cd0 ffffffff80968790
> Hi    : 0000000000000000
> Lo    : 0000000000000000
> epc   : ffffffff80635910 reset_counters+0x60/0x90
>     Not tainted
> ra    : ffffffff80968790 mipsxx_init+0x1d4/0x2d8
> Status: 1400a4e2    KX SX UX KERNEL EXL
> Cause : 00800028
> PrId  : 000182a0 (MIPS 20Kc)
> Modules linked in:
> Process swapper (pid: 1, threadinfo=9800000007c80000, task=9800000007c38000,
> tls=0000000000000000)
> Stack : 9800000007c83ce0 9800000007c83ce0 000000000000008b ffffffff809b0000
>         9800000007c83d00 0000000000000006 ffffffff80a778a0 ffffffff80936930
>         9800000007c83d20 ffffffff80968528 ffffffff80930000 0000000000000000
>         ffffffffffffffff 0000000000000006 ffffffff80a70000 ffffffff80a70000
>         9800000007c83d60 ffffffff809683ec 9800000007c83d70 0000000000000006
>         ffffffff809b0000 ffffffff809683bc 9800000007c83d90 ffffffff80100530
>         ffffffff809b0000 0000000000000006 0000000000000030 ffffffff809b0000
>         ffffffff809b1578 ffffffff8097d960 9800000007c83dd0 ffffffff80948c98
>         0000000000000000 0000000000000000 0000000000000000 0000000000000000
>         0000000000000000 0000000000000000 0000000000000000 0000000000000000
>         ...
> Call Trace:
> [<ffffffff80635910>] reset_counters+0x60/0x90
> [<ffffffff80968790>] mipsxx_init+0x1d4/0x2d8
> [<ffffffff80968528>] oprofile_arch_init+0x84/0x118
> [<ffffffff809683ec>] oprofile_init+0x30/0xb8
> [<ffffffff80100530>] do_one_initcall+0x120/0x1a0
> [<ffffffff80948c98>] kernel_init+0x194/0x258
> [<ffffffff80103ffc>] kernel_thread_helper+0x24/0x30
>
>
> Code: 4080c802  4080c803  4080c800 <4080c801> 03c0e82d  dfbe0008  03e00008
> 67bd0010  00000000
> ---[ end trace 340dd7de1cdea432 ]---
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

This has been fixed multiple times. Looks like the wrong kernel SRCREV was
used.

qemumips definitely boots here, otherwise, we wouldn't have added the
compatibility
and sent the request.

I'm doing a systemd build at the moment and will have more info tomorrow.

Bruce

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


