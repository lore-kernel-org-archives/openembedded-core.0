Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1D65778436
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 06:35:41 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id c74so20166762iod.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 23:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OBUro1lCMWkrkqhOYilC+CMBV4JLwCGYKZcl8ufWAU0=;
	b=QPxk3S5/BwbjKdNhktKLi0/V/gweFAHyMCVmiPV11IHqpypPK2azquzfpVPUFkJk+d
	kIpkKR8ltv5DH/IqU15oRBajl7UeGyxrVRBxufNstbw1H8oVQ7lv8CFYwkX4Nk9IL9vP
	XBKs4aW8bKe6zEJydZ+OFcl5Bp9LuV1fTA90i/MiQkuvbpApmqHeOsu8pA+6C/ePBVl8
	YAU0/Ny5agDPEagZ0uVRCNpNsH4sc8tEiqIDP1DCSZ0eTbXMmmAH8xGd4FnqPrNoSvyy
	YBQuAlqjzVp6FFbjN1XamsB1y2+2KTCMDAYZ/2QQYnLkCQfNuNo/H8WWMVHhCHbFmizK
	YfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OBUro1lCMWkrkqhOYilC+CMBV4JLwCGYKZcl8ufWAU0=;
	b=Id8f7NqS2WH9Hy/W3D5GQgbpinF4Tx9ce+hos9I6OcPGUgMLzNbkL0JCvQ6lmFAj2i
	MmtroR/WsX6TVjYnvCrLvBu4F5eERLCBBRR2UJdB5s7nDIfUVLJa3k1rb+h9w1JOOXMc
	WRav7Tcrbo5pxkPHnaEi8SRTV8BzxryHiJVgSrWkyLjKXsQklcAoUd8beVZ1/nEsMbaq
	5lGvymeCox5x/8p33Tx3jjnIiauSDPgPy9Ginvg01ik14JH+IhjUSag0y7qZo6NF51Xd
	hxwSn6IBkZsSLnDlgCj3yh0/eJ1XUxYF8CsOrrmBOEFkkQm2DIvfhBihy2YavbkIpUtp
	a/GQ==
X-Gm-Message-State: AHYfb5hJxpC6Y4iZ8nv2YlsVFmpjNAN68M9vv7DMYVm/SlfPEhFvctUD
	EwN/MFhxpUFn6DrodM7pUx9u0H1HAPFi
X-Received: by 10.107.25.137 with SMTP id 131mr3643922ioz.153.1502951742976;
	Wed, 16 Aug 2017 23:35:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.141.19 with HTTP; Wed, 16 Aug 2017 23:35:12 -0700 (PDT)
In-Reply-To: <1502949048-4092-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1502949048-4092-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 17 Aug 2017 09:35:12 +0300
Message-ID: <CAHiDW_HpVyJ94GSAwSHN50WUHO7YMtq0YjRX0KuBH8VrYEoo_g@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pango: 1.40.6 -> 1.40.10
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
X-List-Received-Date: Thu, 17 Aug 2017 06:35:42 -0000
Content-Type: multipart/alternative; boundary="001a113fd62ec14de80556ed38f7"

--001a113fd62ec14de80556ed38f7
Content-Type: text/plain; charset="UTF-8"

On 17 August 2017 at 08:50, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:

> 1) Upgrade pango from 1.40.6 to 1.40.10.
> 2) Modify 0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch
> for pango 1.40.10.
>

I admit I didn't understand the patch even before this but especially now
that pango.types is apparently no longer shipped, how does the patch do
what it claims to do?

Jussi



