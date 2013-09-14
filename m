Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5411361587
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 04:35:34 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id at1so4179942iec.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 21:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=3g7uY3DcH8VsdpEWFGP67KlbjweAJ/SQzVa2wLYNG1U=;
	b=QcLBEtBTS+rx4EwaqtTBmCm+z3yEls6oVK69o3cbSZdWL4tqiobh/iwIMTnofozFTd
	8NdxPkiDCyp1/RrtjO8Gl/U5xjR1zI/p1ux307H/GI01LdGFmQcx0vCugKlwS+AH/MiO
	wqJsLmOzPFvSAjz3M5IdfJCvTjG3Kft4rBam8va10Xc8GplY/xLkw4ke3OyHStsShJ3K
	SXddqai8yGBikte+k6oFfQcBV9HybfRsbIXPzEWbgu403/N+GQytBQa+mOKuskZlH8qP
	NIRlgFsULFv4hxvjzLbCN4bqGx8Rx6oXs/88/TOQyg5w3dt9U9DGQviotPXDAZ80owXv
	DC1w==
MIME-Version: 1.0
X-Received: by 10.50.118.105 with SMTP id kl9mr2658882igb.3.1379133336096;
	Fri, 13 Sep 2013 21:35:36 -0700 (PDT)
Received: by 10.50.216.195 with HTTP; Fri, 13 Sep 2013 21:35:36 -0700 (PDT)
In-Reply-To: <1379114920-23851-1-git-send-email-jslater@windriver.com>
References: <1379114920-23851-1-git-send-email-jslater@windriver.com>
Date: Fri, 13 Sep 2013 21:35:36 -0700
Message-ID: <CAMKF1spii+oAutyKLg0+k2Qdp-KccVzX+r0=tX57bBgYkxrMgA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] webkit-gtk: limit ld memory requirement
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
X-List-Received-Date: Sat, 14 Sep 2013 04:35:34 -0000
Content-Type: multipart/alternative; boundary=089e011769cf9897fc04e65080e6

--089e011769cf9897fc04e65080e6
Content-Type: text/plain; charset=UTF-8

On Friday, September 13, 2013, Joe Slater wrote:

> Add --no-keep-memory to LDFLAGS.


It does not come with out a price. Have you measured how much performance
degradation it brings in ?
We need that to assess the trade off and also describe the machine
configuration where this option is helping


>
> Signed-off-by: Joe Slater <jslater@windriver.com <javascript:;>>
> ---
>  meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bbb/meta/recipes-sato/webkit/
> webkit-gtk_1.8.3.bb
> index 5691d3f..9304243 100644
> --- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
> +++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
> @@ -58,6 +58,10 @@ CPPFLAGS_append_powerpc = "
> -I${STAGING_INCDIR}/pango-1.0 \
>                              -I${STAGING_LIBDIR}/glib-2.0/include \
>                              -I${STAGING_INCDIR}/glib-2.0"
>
> +# ld can run out of memory linking libwebkitgtk!
> +#
> +LDFLAGS += "-Wl,--no-keep-memory"
> +
>  EXTRA_AUTORECONF = " -I Source/autotools "
>
>
> --
> 1.7.3.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e011769cf9897fc04e65080e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, September 13, 2013, Joe Slater  wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Add --no-keep-memory to LDFLAGS.</blockquote><div><br></di=
v>
<div>It does not come with out a price. Have you measured how much performa=
nce degradation it brings in ?</div><div>We need that to assess the trade o=
ff and also describe the machine configuration where this option is helping=
</div>
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Joe Slater &lt;<a href=3D"javascript:;" onclick=3D"_e(event,=
 &#39;cvml&#39;, &#39;jslater@windriver.com&#39;)">jslater@windriver.com</a=
>&gt;<br>
---<br>
=C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkit-gtk_1.8.3.bb" targe=
t=3D"_blank">webkit-gtk_1.8.3.bb</a> | =C2=A0 =C2=A04 ++++<br>
=C2=A01 files changed, 4 insertions(+), 0 deletions(-)<br>
<br>
diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkit-gtk_1.8.3.bb=
" target=3D"_blank">webkit-gtk_1.8.3.bb</a> b/meta/recipes-sato/webkit/<a h=
ref=3D"http://webkit-gtk_1.8.3.bb" target=3D"_blank">webkit-gtk_1.8.3.bb</a=
><br>

index 5691d3f..9304243 100644<br>
--- a/meta/recipes-sato/webkit/<a href=3D"http://webkit-gtk_1.8.3.bb" targe=
t=3D"_blank">webkit-gtk_1.8.3.bb</a><br>
+++ b/meta/recipes-sato/webkit/<a href=3D"http://webkit-gtk_1.8.3.bb" targe=
t=3D"_blank">webkit-gtk_1.8.3.bb</a><br>
@@ -58,6 +58,10 @@ CPPFLAGS_append_powerpc =3D &quot; -I${STAGING_INCDIR}/p=
ango-1.0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-I${STAGING_LIBDIR}/glib-2.0/include \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-I${STAGING_INCDIR}/glib-2.0&quot;<br>
<br>
+# ld can run out of memory linking libwebkitgtk!<br>
+#<br>
+LDFLAGS +=3D &quot;-Wl,--no-keep-memory&quot;<br>
+<br>
=C2=A0EXTRA_AUTORECONF =3D &quot; -I Source/autotools &quot;<br>
<br>
<br>
--<br>
1.7.3.4<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Openembe=
dded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.openembedde=
d.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</blockquote>

--089e011769cf9897fc04e65080e6--
