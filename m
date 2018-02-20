Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 192EF786E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 15:41:25 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u49so10992426wrc.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 07:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2LDO6xM3dmfV500D62m2EyfG8yLM8fq/A26J79UEc/w=;
	b=R680tLe/8i7xZub89CCSo007dbvnJez2qCrOJFUG4lMuXQmz93uy0o9tRNtUAHgxFU
	PtyA5VSy/LyS2EZziHL40sc4WLea73b1TktBgeK/+DA5kwvpSTD7z+RcRunELbPvve0o
	M3Bx2ht5ocXuNRByct8HT24t9fLtdYlygOOpyPBLj43jfeSNwUXHOWPknjwXsWNn/REl
	+CnbaIwfhw8zumez24GpedhtH14lZbqXQpraj2XOhpIWYZB9kBrvJqj3n9TClYZ+HmOC
	bbfenNYbzalD+zj89ZS5+6jWK95LjTUILqekDKkxyGndk4/v3s9Ps0BbYa2pIfkbGRdL
	jDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2LDO6xM3dmfV500D62m2EyfG8yLM8fq/A26J79UEc/w=;
	b=VGmqraWzlVrGXrUpN3+t4HgeaHhFBQE06Z1G/taGY8QWeMFrsFIUo9eHMSQwrOxRbV
	w5OxZ5CfZDmZy8oyGChekWQG8f1KpmduzXIpHgPBOQG37g1qE6ckETU7W8ef2zxmrfbN
	CoaEUXDOeENySZfWnjCghYoUsuhPxpShzlsmsx8Yb22Eu+jVYAZALf3mvH9NVRC3PAG8
	Zru4ndj5TEtQpeCqjva/EJjxdCyynbTyC98rZ7OgWWaW4t3KKUaCAMYiNuXwgGFnxn4V
	FBSP/E1+oFbFxr9E57iS/UWNJiktmQTtckV+AUlqKNLPSWfgSQAjZumZaP5HoG1JgFOY
	8sRw==
X-Gm-Message-State: APf1xPBD1LIxoFyakYUYKPhJPLQLiGnVcucl+kM2CGhzXiMQgV66iU63
	AzVioFX8Y73u9CaK7VYNd/8XFF8s8TzQURxzNHA=
X-Google-Smtp-Source: AH8x224/EzZE38Y1EQZJBFlFnCpFDwuzlWWvdbbae7xFONaQim80ZyYXtNL4RheLVOn8uk6dgMAcho1axNG5ajK1ROU=
X-Received: by 10.223.160.42 with SMTP id k39mr54232wrk.138.1519141286731;
	Tue, 20 Feb 2018 07:41:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Tue, 20 Feb 2018 07:41:26 -0800 (PST)
In-Reply-To: <CAP9ODKqv6LRHhnQcGaZuApppxn_j3P1Vat-pFvCvsApwrZLg=A@mail.gmail.com>
References: <1519084455-3915-1-git-send-email-denis@denix.org>
	<CAP9ODKq7YyqaapLxxOrPo6WoNf6dTFpxkvQh1pF+yqJQxGA7jQ@mail.gmail.com>
	<20180220012001.GZ2786@denix.org>
	<8d340a29-2016-55fa-0fd2-9847e6f9e62b@gmail.com>
	<CAP9ODKqv6LRHhnQcGaZuApppxn_j3P1Vat-pFvCvsApwrZLg=A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 20 Feb 2018 16:41:26 +0100
Message-ID: <CA+chaQdzUAxeE-hKceogmgSjBCXvkT7-BKzDrqFV1EvpTD=oXA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
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
X-List-Received-Date: Tue, 20 Feb 2018 15:41:26 -0000
Content-Type: multipart/alternative; boundary="94eb2c05ddb2c264f20565a6a49b"

--94eb2c05ddb2c264f20565a6a49b
Content-Type: text/plain; charset="UTF-8"

I'm OK with adding bison-native for all versions.

When we added bc-native 2+ years ago:
commit c067e52cffe002de3b39aa1bced308dd532859c1
Author: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Date:   Thu Oct 2 15:33:23 2014 -0500

    kernel: Added bc-native as DEPENDS

    The makefile checks for bc during for compilation

it was also needed only for the latest kernel and we didn't make it
conditional on the kernel version. Now with RSS it's even less dangerous as
the bison-native will appear only in kernel's RSS and as Denys said it's
quite common dependency so many components pull it into RSS anyway.

