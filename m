Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2807761682
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 16:04:11 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id m16so4009744wrx.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 08:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=+POxstDwr7Ig1SA2UrIe2UFPTMsrKPuNEcGWeYJ1eRc=;
	b=FuVwUtsB15/S6MAx00MCq64gVNewIDSP/nl/0DNkU6fzMEVZiYQHvI1uh1ZypKeEdh
	7oNAWkQQ8XR/doR4rQUee8Lcf6JcGNgw10pTqd5V1THj6L18Q+8uxkchP3/EeVpZpdbm
	JX+WTm3IYH5o0ZhzmMelutdqq/WJT1DOZYnzAE3Xc0f9GKOu4bOzWnYs6jKyxwX1YfZS
	8QL0H7pcoCGu1fX7Evyom/79KXJEvXeUkjUAcC2dQymD958Q11bFR6ZH7Dcj10Oj4qCv
	KgwGpNHf5jEcWA7sQI063fqdPAjQxTMpxifSii3YlZQeG3LY/mTqHGLoUVJLpF+4+16b
	475g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=+POxstDwr7Ig1SA2UrIe2UFPTMsrKPuNEcGWeYJ1eRc=;
	b=WhFEIYoEt+naTGWw/p1z3/u3jVyHKQ/kX8E/PKKYTMlpBOqApHn6ZY7JKIutdOpFVE
	qscGpSAaGO6z4NVsqFMqmm4nZBELBOTBbhXuiwiIzVeWZ//3UHxD71f0LeSdbl+QTKZs
	6TuBbv2Bzclb9TiBEM7Wv7QyxPD8/wevDDxtTSB8dZmKrv9jjOXXg6clUt1e7UVX5SZe
	rKHElBb8XZ2H0GQ/kmbYlMtD4w5tjlqese3CDBm9KUMvLpTdpp3HttoTgTttBEqL5SSz
	XMMFpyCZtjr36SVhO13Pv/orZaurel0O/YpWpqwYGT5synF0GNIM45QnrkVfQLF6UUBg
	a5Kg==
X-Gm-Message-State: APjAAAXVQhJJ11vkJoepoM+qn7HSrp09hyDRhLRAqYjS1u4M3SLFBNvG
	6cBxRjOlkkLpWRXxGsQjVWy2Dl7zNv1eVALx8lw=
X-Google-Smtp-Source: APXvYqzddwSAsO6DLRz4M5fNa7mARhf0wYJjKWBLRKxJU9BU6caC5d3FasmVPN2NqHhSu2MvWQtw9H6leFWO9VpWLcw=
X-Received: by 2002:a5d:6503:: with SMTP id x3mr4900776wru.241.1582819452515; 
	Thu, 27 Feb 2020 08:04:12 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-8-alex.kanavin@gmail.com>
	<CAMKF1sq9i1=fzsAFiCm+kWPudORLp7gXxpWKZHYF7rRYMN2i0A@mail.gmail.com>
	<CANNYZj_7fu6SHkginQ38BC8QXnP=9MPu3f8NQBTwBgeaAbHvWQ@mail.gmail.com>
	<CAJdd5GafHh1WZsqZ9tGsVNoHw=k9Dxv-taym++3NtVNmnrMqwA@mail.gmail.com>
	<29f3b8e1-6989-c84e-5d50-4012389f0bab@igalia.com>
In-Reply-To: <29f3b8e1-6989-c84e-5d50-4012389f0bab@igalia.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 27 Feb 2020 10:04:01 -0600
Message-ID: <CAJdd5GYJkpTPZdKY9dBSfRbcBRzcoHDJ0UFO+XKN1cbPMkX_xQ@mail.gmail.com>
To: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, webkit-wpe@lists.webkit.org
Subject: Re: [wpe-webkit] [PATCH 08/10] webkitgtk: unbreak wayland build
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
X-List-Received-Date: Thu, 27 Feb 2020 16:04:12 -0000
Content-Type: multipart/alternative; boundary="00000000000035f8e4059f90df49"

--00000000000035f8e4059f90df49
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 27, 2020, 9:49 AM Carlos Alberto Lopez Perez <clopez@igalia.com>
wrote:

> On 23/02/2020 15:33, Joshua Watt wrote:
> > On Sun, Feb 16, 2020 at 2:52 PM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> >>
> >> On Sun, 16 Feb 2020 at 21:15, Khem Raj <raj.khem@gmail.com> wrote:
> >>>
> >>> On Sun, Feb 16, 2020 at 7:52 AM Alexander Kanavin
> >>> <alex.kanavin@gmail.com> wrote:
> >>>>
> >>>> webkit nowadays requires a couple of supplementary libraries for this,
> >>>> so bring them in (courtesy of meta-browser, which will hopefully
> >>>> adjust without a lot of trouble).
> >>>
> >>> its not meta-browser, I guess you should credit meta-wpe here [1]
> >>> and perhaps Cc the meta-wpe maintainer as a courtesy.
> >>
> >>
> >> Actually, it's copied from meta-webkit
> >> https://github.com/Igalia/meta-webkit/
> >> which does not say in the readme who the maintainer is, so I am not
> sure whom to CC.
> >> I can adjust the commit msg though.
> >
> > I've CC'd the WPE mailing list.
> >
> > OE-core now has libwpe and wpebackend-fdo recipes. They should
> > possibly be removed from meta-webkit to prevent duplication.
> >
>
>
> Thanks for the notification. Its great that those recipes are shipped
> now on the oe-core layer.
>
> But I don't want to remove those recipes from meta-webkit, even if they
> are shipped now there.
>
> That recipes are an essential part of meta-webkit, so I want to be able
> to raise the version or change them without depending on oe-core.
> For example: sometimes we need to use older versions of yocto, but we
> still want to use the last stable version of wpe/libwpe/wpebackend-fdo.
> So I find pretty useful to have all the core WPE related recipes on the
> meta-webkit layer and not depend on whatever oe-core ships.
>
> There should be no conflict between the recipes as long as the name used
> for them its the same, bitbake should simply pick the last version by
> default.
>

The version compare actually only matters for recipes in the same layer; if
multiple layers provide the same recipe, the priority of the layers is what
determines which one gets chosen (even if that means an older version in a
higher priority layer would be chosen over a newer version in a lower
priority layer).

Anyway, you should be fine because meta-webkit has a priority of 7 and
oe-core is priority 5, so it will always choose the meta-webkit version, if
that layer is present.


>
> Regards.
>
>

--00000000000035f8e4059f90df49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"auto"><br><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 27,=
 2020, 9:49 AM Carlos Alberto Lopez Perez &lt;<a href=3D"mailto:clopez@igal=
ia.com" target=3D"_blank">clopez@igalia.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On 23/02/2020 15:33, Joshua Watt=
 wrote:<br>
&gt; On Sun, Feb 16, 2020 at 2:52 PM Alexander Kanavin<br>
&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" rel=3D"noreferrer" targe=
t=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Sun, 16 Feb 2020 at 21:15, Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" rel=3D"noreferrer" target=3D"_blank">raj.khem@gmail.com</a>&=
gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Sun, Feb 16, 2020 at 7:52 AM Alexander Kanavin<br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" rel=3D"noreferre=
r" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; webkit nowadays requires a couple of supplementary librari=
es for this,<br>
&gt;&gt;&gt;&gt; so bring them in (courtesy of meta-browser, which will hop=
efully<br>
&gt;&gt;&gt;&gt; adjust without a lot of trouble).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; its not meta-browser, I guess you should credit meta-wpe here =
[1]<br>
&gt;&gt;&gt; and perhaps Cc the meta-wpe maintainer as a courtesy.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Actually, it&#39;s copied from meta-webkit<br>
&gt;&gt; <a href=3D"https://github.com/Igalia/meta-webkit/" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://github.com/Igalia/meta-webkit/</a>=
<br>
&gt;&gt; which does not say in the readme who the maintainer is, so I am no=
t sure whom to CC.<br>
&gt;&gt; I can adjust the commit msg though.<br>
&gt; <br>
&gt; I&#39;ve CC&#39;d the WPE mailing list.<br>
&gt; <br>
&gt; OE-core now has libwpe and wpebackend-fdo recipes. They should<br>
&gt; possibly be removed from meta-webkit to prevent duplication.<br>
&gt; <br>
<br>
<br>
Thanks for the notification. Its great that those recipes are shipped<br>
now on the oe-core layer.<br>
<br>
But I don&#39;t want to remove those recipes from meta-webkit, even if they=
<br>
are shipped now there.<br>
<br>
That recipes are an essential part of meta-webkit, so I want to be able<br>
to raise the version or change them without depending on oe-core.<br>
For example: sometimes we need to use older versions of yocto, but we<br>
still want to use the last stable version of wpe/libwpe/wpebackend-fdo.<br>
So I find pretty useful to have all the core WPE related recipes on the<br>
meta-webkit layer and not depend on whatever oe-core ships.<br>
<br>
There should be no conflict between the recipes as long as the name used<br=
>
for them its the same, bitbake should simply pick the last version by<br>
default.<br></blockquote><div><br></div><div>The version compare actually o=
nly matters for recipes in the same layer; if multiple layers provide the s=
ame recipe, the priority of the layers is what determines which one gets ch=
osen (even if that means an older version in a higher priority layer would =
be chosen over a newer version in a lower priority layer).</div><div><br></=
div><div>Anyway, you should be fine because meta-webkit has a priority of 7=
 and oe-core is priority 5, so it will always choose the meta-webkit versio=
n, if that layer is present.</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
Regards.<br>
<br>
</blockquote></div></div>
</div>

--00000000000035f8e4059f90df49--
