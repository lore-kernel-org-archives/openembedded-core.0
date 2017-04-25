Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0576A72F60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 01:06:57 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id y33so23022320qta.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 18:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=279G7b33gQUV4fbKOuJcwPJ0AgAEUu4RBOjKQIDEDC4=;
	b=KuQQfaF3i1wdHL8An/GshxyDTv5biJfMwZKZJAk3Uxo8hgCnnLopV3W0YVTt7MX/Gw
	Bp0L/O2BI/jr81lEJsWGXNXP+0ivXviMZ5O6H5cnMwAivk4bYsflpjXXUcdscCmitHIi
	Zeb21oyTG8hrZGFLsCQmI0CC2eT0ZDJKa/zX0pviYG3T/ozlUBonKfGHC6yLlxYll6pC
	D0qYdiuKkZb6VnNhcgZvXLiItVkbUVsuys6TKj/iIo0lWwSzsyjrgud8tcQBf8SQZB5t
	rlpCmBbl14upp1ZocfRTyx4YG3BBiNJG+vnK3bqk1ANgOt8mqELTdWUDnz3gCLILq8Q2
	fDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=279G7b33gQUV4fbKOuJcwPJ0AgAEUu4RBOjKQIDEDC4=;
	b=s5G2D0AjwgC1+goh/+NVbAKf9hers17Mb1fyRFBu50pQJJaLnR0GHFD+s2kk05CXiF
	xdYNu3QXcF/ese1T6Z2md7bC3gy6Ml+ZgfH5F9I9MHJLGVxiV1RGLAKlxqnRhz1NlGLO
	eBNTtOnAQuI6yIJJ1ffq0obmcAdB9F64mdDktoFtQZVwzRuI99UqieZGqQ9/qCL4gGNb
	2ExoWVWju2N/D0eqH6PpfydY1u3aJPYYcpxnhGA+NmDXf0Vi8+AKkepdeOd5RH573OPS
	XUi91jGH59phSs/FcT/xjHGxiaJ6IIShnTdww8ZoWSp5JN1xlo52TObuWQrtTDWB8I4u
	uO7A==
X-Gm-Message-State: AN3rC/7zWcgiuGe4pZmIkpZyAiHdTgC2zZD3cdY2XhamrAuqnMOMny7i
	s2jneor3itlsfEw9zhVlWtD1TDvhWg==
X-Received: by 10.200.2.168 with SMTP id p40mr27414011qtg.18.1493082417798;
	Mon, 24 Apr 2017 18:06:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.136.253 with HTTP; Mon, 24 Apr 2017 18:06:57 -0700 (PDT)
In-Reply-To: <1493069228.19076.121.camel@linuxfoundation.org>
References: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
	<bd7ec72b-fe78-65bd-7d25-65e51a0aa30e@gmail.com>
	<CADkTA4MQ0CToP1h_s5muJt8v-bNuCr9wtD4t+sfq9ThsZZ-AWg@mail.gmail.com>
	<CADkTA4M6OS+sxsueSzdokxuo+AaTTjYrir0uPPazWsMP5dpxFg@mail.gmail.com>
	<CADkTA4P43BsLYpdDR0r7eAGkEc97hB-pQyf431-Nrtb8YUOUeg@mail.gmail.com>
	<CA+chaQeT4kDPVi4TvUaUuHzfVdDAuEtOqOMByi=vb6Onri=nqA@mail.gmail.com>
	<CADkTA4Nm71DESZodfrGKH1bqLT0o2MSn7nmgcFtkLJu57kk_=A@mail.gmail.com>
	<CADkTA4PGVyJ+b2S_77yJS6f0f3osM-yYonE55Khjk-k0oF-j-Q@mail.gmail.com>
	<1493069228.19076.121.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 24 Apr 2017 21:06:57 -0400
Message-ID: <CADkTA4M1m5RLNXyRjyyybD+jNzZbQqkrW+SDtjHu3dP28rb-aA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto.do_validate_branches failing since last oe-core update
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
X-List-Received-Date: Tue, 25 Apr 2017 01:06:59 -0000
Content-Type: multipart/alternative; boundary=f4030435bdb4226735054df357e6

