Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8AE1E74551
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 23:11:27 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id x12so6326563wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 16:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UrgaFIOSdIG0xKGzaF6Sjv7YjfHgjcX34VPZmMQzVbs=;
	b=WvWEnoGknkCc/isNAZPTI/LhRnIBNK0YAOa5C8cSc/Ocv8HGrnRkkEnZvjVzb3tObI
	UUjZK5r4HGzC/56tCGuzwBTjuVJhGkkG4V3wC3mZImRhtuC0qlYxI6pvB5ZVqlMfohiY
	ck4D39i4t1TNyPhVmGC+xVVCZDL10Km8hoYtPpZ9l1ijymlSbgDl09R/ZpQTvUtRT6kN
	GRK5w1x1LTzUegh6EhkqWdv7xkLaMH9Z2nGfN4CJAi9NJWE+wG18jMEb60Jhp1HrmHiD
	3tfKTdBLrajQnJ06YWdRCk/Mm3WPCpAB/ihIkiCGzE8V6BLVsng09t8ezBDXxxX1rWLv
	Uu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UrgaFIOSdIG0xKGzaF6Sjv7YjfHgjcX34VPZmMQzVbs=;
	b=CJz7tTBY+9VrP29kZ/pDJJH1QeAIYHxy2VdfHo7fR2wPFeaLdvl75Q1GeLO9rcw0eg
	1wwc4CbPAPTJf0ReObRF7jYp4YXzJK34vcLpf9UWTStO9FM4xcRNQWAXiBbb+MwnQrIT
	yqhcige/Cb/pGXTvgYlskB9c+wcy5/LpH0Bovs5tSRzA7wJox1FMMMLa63JiJx6T9fqP
	ZlldDY+Jv7NL6rsEhRCLo6WKPGdshr7VxIOQrcHqJhPLPtGHpVJTWV0x7EQ7rEN+YsDT
	FueUiDW42ZiglHUrdpp8BKP5iiRuPgixtMt6LAuKWbDwtoXDWyvoIjocHpwQzDU9HuR9
	Ae7Q==
X-Gm-Message-State: ALQs6tBhoyyUAYoUCpKEN9u4+J1a/ss/V88Mq2aqW0cHeQ3VbwgWbSHx
	oJ9EnqotwralI/JPD1P+orHNF7+7J9uBs8TaRq0=
X-Google-Smtp-Source: AIpwx48K+gV52PdYL23MHVjPu5hnaUGARG6/9vrbaU4sSYuvGPhE/u5D/L/36AfGUZ1kW3x5NubLcMxO9bHmC02kI1U=
X-Received: by 10.28.86.132 with SMTP id k126mr16857682wmb.17.1524697887989;
	Wed, 25 Apr 2018 16:11:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.207 with HTTP; Wed, 25 Apr 2018 16:11:27 -0700 (PDT)
In-Reply-To: <b640e9cc-0bce-0b7b-9639-0a37bf459695@xevo.com>
References: <1493752813-18913-1-git-send-email-mkelly@xevo.com>
	<CAJTo0Lb+GDpEMbZP7tgVuMtpw1=38u486VXoQL1NFGnFpTD4Mw@mail.gmail.com>
	<2607b2d4-c37f-5693-1002-db17f9e1024d@xevo.com>
	<CAJTo0LavpmZCQPHSTrsuJwEZHLT2eAhKLQR8A7Fj3kX6BTC0wg@mail.gmail.com>
	<20180425195437.GA2244@jama>
	<b640e9cc-0bce-0b7b-9639-0a37bf459695@xevo.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 26 Apr 2018 01:11:27 +0200
Message-ID: <CA+chaQfHaSAPXrU5pk_=M8hEjScxdVrAcUudekjFbzCUpQxSYA@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Joshua G Lock <joshua.g.lock@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH resend] qemuboot.conf: make cpus match built artifacts
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
X-List-Received-Date: Wed, 25 Apr 2018 23:11:27 -0000
Content-Type: multipart/alternative; boundary="001a1145369c00e490056ab46428"

--001a1145369c00e490056ab46428
Content-Type: text/plain; charset="UTF-8"

There are actually 3 we need to consider for lowest common denominator.

The one we build for, the one we build on and the one where we will run the
qemu in the end.

I mean the core2duo is probably best match for core2-64 DEFAULT used by
qemux86-64 MACHINE. But it's not good match to emulate with QEmu and KVM
enabled on the host like my.

It's easy to work around this, we probably don't need to change the default
values, but it would be good to document this case and how to override
QB_CPU_KVM
if your host doesn't match the features of core2duo.

On Thu, Apr 26, 2018 at 1:02 AM, Martin Kelly <mkelly@xevo.com> wrote:

