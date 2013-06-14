Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8026361AC3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 16:42:16 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id pb11so657136veb.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 09:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=wJFi+W3hpy904FIx8Dv8h20ocb3u8Gs/3OC9808jBpA=;
	b=dJvyTv1gNoVon0OegU3rtp2SsBRti0gMDGDhrCGQ1v0pz/qWNxpIMH/6RlOj0jfSa3
	Y4uOJ3tWyeCuAoBrU/tvjylFWv+jtb1esJ4c4W6iEtjwLsauX15K2K+EHoT4PoUNC16w
	lkfZt8YQIyS8OnR/ASobiqoRi8J5ZO1S/dkgioTY+FtK7qy8q1KH4IdD8AWEUH6PLuVg
	rtcP+Yf6KX4k/SjzaG3kE4jXFyfGTi/VtBNtc7wUZWgO3NY0liHCh2gs+w+M5F1PGPeV
	zZ6EGdn0La9kmieNcpMWC+1Wx70ngopVDA+972PdjtYvlzDkTtl6tgKp8P3FUYSdnaFn
	jE1w==
MIME-Version: 1.0
X-Received: by 10.220.78.212 with SMTP id m20mr1229300vck.46.1371228136936;
	Fri, 14 Jun 2013 09:42:16 -0700 (PDT)
Received: by 10.220.13.144 with HTTP; Fri, 14 Jun 2013 09:42:16 -0700 (PDT)
In-Reply-To: <1371225044.20823.84.camel@ted>
References: <1371224418-11163-1-git-send-email-ross.burton@intel.com>
	<1371225044.20823.84.camel@ted>
Date: Fri, 14 Jun 2013 17:42:16 +0100
Message-ID: <CAJTo0LZ68nMg46O3dSEtd4oiwrNNNgQ5YQXQyq2qP8f_iuUt4A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQkBzZzQ19VtchstPvkNTFp997RrQ6vf0+dEBYA+Ibbeo0bSZtxqu9AfCi7h2SHX+7mjFT5T
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] atk: inherit gnomebase
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
X-List-Received-Date: Fri, 14 Jun 2013 16:42:16 -0000
Content-Type: multipart/alternative; boundary=047d7b343d56022c3e04df1fee0d

--047d7b343d56022c3e04df1fee0d
Content-Type: text/plain; charset=UTF-8

Gnar, sorry. I retract this, I inherited the wrong class.

Ross

On Friday, 14 June 2013, Richard Purdie wrote:

> On Fri, 2013-06-14 at 16:40 +0100, Ross Burton wrote:
> > This recipe was missing a dependency on gnome-common, so lets just
> inherit
> > gnomebase and get both it and GNOME SRC_URI handling for free.
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com <javascript:;>>
> > ---
> >  meta/recipes-support/atk/atk_2.8.0.bb |    5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-support/atk/atk_2.8.0.bbb/meta/recipes-support/atk/
> atk_2.8.0.bb
> > index a190c0a..cfe2f58 100644
> > --- a/meta/recipes-support/atk/atk_2.8.0.bb
> > +++ b/meta/recipes-support/atk/atk_2.8.0.bb
> > @@ -10,11 +10,10 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
> >
> >  DEPENDS = "glib-2.0"
> >
> > -inherit autotools gtk-doc pkgconfig
> > +inherit gnome gtk-doc
>
> The above and the commit message don't match (gnome verses gnomebase) :/
>
> Cheers,
>
> Richard
>
> > -MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
> > +GNOME_COMPRESS_TYPE = "xz"
> >
> > -SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
> >  SRC_URI[md5sum] = "c652bd25530825d604dae1c1ebd2da02"
> >  SRC_URI[sha256sum] =
> "b22519176226f3e07cf6d932b77852e6b6be4780977770704b32d0f4e0686df4"
> >
>
>
>

--047d7b343d56022c3e04df1fee0d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Gnar, sorry. I retract this, I inherited the wrong class.<div><br></div><di=
v>Ross<span></span><br><br>On Friday, 14 June 2013, Richard Purdie  wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
On Fri, 2013-06-14 at 16:40 +0100, Ross Burton wrote:<br>
&gt; This recipe was missing a dependency on gnome-common, so lets just inh=
erit<br>
&gt; gnomebase and get both it and GNOME SRC_URI handling for free.<br>
&gt;<br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"javascript:;" onclick=3D"_e(=
event, &#39;cvml&#39;, &#39;ross.burton@intel.com&#39;)">ross.burton@intel.=
com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-support/atk/<a href=3D"http://atk_2.8.0.bb" target=
=3D"_blank">atk_2.8.0.bb</a> | =C2=A0 =C2=A05 ++---<br>
&gt; =C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/atk/<a href=3D"http://atk_2.8.0.bb" =
target=3D"_blank">atk_2.8.0.bb</a> b/meta/recipes-support/atk/<a href=3D"ht=
tp://atk_2.8.0.bb" target=3D"_blank">atk_2.8.0.bb</a><br>
&gt; index a190c0a..cfe2f58 100644<br>
&gt; --- a/meta/recipes-support/atk/<a href=3D"http://atk_2.8.0.bb" target=
=3D"_blank">atk_2.8.0.bb</a><br>
&gt; +++ b/meta/recipes-support/atk/<a href=3D"http://atk_2.8.0.bb" target=
=3D"_blank">atk_2.8.0.bb</a><br>
&gt; @@ -10,11 +10,10 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D3b=
f50002aefd002f49e7bb854063f7e7 \<br>
&gt;<br>
&gt; =C2=A0DEPENDS =3D &quot;glib-2.0&quot;<br>
&gt;<br>
&gt; -inherit autotools gtk-doc pkgconfig<br>
&gt; +inherit gnome gtk-doc<br>
<br>
The above and the commit message don&#39;t match (gnome verses gnomebase) :=
/<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
&gt; -MAJ_VER =3D &quot;${@oe.utils.trim_version(&quot;${PV}&quot;, 2)}&quo=
t;<br>
&gt; +GNOME_COMPRESS_TYPE =3D &quot;xz&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.=
xz&quot;<br>
&gt; =C2=A0SRC_URI[md5sum] =3D &quot;c652bd25530825d604dae1c1ebd2da02&quot;=
<br>
&gt; =C2=A0SRC_URI[sha256sum] =3D &quot;b22519176226f3e07cf6d932b77852e6b6b=
e4780977770704b32d0f4e0686df4&quot;<br>
&gt;<br>
<br>
<br>
</blockquote></div>

--047d7b343d56022c3e04df1fee0d--
