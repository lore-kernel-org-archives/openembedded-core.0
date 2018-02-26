Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id E144C62134
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 16:50:40 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id a75so11559572itd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 08:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=02sHhH6OATtiq7oGcJ++uYWsVn7VGmVeLVplQ+rou1I=;
	b=nbYm6eS2vAje+iS4eCo31y2xRwKuj/KbkVfS7970pcAEOJw+TLUJDm6LxE8YRa75zp
	PkS1Dp/7sBvNek5vcIUjeuCEVUEo+DvG0guyfNmU9jTSjqDSvM95gcDx4semsRc+AjvN
	pQ4eQpSo/yDqR3b83s4CxY53vnp5t68mAR3wYgyc7dTbro4rC2OP4hHomvjp5h5QXcgV
	aD54EFrSC4I65KaLIby8+3sxOLJBz33isgblumm61eBffiaJ1EuXHhDbJ8jR1IOwbfCq
	lW/a4wjNori5s7SA09fszPpe6jKIeiHVtUjK8Sbakz6PNkeR1XP/dkCBxa3SBPDmjDke
	P4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=02sHhH6OATtiq7oGcJ++uYWsVn7VGmVeLVplQ+rou1I=;
	b=JIjZsG76uycQNbZwo5ni+zLh5TPU/57ff1ThOQ24TRGsCqMQzEpqSXtzhnZoq4HsWo
	eYTX+ZkpIFrz7Ksk6XV3Ylzr4xe0Gl7+vR+UVJI02rZB7k26qqVdH1LEE0Fu2KrQ4lbH
	dNhPRLGS6cmSkddPtLaZ7ZhqeSnyOEQQXAVpFdt80buOAL9hgIzhXul0nekugk4s41es
	A9MsVtN0xHrZBjLnxd2u0rBIC80L0HRC5Cqx3JxkwG9SVkYpfB4yMHlo6fhZE0RPVihm
	KPfnK1A8r2F/MRFupuwCsqk5ielYByJ/dxKBVfQckwfKwPEhKhtwth9+cfcf20OOOV6T
	3M0g==
X-Gm-Message-State: APf1xPD9W+f7b4TuzJunuabrOpPLhpn0sT2QeCU7yCQsQsXxMJ5190XB
	QhNTz2y7koUdik6ye1kr/Xc7xcaZW22QlQpD0wZ7+w==
X-Google-Smtp-Source: AG47ELu3hR8RtCv4rtltH83Y4U87wwTuZWeiv0D2LzLEpOLQNQjZ+i/zqb9nAqjCFF2MYSrTG8TzLuR4V4lZzSyTAVs=
X-Received: by 10.36.34.11 with SMTP id o11mr8621664ito.60.1519663841801; Mon,
	26 Feb 2018 08:50:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Mon, 26 Feb 2018 08:50:21 -0800 (PST)
In-Reply-To: <1519662784.2806.67.camel@gmail.com>
References: <20180222105116.4102-1-ross.burton@intel.com>
	<1519662784.2806.67.camel@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Feb 2018 16:50:21 +0000
Message-ID: <CAJTo0Lbe9dRMw4shr7+3MC7MVu67aUWeEwdH257cNr3COyj+yQ@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: "Kanavin, Alexander" <alexander.kanavin@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] maintainers: update for change to icecc-create-env recipe name
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
X-List-Received-Date: Mon, 26 Feb 2018 16:50:41 -0000
Content-Type: multipart/alternative; boundary="001a113f77ba7813ff0566204f22"

--001a113f77ba7813ff0566204f22
Content-Type: text/plain; charset="UTF-8"

I think Alex would be very happy with this.  Can you submit a patch?

Ross

On 26 February 2018 at 16:33, Joshua Watt <jpewhacker@gmail.com> wrote:

