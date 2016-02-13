Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9C6CC731F9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 18:19:42 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id e185so6054613vkb.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 10:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OwEzDuhqea3eqb8hzNF/WnxNyGGzx74B3njMI+Sjh38=;
	b=bcpyPg37P/XnPanh/TgPryjnJwaan6seY+3o07ekQjJ4oz2sTaVb251aDIHyZBecHT
	jeuwFTSmhkB7xhrajIz06bhJUnmTq+jgis+5DhClQbKnEJX/lKaX/vx4HUfaC1MbqFiM
	lE6VceuFieRe9fZdgdM6oF10FFq0WX98i+2gYBLwK3WdRJJLrJepGiCjk9/AhpnrgB/S
	+Cn9eRa48pLzn/SX/aETdb1cHb71m70eKQuqCi7hvR38f4HgnvvJkU1hvnXpII4J2Ury
	SfKvYHtvb6qArXYgPf7SneTo8gNbZLvVmlaWiU4n3yL6SNs5BCTZBew5NbICa/lpVEhH
	hiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=OwEzDuhqea3eqb8hzNF/WnxNyGGzx74B3njMI+Sjh38=;
	b=b1cDxD5JE62t0dmioi1CujMS5p5zSpJyWUX6LVw39zQxcqT+wvWV4SYs4Fj9Jl45/z
	z+V62iqZMMLqkCJsORcVPYiMt+V57YYRx5MVhepOzBy5HOSPGovr9Lx81PMCXNKuVeNx
	pRyIYZc5QOK7bn2uH0sakm4PSyZtAd6RTLciqN9kDe8ATLPB2zJhaH/yJX4ve3TCHTOM
	w3DWu7spr0bG1qv8pY/eSp2TsRDijQeeLQyNTbPh6YI5kay8RAjYahQO0QK1M7n2VKGN
	Lm4ETHE9K1YxcPzRNw2cybPW3ISgmzr8cXdPxz4hSzgs5aGnAUo00HU24sNaYTtxOi02
	BEGQ==
X-Gm-Message-State: AG10YOSgOV2cYz8oBShlCZWTqzYsiQK6Uhu+vla7m1JpoKBoXZyN+bawRwtBzzs1Oy1Qnybb2hHA9I0qE2Nmdg==
MIME-Version: 1.0
X-Received: by 10.31.141.194 with SMTP id p185mr5892682vkd.57.1455387582738;
	Sat, 13 Feb 2016 10:19:42 -0800 (PST)
Received: by 10.176.0.50 with HTTP; Sat, 13 Feb 2016 10:19:42 -0800 (PST)
In-Reply-To: <1455383832.16142.365.camel@linuxfoundation.org>
References: <cover.1455203562.git.bruce.ashfield@windriver.com>
	<2e6d2b75837731be983d888eaa82a9cfcf660e85.1455203562.git.bruce.ashfield@windriver.com>
	<1455287765.16142.321.camel@linuxfoundation.org>
	<1455291157.16142.323.camel@linuxfoundation.org>
	<1455352317.16142.344.camel@linuxfoundation.org>
	<1455383832.16142.365.camel@linuxfoundation.org>
Date: Sat, 13 Feb 2016 13:19:42 -0500
Message-ID: <CADkTA4NoFv8LvOrANvMWrg_6h9Js5GqFbS6QBDBioNbeKHcEig@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Hart, Darren" <darren.hart@intel.com>, "saul.wold" <saul.wold@intel.com>,
	"poky@yoctoproject.org" <poky@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 1/1] poky: update qemu* to prefer 4.4 kernel
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
X-List-Received-Date: Sat, 13 Feb 2016 18:19:42 -0000
Content-Type: multipart/alternative; boundary=001a11426214e13884052baad340

