Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 567C27536F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 21:58:33 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id v60-v6so3395368wrc.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 14:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jTJIa6/5U254imBax5c2Oapmsa0OdCW9Tfs2CyCCAwU=;
	b=YkpyThRg4EV5vzEI//UUGTQ7DrINMSJHw0/g7ejgYVYNzCfdUnTkVg5M9fo2aVyZ0H
	Tjgz3frzR+9YsdUUyfKryzR0Jwq16mw2cCfFCIXcyMtRtN0YOdmrr+hC8SCh268GaBdI
	yfbSXbrpuQZ3dZtKCcBDzJ9n8Qba2aMEutI7qn+Q6RpOYS1o39EjmmewMONimVGW9e2h
	qXtRoVbTTZ+GhMGuUgil9Rb6dtCAJ9lPSsYAZHfUywxM3CyN0mZ4CUcAZ027cVsHyIlD
	xDKLaFAMj8r3/O2aPnc+88h+jU+p1QiNjqYUC/GsmJXLWVnhe6ovPsLTOGHQpd5NWADS
	xpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jTJIa6/5U254imBax5c2Oapmsa0OdCW9Tfs2CyCCAwU=;
	b=OVFJ3Pl/lFVKMga3Kd63ktW/8R5enaEn1+E3K2R1bQ2GP8qMbEBI8HdpGObXnXS2gd
	qAc+ua1xPgcCAzezKhq0KGjbpm5q0A4lQ8tV4QettmF1gsFEqu2H1zeZ0WFRz860DGQV
	OTt2MWqKZAP1crx9PyvLhk2ZdpqJvSMa0e9UzuprJRkpMXqo9ChXc48pa/QUM0VAD9sM
	tEc7Mwe7eQDADxS9E2rxv57EnfAuTVGAl1iYo8Xj8TuLq1wyHdNLSlV+n7NMkUyaO/Q9
	PGCh202MjtclIqvjV+w9Sbea69QiPHZDn22ny77O37XiZzX3E1CS6H9f1+Tx3rivKSi6
	Z/3Q==
X-Gm-Message-State: ALKqPweppG1Ao/k46P6tCbKzhbGl00+GmJ24JV6OyhPx58KjikhnueX2
	mm4YwjYiP1MSeXsv3JjZSjydvT9cKZeJ/rsCCbk=
X-Google-Smtp-Source: AB8JxZqxipQHPHD/E5hdrO7KWITgoBh58Upejo9LOLwY6GF7PEXmYopsszJ7+d/G6mALMS8Byl4H/7c8N0CP82DEZ/M=
X-Received: by 2002:adf:bd03:: with SMTP id
	j3-v6mr2762104wrh.138.1525989514547; 
	Thu, 10 May 2018 14:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20180510213058.68614-1-alistair.francis@wdc.com>
In-Reply-To: <20180510213058.68614-1-alistair.francis@wdc.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 10 May 2018 21:58:23 +0000
Message-ID: <CA+chaQfgi+-PSYRRnCb2PtpH5UAHa2ztcQ3MaN0_wTc_=GMCmw@mail.gmail.com>
To: alistair.francis@wdc.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-graphics/libsdl2: Add native and nativesdk support
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
X-List-Received-Date: Thu, 10 May 2018 21:58:34 -0000
Content-Type: multipart/alternative; boundary="000000000000f2155c056be11efd"

--000000000000f2155c056be11efd
Content-Type: text/plain; charset="UTF-8"

See http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/qemu
 + http://git.openembedded.org/meta-openembedded-contrib/log/?h=jansa/spice
for more qemu related changes.

More info:
http://lists.openembedded.org/pipermail/openembedded-core/2017-September/142349.html

and that's basically where I'm still stuck (and why haven't sent most of
these patches yet), because it works fine "natively" but when the
qemu-native is running inside of chroot or docker, I didn't get the
acceleration working (from virt-viewer running "natively" - outside
chroot/docker).

I plan to separate libsdl2 changes from this and send them with updated
qemu upgrade as discussed with Ross.

On Thu, May 10, 2018 at 11:31 PM Alistair Francis <alistair.francis@wdc.com>
wrote:

> Allow building libsdl2 for native and nativesdk. This is required to use
> libsdl2 in QEMU.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
> index c0cf70d7fd..36508ec349 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
> @@ -42,6 +42,11 @@ PACKAGECONFIG ??= " \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11',
> d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2',
> '', d)} \
>  "
> +PACKAGECONFIG_class-native = "${PACKAGECONFIG_GL} x11"
> +PACKAGECONFIG_class-nativesdk = "${PACKAGECONFIG_GL} \
> +                                 ${@bb.utils.filter('DISTRO_FEATURES',
> 'x11', d)} \
> +"
> +
>  PACKAGECONFIG[alsa]       = "--enable-alsa
> --disable-alsatest,--disable-alsa,alsa-lib,"
>  PACKAGECONFIG[directfb]   =
> "--enable-video-directfb,--disable-video-directfb,directfb"
>  PACKAGECONFIG[gles2]      =
> "--enable-video-opengles,--disable-video-opengles,virtual/libgles2"
> @@ -63,3 +68,5 @@ do_configure_prepend() {
>  }
>
>  FILES_${PN}-dev += "${libdir}/cmake"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.0
>
>

--000000000000f2155c056be11efd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">See=C2=A0<a href=3D"http://git.openembedded.org/openembedd=
ed-core-contrib/log/?h=3Djansa/qemu">http://git.openembedded.org/openembedd=
ed-core-contrib/log/?h=3Djansa/qemu</a>=C2=A0+=C2=A0<a href=3D"http://git.o=
penembedded.org/meta-openembedded-contrib/log/?h=3Djansa/spice">http://git.=
openembedded.org/meta-openembedded-contrib/log/?h=3Djansa/spice</a> for mor=
e qemu related changes.<div><br></div><div>More info:</div><div><a href=3D"=
http://lists.openembedded.org/pipermail/openembedded-core/2017-September/14=
2349.html">http://lists.openembedded.org/pipermail/openembedded-core/2017-S=
eptember/142349.html</a><br></div><div><br></div><div>and that&#39;s basica=
lly where I&#39;m still stuck (and why haven&#39;t sent most of these patch=
es yet), because it works fine &quot;natively&quot; but when the qemu-nativ=
e is running inside of chroot or docker, I didn&#39;t get the acceleration =
working (from virt-viewer running &quot;natively&quot; - outside chroot/doc=
ker).</div><div><br></div><div>I plan to separate libsdl2 changes from this=
 and send them with updated qemu upgrade as discussed with Ross.</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, May 10, 2018 at 11=
:31 PM Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com">ali=
stair.francis@wdc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">Allow building libsdl2 for native and nativesdk. This is required to use<=
br>
libsdl2 in QEMU.<br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.8.bb" rel=
=3D"noreferrer" target=3D"_blank">libsdl2_2.0.8.bb</a> | 7 +++++++<br>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.8.=
bb" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.8.bb</a> b/meta/recipe=
s-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.8.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libsdl2_2.0.8.bb</a><br>
index c0cf70d7fd..36508ec349 100644<br>
--- a/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.8.bb" rel=
=3D"noreferrer" target=3D"_blank">libsdl2_2.0.8.bb</a><br>
+++ b/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.8.bb" rel=
=3D"noreferrer" target=3D"_blank">libsdl2_2.0.8.bb</a><br>
@@ -42,6 +42,11 @@ PACKAGECONFIG ??=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;alsa=
 directfb pulseaudio x11&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;wa=
yland&#39;, &#39;wayland gles2&#39;, &#39;&#39;, d)} \<br>
=C2=A0&quot;<br>
+PACKAGECONFIG_class-native =3D &quot;${PACKAGECONFIG_GL} x11&quot;<br>
+PACKAGECONFIG_class-nativesdk =3D &quot;${PACKAGECONFIG_GL} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;DISTRO=
_FEATURES&#39;, &#39;x11&#39;, d)} \<br>
+&quot;<br>
+<br>
=C2=A0PACKAGECONFIG[alsa]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-alsa=
 --disable-alsatest,--disable-alsa,alsa-lib,&quot;<br>
=C2=A0PACKAGECONFIG[directfb]=C2=A0 =C2=A0=3D &quot;--enable-video-directfb=
,--disable-video-directfb,directfb&quot;<br>
=C2=A0PACKAGECONFIG[gles2]=C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-video-ope=
ngles,--disable-video-opengles,virtual/libgles2&quot;<br>
@@ -63,3 +68,5 @@ do_configure_prepend() {<br>
=C2=A0}<br>
<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${libdir}/cmake&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.17.0<br>
<br>
</blockquote></div>

--000000000000f2155c056be11efd--
