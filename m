Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 383447197A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 16:48:19 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id t87so7356482ioe.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 09:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ch7mGFhk3nJb9qPaEyULzTm3qOP4VkJVTgkUPEP1tps=;
	b=1BwugwxbYrEpXBRlJ37AI4lhYUlXz9bQ+iNzBYLGvrnejsRQrBnb/inFpBEIOPFcjY
	Eend9H9/4JTTf6ZPht7JTGUpZTGltbp8Wrrz99mdd8lUGUBQGVYKxAX3pgIyHPJ7fVMR
	afwajpLJ25Bsh9qAmSz2WuK2lB7VfGWcNwGWOe87jNHj/GrQiWL/adQ4eCXxrU9OO2TF
	vazJbnxFnByrjEoI2FBV+8P6IsYJq/Z1103QftufvtzQaXnH5r4emy0pzIB/dvJUZX4O
	UcjnwH0kshv2+CDbBd9MMS/KZYTCgMb8E4qB4n08NAbg+/oM1ZAetOp7sXYxVXz2YAWy
	TDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ch7mGFhk3nJb9qPaEyULzTm3qOP4VkJVTgkUPEP1tps=;
	b=QYQ5F30WvUdvZBc/TNqI5ry+BTX2Xd1SvC14qyToySD7Bnc7epB0mrpaK5vIUB8YAS
	5FcRQEoE5NJCXJISlTdwxIgpvWAC0SJqaLq9PB6vs4NMs6V6cna4HA19fA4mXQBOdy2U
	wh27zWPFQpnUL+yLrvhyGoBjJsOEMV52jxnkwYgFfCHi2Glr4UHbpYGFThTM5U9G9fAS
	Kc+h1A0CCKnGVB0uhCm1mZpiO88uH1FDhEyk/2OlfJnCjjdWRD+5jN0fPoJlWnjeW5/7
	/yTWxxPol+Jc2u2GGrDg7prNf7E0NTjSdplt/8nag2MgcoUBg/aU7O1jRiJ6KSwX2ayv
	m3nA==
X-Gm-Message-State: AKS2vOxLZHcPYkO4havgqPrWl91qvVSTLxBfzoO9sQTX1VOR8Sr3pMhy
	DtlyHkcJGlpeRjNFtbfZk5akto42luLm+TE=
X-Received: by 10.107.151.140 with SMTP id z134mr35646192iod.83.1498063701134; 
	Wed, 21 Jun 2017 09:48:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.40.136 with HTTP; Wed, 21 Jun 2017 09:47:39 -0700 (PDT)
In-Reply-To: <1494933979-5139-3-git-send-email-dv@pseudoterminal.org>
References: <1494933979-5139-1-git-send-email-dv@pseudoterminal.org>
	<1494933979-5139-3-git-send-email-dv@pseudoterminal.org>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 21 Jun 2017 19:47:39 +0300
Message-ID: <CAHiDW_HgN8OpfohECj5dB6ux8tdNe7ALFOpRju-oFZNFwQaJYQ@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/9] gstreamer1.0-plugins-good: upgrade to version 1.12.0
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
X-List-Received-Date: Wed, 21 Jun 2017 16:48:20 -0000
Content-Type: multipart/alternative; boundary="001a11402a52c1ea7005527b226c"

--001a11402a52c1ea7005527b226c
Content-Type: text/plain; charset="UTF-8"

I think this breaks gstreamer1.0-meta-base packagegroup because now nothing
provides gstreamer1.0-plugins-good-souphttpsrc. I've not tested this but
I'd bet money it's because of "Fix plugin filenames to match plugin names"
commit ** upstream: it probably leads to the plugin package names changing.

The name in the package group should be changed. The question is do we also
need to add special case RPROVIDES for the old names?

**
https://cgit.freedesktop.org/gstreamer/gst-plugins-good/commit/?id=ca0ed8a134f1d26083e6f89636493df89ff29cff

Cheers,
Jussi