--001a11426214e13884052baad340
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 13, 2016 at 12:17 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I'm moving the discussion to OE-Core and pulling in some kernel people.
> I think I understand what is wrong and how to fix it but I could use
> someone who actually knows this code.
>
> To summarise the story so far, on qemux86, X doesn't start and there is
> a backtrace in the logs:
>
> x86/PAT: Xorg:705 map pfn expected mapping type uncached-minus for [mem
> 0xfd000000-0xfdffffff], got write-combining
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 705 at
> /media/build1/poky/build/tmp/work-shared/qemux86/kernel-source/arch/x86/mm/pat.c:985
> untrack_pfn+0xaf/0xc0()
> Modules linked in: uvesafb
> CPU: 0 PID: 705 Comm: Xorg Not tainted 4.4.1-yocto-standard #1
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> rel-1.8.2-0-g33fbe13 by qemu-project.org 04/01/2014
>  00000000 00000000 cf14dd78 c1397ab2 00000000 cf14dda8 c1051477 c1aa4f6c
>  00000000 000002c1 c1a9fa4c 000003d9 c104b98f c104b98f cf244000 b6355000
>  00000000 cf14ddb8 c1051552 00000009 00000000 cf14dde0 c104b98f cf14ddd0
> Call Trace:
>  [<c1397ab2>] dump_stack+0x4b/0x79
>  [<c1051477>] warn_slowpath_common+0x87/0xc0
>  [<c104b98f>] ? untrack_pfn+0xaf/0xc0
>  [<c104b98f>] ? untrack_pfn+0xaf/0xc0
>  [<c1051552>] warn_slowpath_null+0x22/0x30
>  [<c104b98f>] untrack_pfn+0xaf/0xc0
>  [<c104d54c>] ? kmap_atomic_prot+0x3c/0xf0
>  [<c114e17f>] unmap_single_vma+0x4ef/0x500
>  [<c114f007>] unmap_vmas+0x37/0x50
>  [<c1154f8f>] exit_mmap+0x5f/0xf0
>  [<c104eedd>] mmput+0x2d/0xb0
>  [<c105009c>] copy_process+0xd2c/0x13c0
>  [<c1050892>] _do_fork+0x82/0x340
>  [<c105f2d1>] ? SyS_rt_sigaction+0x51/0xa0
>  [<c1050c3c>] SyS_clone+0x2c/0x30
>  [<c1001a03>] do_syscall_32_irqs_on+0x53/0xb0
>  [<c189a94a>] entry_INT80_32+0x2a/0x2a
> ---[ end trace be3e0a61097feddc ]---
> x86/PAT: Xorg:705 map pfn expected mapping type uncached-minus for [mem
> 0xfd000000-0xfdffffff], got write-combining
>
> The entry in question is setup by uvesafb which in its
> uvesafb_ioremap() function calls ioremap_wc().
>
> It appears that Xorg mmaps this from userspace, then later does a
> fork() to execute a utility. At this point, when creating the vmas for
> the new process, the pat code says "eeek!" as the protection mode for
> the new vmas don't match the old one, returns -EINVAL, the process dies
> and X goes with it.
>
> There are a few hammers we can hit this with, we can boot with "nopat"
> option which makes the problem go away, or turn off CONFIG_X86_PAT. No
> surprises there. Changing uvesafb to use mtrr=0 doesn't help since the
> ioremap_wc call still happens.
>
> The real issue is the "expected mapping type uncached-minus for got
> write-combining" message, it all goes wrong from there.
>
> Upon looking at the code and scratching my head for a long while, I
> notice that there are two ways of representing the protection mode
> data, "enum page_cache_mode" and "pgprot_t & _PAGE_CACHE_MASK".
>
> The exact meaning of pgprot_t depends on which CPU you're running,
> older CPUs have errata meaning only a small number of bits can be used.
> The exact mapping table is determined by __cachemode2pte_tbl and is
> updated at boot by calls from update_cache_mode_entry().
>
> The result of this if you map enum -> pgprot_t, then try to do pgprot_t
> -> enum, you can get different values since its not a 1:1 mapping.
>
> This means the comparison in reserve_pfn_range() where it does "pcm !=
> want_pcm" isn't correct and can trigger even in cases where there isn't
> a problem.
>
> This can be "fixed" by doing cachemode2protval(pcm) !=
> cachemode2protval(want_pcm) and checking whether the protection bits
> match, rather than the enum values, since in reality this is what we
> really care about.
>
> I can confirm that if I make that change, X boots up just fine.
>
> The problem is I really have no idea what I'm doing :).
>
> Could someone who understands this code have a look and see whether the
> above makes sense and if it does, perhaps open a discussion with
> upstream about how to fix this properly (assuming my change isn't
> actually the correct fix)?
>

