Return-Path: <srifenbark@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id B05277C3BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 22:14:41 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id y56so937455edd.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 14:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MuvInvzHzRv8EtCuUzGLM5julqszMLjHg/4I5t5eKlw=;
	b=OGx/UgLdkOigcQfTvYuEqaZ3d0lwGLuOLg+Kv8CWkDyOumTPEJWWVGZy9IJDq0KuxA
	YcAB2vgx9yL6F1FuZugixnPpbgbSW2mZY+lE5v8ZEs8Ssj92OZ5UYTYlZO5PKmrWeBfP
	5zmlySEJ8IaBu3TKD7NepUth/a5Saasil7yjhMZqG3Oy+Y/AkFDpcxKfTSrFGfW0XZi/
	kS2AN5DvMkbOh8+I6pPOaGxCBo2MOQYGpzYWtWbn1nZPNsdJOan+zV5c1mXluK+Wairp
	ApvQ6EX9vb3pl64VlDidjDLX86ZIRe70KmyqGurA6g+X6Z49opdMrWTOnzH+NR197D9o
	5CzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MuvInvzHzRv8EtCuUzGLM5julqszMLjHg/4I5t5eKlw=;
	b=YKnaGbexaL0ziaBCv+80h++0fotQGjnm++gFt3ffjRVxz6z5gUZNk1UzlAeMgDRY8L
	YTXboDnLCtq8SLGDTVnMChzAzez73S0S+k91QPw8Yzt4vHsxU00dvipFBNJ6JxGFntXD
	Rlmc4teqGaBsTX6s1cDYzn4x19ZSLPIowMBS5RsLO1Wl8NLBmmiFi6uDLbdJP0Umhsu+
	k9o8xQVCIiJdgO0RqCyvMbbDlslq4MmEpaAB9UX7bUqWe9UEYj3Zswme3wMDYkAcWMxw
	H6NRtWuTwX+z1LmV83wKl/e7sHvNGy2bj/06uaxATmXqFt3C86QHANrI2J/1pcWodIbx
	F3Ew==
X-Gm-Message-State: AJcUukfVwzC/q+azhZ3gkTciRt6DsJJwPI6DXd58g3aFFfBeYsH93icH
	KPAPhYEOKnOPf11yioENNXBeNADh63vkXMv4BCv9KHcj
X-Google-Smtp-Source: ALg8bN4ybl12rd4OpxVM6qngSiDTGL8by+VLattPPnmuR6vgRiPo+3sB3nmt37htIkXCZP8YZ4cntsXkA9EaqCbq1cY=
X-Received: by 2002:a50:bae3:: with SMTP id x90mr32396594ede.221.1548886482138;
	Wed, 30 Jan 2019 14:14:42 -0800 (PST)
MIME-Version: 1.0
References: <20190130093819.10786-1-bunk@stusta.de>
In-Reply-To: <20190130093819.10786-1-bunk@stusta.de>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Wed, 30 Jan 2019 14:14:30 -0800
Message-ID: <CAFNP8OvDPRKBS9g9LzU3015ag=SmLPTHi0qoDYCi5pPLsVxB+Q@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [thud] [PATCH] Ubuntu 16.10 is not LTS
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
X-List-Received-Date: Wed, 30 Jan 2019 22:14:42 -0000
Content-Type: multipart/alternative; boundary="00000000000090bb1d0580b43caa"

--00000000000090bb1d0580b43caa
Content-Type: text/plain; charset="UTF-8"

Adrian,

Thanks for catching this.  I have updated the list of supported distros for
the 2.7 (master) version of the ref-manual.  I will make sure that the fix
is also in the 2.6.1 release that is pending and the published 2.6
ref-manual (thud branch).  See
https://yoctoproject.org/docs/2.7/ref-manual/ref-manual.html#detailed-supported-distros
for the updated list and
https://www.yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#detailed-supported-distros.


Thanks,
Scott