On 16 May 2017 at 14:26, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
>
> * Removed backported v4l2object patch since it is no longer needed
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  ...Also-add-videometa-if-there-is-padding-to.patch | 35
----------------------
>  ...10.4.bb => gstreamer1.0-plugins-good_1.12.0.bb} |  5 ++--
>  2 files changed, 2 insertions(+), 38 deletions(-)
>  delete mode 100644
meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch
>  rename meta/recipes-multimedia/gstreamer/{
gstreamer1.0-plugins-good_1.10.4.bb => gstreamer1.0-plugins-good_1.12.0.bb}
(78%)
>
> diff --git
a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch
> deleted file mode 100644
> index 2a9a23e..0000000
> ---
a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 22be02612adc757f6a43cefc6ee65ecaef68f0d9 Mon Sep 17 00:00:00 2001
> -From: Carlos Rafael Giani <dv@pseudoterminal.org>
> -Date: Thu, 23 Mar 2017 22:13:05 +0100
> -Subject: [PATCH] v4l2object: Also add videometa if there is padding to
the
> - right and bottom
> -
> -https://bugzilla.gnome.org/show_bug.cgi?id=780478
> -
> -Upstream-Status: Backport [1.10.5]
> -
> -Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ----
> - sys/v4l2/gstv4l2object.c | 5 +++--
> - 1 file changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
> -index 91c8ff0..ed4654e 100644
> ---- a/sys/v4l2/gstv4l2object.c
> -+++ b/sys/v4l2/gstv4l2object.c
> -@@ -3070,9 +3070,10 @@ store_info:
> -   GST_DEBUG_OBJECT (v4l2object->element, "Got sizeimage %"
G_GSIZE_FORMAT,
> -       info->size);
> -
> --  /* to avoid copies we need video meta if top or left padding */
> -+  /* to avoid copies we need video meta if there is padding */
> -   v4l2object->need_video_meta =
> --      ((align->padding_top + align->padding_left) != 0);
> -+      ((align->padding_top + align->padding_left + align->padding_right
+
> -+          align->padding_bottom) != 0);
> -
> -   /* ... or if stride is non "standard" */
> -   if (!standard_stride)
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-multimedia/gstreamer/
gstreamer1.0-plugins-good_1.10.4.bb b/meta/recipes-multimedia/gstreamer/
gstreamer1.0-plugins-good_1.12.0.bb
> similarity index 78%
> rename from meta/recipes-multimedia/gstreamer/
gstreamer1.0-plugins-good_1.10.4.bb
> rename to meta/recipes-multimedia/gstreamer/
gstreamer1.0-plugins-good_1.12.0.bb
> index 57447bf..42dd706 100644
> --- a/meta/recipes-multimedia/gstreamer/
gstreamer1.0-plugins-good_1.10.4.bb
> +++ b/meta/recipes-multimedia/gstreamer/
gstreamer1.0-plugins-good_1.12.0.bb
> @@ -10,9 +10,8 @@ SRC_URI = " \
>      file://avoid-including-sys-poll.h-directly.patch \
>      file://ensure-valid-sentinel-for-gst_structure_get.patch \
>
 file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
> -
 file://0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch \
>  "
> -SRC_URI[md5sum] = "cc0cc13cdb07d4237600b6886b81f31d"
> -SRC_URI[sha256sum] =
"8a86c61434a8c44665365bd0b3557a040937d1f44bf69caee4e9ea816ce74d7e"
> +SRC_URI[md5sum] = "9294b22ddab3bec373cbc5e84ff4c084"
> +SRC_URI[sha256sum] =
"8a1d734db7338e00c28b794a7f0a5a9e67d1c5c8b0074075b50638207d372ebc"
>
>  S = "${WORKDIR}/gst-plugins-good-${PV}"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a11402a52c1ea7005527b226c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think this breaks gstreamer1.0-meta-base packagegroup be=
cause now nothing provides gstreamer1.0-plugins-good-souphttpsrc. I&#39;ve =
not tested this but I&#39;d bet money it&#39;s because of &quot;Fix plugin =
filenames to match plugin names&quot; commit ** upstream: it probably leads=
 to the plugin package names changing.=C2=A0<div><br></div><div>The name in=
 the package group should be changed. The question is do we also need to ad=
