Return-Path: <srifenbark@gmail.com>
Received: from mail-ot0-f179.google.com (mail-ot0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id AFD716069C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 18:59:17 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id h26-v6so3782661otj.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 11:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Je/Wm/s/drcuqt//VYOxtBEUvX/dF+RfEK+gV0IIfhs=;
	b=OKxwQwFoPXzwUTyMNLUHW8juVeu+6ST3sHIqnM7BmwEVs9WnlIV5XFwm7Y2c9P7hmy
	JKuFQL83+rOHxje1umOF4VDWDncXTz+HpsRnPaTEn7+I129NpdrEugBKkFRREXC8gp4T
	NY53ZbFQsAZafUXrAamrRzVBCo2xvrxnDuNA88eRYLJxR5/3cUc58zmC9rtH540eLyK/
	DkS7ynHO9OhehcODIOXwmLLcyViMelQM1GH3Og3hJiXaS/I+OYWbTrAY1JSXAqsFT1VF
	fdXhGZE6zht4CWFJMhgFXONZpxdNOx2C7DX03bj2hij05YbBLCZFVugB/WYIKKGJzJxk
	KiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Je/Wm/s/drcuqt//VYOxtBEUvX/dF+RfEK+gV0IIfhs=;
	b=sYEGEfLX0/pQ76Z3EINLkS2kUjUxtA9UJWa4x4EKliMrbBGLXHQ2wd3SxfwvUN3EED
	eCpxb6GqypYGWVvSsk5MRADITIbke8yz/kpumYmjMv40d3oxfw/7pX7JHRWNgnEWA7dz
	Ezrdp1ju+AjOrAJX/31SsTK61D+PxFJdb/RQ7qLyH9+yAnYT0HSWpT3fYc+l10l3+hyL
	W0tV57q6Kat6OP3gWpsrIauUSAKPGJeyQBFLDo9QZM4fPWxjT5ZJGxlYKi7V3N+7Y5i4
	jT4dG+s3qmKTBCn/5A6z19fGSWTxO4wyRPmU7F7FWvpLmX0oY3P4Yp4/8Adwb7SWwx19
	bkaA==
X-Gm-Message-State: ALQs6tATJ7H8Bsh6zWJ70MTLiLZtVhNW8GpLWSKj5ItXegclLfY49sve
	mbJcA7ZZI2oSNmK8HqCCtTUEAKtfz5Ke7E1SoTA=
X-Google-Smtp-Source: AIpwx4/vikv2SY4QBxXwJALF5h4b+gue5XXuN5wCVRfmJ/Q6LnPXIAhf5Si3LBvozwOnGWbTcNCUJ+i9WutqgOn4bi0=
X-Received: by 2002:a9d:2ff1:: with SMTP id
	b46-v6mr2932617otd.372.1522263558460; 
	Wed, 28 Mar 2018 11:59:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:256a:0:0:0:0:0 with HTTP; Wed, 28 Mar 2018 11:59:18
	-0700 (PDT)
In-Reply-To: <1522263448.3242.260.camel@gmail.com>
References: <20180321203301.18296-1-JPEWhacker@gmail.com>
	<CAFNP8Os5b_hLYi__R9h7YLqRDt0wEUcW=Ni5AzWocnQwV_yiuw@mail.gmail.com>
	<1522263448.3242.260.camel@gmail.com>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Wed, 28 Mar 2018 11:59:18 -0700
Message-ID: <CAFNP8Otdnc82RGScNYuP-NsJo5tA5eLEd0AKs=LLtg86HFOfvw@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ref-manual: Update SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Wed, 28 Mar 2018 18:59:17 -0000
Content-Type: multipart/alternative; boundary="000000000000a818cf05687d9aee"

--000000000000a818cf05687d9aee
Content-Type: text/plain; charset="UTF-8"

oops... will it hurt it to be in Rocko?


On Wed, Mar 28, 2018 at 11:57 AM, Joshua Watt <jpewhacker@gmail.com> wrote:

> Scott,
>
> This documentation update is not needed for Rocko, the corresponding code
> change is only on master. Sorry if there was some confusion
>
> Thanks,
> Joshua Watt
>
> On Wed, 2018-03-28 at 10:53 -0700, Scott Rifenbark wrote:
>
> Joshua,
>
> Thanks for the addition.  I have implemented the change.  You can see the
> change at https://www.yoctoproject.org/docs/2.5/ref-manual/ref-
> manual.html#var-SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.  I will back-fill into
> the 'rocko' development branch of the manuals.
>
> Scott
>
> On Wed, Mar 21, 2018 at 1:33 PM, Joshua Watt <jpewhacker@gmail.com> wrote:
>
> Describes the new wildcard syntax
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  documentation/ref-manual/ref-variables.xml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/documentation/ref-manual/ref-variables.xml
> b/documentation/ref-manual/ref-variables.xml
> index 09eb9b9dfc7..58a58b0605e 100644
> --- a/documentation/ref-manual/ref-variables.xml
> +++ b/documentation/ref-manual/ref-variables.xml
> @@ -12648,6 +12648,23 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR
> = "${INC_PR}.3"
>                      <filename>mplayer2</filename>.
>                  </para>
>
> +                <para>
> +                    The special token <filename>"*"</filename> may be
> used on
> +                    the left hand side of the dependency, which will
> match all
> +                    recipes except the one on the right hand side.
> +                    For example:
> +                    <literallayout class='monospaced'>
> +    SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "*->quilt-native"
> +                    </literallayout>
> +                </para>
> +
> +                <para>
> +                    In this example, all recipes except
> +                    <filename>quilt-native</filename> will ignore task
> +                    signatures from the <filename>quilt-native</filename>
> recipe
> +                    when determining their task signatures.
> +                </para>
> +
>                  <para>
>                      Use of this variable is one mechanism to remove
> dependencies
>                      that affect task signatures and thus force rebuilds
> when a
> --
> 2.14.3
>
>
>

--000000000000a818cf05687d9aee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">oops... will it hurt it to be in Rocko?<br><br></div><div =
class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Mar 28, 2018 a=
t 11:57 AM, Joshua Watt <span dir=3D"ltr">&lt;<a href=3D"mailto:jpewhacker@=
gmail.com" target=3D"_blank">jpewhacker@gmail.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><div>Scott,</div><div><br></div><div>Th=
is documentation update is not needed for Rocko, the corresponding code cha=
nge is only on master. Sorry if there was some confusion</div><div><br></di=
v><div>Thanks,</div><div>Joshua Watt</div><div><div class=3D"h5"><div><br><=
/div><div>On Wed, 2018-03-28 at 10:53 -0700, Scott Rifenbark wrote:</div><b=
lockquote type=3D"cite" style=3D"margin:0 0 0 .8ex;border-left:2px #729fcf =
solid;padding-left:1ex"><div dir=3D"ltr"><div><div>Joshua, <br><br></div>Th=
anks for the addition.=C2=A0 I have implemented the change.=C2=A0 You can s=
ee the change at <a href=3D"https://www.yoctoproject.org/docs/2.5/ref-manua=
l/ref-manual.html#var-SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS" target=3D"_blank">ht=
tps://www.yoctoproject.org/<wbr>docs/2.5/ref-manual/ref-<wbr>manual.html#va=
r-SIGGEN_<wbr>EXCLUDE_SAFE_RECIPE_DEPS</a>.=C2=A0 I will back-fill into the=
 &#39;rocko&#39; development branch of the manuals.<br><br></div>Scott<br><=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Mar =
21, 2018 at 1:33 PM, Joshua Watt <span dir=3D"ltr">&lt;<a href=3D"mailto:jp=
ewhacker@gmail.com" target=3D"_blank">jpewhacker@gmail.com</a>&gt;</span> w=
rote:<br><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex;border-left:2=
px #729fcf solid;padding-left:1ex">Describes the new wildcard syntax<br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
---<br>
=C2=A0documentation/ref-manual/ref-<wbr>variables.xml | 17 ++++++++++++++++=
+<br>
=C2=A01 file changed, 17 insertions(+)<br>
<br>
diff --git a/documentation/ref-manual/ref<wbr>-variables.xml b/documentatio=
n/ref-manual/ref<wbr>-variables.xml<br>
index 09eb9b9dfc7..58a58b0605e 100644<br>
--- a/documentation/ref-manual/ref<wbr>-variables.xml<br>
+++ b/documentation/ref-manual/ref<wbr>-variables.xml<br>
@@ -12648,6 +12648,23 @@ recipes-graphics/xorg-font/fon<wbr>t-alias_1.0.3.b=
b:PR =3D &quot;${INC_PR}.3&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&lt;filename&gt;mplayer2&lt;/filename&gt;<wbr>.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/para&gt;=
<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;para&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The =
special token &lt;filename&gt;&quot;*&quot;&lt;/filename&gt; may be used on=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the =
left hand side of the dependency, which will match all<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reci=
pes except the one on the right hand side.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 For =
example:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=
literallayout class=3D&#39;monospaced&#39;&gt;<br>
+=C2=A0 =C2=A0 SIGGEN_EXCLUDE_SAFE_RECIPE_DEP<wbr>S +=3D &quot;*-&gt;quilt-=
native&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=
/literallayout&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/para&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;para&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 In t=
his example, all recipes except<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=
filename&gt;quilt-native&lt;/filena<wbr>me&gt; will ignore task<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sign=
atures from the &lt;filename&gt;quilt-native&lt;/filena<wbr>me&gt; recipe<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 when=
 determining their task signatures.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/para&gt;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Use of this variable is one mechanism to remove dependencies<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0that affect task signatures and thus force rebuilds when a<br>
<span class=3D"m_4517762190543744689HOEnZb"><font color=3D"#888888">--<br>
2.14.3<br>
<br>
</font></span></blockquote></div><br></div>
</blockquote></div></div></div></blockquote></div><br></div>

--000000000000a818cf05687d9aee--
