Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 254F46BAA1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 08:29:45 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id s7so3168136qap.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jun 2014 01:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=9ttW/arG4GyD4aoDzN9UNqgyyrtNKIv658/aCkwjlDs=;
	b=PS3RYAC3mfVg5wW2YXi/CM6+OU+xTVBlr0O4ePqH/Df2rKWBCtY384yDM1GPpNAGRd
	w3iazcESWr3hqmsvCyKxSu1zrNi6Ww33wjiq9AXsTGz7DdhEYk4+6bb2jLcL423SqqAo
	zRONyDuSKzoEdN/fmaWX/TSKhSHLGYJoUGYdXjH+2mPOgl5IfKWqux4HpD1i6p5B8stE
	+cq/gYVWEAYjVnxec2lKO4zpoPlR4xDKkG/0UEzZEcPjM0MYBLmbdR4VKsMpRJaZr8C5
	hWU0SaIyuhFRGfBAlMsRtT1HngYWprrmVNi0WkpG61jZ6/gwlRz0CvFNneZEtj51801Z
	Yjag==
X-Gm-Message-State: ALoCoQnG2CeQUAmygRFSjacV8eJc9m/WT4kiT0eYmjYZviSuq9VOnUrPnHedaXR/XLKDW7etZwi2
MIME-Version: 1.0
X-Received: by 10.140.91.161 with SMTP id z30mr5335671qgd.65.1402043386299;
	Fri, 06 Jun 2014 01:29:46 -0700 (PDT)
Received: by 10.140.101.77 with HTTP; Fri, 6 Jun 2014 01:29:46 -0700 (PDT)
In-Reply-To: <d04b9d9275126daf15d538362b046e93ed45c99d.1402042902.git.Qi.Chen@windriver.com>
References: <cover.1402042902.git.Qi.Chen@windriver.com>
	<d04b9d9275126daf15d538362b046e93ed45c99d.1402042902.git.Qi.Chen@windriver.com>
Date: Fri, 6 Jun 2014 09:29:46 +0100
Message-ID: <CAJTo0LZi1G+qv=P-n9knxugf2aH2y2_uMPyfBO0aiVOVbBOqVw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] glib-2.0: upgrade from 2.40.0 to 2.41.0
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
X-List-Received-Date: Fri, 06 Jun 2014 08:29:47 -0000
Content-Type: multipart/alternative; boundary=001a113a84d200221304fb26aa59

--001a113a84d200221304fb26aa59
Content-Type: text/plain; charset=UTF-8

Odd versions are development releases so a big no to this.

Ross

On Friday, 6 June 2014, Chen Qi <Qi.Chen@windriver.com> wrote:

> Upgrade glib-2.0 from 2.40.0 to 2.41.0
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com <javascript:;>>
> ---
>  .../{glib-2.0_2.40.0.bb => glib-2.0_2.41.0.bb}     |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-core/glib-2.0/{glib-2.0_2.40.0.bb =>
> glib-2.0_2.41.0.bb} (81%)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb
> b/meta/recipes-core/glib-2.0/glib-2.0_2.41.0.bb
> similarity index 81%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.41.0.bb
> index ff1fb87..252d306 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.41.0.bb
> @@ -17,5 +17,5 @@ SRC_URI =
> "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>
>  SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
>
> -SRC_URI[md5sum] = "05fb7cb17eacbc718e90366a1eae60d9"
> -SRC_URI[sha256sum] =
> "0d27f195966ecb1995dcce0754129fd66ebe820c7cd29200d264b02af1aa28b5"
> +SRC_URI[md5sum] = "65a0d3fa1e79b7d21bbc09579a0f3cf3"
> +SRC_URI[sha256sum] =
> "e85e2714147928e3f6410a3f9a5c11ebfcfc7b3b11706e3374636b091dc7c3f7"
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113a84d200221304fb26aa59
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Odd versions are development releases so a big no to this.<div><br></div><d=
iv>Ross<span></span><br><br>On Friday, 6 June 2014, Chen Qi &lt;<a href=3D"=
mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
Upgrade glib-2.0 from 2.40.0 to 2.41.0<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"javascript:;" onclick=3D"_e(event, &#=
39;cvml&#39;, &#39;Qi.Chen@windriver.com&#39;)">Qi.Chen@windriver.com</a>&g=
t;<br>
---<br>
=C2=A0.../{<a href=3D"http://glib-2.0_2.40.0.bb" target=3D"_blank">glib-2.0=
_2.40.0.bb</a> =3D&gt; <a href=3D"http://glib-2.0_2.41.0.bb" target=3D"_bla=
nk">glib-2.0_2.41.0.bb</a>} =C2=A0 =C2=A0 | =C2=A0 =C2=A04 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-core/glib-2.0/{<a href=3D"http://glib-2.0_2.40.0.=
bb" target=3D"_blank">glib-2.0_2.40.0.bb</a> =3D&gt; <a href=3D"http://glib=
-2.0_2.41.0.bb" target=3D"_blank">glib-2.0_2.41.0.bb</a>} (81%)<br>
<br>
diff --git a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.40.0.b=
b" target=3D"_blank">glib-2.0_2.40.0.bb</a> b/meta/recipes-core/glib-2.0/<a=
 href=3D"http://glib-2.0_2.41.0.bb" target=3D"_blank">glib-2.0_2.41.0.bb</a=
><br>

similarity index 81%<br>
rename from meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.40.0.bb=
" target=3D"_blank">glib-2.0_2.40.0.bb</a><br>
rename to meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.41.0.bb" =
target=3D"_blank">glib-2.0_2.41.0.bb</a><br>
index ff1fb87..252d306 100644<br>
--- a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.40.0.bb" targ=
et=3D"_blank">glib-2.0_2.40.0.bb</a><br>
+++ b/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.41.0.bb" targ=
et=3D"_blank">glib-2.0_2.41.0.bb</a><br>
@@ -17,5 +17,5 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/glib/${SHRT_VER}/glib-$=
{PV}.tar.xz \<br>
<br>
=C2=A0SRC_URI_append_class-native =3D &quot; file://glib-gettextize-dir.pat=
ch&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;05fb7cb17eacbc718e90366a1eae60d9&quot;<br>
-SRC_URI[sha256sum] =3D &quot;0d27f195966ecb1995dcce0754129fd66ebe820c7cd29=
200d264b02af1aa28b5&quot;<br>
+SRC_URI[md5sum] =3D &quot;65a0d3fa1e79b7d21bbc09579a0f3cf3&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e85e2714147928e3f6410a3f9a5c11ebfcfc7b3b11706=
e3374636b091dc7c3f7&quot;<br>
--<br>
1.7.9.5<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Openembe=
dded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.openembedde=
d.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</blockquote></div>

--001a113a84d200221304fb26aa59--
