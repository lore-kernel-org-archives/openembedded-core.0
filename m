Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 448977E4E4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 19:14:56 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id l25so15697515eda.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 12:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wuL+W+YYAhdiK9Vt9TiAkHBOJMT2UJ09IYVJlzdirGw=;
	b=Eu/tniXD3c5YknCSAiLcZDjdXAXRjdyYEWGGoV3bKLuJXmCqIw7cxoMJ/n1aiH5dj4
	AVWf5pUIdthnIYnJz4M8inHinKvm5nGQk1gWXmy8JcBK5maJ0KZ3dpMbNmi83hQx6p7R
	Gr7jdSo2cBU05bc3QixBT64nrTA1AiHlqLaL9yw1xdXl/wQ9Km+w+DXt4vGWlpgppwUs
	Pv3t3WYZCjfdrQakCuBPuln2VGnJS+xLvfxsaSkF/eXAco0VJ4ngkjyqOX4ryOTjeOss
	AqXLJlSAk7Szp4sQqkVuS8mfZeDMKUyg6UhFhAqHoA1k5ogw5bJ8c8hDtdeXyLKHmVsG
	zoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wuL+W+YYAhdiK9Vt9TiAkHBOJMT2UJ09IYVJlzdirGw=;
	b=sFaeMQ7lZ7YZKlij5SMDK5ly0vlO2sEiido0M2R9MfI7dnjc0zZf/EiOnOCOOaeMNK
	o3ZvdKgrgHZAoWxrdNOwA9V53wCNqxKRntOku9Azrtaep0i+dX+irTAZiVVaWIKIDanL
	cqhV8x04BST+AAc607mhLShANzyLqPrqYtD6opDHHJWIKthMKm2jv7Qv5tHOp3w1l/GR
	Xmujo55D9LiEzwHjTeros04GmqYx55LZICUUrpxnd/3gcn1Y2wV6rtKk/Tw5pFoKL5yX
	GHz8OoxtHwst4dNsBGtYKw/DkIs8yLhXpcQA0bDOomyrPNk2XDmFwIhODwkuPU9AJRAg
	HbVg==
X-Gm-Message-State: APjAAAWWf+Zi8m0kzk/kbbqP9tjpZMIOBIlAvB1aWsS0JEwTw83YeaPp
	z12heXbVqXnbmKOctakcuZQv70mb1bg+bTrZU9M=
X-Google-Smtp-Source: APXvYqxKqRd14DJSRYpeDTE1bp4xKt8DTMPpzRgp74cV/ar3Oie26eqjpe5vdnjaJQeaLhyZoeSPPdpYbZAHuP8xrPU=
X-Received: by 2002:a17:906:d79a:: with SMTP id
	pj26mr49648510ejb.205.1558725296910; 
	Fri, 24 May 2019 12:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1558664136.git.Qi.Chen@windriver.com>
	<ff55bb58704a56b9957b36863b704dad3d69ea0f.1558664136.git.Qi.Chen@windriver.com>
	<17c3408af1ebd7edc0f9c99c0bbec3617e8885b9.camel@linuxfoundation.org>
	<CAMKF1so1cOr78PRop6cLi+w7GTSSnKgniOpNyJxgDU_EVSbkfw@mail.gmail.com>
In-Reply-To: <CAMKF1so1cOr78PRop6cLi+w7GTSSnKgniOpNyJxgDU_EVSbkfw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 24 May 2019 21:14:46 +0200
Message-ID: <CA+chaQf--h3zXut4+ahWea1AU_d6Uv=eFk1UuuCts8Xj_S9S=g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: avoid musl specific patches affect glibc systems
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
X-List-Received-Date: Fri, 24 May 2019 19:14:56 -0000
Content-Type: multipart/alternative; boundary="0000000000009ff8ba0589a70315"

--0000000000009ff8ba0589a70315
Content-Type: text/plain; charset="UTF-8"

It's still nicer to have
SRC_URI_append_libc-musl = " ${SRC_URI_MUSL}"
if the intermediate SRC_URI_MUSL variable is useful.

