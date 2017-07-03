Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4801460778
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 06:33:38 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id h134so51742411iof.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Jul 2017 23:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k4mFrUW2z68sy4Z1dVHlGnaaTdrwrfxvBQOM+9uNwS4=;
	b=r0WDbXH+Z1q2g4dKbiVTQ2VYyfpMXzaG642fYPmT/86ATwOQTcoE/qlCzenVHGmfm4
	thh7zkhWbqVT0jYZwx3HOgoRlF/lyTv5TS5q/d1FdCax5Whqfg6Inux3woRXt4DlL0DJ
	OaBEE5BMC4/sqwcPT8otyxNJLtgA6nBI3pVzkNF8ziUOoPIujNyUE6afQoesyPSlHxLj
	O+nwGFqsq71zf+vXI71ihMbcEeL6qV4tMlLvv5/SsQhRSw0k6AmMU26vLP05tlG9LIiX
	iF3JGsWtCv94Lyi95fxFkDOzEcLeUo8UhCgPsEK+DShq+2JeXYi/tG90/zqrXy2hXc8c
	DMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k4mFrUW2z68sy4Z1dVHlGnaaTdrwrfxvBQOM+9uNwS4=;
	b=aTZZBrXgY1/0bAsGbN7DeMVgkWUKgSlnyTXvz9iqj6IFEaqj/46l/EH5KZv7YuLHbr
	b1ey+ajHPGtmALSxd5csYjWWe/pkyNOHa3E+Ql3+0XpqRqmkpNCVJi5QhXG/JDCSCNia
	Gg/GoCJn5qHbZ93A3t9Qi4I0O+dOqB0mIeZNPq/bXUtFz/l4MYSAP9f4bjLzaW+6n5zz
	p7U4DO6bA1ORTI2Zn/05IVMiaW3WdFT1JtXlmYqR976Zmu9w6CWXO252NngK9dFOlwnX
	DlNLlCRTw72+G1lbAF3htKOhxbGNcput3NJGFFpyX3osLx2QL2mWWAiHBh6wqhVwGL6I
	bPLw==
X-Gm-Message-State: AIVw113hNTgwvcgEKtOTNxxCmAwCz1KmWw+PO8IrZ5sQAeEmmV5umglI
	2weOJu8UKcn/aLSZu0GVrqm0YVPQ/nMh
X-Received: by 10.107.151.140 with SMTP id z134mr7565692iod.83.1499063620087; 
	Sun, 02 Jul 2017 23:33:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.44.87 with HTTP; Sun, 2 Jul 2017 23:33:09 -0700 (PDT)
In-Reply-To: <1498834581-12279-6-git-send-email-maxin.john@intel.com>
References: <1498834581-12279-1-git-send-email-maxin.john@intel.com>
	<1498834581-12279-6-git-send-email-maxin.john@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 3 Jul 2017 09:33:09 +0300
Message-ID: <CAHiDW_FoefUdvKCuOzdsy-xBDFBwaTBvnOzOeXEbZYPnigUQ6w@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/11] gstreamer1.0-plugins-good: upgrade 1.10.4 -> 1.12.1
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
X-List-Received-Date: Mon, 03 Jul 2017 06:33:39 -0000
Content-Type: multipart/alternative; boundary="001a11402a52924b88055363f2d7"

--001a11402a52924b88055363f2d7
Content-Type: text/plain; charset="UTF-8"

I'm guessing 12.1 has the same issue with renamed plugins that I reported
on the previous patchset?

See
https://cgit.freedesktop.org/gstreamer/gst-plugins-good/commit/?id=ca0ed8a134f1d26083e6f89636493df89ff29cff
: this changes packages names so we need to add special case RPROVIDES for
these three (and probably should also change gstreamer1.0-meta-base to use
the real name).

  - Jussi


On 30 June 2017 at 17:56, Maxin B. John <maxin.john@intel.com> wrote:

> Remove backported patch:
>         1.0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  ...Also-add-videometa-if-there-is-padding-to.patch | 35
> ----------------------
>  ...10.4.bb => gstreamer1.0-plugins-good_1.12.1.bb} |  5 ++--
>  2 files changed, 2 insertions(+), 38 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-good/0001-v4l2object-Also-add-videometa-if-there-
> is-padding-to.patch
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-
> plugins-good_1.10.4.bb => gstreamer1.0-plugins-good_1.12.1.bb} (78%)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-good/0001-v4l2object-Also-add-videometa-if-there-
> is-padding-to.patch
> deleted file mode 100644
> index 2a9a23e..0000000
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-good/0001-v4l2object-Also-add-videometa-if-there-
> is-padding-to.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 22be02612adc757f6a43cefc6ee65ecaef68f0d9 Mon Sep 17 00:00:00 2001
> -From: Carlos Rafael Giani <dv@pseudoterminal.org>
> -Date: Thu, 23 Mar 2017 22:13:05 +0100
> -Subject: [PATCH] v4l2object: Also add videometa if there is padding to the
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
> G_GSIZE_FORMAT,
> -       info->size);
> -
> --  /* to avoid copies we need video meta if top or left padding */
> -+  /* to avoid copies we need video meta if there is padding */
> -   v4l2object->need_video_meta =
> --      ((align->padding_top + align->padding_left) != 0);
> -+      ((align->padding_top + align->padding_left + align->padding_right +
> -+          align->padding_bottom) != 0);
> -
> -   /* ... or if stride is non "standard" */
> -   if (!standard_stride)
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-good_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-good_1.12.1.bb
> similarity index 78%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-good_1.10.4.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-good_1.12.1.bb
> index 57447bf..8665d7b 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-good_1.10.4.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-good_1.12.1.bb
> @@ -10,9 +10,8 @@ SRC_URI = " \
>      file://avoid-including-sys-poll.h-directly.patch \
>      file://ensure-valid-sentinel-for-gst_structure_get.patch \
>      file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
> \
> -    file://0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch
> \
>  "
> -SRC_URI[md5sum] = "cc0cc13cdb07d4237600b6886b81f31d"
> -SRC_URI[sha256sum] = "8a86c61434a8c44665365bd0b3557a
> 040937d1f44bf69caee4e9ea816ce74d7e"
> +SRC_URI[md5sum] = "53647e9fe9446f2ad808d55fcdf85b6e"
> +SRC_URI[sha256sum] = "121e8e46a7f0e622f09ec9be012607
> b89d737dd72d48b0f2f0680821ae2cf54b"
>
>  S = "${WORKDIR}/gst-plugins-good-${PV}"
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11402a52924b88055363f2d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div>I&#39;m guessing 12.1 has the same issue wi=
th renamed plugins that I reported on the previous patchset?=C2=A0<div><br>=
</div><div>See <a href=3D"https://cgit.freedesktop.org/gstreamer/gst-plugin=
s-good/commit/?id=3Dca0ed8a134f1d26083e6f89636493df89ff29cff">https://cgit.=
freedesktop.org/gstreamer/gst-plugins-good/commit/?id=3Dca0ed8a134f1d26083e=
6f89636493df89ff29cff</a> : this changes packages names so we need to add s=
pecial case RPROVIDES for these three (and probably should also change=C2=
=A0<span style=3D"font-size:12.8px">gstreamer1.0-meta-base to use the real =
name</span>).</div><div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">=C2=A0 - Jussi</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 30 June 2017 at 17:=
56, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"mailto:maxin.john@intel.=
com" target=3D"_blank">maxin.john@intel.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Remove backported patch:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1.0001-v4l2object-Also-add-<wbr>videometa-if-th=
ere-is-padding-<wbr>to.patch<br>
<br>
Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">ma=
xin.john@intel.com</a>&gt;<br>
---<br>
=C2=A0...Also-add-videometa-if-<wbr>there-is-padding-to.patch | 35 --------=
--------------<br>
=C2=A0...<a href=3D"http://10.4.bb" rel=3D"noreferrer" target=3D"_blank">10=
.4.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-plugins-good_1.12.1.bb" re=
l=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-good_1.<wbr>12.1.bb=
</a>} |=C2=A0 5 ++--<br>
=C2=A02 files changed, 2 insertions(+), 38 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.=
0-<wbr>plugins-good/0001-v4l2object-<wbr>Also-add-videometa-if-there-<wbr>i=
s-padding-to.patch<br>
=C2=A0rename meta/recipes-multimedia/<wbr>gstreamer/{<a href=3D"http://gstr=
eamer1.0-plugins-good_1.10.4.bb" rel=3D"noreferrer" target=3D"_blank">gstre=
amer1.0-<wbr>plugins-good_1.10.4.bb</a> =3D&gt; <a href=3D"http://gstreamer=
1.0-plugins-good_1.12.1.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1=
.0-plugins-good_1.<wbr>12.1.bb</a>} (78%)<br>
<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugi=
ns-good/0001-v4l2object-<wbr>Also-add-videometa-if-there-<wbr>is-padding-to=
.patch b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-g=
ood/0001-v4l2object-<wbr>Also-add-videometa-if-there-<wbr>is-padding-to.pat=
ch<br>
deleted file mode 100644<br>
index 2a9a23e..0000000<br>
--- a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-good=
/0001-v4l2object-<wbr>Also-add-videometa-if-there-<wbr>is-padding-to.patch<=
br>
+++ /dev/null<br>
@@ -1,35 +0,0 @@<br>
-From 22be02612adc757f6a43cefc6ee65e<wbr>caef68f0d9 Mon Sep 17 00:00:00 200=
1<br>
-From: Carlos Rafael Giani &lt;<a href=3D"mailto:dv@pseudoterminal.org">dv@=
pseudoterminal.org</a>&gt;<br>
-Date: Thu, 23 Mar 2017 22:13:05 +0100<br>
-Subject: [PATCH] v4l2object: Also add videometa if there is padding to the=
<br>
- right and bottom<br>
-<br>
-<a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D780478" rel=3D"nor=
eferrer" target=3D"_blank">https://bugzilla.gnome.org/<wbr>show_bug.cgi?id=
=3D780478</a><br>
-<br>
-Upstream-Status: Backport [1.10.5]<br>
-<br>
-Signed-off-by: Carlos Rafael Giani &lt;<a href=3D"mailto:dv@pseudoterminal=
.org">dv@pseudoterminal.org</a>&gt;<br>
----<br>
- sys/v4l2/gstv4l2object.c | 5 +++--<br>
- 1 file changed, 3 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c<br>
-index 91c8ff0..ed4654e 100644<br>
---- a/sys/v4l2/gstv4l2object.c<br>
-+++ b/sys/v4l2/gstv4l2object.c<br>
-@@ -3070,9 +3070,10 @@ store_info:<br>
-=C2=A0 =C2=A0GST_DEBUG_OBJECT (v4l2object-&gt;element, &quot;Got sizeimage=
 %&quot; G_GSIZE_FORMAT,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;size);<br>
