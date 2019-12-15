Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8D41C6C23A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 17:06:38 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id 38so3735147qtb.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 09:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GULThGiy5DXZYEmZ7aHbgnjYnRwZiHI9T0WHlj8BNt4=;
	b=IdAmii3ke+U3nnRTT0s3GbcotQAO+F8QNB7IUXPg6FaZdiz0toOztxurQKgnakjgNO
	ykq2lsyoB4hzY1ZLJrDR4eabMCEmSd/Skc6Ml1Xu3zUkfDF71Rl/aosbRO3W+B9u8Zjx
	iiCo7vNVB97DOeak0L69Rpfy80tYRlFgk+Uclox5xrNlcJGx4NEtBlAbNNBJc/nFSkkq
	YV4RVs3dTsKzU7Nkr9HypTwV+NEZDazBePn7KhU71nqB5IIhtMSzyQXGbeBmHD3Q8EuK
	GHK8GLDWt+rsMR3mcB6/qQI+PnhfuIV6AZKgUni+w7k6jDhR5U0dnaf9gBNw2H64svtO
	GWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GULThGiy5DXZYEmZ7aHbgnjYnRwZiHI9T0WHlj8BNt4=;
	b=COWgTyuasXxvbHD9AYg8rey0Jlw9SODLcG1SdYVG1Czvnzi0sjw1cJwMllBM/tNcqd
	2x9sjMQ4p+qahfOMsTuukfn/3EdsKJDD34gU3OC1iBas7a4DKsLKGKQrzsFNRbmmKoM6
	MqSanKPxTe7kMi2OyCU7G4KNuwytF5+Til67EnREKmvkeMedRN4MEYsDEY4mvjRkEO+J
	4roWf7pGLsGDGZZqq5PZP8FGtu+FpzV7/T4gjuKwvVXVDzeDRqIBZCC+RRa8D6B1jJWd
	trk9waZ3P46bLgFMLarS6LKnnc2jtHwCMpTcPqGCVIQWQodBaov9ce1mngCmi0Rrrtl+
	nddg==
X-Gm-Message-State: APjAAAW0/v5T5qYOwzUtsXO0da6Xpc5HPDmyuyxE8Afieg8w8DoTtBe0
	x8A4MHmI+I5zYVqU8qsRTcDGJi5ckIIPItrKQxQ=
X-Google-Smtp-Source: APXvYqwO7n04vnIyIoTOKglS148b6Q39B8VSblJ/fwDmtOe/C06L2j1EF1FvMnWogePnbtKTlEuSPSkEs6PimHWyBqk=
X-Received: by 2002:ac8:145:: with SMTP id f5mr20792650qtg.194.1576429598928; 
	Sun, 15 Dec 2019 09:06:38 -0800 (PST)
MIME-Version: 1.0
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-7-alex.kanavin@gmail.com>
	<CAMKF1spXie5SDtsJj6R=6hAUjYo8kBTmyj+SfW4rYU+1cWUtig@mail.gmail.com>
	<CANNYZj_k4NmmSAp+r80Ss+jgsd22hYcxRSySqYn7Yby8PCrDJw@mail.gmail.com>
In-Reply-To: <CANNYZj_k4NmmSAp+r80Ss+jgsd22hYcxRSySqYn7Yby8PCrDJw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Dec 2019 09:06:28 -0800
Message-ID: <CAMKF1sof2JwFMX=kHVaup_-LA3UjsqrU5iGXZymR5TOzGik1ZA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
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
X-List-Received-Date: Sun, 15 Dec 2019 17:06:38 -0000
Content-Type: multipart/alternative; boundary="00000000000041f4340599c11eaa"

--00000000000041f4340599c11eaa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2019 at 3:00 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> This is expected; the patch should be merged together with 3.8 upgrade.
>

I don=E2=80=99t think this patch is right though since this patch is creati=
ng py3.8
dependency if you want to upstream something that should work with all py3
I think


