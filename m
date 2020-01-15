Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 42BE57D3B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 01:25:59 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id h8so16080572iob.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 17:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NfjOO9zrMrs5Y2CxEj6trP5YicSXLw/vXVNe3gJhUqI=;
	b=qDbb8FuofAdE77bU+X2hXhjS8PdX9MtZWIW3/Lj28k4UVmeUVvf4RsHkbf6tFSl9il
	ycKC0St0X8ozwDedkwG7CzVBHFa1G/ZEBr04bPQ962IWDsmlQIAa6hSFcHqjaG3kyeCm
	I+rWpzoCt7PSMJ8YRWvEE1eej2nh7Bd5w0cvzobt1AROm442F+56Ob7QkhvzckjgOmqk
	miFlyfZUX3f2jj5McC3RgxLI9nG3ED09iVFSn31A+mWAbCoBIFLm8IeK547fwlMLSk2h
	CXP5kvB9VAY7uQnwC6sJ3x3hP9E0xXZn4GRBYoVe0weLG1ayoisVxHI7qxok6IP60v5N
	f0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NfjOO9zrMrs5Y2CxEj6trP5YicSXLw/vXVNe3gJhUqI=;
	b=Mc9vib2C4fj/+QYl9Wu5igGW2TUkolBg8AkK0c10cilA6byBwOesHGy7f8no48vyQj
	X31ouldBqtQ4tYGFmE/PMA3y5ViLkVzZNSl+H8twpDOLqQ4OaZ437/BUERn3N+af9Q48
	AC7AUIVjVlw/3DKA6vyQ//6Dv9MPD+SsZN/vh01VDKBc4vjS0DcnqFhruFZd3Tuv9SZD
	tYtJwBGjFUrH3akTjQ+1GOXP1aXiIbQiGac9NcdZ41v9GjiaUMLvLp3aRImZNiPR0cEl
	ODC9DM9M7QONKEq8DDYRGTnsN38u+jTgEEF2s30JjdyydH6tjvKcqO8OvOhNLucM6vvu
	yUkg==
X-Gm-Message-State: APjAAAWZJVKnlL69nZsdvUp1lRxk2tP5oxhHr+dfEsZ/haDZiRemuaVF
	mxsGsHdXFee/hI0mVZjbQ2kxY522yWrtNaJnLg8=
X-Google-Smtp-Source: APXvYqwmSa7miyNjybZ3tW5mRzpdYlZIkQb9fDAam5UKzBEjAWiqEWB7xV0jtC78ZA3y+ppjBoU1MKx9+HSgE0AI4zo=
X-Received: by 2002:a02:b808:: with SMTP id o8mr22556882jam.104.1579051560804; 
	Tue, 14 Jan 2020 17:26:00 -0800 (PST)
MIME-Version: 1.0
References: <20200113211005.14693-1-maxime.roussinbelanger@gmail.com>
	<CANNYZj-2ZLcTC7j=SGTY5O6h-Z2FNRZnkNgzQcWNedSDnPBZUA@mail.gmail.com>
In-Reply-To: <CANNYZj-2ZLcTC7j=SGTY5O6h-Z2FNRZnkNgzQcWNedSDnPBZUA@mail.gmail.com>
From: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Date: Tue, 14 Jan 2020 20:25:35 -0500
Message-ID: <CAE=T-s6n8LLsucxfy3kioMqaAvG5gQenwNpsGqW55Gf8a_3NVQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] meta: gdk-pixbuf: add man packageconfig
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
X-List-Received-Date: Wed, 15 Jan 2020 01:26:00 -0000
Content-Type: multipart/alternative; boundary="0000000000005d245e059c2397a0"

--0000000000005d245e059c2397a0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have modified the recipe to use manpages, but it is impossible to run a
build from master, because
of my python3 pyenv setup. I had to add

+DEPENDS =3D "python3-native"

to ca-certificates, without it was impossible to go through the
do_configure step. It was using the python3
from my system instead of the one provided by yocto? I am a bit lost here.

What do you think? Should it have python3-native? There is a fairly recent
patch
to use python3 `file://0001-certdata2pem.py-use-python3.patch`

Thanks,
Max.

On Mon, Jan 13, 2020 at 4:20 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:
>
> The correct way to configure this is to inherit manpages class, and name
the option 'manpages' as well.
>
> Alex
>
> On Mon, 13 Jan 2020 at 22:10, Maxime Roussin-B=C3=A9langer <
maxime.roussinbelanger@gmail.com> wrote:
>>
>> The current default for the meson configuration is to build
>> the man. It will only do it if it finds the xsltproc binary
>> and man option (default: on).
>>
>> Adding the packageconfig make sure that xsltproc will be
>> found in the correct path (recipe-sysroot-native) and that
>> the docbook can be used.
>>
>> The docbook is needed because xsltproc is used with the
>> --nonet option, which prevents the uses of the internet to
>> fetch DFD's.
>>
>> This recipe has been working for probably everyone with the
>> current configuration, however if for some reason xsltproc
>> can be found inside PATH, meson will use it.
>>
>> Signed-off-by: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gmai=
l.com>
>> ---
>>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
>> index 699c4ecd0b..f6cc25cd8c 100644
>> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
>> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
>> @@ -53,6 +53,7 @@ PACKAGECONFIG[png] =3D "-Dpng=3Dtrue,-Dpng=3Dfalse,lib=
png"
>>  PACKAGECONFIG[jpeg] =3D "-Djpeg=3Dtrue,-Djpeg=3Dfalse,jpeg"
>>  PACKAGECONFIG[tiff] =3D "-Dtiff=3Dtrue,-Dtiff=3Dfalse,tiff"
>>  PACKAGECONFIG[jpeg2000] =3D "-Djasper=3Dtrue,-Djasper=3Dfalse,jasper"
>> +PACKAGECONFIG[man] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxslt-native
docbook-xsl-stylesheets-native,"
>>
>>  PACKAGECONFIG[x11] =3D "-Dx11=3Dtrue,-Dx11=3Dfalse,virtual/libx11"
>>
>> --
>> 2.20.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--0000000000005d245e059c2397a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have modified the recipe to use manpages, but it is impo=
ssible to run a build from master, because<div>of my python3 pyenv setup. I=
 had to add</div><div><br></div><div>+DEPENDS =3D &quot;python3-native&quot=