--f4030435bdb4226735054df357e6
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 24, 2017 at 5:27 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2017-04-24 at 15:56 -0400, Bruce Ashfield wrote:
> >
> >
> > On Mon, Apr 24, 2017 at 9:54 AM, Bruce Ashfield <bruce.ashfield@gmail
> > .com> wrote:
> > >
> > >
> > > On Mon, Apr 24, 2017 at 9:39 AM, Martin Jansa <martin.jansa@gmail.c
> > > om> wrote:
> > > > I'm still seeing this with your "kernel-yocto/kern-tools: fix
> > > > do_validate_branches clean stage" patch applied:
> > > >
> > > >
> > > > | DEBUG: Executing shell function do_patch
> > > > | ERROR: Could not apply patches for qemux86.
> > > > | ERROR: Patch failures can be resolved in the linux source
> > > > directory work-shared/qemux86/kernel-source)
> > > > |
> > > > | [ERROR] Can't find patch dir at .kernel-meta/
> > > > | usage: kgit s2q
> > > > | ERROR: Function failed: do_patch (log file is located at linux-
> > > > yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-
> > > > r0/temp/log.do_patch.44497)
> > > > NOTE: recipe linux-yocto-
> > > > 1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0: task do_patch:
> > > > Failed
> > > >
> > > Well bugger.
> > >
> > > I'll start another set of builds.
> > >
> > I had this on a build loop all day without any luck. I also enlisted
> > a few others around the office
> > to build master and see if they could cause an issue .. again, no
> > luck.
> >
> > Richard/Ross: are you seeing this same thing on the autobuilder ?
> >
> > There's some incantation or config that I'm missing, I assume this is
> > a straight qemux86 config
> > with a bitbake of something like core-image-minimal ?
>
> We're not seeing this on the autobuilders. I do suspect something in
> the handling of extra patches or cfg fragments from SRC_URI if I had to
> guess. That certainly was the trigger last time I saw this.
>

Yah, that's the kicker, I'm still carrying your patch for binfmt_elf, and I
added two of my own
+ config fragments, and I can't trigger anything.

Bruce

gmail garbled and and paste below:

-------------------


% git describe

v4.10.9-378-gff739b66b0bc


% git whatchanged

commit ff739b66b0bc5cd65bcc26d4556736309f4b180c

Author: Bruce Ashfield <bruce.ashfield@windriver.com>

Date:   Fri Jul 8 11:32:11 2016 -0400


    makefile: comment two


    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>


:100644 100644 a027ca58d9ff... 2402e34170b5... M        Makefile


commit 238fd7383ebb99f080febdfb31d680b43fbb7438

Author: Bruce Ashfield <bruce.ashfield@windriver.com>

Date:   Fri Jul 8 11:31:34 2016 -0400


    makefile: comment one



    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>


:100644 100644 3d994e6df89a... a027ca58d9ff... M        Makefile


commit 5376026f981849bee7d1789c67b81e1e758ef6f0

Author: invalid_git config <unknown@unknown>

Date:   Mon Apr 24 20:48:24 2017 -0400


    The kernel makes the assumption that all PT_LOAD sections are
continous, at

    least to the point where PT_PHDR is contained. If there are holes
between

    the PT_LOAD sections, the calculation load_addr + exec->e_phoff fails to

    correctly locate the phdrs.



    This change notices where phdrs are located in some other PT_LOAD
section

    other than the first one and corrects the offsets used.



    This is useful where userspace wants to rewrite elf files but can't
guarantee

    that all PT_LOAD sections are continuous without holes without
potentially

    creating large holes in the binaries. I was unable to find any ELF spec

    which requires continuous PT_LOAD sections or that PT_PHDR be in the
first

    PT_LOAD section.



    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


:100644 100644 422370293cfd... 392dab375b63... M        fs/binfmt_elf.c
-------------------


