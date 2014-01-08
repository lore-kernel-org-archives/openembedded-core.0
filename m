Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 62E436D1AF;
	Wed,  8 Jan 2014 21:14:16 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id vb8so2333799obc.21
	for <multiple recipients>; Wed, 08 Jan 2014 13:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=WEAM4xOYqUz8ZWPzpLe5FD7PL85NQBKfs4ljYP4RzVI=;
	b=Ng00PusjhkpEpDqk3AUthmgaQ9Hta8+mq1iGEi7+3obiHv8y1chjuNIeZJgVhNoCmi
	WmIrRIirYntBcy5ZJhnotZ27K6aZ68IbHQK2pj3miMtcxtg5nKb9fPcFikp7pYK+AQ4C
	3d7rqvynJpeuLuNkeZBtk5j7f7TKAVWM10OsG0zY7hwDaSOQ1TTh2D1SOmJlat/TR/kT
	NIKd66HSraei/2YV/ZmfXSHO6e9M03NJkyKpQJuEXSLwthI1ljoAcIyCvPSJw5RjDPFu
	r/gw03JTVa4jxwB5REYe21V5jA0lCxcB+T7BOs6HIatfx4Un5YRjAw7MEH2TSNUZBHyC
	5b0g==
MIME-Version: 1.0
X-Received: by 10.60.165.36 with SMTP id yv4mr3481653oeb.55.1389215657057;
	Wed, 08 Jan 2014 13:14:17 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 8 Jan 2014 13:14:16 -0800 (PST)
In-Reply-To: <1389200502.6899.112.camel@ted>
References: <CAJTo0LZsBfxGm=OJPa++egDjL6L0ZABMebTtTr_Bmw_TdQrohg@mail.gmail.com>
	<52B8DECA.6060704@balister.org>
	<CAJTo0LaEgLWZHk34e-_-+z69Zw3J+S1zGFFJAONjfYBDQ1TehQ@mail.gmail.com>
	<1389200502.6899.112.camel@ted>
Date: Wed, 8 Jan 2014 19:14:16 -0200
X-Google-Sender-Auth: 6bJV1fXHbiFeKKY5xR4pKoepTQc
Message-ID: <CAP9ODKo1TYqkrZWxeirPO9sYOorTLB9DMQPb5k8=1rKpNx96wg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Poky Project <poky@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Piglit in Poky
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
X-List-Received-Date: Wed, 08 Jan 2014 21:14:17 -0000
Content-Type: multipart/alternative; boundary=047d7b3a8674c164ea04ef7bf90c

--047d7b3a8674c164ea04ef7bf90c
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 8, 2014 at 3:01 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2014-01-08 at 16:09 +0000, Burton, Ross wrote:
> > Hi,
> >
> > Despite a good start this thread got rapidly hijacked, so let's try
> again!
> >
> > On 24 December 2013 01:09, Philip Balister <philip@balister.org> wrote:
> > >> 1) Move piglit and deps to oe-core.  Piglit is for QA purposes only
> > >> and pushes the boundaries of "core platform".  In a sense this is a
> > >> repeat of the discussion we had with Midori...  does oe-core contain
> > >> everything needed to sufficiently exercise the core components it
> > >> ships or not?
> > >
> > > I expect Richard will push back on this, and I would support him here.
> >
> > Probably best to let Richard speak for himself here. :)
>
> :)
>
> I have to admit I'm leaning towards pulling in the 4 recipes we need
> since the win is we get to test the GL stacks.
>
> We do support graphics in the core, we also do particularly badly at
> testing it. That is something I think we need to change. piglit lets us
> do that and its not like it has a significant number of dependencies.
> Having a couple more python modules to test the python stack probably
> isn't a bad idea ether. We pruned quite a number of recipes out, this is
> a case where we can add a small number for a significant win.
>
> > >> 2) Add piglit and deps to meta-yocto.  Probably a new layer called
> > >> meta-yocto-qa (or similar) because the Yocto Compatible guidelines
> > >> forbid mixing distribution policy and recipes.  We'd need to sync
> > >> meta-yocto-qa with the pieces of meta-oe that we want somehow, but
> > >> that's our problem.
> > >
> > > So meta-yocto is right out. I'm a user of numpy, and I certainly do not
> > > want to include something called meta-yocto-qa just to pick up numpy.
> >
> > Right, so my point with the syncing was that this meta-yocto-qa layer
> > would be a copy of recipes from other places through combo-layer, and
> > would be clearly marked as such.
> >
> > Reviewing the options:
> >
> > 1) Add python-mako, python-numpy, waffle and piglit to oe-core, for
> > all BSPs to use.
> > 2) Add python-mako, python-numpy, waffle and piglit to meta-yocto
> > (effectively read-only clones with combo-layer, maintained in meta-oe
> > still) for Poky to use.
> > 3) Add meta-python layer to Poky, and waffle/piglit to meta-yocto
> > (read-only clones) for Poky to use.
> >
> > Paul raises a good point about other BSPs potentially using Piglit to
> > test their GL stacks.  Do any other BSPs test their GL integration,
> > and if so what tooling to they use?  I'm only pushing for Piglit
> > because it's what the Intel driver team use to test Mesa, but if
> > nobody else wants to use it then that's an argument for keeping it in
> > Poky (or even cloning it into meta-intel?).
>
> I'm in favour of 1). If there is significant community push back against
> that, I will go for 4) a kind of hybrid of 2/3 which is:
>
> 4) use combo-layer filtering technology to import just the files we want
> from the meta-oe repo into the poky repo.
>
> The plus of 4) is that it would showcase a usage of combo-layer which is
> currently underused and IMO should be used more. Equally, I think 4)
> might not be liked by some. If would however fulfil the needs the Yocto
> Project has in this area.
>
> I would still prefer 1) though.
>