On Fri, May 24, 2019 at 7:59 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, May 24, 2019 at 10:31 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Fri, 2019-05-24 at 10:17 +0800, Chen Qi wrote:
> > > systemd upstream only care about glibc. We made musl specific
> > > patches so that systemd could work. But currently these patches
> > > contain potential security issues.
> > >
> > > So apply these patches only when the libc is musl.
> > >
> > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > ---
> > >  meta/recipes-core/systemd/systemd_242.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-
> > > core/systemd/systemd_242.bb
> > > index 2dda0d0..adb592f 100644
> > > --- a/meta/recipes-core/systemd/systemd_242.bb
> > > +++ b/meta/recipes-core/systemd/systemd_242.bb
> > > @@ -27,7 +27,7 @@ SRC_URI += "file://touchscreen.rules \
> > >             "
> > >
> > >  # patches needed by musl
> > > -SRC_URI += "${SRC_URI_MUSL}"
> > > +SRC_URI += "${@d.getVar('SRC_URI_MUSL') if d.getVar('TCLIBC') ==
> > > 'musl' else ''}"
> > >  SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-
> > > available.patch \
> > >                 file://0002-don-t-use-glibc-specific-qsort_r.patch \
> > >                 file://0003-missing_type.h-add-__compare_fn_t-and-
> > > comparison_fn_.patch \
> >
> > Doesn't the usual SRC_URI_append_libc-musl = "X" work?
> >
>
> yes this should be better, SRC_URI_MUSL was introduced so someone
> could override it
> but if we make it optional then using override is better I think
>
> > Cheers,
> >
> > Richard
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000009ff8ba0589a70315
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It&#39;s still nicer to have</div>SRC_URI_append_libc=
-musl =3D &quot; ${SRC_URI_MUSL}&quot;<br><div>if the intermediate SRC_URI_=
MUSL variable is useful.</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, May 24, 2019 at 7:59 PM Khem Raj &lt;=
<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, May 24, 201=
9 at 10:31 AM Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, 2019-05-24 at 10:17 +0800, Chen Qi wrote:<br>
&gt; &gt; systemd upstream only care about glibc. We made musl specific<br>
&gt; &gt; patches so that systemd could work. But currently these patches<b=
r>
&gt; &gt; contain potential security issues.<br>
&gt; &gt;<br>
&gt; &gt; So apply these patches only when the libc is musl.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.co=
m" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_242.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd_242.bb</a> | 2 +-<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_=
242.bb" rel=3D"noreferrer" target=3D"_blank">systemd_242.bb</a> b/meta/reci=
pes-<br>
&gt; &gt; core/systemd/<a href=3D"http://systemd_242.bb" rel=3D"noreferrer"=
 target=3D"_blank">systemd_242.bb</a><br>
&gt; &gt; index 2dda0d0..adb592f 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_242.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd_242.bb</a><br>
&gt; &gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_242.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd_242.bb</a><br>
&gt; &gt; @@ -27,7 +27,7 @@ SRC_URI +=3D &quot;file://touchscreen.rules \<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 # patches needed by musl<br>
&gt; &gt; -SRC_URI +=3D &quot;${SRC_URI_MUSL}&quot;<br>
&gt; &gt; +SRC_URI +=3D &quot;${@d.getVar(&#39;SRC_URI_MUSL&#39;) if d.getV=
ar(&#39;TCLIBC&#39;) =3D=3D<br>
&gt; &gt; &#39;musl&#39; else &#39;&#39;}&quot;<br>
&gt; &gt;=C2=A0 SRC_URI_MUSL =3D &quot;file://0001-Use-getenv-when-secure-v=
ersions-are-not-<br>
&gt; &gt; available.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://0002-don-t-use-glibc-specific-qsort_r.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://0003-missing_type.h-add-__compare_fn_t-and-<br>
&gt; &gt; comparison_fn_.patch \<br>
&gt;<br>
&gt; Doesn&#39;t the usual SRC_URI_append_libc-musl =3D &quot;X&quot; work?=
<br>
&gt;<br>
<br>
yes this should be better, SRC_URI_MUSL was introduced so someone<br>
could override it<br>
but if we make it optional then using override is better I think<br>
<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000009ff8ba0589a70315--