>
> Cheers,
>
> Richard
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f4030435bdb4226735054df357e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Apr 24, 2017 at 5:27 PM, Richard Purdie <span dir=3D"ltr">&lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Mon, 2017-04-24 at 15:56 -0400, Bruce A=
shfield wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Apr 24, 2017 at 9:54 AM, Bruce Ashfield &lt;bruce.ashfield@gma=
il<br>
<div><div class=3D"gmail-h5">&gt; .com&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Apr 24, 2017 at 9:39 AM, Martin Jansa &lt;martin.jansa@gm=
ail.c<br>
&gt; &gt; om&gt; wrote:<br>
&gt; &gt; &gt; I&#39;m still seeing this with your &quot;kernel-yocto/kern-=
tools: fix<br>
&gt; &gt; &gt; do_validate_branches clean stage&quot; patch applied:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; | DEBUG: Executing shell function do_patch<br>
&gt; &gt; &gt; | ERROR: Could not apply patches for qemux86.<br>
&gt; &gt; &gt; | ERROR: Patch failures can be resolved in the linux source<=
br>
&gt; &gt; &gt; directory work-shared/qemux86/kernel-<wbr>source)<br>
&gt; &gt; &gt; |=C2=A0<br>
&gt; &gt; &gt; | [ERROR] Can&#39;t find patch dir at .kernel-meta/<br>
&gt; &gt; &gt; | usage: kgit s2q<br>
&gt; &gt; &gt; | ERROR: Function failed: do_patch (log file is located at l=
inux-<br>
&gt; &gt; &gt; yocto/1_4.10.9+gitAUTOINC+<wbr>ad2e885015_fe0fb8da3d-<br>
&gt; &gt; &gt; r0/temp/log.do_patch.44497)<br>
&gt; &gt; &gt; NOTE: recipe linux-yocto-<br>
&gt; &gt; &gt; 1_4.10.9+gitAUTOINC+<wbr>ad2e885015_fe0fb8da3d-r0: task do_p=
atch:<br>
&gt; &gt; &gt; Failed<br>
&gt; &gt; &gt;<br>
&gt; &gt; Well bugger.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ll start another set of builds.<br>
&gt; &gt;<br>
&gt; I had this on a build loop all day without any luck. I also enlisted<b=
r>
&gt; a few others around the office<br>
&gt; to build master and see if they could cause an issue .. again, no<br>
&gt; luck.<br>
&gt;<br>
&gt; Richard/Ross: are you seeing this same thing on the autobuilder ?<br>
&gt;<br>
&gt; There&#39;s some incantation or config that I&#39;m missing, I assume =
this is<br>
&gt; a straight qemux86 config<br>
&gt; with a bitbake of something like core-image-minimal ?<br>
<br>
</div></div>We&#39;re not seeing this on the autobuilders. I do suspect som=
ething in<br>
the handling of extra patches or cfg fragments from SRC_URI if I had to<br>
guess. That certainly was the trigger last time I saw this.<br></blockquote=
><div><br></div><div>Yah, that&#39;s the kicker, I&#39;m still carrying you=
r patch for binfmt_elf, and I added two of my own</div><div>+ config fragme=
nts, and I can&#39;t trigger anything.</div><div><br></div><div>Bruce</div>=
<div><br></div><div>gmail garbled and and paste below:</div><div><br><div>-=
------------------</div></div><div><br></div><div><br></div><div>% git desc=
ribe=C2=A0<br></div><div>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">v4.10.9-378-gff739b66b0bc</s=
pan></p></div><div>







