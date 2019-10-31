Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7272E7F92A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 09:58:48 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id a143so3665815vsd.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fpdJlQcF611HNLdXqQ0Mgtp6pf/uWz3VfOe0Hje4AZw=;
	b=PL+LFvNYmwfvdN+8EP9CJjwRkryM+gaNqnIWL7RdHcTxnpKkTKLzcRPIYESsIP54lP
	qzoHfLdZHTDmUL8cBzuaoyj4B5kIQz+ez+B09DBcagHe7+rIs00BYeUI2cDHl4xrvTDF
	k8g2/zoPtLQIp5gNRfzWlv5DeXNtlCDBoi01eFmMDB6Oxj6NCw9cU/VZMFU8Ru0LB5U2
	CngSN+KZayBc1DfHoXsiAD53jXR1ao/Be40v5jsUDJoCVNTJB26oARyd39p8IsWNcHgD
	OzVkvzYoSlC7B/JkX71XXlQSX9DkKc5LF/9GErYCkvv6IHFHnZmnXv09y6x8NszYnHWN
	Ia9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fpdJlQcF611HNLdXqQ0Mgtp6pf/uWz3VfOe0Hje4AZw=;
	b=L1iLR+V8tEQIfgtUmxZDpIgdRzcwsvqd3h3Ps+sxKw6nbU6vNzixJ8SvXSOH1dWZ6z
	p9OvWrM0zhbGcRMgM8f+V9nDFzNOMdh9u2OVLPPN3gJnk+o+V17Q6nPG01g6ObeaDViS
	XWWig9HdNo2hNwP646CqimTUOfm7YTKSu8s4xWsbWaKqvOVGO8awim03u7qGl5CPp/hs
	o/0D6g++tO8b5htEZRtOeNdDyzGot6QLVcnhOTL4g4sBCGwVYonPnxz9PDmLqAGn09eV
	2WR7FAK3BWrosLNpppdlLJMPg/tJOIzVmcFZYpUzkbExL7sU39I2uds+UYfmM4bdCYJ7
	oenQ==
X-Gm-Message-State: APjAAAU4xtJIA4mOLTyYgJmpeqZ0xE7D++p3BySnaGWQwDfVovAaVrR6
	xGtQx8z6RG/G0sV3IblIb7oyVypYu6YSGpXH7ZM=
X-Google-Smtp-Source: APXvYqwXHOMEXCtzEfKLc8HMUxriIcss60kaOwc9A2FzcvqD9KBGfhhoMZmm3UJcePP/yxXaNMmPvma09puGuEgqjWM=
X-Received: by 2002:a67:ad0e:: with SMTP id t14mr2250259vsl.35.1572515929400; 
	Thu, 31 Oct 2019 02:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191031093655.14852-1-alex.kanavin@gmail.com>
	<20191031093655.14852-4-alex.kanavin@gmail.com>
	<CALbNGRTuGXc+fsXezqxBttBcz1LomdLyuNMotzJGFMgO6gBgaA@mail.gmail.com>
In-Reply-To: <CALbNGRTuGXc+fsXezqxBttBcz1LomdLyuNMotzJGFMgO6gBgaA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 31 Oct 2019 10:58:38 +0100
Message-ID: <CANNYZj9KWK7bahZU4OLfOpLXpeBcwXuF0oERwAfka6H3WHr-+Q@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] gcr: update to 3.34.0
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
X-List-Received-Date: Thu, 31 Oct 2019 09:58:48 -0000
Content-Type: multipart/alternative; boundary="000000000000602855059631e562"

--000000000000602855059631e562
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think Ross has a separate patch queued to address that.

Alex

On Thu, 31 Oct 2019 at 10:56, Andreas M=C3=BCller <schnitzeltony@gmail.com>
wrote:

> On Thu, Oct 31, 2019 at 10:38 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > inherit gettext, as gcr is now gettextized.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-gnome/gcr/{gcr_3.28.1.bb =3D> gcr_3.34.0.bb} | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename meta/recipes-gnome/gcr/{gcr_3.28.1.bb =3D> gcr_3.34.0.bb} (83%)
> >
> > diff --git a/meta/recipes-gnome/gcr/gcr_3.28.1.bb
> b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
> > similarity index 83%
> > rename from meta/recipes-gnome/gcr/gcr_3.28.1.bb
> > rename to meta/recipes-gnome/gcr/gcr_3.34.0.bb
> > index 0a9867451ee..f13bfecbe19 100644
> > --- a/meta/recipes-gnome/gcr/gcr_3.28.1.bb
> > +++ b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
> > @@ -11,12 +11,12 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc605"
> >  DEPENDS =3D "intltool-native gtk+3 p11-kit glib-2.0 libgcrypt \
> >             ${@bb.utils.contains('GI_DATA_ENABLED', 'True',
> 'libxslt-native', '', d)}"
> Don't know if this is a complete V2. If so intltool-native dependency
> can go (as Ross suggested).
>
> Andreas
>

--000000000000602855059631e562
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think Ross has a separate patch queued to address t=
hat.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 31 Oct 2019 at 10:56, A=
ndreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gmail.com">schnitzel=
tony@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Thu, Oct 31, 2019 at 10:38 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; inherit gettext, as gcr is now gettextized.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-gnome/gcr/{<a href=3D"http://gcr_3.28.1.bb" rel=3D"=
noreferrer" target=3D"_blank">gcr_3.28.1.bb</a> =3D&gt; <a href=3D"http://g=
cr_3.34.0.bb" rel=3D"noreferrer" target=3D"_blank">gcr_3.34.0.bb</a>} | 6 +=
++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-gnome/gcr/{<a href=3D"http://gcr_3.28.1.bb" =
rel=3D"noreferrer" target=3D"_blank">gcr_3.28.1.bb</a> =3D&gt; <a href=3D"h=
ttp://gcr_3.34.0.bb" rel=3D"noreferrer" target=3D"_blank">gcr_3.34.0.bb</a>=
} (83%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-gnome/gcr/<a href=3D"http://gcr_3.28.1.bb" r=
el=3D"noreferrer" target=3D"_blank">gcr_3.28.1.bb</a> b/meta/recipes-gnome/=
gcr/<a href=3D"http://gcr_3.34.0.bb" rel=3D"noreferrer" target=3D"_blank">g=
cr_3.34.0.bb</a><br>
&gt; similarity index 83%<br>
&gt; rename from meta/recipes-gnome/gcr/<a href=3D"http://gcr_3.28.1.bb" re=
l=3D"noreferrer" target=3D"_blank">gcr_3.28.1.bb</a><br>
&gt; rename to meta/recipes-gnome/gcr/<a href=3D"http://gcr_3.34.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gcr_3.34.0.bb</a><br>
&gt; index 0a9867451ee..f13bfecbe19 100644<br>
&gt; --- a/meta/recipes-gnome/gcr/<a href=3D"http://gcr_3.28.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">gcr_3.28.1.bb</a><br>
&gt; +++ b/meta/recipes-gnome/gcr/<a href=3D"http://gcr_3.34.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">gcr_3.34.0.bb</a><br>
&gt; @@ -11,12 +11,12 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D55=
ca817ccb7d5b5b66355690e9abc605&quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot;intltool-native gtk+3 p11-kit glib-2.0 libgcry=
pt \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#=
39;GI_DATA_ENABLED&#39;, &#39;True&#39;, &#39;libxslt-native&#39;, &#39;&#3=
9;, d)}&quot;<br>
Don&#39;t know if this is a complete V2. If so intltool-native dependency<b=
r>
can go (as Ross suggested).<br>
<br>
Andreas<br>
</blockquote></div>

--000000000000602855059631e562--
