Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5D21D772C3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Nov 2015 08:23:48 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so111934937wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Nov 2015 00:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=de1CZRk3v3y76GGrvix9g/ZhJ47f6SCRHxZ5IN1d/ZI=;
	b=CAsETYARPJR3pus/5r2KfopkbpC2N16ljIiUZZbSoXKjANKwXa6rAR9Fg/JeNANV23
	sEF/kEcstlHE7jOXQtUA+0eQTd72bd4ESwxf51fT4wN4YFPcmV5a0F4aeMlCUYNSY62E
	n4vmivi2R1S/JzG6hKb+fYgAxdH0EgveHD8n/uZVewC9lDZCALWC487WNIa2Wk8oThzK
	QJBHk0ITQ5VeFTxcbAYYSlVkVMAc2u5kdrLCe1vFkwQ3MVaJWUZumqPNpvbtQiiSevln
	8d8d2lDyEyxdgz8B3544XcGkkVpNfR353924AYYUmtYO4D+eOhnwlKo0MuGQCXDGLDj4
	RYAQ==
MIME-Version: 1.0
X-Received: by 10.28.132.9 with SMTP id g9mr8897773wmd.0.1447489428993; Sat,
	14 Nov 2015 00:23:48 -0800 (PST)
Received: by 10.194.154.232 with HTTP; Sat, 14 Nov 2015 00:23:48 -0800 (PST)
In-Reply-To: <1447482114-165655-1-git-send-email-wenzong.fan@windriver.com>
References: <1447482114-165655-1-git-send-email-wenzong.fan@windriver.com>
Date: Sat, 14 Nov 2015 09:23:48 +0100
Message-ID: <CA+chaQdbNP38CKVzf_O8y4o4MExSpddf5eB_EavXOB36J_p_tQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Wenzong Fan <wenzong.fan@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: disable uvch264 for systemd
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
X-List-Received-Date: Sat, 14 Nov 2015 08:23:50 -0000
Content-Type: multipart/alternative; boundary=001a114423863b3dd705247be56f

--001a114423863b3dd705247be56f
Content-Type: text/plain; charset=UTF-8

NAK, see
http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112685.html

On Sat, Nov 14, 2015 at 7:21 AM, <wenzong.fan@windriver.com> wrote:

> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Disable uvch264 to remove the dependency to libgudev which has been
> removed from systemd project.
>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> index cdedb60..863925d 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> @@ -20,7 +20,8 @@ PACKAGECONFIG ??= " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}
> \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}
> \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '',
> d)} \
> -    orc curl uvch264 neon sndfile \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'uvch264', d)}
> \
> +    orc curl neon sndfile \
>      hls sbc dash bz2 smoothstreaming \
>      "
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114423863b3dd705247be56f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">NAK, see<div><a href=3D"http://lists.openembedded.org/pipe=
rmail/openembedded-core/2015-November/112685.html">http://lists.openembedde=
d.org/pipermail/openembedded-core/2015-November/112685.html</a><br></div></=
div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sat, Nov 1=
4, 2015 at 7:21 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:wenzong.fan@wi=
ndriver.com" target=3D"_blank">wenzong.fan@windriver.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">From: Wenzong Fan &lt;<a href=3D"mail=
to:wenzong.fan@windriver.com">wenzong.fan@windriver.com</a>&gt;<br>
<br>
Disable uvch264 to remove the dependency to libgudev which has been<br>
removed from systemd project.<br>
<br>
Signed-off-by: Wenzong Fan &lt;<a href=3D"mailto:wenzong.fan@windriver.com"=
>wenzong.fan@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 3 ++=
-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc=
 b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc<br>
index cdedb60..863925d 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc<br>
@@ -20,7 +20,8 @@ PACKAGECONFIG ??=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;wa=
yland&#39;, &#39;wayland&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bl=
uetooth&#39;, &#39;bluez&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;di=
rectfb&#39;, &#39;directfb&#39;, &#39;&#39;, d)} \<br>
-=C2=A0 =C2=A0 orc curl uvch264 neon sndfile \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;systemd=
&#39;, &#39;&#39;, &#39;uvch264&#39;, d)} \<br>
+=C2=A0 =C2=A0 orc curl neon sndfile \<br>
=C2=A0 =C2=A0 =C2=A0hls sbc dash bz2 smoothstreaming \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.9.1<br>
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

--001a114423863b3dd705247be56f--