I prefer 1 too.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7b3a8674c164ea04ef7bf90c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jan 8, 2014 at 3:01 PM, Richard Purdie <span dir=3D"ltr">&l=
t;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">r=
ichard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, 2014-01-08 at 16:0=
9 +0000, Burton, Ross wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; Despite a good start this thread got rapidly hijacked, so let&#39;s tr=
y again!<br>
&gt;<br>
&gt; On 24 December 2013 01:09, Philip Balister &lt;<a href=3D"mailto:phili=
p@balister.org">philip@balister.org</a>&gt; wrote:<br>
&gt; &gt;&gt; 1) Move piglit and deps to oe-core. =A0Piglit is for QA purpo=
ses only<br>
&gt; &gt;&gt; and pushes the boundaries of &quot;core platform&quot;. =A0In=
 a sense this is a<br>
&gt; &gt;&gt; repeat of the discussion we had with Midori... =A0does oe-cor=
e contain<br>
&gt; &gt;&gt; everything needed to sufficiently exercise the core component=
s it<br>
&gt; &gt;&gt; ships or not?<br>
&gt; &gt;<br>
&gt; &gt; I expect Richard will push back on this, and I would support him =
here.<br>
&gt;<br>
&gt; Probably best to let Richard speak for himself here. :)<br>
<br>
</div>:)<br>
<br>
I have to admit I&#39;m leaning towards pulling in the 4 recipes we need<br=
>
since the win is we get to test the GL stacks.<br>
<br>
We do support graphics in the core, we also do particularly badly at<br>
testing it. That is something I think we need to change. piglit lets us<br>
do that and its not like it has a significant number of dependencies.<br>
Having a couple more python modules to test the python stack probably<br>
isn&#39;t a bad idea ether. We pruned quite a number of recipes out, this i=
s<br>
a case where we can add a small number for a significant win.<br>
<div class=3D"im"><br>
&gt; &gt;&gt; 2) Add piglit and deps to meta-yocto. =A0Probably a new layer=
 called<br>
&gt; &gt;&gt; meta-yocto-qa (or similar) because the Yocto Compatible guide=
lines<br>
&gt; &gt;&gt; forbid mixing distribution policy and recipes. =A0We&#39;d ne=
ed to sync<br>
&gt; &gt;&gt; meta-yocto-qa with the pieces of meta-oe that we want somehow=
, but<br>
&gt; &gt;&gt; that&#39;s our problem.<br>
&gt; &gt;<br>
&gt; &gt; So meta-yocto is right out. I&#39;m a user of numpy, and I certai=
nly do not<br>
&gt; &gt; want to include something called meta-yocto-qa just to pick up nu=
mpy.<br>
&gt;<br>
&gt; Right, so my point with the syncing was that this meta-yocto-qa layer<=
br>
&gt; would be a copy of recipes from other places through combo-layer, and<=
br>
&gt; would be clearly marked as such.<br>
&gt;<br>
&gt; Reviewing the options:<br>
&gt;<br>
&gt; 1) Add python-mako, python-numpy, waffle and piglit to oe-core, for<br=
>
&gt; all BSPs to use.<br>
&gt; 2) Add python-mako, python-numpy, waffle and piglit to meta-yocto<br>
&gt; (effectively read-only clones with combo-layer, maintained in meta-oe<=
br>
&gt; still) for Poky to use.<br>
&gt; 3) Add meta-python layer to Poky, and waffle/piglit to meta-yocto<br>
&gt; (read-only clones) for Poky to use.<br>
&gt;<br>
&gt; Paul raises a good point about other BSPs potentially using Piglit to<=
br>
&gt; test their GL stacks. =A0Do any other BSPs test their GL integration,<=
br>
&gt; and if so what tooling to they use? =A0I&#39;m only pushing for Piglit=
<br>
&gt; because it&#39;s what the Intel driver team use to test Mesa, but if<b=
r>
&gt; nobody else wants to use it then that&#39;s an argument for keeping it=
 in<br>
&gt; Poky (or even cloning it into meta-intel?).<br>
<br>
</div>I&#39;m in favour of 1). If there is significant community push back =
against<br>
that, I will go for 4) a kind of hybrid of 2/3 which is:<br>
<br>
4) use combo-layer filtering technology to import just the files we want<br=
>
from the meta-oe repo into the poky repo.<br>
<br>
The plus of 4) is that it would showcase a usage of combo-layer which is<br=
>
currently underused and IMO should be used more. Equally, I think 4)<br>
might not be liked by some. If would however fulfil the needs the Yocto<br>
Project has in this area.<br>
<br>
I would still prefer 1) though.<br></blockquote><div><br></div><div>I prefe=
r 1 too.=A0</div></div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http=
://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =
=A0 =A0 =A0 =A0<a href=3D"http://code.ossystems.com.br" target=3D"_blank">h=
ttp://code.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--047d7b3a8674c164ea04ef7bf90c--
