Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
	[209.85.221.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0358660B85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:32:35 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id b2so3394340vkk.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 03:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DR4lzSqBTR3EnEGf3Fl6R9QpOcRE/LS6Q08FDsNQIgo=;
	b=jWZZPVX8UdFOOGtdx7xx5bceFvlYHrSyNa2w7fZxUh9FGZVlHHkcAAvXK9dIxbo+h6
	6hAHBmR74MdWqiaKXWNP9SUa6UCDzU8DJErNKto4vLH5YSoLr3bl1J7mXBccl3hpsMVH
	bR6kMdfldYKavxfsjck3RLalO6Gz3XF96vzpH9y2v26RgDjKycP5TVvW/AxATyBPFq27
	9sjMCIoAAeNNNmyvjZcnPUspo/X37lQbqxyHMtQO2CuibLxqDBRVrIwTg9Kow4t4PeCq
	22dIwfdV5vG0LxqhwciBRDp3xotlAem9z0S/FHtmgiUoY3VvXjGIqoFln2G9mdb34vg1
	R4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DR4lzSqBTR3EnEGf3Fl6R9QpOcRE/LS6Q08FDsNQIgo=;
	b=oD/OKxCrjdKEmsUUgdBsZCTJP+d/m+Gqsc2eOiAhF2HgJTuysg3n0PxxCsh+JycDx9
	hWFGbEpV2y2K1i8mcDnL9BcIFDm/7G9geYaJx2P+bLoyVb7zFrUEmBk0h1L0zKqL2RmJ
	pLWEt5hEkqCvv9QnQXllOsFzBbUg00QyqAas2ELKhuW3SAujTVoracNYRwMxeItFf3bz
	BeYp7XqE30phBUR2PhtwXA8EV+jC6o2ABnzd9FfnvsQsUYjDQA5j9ubBLavYZmLVlriy
	vOlu2trENbRy0e4bppLrKh6h6mmdHAuh85ypI4/CbWl/HIoyGe4odW42w3POgVeu4Rd6
	b9Vw==
X-Gm-Message-State: APjAAAXGOEEnZ3ol80QsnmxxvLDzpaPuQp1iI4u+oeTOFZT6/Qmi/P2j
	tu7OB5pTWN2cfKYuyjCEsH+kllrKQPodiO4Uf6E=
X-Google-Smtp-Source: APXvYqxPC6XMv1LP4tFpOoS79hiVK4OlmFW5V1wHTK62VZFaBr4EPHMqN5GOaF7jkxrdXt6Pwfvo+dqe3QKpVt9z1R4=
X-Received: by 2002:a1f:9a90:: with SMTP id c138mr8490431vke.9.1582630356607; 
	Tue, 25 Feb 2020 03:32:36 -0800 (PST)
MIME-Version: 1.0
References: <20200223182933.6168-1-bunk@stusta.de>
	<fd59ef897ef077f4f0160e1e2d7c95466c75a3f7.camel@linuxfoundation.org>
	<20200224104635.GA27036@localhost> <20200224140801.GC27036@localhost>
	<CANNYZj91N68ocXm=UKzcH6U7nEnVLuQzDStR3O0_cO3GsY9uag@mail.gmail.com>
	<20200225111955.GA13902@localhost>
In-Reply-To: <20200225111955.GA13902@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Feb 2020 12:32:55 +0100
Message-ID: <CANNYZj-VbMxS52x78goiAA3jvKnyRQiyxd8G5TfEKZ8hBSXdDA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/6] webkitgtk: Remove unnecessary REQUIRED_DISTRO_FEATURES requirements
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
X-List-Received-Date: Tue, 25 Feb 2020 11:32:36 -0000
Content-Type: multipart/alternative; boundary="0000000000003766d1059f64d815"

--0000000000003766d1059f64d815
Content-Type: text/plain; charset="UTF-8"

I would probably look into how
REQUIRED_DISTRO_FEATURE/ANY_OF_DISTRO_FEATURS is actually implemented, and
see if you can convince it to do the right thing, or maybe write a custom
re-implementation.

Alex

On Tue, 25 Feb 2020 at 12:19, Adrian Bunk <bunk@stusta.de> wrote:

> On Mon, Feb 24, 2020 at 10:45:33PM +0100, Alexander Kanavin wrote:
> > On Mon, 24 Feb 2020 at 15:08, Adrian Bunk <bunk@stusta.de> wrote:
> >
> > > Alexander, wayland support in webkitgtk requires mesa built with x11
> > > support (otherwise gl.pc is not available).
> >
> > I had a look; I'm not sure I understood the options correctly, but the
> > issue is due to this:
> >
> >                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'webgl
> > opengl', '' ,d)} \
> >
> > The above works if both opengl and x11 are enabled as DISTRO_FEATURES,
> but
> > if x11 is not enabled, then it should be "webgl gles2". Can you try that?
>
> Thanks, that did the trick.
>
> Expressing everything might still be problematic, is there a way to set
> REQUIRED_DISTRO_FEATURES to
>   x11 || (wayland && opengl)
> ?
>
> Using webkitgtk with x11 without opengl might not be common,
> but it is explicitly supported upstream.
>
> > Alex
>
> cu
> Adrian
>

--0000000000003766d1059f64d815
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I would probably look into how REQUIRED_DISTRO_FEATURE/ANY=
_OF_DISTRO_FEATURS is actually implemented, and see if you can convince it =
to do the right thing, or maybe write a custom re-implementation.<div><br><=
/div><div>Alex</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Tue, 25 Feb 2020 at 12:19, Adrian Bunk &lt;<a href=
=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-le=
ft:1ex">On Mon, Feb 24, 2020 at 10:45:33PM +0100, Alexander Kanavin wrote:<=
br>
&gt; On Mon, 24 Feb 2020 at 15:08, Adrian Bunk &lt;<a href=3D"mailto:bunk@s=
tusta.de" target=3D"_blank">bunk@stusta.de</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Alexander, wayland support in webkitgtk requires mesa built with =
x11<br>
&gt; &gt; support (otherwise gl.pc is not available).<br>
&gt; <br>
&gt; I had a look; I&#39;m not sure I understood the options correctly, but=
 the<br>
&gt; issue is due to this:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $=
{@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#39;, &#39;webgl=
<br>
&gt; opengl&#39;, &#39;&#39; ,d)} \<br>
&gt; <br>
&gt; The above works if both opengl and x11 are enabled as DISTRO_FEATURES,=
 but<br>
&gt; if x11 is not enabled, then it should be &quot;webgl gles2&quot;. Can =
you try that?<br>
<br>
Thanks, that did the trick.<br>
<br>
Expressing everything might still be problematic, is there a way to set<br>
REQUIRED_DISTRO_FEATURES to<br>
=C2=A0 x11 || (wayland &amp;&amp; opengl)<br>
?<br>
<br>
Using webkitgtk with x11 without opengl might not be common,<br>
but it is explicitly supported upstream.<br>
<br>
&gt; Alex<br>
<br>
cu<br>
Adrian<br>
</blockquote></div>

--0000000000003766d1059f64d815--
