Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
	[209.85.217.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5A3277F7C1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 11:00:17 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id f8so2363547vsq.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 03:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UJzdgtBIRy+CBl2bF7XahFzsRqmwci/kLI7PHSuVGMs=;
	b=pzUhOqNeCbb3Vg2Xl3POCFS6eHr/dYEo4h0uCjwA6s5MfGOaflRzAh0yB3SxCgHmPp
	86nyYpbYFF+E09zASetzFcKiqcWGMsCo4HCVSLRKtie+Ku619kqD8W6TVSkUiVFWD783
	7ESmutg19DcJua7qoAxnm9uLItkmn+bb0FWvZwDWWvX1EqVuvahLyCrhCn9bRT+vEV/v
	9RsUlF5nPd6oOaUDtTtS+oqov3dlYh7j3lIR4XOTfEs6S3xyUT4h/Q4jYmj2P/LS6ZHl
	1eWGAlUf4ZFzX9UArDlrhByPbqcAVY3CFolSCp6xJqsKzfOyW7nGaEfzn8qPm3JCiuWn
	tZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UJzdgtBIRy+CBl2bF7XahFzsRqmwci/kLI7PHSuVGMs=;
	b=j6QtiNcheblcOXszZpLiKIoHke4gnby0CY/AXXx3V04MrRab5yZI6lvcoPkrhazKtE
	01yNlrEUeV7T1Y0srf4yTmg28vM7f4AmIi9uZU+fU03pw3GSWfetdaxH10ybmrk1E2OM
	C1Bh0N5+EBYDs8ayBoVQvZoIAidRGZIepTV0iTzJ7bOUgTP+SY8ZF6gNd8WKG4+laPcJ
	wUkSH+DKzOuz6NVb8vaGykaS+9jfFvliYgpL4Z/n76BTGdruHVFz9X5kcElBAh6ZCulv
	FH6MJfShwFujz1uh5KKmK4oEJhBPo3sWW2ggQBHQGFZt00Tq9zA2yTKAjHOi0zJ2UoqA
	2Tng==
X-Gm-Message-State: APjAAAUo1Ah+JRm14fSKLIHlUtmhF4Z1rkca7AZihqDBnvbJcgPIFXiJ
	rRVRTuz7E/930OcwrT+Qam9HKasTMbpL7h6ttcw=
X-Google-Smtp-Source: APXvYqw8/VciUrN55c1rGgs4kZW23N7R32UVjxng1il46NEWtEpFlhJRUkCKx5846ZwHX7Ru5mymnOhcdDq0npuksUE=
X-Received: by 2002:a05:6102:21d8:: with SMTP id
	r24mr18248573vsg.83.1576407618176; 
	Sun, 15 Dec 2019 03:00:18 -0800 (PST)
MIME-Version: 1.0
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-7-alex.kanavin@gmail.com>
	<CAMKF1spXie5SDtsJj6R=6hAUjYo8kBTmyj+SfW4rYU+1cWUtig@mail.gmail.com>
In-Reply-To: <CAMKF1spXie5SDtsJj6R=6hAUjYo8kBTmyj+SfW4rYU+1cWUtig@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 15 Dec 2019 12:00:06 +0100
Message-ID: <CANNYZj_k4NmmSAp+r80Ss+jgsd22hYcxRSySqYn7Yby8PCrDJw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/30] gstreamer1.0-python: add a patch to fix python 3.8 builds
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
X-List-Received-Date: Sun, 15 Dec 2019 11:00:17 -0000
Content-Type: multipart/alternative; boundary="0000000000001a4bf10599bc00bc"

--0000000000001a4bf10599bc00bc
Content-Type: text/plain; charset="UTF-8"

This is expected; the patch should be merged together with 3.8 upgrade.

Alex

On Sun, 15 Dec 2019 at 06:21, Khem Raj <raj.khem@gmail.com> wrote:

