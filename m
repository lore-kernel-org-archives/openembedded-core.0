Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
	[209.85.166.169])
	by mail.openembedded.org (Postfix) with ESMTP id AF9EF60C09
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Feb 2020 02:43:05 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id g12so9701390ild.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Feb 2020 18:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Xp7GsAPcbnteLwshQggy+IwGkMYjNY1zaMMnKo3igP4=;
	b=uOthGcNcR53VIlCXtC0REC7S9PW157ETN94Od3+kpKidKCJNmSOPwf+XWKEr5ApP+4
	bnyduraMldiRevEmwuvyqNfRYrq7UG2R0xtuS9JATsof6qcFSEsdMw0NsDvlbuKYwv7/
	R3LDrG7TLgwhhAMEoFNIs75CfqiRhyCz2YCp2L8Le5Vtt8hQrlqmu8Mj1K1TTyx0rmfq
	jyoJicArtjS3t9y1ZqGwCdi53NAh3RvrwKL7kbdJsEgXK44m87e1kxNs9wcl67FoxeZj
	rfAXCnDiyQu4ZJANgzP4WUbTU17YaGzHD2gvtbT+DdB4w7TOhcVEaiTPRbo+lwuVLzoi
	/Blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Xp7GsAPcbnteLwshQggy+IwGkMYjNY1zaMMnKo3igP4=;
	b=XSwerquNz/d0NfzNBqT0gpcj1oVhHY6nflDZBnyqSIiOpGZjwCrolvVnc9XFJHDeHR
	vYxCLBzjLkHUc9kc79/9HIqdOp5Mb2Z40oJKj5WbOLcYzssbIdsWqnvgWZsMoo52L+/T
	L8R7dGNmzQevaQMELYjgP3OuZdy1Zrd8jUFOz2qAJuowym4NAb2eXjtrd/IZyfTDHJE/
	3f0tc+CLAGIvgd9YpZj2XDqXNGPwEX6q3Qwu4UhYrHsFkeGCoh5rRevCW3RoNB/b8Iew
	a5Xh3tBwbL5m8jdZsrW9rdO67Y5j/tBwSvRDJ62dyqt4QXxJHmDfu23FxsBG3oLCGuHh
	F9xw==
X-Gm-Message-State: APjAAAWqfCjHv/gmQObuP/xRT67jsUz2OtkduMQrhi6fUVF9Wpxa1O4F
	wuY3DEHcYkzxYqwvaXys2143TeXT9zICuemyXj00JgAJ
X-Google-Smtp-Source: APXvYqxB1xG43iCtHBswAEJuUlASWkafirGXMAFVkV17TbqXGcf3DFIaz09HjTeDWQNjeOaQYfvui7585V/e0VCUwqk=
X-Received: by 2002:a92:8686:: with SMTP id l6mr17619637ilh.170.1580611386426; 
	Sat, 01 Feb 2020 18:43:06 -0800 (PST)
MIME-Version: 1.0
References: <20200202020323.23609-1-alistair@alistair23.me>
In-Reply-To: <20200202020323.23609-1-alistair@alistair23.me>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 1 Feb 2020 18:42:55 -0800
Message-ID: <CANx9H-Cf3zEAibK18UwB_pVfMuCXQR_chhhTFFZgAiWBv4zDWA@mail.gmail.com>
To: Alistair Francis <alistair@alistair23.me>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libchamplain: Add support for building libchamplain
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
X-List-Received-Date: Sun, 02 Feb 2020 02:43:05 -0000
Content-Type: multipart/alternative; boundary="000000000000374b40059d8ec4fc"

--000000000000374b40059d8ec4fc
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 1, 2020 at 6:11 PM Alistair Francis <alistair@alistair23.me>
wrote:

Maybe some explanation of what is for and why we want it in core would be
helpful here.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  .../libchamplain/libchamplain_0.12.20.bb             | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta/recipes-gnome/libchamplain/
> libchamplain_0.12.20.bb
>
> diff --git a/meta/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
> b/meta/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
> new file mode 100644
> index 0000000000..90e5533015
> --- /dev/null
> +++ b/meta/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "libchamplain is a Gtk widget displaying zoomable and pannable
> maps"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
> +DEPENDS = "glib-2.0 gtk+3 gdk-pixbuf clutter-1.0 clutter-gtk-1.0
> libsoup-2.4"
> +
> +inherit meson gobject-introspection
> +
> +SRCREV = "145e417f32e507b63c21ad4e915b808a6174099e"
> +SRC_URI = "git://github.com/gnome/libchamplain.git"
> +
> +S = "${WORKDIR}/git"
> +
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000374b40059d8ec4fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Feb 1, 2020 at 6:11 PM Alistair Francis &lt;<a href=
=3D"mailto:alistair@alistair23.me">alistair@alistair23.me</a>&gt; wrote:<br=
></div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><div dir=3D"ltr" cla=
ss=3D"gmail_attr">Maybe some explanation of what is for and why we want it =
in core would be helpful here.</div><div dir=3D"ltr" class=3D"gmail_attr"><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Alistair Francis &lt=
;<a href=3D"mailto:alistair@alistair23.me" target=3D"_blank">alistair@alist=
air23.me</a>&gt;<br>
---<br>
=C2=A0.../libchamplain/<a href=3D"http://libchamplain_0.12.20.bb" rel=3D"no=
referrer" target=3D"_blank">libchamplain_0.12.20.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 ++++++++++++<br>
=C2=A01 file changed, 12 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-gnome/libchamplain/<a href=3D"http://=
libchamplain_0.12.20.bb" rel=3D"noreferrer" target=3D"_blank">libchamplain_=
0.12.20.bb</a><br>
<br>
diff --git a/meta/recipes-gnome/libchamplain/<a href=3D"http://libchamplain=
_0.12.20.bb" rel=3D"noreferrer" target=3D"_blank">libchamplain_0.12.20.bb</=
a> b/meta/recipes-gnome/libchamplain/<a href=3D"http://libchamplain_0.12.20=
.bb" rel=3D"noreferrer" target=3D"_blank">libchamplain_0.12.20.bb</a><br>
new file mode 100644<br>
index 0000000000..90e5533015<br>
--- /dev/null<br>
+++ b/meta/recipes-gnome/libchamplain/<a href=3D"http://libchamplain_0.12.2=
0.bb" rel=3D"noreferrer" target=3D"_blank">libchamplain_0.12.20.bb</a><br>
@@ -0,0 +1,12 @@<br>
+SUMMARY =3D &quot;libchamplain is a Gtk widget displaying zoomable and pan=
nable maps&quot;<br>
+LICENSE =3D &quot;LGPLv2.1&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D2d5025d4aa3495befef8f17206=
a5b0a1&quot;<br>
+DEPENDS =3D &quot;glib-2.0 gtk+3 gdk-pixbuf clutter-1.0 clutter-gtk-1.0 li=
bsoup-2.4&quot;<br>
+<br>
+inherit meson gobject-introspection<br>
+<br>
+SRCREV =3D &quot;145e417f32e507b63c21ad4e915b808a6174099e&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/gnome/libchamplain.gi=
t" rel=3D"noreferrer" target=3D"_blank">github.com/gnome/libchamplain.git</=
a>&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
-- <br>
2.25.0<br>
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

--000000000000374b40059d8ec4fc--
