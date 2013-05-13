Received: from mail-wg0-f48.google.com ([74.125.82.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1Uby9k-0008I1-K8
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 21:11:33 +0200
Received: by mail-wg0-f48.google.com with SMTP id f11so6698659wgh.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 11:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=0ASBy2sw2qpc659VADBa0EFcLb33AP2prn8FQ7th6sk=;
	b=bOuSHhtH5y3PXK/3WHA3QiMSAfMFEfARF7e/QXNG22aGr9lJcxYBRTaX8nFQDPOUF1
	M7LgKCwU9dq5Pm2YrNbwxBw6aVczUsAKd+lvOA/T6S56TlTdTikPd//QYy7oQeitZVlx
	bPb5jsbsLtw3UF9b+nC1hjWYYHQSiAasYpBOlbSKb7aCB8T3/Gf0C+oqCdZUWb11XJpQ
	fGM6QuUG+Xvw3qN3LN/bYPkGN4VkjuQ+TX88IRCSSpeErIOpjg6jUVkgQU2jdqPHd6Ei
	mpkcH0tfQwpIc6e8FyVa3hsI2xJYx+mOCjohgY8cAdfHvPVwOUeFY/MIiMzVj02LAbrH
	eplQ==
MIME-Version: 1.0
X-Received: by 10.180.39.137 with SMTP id p9mr11161271wik.27.1368471202105;
	Mon, 13 May 2013 11:53:22 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Mon, 13 May 2013 11:53:22 -0700 (PDT)
In-Reply-To: <203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
	<203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
Date: Mon, 13 May 2013 14:53:22 -0400
Message-ID: <CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 13 May 2013 19:11:33 -0000
Content-Type: multipart/alternative; boundary=001a11c36572e3151604dc9e0764

--001a11c36572e3151604dc9e0764
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 13, 2013 at 2:33 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On May 13, 2013, at 9:45 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> try  runqemu qemumips64 bootparams="root=/dev/sda"
>
> does that boot ?

It gets a little further but doesn't succeed. I have now tried booting a
number of
times using various combinations of "serial" and "bootparams". Currently I'm
using:

    $ runqemu qemumips64 serial bootparams="root=/dev/sda probe_mask=0x3f"

How far the boot gets seems random, but sometimes I'll get the following
panic:


[...snip...]
Creating 3 MTD partitions on "physmap-flash.0":
0x000000000000-0x000000100000 : "YAMON"
0x000000100000-0x0000003e0000 : "User FS"
0x0000003e0000-0x000000400000 : "Board Config"
pcnet32: pcnet32.c:v1.35 21.Apr.2008 tsbogend@alpha.franken.de
PCI: Enabling device 0000:00:0b.0 (0000 -> 0003)
pcnet32: PCnet/PCI II 79C970A at 0x1020, 52:54:00:12:34:56 assigned IRQ 10
pcnet32: eth0: registered as PCnet/PCI II 79C970A
pcnet32: 1 cards_found
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
serio: i8042 KBD port at 0x60,0x64 irq 1
serio: i8042 AUX port at 0x60,0x64 irq 12
mousedev: PS/2 mouse device common for all mice
usbcore: registered new interface driver wacom
input: AT Raw Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
md: linear personality registered for level -1
md: raid0 personality registered for level 0
md: raid1 personality registered for level 1
input: ImExPS/2 Generic Explorer Mouse as
/devices/platform/i8042/serio1/input/input1
md: raid10 personality registered for level 10
md: multipath personality registered for level -4
md: faulty personality registered for level -5
device-mapper: ioctl: 4.22.0-ioctl (2011-10-19) initialised:
dm-devel@redhat.com
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
Reserved instruction in kernel code[#1]:
Cpu 0
$ 0   : 0000000000000000 ffffffff80968790 0000000000000001 0000000000000000
$ 4   : 0000000000000001 ffffffff80850000 ffffffffffffffff ffffffffffffffff
$ 8   : 0000000000000000 9000000010000010 0000000000000000 0000000000000000
$12   : 0000000000000000 0000000000000488 000000000000000f 0000000000000007
$16   : 0000000000000006 0000000000000001 ffffffff808f0000 0000000000000000
$20   : ffffffff809b0000 ffffffff808e0000 000000000000008b ffffffff809b0000
$24   : 0000000000000000 0000000000000000
$28   : 9800000007c80000 9800000007c83cd0 9800000007c83cd0 ffffffff80968790
Hi    : 0000000000000000
Lo    : 0000000000000000
epc   : ffffffff80635910 reset_counters+0x60/0x90
    Not tainted
ra    : ffffffff80968790 mipsxx_init+0x1d4/0x2d8
Status: 1400a4e2    KX SX UX KERNEL EXL
Cause : 00800028
PrId  : 000182a0 (MIPS 20Kc)
Modules linked in:
Process swapper (pid: 1, threadinfo=9800000007c80000,
task=9800000007c38000, tls=0000000000000000)
Stack : 9800000007c83ce0 9800000007c83ce0 000000000000008b ffffffff809b0000
        9800000007c83d00 0000000000000006 ffffffff80a778a0 ffffffff80936930
        9800000007c83d20 ffffffff80968528 ffffffff80930000 0000000000000000
        ffffffffffffffff 0000000000000006 ffffffff80a70000 ffffffff80a70000
        9800000007c83d60 ffffffff809683ec 9800000007c83d70 0000000000000006
        ffffffff809b0000 ffffffff809683bc 9800000007c83d90 ffffffff80100530
        ffffffff809b0000 0000000000000006 0000000000000030 ffffffff809b0000
        ffffffff809b1578 ffffffff8097d960 9800000007c83dd0 ffffffff80948c98
        0000000000000000 0000000000000000 0000000000000000 0000000000000000
        0000000000000000 0000000000000000 0000000000000000 0000000000000000
        ...
Call Trace:
[<ffffffff80635910>] reset_counters+0x60/0x90
[<ffffffff80968790>] mipsxx_init+0x1d4/0x2d8
[<ffffffff80968528>] oprofile_arch_init+0x84/0x118
[<ffffffff809683ec>] oprofile_init+0x30/0xb8
[<ffffffff80100530>] do_one_initcall+0x120/0x1a0
[<ffffffff80948c98>] kernel_init+0x194/0x258
[<ffffffff80103ffc>] kernel_thread_helper+0x24/0x30


Code: 4080c802  4080c803  4080c800 <4080c801> 03c0e82d  dfbe0008  03e00008
 67bd0010  00000000
---[ end trace 340dd7de1cdea432 ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

--001a11c36572e3151604dc9e0764
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Mon, May 13, 2013 at 2:33 PM, Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>&gt; On May =
13, 2013, at 9:45 AM, Trevor Woerner &lt;<a href=3D"mailto:twoerner@gmail.c=
om">twoerner@gmail.com</a>&gt; wrote:<br>
&gt; try =A0runqemu qemumips64 bootparams=3D&quot;root=3D/dev/sda&quot;<br>=
&gt;<br>&gt; does that boot ?<br><br><div>It gets a little further but does=
n&#39;t succeed. I have now tried booting a number of</div><div>times using=
 various combinations of &quot;serial&quot; and &quot;bootparams&quot;. Cur=
rently I&#39;m</div>
<div>using:</div><div><br></div><div>=A0 =A0 $=A0runqemu qemumips64 serial =
bootparams=3D&quot;root=3D/dev/sda probe_mask=3D0x3f&quot;</div><div><br></=
div><div>How far the boot gets seems random, but sometimes I&#39;ll get the=
 following panic:</div>
<div><br></div><div style><br></div><div style>[...snip...]</div><div><div>=
Creating 3 MTD partitions on &quot;physmap-flash.0&quot;:</div><div>0x00000=
0000000-0x000000100000 : &quot;YAMON&quot;</div><div>0x000000100000-0x00000=
03e0000 : &quot;User FS&quot;</div>
<div>0x0000003e0000-0x000000400000 : &quot;Board Config&quot;</div><div>pcn=
et32: pcnet32.c:v1.35 21.Apr.2008 <a href=3D"mailto:tsbogend@alpha.franken.=
de">tsbogend@alpha.franken.de</a></div><div>PCI: Enabling device 0000:00:0b=
.0 (0000 -&gt; 0003)</div>
<div>pcnet32: PCnet/PCI II 79C970A at 0x1020, 52:54:00:12:34:56 assigned IR=
Q 10</div><div>pcnet32: eth0: registered as PCnet/PCI II 79C970A</div><div>=
pcnet32: 1 cards_found</div><div>ohci_hcd: USB 1.1 &#39;Open&#39; Host Cont=
roller (OHCI) Driver</div>
<div>serio: i8042 KBD port at 0x60,0x64 irq 1</div><div>serio: i8042 AUX po=
rt at 0x60,0x64 irq 12</div><div>mousedev: PS/2 mouse device common for all=
 mice</div><div>usbcore: registered new interface driver wacom</div><div>
input: AT Raw Set 2 keyboard as /devices/platform/i8042/serio0/input/input0=
</div><div>md: linear personality registered for level -1</div><div>md: rai=
d0 personality registered for level 0</div><div>md: raid1 personality regis=
tered for level 1</div>
<div>input: ImExPS/2 Generic Explorer Mouse as /devices/platform/i8042/seri=
o1/input/input1</div><div>md: raid10 personality registered for level 10</d=
iv><div>md: multipath personality registered for level -4</div><div>md: fau=
lty personality registered for level -5</div>
<div>device-mapper: ioctl: 4.22.0-ioctl (2011-10-19) initialised: <a href=
=3D"mailto:dm-devel@redhat.com">dm-devel@redhat.com</a></div><div>usbcore: =
registered new interface driver usbhid</div><div>usbhid: USB HID core drive=
r</div>
<div>Reserved instruction in kernel code[#1]:</div><div>Cpu 0</div><div>$ 0=
 =A0 : 0000000000000000 ffffffff80968790 0000000000000001 0000000000000000<=
/div><div>$ 4 =A0 : 0000000000000001 ffffffff80850000 ffffffffffffffff ffff=
ffffffffffff</div>
<div>$ 8 =A0 : 0000000000000000 9000000010000010 0000000000000000 000000000=
0000000</div><div>$12 =A0 : 0000000000000000 0000000000000488 0000000000000=
00f 0000000000000007</div><div>$16 =A0 : 0000000000000006 0000000000000001 =
ffffffff808f0000 0000000000000000</div>
<div>$20 =A0 : ffffffff809b0000 ffffffff808e0000 000000000000008b ffffffff8=
09b0000</div><div>$24 =A0 : 0000000000000000 0000000000000000 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div><div>$28 =A0 :=
 9800000007c80000 9800000007c83cd0 9800000007c83cd0 ffffffff80968790</div>
<div>Hi =A0 =A0: 0000000000000000</div><div>Lo =A0 =A0: 0000000000000000</d=
iv><div>epc =A0 : ffffffff80635910 reset_counters+0x60/0x90</div><div>=A0 =
=A0 Not tainted</div><div>ra =A0 =A0: ffffffff80968790 mipsxx_init+0x1d4/0x=
2d8</div><div>Status: 1400a4e2 =A0 =A0KX SX UX KERNEL EXL=A0</div>
<div>Cause : 00800028</div><div>PrId =A0: 000182a0 (MIPS 20Kc)</div><div>Mo=
dules linked in:</div><div>Process swapper (pid: 1, threadinfo=3D9800000007=
c80000, task=3D9800000007c38000, tls=3D0000000000000000)</div><div>Stack : =
9800000007c83ce0 9800000007c83ce0 000000000000008b ffffffff809b0000</div>
<div>=A0 =A0 =A0 =A0 9800000007c83d00 0000000000000006 ffffffff80a778a0 fff=
fffff80936930</div><div>=A0 =A0 =A0 =A0 9800000007c83d20 ffffffff80968528 f=
fffffff80930000 0000000000000000</div><div>=A0 =A0 =A0 =A0 ffffffffffffffff=
 0000000000000006 ffffffff80a70000 ffffffff80a70000</div>
<div>=A0 =A0 =A0 =A0 9800000007c83d60 ffffffff809683ec 9800000007c83d70 000=
0000000000006</div><div>=A0 =A0 =A0 =A0 ffffffff809b0000 ffffffff809683bc 9=
800000007c83d90 ffffffff80100530</div><div>=A0 =A0 =A0 =A0 ffffffff809b0000=
 0000000000000006 0000000000000030 ffffffff809b0000</div>
<div>=A0 =A0 =A0 =A0 ffffffff809b1578 ffffffff8097d960 9800000007c83dd0 fff=
fffff80948c98</div><div>=A0 =A0 =A0 =A0 0000000000000000 0000000000000000 0=
000000000000000 0000000000000000</div><div>=A0 =A0 =A0 =A0 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000</div>
<div>=A0 =A0 =A0 =A0 ...</div><div>Call Trace:</div><div>[&lt;ffffffff80635=
910&gt;] reset_counters+0x60/0x90</div><div>[&lt;ffffffff80968790&gt;] mips=
xx_init+0x1d4/0x2d8</div><div>[&lt;ffffffff80968528&gt;] oprofile_arch_init=
+0x84/0x118</div>
<div>[&lt;ffffffff809683ec&gt;] oprofile_init+0x30/0xb8</div><div>[&lt;ffff=
ffff80100530&gt;] do_one_initcall+0x120/0x1a0</div><div>[&lt;ffffffff80948c=
98&gt;] kernel_init+0x194/0x258</div><div>[&lt;ffffffff80103ffc&gt;] kernel=
_thread_helper+0x24/0x30</div>
<div><br></div><div><br></div><div>Code: 4080c802 =A04080c803 =A04080c800 &=
lt;4080c801&gt; 03c0e82d =A0dfbe0008 =A003e00008 =A067bd0010 =A000000000=A0=
</div><div>---[ end trace 340dd7de1cdea432 ]---</div><div>Kernel panic - no=
t syncing: Attempted to kill init! exitcode=3D0x0000000b</div>
</div></div>

--001a11c36572e3151604dc9e0764--
