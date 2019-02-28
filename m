Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
	[209.85.222.173])
	by mail.openembedded.org (Postfix) with ESMTP id F10487C420
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 21:36:18 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id a15so13060880qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 13:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nCTnziSW1iD3wRWgDn+EljS/Niafv1xf+C/Oq9yUqTk=;
	b=hBSvSQys8LEPi1xD/S8BwEIGF6KTLs6t4sUsUZA+3NyRmeWisG7fHavgoOgT2SC0mx
	+EnuglZoV2kyxsq8PaF0A83gUzG9rcGdwm8RtJNGJO8Q4l5CmEDfsGsTWgHD+Z8E954K
	YNBJDRBRfp1JyHf/BzbCoiy2qw8l5r1MOAqoT6vCZHekx87QQEmAnX7RWtX15v6gxwxn
	SvGwOAtUJeftZa3+VPxbhrxSEal66B+RoeWww/ovsy3TASDHm8757G3N/6NKnU2bwc5Z
	dhOuguwzKRMHp2cm0/i0+bKXdwVozGY35ibxnMeXmUMSXbdTk0vIZot3qxdj9daBvCIY
	YC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nCTnziSW1iD3wRWgDn+EljS/Niafv1xf+C/Oq9yUqTk=;
	b=sZF2htfZPZ/CPnWb5YiQ3nW2/OU0wYcNUP2s0wCe6mYHsP1RGGfSDUFr1H8pZgOo9F
	e5ios4/nokhF3YSZtXk/AOx2SvtIKpz0IeaU8T/VgzzFvnlCsDlYaEzFlXcC2TrRPa/b
	LfnjwBcvXpGQ6Iu7HbNKPOlmsA4PQeWhi6xUJGnBTySXHbGWcRWz01sAeBLzI4D63AJA
	lztjk/ulyGWlSTU/wu8tBqm41kwYNSph2vDVx+Mfy3o5qdT5aRvkwdcSs300GesNJ/lc
	VjnBKusw9X18vTtv6VIvca0FqYOz7cbp+QedoXkPLDvxH1wQ0AtDb2XlzPEjnnm3tl5D
	36Qw==
X-Gm-Message-State: APjAAAWICnpBL+nvA0ePm+iU9XF3MJ6uGyH39uNpUcmdAtbkR4dUAavu
	YAwGEPm4SCqGnK/lcua2QJaMLlmtVV1zlf6JSNg=
X-Google-Smtp-Source: APXvYqx5FJJESdls93asJ9hPfA6p4yRcOMKoXB4b3yDxfN7//x0eWpqGLlGgZe1eComtFHgDdlj2NtNEyIc76Tmb5Ys=
X-Received: by 2002:a37:3d6:: with SMTP id 205mr1290345qkd.223.1551389779495; 
	Thu, 28 Feb 2019 13:36:19 -0800 (PST)
MIME-Version: 1.0
References: <20190228213251.31036-1-alistair.francis@wdc.com>
In-Reply-To: <20190228213251.31036-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Feb 2019 13:36:07 -0800
Message-ID: <CAMKF1soe6Dev6HKeg=HoYV5bogwgLMEkze9AT1+YfZWL7W3C5A@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu-native: Add missing fdt PACKAGECONFIG
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
X-List-Received-Date: Thu, 28 Feb 2019 21:36:19 -0000
Content-Type: multipart/alternative; boundary="000000000000b7138d0582fb14d9"

--000000000000b7138d0582fb14d9
Content-Type: text/plain; charset="UTF-8"

I think it should be appended

On Thu, Feb 28, 2019 at 1:33 PM Alistair Francis <Alistair.Francis@wdc.com>
wrote:

> This is required to fix this build failure:
>
> qemu-3.1.0/hw/core/loader-fit.c:30:10: fatal error: libfdt.h: No such file
> or directory
>  #include <libfdt.h>
>           ^~~~~~~~~~
> compilation terminated.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-devtools/qemu/qemu-native_3.1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> index c8acff8e19..0b6a7f8b6e 100644
> --- a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> @@ -6,4 +6,4 @@ require qemu-native.inc
>
>  EXTRA_OECONF_append = "
> --target-list=${@get_qemu_usermode_target_list(d)} --disable-tools
> --disable-blobs --disable-guest-agent"
>
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "fdt"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000b7138d0582fb14d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">I think it should be appended=C2=A0</div></div><div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu=
, Feb 28, 2019 at 1:33 PM Alistair Francis &lt;<a href=3D"mailto:Alistair.F=
rancis@wdc.com">Alistair.Francis@wdc.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">This is required to fix this build failure:<br>
<br>
qemu-3.1.0/hw/core/loader-fit.c:30:10: fatal error: libfdt.h: No such file =
or directory<br>
=C2=A0#include &lt;libfdt.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~<br>
compilation terminated.<br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/qemu/<a href=3D"http://qemu-native_3.1.0.bb" re=
l=3D"noreferrer" target=3D"_blank">qemu-native_3.1.0.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/qemu/<a href=3D"http://qemu-native_3.1.0=
.bb" rel=3D"noreferrer" target=3D"_blank">qemu-native_3.1.0.bb</a> b/meta/r=
ecipes-devtools/qemu/<a href=3D"http://qemu-native_3.1.0.bb" rel=3D"norefer=
rer" target=3D"_blank">qemu-native_3.1.0.bb</a><br>
index c8acff8e19..0b6a7f8b6e 100644<br>
--- a/meta/recipes-devtools/qemu/<a href=3D"http://qemu-native_3.1.0.bb" re=
l=3D"noreferrer" target=3D"_blank">qemu-native_3.1.0.bb</a><br>
+++ b/meta/recipes-devtools/qemu/<a href=3D"http://qemu-native_3.1.0.bb" re=
l=3D"noreferrer" target=3D"_blank">qemu-native_3.1.0.bb</a><br>
@@ -6,4 +6,4 @@ require qemu-native.inc<br>
<br>
=C2=A0EXTRA_OECONF_append =3D &quot; --target-list=3D${@get_qemu_usermode_t=
arget_list(d)} --disable-tools --disable-blobs --disable-guest-agent&quot;<=
br>
<br>
-PACKAGECONFIG ??=3D &quot;&quot;<br>
+PACKAGECONFIG ??=3D &quot;fdt&quot;<br>
-- <br>
2.20.1<br>
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

--000000000000b7138d0582fb14d9--