> this fails with python 3.7
>
> https://errors.yoctoproject.org/Errors/Details/297314/
>
> On Thu, Dec 12, 2019 at 10:15 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...son.build-fix-builds-with-python-3.8.patch | 24 +++++++++++++++++++
> >  .../gstreamer/gstreamer1.0-python_1.16.1.bb   |  4 +++-
> >  2 files changed, 27 insertions(+), 1 deletion(-)
> >  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
> >
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
> > new file mode 100644
> > index 00000000000..053108ad50b
> > --- /dev/null
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
> > @@ -0,0 +1,24 @@
> > +From 61cfd1b49dc82baf14bb36d88b6c5be7b8c3d23a Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Mon, 2 Dec 2019 18:16:41 +0100
> > +Subject: [PATCH] meson.build: fix builds with python 3.8
> > +
> > +Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/gstreamer/gst-python/merge_requests/14]
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + meson.build | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/meson.build b/meson.build
> > +index 1da81d5..3e0db38 100644
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -24,7 +24,7 @@ pygobject_dep = dependency('pygobject-3.0', fallback:
> ['pygobject', 'pygobject_d
> > +
> > + pymod = import('python')
> > + python = pymod.find_installation(get_option('python'))
> > +-python_dep = python.dependency(required : true)
> > ++python_dep = dependency('python3-embed', required : true)
> > +
> > + python_abi_flags = python.get_variable('ABIFLAGS', '')
> > + pylib_loc = get_option('libpython-dir')
> > diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-python_1.16.1.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-python_1.16.1.bb
> > index b770ec060e1..0382360ec26 100644
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
> > @@ -5,7 +5,9 @@ SECTION = "multimedia"
> >  LICENSE = "LGPLv2.1"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
> >
> > -SRC_URI = "
> https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
> > +SRC_URI = "
> https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
> > +           file://0001-meson.build-fix-builds-with-python-3.8.patch \
> > +           "
> >  SRC_URI[md5sum] = "499645fbd1790c5845c02a3998dccc1b"
> >  SRC_URI[sha256sum] =
> "b469c8955126f41b8ce0bf689b7029f182cd305f422b3a8df35b780bd8347489"
> >
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000001a4bf10599bc00bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is expected; the patch should be merged together=
 with 3.8 upgrade.</div><div><br></div><div>Alex<br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 15 Dec 20=
19 at 06:21, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">this fails with python 3.7<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/297314/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/297314/</a><br>
<br>
On Thu, Dec 12, 2019 at 10:15 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...son.build-fix-builds-with-python-3.8.patch | 24 +++++++++++++=
++++++<br>
&gt;=C2=A0 .../gstreamer/<a href=3D"http://gstreamer1.0-python_1.16.1.bb" r=
el=3D"noreferrer" target=3D"_blank">gstreamer1.0-python_1.16.1.bb</a>=C2=A0=
 =C2=A0|=C2=A0 4 +++-<br>
&gt;=C2=A0 2 files changed, 27 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0-python/0001-meson.build-fix-builds-with-python-3.8.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/000=
1-meson.build-fix-builds-with-python-3.8.patch b/meta/recipes-multimedia/gs=
treamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.pat=
ch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..053108ad50b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson=
.build-fix-builds-with-python-3.8.patch<br>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +From 61cfd1b49dc82baf14bb36d88b6c5be7b8c3d23a Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +Date: Mon, 2 Dec 2019 18:16:41 +0100<br>
&gt; +Subject: [PATCH] meson.build: fix builds with python 3.8<br>
&gt; +<br>
&gt; +Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org=
/gstreamer/gst-python/merge_requests/14" rel=3D"noreferrer" target=3D"_blan=
k">https://gitlab.freedesktop.org/gstreamer/gst-python/merge_requests/14</a=
>]<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + meson.build | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/meson.build b/meson.build<br>
&gt; +index 1da81d5..3e0db38 100644<br>
&gt; +--- a/meson.build<br>
&gt; ++++ b/meson.build<br>
&gt; +@@ -24,7 +24,7 @@ pygobject_dep =3D dependency(&#39;pygobject-3.0&#39=
;, fallback: [&#39;pygobject&#39;, &#39;pygobject_d<br>
&gt; +<br>
&gt; + pymod =3D import(&#39;python&#39;)<br>
&gt; + python =3D pymod.find_installation(get_option(&#39;python&#39;))<br>
&gt; +-python_dep =3D python.dependency(required : true)<br>
&gt; ++python_dep =3D dependency(&#39;python3-embed&#39;, required : true)<=
br>
&gt; +<br>
&gt; + python_abi_flags =3D python.get_variable(&#39;ABIFLAGS&#39;, &#39;&#=
39;)<br>
&gt; + pylib_loc =3D get_option(&#39;libpython-dir&#39;)<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstre=
amer1.0-python_1.16.1.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0=
-python_1.16.1.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http:/=
/gstreamer1.0-python_1.16.1.bb" rel=3D"noreferrer" target=3D"_blank">gstrea=
mer1.0-python_1.16.1.bb</a><br>
&gt; index b770ec060e1..0382360ec26 100644<br>
&gt; --- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0=
-python_1.16.1.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-python=
_1.16.1.bb</a><br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0=
-python_1.16.1.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-python=
_1.16.1.bb</a><br>
&gt; @@ -5,7 +5,9 @@ SECTION =3D &quot;multimedia&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;LGPLv2.1&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc34deae4e395ca07=
e725ab0076a5f740&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedesktop.org/src/$%=
7BPNREAL%7D/$%7BPNREAL%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_b=
lank">https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.x=
z</a>&quot;<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedesktop.org/src/$%=
7BPNREAL%7D/$%7BPNREAL%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_b=
lank">https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.x=
z</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-meson.build-fix-=
builds-with-python-3.8.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;499645fbd1790c5845c02a3998dccc1b&quot;=
<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;b469c8955126f41b8ce0bf689b7029f182c=
d305f422b3a8df35b780bd8347489&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000001a4bf10599bc00bc--