;</div><div><br></div><div>to ca-certificates, without it was impossible to=
 go through the do_configure step. It was using the python3</div><div>from =
my system instead of the one provided by yocto? I am a bit lost here.</div>=
<div><br></div><div>What do you think? Should it have python3-native? There=
 is a fairly recent patch</div><div>to use python3 `file://0001-certdata2pe=
m.py-use-python3.patch`</div><div><br></div><div>Thanks,</div><div>Max.</di=
v><div><br>On Mon, Jan 13, 2020 at 4:20 PM Alexander Kanavin &lt;<a href=3D=
"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br>&g=
t;<br>&gt; The correct way to configure this is to inherit manpages class, =
and name the option &#39;manpages&#39; as well.<br>&gt;<br>&gt; Alex<br>&gt=
;<br>&gt; On Mon, 13 Jan 2020 at 22:10, Maxime Roussin-B=C3=A9langer &lt;<a=
 href=3D"mailto:maxime.roussinbelanger@gmail.com">maxime.roussinbelanger@gm=
ail.com</a>&gt; wrote:<br>&gt;&gt;<br>&gt;&gt; The current default for the =
meson configuration is to build<br>&gt;&gt; the man. It will only do it if =
it finds the xsltproc binary<br>&gt;&gt; and man option (default: on).<br>&=
gt;&gt;<br>&gt;&gt; Adding the packageconfig make sure that xsltproc will b=
e<br>&gt;&gt; found in the correct path (recipe-sysroot-native) and that<br=
>&gt;&gt; the docbook can be used.<br>&gt;&gt;<br>&gt;&gt; The docbook is n=
eeded because xsltproc is used with the<br>&gt;&gt; --nonet option, which p=
revents the uses of the internet to<br>&gt;&gt; fetch DFD&#39;s.<br>&gt;&gt=
;<br>&gt;&gt; This recipe has been working for probably everyone with the<b=
r>&gt;&gt; current configuration, however if for some reason xsltproc<br>&g=
t;&gt; can be found inside PATH, meson will use it.<br>&gt;&gt;<br>&gt;&gt;=
 Signed-off-by: Maxime Roussin-B=C3=A9langer &lt;<a href=3D"mailto:maxime.r=
oussinbelanger@gmail.com">maxime.roussinbelanger@gmail.com</a>&gt;<br>&gt;&=
gt; ---<br>&gt;&gt; =C2=A0meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://g=
dk-pixbuf_2.40.0.bb">gdk-pixbuf_2.40.0.bb</a> | 1 +<br>&gt;&gt; =C2=A01 fil=
e changed, 1 insertion(+)<br>&gt;&gt;<br>&gt;&gt; diff --git a/meta/recipes=
-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.40.0.bb">gdk-pixbuf_2.40.0=
.bb</a> b/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.40.0=
.bb">gdk-pixbuf_2.40.0.bb</a><br>&gt;&gt; index 699c4ecd0b..f6cc25cd8c 1006=
44<br>&gt;&gt; --- a/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pi=
xbuf_2.40.0.bb">gdk-pixbuf_2.40.0.bb</a><br>&gt;&gt; +++ b/meta/recipes-gno=
me/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.40.0.bb">gdk-pixbuf_2.40.0.bb<=
/a><br>&gt;&gt; @@ -53,6 +53,7 @@ PACKAGECONFIG[png] =3D &quot;-Dpng=3Dtrue=
,-Dpng=3Dfalse,libpng&quot;<br>&gt;&gt; =C2=A0PACKAGECONFIG[jpeg] =3D &quot=
;-Djpeg=3Dtrue,-Djpeg=3Dfalse,jpeg&quot;<br>&gt;&gt; =C2=A0PACKAGECONFIG[ti=
ff] =3D &quot;-Dtiff=3Dtrue,-Dtiff=3Dfalse,tiff&quot;<br>&gt;&gt; =C2=A0PAC=
KAGECONFIG[jpeg2000] =3D &quot;-Djasper=3Dtrue,-Djasper=3Dfalse,jasper&quot=
;<br>&gt;&gt; +PACKAGECONFIG[man] =3D &quot;-Dman=3Dtrue,-Dman=3Dfalse,libx=
slt-native docbook-xsl-stylesheets-native,&quot;<br>&gt;&gt;<br>&gt;&gt; =
=C2=A0PACKAGECONFIG[x11] =3D &quot;-Dx11=3Dtrue,-Dx11=3Dfalse,virtual/libx1=
1&quot;<br>&gt;&gt;<br>&gt;&gt; --<br>&gt;&gt; 2.20.1<br>&gt;&gt;<br>&gt;&g=
t; --<br>&gt;&gt; _______________________________________________<br>&gt;&g=
t; Openembedded-core mailing list<br>&gt;&gt; <a href=3D"mailto:Openembedde=
d-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>=
<br>&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/open=
embedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-=
core</a></div></div>

--0000000000005d245e059c2397a0--