> On Thu, 2018-02-22 at 10:51 +0000, Ross Burton wrote:
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/conf/distro/include/maintainers.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> > b/meta/conf/distro/include/maintainers.inc
> > index 59906f8b6de..965fd34ca04 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -266,7 +266,7 @@ RECIPE_MAINTAINER_pn-help2man-native = "Hongxu
> > Jia <hongxu.jia@windriver.com>"
> >  RECIPE_MAINTAINER_pn-hicolor-icon-theme = "Maxin B. John <maxin.john
> > @intel.com>"
> >  RECIPE_MAINTAINER_pn-hwlatdetect = "Alexander Kanavin <alexander.kan
> > avin@intel.com>"
> >  RECIPE_MAINTAINER_pn-i2c-tools = "Maxin B. John <maxin.john@intel.co
> > m>"
> > -RECIPE_MAINTAINER_pn-icecc-create-env-native = "Alexander Kanavin <a
> > lexander.kanavin@intel.com>"
> > +RECIPE_MAINTAINER_pn-icecc-create-env = "Alexander Kanavin
> > <alexander.kanavin@intel.com>"
>
> Since I basically re-wrote this in its entirety, I would be willing to
> take over ownership if Alexander doesn't want to any more.
>
> >  RECIPE_MAINTAINER_pn-icon-naming-utils = "Alexander Kanavin
> > <alexander.kanavin@intel.com>"
> >  RECIPE_MAINTAINER_pn-icu = "Alexander Kanavin <alexander.kanavin@int
> > el.com>"
> >  RECIPE_MAINTAINER_pn-ifupdown = "Maxin B. John <maxin.john@intel.com
> > >"
> > --
> > 2.11.0
> >
>

--001a113f77ba7813ff0566204f22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think Alex would be very happy with this.=C2=A0 Can you =
submit a patch?<div><br></div><div>Ross</div></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On 26 February 2018 at 16:33, Joshua Watt=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:jpewhacker@gmail.com" target=3D"_b=
lank">jpewhacker@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><span class=3D"">On Thu, 2018-02-22 at 10:51 +0000, Ross Burton wro=
te:<br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com=
">ross.burton@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/<wbr>maintainers.inc | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/<wbr>maintainers.inc<br>
&gt; b/meta/conf/distro/include/<wbr>maintainers.inc<br>
&gt; index 59906f8b6de..965fd34ca04 100644<br>
&gt; --- a/meta/conf/distro/include/<wbr>maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/<wbr>maintainers.inc<br>
&gt; @@ -266,7 +266,7 @@ RECIPE_MAINTAINER_pn-help2man-<wbr>native =3D &quo=
t;Hongxu<br>
&gt; Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.jia@windriv=
er.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-hicolor-<wbr>icon-theme =3D &quot;Maxin B. =
John &lt;maxin.john<br>
&gt; @<a href=3D"http://intel.com" rel=3D"noreferrer" target=3D"_blank">int=
el.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-<wbr>hwlatdetect =3D &quot;Alexander Kanavi=
n &lt;alexander.kan<br>
&gt; <a href=3D"mailto:avin@intel.com">avin@intel.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-i2c-tools =3D &quot;Maxin B. John &lt;<a hr=
ef=3D"mailto:maxin.john@intel.co">maxin.john@intel.co</a><br>
&gt; m&gt;&quot;<br>
&gt; -RECIPE_MAINTAINER_pn-icecc-<wbr>create-env-native =3D &quot;Alexander=
 Kanavin &lt;a<br>
&gt; <a href=3D"mailto:lexander.kanavin@intel.com">lexander.kanavin@intel.c=
om</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-icecc-<wbr>create-env =3D &quot;Alexander Kanavi=
n<br>
&gt; &lt;<a href=3D"mailto:alexander.kanavin@intel.com">alexander.kanavin@i=
ntel.com</a>&gt;&quot;<br>
<br>
</span>Since I basically re-wrote this in its entirety, I would be willing =
to<br>
take over ownership if Alexander doesn&#39;t want to any more.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-icon-<wbr>naming-utils =3D &quot;Alexander =
Kanavin<br>
&gt; &lt;<a href=3D"mailto:alexander.kanavin@intel.com">alexander.kanavin@i=
ntel.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-icu =3D &quot;Alexander Kanavin &lt;alexand=
er.kanavin@int<br>
&gt; <a href=3D"http://el.com" rel=3D"noreferrer" target=3D"_blank">el.com<=
/a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-ifupdown =3D &quot;Maxin B. John &lt;<a hre=
f=3D"mailto:maxin.john@intel.com">maxin.john@intel.com</a><br>
&gt; &gt;&quot;<br>
&gt; --<br>
&gt; 2.11.0<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--001a113f77ba7813ff0566204f22--
