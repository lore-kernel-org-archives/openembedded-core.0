Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id BA9B877156
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 21:57:58 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id p194so30500019iod.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2016 14:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=nmTmnG2PGgT7vtzQd8bgTFRTDhY2+ltvl9i9dip1T3g=;
	b=vdbTHtxEMnObiOIXtRvkT/qG3DR3SyJPWlcOGiecCs3NPDuVqJZ5Woqxi9fiyai0eo
	e2jUhkPozNGCRJfqk0c8gKdu93fcMVN0AxF8EdGo1hynIzrgj2wh+ZcC4AZ+dZ2yvsvS
	hGwJLUEtQwfcPkxddWeMMW2M+RVrKENWMgpeNtHe+KCKDwUgClbwfFCQe+2ye7Q7hxgl
	LhTvZK/9AK5PXR2kHH5Y0mUJI5zMRl7LFmy+dwSKVI8aZIL5iVkIqXxAGQRzqASCl3Wb
	42fIxh18+BqThEX6a4eOsTRFQ5ca4hjJN9IQgzIXcm4yKo7JW/fi1ktF0Nh8A7g7ci/8
	j/pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=nmTmnG2PGgT7vtzQd8bgTFRTDhY2+ltvl9i9dip1T3g=;
	b=Pb9u6TyCJbsGyVS9OYqd4mfQBT8WEODNnSjBgoF1oilGlMuxL55xrID/xgsAQ9ispD
	jWt3SRKoIiNmZfKx3DVOfZoXKyxP8rqq1GXS9v7ImtUqN+H+e8+4WdV6HDJT5nBWTSeT
	i/8IWTPPMlpRq0MOEOnGQ/RbfDTh3SbOPQsyvlOJ4b1uxAHBdYiDCHxYBEpsssnbNW9v
	C+xjHwebq8NxojmX1CNJrjdqEKneGJITFRalwZ/CwLOJSWnZ0fvVWanyk3rV9Mhr3ebh
	pNR2ZCWGpWQWC70M3O5jsSXiiepR8F5PnGFItNYXhTWZ2hWn3Bg6H/lJxVZC5G+jxEkN
	MaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=nmTmnG2PGgT7vtzQd8bgTFRTDhY2+ltvl9i9dip1T3g=;
	b=IbhSGz7JOeJVmv5GRF0aDRHylM1dRYY8Ha4YoI9g+1ltSVrAszrttu72wPDoRxz4eg
	wuaFSDyWG1ZXizpzqkVPNmUkAXy3kiBDFuvRt7d8ZrzdI/3RpQeJtS0jM9QpwkjpW7qN
	V6iREy0RJ25QZDDnDL5MoCJzq2UtSFLRsXLXnz1Fxq4RLB/ayR3YBEL6/1ZlI6RGI5kK
	CIqo64oikkMoREVp/ap5Wlq/VyAli6Zs1uV41m/h/I7MGyEd+YmKLgJ0cv4nXPvYYsx+
	7aiNffUu7CMQr6Y8wK3RlaxtZnEAHZ3eED+0ijjtW6XtK0LlNWjHgD5scDwn0zLRjImX
	8Pcg==
X-Gm-Message-State: ALyK8tJ17ZgBnJ6UYZC2oA7mauVXib3vg1ujRJj8HU0Sybv4Zb30dKHN1xWsqiDXl4E8Npdegh4n/SGQdXu6tQ==
X-Received: by 10.107.147.6 with SMTP id v6mr7111586iod.3.1464818279102; Wed,
	01 Jun 2016 14:57:59 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Wed, 1 Jun 2016 14:57:39 -0700 (PDT)
In-Reply-To: <1464784540-2786-2-git-send-email-richard.purdie@linuxfoundation.org>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1464784540-2786-2-git-send-email-richard.purdie@linuxfoundation.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 1 Jun 2016 14:57:39 -0700
X-Google-Sender-Auth: LDddjKvomqLVmeqtfrEPH2IOHak
Message-ID: <CABcZANkR9eyTFDx3u4K1G55Vi6HJC7wHUAFTiBR5EfYD+Z2XfA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/22] classes/lib: Convert to use python3 octal syntax
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
X-List-Received-Date: Wed, 01 Jun 2016 21:58:00 -0000
Content-Type: multipart/alternative; boundary=94eb2c05be56300beb05343e9574