I'm not familiar with this code either, but I'll start doing some bisects
to see if
we can isolate the commit that introduced the behaviour change. This is the
sort of thing that is very rare, and really isn't supposed to happen. So
until
I read the commit log where the change was triggered, I'd lean to it being
a bug
and something to report and fix upstream.

I know that I booted sato with the 4.4 update, do we have any other
confirmations
that this worked, or was I the only one doing 4.4 boot tests until I sent
the
patch to bump the preferred version ?


>
> We don't see this on qemux86-64 since that has more PAT bits working
> and hence the values map correctly.
>
> Bruce: Would you accept a patch doing the above for now?
>

I would. I'd rather not paper over this by changing the config fragments,
since
once we throw that switch, it'll most likely sit there .. covered up.

Bruce


>
> Cheers,
>
> Richard
>
>
> --
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11426214e13884052baad340
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sat, Feb 13, 2016 at 12:17 PM, Richard Purdie <span dir=3D"ltr">&lt;=
<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">ric=
hard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">I&#39;m moving the discussion to OE-Core and pulling in some =
kernel people.<br>
I think I understand what is wrong and how to fix it but I could use<br>
someone who actually knows this code.<br>
<br>
To summarise the story so far, on qemux86, X doesn&#39;t start and there is=
<br>
a backtrace in the logs:<br>
<div><div class=3D"h5"><br>
x86/PAT: Xorg:705 map pfn expected mapping type uncached-minus for [mem 0xf=
d000000-0xfdffffff], got write-combining<br>
------------[ cut here ]------------<br>
WARNING: CPU: 0 PID: 705 at /media/build1/poky/build/tmp/work-shared/qemux8=
6/kernel-source/arch/x86/mm/pat.c:985 untrack_pfn+0xaf/0xc0()<br>
Modules linked in: uvesafb<br>
CPU: 0 PID: 705 Comm: Xorg Not tainted 4.4.1-yocto-standard #1<br>
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.8.2-0-g33=
fbe13 by <a href=3D"http://qemu-project.org" rel=3D"noreferrer" target=3D"_=
blank">qemu-project.org</a> 04/01/2014<br>
=C2=A000000000 00000000 cf14dd78 c1397ab2 00000000 cf14dda8 c1051477 c1aa4f=
6c<br>
=C2=A000000000 000002c1 c1a9fa4c 000003d9 c104b98f c104b98f cf244000 b63550=
00<br>
=C2=A000000000 cf14ddb8 c1051552 00000009 00000000 cf14dde0 c104b98f cf14dd=
d0<br>
Call Trace:<br>
=C2=A0[&lt;c1397ab2&gt;] dump_stack+0x4b/0x79<br>
=C2=A0[&lt;c1051477&gt;] warn_slowpath_common+0x87/0xc0<br>
=C2=A0[&lt;c104b98f&gt;] ? untrack_pfn+0xaf/0xc0<br>
=C2=A0[&lt;c104b98f&gt;] ? untrack_pfn+0xaf/0xc0<br>
=C2=A0[&lt;c1051552&gt;] warn_slowpath_null+0x22/0x30<br>
=C2=A0[&lt;c104b98f&gt;] untrack_pfn+0xaf/0xc0<br>
=C2=A0[&lt;c104d54c&gt;] ? kmap_atomic_prot+0x3c/0xf0<br>
=C2=A0[&lt;c114e17f&gt;] unmap_single_vma+0x4ef/0x500<br>
=C2=A0[&lt;c114f007&gt;] unmap_vmas+0x37/0x50<br>
=C2=A0[&lt;c1154f8f&gt;] exit_mmap+0x5f/0xf0<br>
=C2=A0[&lt;c104eedd&gt;] mmput+0x2d/0xb0<br>
=C2=A0[&lt;c105009c&gt;] copy_process+0xd2c/0x13c0<br>
=C2=A0[&lt;c1050892&gt;] _do_fork+0x82/0x340<br>
=C2=A0[&lt;c105f2d1&gt;] ? SyS_rt_sigaction+0x51/0xa0<br>
=C2=A0[&lt;c1050c3c&gt;] SyS_clone+0x2c/0x30<br>
=C2=A0[&lt;c1001a03&gt;] do_syscall_32_irqs_on+0x53/0xb0<br>
=C2=A0[&lt;c189a94a&gt;] entry_INT80_32+0x2a/0x2a<br>
---[ end trace be3e0a61097feddc ]---<br>
x86/PAT: Xorg:705 map pfn expected mapping type uncached-minus for [mem 0xf=
d000000-0xfdffffff], got write-combining<br>
<br>
</div></div>The entry in question is setup by uvesafb which in its<br>
uvesafb_ioremap() function calls ioremap_wc().<br>
<br>
It appears that Xorg mmaps this from userspace, then later does a<br>
fork() to execute a utility. At this point, when creating the vmas for<br>
the new process, the pat code says &quot;eeek!&quot; as the protection mode=
 for<br>
