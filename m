Return-Path: <srifenbark@gmail.com>
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail.openembedded.org (Postfix) with ESMTP id F1C896C17A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 19:35:58 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id j6so9685145edp.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 11:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wxg3D7t/bpHkrg1346Wy8QQcuPt5qcdrsYoLRKOjL58=;
	b=Rn0PZHH0fmyD8xfV2XC1QZ5ojbZJQN1cMRiEhusHNAHUCPpmCaq0a8sCHUplrQorSj
	MKjjOheSQwfoRVfpClCHGlGNnKfDB40PvcFWnnQkCGlA5DY8AblzLaTyBcHN9AiOezuS
	ABMdK+aejXRFv9wO5qsjJ+gA5A43S3ZTcFfITkk0nW51SLg7oSplWZ0HcpQosILdAzHM
	y1JJN67zQOLoeI2Q+ATbwIzmW9h5nOoXxGHu530rRx5Getno6xyZpbrXtI7xSJMXhIBL
	+MyIodXKSL7FJY+1KRB5awjF1zDId45fZLDhwBdTee9d5vUw0uxiVRPBVMYVUBqse2nS
	WzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wxg3D7t/bpHkrg1346Wy8QQcuPt5qcdrsYoLRKOjL58=;
	b=kHu9wCqrAolKUFuRerDmCPfR1fJHzws/U8iquJS5iFYMoceu+yv1P2+4hoUubx2B/J
	rW925rOYgFOzTgPdvG0eFa7G3YoFhcJbTwwx5/uQdBi8uiDIDAUwWT6KVAmeKru9A9TH
	gKORFA/vq7FY6qtVKLduMhOrONggblFPt6jxV0OCW/DSZQYdeAWFtYturJ/9XEag4QBC
	dOTMTMV6jDxr7ijJufXMTo42kZBzuzLv0sjvutP9+T2O8+B4a7egLVWbVvoBi4/zvQGO
	+uslVmlpAEf6PYn52ozOoXzxscyQYH45KIKJxw1SzjQnHBijPrmg6OvAgVetqjpCm+aN
	gV+Q==
X-Gm-Message-State: AGRZ1gKJ5GHwIqXgk9jV/urPBQEeJ1Ja14vuVog+PDZAxAxi9ls1i65g
	v9Tgxfm14XLj4O3zUroIRVuv7No4378Cld/ur2I=
X-Google-Smtp-Source: AJdET5chqe2pRlaefrSuOgfA6sZe4jsSyqY8WiCdu95ym8dQuYs73qEepuoK25aOoiCrMufoqQEyG06b7wrcklSU22Y=
X-Received: by 2002:a50:b349:: with SMTP id
	r9-v6mr3278606edd.284.1542224159608; 
	Wed, 14 Nov 2018 11:35:59 -0800 (PST)
MIME-Version: 1.0
References: <1542222350-15249-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1542222350-15249-1-git-send-email-liu.ming50@gmail.com>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Wed, 14 Nov 2018 11:35:47 -0800
Message-ID: <CAFNP8OupoL7_iTydvuAL2hZA=MHZ8=3bNd16pMMDToTGrsxKAg@mail.gmail.com>
To: liu.ming50@gmail.com
Cc: stefan.agner@toradex.com,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] doc: drop some incorrect instructions
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
X-List-Received-Date: Wed, 14 Nov 2018 19:35:59 -0000
Content-Type: multipart/alternative; boundary="000000000000329286057aa50b84"

--000000000000329286057aa50b84
Content-Type: text/plain; charset="UTF-8"

Ming,

I could not simply apply this patch.  I had to do some re-writing for
clarity.  Please look at this link to the updated section on the
image_types class and let me know if this is technically correct.

https://yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#ref-classes-image_types

Thanks,
Scott

On Wed, Nov 14, 2018 at 11:06 AM <liu.ming50@gmail.com> wrote:

> From: Ming Liu <liu.ming50@gmail.com>
>
> image_types bbclass now is being inherited mandatorily in image.bbclass
> through the variable IMGCLASSES, and the users do not have to inherit
> it in their customized image type bbclass, or put it in IMAGE_CLASSES.
>
> Drop the incorrect descriptions, it's confusing the developers.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  documentation/ref-manual/ref-classes.xml | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/documentation/ref-manual/ref-classes.xml
> b/documentation/ref-manual/ref-classes.xml
> index 24d7a0a..876e242 100644
> --- a/documentation/ref-manual/ref-classes.xml
> +++ b/documentation/ref-manual/ref-classes.xml
> @@ -1275,15 +1275,10 @@
>      </para>
>
>      <para>
> -        By default, this class is enabled through the
> -        <link
> linkend='var-IMAGE_CLASSES'><filename>IMAGE_CLASSES</filename></link>
> -        variable in
> +        By default, this class is enabled mandatorily in
>          <link
> linkend='ref-classes-image'><filename>image.bbclass</filename></link>.
>          If you define your own image types using a custom BitBake class
> and
> -        then use <filename>IMAGE_CLASSES</filename> to enable it, the
> custom
> -        class must either inherit <filename>image_types</filename> or
> -        <filename>image_types</filename> must also appear in
> -        <filename>IMAGE_CLASSES</filename>.
> +        then use <filename>IMAGE_CLASSES</filename> to enable it.
>      </para>
>
>      <para>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000329286057aa50b84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Ming, <br></div><div><br></div><div>=
I could not simply apply this patch.=C2=A0 I had to do some re-writing for =
clarity.=C2=A0 Please look at this link to the updated section on the image=
_types class and let me know if this is technically correct.</div><div><br>=
</div><div><a href=3D"https://yoctoproject.org/docs/2.6/ref-manual/ref-manu=
al.html#ref-classes-image_types">https://yoctoproject.org/docs/2.6/ref-manu=
al/ref-manual.html#ref-classes-image_types</a></div><div><br></div><div>Tha=
nks,</div><div>Scott<br></div></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr">On Wed, Nov 14, 2018 at 11:06 AM &lt;<a href=3D"mailto:liu.m=
ing50@gmail.com">liu.ming50@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com=
" target=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
<br>
image_types bbclass now is being inherited mandatorily in image.bbclass<br>
through the variable IMGCLASSES, and the users do not have to inherit<br>
it in their customized image type bbclass, or put it in IMAGE_CLASSES.<br>
<br>
Drop the incorrect descriptions, it&#39;s confusing the developers.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=
=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
---<br>
=C2=A0documentation/ref-manual/ref-classes.xml | 9 ++-------<br>
=C2=A01 file changed, 2 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-m=
anual/ref-classes.xml<br>
index 24d7a0a..876e242 100644<br>
--- a/documentation/ref-manual/ref-classes.xml<br>
+++ b/documentation/ref-manual/ref-classes.xml<br>
@@ -1275,15 +1275,10 @@<br>
=C2=A0 =C2=A0 =C2=A0&lt;/para&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0&lt;para&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 By default, this class is enabled through the<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;link linkend=3D&#39;var-IMAGE_CLASSES&#39;=
&gt;&lt;filename&gt;IMAGE_CLASSES&lt;/filename&gt;&lt;/link&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 variable in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 By default, this class is enabled mandatorily =
in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;link linkend=3D&#39;ref-classes-image=
&#39;&gt;&lt;filename&gt;image.bbclass&lt;/filename&gt;&lt;/link&gt;.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If you define your own image types using =
a custom BitBake class and<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 then use &lt;filename&gt;IMAGE_CLASSES&lt;/fil=
ename&gt; to enable it, the custom<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 class must either inherit &lt;filename&gt;imag=
e_types&lt;/filename&gt; or<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;filename&gt;image_types&lt;/filename&gt; m=
ust also appear in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;filename&gt;IMAGE_CLASSES&lt;/filename&gt;=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 then use &lt;filename&gt;IMAGE_CLASSES&lt;/fil=
ename&gt; to enable it.<br>
=C2=A0 =C2=A0 =C2=A0&lt;/para&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0&lt;para&gt;<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000329286057aa50b84--