>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  ...reation-of-docs-pango.types-it-is-build-c.patch | 104
> ++-------------------
>  .../pango/{pango_1.40.6.bb => pango_1.40.10.bb}    |   4 +-
>  2 files changed, 10 insertions(+), 98 deletions(-)
>  rename meta/recipes-graphics/pango/{pango_1.40.6.bb => pango_1.40.10.bb}
> (92%)
>
> diff --git a/meta/recipes-graphics/pango/pango/0001-Enforce-recreation-
> of-docs-pango.types-it-is-build-c.patch b/meta/recipes-graphics/pango/
> pango/0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch
> index 6784a10..481f267 100644
> --- a/meta/recipes-graphics/pango/pango/0001-Enforce-recreation-
> of-docs-pango.types-it-is-build-c.patch
> +++ b/meta/recipes-graphics/pango/pango/0001-Enforce-recreation-
> of-docs-pango.types-it-is-build-c.patch
> @@ -1,6 +1,3 @@
> -From 526a6a9fc9a1cfe75c521c8bb39b61754fe42fe8 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Fri, 2 Sep 2016 14:00:24 +0300
>  Subject: [PATCH] Enforce recreation of docs/pango.types; it is build
>   configuration-specific.
>
> @@ -8,14 +5,15 @@ In particular, it needs to exclude references to
> PangoXft if Xft is not availabl
>
>  Upstream-Status: Pending
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
> +Update for pango 1.40.10.
> +Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
>  ---
> - docs/Makefile.am | 17 ++++--------
> - docs/pango.types | 80 ------------------------------
> --------------------------
> - 2 files changed, 5 insertions(+), 92 deletions(-)
> - delete mode 100644 docs/pango.types
> + docs/Makefile.am | 17 +++++------------
> + 1 file changed, 5 insertions(+), 12 deletions(-)
>
>  diff --git a/docs/Makefile.am b/docs/Makefile.am
> -index f5f1317..8947a99 100644
> +index f5f1317..76b8661 100644
>  --- a/docs/Makefile.am
>  +++ b/docs/Makefile.am
>  @@ -49,6 +49,10 @@ IGNORE_HFILES=                      \
> @@ -52,96 +50,10 @@ index f5f1317..8947a99 100644
>         version.xml.in                  \
>  -      check.docs                      \
>  -      pango.types
> -+      check.docs
> ++        check.docs
>
>   # force doc rebulid after configure
>   dist-hook-local: dist-local-check-no-cross-references all-local
> -diff --git a/docs/pango.types b/docs/pango.types
> -deleted file mode 100644
> -index 7d93cda..0000000
> ---- a/docs/pango.types
> -+++ /dev/null
> -@@ -1,80 +0,0 @@
> --#include <pango/pango-attributes.h>
> --#include <pango/pango-context.h>
> --#include <pango/pango-engine.h>
> --#include <pango/pango-enum-types.h>
> --#include <pango/pango-font.h>
> --#include <pango/pango-fontmap.h>
> --#include <pango/pango-fontset.h>
> --#include <pango/pango-glyph-item.h>
> --#include <pango/pango-glyph.h>
> --#include <pango/pango-item.h>
> --#include <pango/pango-language.h>
> --#include <pango/pango-layout.h>
> --#include <pango/pango-matrix.h>
> --#include <pango/pango-ot.h>
> --#include <pango/pango-renderer.h>
> --#include <pango/pango-tabs.h>
> --#include <pango/pangocairo-fc.h>
> --#include <pango/pangocairo.h>
> --#include <pango/pangofc-decoder.h>
> --#include <pango/pangofc-font.h>
> --#include <pango/pangofc-fontmap.h>
> --#include <pango/pangoft2.h>
> --#include <pango/pangoxft-render.h>
> --#include <pango/pangoxft.h>
> --
> --pango_alignment_get_type
> --pango_attr_list_get_type
> --pango_attr_type_get_type
> --pango_bidi_type_get_type
> --pango_cairo_fc_font_map_get_type
> --pango_cairo_font_get_type
> --pango_cairo_font_map_get_type
> --pango_color_get_type
> --pango_context_get_type
> --pango_coverage_level_get_type
> --pango_direction_get_type
> --pango_ellipsize_mode_get_type
> --pango_engine_get_type
> --pango_engine_lang_get_type
> --pango_engine_shape_get_type
> --pango_fc_decoder_get_type
> --pango_fc_font_get_type
> --pango_fc_font_map_get_type
> --pango_font_description_get_type
> --pango_font_face_get_type
> --pango_font_family_get_type
> --pango_font_get_type
> --pango_font_map_get_type
> --pango_font_mask_get_type
> --pango_font_metrics_get_type
> --pango_fontset_get_type
> --pango_fontset_simple_get_type
> --pango_ft2_font_map_get_type
> --pango_glyph_item_get_type
> --pango_glyph_item_iter_get_type
> --pango_glyph_string_get_type
> --pango_gravity_get_type
> --pango_gravity_hint_get_type
> --pango_item_get_type
> --pango_language_get_type
> --pango_layout_get_type
> --pango_layout_iter_get_type
> --pango_layout_line_get_type
> --pango_matrix_get_type
> --pango_ot_info_get_type
> --pango_ot_ruleset_get_type
> --pango_render_part_get_type
> --pango_renderer_get_type
> --pango_script_get_type
> --pango_stretch_get_type
> --pango_style_get_type
> --pango_tab_align_get_type
> --pango_tab_array_get_type
> --pango_underline_get_type
> --pango_variant_get_type
> --pango_weight_get_type
> --pango_wrap_mode_get_type
> --pango_xft_font_get_type
> --pango_xft_font_map_get_type
> --pango_xft_renderer_get_type
>  --
> -2.9.3
> +2.7.4
>
> diff --git a/meta/recipes-graphics/pango/pango_1.40.6.bb
> b/meta/recipes-graphics/pango/pango_1.40.10.bb
> similarity index 92%
> rename from meta/recipes-graphics/pango/pango_1.40.6.bb
> rename to meta/recipes-graphics/pango/pango_1.40.10.bb
> index 31c3d2a..e5ce6cd 100644
> --- a/meta/recipes-graphics/pango/pango_1.40.6.bb
> +++ b/meta/recipes-graphics/pango/pango_1.40.10.bb
> @@ -17,8 +17,8 @@ SRC_URI += "file://run-ptest \
>              file://0001-Drop-introspection-macros-from-acinclude.m4.patch
> \
>              file://0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch
> \
>  "
> -SRC_URI[archive.md5sum] = "507c6746fbf53fc9d48c577f1e265de3"
> -SRC_URI[archive.sha256sum] = "ca152b7383a1e9f7fd74ae96023dc6
> 770dc5043414793bfe768ff06b6759e573"
> +SRC_URI[archive.md5sum] = "a612e445157c688a3efe878938e7f4c6"
> +SRC_URI[archive.sha256sum] = "5d41d94a1f70e92ba5808e13f2bf3e
> f198901ddc0dc7e74e5afde994724466f6"
>
>  DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv
> cairo harfbuzz"
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113fd62ec14de80556ed38f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
7 August 2017 at 08:50, Huang Qiyu <span dir=3D"ltr">&lt;<a href=3D"mailto:=
huangqy.fnst@cn.fujitsu.com" target=3D"_blank">huangqy.fnst@cn.fujitsu.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">1) Upgrade pango fr=
om 1.40.6 to 1.40.10.<br>
2) Modify 0001-Enforce-recreation-of-<wbr>docs-pango.types-it-is-build-<wbr=
>c.patch for pango 1.40.10.<br></blockquote><div><br></div><div>I admit I d=
idn&#39;t understand the patch even before this but especially now that pan=
go.types is apparently no longer shipped, how does the patch do what it cla=
ims to do?</div><div><br></div><div>Jussi</div><div><br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com=
">huangqy.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...reation-of-docs-pango.<wbr>types-it-is-build-c.patch | 104 ++-----=
--------------<br>
=C2=A0.../pango/{<a href=3D"http://pango_1.40.6.bb" rel=3D"noreferrer" targ=
et=3D"_blank">pango_1.40.6.bb</a> =3D&gt; <a href=3D"http://pango_1.40.10.b=
b" rel=3D"noreferrer" target=3D"_blank">pango_1.40.10.bb</a>}=C2=A0 =C2=A0 =
|=C2=A0 =C2=A04 +-<br>
=C2=A02 files changed, 10 insertions(+), 98 deletions(-)<br>
=C2=A0rename meta/recipes-graphics/pango/{<a href=3D"http://pango_1.40.6.bb=
" rel=3D"noreferrer" target=3D"_blank">p<wbr>ango_1.40.6.bb</a> =3D&gt; <a =
href=3D"http://pango_1.40.10.bb" rel=3D"noreferrer" target=3D"_blank">pango=
_1.40.10.bb</a>} (92%)<br>
<br>
diff --git a/meta/recipes-graphics/pango/<wbr>pango/0001-Enforce-recreation=
-<wbr>of-docs-pango.types-it-is-<wbr>build-c.patch b/meta/recipes-graphics/=
pango/<wbr>pango/0001-Enforce-recreation-<wbr>of-docs-pango.types-it-is-<wb=
r>build-c.patch<br>
index 6784a10..481f267 100644<br>
--- a/meta/recipes-graphics/pango/<wbr>pango/0001-Enforce-recreation-<wbr>o=
f-docs-pango.types-it-is-<wbr>build-c.patch<br>
+++ b/meta/recipes-graphics/pango/<wbr>pango/0001-Enforce-recreation-<wbr>o=
f-docs-pango.types-it-is-<wbr>build-c.patch<br>
@@ -1,6 +1,3 @@<br>
-From 526a6a9fc9a1cfe75c521c8bb39b61<wbr>754fe42fe8 Mon Sep 17 00:00:00 200=
1<br>
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex=
.kanavin@gmail.com</a>&gt;<br>
-Date: Fri, 2 Sep 2016 14:00:24 +0300<br>
=C2=A0Subject: [PATCH] Enforce recreation of docs/pango.types; it is build<=
br>
=C2=A0 configuration-specific.<br>
<br>
@@ -8,14 +5,15 @@ In particular, it needs to exclude references to PangoXft=
 if Xft is not availabl<br>
<br>
=C2=A0Upstream-Status: Pending<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com">alex.kanavin@gmail.com</a>&gt;<br>
+<br>
+Update for pango 1.40.10.<br>
+Signed-off-by: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.co=
m">huangqy.fnst@cn.fujitsu.com</a>&gt;<br>
=C2=A0---<br>
- docs/Makefile.am | 17 ++++--------<br>
- docs/pango.types | 80 ------------------------------<wbr>----------------=
----------<br>
- 2 files changed, 5 insertions(+), 92 deletions(-)<br>
- delete mode 100644 docs/pango.types<br>
+ docs/Makefile.am | 17 +++++------------<br>
+ 1 file changed, 5 insertions(+), 12 deletions(-)<br>
<br>
=C2=A0diff --git a/docs/Makefile.am b/docs/Makefile.am<br>
-index f5f1317..8947a99 100644<br>
+index f5f1317..76b8661 100644<br>
=C2=A0--- a/docs/Makefile.am<br>
=C2=A0+++ b/docs/Makefile.am<br>
=C2=A0@@ -49,6 +49,10 @@ IGNORE_HFILES=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
@@ -52,96 +50,10 @@ index f5f1317..8947a99 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://version.xml.in" rel=3D"norefe=
rrer" target=3D"_blank">version.xml.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 check.docs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 pango.types<br>
-+=C2=A0 =C2=A0 =C2=A0 check.docs<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 check.docs<br>
<br>
=C2=A0 # force doc rebulid after configure<br>
=C2=A0 dist-hook-local: dist-local-check-no-cross-<wbr>references all-local=
<br>
-diff --git a/docs/pango.types b/docs/pango.types<br>
-deleted file mode 100644<br>
-index 7d93cda..0000000<br>
---- a/docs/pango.types<br>
-+++ /dev/null<br>
-@@ -1,80 +0,0 @@<br>
--#include &lt;pango/pango-attributes.h&gt;<br>
--#include &lt;pango/pango-context.h&gt;<br>
--#include &lt;pango/pango-engine.h&gt;<br>
--#include &lt;pango/pango-enum-types.h&gt;<br>
--#include &lt;pango/pango-font.h&gt;<br>
--#include &lt;pango/pango-fontmap.h&gt;<br>
--#include &lt;pango/pango-fontset.h&gt;<br>
--#include &lt;pango/pango-glyph-item.h&gt;<br>
--#include &lt;pango/pango-glyph.h&gt;<br>
--#include &lt;pango/pango-item.h&gt;<br>
--#include &lt;pango/pango-language.h&gt;<br>
--#include &lt;pango/pango-layout.h&gt;<br>
--#include &lt;pango/pango-matrix.h&gt;<br>
--#include &lt;pango/pango-ot.h&gt;<br>
--#include &lt;pango/pango-renderer.h&gt;<br>
--#include &lt;pango/pango-tabs.h&gt;<br>
--#include &lt;pango/pangocairo-fc.h&gt;<br>
--#include &lt;pango/pangocairo.h&gt;<br>
--#include &lt;pango/pangofc-decoder.h&gt;<br>
--#include &lt;pango/pangofc-font.h&gt;<br>
--#include &lt;pango/pangofc-fontmap.h&gt;<br>
--#include &lt;pango/pangoft2.h&gt;<br>
--#include &lt;pango/pangoxft-render.h&gt;<br>
--#include &lt;pango/pangoxft.h&gt;<br>
--<br>
--pango_alignment_get_type<br>
--pango_attr_list_get_type<br>
--pango_attr_type_get_type<br>
--pango_bidi_type_get_type<br>
--pango_cairo_fc_font_map_get_<wbr>type<br>
--pango_cairo_font_get_type<br>
--pango_cairo_font_map_get_<wbr>type<br>
--pango_color_get_type<br>
--pango_context_get_type<br>
--pango_coverage_level_get_<wbr>type<br>
--pango_direction_get_type<br>
--pango_ellipsize_mode_get_<wbr>type<br>
--pango_engine_get_type<br>
--pango_engine_lang_get_type<br>
--pango_engine_shape_get_type<br>
--pango_fc_decoder_get_type<br>
--pango_fc_font_get_type<br>
--pango_fc_font_map_get_type<br>
--pango_font_description_get_<wbr>type<br>
--pango_font_face_get_type<br>
--pango_font_family_get_type<br>
--pango_font_get_type<br>
--pango_font_map_get_type<br>
--pango_font_mask_get_type<br>
--pango_font_metrics_get_type<br>
--pango_fontset_get_type<br>
--pango_fontset_simple_get_<wbr>type<br>
--pango_ft2_font_map_get_type<br>
--pango_glyph_item_get_type<br>
--pango_glyph_item_iter_get_<wbr>type<br>
--pango_glyph_string_get_type<br>
--pango_gravity_get_type<br>
--pango_gravity_hint_get_type<br>
--pango_item_get_type<br>
--pango_language_get_type<br>
--pango_layout_get_type<br>
--pango_layout_iter_get_type<br>
--pango_layout_line_get_type<br>
--pango_matrix_get_type<br>
--pango_ot_info_get_type<br>
--pango_ot_ruleset_get_type<br>
--pango_render_part_get_type<br>
--pango_renderer_get_type<br>
--pango_script_get_type<br>
--pango_stretch_get_type<br>
--pango_style_get_type<br>
--pango_tab_align_get_type<br>
--pango_tab_array_get_type<br>
--pango_underline_get_type<br>
--pango_variant_get_type<br>
--pango_weight_get_type<br>
--pango_wrap_mode_get_type<br>
--pango_xft_font_get_type<br>
--pango_xft_font_map_get_type<br>
--pango_xft_renderer_get_type<br>
=C2=A0--<br>
-2.9.3<br>
+2.7.4<br>
<br>
diff --git a/meta/recipes-graphics/pango/<a href=3D"http://pango_1.40.6.bb"=
 rel=3D"noreferrer" target=3D"_blank"><wbr>pango_1.40.6.bb</a> b/meta/recip=
es-graphics/pango/<a href=3D"http://pango_1.40.10.bb" rel=3D"noreferrer" ta=
rget=3D"_blank"><wbr>pango_1.40.10.bb</a><br>
similarity index 92%<br>
rename from meta/recipes-graphics/pango/<a href=3D"http://pango_1.40.6.bb" =
rel=3D"noreferrer" target=3D"_blank">pa<wbr>ngo_1.40.6.bb</a><br>
rename to meta/recipes-graphics/pango/<a href=3D"http://pango_1.40.10.bb" r=
el=3D"noreferrer" target=3D"_blank">pa<wbr>ngo_1.40.10.bb</a><br>
index 31c3d2a..e5ce6cd 100644<br>
--- a/meta/recipes-graphics/pango/<a href=3D"http://pango_1.40.6.bb" rel=3D=
"noreferrer" target=3D"_blank"><wbr>pango_1.40.6.bb</a><br>
+++ b/meta/recipes-graphics/pango/<a href=3D"http://pango_1.40.10.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>pango_1.40.10.bb</a><br>
@@ -17,8 +17,8 @@ SRC_URI +=3D &quot;file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Drop-<wbr>intro=
spection-macros-from-<wbr>acinclude.m4.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Enforce-<wbr>re=
creation-of-docs-pango.<wbr>types-it-is-build-c.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[archive.md5sum] =3D &quot;<wbr>507c6746fbf53fc9d48c577f1e265d<wbr>=
e3&quot;<br>
-SRC_URI[archive.sha256sum] =3D &quot;<wbr>ca152b7383a1e9f7fd74ae96023dc6<w=
br>770dc5043414793bfe768ff06b6759<wbr>e573&quot;<br>
+SRC_URI[archive.md5sum] =3D &quot;<wbr>a612e445157c688a3efe878938e7f4<wbr>=
c6&quot;<br>
+SRC_URI[archive.sha256sum] =3D &quot;<wbr>5d41d94a1f70e92ba5808e13f2bf3e<w=
br>f198901ddc0dc7e74e5afde9947244<wbr>66f6&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;glib-2.0 glib-2.0-native fontconfig freetype virtua=
l/libiconv cairo harfbuzz&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a113fd62ec14de80556ed38f7--