--94eb2c05be56300beb05343e9574
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 1, 2016 at 5:35 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 4be0a7e..1ba1222 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -456,15 +456,15 @@ python () {
>      # If we're building a target package we need to use fakeroot (pseudo)
>      # in order to capture permissions, owners, groups and special files
>      if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross',
> d):
> -        d.setVarFlag('do_unpack', 'umask', '022')
> -        d.setVarFlag('do_configure', 'umask', '022')
> -        d.setVarFlag('do_compile', 'umask', '022')
> +        d.setVarFlag('do_unpack', 'umask', '0o022')
> +        d.setVarFlag('do_configure', 'umask', '0o022')
> +        d.setVarFlag('do_compile', 'umask', '0o022')
>          d.appendVarFlag('do_install', 'depends', '
> virtual/fakeroot-native:do_populate_sysroot')
>          d.setVarFlag('do_install', 'fakeroot', '1')
> -        d.setVarFlag('do_install', 'umask', '022')
> +        d.setVarFlag('do_install', 'umask', '0o022')
>          d.appendVarFlag('do_package', 'depends', '
> virtual/fakeroot-native:do_populate_sysroot')
>          d.setVarFlag('do_package', 'fakeroot', '1')
> -        d.setVarFlag('do_package', 'umask', '022')
> +        d.setVarFlag('do_package', 'umask', '0o022')
>          d.setVarFlag('do_package_setscene', 'fakeroot', '1')
>          d.appendVarFlag('do_package_setscene', 'depends', '
> virtual/fakeroot-native:do_populate_sysroot')
>          d.setVarFlag('do_devshell', 'fakeroot', '1')
>

Rather than modifying the string values in the metadata, shouldn't we
retain compatibility by letting the umask *string* stored in the flag use
the old format and if needed convert it when we convert the string to a
number to pass to the appropriate os functions? Or was this just a sed gone
wild, since these are string values, not python source octal syntax?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c05be56300beb05343e9574
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jun 1, 2016 at 5:35 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.p=
urdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div id=3D":1mz" class=3D"a3s aXjCH m1550bf7143fffdb2">diff --git a/=
meta/classes/base.<span class=3D"il">bbclass</span> b/meta/classes/base.<sp=
an class=3D"il">bbclass</span><br>
index 4be0a7e..1ba1222 100644<br>
--- a/meta/classes/base.<span class=3D"il">bbclass</span><br>
+++ b/meta/classes/base.<span class=3D"il">bbclass</span><br>
@@ -456,15 +456,15 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0# If we&#39;re building a target package we need to use=
 fakeroot (pseudo)<br>
=C2=A0 =C2=A0 =C2=A0# in order to capture permissions, owners, groups and s=
pecial files<br>
=C2=A0 =C2=A0 =C2=A0if not <span class=3D"il">bb</span>.data.inherits_class=
(&#39;native&#39;, d) and not <span class=3D"il">bb</span>.data.inherits_cl=
ass(&#39;cross&#39;, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(&#39;do_unpack&#39;, &#39;umask&#=
39;, &#39;022&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(&#39;do_configure&#39;, &#39;umas=
k&#39;, &#39;022&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(&#39;do_compile&#39;, &#39;umask&=
#39;, &#39;022&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(&#39;do_unpack&#39;, &#39;umask&#=
39;, &#39;0o022&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(&#39;do_configure&#39;, &#39;umas=
k&#39;, &#39;0o022&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(&#39;do_compile&#39;, &#39;umask&=
#39;, &#39;0o022&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_install&#39;, &#3=
9;depends&#39;, &#39; virtual/fakeroot-native:do_populate_sysroot&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVarFlag(&#39;do_install&#39;, &#39;f=
akeroot&#39;, &#39;1&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(&#39;do_install&#39;, &#39;umask&=
#39;, &#39;022&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(&#39;do_install&#39;, &#39;umask&=
#39;, &#39;0o022&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_package&#39;, &#3=
9;depends&#39;, &#39; virtual/fakeroot-native:do_populate_sysroot&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVarFlag(&#39;do_package&#39;, &#39;f=
akeroot&#39;, &#39;1&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(&#39;do_package&#39;, &#39;umask&=
#39;, &#39;022&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(&#39;do_package&#39;, &#39;umask&=
#39;, &#39;0o022&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVarFlag(&#39;do_package_setscene&#39=
;, &#39;fakeroot&#39;, &#39;1&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_package_setscene&=
#39;, &#39;depends&#39;, &#39; virtual/fakeroot-native:do_populate_sysroot&=
#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVarFlag(&#39;do_devshell&#39;, &#39;=
fakeroot&#39;, &#39;1&#39;)</div></blockquote></div><br>Rather than modifyi=
ng the string values in the metadata, shouldn&#39;t we retain compatibility=
 by letting the umask *string* stored in the flag use the old format and if=
 needed convert it when we convert the string to a number to pass to the ap=
propriate os functions? Or was this just a sed gone wild, since these are s=
tring values, not python source octal syntax?<br>-- <br><div class=3D"gmail=
_signature" data-smartmail=3D"gmail_signature">Christopher Larson<br>clarso=
n at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Main=
tainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--94eb2c05be56300beb05343e9574--
