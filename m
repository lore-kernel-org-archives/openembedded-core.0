Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3E4DC7867C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 16:08:15 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id g2so7278662pgn.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 08:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=J+ZqwzQOh12kMAgd7wWQW1OZN8EJ1CDEaVKnkWO0DpQ=;
	b=d4og+a46VPK3LPkoWywoy2bJzIcY24QcLHLvDe3jO7GcLyryQINS8qP9yoPp6Tu+y2
	nsUR6l4Yl7m5saoQg7S8wY5f+SZLlbB0nAX0QzHRSKk4M1vqnTcyuktQ1MScvFoHX4g4
	Tkk4Oj9gNTvHHkgc+h5E3tQ7K4xXDBPUvqCgaNEfjS3cz9RuE2yCcSigVlmon8g2m0yY
	vQ0U1YmXtBL9rNlIJUIAhzM3WpfYETZrMWRPHClke6Y/DMoJYLX//PSW7CiwHbMSUsvp
	uMBnfZBkW+r1T7mKAPj13B/12o0rAQl5kFyQiUoAAe9/TLJ79qKkx6JgNv9oyfUJIbTo
	GMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=J+ZqwzQOh12kMAgd7wWQW1OZN8EJ1CDEaVKnkWO0DpQ=;
	b=pn8lwflZBFlMIAqYXYJtTUW+XO2i4HZW0HGMF7sw0zGzjy4UAT/dp2rB0tBZdlVNTO
	3wfYU+MdNuhub7v/3Be9h1eW/LcvUJrqeizfGXBOioXXpYK175lJi35GZLGS/ca2lY+b
	LGEcm7/HfJu0cZil2r/fgnbtTUaMpyPeULo6a5DohJdirDL4JPNe+QY2xKWRAbub3HXH
	+OtfVgrSenqqbf+C3BDGWfsGnvEVh92p4bjqDqejUg7GODYNsrB5bMATOQ6NcXa/cUyb
	JwAXNYdOSgu63PGTBstzt22/UyZPerQc8MY7FLRo5lxyZ0o+7RPAFQLO9HkMU/B+XGz0
	ZdYw==
X-Gm-Message-State: APf1xPCdQgFhSuBZG727K+FJzUAdc74shrjBzOpvaTdEMCYBuI4fZq+V
	zcLO7oknh49ExePoeHM0WbDrw6N0rZzEjWnqEJw=
X-Google-Smtp-Source: AH8x224Fu+DKzbiik14lCBz4+eOhkiIQXXaUAM6wqnViBFKU95j5FLxmQo5OGfTR6nJJqnaFShiIvPe1k4v8XgwPc0s=
X-Received: by 10.99.170.73 with SMTP id x9mr69495pgo.393.1519142897158; Tue,
	20 Feb 2018 08:08:17 -0800 (PST)
MIME-Version: 1.0
References: <1519084455-3915-1-git-send-email-denis@denix.org>
	<CAP9ODKq7YyqaapLxxOrPo6WoNf6dTFpxkvQh1pF+yqJQxGA7jQ@mail.gmail.com>
	<20180220012001.GZ2786@denix.org>
	<8d340a29-2016-55fa-0fd2-9847e6f9e62b@gmail.com>
	<CAP9ODKqv6LRHhnQcGaZuApppxn_j3P1Vat-pFvCvsApwrZLg=A@mail.gmail.com>
	<CA+chaQdzUAxeE-hKceogmgSjBCXvkT7-BKzDrqFV1EvpTD=oXA@mail.gmail.com>
In-Reply-To: <CA+chaQdzUAxeE-hKceogmgSjBCXvkT7-BKzDrqFV1EvpTD=oXA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Feb 2018 16:08:06 +0000
Message-ID: <CAMKF1sobCVLrT0J2ig3OP3CpJ6Rja3oE2DZTTWNypFEmrZETMA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] kernel.bbclass: explicitly depend on bison-native for deterministic builds
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
X-List-Received-Date: Tue, 20 Feb 2018 16:08:16 -0000
Content-Type: multipart/alternative; boundary="94eb2c1bfbbcbf8f120565a70401"

--94eb2c1bfbbcbf8f120565a70401
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 20, 2018 at 7:41 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> I'm OK with adding bison-native for all versions.
>


As long we know that there are no side effects of this dep in kernel builds