<p class=3D"gmail-p1"><span class=3D"gmail-s1"><br></span></p><p class=3D"g=
mail-p1"><span class=3D"gmail-s1">% git whatchanged</span></p><p class=3D"g=
mail-p1"><span class=3D"gmail-s1">commit ff739b66b0bc5cd65bcc26d4556736309f=
4b180c</span></p><p class=3D"gmail-p1">Author: Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@windriver.com">bruce.ashfield@windriver.com</a>&g=
t;</p><p class=3D"gmail-p1">Date: =C2=A0 Fri Jul 8 11:32:11 2016 -0400</p>
<p class=3D"gmail-p3"><span class=3D"gmail-s1"></span><br></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 makefile: comm=
ent two</span></p>
<p class=3D"gmail-p3"><br></p><p class=3D"gmail-p3">=C2=A0 =C2=A0 Signed-of=
f-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windriver.com">br=
uce.ashfield@windriver.com</a>&gt;<br></p>
<p class=3D"gmail-p3"><span class=3D"gmail-s1"></span><br></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">:100644 100644 a027ca58d9ff.=
.. 2402e34170b5... M=C2=A0 =C2=A0 =C2=A0 =C2=A0 Makefile</span></p>
<p class=3D"gmail-p3"><span class=3D"gmail-s1"></span><br></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">commit 238fd7383ebb99f080feb=
dfb31d680b43fbb7438</span></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">Author: Bruce Ashfield &lt;<=
a href=3D"mailto:bruce.ashfield@windriver.com">bruce.ashfield@windriver.com=
</a>&gt;</span></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">Date: =C2=A0 Fri Jul 8 11:31=
:34 2016 -0400</span></p>
<p class=3D"gmail-p3"><span class=3D"gmail-s1"></span><br></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 makefile: comm=
ent one</span></p>
<p class=3D"gmail-p3"><span class=3D"gmail-s1">=C2=A0=C2=A0 =C2=A0</span></=
p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 Signed-off-by:=
 Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windriver.com">bruce.a=
shfield@windriver.com</a>&gt;</span></p>
<p class=3D"gmail-p3"><span class=3D"gmail-s1"></span><br></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">:100644 100644 3d994e6df89a.=
.. a027ca58d9ff... M=C2=A0 =C2=A0 =C2=A0 =C2=A0 Makefile</span></p>
<p class=3D"gmail-p3"><span class=3D"gmail-s1"></span><br></p>
<p class=3D"gmail-p1"><span class=3D"gmail-s1">commit 5376026f981849bee7d17=
89c67b81e1e758ef6f0</span></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">Author: invalid_git config &=
lt;unknown@unknown&gt;</span></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">Date: =C2=A0 Mon Apr 24 20:4=
8:24 2017 -0400</span></p>
<p class=3D"gmail-p3"><span class=3D"gmail-s1"></span><br></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 The kernel mak=
es the assumption that all PT_LOAD sections are continous, at</span></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 least to the p=
oint where PT_PHDR is contained. If there are holes between</span></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 the PT_LOAD se=
ctions, the calculation load_addr + exec-&gt;e_phoff fails to</span></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 correctly loca=
te the phdrs.</span></p>
<p class=3D"gmail-p3"><span class=3D"gmail-s1">=C2=A0=C2=A0 =C2=A0</span></=
p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 This change no=
tices where phdrs are located in some other PT_LOAD section</span></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 other than the=
 first one and corrects the offsets used.</span></p>
<p class=3D"gmail-p3"><span class=3D"gmail-s1">=C2=A0=C2=A0 =C2=A0</span></=
p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 This is useful=
 where userspace wants to rewrite elf files but can&#39;t guarantee</span><=
/p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 that all PT_LO=
AD sections are continuous without holes without potentially</span></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 creating large=
 holes in the binaries. I was unable to find any ELF spec</span></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 which requires=
 continuous PT_LOAD sections or that PT_PHDR be in the first</span></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 PT_LOAD sectio=
n.</span></p>
<p class=3D"gmail-p3"><span class=3D"gmail-s1">=C2=A0=C2=A0 =C2=A0</span></=
p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 Signed-off-by:=
 Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">r=
ichard.purdie@linuxfoundation.org</a>&gt;</span></p>
<p class=3D"gmail-p3"><span class=3D"gmail-s1"></span><br></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">:100644 100644 422370293cfd.=
.. 392dab375b63... M=C2=A0 =C2=A0 =C2=A0 =C2=A0 fs/binfmt_elf.c</span></p><=
/div><div>-------------------</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--f4030435bdb4226735054df357e6--
