Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5E8C27F8A2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 01:29:54 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id d73so710742wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 17:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OaPRs3oFT91OpqIKCxzvXXj6xOhuMNR8Y3ssA8Qrs5U=;
	b=tUiMTSoO6gdkHQv+DWWU3J4LjWle6APGaXwMioUmgT2D64/OoVNZ7uk2uMIshXBWte
	SqgOU7DEbccZGAdAKHG19iCADkrUmvXhGQdLwg7BV5TYG261DoP2mEUJy2K8jb13t+f7
	iX4bJQPlWLMPnlda2HKzvL0bh3qqJryzIVr/E7FWZsnZDwONW7mPkVRZI0g7V6tzQ4Wl
	dw+JiqPU2UbiEUe6msTfAe06hHP6pU8ZlN+GsC440o2sBx6OkWjMYRWeOtTmQ3sAig6/
	4jVpRIVN6XYATe3UOl9ImNKi9b5foNvI2BAVBlARLaHpipsgYoi7DNvCUb2LKGNmmURn
	Z5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OaPRs3oFT91OpqIKCxzvXXj6xOhuMNR8Y3ssA8Qrs5U=;
	b=hShgu86WSyd/r22meezZlN9Mi4EJu0GfGwN7+5DmxygDSJQouD1CpX7zqATg+JRVuZ
	Mfjg7Sh6TUl9qWK+QX/fmrk9WjuYLV4/XzoAyPUgIZr/kMRE/SB69nR82hJitd5Abed4
	62GhzGJHCCHhM3UILXGOM+OCzgPukglgJQ+mZZzP5Z/cEiSyUMBs4OwuWHDf3u6jflws
	i7M4ZPHZchcjRvSIuHSbSkdHkpn2pSMzEZkFespJNmkhu4yj9GaHOmbZaaAIfuWNwhil
	luAFmk+wY9IMVlHh00MiU65WV8zUUPQb9tjGfTj+5xDQX2k8Gp1mOGyfayDTvKvdqmQN
	jhSQ==
X-Gm-Message-State: APjAAAVYDfugQNwejL8PZlYiztYP4HzICqnDSwVRWy+M3BKoC9DUpp0p
	lMTP6ao9QDlspAaFNMHMX0skbLafv6ZoHNt/yIs=
X-Google-Smtp-Source: APXvYqznMbx3LrIDm+n40TMj0nJPj+s8ok63Io0NqHGxyrq0POoI9HnwQtULhT/7Q6HufuA5DEx4oo0GsELoaGooHl0=
X-Received: by 2002:a1c:7715:: with SMTP id t21mr16200336wmi.149.1576286995018;
	Fri, 13 Dec 2019 17:29:55 -0800 (PST)
MIME-Version: 1.0
References: <20191213220309.3964324-1-JPEWhacker@gmail.com>
	<20191214005448.162460-1-JPEWhacker@gmail.com>
	<CAJ86T=WqO7W_XxfvKxZMj6k2wmZOK_Hmwi4gN3O2oWDDhn16Kw@mail.gmail.com>
In-Reply-To: <CAJ86T=WqO7W_XxfvKxZMj6k2wmZOK_Hmwi4gN3O2oWDDhn16Kw@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 13 Dec 2019 19:29:42 -0600
Message-ID: <CAJdd5GYZ7WdxZb0rav1h9g-Zr14hA-8x0V5LTXkg1z_R75zeeA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] tune-cortexa72-cortexa53: Add tunes
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
X-List-Received-Date: Sat, 14 Dec 2019 01:29:54 -0000
Content-Type: multipart/alternative; boundary="00000000000066f8f205999fea62"

--00000000000066f8f205999fea62
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 13, 2019, 7:21 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Fri, Dec 13, 2019 at 4:55 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> >
> > Adds tunes for Cortex-A72 Cortex-A53 big.LITTLE SoCs (with and without
> > crypto extensions), e.g. Rockchip RK3399
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  .../include/tune-cortexa72-cortexa53.inc      | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644
> meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> >
> > diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> > new file mode 100644
> > index 00000000000..6bf3b83abe9
> > --- /dev/null
> > +++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> > @@ -0,0 +1,24 @@
> > +DEFAULTTUNE ?= "cortexa72-cortexa53"
> > +
> > +require conf/machine/include/arm/arch-armv8a.inc
> > +
> > +TUNEVALID[cortexa72-cortexa53] = "Enable big.LITTLE
> Cortex-A72.Cortex-A53 specific processor optimizations"
> > +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "aarch64", "
> -march=armv8-a", "" ,d)}"
>

I also think this is redundant because arch-armv8a.inc does it already

