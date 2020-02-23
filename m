Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id C5B04617BA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 13:06:07 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id m4so4076023vsa.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 05:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DrfJkO+ZTXx4P7S09ChJIfq3U26uw0KHCLiKCavKbGQ=;
	b=t/nh0n1k38MTnVQbtgQi3ceSs/02BTygXFzmxKXkwwcyPEaRRawYXOijESq3IrORFh
	bgJoeEpFaT75IJl7rF/5hZrV6fL7MgrbLqtnWDLQU8EgeDVoT/mt2llnkRfedobLJhAE
	jKVzEGvZeVHDvTK0lws+tgpPH/+a/+Wd5/M+teCScrmIVxNkhpw+PlQfBE26Q5pZ0sEs
	pM730mgr3Xd9RfMIot89enRHv5Vk8M4eqUAkPf2a/antv/hy7u9TO3nPKm0EHHSDyekK
	QZk2P09/b9SOvEnJckvnB4P9kS87S0PA5/qj1etmrXjqoBsyZxepqRb30zQhJ0/BSG+f
	u/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DrfJkO+ZTXx4P7S09ChJIfq3U26uw0KHCLiKCavKbGQ=;
	b=gncDP4s1QE9dc1Ff8SjHHmDLPJWjqMD6WtSeqLcj4iSjTtm66qU94eblBcMATNCE52
	gnQTtCcmO5QslG9hrz85K+bzJZiK11Inn/itVYye+twEhc+SInePdQzGV2XvClWR3BkH
	87KY28bo/bekPaM3n7Jc7jZ6TNE5tqjaQITRpRW9SsN/qptGDoWfhgxkHdE8b/TWulCn
	9cuwt6IMHCROccFm+n+sa7gAgC2Xp8XoinKsYggs4AGqY2RFZMbHjhitgKauYZMD4eTK
	z4Xn1wSUD6/eFbPkJ34ExrnD/S8wYP+Ew1PRKfWSwifgntNh1tHEyaFnWQVnrPWDuGce
	SbSw==
X-Gm-Message-State: APjAAAU0p7iOz5NTp3wjVOinQkHot33rWCj8KYacIczjye6aqN5gaKIb
	KgQMnTb7uJ2AIwpyXU7+5gS/YCjMB/EJxCMYb9thMw==
X-Google-Smtp-Source: APXvYqz90sR26nvWw/L7NjmnmscVSwpqlydDnxTlYpBNIMorOgfnOmORuT/18FPiFXUxkoKhfcXtZLzYio/IJYF4nhA=
X-Received: by 2002:a05:6102:103:: with SMTP id
	z3mr24806881vsq.23.1582463168439; 
	Sun, 23 Feb 2020 05:06:08 -0800 (PST)
MIME-Version: 1.0
References: <20200219194752.7967-1-alex.kanavin@gmail.com>
	<20200219194752.7967-2-alex.kanavin@gmail.com>
	<20200223130206.GE9628@localhost>
In-Reply-To: <20200223130206.GE9628@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 23 Feb 2020 14:05:54 +0100
Message-ID: <CANNYZj86Odg3+2UcEtg=ZbQPdti9hhha404-0vWqWBHYmCDFng@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/13] webkitgtk: x11 and wayland are not mutually exclusive
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
X-List-Received-Date: Sun, 23 Feb 2020 13:06:08 -0000
Content-Type: multipart/alternative; boundary="000000000000066749059f3debd1"

--000000000000066749059f3debd1
Content-Type: text/plain; charset="UTF-8"

Right, I think this line can be simply dropped. Care to make a patch?

Alex

On Sun, 23 Feb 2020 at 14:02, Adrian Bunk <bunk@stusta.de> wrote:

> On Wed, Feb 19, 2020 at 08:47:41PM +0100, Alexander Kanavin wrote:
> > Also enabling wayland if x11 is not enabled is not necessarily
> > the correct decision.
> >...
> > -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> 'x11', 'wayland' ,d)} \
> > +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11',
> d)} \
> >                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'webgl opengl', '' ,d)} \
> >...
>
> Not a new issue, but I guess something should change regarding the
>   REQUIRED_DISTRO_FEATURES = "x11 opengl"
>
> cu
> Adrian
>

--000000000000066749059f3debd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right, I think this line can be simply dropped. Care =
to make a patch?</div><div><br></div><div>Alex<br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 23 Feb 2020=
 at 14:02, Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Wed, Feb 19, 2020 at 08:47:41PM +0100, Alexander Kanavin wrote:<br>
&gt; Also enabling wayland if x11 is not enabled is not necessarily<br>
&gt; the correct decision.<br>
&gt;...<br>
&gt; -PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#=
39;, &#39;x11&#39;, &#39;x11&#39;, &#39;wayland&#39; ,d)} \<br>
&gt; +PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39=
;, &#39;wayland x11&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#39;, &#3=
9;webgl opengl&#39;, &#39;&#39; ,d)} \<br>
&gt;...<br>
<br>
Not a new issue, but I guess something should change regarding the<br>
=C2=A0 REQUIRED_DISTRO_FEATURES =3D &quot;x11 opengl&quot;<br>
<br>
cu<br>
Adrian<br>
</blockquote></div>

--000000000000066749059f3debd1--
