Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 743BE784F0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 22:10:49 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id v203so14348581vkv.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 15:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=92PCmAy5PzWsVxAqoLxmjHPGXExW13WD/GP2tobhyDA=;
	b=K/MWUyPfsfd+hlK27IIxexYgQaLkE4plQ0ZrOlOTQ/buml2oqkQkvD5mt/q7E+lcHe
	Ivb4mgh1MDUpE482QclMoRxH+YufCnNF/8jHx3nOmfrycBFI5b9/VHq2H9LF5S+sed68
	idV5pa5dn5Fs7NwIVDNC9M4dz1Q/OpX3DS5X8GHicUZhDmsDFTO6BJgdjlJd/kkm0hfc
	FaQpDp0mcr8hx09yM0LOBkhz8d3eC9qrBRmo+wBFVKHqWRKwhV5vXEQcOlLxf5IwW2W/
	zdsH+8oGA+T8TOlHz2SIyHecTBOaJlpaD4wJLUqSfPrxD4Qz2qKq0lqaewBCVI4Ss3vS
	bm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=92PCmAy5PzWsVxAqoLxmjHPGXExW13WD/GP2tobhyDA=;
	b=inn6kXVtJGlGARfBSDStYOrLTjZTdUicJHeG3JdyR+aQa1s/mLwNFmk2Z0cNapuL06
	eGP+gNCk7V2h2g92GZiLnlmkN57bxjeXkKZund3OxWLaB6mXSEBufv3unGAV60dJJdCO
	ApI6MrmmSdkrLai4lwPvYg1Adkyx+aHhHyYEb3ZI4jS+ByKh3GiJX/UFdBNGrpItP4NS
	jKnAdj81YznXv7aCTVea/RMec7GqECxuHg12ibpY/NyG3XP7LJPoC2BZzGfk0U3Lmu6m
	CjZ1MAPmgIRWhwp2draRoiECxUM+8hR0tnWElVb2U2Gv38dPHRX6N7u0GzscKc+hSfBr
	XUqA==
X-Gm-Message-State: AHPjjUhZQc+0MgPtbDD6Rq64tL5W8DBYiTb+ainsrwgLIzge6eJBtjOf
	XD7ZfQab0Fa698xHIjinZs67ZbaU3yqHHEj1FFg=
X-Google-Smtp-Source: AOwi7QCLgi5K5Jbrf5a1Tuas4mvspqkkkq4GnxL1csghYnkXgvkx0RIcbbBden7XqfZwwSbREzZOgRRWqCvB+Jf1jV0=
X-Received: by 10.31.213.68 with SMTP id m65mr11418345vkg.169.1505254251020;
	Tue, 12 Sep 2017 15:10:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Tue, 12 Sep 2017 15:10:50 -0700 (PDT)
In-Reply-To: <CAP9ODKppZhEhcLiXnf_+vLv+DURBwcLCH57EXC0NiaMfjkFmEQ@mail.gmail.com>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
	<CADkTA4NmzVka45pmP8Ts4hCR2piHXemWLfvex2=Ti0dYTxCr8A@mail.gmail.com>
	<CAP9ODKppZhEhcLiXnf_+vLv+DURBwcLCH57EXC0NiaMfjkFmEQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 12 Sep 2017 18:10:50 -0400
Message-ID: <CADkTA4OHZWU6M0V-6te_Mq5AQ57K3FPYwhPAYdL4auDM_5djDA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v8 00/13] Revamp the Go support
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
X-List-Received-Date: Tue, 12 Sep 2017 22:10:50 -0000
Content-Type: multipart/alternative; boundary="001a114eba1eedc88b05590550e7"

--001a114eba1eedc88b05590550e7
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 12, 2017 at 5:53 PM, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Tue, Sep 12, 2017 at 6:41 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> > On Tue, Sep 12, 2017 at 8:50 AM, Otavio Salvador <
> otavio@ossystems.com.br>
> > wrote:
> >>
> >> This improves the Go support on OE-Core.
> >>
> >> We are trying to port as much as possible work done by Matt on
> >> meta-golang back to OE-Core and also to avoid carrying old releases as
> >> there is no need to support more versions of Go toolchain.
> >>
> >> This fixes issues in existing support as well as add support for SDK
> >> generation which supports Go.
> >
> >
> > Testing against what has merged, and what are in these series is showing
> > that large
> > parts of the go applications that are used in meta-virt no longer work.
> Was
> > it the
> > intention of the re-work to not be compatible with existing users of the
> > language support ?
> >
> > Just curious, since I haven't seen this flagged in this context
> > (compatibility), but now we
> > have to fixup the layers before I branch to match the release .. and that
> > was unexpected.
>
> It does change things which can potentially break old recipes. That
> said, it is straightforward to fix for most recipes as they end being
> simpler.
>

ok, cool. I just didn't notice this went it first went in (that doesn't
mean it wasn't stated .. just that I missed it :)


>
> I volunteer to help if there is the need.
>

Right now some of the fixes are in flight, if the fixes get stuck, I'll
make sure to ping.

Thanks,

Bruce


>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114eba1eedc88b05590550e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Sep 12, 2017 at 5:53 PM, Otavio Salvador <span dir=3D"ltr">&lt;=
<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavi=
o.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><span class=3D"">On Tue, Sep 12, 2017 at 6:41 PM, Bruce Ashfield<b=
r>
&lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a=
>&gt; wrote:<br>
&gt; On Tue, Sep 12, 2017 at 8:50 AM, Otavio Salvador &lt;<a href=3D"mailto=
:otavio@ossystems.com.br">otavio@ossystems.com.br</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; This improves the Go support on OE-Core.<br>
&gt;&gt;<br>
&gt;&gt; We are trying to port as much as possible work done by Matt on<br>
&gt;&gt; meta-golang back to OE-Core and also to avoid carrying old release=
s as<br>
&gt;&gt; there is no need to support more versions of Go toolchain.<br>
&gt;&gt;<br>
&gt;&gt; This fixes issues in existing support as well as add support for S=
DK<br>
&gt;&gt; generation which supports Go.<br>
&gt;<br>
&gt;<br>
&gt; Testing against what has merged, and what are in these series is showi=
ng<br>
&gt; that large<br>
&gt; parts of the go applications that are used in meta-virt no longer work=
. Was<br>
&gt; it the<br>
&gt; intention of the re-work to not be compatible with existing users of t=
he<br>
&gt; language support ?<br>
&gt;<br>
&gt; Just curious, since I haven&#39;t seen this flagged in this context<br=
>
&gt; (compatibility), but now we<br>
&gt; have to fixup the layers before I branch to match the release .. and t=
hat<br>
&gt; was unexpected.<br>
<br>
</span>It does change things which can potentially break old recipes. That<=
br>
said, it is straightforward to fix for most recipes as they end being<br>
simpler.<br></blockquote><div><br></div><div>ok, cool. I just didn&#39;t no=
tice this went it first went in (that doesn&#39;t mean it wasn&#39;t stated=
 .. just that I missed it :)</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
<br>
I volunteer to help if there is the need.<br></blockquote><div><br></div><d=
iv>Right now some of the fixes are in flight, if the fixes get stuck, I&#39=
;ll make sure to ping.</div><div><br></div><div>Thanks,</div><div><br></div=
><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
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
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a114eba1eedc88b05590550e7--