> +
> > +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> > +
> > +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES",
> "cortexa72-cortexa53", "cortexa72-cortexa53:", "" ,d)}"
> > +
> > +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES",
> "cortexa72-cortexa53", " -mtune=cortex-a72.cortex-a53", "", d)}"
> > +
> > +# Little Endian base configs
> > +AVAILTUNES += "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
> > +ARMPKGARCH_tune-cortexa72-cortexa53                  =
> "cortexa72-cortexa53"
> > +ARMPKGARCH_tune-cortexa72-cortexa53-crypto           =
> "cortexa72-cortexa53"
> > +TUNE_FEATURES_tune-cortexa72-cortexa53               =
> "${TUNE_FEATURES_tune-armv8a}"
> > +TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        =
> "${TUNE_FEATURES_tune-armv8a-crypto}"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a} cortexa72-cortexa53"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto} cortexa72-cortexa53-crypto"
>
> Shouldn't cortexa72-cortexa53-crypto also be able to use
> cortexa72-cortexa53 packages?
>

Yep. I'll send a v3


> > +BASE_LIB_tune-cortexa72-cortexa53                    = "lib64"
> > +BASE_LIB_tune-cortexa72-cortexa53-crypto             = "lib64"
> > +
> > --
> > 2.23.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000066f8f205999fea62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Dec 13, 2019, 7:21 PM Andre McCurdy &lt;<a hre=
f=3D"mailto:armccurdy@gmail.com" target=3D"_blank" rel=3D"noreferrer">armcc=
urdy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fr=
i, Dec 13, 2019 at 4:55 PM Joshua Watt &lt;<a href=3D"mailto:jpewhacker@gma=
il.com" rel=3D"noreferrer noreferrer" target=3D"_blank">jpewhacker@gmail.co=
m</a>&gt; wrote:<br>
&gt;<br>
&gt; Adds tunes for Cortex-A72 Cortex-A53 big.LITTLE SoCs (with and without=
<br>
&gt; crypto extensions), e.g. Rockchip RK3399<br>
&gt;<br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">JPEWhacker@gmail.com</a>&g=
t;<br>
&gt; ---<br>
&gt;=C2=A0 .../include/tune-cortexa72-cortexa53.inc=C2=A0 =C2=A0 =C2=A0 | 2=
4 +++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 24 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/conf/machine/include/tune-cortexa72-cort=
exa53.inc<br>
&gt;<br>
&gt; diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/=
meta/conf/machine/include/tune-cortexa72-cortexa53.inc<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..6bf3b83abe9<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc<br>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +DEFAULTTUNE ?=3D &quot;cortexa72-cortexa53&quot;<br>
&gt; +<br>
&gt; +require conf/machine/include/arm/arch-armv8a.inc<br>
&gt; +<br>
&gt; +TUNEVALID[cortexa72-cortexa53] =3D &quot;Enable big.LITTLE Cortex-A72=
.Cortex-A53 specific processor optimizations&quot;<br>
&gt; +TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;aarch64&quot;, &quot; -march=3Darmv8-a&quot;, &quot;&quot; ,d)}&quo=
t;<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto=
">I also think this is redundant because arch-armv8a.inc does it already</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
&gt; +<br>
&gt; +TUNECONFLICTS[aarch64] =3D &quot;armv4 armv5 armv6 armv7 armv7a&quot;=
<br>
&gt; +<br>
&gt; +MACHINEOVERRIDES =3D. &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;cortexa72-cortexa53&quot;, &quot;cortexa72-cortexa53:&quot;, &=
quot;&quot; ,d)}&quot;<br>
&gt; +<br>
&gt; +TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;cortexa72-cortexa53&quot;, &quot; -mtune=3Dcortex-a72.cortex-a53&qu=
ot;, &quot;&quot;, d)}&quot;<br>
&gt; +<br>
&gt; +# Little Endian base configs<br>
&gt; +AVAILTUNES +=3D &quot;cortexa72-cortexa53 cortexa72-cortexa53-crypto&=
quot;<br>
&gt; +ARMPKGARCH_tune-cortexa72-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;cortexa72-cortexa53&quot;<br>
&gt; +ARMPKGARCH_tune-cortexa72-cortexa53-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0=3D &quot;cortexa72-cortexa53&quot;<br>
&gt; +TUNE_FEATURES_tune-cortexa72-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;${TUNE_FEATURES_tune-armv8a}&quot;<br>
&gt; +TUNE_FEATURES_tune-cortexa72-cortexa53-crypto=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D &quot;${TUNE_FEATURES_tune-armv8a-crypto}&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a} cortexa72-cortexa53&=
quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto=C2=A0 =3D &quot;$=
{PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto} cortexa72-cortexa53-crypto&quot;<b=
r>
<br>
Shouldn&#39;t cortexa72-cortexa53-crypto also be able to use<br>
cortexa72-cortexa53 packages?<br></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Yep. I&#39;ll send a v3</div><div dir=3D"auto"=
><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
&gt; +BASE_LIB_tune-cortexa72-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;lib64&quot;<br>
&gt; +BASE_LIB_tune-cortexa72-cortexa53-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D &quot;lib64&quot;<br>
&gt; +<br>
&gt; --<br>
&gt; 2.23.0<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">Openembedded-core@lists.openembedded.=
org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">http://li=
sts.openembedded.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--00000000000066f8f205999fea62--
