Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB1565C75
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 12:26:36 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id dc16so10462874qab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Feb 2015 04:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Uj7Au7OnyqQDtJStySw+rWngFtToevLzYJsudzYFD8s=;
	b=MoLIsOVDZJNqYccLQWmoVbXdyznWm4sxL0EvdXt0ebIjz3W7X/jCdkcSTK+rKPBRv6
	uBFLfRvgnnvZpdD8bDUb1H6mRqo5qgiO74qnbPAEahJmaZtfZXahS8dnnE43EortTkDz
	dbEEDhXVPW3740fhsX3v3md6OP//prqAWB2+RiK0Aw93gxbtCJvm5LY9iDxi69sWxWdo
	JrLhDUyZDGIM/WqgHgNzOaD3zvRSVN6lmU0PNbVbzANAlSOxTB78plkrWdJd0WbbwvXw
	EHKJMFf7pRpRykbyvWrCZ6u5d5goCqxI9bWrSvAdOJMq2jOu2g2lL+iJCmBr8abpP9p1
	RS+A==
X-Gm-Message-State: ALoCoQkmWMiHWdSxUHNCpzhpO+ZMWANGwGa30OBkWGtJV/q8quNw+tt8b0scFQrHGxq67L4DASiS
X-Received: by 10.229.190.65 with SMTP id dh1mr7587119qcb.28.1423225598051;
	Fri, 06 Feb 2015 04:26:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 6 Feb 2015 04:26:17 -0800 (PST)
In-Reply-To: <1423224152-10542-2-git-send-email-martri@arantia.com>
References: <1423223906-8568-1-git-send-email-martri@arantia.com>
	<1423224152-10542-2-git-send-email-martri@arantia.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Feb 2015 12:26:17 +0000
Message-ID: <CAJTo0LYgBEONq=Yg8819vwBpYhD5Q8MOBXeyY1s1oGpxOGkwRA@mail.gmail.com>
To: Marco Trillo <martri@arantia.com>
Cc: Ruben Morgade <rmorgade@arantia.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] Fix broken link in gst-fluendo.inc. Better description for gst-fluendo-mpegdemux.
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
X-List-Received-Date: Fri, 06 Feb 2015 12:26:38 -0000
Content-Type: multipart/alternative; boundary=001a11339bec351a10050e6a8858

--001a11339bec351a10050e6a8858
Content-Type: text/plain; charset=UTF-8

I don't see a patch 1/2 on the list, can you re-send that?

Cheers,
Ross

On 6 February 2015 at 12:02, Marco Trillo <martri@arantia.com> wrote:

> ---
>  .../gstreamer/gst-fluendo-mpegdemux_0.10.85.bb     |    2 +-
>  meta/recipes-multimedia/gstreamer/gst-fluendo.inc  |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/
> gst-fluendo-mpegdemux_0.10.85.bb b/meta/recipes-multimedia/gstreamer/
> gst-fluendo-mpegdemux_0.10.85.bb
> index ad06eb0..7bba41a 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.85.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.85.bb
> @@ -1,6 +1,6 @@
>  require gst-fluendo.inc
>
> -SUMMARY = "Fluendo closed-format mpeg video GStreamer plug-in"
> +SUMMARY = "Fluendo MPEG Transport Stream and Program Stream demuxer for
> GStreamer"
>  LICENSE = "MPLv1.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=be282f1c3cc9a98cc0dc5c2b25dfc510 \
>
>  file://src/gstmpegdemux.h;beginline=1;endline=19;md5=a9e90033f59897b91664d9f2a2ff01dd"
> diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
> b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
> index 3cbb465..7a77d62 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
> +++ b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
> @@ -1,6 +1,6 @@
>  SUMMARY = "Fluendo closed-format GStreamer plug-in"
>  SECTION = "multimedia"
> -HOMEPAGE = "http://www.fluendo.com/resources/source-plugins.php"
> +HOMEPAGE = "https://core.fluendo.com/gstreamer/trac/wiki"
>  DEPENDS = "gstreamer gst-plugins-base zlib"
>
>  inherit autotools pkgconfig
> --
> 1.7.9.5
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11339bec351a10050e6a8858
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t see a patch 1/2 on the list, can you re-send t=
hat?<div><br></div><div>Cheers,</div><div>Ross</div></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 6 February 2015 at 12:02, Marco=
 Trillo <span dir=3D"ltr">&lt;<a href=3D"mailto:martri@arantia.com" target=
=3D"_blank">martri@arantia.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">---<br>
=C2=A0.../gstreamer/<a href=3D"http://gst-fluendo-mpegdemux_0.10.85.bb" tar=
get=3D"_blank">gst-fluendo-mpegdemux_0.10.85.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A0 2 +-<br>
=C2=A0meta/recipes-multimedia/gstreamer/gst-fluendo.inc=C2=A0 |=C2=A0 =C2=
=A0 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gst-fluend=
o-mpegdemux_0.10.85.bb" target=3D"_blank">gst-fluendo-mpegdemux_0.10.85.bb<=
/a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gst-fluendo-mpegd=
emux_0.10.85.bb" target=3D"_blank">gst-fluendo-mpegdemux_0.10.85.bb</a><br>
index ad06eb0..7bba41a 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gst-fluendo-mpegd=
emux_0.10.85.bb" target=3D"_blank">gst-fluendo-mpegdemux_0.10.85.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gst-fluendo-mpegd=
emux_0.10.85.bb" target=3D"_blank">gst-fluendo-mpegdemux_0.10.85.bb</a><br>
@@ -1,6 +1,6 @@<br>
=C2=A0require gst-fluendo.inc<br>
<br>
-SUMMARY =3D &quot;Fluendo closed-format mpeg video GStreamer plug-in&quot;=
<br>
+SUMMARY =3D &quot;Fluendo MPEG Transport Stream and Program Stream demuxer=
 for GStreamer&quot;<br>
=C2=A0LICENSE =3D &quot;MPLv1.1&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dbe282f1c3cc9a98cc0dc5=
c2b25dfc510 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://src/gstmpegdemux.h;beginline=3D1;endline=3D19;md5=3Da9e90033f5989=
7b91664d9f2a2ff01dd&quot;<br>
diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc b/meta/recip=
es-multimedia/gstreamer/gst-fluendo.inc<br>
index 3cbb465..7a77d62 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc<br>
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc<br>
@@ -1,6 +1,6 @@<br>
=C2=A0SUMMARY =3D &quot;Fluendo closed-format GStreamer plug-in&quot;<br>
=C2=A0SECTION =3D &quot;multimedia&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://www.fluendo.com/resources/source-plug=
ins.php" target=3D"_blank">http://www.fluendo.com/resources/source-plugins.=
php</a>&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://core.fluendo.com/gstreamer/trac/wiki=
" target=3D"_blank">https://core.fluendo.com/gstreamer/trac/wiki</a>&quot;<=
br>
=C2=A0DEPENDS =3D &quot;gstreamer gst-plugins-base zlib&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--001a11339bec351a10050e6a8858--
