Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1A0C7719BA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 00:24:45 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id b35so33767703uaa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 16:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/nnBfm8W/sAbRRFX25MjeaW2Iw/VEmiAT+rd8BO4rus=;
	b=XsbNDYz3sacHcTJDS+f3eOkdFYEkvG9ZvF7Ve9iloh9t0+UPk9+l2kxVrhjPDxTXXc
	j00Xo+jNobwfw3IQUbLq9hbE8vPy8eCNpvJCfZo/tiRQWVSrqYGYFQneu6Fji+u/D0FX
	p9rhYoo2Y+139FNbYyKYleFof1+a2Sd+QINfGxfpI1E3xkq8PMCWjSXMaF+1tlNFs7qu
	LlStIWvZ4h5ygngmsfy4c8zOlyDmrz7cz3YZjJNgw1uN5NCt9GZ2I6pSiwJxVF+cJZlC
	KdCososN3N4iwK2OMB55a3HomlV/M5Tq4g480LcehH4jVAQBTkJlAHdv7k35JYg0f3ni
	w4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/nnBfm8W/sAbRRFX25MjeaW2Iw/VEmiAT+rd8BO4rus=;
	b=XApRTYla6hmic5OweqBxsQynMrx22Ft6fOLNyKgJmaMPGiPb7k2mbRQOJGF5uOPNfR
	SLG93kT3lwRCM4T2pyb13A9wfHf66NPfJTirkyt0SoO0/Y3UOJLlmDvqWJyrdx6RSdqO
	L82s2HKHQ6HFwzMb8CQDchP0MAN/AdPN4tjuuMhuSaPsJvfdZIN6HM6xKGR5+pphD5YA
	JOO9D03emxT/xSdppmE63MDTZNNL+/tkCszk1esg0g9I9QaeoE/qGVPFKYp91KlQd6Ic
	5l6R/JwuSnXfiAfRETXq0M7RMUJtRxyArhE0XhubCpO5XI4kVm5UZP2TIRr0uLGgSCvd
	WquA==
X-Gm-Message-State: AKaTC01YaDHzLoCKXriKPhq4K9o++atyVC4iV8QX5BQ3O4VI9Ny2JbRG4kMXMBir6UCP05krGjtE+LcpHVxynQ==
X-Received: by 10.176.84.8 with SMTP id n8mr11169980uaa.29.1480983887119; Mon,
	05 Dec 2016 16:24:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Mon, 5 Dec 2016 16:24:46 -0800 (PST)
Received: by 10.159.48.87 with HTTP; Mon, 5 Dec 2016 16:24:46 -0800 (PST)
In-Reply-To: <1480983561-11437-3-git-send-email-schnitzeltony@googlemail.com>
References: <1480983561-11437-1-git-send-email-schnitzeltony@googlemail.com>
	<1480983561-11437-3-git-send-email-schnitzeltony@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Dec 2016 16:24:46 -0800
Message-ID: <CAMKF1sorwZg-yF5k8NJBtDakZHqCZr0H=jvLP8mx8bkcU2B3Gg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] libsdl2: add EXTRA_OECONF[vardepsexclude] = "MACHINE"
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
X-List-Received-Date: Tue, 06 Dec 2016 00:24:46 -0000
Content-Type: multipart/alternative; boundary=94eb2c1b2d7e828a4b0542f26ebd

--94eb2c1b2d7e828a4b0542f26ebd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

There probably is no need to use this additional variable. We can just use
PKG_CONFIG_SYSROOT

On Dec 5, 2016 4:19 PM, "Andreas M=C3=BCller" <schnitzeltony@googlemail.com=
>
wrote:

> fixes Martin's MACHINE checksum test [1]
>
> [1] http://lists.openembedded.org/pipermail/openembedded-core/
> 2016-November/129464.html
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> index ac7312b..b104a43 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> @@ -34,6 +34,7 @@ EXTRA_OECONF =3D "--disable-oss --disable-esd
> --disable-arts \
>                  --enable-sdl-dlopen \
>                  --disable-rpath \
>                  WAYLAND_PROTOCOLS_SYSROOT_DIR=3D${STAGING_DIR}/${MACHINE=
}"
> +EXTRA_OECONF[vardepsexclude] =3D "MACHINE"
>
>  # opengl packageconfig factored out to make it easy for distros
>  # and BSP layers to pick either (desktop) opengl, gles2, or no GL
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c1b2d7e828a4b0542f26ebd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">There probably is no need to use this additional variable=
. We can just use PKG_CONFIG_SYSROOT=C2=A0</div><div class=3D"gmail_extra">=
<br><div class=3D"gmail_quote">On Dec 5, 2016 4:19 PM, &quot;Andreas M=C3=
=BCller&quot; &lt;<a href=3D"mailto:schnitzeltony@googlemail.com">schnitzel=
tony@googlemail.com</a>&gt; wrote:<br type=3D"attribution"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">fixes Martin&#39;s MACHINE checksum test [1]<br>
<br>
[1] <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/20=
16-November/129464.html" rel=3D"noreferrer" target=3D"_blank">http://lists.=
openembedded.org/<wbr>pipermail/openembedded-core/<wbr>2016-November/129464=
.html</a><br>
<br>
Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goog=
lemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.5.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>libsdl2_2.0.5.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-graphics/<wbr>libsdl2/<a href=3D"http://libsdl2_2=
.0.5.bb" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.5.bb</a> b/meta/r=
ecipes-graphics/<wbr>libsdl2/<a href=3D"http://libsdl2_2.0.5.bb" rel=3D"nor=
eferrer" target=3D"_blank">libsdl2_2.0.5.bb</a><br>
index ac7312b..b104a43 100644<br>
--- a/meta/recipes-graphics/<wbr>libsdl2/<a href=3D"http://libsdl2_2.0.5.bb=
" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.5.bb</a><br>
+++ b/meta/recipes-graphics/<wbr>libsdl2/<a href=3D"http://libsdl2_2.0.5.bb=
" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.5.bb</a><br>
@@ -34,6 +34,7 @@ EXTRA_OECONF =3D &quot;--disable-oss --disable-esd --disa=
ble-arts \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-sdl-=
dlopen \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-rpa=
th \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WAYLAND_PROTO=
COLS_SYSROOT_DIR=3D<wbr>${STAGING_DIR}/${MACHINE}&quot;<br>
+EXTRA_OECONF[vardepsexclude] =3D &quot;MACHINE&quot;<br>
<br>
=C2=A0# opengl packageconfig factored out to make it easy for distros<br>
=C2=A0# and BSP layers to pick either (desktop) opengl, gles2, or no GL<br>
--<br>
2.5.5<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</blockquote></div></div>

--94eb2c1b2d7e828a4b0542f26ebd--
