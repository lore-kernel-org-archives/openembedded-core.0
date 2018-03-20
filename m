Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id C2E6878998
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 16:08:17 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id d13-v6so3144132itf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 09:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aK+13Q6SVcj352EmGzxxDxk61ub4ZwTXmeBxfHnEkcM=;
	b=GpfFJ7U930g1cdgj+GA1pbNytsb56vfj1Hnv+ck+UmvO9HtryMiX14T/7HoCPOsAyx
	e2GsyQjX4smU+Gs5WRO4Kz3FlE1GQIkly0LVLVLJvU1CJY8amCSc8q/uKDERGTZFifhk
	mDJ/Nidg7muz7Kx9ktEnEybhcYEmH+8N97XipQMyn4WBK9HdIrybb36oyg2fiWM8TUnx
	yKjBkXjWsC8ssv15uVIluNO2tZw+6ixzfJJoOkTOOGJw65WipOjsZaFP3zf3NMFypFeC
	R6JLBNSb/qYD1NYp0eunJQOQtyrqjgTzctn3HvB6Ka0gDBavuBVoFmQ8JBWNDsSG+tLS
	iUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aK+13Q6SVcj352EmGzxxDxk61ub4ZwTXmeBxfHnEkcM=;
	b=pahhr0zcI9CV8ggsebGQAuJScPoexZtpy9iaYbDlmacvK397mRfPIvUAVnLbEHS8WJ
	skZu3/gK1shkW51Bfqd5IzA2vCHq8nCI2DzjHyx2aAodoPszdegNqRP6T7Sz0z4M2BbZ
	MKV6yAqpzr5JNkvbSR2HxttKhuV4xkUz2+xrBBvbuSWBE3g1AL+Vyy43wHpQp9qIy9Ys
	3+vUwzL7zDmoMiBvK++VdAUkGjNq0zsljMZkxbMSvE8YBaesywCBX2H8slWxSNvjnP8V
	MUNLeWjSMY9LQrlguBRWOxBGth+195SJDt7WeHlpWiGGDxKIypt4Kr0KkCZBzUgDOHmf
	p8tQ==
X-Gm-Message-State: AElRT7GLxgapgrOZvOAMRMlWN2jIHzItknVbpTsQTSdTJbjGI9lZzhTz
	9EOhOAWFeYEgKZx8Rf1DqOL7e24epVRfZ6Bh31Wdtg==
X-Google-Smtp-Source: AG47ELsT2IauSRhmv+CqH9Q4297AN2wbmxp7aJYFDOh+JbFMkQvx6QTm/LaaZFmPFjEqlTLUgXv9Mj7Xa4vbiag8JWo=
X-Received: by 2002:a24:f685:: with SMTP id
	u127-v6mr177402ith.131.1521562098463; 
	Tue, 20 Mar 2018 09:08:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Tue, 20 Mar 2018 09:07:57 -0700 (PDT)
In-Reply-To: <20180320121017.943-1-Martin.Jansa@gmail.com>
References: <43d5b925-755b-3dbc-63b0-0df6e89396db@linux.intel.com>
	<20180320121017.943-1-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Mar 2018 16:07:57 +0000
Message-ID: <CAJTo0LY26Yp5tgyc3CJLGbeNioRB0Bu_SRd0o3CgAeHzvO8+=w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gio-module-cache.bbclass: disable update_gio_module_cache postinst script for nativesdk
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
X-List-Received-Date: Tue, 20 Mar 2018 16:08:17 -0000
Content-Type: multipart/alternative; boundary="000000000000620ea10567da484c"

--000000000000620ea10567da484c
Content-Type: text/plain; charset="UTF-8"

Can you file a bug for this? Probably best to fix instead of working
around, as this leaves gio modules broken.

Ross

On 20 March 2018 at 12:10, Martin Jansa <martin.jansa@gmail.com> wrote:

> * it fails to find postinst_intercept dir:
>   NOTE: IMAGE/1.0.0-1-r3/sdk/image///usr/lib/opkg/info/nativesdk-libglib-2.0-0.postinst:
> 4:
>         IMAGE/1.0.0-1-r3/sdk/image///usr/lib/opkg/info/nativesdk-
> libglib-2.0-0.postinst:
>         IMAGE/1.0.0-1-r3/intercept_scripts/postinst_intercept: not found
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/gio-module-cache.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/gio-module-cache.bbclass
> b/meta/classes/gio-module-cache.bbclass
> index a8190b7b89..179090d32e 100644
> --- a/meta/classes/gio-module-cache.bbclass
> +++ b/meta/classes/gio-module-cache.bbclass
> @@ -2,6 +2,7 @@ PACKAGE_WRITE_DEPS += "qemu-native"
>  inherit qemu
>
>  GIO_MODULE_PACKAGES ??= "${PN}"
> +GIO_MODULE_PACKAGES_class-nativesdk = ""
>
>  gio_module_cache_common() {
>  if [ "x$D" != "x" ]; then
> --
> 2.15.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000620ea10567da484c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you file a bug for this? Probably best to fix instead =
of working around, as this leaves gio modules broken.<div><br></div><div>Ro=
ss</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On =
20 March 2018 at 12:10, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">* it fails to find postinst=
_intercept dir:<br>
=C2=A0 NOTE: IMAGE/1.0.0-1-r3/sdk/image///<wbr>usr/lib/opkg/info/nativesdk-=
<wbr>libglib-2.0-0.postinst: 4:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE/1.0.0-1-r3/sdk/image///<wbr>usr/lib/opkg/=
info/nativesdk-<wbr>libglib-2.0-0.postinst:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE/1.0.0-1-r3/intercept_<wbr>scripts/postins=
t_intercept: not found<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">M=
artin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/gio-module-cache.<wbr>bbclass | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/classes/gio-module-<wbr>cache.bbclass b/meta/classes/gio-=
module-<wbr>cache.bbclass<br>
index a8190b7b89..179090d32e 100644<br>
--- a/meta/classes/gio-module-<wbr>cache.bbclass<br>
+++ b/meta/classes/gio-module-<wbr>cache.bbclass<br>
@@ -2,6 +2,7 @@ PACKAGE_WRITE_DEPS +=3D &quot;qemu-native&quot;<br>
=C2=A0inherit qemu<br>
<br>
=C2=A0GIO_MODULE_PACKAGES ??=3D &quot;${PN}&quot;<br>
+GIO_MODULE_PACKAGES_class-<wbr>nativesdk =3D &quot;&quot;<br>
<br>
=C2=A0gio_module_cache_common() {<br>
=C2=A0if [ &quot;x$D&quot; !=3D &quot;x&quot; ]; then<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.15.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--000000000000620ea10567da484c--
