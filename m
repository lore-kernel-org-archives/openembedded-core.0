Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4403D609AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 19:06:47 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id z11so473368lbi.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 12:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=NODn7f6Aa96dgDrcXojA9xx+NzOaYxVr00EfXO5wRhw=;
	b=h4OQM/qk4NF9yQWqlgFw94hQLNMXhMHhzkhufRm+u2/R7EO624biWTQpmWodBgopib
	5fNn5wIxt+RFO1xwoK42D1w1JPFTGBwhQ8A0cl2xVUqhkJbLxZdXTlE1XcpoNOIEP9NO
	oilTK7S2hoAJslqBJOGlzHawczm5io/VsBkGsHoYLNiROKgOhxvUEX+cFemfVG8mJ8xF
	FpUpWIUlcuQVYo0zOQkBYPELK/TCpPARZNKHFgYAU82Gm3JtjMRE1qXsNt84f8DaBece
	bhDXuffj3os540zlhTT79VmyQd3dCWMmKZXrbahCmJxALFjBcikMa//shlMGVl/afGm6
	7yBQ==
MIME-Version: 1.0
X-Received: by 10.112.159.104 with SMTP id xb8mr539388lbb.31.1398798407693;
	Tue, 29 Apr 2014 12:06:47 -0700 (PDT)
Received: by 10.112.53.73 with HTTP; Tue, 29 Apr 2014 12:06:47 -0700 (PDT)
In-Reply-To: <1398795812-19400-1-git-send-email-Martin.Jansa@gmail.com>
References: <1398795812-19400-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 29 Apr 2014 21:06:47 +0200
Message-ID: <CAPbeDC==tw_W__Ci_VTF8Bg6ZsK-dCtUJVNUvK927vqVtF7X7Q@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] feature-arm-thumb.inc: set ARMPKGSFX_THUMB only when thumb is in TUNE_FEATURES
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
X-List-Received-Date: Tue, 29 Apr 2014 19:06:52 -0000
Content-Type: multipart/alternative; boundary=001a11c19a7833f9a504f833224a

--001a11c19a7833f9a504f833224a
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 29, 2014 at 8:23 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> * there is issue for TUNE_PKGARCH missing in PACKAGE_ARCHS for machines
>   without thumb enabled, it was reported by Jacob Kroon on IRC
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/machine/include/arm/feature-arm-thumb.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> index 8a38665..670e68e 100644
> --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> @@ -28,7 +28,7 @@ python () {
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '
> -m${ARM_M_OPT}', '', d)}"
>  OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ':thumb',
> '', d)}"
>
> -ARMPKGSFX_THUMB .= "${ARM_THUMB_SUFFIX}"
> +ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb',
> '${ARM_THUMB_SUFFIX}', '', d)}"
>
>  # Whether to compile with code to allow interworking between the two
>  # instruction sets. This allows thumb code to be executed on a primarily
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

Tested-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>

--001a11c19a7833f9a504f833224a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Apr 29, 2014 at 8:23 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">* there is issue for TUNE=
_PKGARCH missing in PACKAGE_ARCHS for machines<br>
=C2=A0 without thumb enabled, it was reported by Jacob Kroon on IRC<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">M=
artin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/arm/feature-arm-thumb.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/con=
f/machine/include/arm/feature-arm-thumb.inc<br>
index 8a38665..670e68e 100644<br>
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc<br>
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc<br>
@@ -28,7 +28,7 @@ python () {<br>
=C2=A0TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, =
&#39;thumb&#39;, &#39; -m${ARM_M_OPT}&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0OVERRIDES .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#=
39;thumb&#39;, &#39;:thumb&#39;, &#39;&#39;, d)}&quot;<br>
<br>
-ARMPKGSFX_THUMB .=3D &quot;${ARM_THUMB_SUFFIX}&quot;<br>
+ARMPKGSFX_THUMB .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &=
#39;thumb&#39;, &#39;${ARM_THUMB_SUFFIX}&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=C2=A0# Whether to compile with code to allow interworking between the two<=
br>
=C2=A0# instruction sets. This allows thumb code to be executed on a primar=
ily<br>
<span class=3D""><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br>Tested-by: Jacob Kroon &lt;<a href=3D"=
mailto:jacob.kroon@mikrodidakt.se">jacob.kroon@mikrodidakt.se</a>&gt;<br cl=
ear=3D"all"><br></div></div>

--001a11c19a7833f9a504f833224a--
