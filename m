Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3AF4F7F7D8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 21:50:42 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id v19so1489612qkv.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 13:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xZftuWBE2r8UgzQ754z68jUQDjClTh4tVSAfnFuETsc=;
	b=LzuVlNWkOqg1s38kYucnUPQ/Gj2yMzWoHNMlss3zqMnk2tgrjK9sKUgVC8l+UsoGVE
	0ssv4rqXuW5jSti+ATR4vec2Qg5iPFrI4l+qgXKosUGDryqNw3x3MsFmEcKUbOrj/LJ1
	jipQLzvad3eQI6R/5DYjfClBpLjOOPfN9AgY4Yeb5sjkpQLQ4AN80dGfAJf+MTwUfEJE
	9ybssUodXmXEpToQJqwnQiQ69BKZFxEldaOSRtZv2f8vlxAXtr4sWTm7zpqxC3rV3mnq
	FLINqOgHPhSNF+7wTDncoswqRE6XN3CLnfOx9BLmz/FU2jFwVB9jTr0JSfs40L5Gl6e9
	dADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xZftuWBE2r8UgzQ754z68jUQDjClTh4tVSAfnFuETsc=;
	b=Om2GSh20jJzIDPNRIwExktP17NSJvqmdBmoI23QLrp1YYI7al+WvN/6EDvC9LYAF4V
	txU/2ZZG2cc9fYnTC8SZBU5W/XDY7yIOzl4O0HP/Uz4ZHKF7lz4Vjm43Css0h/dGcF7G
	60+uzGt0ECt+BA9/ZLZjFdWiFBIuDi55TFcsgw+R6ueea6DoWZtolrELlHurwz8lSlsF
	T5Ews1piRuKcYJptdyKvwyrCyzNSZ0NJoZKABT1p9RKXpFvF7TWMw3esbZa0wycLjcMc
	UEJEaCgqg9uVPYsAWZXX1GOW1H8UepnYyT8ocQMxbNCAztkDxRDjoERm59s1JStXOvKV
	5+7w==
X-Gm-Message-State: APjAAAUHsSLxKQqibh39ww6q5rSFahXyexZK3nyJVxyrPXIYhSC0gUA1
	EgIA/4nL8IM0fBB0XBQj5qh5vJ0FTKpqPcMleWs=
X-Google-Smtp-Source: APXvYqwnea4UHsDU8ksbWfa/C7U55jBZ0eJuUKMUKZN+sCYRROfXKIRF3XO+5FD0CJqGTNto8hk3uIwu9JQbUEcjdpI=
X-Received: by 2002:a37:a0cf:: with SMTP id j198mr5504726qke.9.1575496242475; 
	Wed, 04 Dec 2019 13:50:42 -0800 (PST)
MIME-Version: 1.0
References: <20191203220624.26500-1-anibal.limon@linaro.org>
	<CAMKF1spabEvBMwjvefWN7ULZ8ZpGfNDgJ1gf75u1B7h3oD4nJg@mail.gmail.com>
	<CA+_AqisSN24sPo5vOzeGY4Kdb_mmQxGArCu0Kw6yeSBv-a+QHw@mail.gmail.com>
	<CANNYZj90w9QghK8eTdvc-iE7tjONky=bDA=98Mr5ccH0sjgF4g@mail.gmail.com>
	<CA+_AqisJ1+g7Btaq-T-SmSVXLsM0iePfxbq2mgbz+1VSSvDYZw@mail.gmail.com>
	<CANNYZj_PLwj3LUGUq6BvZycwoZJOnANVk8bbwLPPxptBWE+n8Q@mail.gmail.com>
	<814a4b72-0c15-f420-f579-46c92f8b93e9@intel.com>
In-Reply-To: <814a4b72-0c15-f420-f579-46c92f8b93e9@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Dec 2019 13:50:31 -0800
Message-ID: <CAMKF1spFuYeip7Q_uDxjSCKPJidY4DM+_450+PsLJCXSLs2gzA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/classes/meson.bbclass: Add inherit setuptools3
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
X-List-Received-Date: Wed, 04 Dec 2019 21:50:42 -0000
Content-Type: multipart/alternative; boundary="000000000000e0ba970598e7cdc9"

--000000000000e0ba970598e7cdc9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2019 at 1:16 PM Ross Burton <ross.burton@intel.com> wrote:

> On 04/12/2019 18:42, Alexander Kanavin wrote:
> > On Wed, 4 Dec 2019 at 19:35, Anibal Limon <anibal.limon@linaro.org
> > <mailto:anibal.limon@linaro.org>> wrote:
> >
> >
> >
> >     On Wed, 4 Dec 2019 at 04:20, Alexander Kanavin
> >     <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>> wrote:
> >
> >         I tend to agree with Khem; this change will pull in target
> >         python as build and runtime dependency to all meson-using
> >         recipes, even those that have nothing to do with python.
> >
> >
> >     Ok, it depends on python3-setuptools-native I will add this inherit
> >     on waffle recipe.
> >
> >
> > Do test this change; I believe you actually need a dependency on target
> > python3.
>
> I'd say that if the true dependency is just python3-setuptools-native,
> we can just add that to meson.bbclass as it's not really invasive.  If
> it was a target dependency that is different of course.


I think so too late if meson is demanding for setup tools then it should be
in meson bbclass I was thinking that it=E2=80=99s a outlier but seems not

>
>
> Ross
>
>

--000000000000e0ba970598e7cdc9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Dec 4, 2019 at 1:16 PM Ross Burton &lt;<a href=3D"m=
ailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On 04/12/2019 18:42, Alexander Kanavin wrote=
:<br>
&gt; On Wed, 4 Dec 2019 at 19:35, Anibal Limon &lt;<a href=3D"mailto:anibal=
.limon@linaro.org" target=3D"_blank">anibal.limon@linaro.org</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:anibal.limon@linaro.org" target=3D"_blank=
">anibal.limon@linaro.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Wed, 4 Dec 2019 at 04:20, Alexander Kanavin<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:alex.kanavin@gmail.com" targe=
t=3D"_blank">alex.kanavin@gmail.com</a> &lt;mailto:<a href=3D"mailto:alex.k=
anavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;&gt; wrot=
e:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I tend to agree with Khem; this chang=
e will pull in target<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python as build and runtime dependenc=
y to all meson-using<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recipes, even those that have nothing=
 to do with python.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Ok, it depends on python3-setuptools-native I will =
add this inherit<br>
&gt;=C2=A0 =C2=A0 =C2=A0on waffle recipe.<br>
&gt; <br>
&gt; <br>
&gt; Do test this change; I believe you actually need a dependency on targe=
t <br>
&gt; python3.<br>
<br>
I&#39;d say that if the true dependency is just python3-setuptools-native, =
<br>
we can just add that to meson.bbclass as it&#39;s not really invasive.=C2=
=A0 If <br>
it was a target dependency that is different of course.</blockquote><div di=
r=3D"auto"><br></div><div dir=3D"auto">I think so too late if meson is dema=
nding for setup tools then it should be in meson bbclass I was thinking tha=
t it=E2=80=99s a outlier but seems not=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><br>
<br>
Ross<br>
<br>
</blockquote></div></div>

--000000000000e0ba970598e7cdc9--
