Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 091CC60603
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 22:49:18 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id f20so7089574pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2018 15:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NttmjVICgdGHqqUveazWUxlqSqyFbqZjzzcMfJlEt/k=;
	b=QlvPMHNWeKa+Ra16RGIx9T1phtkV0J5fuMKmYTavQgDyO3bYe5b2fRt55BmokdFwCG
	TlRM/90VC4tBx2yc+rz+mK08JWJeVSgfAKENmhC01otki1tPU7E63cDnerqBZFOY0LAu
	uXY3NiiMUxW665srArxSgequSDX1oNTDhL9FJ+Vc11tj2HZ9EgOJxUP/fMGtxQqIX0iz
	u6H4bOXJWyQHE2Ev/IZ2yBpBmMUXHTb1ftxoXD6dUDvtMPJZMPBkT7MeRoyaKYVpUchN
	J3PeBggdI6hUiHlWZ7x0KJEs+RWGGvYKoIFwFySflx1YSFFvA8bWBE6x+jt6mfN93rrr
	NqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NttmjVICgdGHqqUveazWUxlqSqyFbqZjzzcMfJlEt/k=;
	b=HuD3Y3tbgiiTrfS4dD37PQ/qHu64iumluv+eHBiwnFRmxhVrsQIZcNjJXQrifNT+ra
	t0g/MkALxavAWthTQPbfRyME49oZvbAFQmpDwy+LyNpTzdm8kKDt70DGPE6ONQ925h+g
	Lle1a04Un9LMW+OX07HLOODG4QGvBNSlOwBUjL6jGfV8WJcg8N/6nEoEMbnoeOtQKjwK
	k39C2Nbht4Q01me6pFBkgheZjn2pqGD87KoGJA+Xwl/8hoM3gBE8NuTBI/JnCooO6Kdt
	0qFtDTsjlOqMDWFu01hrbyzAxp1KmVBk0SXxgUPNJDHuDCJ0azxtJDxlFxYF4JrarDZu
	OTEg==
X-Gm-Message-State: ALQs6tCIBJ2XsKNfyzq+K4SmXggXUqCT5zcCS0qj/dYxgWcSVukH7rQW
	4sjGFVIwNXqYo/pY7M5Ad+whZMqJ6KslyJkPFGc=
X-Google-Smtp-Source: AB8JxZqOMgqtcduMaTm/BTzDCzSyCnMp1NVVrQO5oprz84r3xJXlCFT2OCCb43u692aBbbKQOLLSTQ3e56a33h4nxaM=
X-Received: by 2002:a17:902:14d:: with SMTP id
	71-v6mr722913plb.275.1525387759703; 
	Thu, 03 May 2018 15:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20180503081758.4661-1-anuj.mittal@intel.com>
In-Reply-To: <20180503081758.4661-1-anuj.mittal@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 03 May 2018 22:49:08 +0000
Message-ID: <CAMKF1sowEveYKrjFkNi9SmrtWYxtEqasXcbR0QFbs_V8hcw6hw@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/12] gstreamer1.0: upgrade 1.12.4 -> 1.14.0
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
X-List-Received-Date: Thu, 03 May 2018 22:49:19 -0000
Content-Type: multipart/alternative; boundary="0000000000008fda67056b5503ee"

--0000000000008fda67056b5503ee
Content-Type: text/plain; charset="UTF-8"

On Thu, May 3, 2018 at 1:18 AM Anuj Mittal <anuj.mittal@intel.com> wrote:

> * For changes, please see:
> https://gstreamer.freedesktop.org/releases/1.14/
> * Merge inc and bb file since we only have one version now.


Threre is meta gstreamer can you check if this is not going to affect that
layer

>
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb   | 14
> --------------
>  .../gstreamer/{gstreamer1.0.inc => gstreamer1.0_1.14.0.bb} | 12
> +++++++++++-
>  2 files changed, 11 insertions(+), 15 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/
> gstreamer1.0_1.12.4.bb
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0.inc =>
> gstreamer1.0_1.14.0.bb} (84%)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
> deleted file mode 100644
> index 01b2396513..0000000000
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -require gstreamer1.0.inc
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
> -
> file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
> -
> -SRC_URI = " \
> -    http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz
> \
> -"
> -SRC_URI[md5sum] = "9d268f2e891cce1ac0832f1cc467d4ea"
> -SRC_URI[sha256sum] =
> "5a8704aa4c2eeb04da192c4a9942f94f860ac1a585de90d9f914bac26a970674"
> -
> -S = "${WORKDIR}/gstreamer-${PV}"
> -
> -CVE_PRODUCT = "gstreamer"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
> similarity index 84%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
> index c2df1f3258..b4398c8111 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
> @@ -14,11 +14,19 @@ inherit autotools pkgconfig gettext
> upstream-version-is-even gobject-introspecti
>  # (it has a custom INTROSPECTION_INIT macro, and so must be used instead
> of our common introspection.m4 file)
>  acpaths = "-I ${S}/common/m4 -I ${S}/m4"
>
> -SRC_URI_append = " \
> +LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
> +
> file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
> +
> +S = "${WORKDIR}/gstreamer-${PV}"
> +
> +SRC_URI = " \
> +    http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz
> \
>
>  file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
>      file://gtk-doc-tweaks.patch \
>
>  file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
>  "
> +SRC_URI[md5sum] = "63c7cbfb86aa28c4522e374dc5555b96"
> +SRC_URI[sha256sum] =
> "fc361367f0d4b780a868a8833f9f30b9c9f4ac9faea4e6b251db8b4b0398466e"
>
>  PACKAGECONFIG ??= ""
>
> @@ -59,3 +67,5 @@ do_configure[prefuncs] += "delete_pkg_m4_file"
>  do_compile_prepend() {
>          export
> GIR_EXTRA_LIBS_PATH="${B}/gst/.libs:${B}/libs/gst/base/.libs"
>  }
> +
> +CVE_PRODUCT = "gstreamer"
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000008fda67056b5503ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Thu, May 3, 2018 a=
t 1:18 AM Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com">anuj.mit=
tal@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">* For =
changes, please see: <a href=3D"https://gstreamer.freedesktop.org/releases/=
1.14/" rel=3D"noreferrer" target=3D"_blank">https://gstreamer.freedesktop.o=
rg/releases/1.14/</a><br>
* Merge inc and bb file since we only have one version now.</blockquote><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Threre is meta gstreamer can you=
 check if this is not going to affect that layer</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><br>
