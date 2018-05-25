Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 218D374A16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 00:11:16 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id j1-v6so6143281wrm.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 17:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8PjTX5b8vRB8Gl6CkwLCwVYo/K7U+a9Icr1gAOxhfKw=;
	b=ONCs2s9zJAwfYlHwrcee5+YP61olAY8XLlcdgpTDXYROjQzQeBVXvnQqtbuPxq8FjX
	rx3AGAIHkyKoXE8i58P94jvqrRJui/h90/UiwBwXEoic2dRBNVBeBHUD0cXvi4/+JSYy
	PoLPKhT3iSD43Cu+nJcHgf9iFdtqUyHircqCzqVeYxrTvuHR6wqro7ohRCXbKXnDfbsC
	Q62aq6/EiNl63Q8zfY2xp8qFF2h1V1/RCqyTkXgXg39LrHIK7uq8Bq5ga28S1ZFkBU0y
	2r7rlreK2ydFvKF93sUiKtwOhcmaDiJTUEAUqg8DoPC2gaFSy7BY4LffsJ+MTxyXuAI3
	45Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8PjTX5b8vRB8Gl6CkwLCwVYo/K7U+a9Icr1gAOxhfKw=;
	b=YfQudQfEayWLP1WH6JsNS6pnVtO/4KWZduReew4ccbbpX7aFWCx7cSUhp9JbRLiVdI
	spghDpYbue+NE85Snpe+0nDZh7jDaYDerdeL5j2c0iT2aAJuZpJkyBfn9VHWGiP40vCt
	Sh7M5JCSAq5TLkdOCxb0CHHGyrGUi1QSHmnI0HUIvfu2UJpGkfn9ZanCKom2bgR49L8+
	DH02DUf4+btiCtqnIf/+u1k6HMehHC9arkYt1QmpNJB6qWYxEiNhdLNojeWLSnwoL2pg
	fcKsdWHLrmZ2fZbchkg07mJGBRyc3nKUwfAi4cH7R83vVGumktMLxnMkQCtIJBtVJn2Q
	B2eQ==
X-Gm-Message-State: ALKqPwdmYK/bp7YU97n6Nah4z3B9Mk7uDydRZdpjFv1/MAPkX0lo3SJY
	gKZy4ZR/gvWDjxpmX3PUgnD0zxS3t4O8ScWkcpY=
X-Google-Smtp-Source: ADUXVKJ9SZwAQqO71l4e4dzBzuRFNKwfPuiCgktMC2P6AS0CX91kZi3dlfuL3E/w8RkRgIAtBH3uc9jxC0J6ZL8ZZeo=
X-Received: by 2002:a19:14ca:: with SMTP id 71-v6mr66476lfu.126.1527207077527; 
	Thu, 24 May 2018 17:11:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.51.7 with HTTP; Thu, 24 May 2018 17:11:17 -0700 (PDT)
In-Reply-To: <CAKmqyKP-zowK6tSQkRTZOwbic1xg-7cGQiayha2BXHZ2v1UO+g@mail.gmail.com>
References: <20180502204907.137185-1-alistair.francis@wdc.com>
	<53bbe673-b84c-e155-7edf-c497b90b7ad1@intel.com>
	<CADkTA4OEpSL+grTWxPKomoA0s2S8V6KuNfu3+kJUmy1zHCaTTg@mail.gmail.com>
	<CAKmqyKP-zowK6tSQkRTZOwbic1xg-7cGQiayha2BXHZ2v1UO+g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 May 2018 20:11:17 -0400
Message-ID: <CADkTA4OjD_i5zcRQcH+pX=RTe=fqcUBiaCa4PXUhGqKYq3Dp6A@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-kernel/linux: Enable NUMA Kconfig from MACHINE_FEATURES
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
X-List-Received-Date: Fri, 25 May 2018 00:11:17 -0000
Content-Type: multipart/alternative; boundary="0000000000005ac658056cfc9bad"

--0000000000005ac658056cfc9bad
Content-Type: text/plain; charset="UTF-8"

On Thu, May 24, 2018 at 7:30 PM, Alistair Francis <alistair23@gmail.com>
wrote:

> On Thu, May 24, 2018 at 5:27 AM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> >
> >
> > On Thu, May 24, 2018 at 5:45 AM, Anuj Mittal <anuj.mittal@intel.com>
> wrote:
> >>
> >> On 05/03/2018 04:49 AM, Alistair Francis wrote:
> >> > +KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES',
> >> > 'numa', 'features/numa/numa.scc', '', d)}"
> >>
> >> Isn't this enough to pull in the required configuration from
> >>
> >>
> >> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-
> cache/tree/features/numa/numa.cfg
> >>
> >> If numa.cfg is missing something in yocto-kernel-cache that should be
> >> applied to all machines, perhaps these configurations should be added
> >> there?
> >
> >
> > Correct.
> >
> > I wanted to run with this patch myself before sending feedback. In fact,
> I
> > think that the kernel-cache
> > numa config fragments are being used anyway. But since I'm traveling, I
> > haven't gotten to that yet.
> >
> > Alistair: if you drop your fragment, are you actually getting a failure
> > during the kernel meta data task ?
>
> From memory I didn't see a failure, but I didn't see the NUMA support
> in the kernel.
>
> I'll run a test now.
>
>
Thanks.

I'm back from travel now, and will have a look on Friday as well.

Bruce



> Alistair
>
> >
> > I will resubmit my patches shortly that allow any kernel to leverage the
> > shared config frags, so
> > using the ones in the kernel cache definitely makes sense.
> >
> > Bruce
> >
> >
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at
> > its end"
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--0000000000005ac658056cfc9bad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, May 24, 2018 at 7:30 PM, Alistair Francis <span dir=3D"ltr">&lt=
;<a href=3D"mailto:alistair23@gmail.com" target=3D"_blank">alistair23@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D=
"">On Thu, May 24, 2018 at 5:27 AM, Bruce Ashfield<br>
&lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a=
>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Thu, May 24, 2018 at 5:45 AM, Anuj Mittal &lt;<a href=3D"mailto:anu=
j.mittal@intel.com">anuj.mittal@intel.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 05/03/2018 04:49 AM, Alistair Francis wrote:<br>
&gt;&gt; &gt; +KERNEL_FEATURES_append =3D &quot; ${@bb.utils.contains(&#39;=
MACHINE_<wbr>FEATURES&#39;,<br>
&gt;&gt; &gt; &#39;numa&#39;, &#39;features/numa/numa.scc&#39;, &#39;&#39;,=
 d)}&quot;<br>
&gt;&gt;<br>
&gt;&gt; Isn&#39;t this enough to pull in the required configuration from<b=
r>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel=
-cache/tree/features/numa/numa.cfg" rel=3D"noreferrer" target=3D"_blank">ht=
tps://git.yoctoproject.org/<wbr>cgit/cgit.cgi/yocto-kernel-<wbr>cache/tree/=
features/numa/numa.<wbr>cfg</a><br>
&gt;&gt;<br>
&gt;&gt; If numa.cfg is missing something in yocto-kernel-cache that should=
 be<br>
&gt;&gt; applied to all machines, perhaps these configurations should be ad=
ded<br>
&gt;&gt; there?<br>
&gt;<br>
&gt;<br>
&gt; Correct.<br>
&gt;<br>
&gt; I wanted to run with this patch myself before sending feedback. In fac=
t, I<br>
&gt; think that the kernel-cache<br>
&gt; numa config fragments are being used anyway. But since I&#39;m traveli=
ng, I<br>
&gt; haven&#39;t gotten to that yet.<br>
&gt;<br>
&gt; Alistair: if you drop your fragment, are you actually getting a failur=
e<br>
&gt; during the kernel meta data task ?<br>
<br>
</span>From memory I didn&#39;t see a failure, but I didn&#39;t see the NUM=
A support<br>
in the kernel.<br>
<br>
I&#39;ll run a test now.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></blockquo=
te><div><br></div><div>Thanks.=C2=A0</div><div><br></div><div>I&#39;m back =
from travel now, and will have a look on Friday as well.</div><div><br></di=
v><div>Bruce</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><span class=3D"HOEnZb"><font color=3D"#888888">
Alistair<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; I will resubmit my patches shortly that allow any kernel to leverage t=
he<br>
&gt; shared config frags, so<br>
&gt; using the ones in the kernel cache definitely makes sense.<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait thee at<br>
&gt; its end&quot;<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--0000000000005ac658056cfc9bad--
