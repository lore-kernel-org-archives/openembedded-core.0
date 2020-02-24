Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7A30460859
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 21:55:34 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id p34so7649348qtb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 13:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xuPsw4oI3ucl3Q92HhqJYDB/Pgv2VAcgvX3VpFO9gR4=;
	b=DioP4oOjZifG+Vo26VyUBX6on/tml9LEjzEJnxTEBz8awl8duV/p2hEs1wl2shjOqc
	/XOQkWL6TJOQhN0eBYhh20grBdNG6uJ25g0es4iFJxv75QVDyGmNrozU38t36KW1HrJT
	KYJ8C+AlVEiVi5zCLlre3M13p2Brqf50RCENboEgd6ZHnOb6L08l2B40VA+G2iBRQ78v
	V6EwYyoj5hXYM+dTUvASY3hed3ajTnGflgFOd6fjaQFTt7l242E1goeriTLSB5c5KR59
	o5OKlOgkmiQcwRA6bDqeGFNQp5wWAhLnjHEvoDOpih1M6jtPrIdX/yfyfctlpyUNsuNw
	dBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xuPsw4oI3ucl3Q92HhqJYDB/Pgv2VAcgvX3VpFO9gR4=;
	b=BVJDRtGHyQIe/xLMd7CiyqnbxWWP64EZYRJfx1v4p9V/NC4Rs1cpb6CUPjuWKYhl4E
	ymQjDFG4mNwrrOhAYOjMnRCyi8Lq08o14r5HG7zJHN8OtL+qOKioUpp7vEkqUmL/bGfi
	cLCtQqKep/kKvVU2xbxFZuZnmrqgyxAQUYFBp7fnGkQQKdI+Xns9IDKfEXVqws79wIkh
	uBzrOZpfzBcMi9mQoeAQwWt+qq/Y08nOoIh8YRFOwXX/19MFv4Zt5Ib45obDF3PXzFoQ
	vXYMuKtb8lxXSSgHsX2xn7YVAmoYXlUREeVjpIqqYpt+buMhqENK3T3c9DhswYvZqHit
	21jw==
X-Gm-Message-State: APjAAAX4qtdRPZQzNNMALHHVH0UWNpvYmAi1WYozPEKted7RERSmJIY1
	gV7i0bwSHhPq8aWSLGb3FjgBiCzgRtVkDCImUqI=
X-Google-Smtp-Source: APXvYqx3InpSvFZyhQjjcZYxyfWJMnCawyiuIo6dn+1YHMOgX2x0EvdGkIuMMfIoyTjpm3kgT7qFdtJ5kgPDwOMrY5w=
X-Received: by 2002:ac8:4e3c:: with SMTP id d28mr50004712qtw.190.1582581334988;
	Mon, 24 Feb 2020 13:55:34 -0800 (PST)
MIME-Version: 1.0
References: <20200224141457.10825-1-brgl@bgdev.pl>
	<CAMKF1spm80Q00dYO8QAyqV+bAmgoqk94uYNjtkdCKZnbpr8XnA@mail.gmail.com>
	<CAMpxmJUQusczgCZro7YXFYB3NCmR_K7Zgk6sp7TDqcRfy=ZRMA@mail.gmail.com>
In-Reply-To: <CAMpxmJUQusczgCZro7YXFYB3NCmR_K7Zgk6sp7TDqcRfy=ZRMA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Feb 2020 13:55:24 -0800
Message-ID: <CAMKF1soeRhL_Zi4t3qnJC-ifQrjDWg_dVaxDjdrWQuWk1Ger3A@mail.gmail.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image_types: fix checksum conversion dependencies
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
X-List-Received-Date: Mon, 24 Feb 2020 21:55:34 -0000
Content-Type: multipart/alternative; boundary="0000000000004cdca3059f596ecb"

--0000000000004cdca3059f596ecb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 10:39 AM Bartosz Golaszewski <
bgolaszewski@baylibre.com> wrote:

> pon., 24 lut 2020 o 17:07 Khem Raj <raj.khem@gmail.com> napisa=C5=82(a):
> >
> >
> >
> > On Mon, Feb 24, 2020 at 6:15 AM Bartosz Golaszewski <brgl@bgdev.pl>
> wrote:
> >>
> >> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >>
> >> Only md5sum and sha256sum tools are provided by HOSTTOOLS. For other
> >> checksum utils, the conversions need to depend on coreutils-native.
> >>
> >> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >> ---
> >>  meta/classes/image_types.bbclass | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.bbclass
> >> index f82f1d8862..63ffbac7e6 100644
> >> --- a/meta/classes/image_types.bbclass
> >> +++ b/meta/classes/image_types.bbclass
> >> @@ -315,6 +315,10 @@ CONVERSION_DEPENDS_lzo =3D "lzop-native"
> >>  CONVERSION_DEPENDS_zip =3D "zip-native"
> >>  CONVERSION_DEPENDS_zst =3D "zstd-native"
> >>  CONVERSION_DEPENDS_sum =3D "mtd-utils-native"
> >> +CONVERSION_DEPENDS_sha1sum =3D "coreutils-native"
> >> +CONVERSION_DEPENDS_sha224sum =3D "coreutils-native"
> >> +CONVERSION_DEPENDS_sha384sum =3D "coreutils-native"
> >> +CONVERSION_DEPENDS_sha512sum =3D "coreutils-native"
> >
> >
> > If they are common enough on host distros then perhaps add them to
> HOSTTOOLS might be better
> >
>
> They are part of coreutils although I'm not sure how common they are
> in distros. They're not commonly used in poky recipes so I'd say it's
> fine for them to use coreutils-native.
>

If they are in centos7 baseinstall then we should be fine to add it to
hosttools

>
> Bart
>

--0000000000004cdca3059f596ecb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Feb 24, 2020 at 10:39 AM Bartosz Golaszewski &lt;<a=
 href=3D"mailto:bgolaszewski@baylibre.com">bgolaszewski@baylibre.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">pon., 24 lut 2020 o 17:07 =
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt; napisa=C5=82(a):<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Feb 24, 2020 at 6:15 AM Bartosz Golaszewski &lt;<a href=3D"mai=
lto:brgl@bgdev.pl" target=3D"_blank">brgl@bgdev.pl</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Bartosz Golaszewski &lt;<a href=3D"mailto:bgolaszewski@bayli=
bre.com" target=3D"_blank">bgolaszewski@baylibre.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Only md5sum and sha256sum tools are provided by HOSTTOOLS. For oth=
er<br>
&gt;&gt; checksum utils, the conversions need to depend on coreutils-native=
.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Bartosz Golaszewski &lt;<a href=3D"mailto:bgolaszew=
ski@baylibre.com" target=3D"_blank">bgolaszewski@baylibre.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/classes/image_types.bbclass | 4 ++++<br>
&gt;&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes/image_types.bbclass b/meta/classes/image=
_types.bbclass<br>
&gt;&gt; index f82f1d8862..63ffbac7e6 100644<br>
&gt;&gt; --- a/meta/classes/image_types.bbclass<br>
&gt;&gt; +++ b/meta/classes/image_types.bbclass<br>
&gt;&gt; @@ -315,6 +315,10 @@ CONVERSION_DEPENDS_lzo =3D &quot;lzop-native&=
quot;<br>
&gt;&gt;=C2=A0 CONVERSION_DEPENDS_zip =3D &quot;zip-native&quot;<br>
&gt;&gt;=C2=A0 CONVERSION_DEPENDS_zst =3D &quot;zstd-native&quot;<br>
&gt;&gt;=C2=A0 CONVERSION_DEPENDS_sum =3D &quot;mtd-utils-native&quot;<br>
&gt;&gt; +CONVERSION_DEPENDS_sha1sum =3D &quot;coreutils-native&quot;<br>
&gt;&gt; +CONVERSION_DEPENDS_sha224sum =3D &quot;coreutils-native&quot;<br>
&gt;&gt; +CONVERSION_DEPENDS_sha384sum =3D &quot;coreutils-native&quot;<br>
&gt;&gt; +CONVERSION_DEPENDS_sha512sum =3D &quot;coreutils-native&quot;<br>
&gt;<br>
&gt;<br>
&gt; If they are common enough on host distros then perhaps add them to HOS=
TTOOLS might be better<br>
&gt;<br>
<br>
They are part of coreutils although I&#39;m not sure how common they are<br=
>
in distros. They&#39;re not commonly used in poky recipes so I&#39;d say it=
&#39;s<br>
fine for them to use coreutils-native.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">If they are in c=
entos7 baseinstall then we should be fine to add it to hosttools=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><br>
Bart<br>
</blockquote></div></div>

--0000000000004cdca3059f596ecb--