On Wed, Jan 30, 2019 at 1:38 AM Adrian Bunk <bunk@stusta.de> wrote:

> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  documentation/ref-manual/ref-system-requirements.xml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/ref-system-requirements.xml
> b/documentation/ref-manual/ref-system-requirements.xml
> index 69d4b4e726..500b2f8f39 100644
> --- a/documentation/ref-manual/ref-system-requirements.xml
> +++ b/documentation/ref-manual/ref-system-requirements.xml
> @@ -97,7 +97,7 @@
>                  <listitem><para>Ubuntu 15.04</para></listitem>
>                  <listitem><para>Ubuntu 15.10</para></listitem> -->
>                  <listitem><para>Ubuntu 16.04 (LTS)</para></listitem>
> -                <listitem><para>Ubuntu 16.10 (LTS)</para></listitem>
> +                <listitem><para>Ubuntu 16.10</para></listitem>
>                  <listitem><para>Ubuntu 17.04</para></listitem>
>  <!--            <listitem><para>Fedora 16 (Verne)</para></listitem>
>                  <listitem><para>Fedora 17 (Spherical)</para></listitem>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000090bb1d0580b43caa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Adrian, <br></div><=
div><br></div><div>Thanks for catching this.=C2=A0 I have updated the list =
of supported distros for the 2.7 (master) version of the ref-manual.=C2=A0 =
I will make sure that the fix is also in the 2.6.1 release that is pending =
and the published 2.6 ref-manual (thud branch).=C2=A0 See <a href=3D"https:=
//yoctoproject.org/docs/2.7/ref-manual/ref-manual.html#detailed-supported-d=
istros" target=3D"_blank">https://yoctoproject.org/docs/2.7/ref-manual/ref-=
manual.html#detailed-supported-distros</a> for the updated list and <a href=
=3D"https://www.yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#detail=
ed-supported-distros">https://www.yoctoproject.org/docs/2.6/ref-manual/ref-=
manual.html#detailed-supported-distros</a>. <br></div><div><br></div><div>T=
hanks, <br></div><div>Scott<br></div></div></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 30, 2019 at 1:=
38 AM Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de" target=3D"_blank">b=
unk@stusta.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Signed-off-by: Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.d=
e" target=3D"_blank">bunk@stusta.de</a>&gt;<br>
---<br>
=C2=A0documentation/ref-manual/ref-system-requirements.xml | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/documentation/ref-manual/ref-system-requirements.xml b/documen=
tation/ref-manual/ref-system-requirements.xml<br>
index 69d4b4e726..500b2f8f39 100644<br>
--- a/documentation/ref-manual/ref-system-requirements.xml<br>
+++ b/documentation/ref-manual/ref-system-requirements.xml<br>
@@ -97,7 +97,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;listitem&=
gt;&lt;para&gt;Ubuntu 15.04&lt;/para&gt;&lt;/listitem&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;listitem&=
gt;&lt;para&gt;Ubuntu 15.10&lt;/para&gt;&lt;/listitem&gt; --&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;listitem&=
gt;&lt;para&gt;Ubuntu 16.04 (LTS)&lt;/para&gt;&lt;/listitem&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;listitem&gt;&l=
t;para&gt;Ubuntu 16.10 (LTS)&lt;/para&gt;&lt;/listitem&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;listitem&gt;&l=
t;para&gt;Ubuntu 16.10&lt;/para&gt;&lt;/listitem&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;listitem&=
gt;&lt;para&gt;Ubuntu 17.04&lt;/para&gt;&lt;/listitem&gt;<br>
=C2=A0&lt;!--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;listitem&gt;&lt;=
para&gt;Fedora 16 (Verne)&lt;/para&gt;&lt;/listitem&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;listitem&=
gt;&lt;para&gt;Fedora 17 (Spherical)&lt;/para&gt;&lt;/listitem&gt;<br>
-- <br>
2.11.0<br>
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

--00000000000090bb1d0580b43caa--
