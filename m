Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7B7F77F382
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Oct 2019 05:26:43 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id w2so7401421qkf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 22:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9S8hr9HTIV8WvRDwjHfgJUxGB7AbiSDJy+jOGYWuQuc=;
	b=uL6f8fyRRPlvbg7fIB8PQDnjzAeGpiTc6agsXrQwOggmxhnSb+S+bkiEMqkKSza9ru
	QeE1+ls20zXGDdwYwrRwETLJdwisDaaCwbb++yghBDB6T2xpLocxwgH5ZQanjnWd3o8C
	thidsRUjygMF5VH6lssPKUDttkNaOq5ny1Cr9xzMH0gTvEXHQPwp9wNgP+i6EGLJnmuw
	y9Z/lIYHaigojOoBZBRPt6RDmN8sNZD/b1p8Q4xWMM7YXfqPaiVAA0yFEiUCcse+Lz01
	O+3z7QZhRjszOCh9PU0lEsQ8XAftswhkvsnSbAC7I/YcGub/Bz7aLpXU0xF+0azLXs7j
	8E8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9S8hr9HTIV8WvRDwjHfgJUxGB7AbiSDJy+jOGYWuQuc=;
	b=Ou0QvWutqUlYANgwjLIQOY1AHEOENA1OiNe5c9CMeKdRFENBViJXTJ3Nxb0yTet2Hs
	hIUZeZPTGrrqYtuApGwu0erkoKU0tlvOB/Bk+DroGZkuJWZkjnidJfWfDpJWVRLIMo53
	KUGpSdGTO1yCCczH7t5YnSUDTFzYD1F95Jodcm0w25gBS3GkY1m8zAUqmAWV82/OGSZn
	/H4+gCJzqr42fhcNNu9KVWeHNnVb8zhIPbgD9/4WB4Bjqs4iuoukZ/WI9SaocmtZdI7E
	VOMIXdBX9mI96C5405rIZ5nny9+O3nxYY1dRILwmr5Yl2qZcUQh+p2bY4NLyb7dQlivZ
	ZkNQ==
X-Gm-Message-State: APjAAAUollz7afsoVxF+56G/Z87HqJVK9gRI1nSeCytwlM5ub49D/cYs
	JuhD1gMhH8wK5f3pyTsdthuWGQqMUcuULbcr+3U=
X-Google-Smtp-Source: APXvYqx+68e9uPTDC9jgMR64Nl150ogJhhgLpQ+vDBK7WgLFS/GmJMOWxmlW+S5KML/6xLiy43+9NCY+cj9tq2zBrNM=
X-Received: by 2002:a05:620a:1645:: with SMTP id
	c5mr12520163qko.212.1571462803970; 
	Fri, 18 Oct 2019 22:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191018112819.16210-1-ross.burton@intel.com>
	<CAMKF1soy5adOpd49H0dTqtwu=vSRc0EPMnXFvD5uQTaJd+JCig@mail.gmail.com>
	<1615697b554b612f329820f2b3f692011b7722ba.camel@linuxfoundation.org>
In-Reply-To: <1615697b554b612f329820f2b3f692011b7722ba.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Oct 2019 10:56:32 +0530
Message-ID: <CAMKF1so3EEEexdaXTkbV6w_vYZrBTSbiHZQwZUb1_z9CJSYODA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] file: explicitly disable seccomp
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
X-List-Received-Date: Sat, 19 Oct 2019 05:26:44 -0000
Content-Type: multipart/alternative; boundary="000000000000355d4805953cb225"

--000000000000355d4805953cb225
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 19, 2019 at 2:58 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2019-10-18 at 18:03 +0530, Khem Raj wrote:
> >
> >
> > On Fri, Oct 18, 2019 at 4:58 PM Ross Burton <ross.burton@intel.com>
> > wrote:
> > > file will automatically enable seccomp if the seccomp headers are
> > > available, but
> > > the build will fail on Opensuse Tumbleweed because the include
> > > paths are wrong.
> > >
> > > Enabling seccomp is a bad idea because it interacts badly with
> > > pseudo (causing
> > > build failures), so explicitly and globally disable seccomp.
> > >
> > > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > ---
> > >  meta/recipes-devtools/file/file_5.37.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta/recipes-devtools/file/file_5.37.bb
> > > b/meta/recipes-devtools/file/file_5.37.bb
> > > index a840dbc012b..c53a120b840 100644
> > > --- a/meta/recipes-devtools/file/file_5.37.bb
> > > +++ b/meta/recipes-devtools/file/file_5.37.bb
> > > @@ -21,6 +21,8 @@ S =3D "${WORKDIR}/git"
> > >
> > >  inherit autotools update-alternatives
> > >
> > > +EXTRA_OECONF +=3D "--disable-libseccomp"
> > > +
> >
> > On host it makes sense but how about for target recipe ? We do have
> > libseccomp support
> > Perhaps it=E2=80=99s best to disable it for native and native sdk alone=
 ?
>
> Given the problem reports in the media and the decisions made by most
> other distros I think disabling this is probably safest until its been
> make more usable (no other distro is shipping this enabled now).
>

Ok makes sense


> Cheers,
>
> Richard
>
>
>
>
>
>

--000000000000355d4805953cb225
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Oct 19, 2019 at 2:58 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 2019-=
10-18 at 18:03 +0530, Khem Raj wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Oct 18, 2019 at 4:58 PM Ross Burton &lt;<a href=3D"mailto:ross=
.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; file will automatically enable seccomp if the seccomp headers are=
<br>
&gt; &gt; available, but<br>
&gt; &gt; the build will fail on Opensuse Tumbleweed because the include<br=
>
&gt; &gt; paths are wrong.<br>
&gt; &gt; <br>
&gt; &gt; Enabling seccomp is a bad idea because it interacts badly with<br=
>
&gt; &gt; pseudo (causing<br>
&gt; &gt; build failures), so explicitly and globally disable seccomp.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@inte=
l.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/file/<a href=3D"http://file_5.37.bb" =
rel=3D"noreferrer" target=3D"_blank">file_5.37.bb</a> | 2 ++<br>
&gt; &gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-devtools/file/<a href=3D"http://file_5.=
37.bb" rel=3D"noreferrer" target=3D"_blank">file_5.37.bb</a><br>
&gt; &gt; b/meta/recipes-devtools/file/<a href=3D"http://file_5.37.bb" rel=
=3D"noreferrer" target=3D"_blank">file_5.37.bb</a><br>
&gt; &gt; index a840dbc012b..c53a120b840 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/file/<a href=3D"http://file_5.37.bb" =
rel=3D"noreferrer" target=3D"_blank">file_5.37.bb</a><br>
&gt; &gt; +++ b/meta/recipes-devtools/file/<a href=3D"http://file_5.37.bb" =
rel=3D"noreferrer" target=3D"_blank">file_5.37.bb</a><br>
&gt; &gt; @@ -21,6 +21,8 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 inherit autotools update-alternatives<br>
&gt; &gt; <br>
&gt; &gt; +EXTRA_OECONF +=3D &quot;--disable-libseccomp&quot;<br>
&gt; &gt; +<br>
&gt; <br>
&gt; On host it makes sense but how about for target recipe ? We do have<br=
>
&gt; libseccomp support <br>
&gt; Perhaps it=E2=80=99s best to disable it for native and native sdk alon=
e ?<br>
<br>
Given the problem reports in the media and the decisions made by most<br>
other distros I think disabling this is probably safest until its been<br>
make more usable (no other distro is shipping this enabled now).<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ok makes sense=
=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000355d4805953cb225--