<br>
Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" tar=
get=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.12=
.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.12.4.bb</a>=C2=
=A0 =C2=A0| 14 --------------<br>
=C2=A0.../gstreamer/{gstreamer1.0.inc =3D&gt; <a href=3D"http://gstreamer1.=
0_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.14.0.bb</a=
>} | 12 +++++++++++-<br>
=C2=A02 files changed, 11 insertions(+), 15 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-multimedia/gstreamer/<a href=3D"http:=
//gstreamer1.0_1.12.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0=
_1.12.4.bb</a><br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{gstreamer1.0.inc =3D&gt; <a=
 href=3D"http://gstreamer1.0_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank=
">gstreamer1.0_1.14.0.bb</a>} (84%)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0_1.12.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.12.4.bb</=
a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.12.=
4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.12.4.bb</a><br>
deleted file mode 100644<br>
index 01b2396513..0000000000<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.12=
.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.12.4.bb</a><br>
+++ /dev/null<br>
@@ -1,14 +0,0 @@<br>
-require gstreamer1.0.inc<br>
-<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6762ed442b3822387a51c92d92=
8ead0d \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://gst/gst.h;beginline=3D1;endline=3D21;md5=3De059138481205ee2c6fc1c079c016=
d0d&quot;<br>
-<br>
-SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 <a href=3D"http://gstreamer.freedesktop.org/src/gstreamer/gs=
treamer-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://gstre=
amer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz</a> \<br>
-&quot;<br>
-SRC_URI[md5sum] =3D &quot;9d268f2e891cce1ac0832f1cc467d4ea&quot;<br>
-SRC_URI[sha256sum] =3D &quot;5a8704aa4c2eeb04da192c4a9942f94f860ac1a585de9=
0d9f914bac26a970674&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/gstreamer-${PV}&quot;<br>
-<br>
-CVE_PRODUCT =3D &quot;gstreamer&quot;<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/reci=
pes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.14.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">gstreamer1.0_1.14.0.bb</a><br>
similarity index 84%<br>
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0.inc<br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_=
1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.14.0.bb</a><=
br>
index c2df1f3258..b4398c8111 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc<br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.14=
.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.14.0.bb</a><br>
@@ -14,11 +14,19 @@ inherit autotools pkgconfig gettext upstream-version-is=
-even gobject-introspecti<br>
=C2=A0# (it has a custom INTROSPECTION_INIT macro, and so must be used inst=
ead of our common introspection.m4 file)<br>
=C2=A0acpaths =3D &quot;-I ${S}/common/m4 -I ${S}/m4&quot;<br>
<br>
-SRC_URI_append =3D &quot; \<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6762ed442b3822387a51c92d92=
8ead0d \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://gst/gst.h;beginline=3D1;endline=3D21;md5=3De059138481205ee2c6fc1c079c016=
d0d&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/gstreamer-${PV}&quot;<br>
+<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 <a href=3D"http://gstreamer.freedesktop.org/src/gstreamer/gs=
treamer-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://gstre=
amer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-introspection.m4-prefix-pkgconfig-paths-wit=
h-PKG_CON.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://gtk-doc-tweaks.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-gst-gstpluginloader.c-when-env-var-is-set-d=
o-not-fal.patch \<br>
=C2=A0&quot;<br>
+SRC_URI[md5sum] =3D &quot;63c7cbfb86aa28c4522e374dc5555b96&quot;<br>
+SRC_URI[sha256sum] =3D &quot;fc361367f0d4b780a868a8833f9f30b9c9f4ac9faea4e=
6b251db8b4b0398466e&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;&quot;<br>
<br>
@@ -59,3 +67,5 @@ do_configure[prefuncs] +=3D &quot;delete_pkg_m4_file&quot=
;<br>
=C2=A0do_compile_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export GIR_EXTRA_LIBS_PATH=3D&quot;${B}/g=
st/.libs:${B}/libs/gst/base/.libs&quot;<br>
=C2=A0}<br>
+<br>
+CVE_PRODUCT =3D &quot;gstreamer&quot;<br>
-- <br>
2.14.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000008fda67056b5503ee--
