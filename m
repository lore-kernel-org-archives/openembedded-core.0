Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA4E60796
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 22:59:43 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id n186so69468895wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 14:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DWtLlel5DqdpxuyVDPneDr3414WxIte2c4gW1Cuqxu8=;
	b=RiNbwknNs/TMhmQ1AM8gLyTWt3vzpIQJYmFEItaF8R+OvNM2n1mkrrty+6UDl4MNpw
	FXvgJm/lhl6bGy5ureiNMnNBf4vyifieJo6zjQVqHaFhxuLjN41NaMy0XAixGx+Rupi8
	eYQM6LGeEeiY92YMN3jFi42xH6cMMRc6uXyU/XpmiXFmSs/2HM9Pc0wcqyxbfejppBMu
	UcjlieVVTMeYl47sniWHbrWUflFHe+IzNI2Sh5wCmZNFGgvvYORuhY7kv71whwNDfB+t
	ZOppKFphaQ/wlV5vCo5gR/VKESPPLT08lZ1S3a+8TB83JU4gHzaOgZzAZRISc6NuX12Q
	RVOQ==
MIME-Version: 1.0
X-Received: by 10.28.183.215 with SMTP id h206mr823132wmf.0.1450133984549;
	Mon, 14 Dec 2015 14:59:44 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Mon, 14 Dec 2015 14:59:44 -0800 (PST)
In-Reply-To: <1450132464-14675-1-git-send-email-ross.burton@intel.com>
References: <1450132464-14675-1-git-send-email-ross.burton@intel.com>
Date: Mon, 14 Dec 2015 23:59:44 +0100
Message-ID: <CA+chaQdQuUXMF2jtNMb3b1P=CoXyenTDcOFM=CjFzA5AS71Uxw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] clutter-gst-3.0: add missing gudev build dependency
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
X-List-Received-Date: Mon, 14 Dec 2015 22:59:44 -0000
Content-Type: multipart/alternative; boundary=001a1148d9e406a2de0526e3a194

--001a1148d9e406a2de0526e3a194
Content-Type: text/plain; charset=UTF-8

It's libgudev not just gudev, see:

http://git.openembedded.org/openembedded-core-contrib/commit/?h=jansa/master&id=b4183af99a9ebd2c394c6eceb528ea97821b915a

On Mon, Dec 14, 2015 at 11:34 PM, Ross Burton <ross.burton@intel.com> wrote:

> This is an auto-detected build dependency but upstream doesn't have an
> option to
> toggle it.  As GStreamer builds with gudev enabled, simply enable it here.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/clutter/clutter-gst-3.0.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
> b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
> index 5aeeac6..6a189f2 100644
> --- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
> +++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
> @@ -8,7 +8,7 @@ REQUIRED_DISTRO_FEATURES ?= "opengl"
>
>  SRC_URI +=
> "file://0001-Install-example-binary-needed-for-core-image-clutter.patch"
>
> -DEPENDS = "gstreamer1.0-plugins-base gstreamer1.0-plugins-bad clutter-1.0"
> +DEPENDS = "gstreamer1.0-plugins-base gstreamer1.0-plugins-bad clutter-1.0
> gudev"
>  RDEPENDS_${PN} += "gstreamer1.0-meta-base"
>  PACKAGES  =+ "${PN}-examples"
>
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1148d9e406a2de0526e3a194
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It&#39;s libgudev not just gudev, see:<div><br></div><div>=
<a href=3D"http://git.openembedded.org/openembedded-core-contrib/commit/?h=
=3Djansa/master&amp;id=3Db4183af99a9ebd2c394c6eceb528ea97821b915a">http://g=
it.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/master&amp;=
id=3Db4183af99a9ebd2c394c6eceb528ea97821b915a</a><br></div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Dec 14, 2015 at 11:=
34 PM, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@inte=
l.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">This is an auto-detected build dependency but u=
pstream doesn&#39;t have an option to<br>
toggle it.=C2=A0 As GStreamer builds with gudev enabled, simply enable it h=
ere.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/clutter/clutter-gst-3.0.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/recip=
es-graphics/clutter/clutter-gst-3.0.inc<br>
index 5aeeac6..6a189f2 100644<br>
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc<br>
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc<br>
@@ -8,7 +8,7 @@ REQUIRED_DISTRO_FEATURES ?=3D &quot;opengl&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://0001-Install-example-binary-needed-for-core=
-image-clutter.patch&quot;<br>
<br>
-DEPENDS =3D &quot;gstreamer1.0-plugins-base gstreamer1.0-plugins-bad clutt=
er-1.0&quot;<br>
+DEPENDS =3D &quot;gstreamer1.0-plugins-base gstreamer1.0-plugins-bad clutt=
er-1.0 gudev&quot;<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;gstreamer1.0-meta-base&quot;<br>
=C2=A0PACKAGES=C2=A0 =3D+ &quot;${PN}-examples&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a1148d9e406a2de0526e3a194--