>
> When we added bc-native 2+ years ago:
> commit c067e52cffe002de3b39aa1bced308dd532859c1
> Author: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> Date:   Thu Oct 2 15:33:23 2014 -0500
>
>     kernel: Added bc-native as DEPENDS
>
>     The makefile checks for bc during for compilation
>
> it was also needed only for the latest kernel and we didn't make it
> conditional on the kernel version. Now with RSS it's even less dangerous as
> the bison-native will appear only in kernel's RSS and as Denys said it's
> quite common dependency so many components pull it into RSS anyway.
>
> On Tue, Feb 20, 2018 at 3:53 PM, Otavio Salvador <
> otavio.salvador@ossystems.com.br> wrote:
>
>> On Tue, Feb 20, 2018 at 7:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> > On 2/19/18 5:20 PM, Denys Dmytriyenko wrote:
>> >>
>> >> On Mon, Feb 19, 2018 at 09:36:22PM -0300, Otavio Salvador wrote:
>> >>>
>> >>> On Mon, Feb 19, 2018 at 8:54 PM, Denys Dmytriyenko <denis@denix.org>
>> >>> wrote:
>> >>>>
>> >>>> From: Denys Dmytriyenko <denys@ti.com>
>> >>>>
>> >>>> Explicitly depend on bison-native for deterministic builds, as it is
>> >>>> required
>> >>>> for the build:
>> >>>>
>> >>>> |   HOSTCC  scripts/basic/fixdep
>> >>>> |   GEN     ./Makefile
>> >>>> |   HOSTCC  scripts/kconfig/conf.o
>> >>>> |   YACC    scripts/kconfig/zconf.tab.c
>> >>>> | /bin/sh: bison: command not found
>> >>>> | scripts/Makefile.lib:217: recipe for target
>> >>>> 'scripts/kconfig/zconf.tab.c' failed
>> >>>>
>> >>>> In most cases, this dependency comes indirectly via toolchain
>> >>>> dependencies,
>> >>>> specifically binutils-cross, which pulls bison-native. Different
>> setups,
>> >>>> such as with external toolchain, would expose this problem, since
>> >>>> correct
>> >>>> dependency is not marked explicitly.
>> >>>>
>> >>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> >>>> ---
>> >>>> I'm seeing this now on 4.16-rc2 with external toolchain.
>> >>>
>> >>>
>> >>> I am not against the addition but in fact, it is because 4.16 stopped
>> >>> of using pre-generated files and now requires bison to be available.
>> >>
>> >>
>> >> Ok, good, I was wondering why I didn't see it before 4.16...
>> >>
>> >>
>> >>> I am unsure it ought to be on kernel.bbclass at this moment.
>> >>
>> >>
>> >> Why not? Because it's 4.16+ specific?
>> >>
>> >> By default bison-native dependency gets added implicitly when built
>> with
>> >> the
>> >> toolchain from oe-core, so this doesn't add any extra dependencies,
>> only
>> >> makes
>> >> it explicit.
>> >>
>> > it will be overcompensating for < 4.16 kernel recipes where this
>> dependency
>> > is not needed. it might be a legit dependency for another component,
>> that
>> > doesn't stage this package in kernel recipe-specific sysroot but this
>> change
>> > will do that. So its not completely innocent change.
>>
>> I'd be in favor of matching the version and adding it if it is a 4.16
>> or newer kernel. Adding for prior versions seems wrong for me.
>>
>> --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>>
> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--94eb2c1bfbbcbf8f120565a70401
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Tue, Feb 20, 2018 =
at 7:41 AM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">marti=
n.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv>I&#39;m OK with adding bison-native for all versions.</div></blockquote>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">A=
s long we know that there are no side effects of this dep in kernel builds=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div><div><br></div><div>When we=
 added bc-native 2+ years ago:</div><div><div>commit c067e52cffe002de3b39aa=
1bced308dd532859c1</div><div>Author: Alejandro Hernandez &lt;<a href=3D"mai=
lto:alejandro.hernandez@linux.intel.com" target=3D"_blank">alejandro.hernan=
dez@linux.intel.com</a>&gt;</div><div>Date:=C2=A0 =C2=A0Thu Oct 2 15:33:23 =
2014 -0500</div><div><br></div><div>=C2=A0 =C2=A0 kernel: Added bc-native a=
s DEPENDS</div><div>=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 The makefil=
e checks for bc during for compilation</div></div><div><br></div><div>it wa=
s also needed only for the latest kernel and we didn&#39;t make it conditio=
nal on the kernel version. Now with RSS it&#39;s even less dangerous as the=
 bison-native will appear only in kernel&#39;s RSS and as Denys said it&#39=
