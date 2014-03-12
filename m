Return-Path: <sebmennetrier@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1988F6D305
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 13:15:54 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id as1so10535686iec.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 06:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=lUG7ffqo5XbaKMoaC6DIHvEaY1NGxzmS/QpUHepEcbA=;
	b=utM+dwlCYGj2axbypWTXJZt/kEZXNaKNI5gjRaD24JPayZuzr58HCQlOE3byKa7ZID
	eD6yTcbGmhylzkk5tgHMCnHs1DuqK382/lJYNpw93ZIor4OuC6ycRGmrafEGRl5mOTiD
	cC1ZxDC5GTLEz2GLQkxz+h6Ra7hjeHU8MVxjLUJATI04RJAW9cUWVdFe3f1Y6eh4ciNn
	btMGh4uMIGV09pwj6Etr+VRQK6gF3YcGSCUfQpQozds5YcXTAjr05RshrDrCMPt+MUz+
	Es4AgO88dWJSx9kscvCTFG4EMROxBlYc/l7LoZ8jmJ5xa6fYoP3AB124j7UlJ30Nu34o
	99KA==
MIME-Version: 1.0
X-Received: by 10.50.62.178 with SMTP id z18mr29641784igr.49.1394630155361;
	Wed, 12 Mar 2014 06:15:55 -0700 (PDT)
Sender: sebmennetrier@gmail.com
Received: by 10.42.78.143 with HTTP; Wed, 12 Mar 2014 06:15:55 -0700 (PDT)
In-Reply-To: <1394617444-15843-1-git-send-email-s.mennetrier@innotis.org>
References: <1394617444-15843-1-git-send-email-s.mennetrier@innotis.org>
Date: Wed, 12 Mar 2014 14:15:55 +0100
X-Google-Sender-Auth: QJBt0kz8Gk-eiH-WxjWBJ5wCHoA
Message-ID: <CABgO3_O=gqY2cE96Lom_0oXKrVWd8mEe40eUwV_OBL1u7GWmcw@mail.gmail.com>
From: =?ISO-8859-1?Q?S=E9bastien_Mennetrier?= <s.mennetrier@innotis.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] Create gstreamer-1.0 package groups
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
X-List-Received-Date: Wed, 12 Mar 2014 13:15:56 -0000
Content-Type: multipart/alternative; boundary=047d7bd760c200e57c04f468a3f3

--047d7bd760c200e57c04f468a3f3
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

This patch was tested on dora branch on build and runtime.
Also, it was tested on master branch, only on build.


Regards,
S=E9bastien


2014-03-12 10:44 GMT+01:00 S=E9bastien Mennetrier <s.mennetrier@innotis.org=
>:

> This recipe is based on gst-meta-base
>
> Signed-off-by: S=E9bastien Mennetrier <s.mennetrier@innotis.org>
> ---
>  .../gstreamer/gstreamer1.0-meta-base.bb            | 62
> ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/
> gstreamer1.0-meta-base.bb
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bbb=
/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-meta-base.bb
> new file mode 100644
> index 0000000..cb8dd1a
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
> @@ -0,0 +1,62 @@
> +DESCRIPTION =3D "Gstreamer1.0 package groups"
> +LICENSE =3D "MIT"
> +
> +inherit packagegroup
> +
> +DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base
> gstreamer1.0-plugins-good gstreamer1.0-plugins-bad"
> +
> +PACKAGES =3D "\
> +    gstreamer1.0-meta-base \
> +    gstreamer1.0-meta-x11-base \
> +    gstreamer1.0-meta-audio \
> +    gstreamer1.0-meta-debug \
> +    gstreamer1.0-meta-video"
> +
> +ALLOW_EMPTY_gstreamer1.0-meta-base =3D "1"
> +ALLOW_EMPTY_gstreamer1.0-meta-x11-base =3D "1"
> +ALLOW_EMPTY_gstreamer1.0-meta-audio =3D "1"
> +ALLOW_EMPTY_gstreamer1.0-meta-debug =3D "1"
> +ALLOW_EMPTY_gstreamer1.0-meta-video =3D "1"
> +
> +RDEPENDS_gstreamer1.0-meta-base =3D "\
> +    ${@base_contains('DISTRO_FEATURES', 'x11',
> 'gstreamer1.0-meta-x11-base', '', d)} \
> +    gstreamer1.0 \
> +    gstreamer1.0-plugins-base-playback \
> +    gstreamer1.0-plugins-base-gio \
> +    gstreamer1.0-plugins-base-alsa \
> +    gstreamer1.0-plugins-base-volume \
> +    gstreamer1.0-plugins-base-audioconvert \
> +    gstreamer1.0-plugins-base-audioresample \
> +    gstreamer1.0-plugins-base-typefindfunctions \
> +    gstreamer1.0-plugins-base-videoscale \
> +    gstreamer1.0-plugins-base-videoconvert \
> +    gstreamer1.0-plugins-good-autodetect \
> +    gstreamer1.0-plugins-good-souphttpsrc"
> +
> +RRECOMMENDS_gstreamer1.0-meta-x11-base =3D "\
> +    gstreamer1.0-plugins-base-ximagesink \
> +    gstreamer1.0-plugins-base-xvimagesink"
> +
> +RDEPENDS_gstreamer1.0-meta-audio =3D "\
> +    gstreamer1.0-meta-base \
> +    gstreamer1.0-plugins-base-vorbis \
> +    gstreamer1.0-plugins-base-ogg \
> +    gstreamer1.0-plugins-good-wavparse \
> +    gstreamer1.0-plugins-good-flac \
> +    ${COMMERCIAL_AUDIO_PLUGINS}"
> +
> +RDEPENDS_gstreamer1.0-meta-debug =3D "\
> +    gstreamer1.0-meta-base \
> +    gstreamer1.0-plugins-good-debug \
> +    gstreamer1.0-plugins-base-audiotestsrc \
> +    gstreamer1.0-plugins-base-videotestsrc"
> +
> +RDEPENDS_gstreamer1.0-meta-video =3D "\
> +    gstreamer1.0-meta-base \
> +    gstreamer1.0-plugins-good-avi \
> +    gstreamer1.0-plugins-good-matroska \
> +    gstreamer1.0-plugins-base-theora \
> +    ${COMMERCIAL_VIDEO_PLUGINS}"
> +
> +RRECOMMENDS_gstreamer1.0-meta-video =3D "\
> +    gstreamer1.0-meta-audio"
> --
> 1.8.1.2
>
>

--047d7bd760c200e57c04f468a3f3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This patch was tested on dora branch on build and run=
time.<br></div>Also, it was tested on master branch, only on build.<br></di=
v><div class=3D"gmail_extra"><br clear=3D"all"><div><div dir=3D"ltr"><div><=
br>Regards,<br>
</div>S=E9bastien<br></div></div>
<br><br><div class=3D"gmail_quote">2014-03-12 10:44 GMT+01:00 S=E9bastien M=
ennetrier <span dir=3D"ltr">&lt;<a href=3D"mailto:s.mennetrier@innotis.org"=
 target=3D"_blank">s.mennetrier@innotis.org</a>&gt;</span>:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
This recipe is based on gst-meta-base<br>
<br>
Signed-off-by: S=E9bastien Mennetrier &lt;<a href=3D"mailto:s.mennetrier@in=
notis.org">s.mennetrier@innotis.org</a>&gt;<br>
---<br>
=A0.../gstreamer/<a href=3D"http://gstreamer1.0-meta-base.bb" target=3D"_bl=
ank">gstreamer1.0-meta-base.bb</a> =A0 =A0 =A0 =A0 =A0 =A0| 62 ++++++++++++=
++++++++++<br>
=A01 file changed, 62 insertions(+)<br>
=A0create mode 100644 meta/recipes-multimedia/gstreamer/<a href=3D"http://g=
streamer1.0-meta-base.bb" target=3D"_blank">gstreamer1.0-meta-base.bb</a><b=
r>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-meta-base.bb" target=3D"_blank">gstreamer1.0-meta-base.bb</a> b/meta/rec=
ipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-meta-base.bb" targ=
et=3D"_blank">gstreamer1.0-meta-base.bb</a><br>