> Alex
>
> On Sun, 15 Dec 2019 at 06:21, Khem Raj <raj.khem@gmail.com> wrote:
>
>> this fails with python 3.7
>>
>> https://errors.yoctoproject.org/Errors/Details/297314/
>>
>> On Thu, Dec 12, 2019 at 10:15 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> > ---
>> >  ...son.build-fix-builds-with-python-3.8.patch | 24 ++++++++++++++++++=
+
>> >  .../gstreamer/gstreamer1.0-python_1.16.1.bb   |  4 +++-
>> >  2 files changed, 27 insertions(+), 1 deletion(-)
>> >  create mode 100644
>> meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-f=
ix-builds-with-python-3.8.patch
>> >
>> > diff --git
>> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build=
-fix-builds-with-python-3.8.patch
>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build=
-fix-builds-with-python-3.8.patch
>> > new file mode 100644
>> > index 00000000000..053108ad50b
>> > --- /dev/null
>> > +++
>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build=
-fix-builds-with-python-3.8.patch
>> > @@ -0,0 +1,24 @@
>> > +From 61cfd1b49dc82baf14bb36d88b6c5be7b8c3d23a Mon Sep 17 00:00:00 200=
1
>> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
>> > +Date: Mon, 2 Dec 2019 18:16:41 +0100
>> > +Subject: [PATCH] meson.build: fix builds with python 3.8
>> > +
>> > +Upstream-Status: Submitted [
>> https://gitlab.freedesktop.org/gstreamer/gst-python/merge_requests/14]
>> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> > +---
>> > + meson.build | 2 +-
>> > + 1 file changed, 1 insertion(+), 1 deletion(-)
>> > +
>> > +diff --git a/meson.build b/meson.build
>> > +index 1da81d5..3e0db38 100644
>> > +--- a/meson.build
>> > ++++ b/meson.build
>> > +@@ -24,7 +24,7 @@ pygobject_dep =3D dependency('pygobject-3.0',
>> fallback: ['pygobject', 'pygobject_d
>> > +
>> > + pymod =3D import('python')
>> > + python =3D pymod.find_installation(get_option('python'))
>> > +-python_dep =3D python.dependency(required : true)
>> > ++python_dep =3D dependency('python3-embed', required : true)
>> > +
>> > + python_abi_flags =3D python.get_variable('ABIFLAGS', '')
>> > + pylib_loc =3D get_option('libpython-dir')
>> > diff --git a/meta/recipes-multimedia/gstreamer/
>> gstreamer1.0-python_1.16.1.bb b/meta/recipes-multimedia/gstreamer/
>> gstreamer1.0-python_1.16.1.bb
>> > index b770ec060e1..0382360ec26 100644
>> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
>> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
>> > @@ -5,7 +5,9 @@ SECTION =3D "multimedia"
>> >  LICENSE =3D "LGPLv2.1"
>> >  LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3Dc34deae4e395ca07e725ab0076a5f740"
>> >
>> > -SRC_URI =3D "
>> https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
>> > +SRC_URI =3D "
>> https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
>> > +           file://0001-meson.build-fix-builds-with-python-3.8.patch \
>> > +           "
>> >  SRC_URI[md5sum] =3D "499645fbd1790c5845c02a3998dccc1b"
>> >  SRC_URI[sha256sum] =3D
>> "b469c8955126f41b8ce0bf689b7029f182cd305f422b3a8df35b780bd8347489"
>> >
>> > --
>> > 2.17.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--00000000000041f4340599c11eaa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Dec 15, 2019 at 3:00 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>This is expec=
ted; the patch should be merged together with 3.8 upgrade.</div></div></blo=
ckquote><div dir=3D"auto"><br></div><div dir=3D"auto">I don=E2=80=99t think=
 this patch is right though since this patch is creating py3.8 dependency i=
f you want to upstream something that should work with all py3 I think=C2=
=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"ltr"><div></div><div><br></div><div>Alex<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 15 Dec 2019 =
at 06:21, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bla=
nk">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">this fails with python 3.7<br>
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
</blockquote></div></div>

--00000000000041f4340599c11eaa--
