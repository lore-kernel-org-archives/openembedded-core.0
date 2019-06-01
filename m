Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 29FA87E6B9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 11:27:28 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id g18so11791562otj.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 04:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=50JpOUfxi3nWGhx4B215R3e5FB6hSvMWaIjczLL/8oM=;
	b=ZR1TQqAS+mWXCTAQwu6YCoZwb+eqSZgzlW/o+WpoMahXYdMEjk4h7y5smrOfo+YtLK
	8PpnJwA2PW5W4ZeNiKgQRqa1WvAXwXlqy+fAkw0GQzgkI899TtFWoD9YosaajmPvroZE
	HXYUcqODtYXgJ5/SGWuoY+F1tUeKgksaXvs8GycrUss/5fRdi4ITfNDWkjHwhqd19YUj
	aKdCak1Ka+ZUS84djFu/HnKznNKDpiRC4Gt4EKObt9Dyobk6DZIQryNZMVQjDGUT/QZf
	La6L2hkyTWVj1IIYM4i2ahRM6wOpNDWXJTyD1AIUJ/Q0IxO34dFuyIZqvRGB853A0bn2
	eP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=50JpOUfxi3nWGhx4B215R3e5FB6hSvMWaIjczLL/8oM=;
	b=baKBB8zbokq3RZRDrWls3P8aqhGnJCYIi4WEcL6bNzZoUTq3Yv7n71wKOXE6n2L5wO
	biq//BYp+ZBvqhf4wezaBNOvnw4AeOaQHr94TdmBEfDXy2p9Bqh3+/yzS7vRjWm98zAc
	XcGfWmbhzD4jXQasDzvlcFX9Ygha2PVeNWzlKtt47rLzFpOD3xP+GIgMTtSKOvKWbhVY
	AMfCOnWS+FsZAA6BIpjNuvnR6MSUrptsF6MD/wlZcDfIXECBJyBSfvbuluS43/r4QOJS
	Bmz57qfiEFw4I6RRpjiziBnZJCOgoux++fZc2Q1XJBaCb64GEpGk10Eg1/TtJflhMWMs
	cd9Q==
X-Gm-Message-State: APjAAAXSW3Me6vJyDIMhjIQoUw9qZwUiN8Dl34o/Y+xEuzMmxcqy2GcU
	qy5golYxZdyUu7x6unA0E+Y/WSdJh7HFqPVbXHQ=
X-Google-Smtp-Source: APXvYqwhAe+2qiK6LU2Sexa4Gnfbs7N5V9jSGeWCNywbeasrvkmqlKao+hoeJ6rCHQlJI5oDns1B8ONBCib0aBHJze8=
X-Received: by 2002:a9d:694a:: with SMTP id p10mr5205394oto.61.1559388450178; 
	Sat, 01 Jun 2019 04:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190531155612.75663-1-alex.kanavin@gmail.com>
	<20190531155612.75663-4-alex.kanavin@gmail.com>
	<fff0fc5c6076dac037928042f3518549c9a89415.camel@linuxfoundation.org>
In-Reply-To: <fff0fc5c6076dac037928042f3518549c9a89415.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 1 Jun 2019 13:27:13 +0200
Message-ID: <CANNYZj-siXg6cOUCwHJe2nGTHxAPAxdQ1bq9SuT=UzMdQRyexg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] gtk-doc: upgrade 1.29 -> 1.30
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
X-List-Received-Date: Sat, 01 Jun 2019 11:27:29 -0000
Content-Type: multipart/alternative; boundary="000000000000a3cb4c058a416a5c"

--000000000000a3cb4c058a416a5c
Content-Type: text/plain; charset="UTF-8"

Thanks, I just resent the patchset with a fix.

Alex

On Sat, 1 Jun 2019 at 08:31, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2019-05-31 at 17:56 +0200, Alexander Kanavin wrote:
> > Source-highlight support has been replaced upstream with python3-
> > pygments.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch    | 6 +++-
> > --
> >  .../gtk-doc/{gtk-doc_1.29.bb => gtk-doc_1.30.bb}            | 6 +++-
> > --
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> >  rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.29.bb => gtk-
> > doc_1.30.bb} (87%)
>
> I this this update caused a doc failure in libpsl:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/655
>
> Cheers,
>
> Richard
>
>

--000000000000a3cb4c058a416a5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, I just resent the patchset with a fix.</div><=
div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Sat, 1 Jun 2019 at 08:31, Richard Purdi=
e &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@=
linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Fri, 2019-05-31 at 17:56 +0200, Alexander Kanavin wro=
te:<br>
&gt; Source-highlight support has been replaced upstream with python3-<br>
&gt; pygments.<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch=C2=A0 =
=C2=A0 | 6 +++-<br>
&gt; --<br>
&gt;=C2=A0 .../gtk-doc/{<a href=3D"http://gtk-doc_1.29.bb" rel=3D"noreferre=
r" target=3D"_blank">gtk-doc_1.29.bb</a> =3D&gt; <a href=3D"http://gtk-doc_=
1.30.bb" rel=3D"noreferrer" target=3D"_blank">gtk-doc_1.30.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 +++-<br>
&gt; --<br>
&gt;=C2=A0 2 files changed, 6 insertions(+), 6 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-gnome/gtk-doc/{<a href=3D"http://gtk-doc_1.2=
9.bb" rel=3D"noreferrer" target=3D"_blank">gtk-doc_1.29.bb</a> =3D&gt; gtk-=
<br>
&gt; <a href=3D"http://doc_1.30.bb" rel=3D"noreferrer" target=3D"_blank">do=
c_1.30.bb</a>} (87%)<br>
<br>
I this this update caused a doc failure in libpsl:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/69/build=
s/655" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/69/builds/655</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--000000000000a3cb4c058a416a5c--