new file mode 100644<br>
index 0000000..cb8dd1a<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-meta=
-base.bb" target=3D"_blank">gstreamer1.0-meta-base.bb</a><br>
@@ -0,0 +1,62 @@<br>
+DESCRIPTION =3D &quot;Gstreamer1.0 package groups&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+<br>
+inherit packagegroup<br>
+<br>
+DEPENDS =3D &quot;gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plug=
ins-good gstreamer1.0-plugins-bad&quot;<br>
+<br>
+PACKAGES =3D &quot;\<br>
+ =A0 =A0gstreamer1.0-meta-base \<br>
+ =A0 =A0gstreamer1.0-meta-x11-base \<br>
+ =A0 =A0gstreamer1.0-meta-audio \<br>
+ =A0 =A0gstreamer1.0-meta-debug \<br>
+ =A0 =A0gstreamer1.0-meta-video&quot;<br>
+<br>
+ALLOW_EMPTY_gstreamer1.0-meta-base =3D &quot;1&quot;<br>
+ALLOW_EMPTY_gstreamer1.0-meta-x11-base =3D &quot;1&quot;<br>
+ALLOW_EMPTY_gstreamer1.0-meta-audio =3D &quot;1&quot;<br>
+ALLOW_EMPTY_gstreamer1.0-meta-debug =3D &quot;1&quot;<br>
+ALLOW_EMPTY_gstreamer1.0-meta-video =3D &quot;1&quot;<br>
+<br>
+RDEPENDS_gstreamer1.0-meta-base =3D &quot;\<br>
+ =A0 =A0${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;gs=
treamer1.0-meta-x11-base&#39;, &#39;&#39;, d)} \<br>
+ =A0 =A0gstreamer1.0 \<br>
+ =A0 =A0gstreamer1.0-plugins-base-playback \<br>
+ =A0 =A0gstreamer1.0-plugins-base-gio \<br>
+ =A0 =A0gstreamer1.0-plugins-base-alsa \<br>
+ =A0 =A0gstreamer1.0-plugins-base-volume \<br>
+ =A0 =A0gstreamer1.0-plugins-base-audioconvert \<br>
+ =A0 =A0gstreamer1.0-plugins-base-audioresample \<br>
+ =A0 =A0gstreamer1.0-plugins-base-typefindfunctions \<br>
+ =A0 =A0gstreamer1.0-plugins-base-videoscale \<br>
+ =A0 =A0gstreamer1.0-plugins-base-videoconvert \<br>
+ =A0 =A0gstreamer1.0-plugins-good-autodetect \<br>
+ =A0 =A0gstreamer1.0-plugins-good-souphttpsrc&quot;<br>
+<br>
+RRECOMMENDS_gstreamer1.0-meta-x11-base =3D &quot;\<br>
+ =A0 =A0gstreamer1.0-plugins-base-ximagesink \<br>
+ =A0 =A0gstreamer1.0-plugins-base-xvimagesink&quot;<br>
+<br>
+RDEPENDS_gstreamer1.0-meta-audio =3D &quot;\<br>
+ =A0 =A0gstreamer1.0-meta-base \<br>
+ =A0 =A0gstreamer1.0-plugins-base-vorbis \<br>
+ =A0 =A0gstreamer1.0-plugins-base-ogg \<br>
+ =A0 =A0gstreamer1.0-plugins-good-wavparse \<br>
+ =A0 =A0gstreamer1.0-plugins-good-flac \<br>
+ =A0 =A0${COMMERCIAL_AUDIO_PLUGINS}&quot;<br>
+<br>
+RDEPENDS_gstreamer1.0-meta-debug =3D &quot;\<br>
+ =A0 =A0gstreamer1.0-meta-base \<br>
+ =A0 =A0gstreamer1.0-plugins-good-debug \<br>
+ =A0 =A0gstreamer1.0-plugins-base-audiotestsrc \<br>
+ =A0 =A0gstreamer1.0-plugins-base-videotestsrc&quot;<br>
+<br>
+RDEPENDS_gstreamer1.0-meta-video =3D &quot;\<br>
+ =A0 =A0gstreamer1.0-meta-base \<br>
+ =A0 =A0gstreamer1.0-plugins-good-avi \<br>
+ =A0 =A0gstreamer1.0-plugins-good-matroska \<br>
+ =A0 =A0gstreamer1.0-plugins-base-theora \<br>
+ =A0 =A0${COMMERCIAL_VIDEO_PLUGINS}&quot;<br>
+<br>
+RRECOMMENDS_gstreamer1.0-meta-video =3D &quot;\<br>
+ =A0 =A0gstreamer1.0-meta-audio&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.1.2<br>
<br>
</font></span></blockquote></div><br></div>

--047d7bd760c200e57c04f468a3f3--
