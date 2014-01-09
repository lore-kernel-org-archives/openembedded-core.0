Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 97CBC61587
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 12:56:29 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id uy5so1234422obc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 04:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Qi7Z48z6WVb30UupOx0Z/LxaaSueG17gPa/OZcIztCI=;
	b=ZJt9Bw3PMTO/Huk3EAdDam7kdsvSgSv+nxc8re4PyDoZpwEP2d0ykKnDJLjcM4puvD
	V1PbifGk+VBiMJmh+rjmFvNl+AIJWk5FqIBqsSqoRwLWC1JS/uonL/vzk8LiDy56rwqv
	+TKE3jA/Jkh3ljx6oEbzzLZcx2TPcHCMBibZWpKEPMXjbNetR4siHaVWtGZPzA2P7vP5
	FbBGWs9GQlYA9FR2LS5ItR7T6CulKI5easfqzogavhDTJ+SFv/Tt+ntDfP8TjUXy4Xha
	vDzzJ2rKA2rp4Xqp/1ECjnjGAcUtBcrCeNzWj/yvA00S44uOntXFnhMh9XUquhC/A8no
	oVCQ==
MIME-Version: 1.0
X-Received: by 10.182.117.195 with SMTP id kg3mr2093562obb.17.1389272190314;
	Thu, 09 Jan 2014 04:56:30 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 9 Jan 2014 04:56:30 -0800 (PST)
In-Reply-To: <20140109003251.GD3709@jama>
References: <52CC470A.9030302@linaro.org> <1759035.6JVm74GdRW@helios>
	<52CD9CAB.5020501@linaro.org> <3583228.liS9SqzWlO@helios>
	<20140109003251.GD3709@jama>
Date: Thu, 9 Jan 2014 10:56:30 -0200
X-Google-Sender-Auth: GR1jNRE7kf6GySrBetrLFliw5Nc
Message-ID: <CAP9ODKrSN+o_A75w_XzmVxFun6_TAUjBEzBLMoc3LrkLQPTpQg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 09 Jan 2014 12:56:29 -0000
Content-Type: multipart/alternative; boundary=089e0149c506666f8704ef8923f7

--089e0149c506666f8704ef8923f7
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 8, 2014 at 10:32 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Wed, Jan 08, 2014 at 11:21:08PM +0000, Paul Eggleton wrote:
> > > In my opinion...
> > >
> > > Personally I would be in favour of removing GTK+ and the GNOME UI from
> > > the core and putting them in their own layer for all the same reasons I
> > > think Qt should be in its own layer:
> > > - a "basic" image doesn't need them
> > > - we can have different layers to track separate major releases (as
> with
> > > qt3, qt4, and qt5)
> >
> > The trouble is, if you have no toolkit at all, how do you test that X
> still
> > works properly? The selection we have provides a single unit allowing us
> to
> > test the entire stack reasonably well without having to add anything
> else. I
> > think that's a valuable thing to have.
>
> By testing oe-core + layer with X.
>
> Everybody else is using oe-core + couple of other layers, why do we need
> to make oe-core testable with X _in single_ layer?
>
> I'm not saying that oe-core should be tested with 30 layers like my
> world build, but why cannot AB have special build which builds
>
> oe-core + meta-xorg + meta-gnome
>
> and runs some runtime QA tests on that and then some other build with
>
> oe-core + meta-python
>
> for piglit tests?
>
> Is it limitation of AB scripts for builds that they cannot fetch other
> layers so they need everything glued together with combo-layer?


I full agree here; this would be more in line of what we communicate to our
users and layers being a good and nice way to modularize the system...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e0149c506666f8704ef8923f7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Jan 8, 2014 at 10:32 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, Jan 08, 2014 at 11=
:21:08PM +0000, Paul Eggleton wrote:<br>
&gt; &gt; In my opinion...<br>
&gt; &gt;<br>
&gt; &gt; Personally I would be in favour of removing GTK+ and the GNOME UI=
 from<br>
&gt; &gt; the core and putting them in their own layer for all the same rea=
sons I<br>
&gt; &gt; think Qt should be in its own layer:<br>
&gt; &gt; - a &quot;basic&quot; image doesn&#39;t need them<br>
&gt; &gt; - we can have different layers to track separate major releases (=
as with<br>
&gt; &gt; qt3, qt4, and qt5)<br>
&gt;<br>
&gt; The trouble is, if you have no toolkit at all, how do you test that X =
still<br>
&gt; works properly? The selection we have provides a single unit allowing =
us to<br>
&gt; test the entire stack reasonably well without having to add anything e=
lse. I<br>
&gt; think that&#39;s a valuable thing to have.<br>
<br>
</div>By testing oe-core + layer with X.<br>
<br>
Everybody else is using oe-core + couple of other layers, why do we need<br=
>
to make oe-core testable with X _in single_ layer?<br>
<br>
I&#39;m not saying that oe-core should be tested with 30 layers like my<br>
world build, but why cannot AB have special build which builds<br>
<br>
oe-core + meta-xorg + meta-gnome<br>
<br>
and runs some runtime QA tests on that and then some other build with<br>
<br>
oe-core + meta-python<br>
<br>
for piglit tests?<br>
<br>
Is it limitation of AB scripts for builds that they cannot fetch other<br>
layers so they need everything glued together with combo-layer?</blockquote=
><div><br></div><div>I full agree here; this would be more in line of what =
we communicate to our users and layers being a good and nice way to modular=
ize the system...=A0</div>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.ossystem=
s.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--089e0149c506666f8704ef8923f7--
