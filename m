Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id B9F7D7CDAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 17:19:48 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id n12so5195624qvt.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 09:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EGpQx6BdVp/MdargV9gu0nLDGG3NdvQGhOKj/q5QjPU=;
	b=khGlAoV6ggL5+PjXJhdH3Hi7MWLSxuKtK4h4hWmoLVoLXK9xT4QUQPZefExvwyIDaI
	JMfAjrwV5subV/O7RbUfV/n8sODgLjRtehxLdsa+KAPmCYxnYpsjg5ny5jXuZ4pjLOKw
	Q/7QNSQdNUhTzvgFwHzi3ansYP7jeNb1YI1s21Lx8UYZX2L27aWjTGFSShWpS8zvQDR7
	SEMgpQog1u18S3Jb3EVBm0g8Yh+rsQx1xpj8guMgjjTFN/gOO1XFNknBxTBxyLxohCri
	0p9OhDNSGfoljh019JUKu6kuMTOfUjVb5qFjR/gBi467KsA8xRprJdWhOgYrdsaH4lgd
	vACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EGpQx6BdVp/MdargV9gu0nLDGG3NdvQGhOKj/q5QjPU=;
	b=jLZUjHax19LeaaILfVCn6Xl9RxwiZeiPyhi18audvcuoQDzew4D1IDJJNCg6GOsX6W
	2uIqL1pm+7BQ0r/NRL/90NCGcz8jmbAVmcusAXs4gB/ft5a44pn5ag/i9yWHR0Z7BkK/
	CFrvi5njFiwA5DHfyU3q3RwWwiTEZngAFi5VgqL8VtY1324Kmi3jfmlmtR4tPE9A9Ytz
	6zjyDBHIgfxiIyar6yIGkbk3POu4x0sP+F6RclUCTyHUn9K045DvByVyhKEsm+cWRO7G
	H4ChJptdEjgzi5yH3D6TEdm1lvYt0kxOBmoMDG858usNmDqOT4XLHNb+faWOXDV9/e6J
	F/Wg==
X-Gm-Message-State: APjAAAWkgCP6nk+4eFIv6rY+Xk2esnU3SFFDKN7nvXPIgck/nOFcbbUx
	n1tH8yot/68MPyiWx8l0UyYmFY8sLOPcTVBw6wM=
X-Google-Smtp-Source: APXvYqwsT8HPhV4qGCZi4M/iezHTg1QbaZhjYvKFlRDxOj01HLgeaktII1Sn+8qnweyflHzZm7zoD1yIdHqsVNq+gCI=
X-Received: by 2002:a05:6214:2af:: with SMTP id
	m15mr23382133qvv.99.1573492788810; 
	Mon, 11 Nov 2019 09:19:48 -0800 (PST)
MIME-Version: 1.0
References: <20191109153559.15847-1-richard.purdie@linuxfoundation.org>
	<20191109100710.66530547@seebsdell>
	<5100e289ac8a5c4d0196e8ec77813859bb7a703d.camel@linuxfoundation.org>
	<20191109104619.209d9fcd@seebsdell>
	<CAJ86T=U6Rp5_nkJqHa-9e9sBpiQxn+iiD2khiZ1ZyMqq16c8GQ@mail.gmail.com>
	<dc84f473235ec05f06914abf4d8793c23ed08640.camel@gmail.com>
	<20191111163602.GH28797@localhost>
In-Reply-To: <20191111163602.GH28797@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Nov 2019 09:19:37 -0800
Message-ID: <CAMKF1spMYbtsGKE6WAw2UZ4mPUdUJdmDTz6pvQK5kqZbFOjU8Q@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: Drop static linking to sqlite3
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
X-List-Received-Date: Mon, 11 Nov 2019 17:19:48 -0000
Content-Type: multipart/alternative; boundary="000000000000bbd9d60597155682"

--000000000000bbd9d60597155682
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2019 at 8:36 AM Adrian Bunk <bunk@stusta.de> wrote:

> On Mon, Nov 11, 2019 at 07:59:43AM -0800, Khem Raj wrote:
> > On Mon, 2019-11-11 at 05:04 -0800, Andre McCurdy wrote:
> > >
> > > With this merged, we can also drop the hack to force the sqlite
> > > static
> > > lib to be PIC:
> > >
> > >
> > >
> https://git.openembedded.org/openembedded-core/commit/?id=3D6a58e12d19c53=
9deac9e90679a68438497a42fa4
> >
> > That would be good but a caution is that if pseudo is just one usecase
> > here which brought this issue forward, since we use PIE by default this
> > would come up elsewhere too
>
> The only usecase for building a static library as PIC I am aware of is
> when you want to link the static library into a shared library.
>
> Usually linking a static library into a shared library is a bug and
> the link error is preferable since you actually intended to link
> with the shared library (the linker automatically uses a static
> library when it can't find a shared library).
>
> There are rare exceptions when this is done intentionally.
> Linking a static libsqlite3.a into libpseudo.so was such an exception.
>
> Whether the non-PIC code is PIE or not does not make a difference.


It=E2=80=99s not directly related to that more to the fact that we disable =
static
libs by default and since this was available some other package might have
depended on it inadvertently

>
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
>

--000000000000bbd9d60597155682
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Nov 11, 2019 at 8:36 AM Adrian Bunk &lt;<a href=3D"=
mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">On Mon, Nov 11, 2019 at 07:59:43AM -0800, Khem Raj wrote:=
<br>
&gt; On Mon, 2019-11-11 at 05:04 -0800, Andre McCurdy wrote:<br>
&gt; &gt; <br>
&gt; &gt; With this merged, we can also drop the hack to force the sqlite<b=
r>
&gt; &gt; static<br>
&gt; &gt; lib to be PIC:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt; <a href=3D"https://git.openembedded.org/openembedded-core/commit/=
?id=3D6a58e12d19c539deac9e90679a68438497a42fa4" rel=3D"noreferrer" target=
=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?id=3D6a5=
8e12d19c539deac9e90679a68438497a42fa4</a><br>
&gt; <br>
&gt; That would be good but a caution is that if pseudo is just one usecase=
<br>
&gt; here which brought this issue forward, since we use PIE by default thi=
s<br>
&gt; would come up elsewhere too<br>
<br>
The only usecase for building a static library as PIC I am aware of is <br>
when you want to link the static library into a shared library.<br>
<br>
Usually linking a static library into a shared library is a bug and<br>
the link error is preferable since you actually intended to link<br>
with the shared library (the linker automatically uses a static<br>
library when it can&#39;t find a shared library).<br>
<br>
There are rare exceptions when this is done intentionally.<br>
Linking a static libsqlite3.a into libpseudo.so was such an exception.<br>
<br>
Whether the non-PIC code is PIE or not does not make a difference.</blockqu=
ote><div dir=3D"auto"><br></div><div dir=3D"auto">It=E2=80=99s not directly=
 related to that more to the fact that we disable static libs by default an=
d since this was available some other package might have depended on it ina=
dvertently=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
cu<br>
Adrian<br>
<br>
-- <br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Is there not promise of rain?&quot; Ling T=
an asked suddenly out<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of the darkness. There had been need of rain fo=
r many days.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Only a promise,&quot; Lao Er said.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pearl S. =
Buck - Dragon Seed<br>
<br>
</blockquote></div></div>

--000000000000bbd9d60597155682--