d special case RPROVIDES for the old names?=C2=A0<br><br>** <a href=3D"http=
s://cgit.freedesktop.org/gstreamer/gst-plugins-good/commit/?id=3Dca0ed8a134=
f1d26083e6f89636493df89ff29cff">https://cgit.freedesktop.org/gstreamer/gst-=
plugins-good/commit/?id=3Dca0ed8a134f1d26083e6f89636493df89ff29cff</a><br><=
br>Cheers,<br>Jussi<br><br>On 16 May 2017 at 14:26, Carlos Rafael Giani &lt=
;<a href=3D"mailto:dv@pseudoterminal.org">dv@pseudoterminal.org</a>&gt; wro=
te:<br>&gt;<br>&gt; * Removed backported v4l2object patch since it is no lo=
nger needed<br>&gt;<br>&gt; Signed-off-by: Carlos Rafael Giani &lt;<a href=
=3D"mailto:dv@pseudoterminal.org">dv@pseudoterminal.org</a>&gt;<br>&gt; ---=
<br>&gt; =C2=A0...Also-add-videometa-if-there-is-padding-to.patch | 35 ----=
------------------<br>&gt; =C2=A0...<a href=3D"http://10.4.bb">10.4.bb</a> =
=3D&gt; <a href=3D"http://gstreamer1.0-plugins-good_1.12.0.bb">gstreamer1.0=
-plugins-good_1.12.0.bb</a>} | =C2=A05 ++--<br>&gt; =C2=A02 files changed, =
2 insertions(+), 38 deletions(-)<br>&gt; =C2=A0delete mode 100644 meta/reci=
pes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add=
-videometa-if-there-is-padding-to.patch<br>&gt; =C2=A0rename meta/recipes-m=
ultimedia/gstreamer/{<a href=3D"http://gstreamer1.0-plugins-good_1.10.4.bb"=
>gstreamer1.0-plugins-good_1.10.4.bb</a> =3D&gt; <a href=3D"http://gstreame=
r1.0-plugins-good_1.12.0.bb">gstreamer1.0-plugins-good_1.12.0.bb</a>} (78%)=
<br>&gt;<br>&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.=
0-plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.pa=
tch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2=
object-Also-add-videometa-if-there-is-padding-to.patch<br>&gt; deleted file=
 mode 100644<br>&gt; index 2a9a23e..0000000<br>&gt; --- a/meta/recipes-mult=
imedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videome=
ta-if-there-is-padding-to.patch<br>&gt; +++ /dev/null<br>&gt; @@ -1,35 +0,0=
 @@<br>&gt; -From 22be02612adc757f6a43cefc6ee65ecaef68f0d9 Mon Sep 17 00:00=
:00 2001<br>&gt; -From: Carlos Rafael Giani &lt;<a href=3D"mailto:dv@pseudo=
terminal.org">dv@pseudoterminal.org</a>&gt;<br>&gt; -Date: Thu, 23 Mar 2017=
 22:13:05 +0100<br>&gt; -Subject: [PATCH] v4l2object: Also add videometa if=
 there is padding to the<br>&gt; - right and bottom<br>&gt; -<br>&gt; -<a h=
ref=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D780478">https://bugzill=
a.gnome.org/show_bug.cgi?id=3D780478</a><br>&gt; -<br>&gt; -Upstream-Status=
: Backport [1.10.5]<br>&gt; -<br>&gt; -Signed-off-by: Carlos Rafael Giani &=
lt;<a href=3D"mailto:dv@pseudoterminal.org">dv@pseudoterminal.org</a>&gt;<b=
r>&gt; ----<br>&gt; - sys/v4l2/gstv4l2object.c | 5 +++--<br>&gt; - 1 file c=
hanged, 3 insertions(+), 2 deletions(-)<br>&gt; -<br>&gt; -diff --git a/sys=
/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c<br>&gt; -index 91c8ff0..ed=
4654e 100644<br>&gt; ---- a/sys/v4l2/gstv4l2object.c<br>&gt; -+++ b/sys/v4l=
2/gstv4l2object.c<br>&gt; -@@ -3070,9 +3070,10 @@ store_info:<br>&gt; - =C2=
=A0 GST_DEBUG_OBJECT (v4l2object-&gt;element, &quot;Got sizeimage %&quot; G=
_GSIZE_FORMAT,<br>&gt; - =C2=A0 =C2=A0 =C2=A0 info-&gt;size);<br>&gt; -<br>=
&gt; -- =C2=A0/* to avoid copies we need video meta if top or left padding =
*/<br>&gt; -+ =C2=A0/* to avoid copies we need video meta if there is paddi=
ng */<br>&gt; - =C2=A0 v4l2object-&gt;need_video_meta =3D<br>&gt; -- =C2=A0=
 =C2=A0 =C2=A0((align-&gt;padding_top + align-&gt;padding_left) !=3D 0);<br=
>&gt; -+ =C2=A0 =C2=A0 =C2=A0((align-&gt;padding_top + align-&gt;padding_le=
ft + align-&gt;padding_right +<br>&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0align-&gt;padding_bottom) !=3D 0);<br>&gt; -<br>&gt; - =C2=A0 /* ... or =
if stride is non &quot;standard&quot; */<br>&gt; - =C2=A0 if (!standard_str=
ide)<br>&gt; ---<br>&gt; -2.7.4<br>&gt; -<br>&gt; diff --git a/meta/recipes=
-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plugins-good_1.10.4.bb=
">gstreamer1.0-plugins-good_1.10.4.bb</a> b/meta/recipes-multimedia/gstream=
er/<a href=3D"http://gstreamer1.0-plugins-good_1.12.0.bb">gstreamer1.0-plug=
ins-good_1.12.0.bb</a><br>&gt; similarity index 78%<br>&gt; rename from met=
a/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plugins-good_=
1.10.4.bb">gstreamer1.0-plugins-good_1.10.4.bb</a><br>&gt; rename to meta/r=
ecipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plugins-good_1.1=
2.0.bb">gstreamer1.0-plugins-good_1.12.0.bb</a><br>&gt; index 57447bf..42dd=
706 100644<br>&gt; --- a/meta/recipes-multimedia/gstreamer/<a href=3D"http:=
//gstreamer1.0-plugins-good_1.10.4.bb">gstreamer1.0-plugins-good_1.10.4.bb<=
/a><br>&gt; +++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstre=
amer1.0-plugins-good_1.12.0.bb">gstreamer1.0-plugins-good_1.12.0.bb</a><br>=
&gt; @@ -10,9 +10,8 @@ SRC_URI =3D &quot; \<br>&gt; =C2=A0 =C2=A0 =C2=A0fil=
e://avoid-including-sys-poll.h-directly.patch \<br>&gt; =C2=A0 =C2=A0 =C2=
=A0file://ensure-valid-sentinel-for-gst_structure_get.patch \<br>&gt; =C2=
=A0 =C2=A0 =C2=A0file://0001-introspection.m4-prefix-pkgconfig-paths-with-P=
KG_CON.patch \<br>&gt; - =C2=A0 =C2=A0file://0001-v4l2object-Also-add-video=
meta-if-there-is-padding-to.patch \<br>&gt; =C2=A0&quot;<br>&gt; -SRC_URI[m=
d5sum] =3D &quot;cc0cc13cdb07d4237600b6886b81f31d&quot;<br>&gt; -SRC_URI[sh=
a256sum] =3D &quot;8a86c61434a8c44665365bd0b3557a040937d1f44bf69caee4e9ea81=
6ce74d7e&quot;<br>&gt; +SRC_URI[md5sum] =3D &quot;9294b22ddab3bec373cbc5e84=
ff4c084&quot;<br>&gt; +SRC_URI[sha256sum] =3D &quot;8a1d734db7338e00c28b794=
a7f0a5a9e67d1c5c8b0074075b50638207d372ebc&quot;<br>&gt;<br>&gt; =C2=A0S =3D=
 &quot;${WORKDIR}/gst-plugins-good-${PV}&quot;<br>&gt; --<br>&gt; 2.7.4<br>=
&gt;<br>&gt; --<br>&gt; _______________________________________________<br>=
&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-=
core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><b=
r>&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedd=
ed-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</=
a><br></div></div>

--001a11402a52c1ea7005527b226c--
