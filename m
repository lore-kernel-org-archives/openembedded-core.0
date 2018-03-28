Return-Path: <srifenbark@gmail.com>
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id A3C267836E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 20:23:27 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id h26-v6so4052885otj.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 13:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B1srMxOhxYZVgZDPiuMV2i4vaXwvAPs0sLz/WFElrxs=;
	b=WV3Q1qi53SWi2WXXhzVqiHYqHHeul3oDlsmmJVORQNDSjJkwMOY0OWZ6p/ap7/gENK
	4dKUbtuAb6ibOMifxUkqmwrnuyH/YYybKmb6AeCllMbnR6lUnPnyF/P5ebakQpfmPvbd
	z74M0+DeeAiB1sY9tTSrCBt++MVtmmHPlBnb4hjkj7jtk7GL6M2h/bPRmqJg8Phs9ret
	U7P5d2zJXOI7OW2APumabyc/IBJi9F3nvhF8M6MQFV7YwCZ/NsZjF0UWH+0Q9JgfAl9A
	pJOB4vMVXUSyXjtwDq6GxvIMLeMsBJfXOGfXIHGTFXnUFa8WqeunzUIBgw3u3tdapNjK
	fSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B1srMxOhxYZVgZDPiuMV2i4vaXwvAPs0sLz/WFElrxs=;
	b=CLRNBTsod9Mdbfs3FiCbf58GBGSOL19Rq2E3kIkw1K2h63FnwhcfAtO5wYRrEAxYjj
	YyRXgxMhzqu/9ugLBtuteKAGliQZjYY/oBRrT/npej0CPbUgr8Bp6tqqMmkQBHODHMFt
	njH6KMPDVdFdRbBpWIdrS0Fp7FSdpVVUo/kp2221Q3PRQ/RGIoG4Nw3Kcj70OVND3PAh
	zU7CG09L0y1BiDArZOZaaSwPdhLQqYZnddNo9KPzi9xcBKQmBIy64tnzZuhY/M+CxzNv
	Dgk/oU2mxXmqc2mZPJQp7087sFdG3NotoXILmuO0UaI56Q6f6JeIp/KyKW7UodmpAsnu
	tFVA==
X-Gm-Message-State: ALQs6tDjjaoRKAgEfOQKeXQpKe035rnhSNOFBj4tgrZ7OI3ZQ8VeqMTc
	zwa4zRGqS5HKqCZudd6n85Kq81tHgzdfXOlq5G8=
X-Google-Smtp-Source: AIpwx4/n34d7K9dCal2S4JsgTfF80JGpaTiEuWh5H+J+gBp8NNGf8wJf4lvEJpS8oxFMmVNPzcq7vBb/LkQFGJvAtok=
X-Received: by 2002:a9d:3c55:: with SMTP id
	j21-v6mr3028953ote.51.1522268608664; 
	Wed, 28 Mar 2018 13:23:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:256a:0:0:0:0:0 with HTTP; Wed, 28 Mar 2018 13:23:28
	-0700 (PDT)
In-Reply-To: <1522268125.3242.262.camel@gmail.com>
References: <20180321203301.18296-1-JPEWhacker@gmail.com>
	<CAFNP8Os5b_hLYi__R9h7YLqRDt0wEUcW=Ni5AzWocnQwV_yiuw@mail.gmail.com>
	<1522263448.3242.260.camel@gmail.com>
	<CAFNP8Otdnc82RGScNYuP-NsJo5tA5eLEd0AKs=LLtg86HFOfvw@mail.gmail.com>
	<1522268125.3242.262.camel@gmail.com>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Wed, 28 Mar 2018 13:23:28 -0700
Message-ID: <CAFNP8OuDT+d0WjYR6WM7DO1xjwOrK2v_xLTriaa7VQSg9pYbWA@mail.gmail.com>
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
X-List-Received-Date: Wed, 28 Mar 2018 20:23:27 -0000
Content-Type: multipart/alternative; boundary="000000000000ac183505687ec758"

