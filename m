Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5A64A61587
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 12:57:54 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id o6so3340347oag.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 04:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=WmH/m56XkAkR7ZCsQ9E0KU8G9OIeTWNxq6iIflr5DcQ=;
	b=LeH1hmfoVQZiTAf48beYOU3qgv7dm5st9pPoC8k9su9UMAHtj2+j9pdf6RVnyg7nFx
	e6c8qpmUvnaadVUk/cayjMcvRNUUWH+IYD55uf6i1lwkTQfH3653QhP0BEJoDR0d+RPl
	dUnUXlSMBAcIu0l7QRvlvwYJ2e/L5ojcpaXscUXTuufWWe5t87khvO+IqRWzJn2YcZMW
	vUNt8KPDnt1ZP5tKSmNnPK+pcOGZ8EAm7+VZiM5sLrwjEv3GX6mVkiLWicu5R5jLGFXj
	KutHQgKoGsKZXP9yX10JJ5ranBkV93fmlOOGO+1841XJ0rNglvN0f+3nM2VK126tWFvA
	LkSA==
MIME-Version: 1.0
X-Received: by 10.60.99.8 with SMTP id em8mr2214863oeb.8.1389272275116; Thu,
	09 Jan 2014 04:57:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 9 Jan 2014 04:57:55 -0800 (PST)
In-Reply-To: <3A545C98-5FEA-4527-BA0D-767FEE35DCC5@dominion.thruhere.net>
References: <52CC470A.9030302@linaro.org> <1759035.6JVm74GdRW@helios>
	<52CD9CAB.5020501@linaro.org> <3583228.liS9SqzWlO@helios>
	<20140109003251.GD3709@jama>
	<3A545C98-5FEA-4527-BA0D-767FEE35DCC5@dominion.thruhere.net>
Date: Thu, 9 Jan 2014 10:57:55 -0200
X-Google-Sender-Auth: 5kZQDdmhbbiRssS_WihtU4QAZRQ
Message-ID: <CAP9ODKoSkY7txLqK=n_kq=gdmv4Be4bLbQjP35B9q8Tu4FY2ew@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Qt in OE-core
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
X-List-Received-Date: Thu, 09 Jan 2014 12:57:55 -0000
Content-Type: multipart/alternative; boundary=047d7b33cad274680904ef892839

--047d7b33cad274680904ef892839
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Thu, Jan 9, 2014 at 4:32 AM, Koen Kooi <koen@dominion.thruhere.net>wrote:

>
> Op 9 jan. 2014, om 01:32 heeft Martin Jansa <martin.jansa@gmail.com> het
> volgende geschreven:
>
> > On Wed, Jan 08, 2014 at 11:21:08PM +0000, Paul Eggleton wrote:
> >>> In my opinion...
> >>>
> >>> Personally I would be in favour of removing GTK+ and the GNOME UI from
> >>> the core and putting them in their own layer for all the same reasons I
> >>> think Qt should be in its own layer:
> >>> - a "basic" image doesn't need them
> >>> - we can have different layers to track separate major releases (as
> with
> >>> qt3, qt4, and qt5)
> >>
> >> The trouble is, if you have no toolkit at all, how do you test that X
> still
> >> works properly? The selection we have provides a single unit allowing
> us to
> >> test the entire stack reasonably well without having to add anything
> else. I
> >> think that's a valuable thing to have.
> >
> > By testing oe-core + layer with X.
> >
> > Everybody else is using oe-core + couple of other layers, why do we need
> > to make oe-core testable with X _in single_ layer?
>
> I have never seen a good explanation for that
>
> > I'm not saying that oe-core should be tested with 30 layers like my
> > world build, but why cannot AB have special build which builds
> >
> > oe-core + meta-xorg + meta-gnome
> >
> > and runs some runtime QA tests on that and then some other build with
> >
> > oe-core + meta-python
> >
> > for piglit tests?
>
> And e.g. meta-xorg could live inside the oe-core git repo if additional
> git repos are too scary.


Everyone using OE-Core/Poky in real world end using many GIT repositories
so I don't think it is a problem.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7b33cad274680904ef892839
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Thu, Jan 9, 2014 at 4:32 AM, Koen Kooi <span dir=3D"ltr">&lt;<=
a href=3D"mailto:koen@dominion.thruhere.net" target=3D"_blank">koen@dominio=
n.thruhere.net</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
Op 9 jan. 2014, om 01:32 heeft Martin Jansa &lt;<a href=3D"mailto:martin.ja=
nsa@gmail.com">martin.jansa@gmail.com</a>&gt; het volgende geschreven:<br>
<div class=3D"im"><br>
&gt; On Wed, Jan 08, 2014 at 11:21:08PM +0000, Paul Eggleton wrote:<br>
&gt;&gt;&gt; In my opinion...<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Personally I would be in favour of removing GTK+ and the GNOME=
 UI from<br>
&gt;&gt;&gt; the core and putting them in their own layer for all the same =
reasons I<br>
&gt;&gt;&gt; think Qt should be in its own layer:<br>
&gt;&gt;&gt; - a &quot;basic&quot; image doesn&#39;t need them<br>
&gt;&gt;&gt; - we can have different layers to track separate major release=
s (as with<br>
&gt;&gt;&gt; qt3, qt4, and qt5)<br>
&gt;&gt;<br>
&gt;&gt; The trouble is, if you have no toolkit at all, how do you test tha=
t X still<br>
&gt;&gt; works properly? The selection we have provides a single unit allow=
ing us to<br>
&gt;&gt; test the entire stack reasonably well without having to add anythi=
ng else. I<br>
&gt;&gt; think that&#39;s a valuable thing to have.<br>
&gt;<br>
&gt; By testing oe-core + layer with X.<br>
&gt;<br>
&gt; Everybody else is using oe-core + couple of other layers, why do we ne=
ed<br>
&gt; to make oe-core testable with X _in single_ layer?<br>
<br>
</div>I have never seen a good explanation for that<br>
<div class=3D"im"><br>
&gt; I&#39;m not saying that oe-core should be tested with 30 layers like m=
y<br>
&gt; world build, but why cannot AB have special build which builds<br>
&gt;<br>
&gt; oe-core + meta-xorg + meta-gnome<br>
&gt;<br>
&gt; and runs some runtime QA tests on that and then some other build with<=
br>
&gt;<br>
&gt; oe-core + meta-python<br>
&gt;<br>
&gt; for piglit tests?<br>
<br>
</div>And e.g. meta-xorg could live inside the oe-core git repo if addition=
al git repos are too scary.</blockquote><div><br></div><div>Everyone using =
OE-Core/Poky in real world end using many GIT repositories so I don&#39;t t=
hink it is a problem.=A0</div>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.ossystem=
s.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--047d7b33cad274680904ef892839--