-<br>
--=C2=A0 /* to avoid copies we need video meta if top or left padding */<br=
>
-+=C2=A0 /* to avoid copies we need video meta if there is padding */<br>
-=C2=A0 =C2=A0v4l2object-&gt;need_video_meta =3D<br>
--=C2=A0 =C2=A0 =C2=A0 ((align-&gt;padding_top + align-&gt;padding_left) !=
=3D 0);<br>
-+=C2=A0 =C2=A0 =C2=A0 ((align-&gt;padding_top + align-&gt;padding_left + a=
lign-&gt;padding_right +<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 align-&gt;padding_bottom) !=3D 0);<br>
-<br>
-=C2=A0 =C2=A0/* ... or if stride is non &quot;standard&quot; */<br>
-=C2=A0 =C2=A0if (!standard_stride)<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstre=
amer1.0-plugins-good_1.10.4.bb" rel=3D"noreferrer" target=3D"_blank">gstrea=
mer1.0-<wbr>plugins-good_1.10.4.bb</a> b/meta/recipes-multimedia/<wbr>gstre=
amer/<a href=3D"http://gstreamer1.0-plugins-good_1.12.1.bb" rel=3D"noreferr=
er" target=3D"_blank">gstreamer1.0-<wbr>plugins-good_1.12.1.bb</a><br>
similarity index 78%<br>
rename from meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstrea=
mer1.0-plugins-good_1.10.4.bb" rel=3D"noreferrer" target=3D"_blank">gstream=
er1.0-<wbr>plugins-good_1.10.4.bb</a><br>
rename to meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstreame=
r1.0-plugins-good_1.12.1.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer=
1.0-<wbr>plugins-good_1.12.1.bb</a><br>
index 57447bf..8665d7b 100644<br>
--- a/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstreamer1.0=
-plugins-good_1.10.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-=
<wbr>plugins-good_1.10.4.bb</a><br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstreamer1.0=
-plugins-good_1.12.1.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-=
<wbr>plugins-good_1.12.1.bb</a><br>
@@ -10,9 +10,8 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://avoid-including-sys-<wbr>poll.h-directly.patch \=
<br>
=C2=A0 =C2=A0 =C2=A0file://ensure-valid-sentinel-<wbr>for-gst_structure_get=
.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-introspection.m4-<wbr>prefix-pkgconfig-path=
s-with-<wbr>PKG_CON.patch \<br>
-=C2=A0 =C2=A0 file://0001-v4l2object-Also-<wbr>add-videometa-if-there-is-<=
wbr>padding-to.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;<wbr>cc0cc13cdb07d4237600b6886b81f3<wbr>1d&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>8a86c61434a8c44665365bd0b3557a<wbr>04093=
7d1f44bf69caee4e9ea816ce7<wbr>4d7e&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>53647e9fe9446f2ad808d55fcdf85b<wbr>6e&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>121e8e46a7f0e622f09ec9be012607<wbr>b89d7=
37dd72d48b0f2f0680821ae2c<wbr>f54b&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/gst-plugins-good-$<wbr>{PV}&quot;<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.4.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div></div>

--001a11402a52924b88055363f2d7--