> On 04/25/2018 12:54 PM, Martin Jansa wrote:
>
>> On Thu, Jun 15, 2017 at 05:37:50PM +0100, Burton, Ross wrote:
>>
>>> On 15 June 2017 at 17:17, Martin Kelly <mkelly@xevo.com> wrote:
>>>
>>> I am no expert, but running qemu -cpu help just says:
>>>>
>>>> kvm32 - "Common 32-bit KVM processor"
>>>> kvm64 - "Common 64-bit KVM processor"
>>>>
>>>> My best guess is that, running on qemu without kvm, both cases will be
>>>> slow (since it's all software emulation). But, using qemu -kvm, it
>>>> should
>>>> be fast as long as you run on a native CPU that is core2duo or better,
>>>> as
>>>> the native instructions can just be exposed and passed through to the
>>>> host.
>>>> Since core2duo is very old by now, it should be fast for virtually
>>>> everyone
>>>> building on x86.
>>>>
>>>>
>>> Right, I did some digging.  Assuming you have KVM enabled then in the
>>> general case the -cpu option is irrelevant as the instructions are
>>> handled
>>> natively.  -cpu just changes what CPUID flags the userspace sees, and so
>>> this is the Right Thing To Do.
>>>
>>
>> Sorry for replying to such old thread, but today I've noticed interesting
>> side-effect of this change.
>>
>> Today I was checking why starting qtbase examples in qemu fails with
>> message about missing ssse3 support which which qtbase as compiled.
>>
>> The DEFAULT_TUNE in qemux86-64 is indeed set to core2-64 which supports
>> ssse3, so qtbase is right to expect it in runtime.
>>
>> But then I was starting qemu manually (not with runqemu) with:
>> qemu-system-x86_64 -M q35 -smp 4 -m 4G -net nic,model=virtio -net
>> user,hostfwd=tcp::2222-:22 -vga virtio -display sdl,gl=on -hda
>> luneui-example-image-qemux86-64-20180425152329-jama.rootfs.wic.vmdk
>> -enable-kvm
>>
>> which defaults to using this kvm64 generic CPU which doesn't support ssse3
>>
>> Changing it to
>> qemu-system-x86_64 -M q35 -cpu core2duo -smp 4 -m 4G -net
>> nic,model=virtio -net user,hostfwd=tcp::2222-:22 -vga virtio -display
>> sdl,gl=on -hda luneui-example-image-qemux86-6
>> 4-20180425152329-jama.rootfs.wic.vmdk -enable-kvm
>>
>> gets rid of the message from qtbase, because core2duo supports ssse3 and
>> matches with qemux86-64,
>> but my host CPU (AMD Bulldozer FX(tm)-8120), doesn't support the same cpu
>> flags like core2due and qemu shows following
>> message when starting:
>> qemu-system-x86_64: warning: host doesn't support requested feature:
>> CPUID.01H:EDX.ss [bit 27]
>>
>> EDX.ss is Self Snoop feature which is enabled in core2duo and few other
>> QEmu emulated CPUs, so I was looking
>> on some other cpu I can emulate which has ssse3 while having the same
>> flags as my host's AMD cpu
>>
>> e.g. -cpu phenom is relatively close, but Bulldozer CPUs don't support
>> 3dnow, 3dnowext, so similar warning is shown.
>>
>> In the end I've switched to using -cpu Nehalem, which has ssse3, but
>> doesn't enable CPUID_SS flag, now it starts without any warnings:
>> qemu-system-x86_64 -M q35 -cpu Nehalem -smp 4 -m 4G -net nic,model=virtio
>> -net user,hostfwd=tcp::2222-:22 -vga virtio -display sdl,gl=on -hda
>> luneui-example-image-qemux86-64-20180425152329-jama.rootfs.wic.vmdk
>> -enable-kvm
>>
>> Regards,
>>
>>
> Heh, this is bringing back memories of when I wrote the patch. It's tricky
> to say what CPU we should pick here; we want whatever is the closest to a
> lowest common denominator. I don't know enough to say what the right choice
> is, though it is important that the CPU we build for and the one we run for
> are the same.
>
> Prior to this patch, we built for core2duo and then ran with kvm64,
> causing issues. Good follow-up work would be to see if core2duo is really
> the best CPU to be targeting for a lowest common denominator. If Nehalem is
> a better match, we might as well switch to that, as long as we switch in
> both build and runtime consistently.
>

--001a1145369c00e490056ab46428
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There are actually 3 we need to consider for lowest common=
 denominator.<div><br></div><div>The one we build for, the one we build on =
and the one where we will run the qemu in the end.</div><div><br></div><div=
>I mean the core2duo is probably best match for core2-64 DEFAULT used by qe=
mux86-64 MACHINE. But it&#39;s not good match to emulate with QEmu and KVM =
enabled on the host like my.</div><div><br></div><div>It&#39;s easy to work=
 around this, we probably don&#39;t need to change the default values, but =
it would be good to document this case and how to override=C2=A0<span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">QB_CPU_KVM if your host doesn&#39;t match the features of c=
ore2duo.</span></div></div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Thu, Apr 26, 2018 at 1:02 AM, Martin Kelly <span dir=3D"ltr">&=
lt;<a href=3D"mailto:mkelly@xevo.com" target=3D"_blank">mkelly@xevo.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb">=
<div class=3D"h5">On 04/25/2018 12:54 PM, Martin Jansa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Thu, Jun 15, 2017 at 05:37:50PM +0100, Burton, Ross wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 15 June 2017 at 17:17, Martin Kelly &lt;<a href=3D"mailto:mkelly@xevo.co=
m" target=3D"_blank">mkelly@xevo.com</a>&gt; wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I am no expert, but running qemu -cpu help just says:<br>
<br>
kvm32 - &quot;Common 32-bit KVM processor&quot;<br>
kvm64 - &quot;Common 64-bit KVM processor&quot;<br>
<br>
My best guess is that, running on qemu without kvm, both cases will be<br>
slow (since it&#39;s all software emulation). But, using qemu -kvm, it shou=
ld<br>
be fast as long as you run on a native CPU that is core2duo or better, as<b=
r>
the native instructions can just be exposed and passed through to the host.=
<br>
Since core2duo is very old by now, it should be fast for virtually everyone=
<br>
building on x86.<br>
<br>
</blockquote>
<br>
Right, I did some digging.=C2=A0 Assuming you have KVM enabled then in the<=
br>
general case the -cpu option is irrelevant as the instructions are handled<=
br>
natively.=C2=A0 -cpu just changes what CPUID flags the userspace sees, and =
so<br>
this is the Right Thing To Do.<br>
</blockquote>
<br>
Sorry for replying to such old thread, but today I&#39;ve noticed interesti=
ng side-effect of this change.<br>
<br>
Today I was checking why starting qtbase examples in qemu fails with<br>
message about missing ssse3 support which which qtbase as compiled.<br>
<br>
The DEFAULT_TUNE in qemux86-64 is indeed set to core2-64 which supports<br>
ssse3, so qtbase is right to expect it in runtime.<br>
<br>
But then I was starting qemu manually (not with runqemu) with:<br>
qemu-system-x86_64 -M q35 -smp 4 -m 4G -net nic,model=3Dvirtio -net user,ho=
stfwd=3Dtcp::2222-:22 -vga virtio -display sdl,gl=3Don -hda luneui-example-=
image-qemux86-6<wbr>4-20180425152329-jama.rootfs.w<wbr>ic.vmdk -enable-kvm<=
br>
<br>
which defaults to using this kvm64 generic CPU which doesn&#39;t support ss=
se3<br>
<br>
Changing it to<br>
qemu-system-x86_64 -M q35 -cpu core2duo -smp 4 -m 4G -net nic,model=3Dvirti=
o -net user,hostfwd=3Dtcp::2222-:22 -vga virtio -display sdl,gl=3Don -hda l=
uneui-example-image-qemux86-6<wbr>4-20180425152329-jama.rootfs.w<wbr>ic.vmd=
k -enable-kvm<br>
<br>
gets rid of the message from qtbase, because core2duo supports ssse3 and ma=
tches with qemux86-64,<br>
but my host CPU (AMD Bulldozer FX(tm)-8120), doesn&#39;t support the same c=
pu flags like core2due and qemu shows following<br>
message when starting:<br>
qemu-system-x86_64: warning: host doesn&#39;t support requested feature: CP=
UID.01H:EDX.ss [bit 27]<br>
<br>
EDX.ss is Self Snoop feature which is enabled in core2duo and few other QEm=
u emulated CPUs, so I was looking<br>
on some other cpu I can emulate which has ssse3 while having the same flags=
 as my host&#39;s AMD cpu<br>
<br>
e.g. -cpu phenom is relatively close, but Bulldozer CPUs don&#39;t support =
3dnow, 3dnowext, so similar warning is shown.<br>
<br>
In the end I&#39;ve switched to using -cpu Nehalem, which has ssse3, but do=
esn&#39;t enable CPUID_SS flag, now it starts without any warnings:<br>
qemu-system-x86_64 -M q35 -cpu Nehalem -smp 4 -m 4G -net nic,model=3Dvirtio=
 -net user,hostfwd=3Dtcp::2222-:22 -vga virtio -display sdl,gl=3Don -hda lu=
neui-example-image-qemux86-6<wbr>4-20180425152329-jama.rootfs.w<wbr>ic.vmdk=
 -enable-kvm<br>
<br>
Regards,<br>
<br>
</blockquote>
<br></div></div>
Heh, this is bringing back memories of when I wrote the patch. It&#39;s tri=
cky to say what CPU we should pick here; we want whatever is the closest to=
 a lowest common denominator. I don&#39;t know enough to say what the right=
 choice is, though it is important that the CPU we build for and the one we=
 run for are the same.<br>
<br>
Prior to this patch, we built for core2duo and then ran with kvm64, causing=
 issues. Good follow-up work would be to see if core2duo is really the best=
 CPU to be targeting for a lowest common denominator. If Nehalem is a bette=
r match, we might as well switch to that, as long as we switch in both buil=
d and runtime consistently.<br>
</blockquote></div><br></div>

--001a1145369c00e490056ab46428--