;s quite common dependency so many components pull it into RSS anyway.</div=
></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"></div></di=
v><div class=3D"gmail_extra"><div class=3D"gmail_quote">On Tue, Feb 20, 201=
8 at 3:53 PM, Otavio Salvador <span>&lt;<a href=3D"mailto:otavio.salvador@o=
ssystems.com.br" target=3D"_blank">otavio.salvador@ossystems.com.br</a>&gt;=
</span> wrote:<br></div></div><div class=3D"gmail_extra"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div class=3D"m_5651199098793911087=
HOEnZb"><div class=3D"m_5651199098793911087h5">On Tue, Feb 20, 2018 at 7:10=
 AM, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">r=
aj.khem@gmail.com</a>&gt; wrote:<br>
&gt; On 2/19/18 5:20 PM, Denys Dmytriyenko wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Feb 19, 2018 at 09:36:22PM -0300, Otavio Salvador wrote:<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Mon, Feb 19, 2018 at 8:54 PM, Denys Dmytriyenko &lt;<a href=
=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;<br>
&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com=
" target=3D"_blank">denys@ti.com</a>&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Explicitly depend on bison-native for deterministic builds=
, as it is<br>
&gt;&gt;&gt;&gt; required<br>
&gt;&gt;&gt;&gt; for the build:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; |=C2=A0 =C2=A0HOSTCC=C2=A0 scripts/basic/fixdep<br>
&gt;&gt;&gt;&gt; |=C2=A0 =C2=A0GEN=C2=A0 =C2=A0 =C2=A0./Makefile<br>
&gt;&gt;&gt;&gt; |=C2=A0 =C2=A0HOSTCC=C2=A0 scripts/kconfig/conf.o<br>
&gt;&gt;&gt;&gt; |=C2=A0 =C2=A0YACC=C2=A0 =C2=A0 scripts/kconfig/zconf.tab.=
c<br>
&gt;&gt;&gt;&gt; | /bin/sh: bison: command not found<br>
&gt;&gt;&gt;&gt; | scripts/Makefile.lib:217: recipe for target<br>
&gt;&gt;&gt;&gt; &#39;scripts/kconfig/zconf.tab.c&#39; failed<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; In most cases, this dependency comes indirectly via toolch=
ain<br>
&gt;&gt;&gt;&gt; dependencies,<br>
&gt;&gt;&gt;&gt; specifically binutils-cross, which pulls bison-native. Dif=
ferent setups,<br>
&gt;&gt;&gt;&gt; such as with external toolchain, would expose this problem=
, since<br>
&gt;&gt;&gt;&gt; correct<br>
&gt;&gt;&gt;&gt; dependency is not marked explicitly.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:den=
ys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt; I&#39;m seeing this now on 4.16-rc2 with external toolchai=
n.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I am not against the addition but in fact, it is because 4.16 =
stopped<br>
&gt;&gt;&gt; of using pre-generated files and now requires bison to be avai=
lable.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Ok, good, I was wondering why I didn&#39;t see it before 4.16...<b=
r>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; I am unsure it ought to be on kernel.bbclass at this moment.<b=
r>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Why not? Because it&#39;s 4.16+ specific?<br>
&gt;&gt;<br>
&gt;&gt; By default bison-native dependency gets added implicitly when buil=
t with<br>
&gt;&gt; the<br>
&gt;&gt; toolchain from oe-core, so this doesn&#39;t add any extra dependen=
cies, only<br>
&gt;&gt; makes<br>
&gt;&gt; it explicit.<br>
&gt;&gt;<br>
&gt; it will be overcompensating for &lt; 4.16 kernel recipes where this de=
pendency<br>
&gt; is not needed. it might be a legit dependency for another component, t=
hat<br>
&gt; doesn&#39;t stage this package in kernel recipe-specific sysroot but t=
his change<br>
&gt; will do that. So its not completely innocent change.<br>
<br>
</div></div>I&#39;d be in favor of matching the version and adding it if it=
 is a 4.16<br>
or newer kernel. Adding for prior versions seems wrong for me.<br>
<span class=3D"m_5651199098793911087im m_5651199098793911087HOEnZb"><br>
--<br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" value=3D"+555399817854=
" target=3D"_blank">+55 (53) 9981-7854</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Mobile: <a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+13=
479039750" target=3D"_blank">+1 (347) 903-9750</a><br>
</span></blockquote></div></div><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div class=3D"m_56511990987939110=
87HOEnZb"><div class=3D"m_5651199098793911087h5">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div></div></blockquote></div></div>

--94eb2c1bfbbcbf8f120565a70401--