On Tue, Feb 20, 2018 at 3:53 PM, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Tue, Feb 20, 2018 at 7:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > On 2/19/18 5:20 PM, Denys Dmytriyenko wrote:
> >>
> >> On Mon, Feb 19, 2018 at 09:36:22PM -0300, Otavio Salvador wrote:
> >>>
> >>> On Mon, Feb 19, 2018 at 8:54 PM, Denys Dmytriyenko <denis@denix.org>
> >>> wrote:
> >>>>
> >>>> From: Denys Dmytriyenko <denys@ti.com>
> >>>>
> >>>> Explicitly depend on bison-native for deterministic builds, as it is
> >>>> required
> >>>> for the build:
> >>>>
> >>>> |   HOSTCC  scripts/basic/fixdep
> >>>> |   GEN     ./Makefile
> >>>> |   HOSTCC  scripts/kconfig/conf.o
> >>>> |   YACC    scripts/kconfig/zconf.tab.c
> >>>> | /bin/sh: bison: command not found
> >>>> | scripts/Makefile.lib:217: recipe for target
> >>>> 'scripts/kconfig/zconf.tab.c' failed
> >>>>
> >>>> In most cases, this dependency comes indirectly via toolchain
> >>>> dependencies,
> >>>> specifically binutils-cross, which pulls bison-native. Different
> setups,
> >>>> such as with external toolchain, would expose this problem, since
> >>>> correct
> >>>> dependency is not marked explicitly.
> >>>>
> >>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >>>> ---
> >>>> I'm seeing this now on 4.16-rc2 with external toolchain.
> >>>
> >>>
> >>> I am not against the addition but in fact, it is because 4.16 stopped
> >>> of using pre-generated files and now requires bison to be available.
> >>
> >>
> >> Ok, good, I was wondering why I didn't see it before 4.16...
> >>
> >>
> >>> I am unsure it ought to be on kernel.bbclass at this moment.
> >>
> >>
> >> Why not? Because it's 4.16+ specific?
> >>
> >> By default bison-native dependency gets added implicitly when built with
> >> the
> >> toolchain from oe-core, so this doesn't add any extra dependencies, only
> >> makes
> >> it explicit.
> >>
> > it will be overcompensating for < 4.16 kernel recipes where this
> dependency
> > is not needed. it might be a legit dependency for another component, that
> > doesn't stage this package in kernel recipe-specific sysroot but this
> change
> > will do that. So its not completely innocent change.
>
> I'd be in favor of matching the version and adding it if it is a 4.16
> or newer kernel. Adding for prior versions seems wrong for me.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c05ddb2c264f20565a6a49b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m OK with adding bison-native for all versions.<div>=
<br></div><div>When we added bc-native 2+ years ago:</div><div><div>commit =
c067e52cffe002de3b39aa1bced308dd532859c1</div><div>Author: Alejandro Hernan=
dez &lt;<a href=3D"mailto:alejandro.hernandez@linux.intel.com">alejandro.he=
rnandez@linux.intel.com</a>&gt;</div><div>Date:=C2=A0 =C2=A0Thu Oct 2 15:33=
:23 2014 -0500</div><div><br></div><div>=C2=A0 =C2=A0 kernel: Added bc-nati=
ve as DEPENDS</div><div>=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 The mak=
efile checks for bc during for compilation</div></div><div><br></div><div>i=
t was also needed only for the latest kernel and we didn&#39;t make it cond=
itional on the kernel version. Now with RSS it&#39;s even less dangerous as=
 the bison-native will appear only in kernel&#39;s RSS and as Denys said it=
&#39;s quite common dependency so many components pull it into RSS anyway.<=
/div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue=
, Feb 20, 2018 at 3:53 PM, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D=
"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador=
@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div class=3D"HOEnZb"><div class=3D"h5">On Tue, Feb 20, 2018 at 7:10 AM, Khe=
m Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; =
wrote:<br>
&gt; On 2/19/18 5:20 PM, Denys Dmytriyenko wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Feb 19, 2018 at 09:36:22PM -0300, Otavio Salvador wrote:<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Mon, Feb 19, 2018 at 8:54 PM, Denys Dmytriyenko &lt;<a href=
=3D"mailto:denis@denix.org">denis@denix.org</a>&gt;<br>
&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com=
">denys@ti.com</a>&gt;<br>
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
ys@ti.com">denys@ti.com</a>&gt;<br>
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
<span class=3D"im HOEnZb"><br>
--<br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" value=3D"+555399817854=
">+55 (53) 9981-7854</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile: <=
a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+13479039750">+1 (347) =
903-9750</a><br>
</span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c05ddb2c264f20565a6a49b--