--000000000000ac183505687ec758
Content-Type: text/plain; charset="UTF-8"

ok - I will fix it back in the manual.  Thanks

On Wed, Mar 28, 2018 at 1:15 PM, Joshua Watt <jpewhacker@gmail.com> wrote:

> I don't believe there are any plans to backport that feature to Rocko, so
> I think we probably don't want it in the documentation.
>
> On Wed, 2018-03-28 at 11:59 -0700, Scott Rifenbark wrote:
>
> oops... will it hurt it to be in Rocko?
>
>
> On Wed, Mar 28, 2018 at 11:57 AM, Joshua Watt <jpewhacker@gmail.com>
> wrote:
>
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
> change at https://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.
> html#var-SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.  I will back-fill into the
> 'rocko' development branch of the manuals.
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
>

--000000000000ac183505687ec758
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ok - I will fix it back in the manual.=C2=A0 Thanks<br></d=
iv><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Mar 28=
, 2018 at 1:15 PM, Joshua Watt <span dir=3D"ltr">&lt;<a href=3D"mailto:jpew=
hacker@gmail.com" target=3D"_blank">jpewhacker@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div><div>I don&#39;t believe there a=
re any plans to backport that feature to Rocko, so I think we probably don&=
#39;t want it in the documentation.</div><div><div class=3D"h5"><div><br></=
div><div>On Wed, 2018-03-28 at 11:59 -0700, Scott Rifenbark wrote:</div><bl=
ockquote type=3D"cite" style=3D"margin:0 0 0 .8ex;border-left:2px #729fcf s=
olid;padding-left:1ex"><div dir=3D"ltr">oops... will it hurt it to be in Ro=
cko?<br><br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On Wed, Mar 28, 2018 at 11:57 AM, Joshua Watt <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:jpewhacker@gmail.com" target=3D"_blank">jpewhacker@gmail.com</a=
>&gt;</span> wrote:<br><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex=
;border-left:2px #729fcf solid;padding-left:1ex"><div><div>Scott,</div><div=
><br></div><div>This documentation update is not needed for Rocko, the corr=
esponding code change is only on master. Sorry if there was some confusion<=
/div><div><br></div><div>Thanks,</div><div>Joshua Watt</div><div><div class=
=3D"m_-7953932688811173130h5"><div><br></div><div>On Wed, 2018-03-28 at 10:=
53 -0700, Scott Rifenbark wrote:</div><blockquote type=3D"cite" style=3D"ma=
rgin:0 0 0 .8ex;border-left:2px #729fcf solid;padding-left:1ex"><div dir=3D=
"ltr"><div><div>Joshua, <br><br></div>Thanks for the addition.=C2=A0 I have=
 implemented the change.=C2=A0 You can see the change at <a href=3D"https:/=
/www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#var-SIGGEN_EXCLUD=
E_SAFE_RECIPE_DEPS" target=3D"_blank">https://www.yoctoproject.org/d<wbr>oc=
s/2.5/ref-manual/ref-manual.<wbr>html#var-SIGGEN_EXCLUDE_SAFE_<wbr>RECIPE_D=
EPS</a>.=C2=A0 I will back-fill into the &#39;rocko&#39; development branch=
 of the manuals.<br><br></div>Scott<br></div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On Wed, Mar 21, 2018 at 1:33 PM, Joshua Watt <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:jpewhacker@gmail.com" target=3D"_blan=
k">jpewhacker@gmail.com</a>&gt;</span> wrote:<br><blockquote type=3D"cite" =
style=3D"margin:0 0 0 .8ex;border-left:2px #729fcf solid;padding-left:1ex">=
Describes the new wildcard syntax<br>
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
<span class=3D"m_-7953932688811173130m_4517762190543744689HOEnZb"><font col=
or=3D"#888888">--<br>
2.14.3<br>
<br>
</font></span></blockquote></div><br></div>
</blockquote></div></div></div></blockquote></div><br></div>
</blockquote></div></div></div></blockquote></div><br></div>

--000000000000ac183505687ec758--
