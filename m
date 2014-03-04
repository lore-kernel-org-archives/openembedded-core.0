Return-Path: <sebmennetrier@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5B3F36F009
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 08:19:04 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id t19so1953357igi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Mar 2014 00:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=uV+sQTcS8A0gG94E5kyMgBASwRCkUr2KOT+0bjM+JCQ=;
	b=EZwUiudOUX5vvBPGAhj4muOG5hRFrA5QYba3PkrHqAc5Eqw4r4HIKg6ZhaVJrpjs4o
	Ec6rEg+H/HTbGRJdfT4r/SFdp97GgPviPpABH/OsmbHNplKmM2Wxdi9wJqIY8xxLCpX6
	OCkJqDpQlynSW2NjF1EA3wgQ7pfbCO4gpjv2L/lNi1mXzuGQvQQ5SdBGFhzpRTZwqDeh
	rKxebxxkH+ILuIKWhHqcm1yr8TyfPb1qlZFyyyjYqaPj0n3IRdbIk7QECEfl5SvIP04o
	MngzRssWi8eQHuLOldIaXZiGba8DCGTEHJeTxeMT1ERPoZ1WCe9iXVP8ey4WHmvRbyjb
	AEIw==
MIME-Version: 1.0
X-Received: by 10.42.232.206 with SMTP id jv14mr30140545icb.52.1393921145518; 
	Tue, 04 Mar 2014 00:19:05 -0800 (PST)
Sender: sebmennetrier@gmail.com
Received: by 10.42.198.139 with HTTP; Tue, 4 Mar 2014 00:19:05 -0800 (PST)
In-Reply-To: <1393509239-26637-1-git-send-email-s.mennetrier@innotis.org>
References: <1393509239-26637-1-git-send-email-s.mennetrier@innotis.org>
Date: Tue, 4 Mar 2014 09:19:05 +0100
X-Google-Sender-Auth: mod-UtgsZmDrFbW6c1y_raNec4Q
Message-ID: <CABgO3_O069SpHEeF0ALPuimB6Yag8W72tjAuLLsqaQT-7XgNWA@mail.gmail.com>
From: Sebastien MENNETRIER <s.mennetrier@innotis.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Create gstreamer-1.0 package groups
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
X-List-Received-Date: Tue, 04 Mar 2014 08:19:06 -0000
Content-Type: multipart/alternative; boundary=047d7b86eae6b93ff704f3c38e39

--047d7b86eae6b93ff704f3c38e39
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ping


2014-02-27 14:53 GMT+01:00 S=E9bastien Mennetrier <s.mennetrier@innotis.org=
>:

> This recipe is based on gst-meta-base
>
> Signed-off-by: S=E9bastien Mennetrier <s.mennetrier@innotis.org>
> ---
>  .../gstreamer/gstreamer1.0-meta-base.bb            | 63
> ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/
> gstreamer1.0-meta-base.bb
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bbb=
/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-meta-base.bb
> new file mode 100644
> index 0000000..3b797f0
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
> @@ -0,0 +1,63 @@
> +DESCRIPTION =3D "Gstreamer1.0 package groups"
> +LICENSE =3D "MIT"
> +DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base
> gstreamer1.0-plugins-good gstreamer1.0-plugins-bad"
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58 \
> +
>  file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de204=
20"
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
> +
> +RDEPENDS_gstreamer1.0-meta-debug =3D "\
> +    gstreamer1.0-meta-base \
> +    gstreamer1.0-plugins-good-debug \
> +    gstreamer1.0-plugins-base-audiotestsrc \
> +    gstreamer1.0-plugins-base-videotestsrc"
> +
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


--=20

Regards,
S=E9bastien

--047d7b86eae6b93ff704f3c38e39
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping<br></div><div class=3D"gmail_extra"><br><br><div clas=
s=3D"gmail_quote">2014-02-27 14:53 GMT+01:00 S=E9bastien Mennetrier <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:s.mennetrier@innotis.org" target=3D"_blank=
">s.mennetrier@innotis.org</a>&gt;</span>:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">This recipe is based on gst-meta-base<br>
<br>
Signed-off-by: S=E9bastien Mennetrier &lt;<a href=3D"mailto:s.mennetrier@in=
notis.org">s.mennetrier@innotis.org</a>&gt;<br>
---<br>
=A0.../gstreamer/<a href=3D"http://gstreamer1.0-meta-base.bb" target=3D"_bl=
ank">gstreamer1.0-meta-base.bb</a> =A0 =A0 =A0 =A0 =A0 =A0| 63 ++++++++++++=
++++++++++<br>
=A01 file changed, 63 insertions(+)<br>
=A0create mode 100644 meta/recipes-multimedia/gstreamer/<a href=3D"http://g=
streamer1.0-meta-base.bb" target=3D"_blank">gstreamer1.0-meta-base.bb</a><b=
r>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-meta-base.bb" target=3D"_blank">gstreamer1.0-meta-base.bb</a> b/meta/rec=
ipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-meta-base.bb" targ=
et=3D"_blank">gstreamer1.0-meta-base.bb</a><br>

new file mode 100644<br>
index 0000000..3b797f0<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-meta=
-base.bb" target=3D"_blank">gstreamer1.0-meta-base.bb</a><br>
@@ -0,0 +1,63 @@<br>
+DESCRIPTION =3D &quot;Gstreamer1.0 package groups&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+DEPENDS =3D &quot;gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plug=
ins-good gstreamer1.0-plugins-bad&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/LICENSE;md5=3D3f40d799439710=
9285ec7b81fdeb3b58 \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://${COREBASE}/meta/COPYING.MI=
T;md5=3D3da9cfbcb788c80a0384361b4de20420&quot;<br>
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
+<br>
+RDEPENDS_gstreamer1.0-meta-debug =3D &quot;\<br>
+ =A0 =A0gstreamer1.0-meta-base \<br>
+ =A0 =A0gstreamer1.0-plugins-good-debug \<br>
+ =A0 =A0gstreamer1.0-plugins-base-audiotestsrc \<br>
+ =A0 =A0gstreamer1.0-plugins-base-videotestsrc&quot;<br>
+<br>
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
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div dir=
=3D"ltr"><div><br>Regards,<br></div>S=E9bastien<br></div>
</div>

--047d7b86eae6b93ff704f3c38e39--