the new vmas don&#39;t match the old one, returns -EINVAL, the process dies=
<br>
and X goes with it.<br>
<br>
There are a few hammers we can hit this with, we can boot with &quot;nopat&=
quot;<br>
option which makes the problem go away, or turn off CONFIG_X86_PAT. No<br>
surprises there. Changing uvesafb to use mtrr=3D0 doesn&#39;t help since th=
e<br>
ioremap_wc call still happens.<br>
<br>
The real issue is the &quot;expected mapping type uncached-minus for got<br=
>
write-combining&quot; message, it all goes wrong from there.<br>
<br>
Upon looking at the code and scratching my head for a long while, I<br>
notice that there are two ways of representing the protection mode<br>
data, &quot;enum page_cache_mode&quot; and &quot;pgprot_t &amp; _PAGE_CACHE=
_MASK&quot;.<br>
<br>
The exact meaning of pgprot_t depends on which CPU you&#39;re running,<br>
older CPUs have errata meaning only a small number of bits can be used.<br>
The exact mapping table is determined by __cachemode2pte_tbl and is<br>
updated at boot by calls from update_cache_mode_entry().<br>
<br>
The result of this if you map enum -&gt; pgprot_t, then try to do pgprot_t<=
br>
-&gt; enum, you can get different values since its not a 1:1 mapping.<br>
<br>
This means the comparison in reserve_pfn_range() where it does &quot;pcm !=
=3D<br>
want_pcm&quot; isn&#39;t correct and can trigger even in cases where there =
isn&#39;t<br>
a problem.<br>
<br>
This can be &quot;fixed&quot; by doing cachemode2protval(pcm) !=3D<br>
cachemode2protval(want_pcm) and checking whether the protection bits<br>
match, rather than the enum values, since in reality this is what we<br>
really care about.<br>
<br>
I can confirm that if I make that change, X boots up just fine.<br>
<br>
The problem is I really have no idea what I&#39;m doing :).<br>
<br>
Could someone who understands this code have a look and see whether the<br>
above makes sense and if it does, perhaps open a discussion with<br>
upstream about how to fix this properly (assuming my change isn&#39;t<br>
actually the correct fix)?<br></blockquote><div><br></div><div>I&#39;m not =
familiar with this code either, but I&#39;ll start doing some bisects to se=
e if</div><div>we can isolate the commit that introduced the behaviour chan=
ge. This is the</div><div>sort of thing that is very rare, and really isn&#=
39;t supposed to happen. So until</div><div>I read the commit log where the=
 change was triggered, I&#39;d lean to it being a bug</div><div>and somethi=
ng to report and fix upstream.</div><div><br></div><div>I know that I boote=
d sato with the 4.4 update, do we have any other confirmations</div><div>th=
at this worked, or was I the only one doing 4.4 boot tests until I sent the=
</div><div>patch to bump the preferred version ?</div><div>=C2=A0<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
We don&#39;t see this on qemux86-64 since that has more PAT bits working<br=
>
and hence the values map correctly.<br>
<br>
Bruce: Would you accept a patch doing the above for now?<br></blockquote><d=
iv><br></div><div>I would. I&#39;d rather not paper over this by changing t=
he config fragments, since</div><div>once we throw that switch, it&#39;ll m=
ost likely sit there .. covered up.</div><div><br></div><div>Bruce</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
--<br>
_______________________________________________<br>
poky mailing list<br>
<a href=3D"mailto:poky@yoctoproject.org">poky@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/poky" rel=3D"noreferrer"=
 target=3D"_blank">https://lists.yoctoproject.org/listinfo/poky</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a11426214e13884052baad340--
