Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 73024605C3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 16:07:57 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id l21so6872554qtr.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 08:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LqgPPN9KauVKMEUGIvlvW3SSYOk5OSJb1ZdG4iTTCAY=;
	b=a+F7iZD7WKqy2QPZyiZ7y/MM/2tL6SD7XBdIJFxU07Lb7sCR/lKxcQT2jZ5XNLYxDV
	etV/C4tfFhCU4xb6Xf7mtzHh/mADxkx29H7G0JJ9k+mrTpXw0pvEWvJzNp24CIXsVsZi
	gKacS5kJ/igxNoUnye7C8k/d2ubLcRLl9f6/t/DbPMwETmYb3hjroqbj3mptYDs/4r9I
	QDhki6nHX10UHgLlobInBg9Ot8bfac3ypVtQiPwEvvEmt0u/bkE/id6b1ZIVxHhZfB9V
	3VMIIuYi/I8ECtR8dA/GGVwR2jHl7RE2syy1k6wwWz55M/jROMAi6ban2gCYILRkHrM0
	MN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LqgPPN9KauVKMEUGIvlvW3SSYOk5OSJb1ZdG4iTTCAY=;
	b=iCgAlPbdTRsbVDzvg0bmd3o3fdAj3ieQRke0XamwGLuAkPGldGcNBscvEjVWtqBjxj
	ugJ0TYPPuaZDWQ/pdn8mYgn4OvN7jeTG13DaHEIofuazMfpHYxbSfptV28lfYQSbuPoW
	YhiJmDkMU3IFhCyc0RrDKNf+QVG5p2Xwj7G7KHHsVxUOclhoHbBNVz001BBXLdcXwdlv
	v3ikQftQ/R+F0YD6ndc00TiQDB3J4181pEG/YOuwAFiCJkFUmZYc/s3iBC5huynzhTGq
	5HMgOqd2dwZz5p1XnKM1eTU5etEEzqM3DqbYrFlWdmnGcOpCjNMgHVYagfvOJI3XsNV+
	MwGQ==
X-Gm-Message-State: APjAAAXBLXcZmo58prGu0X94hJREsVtOdnsgY6wPPKpal/6lmbodoYd8
	fZH4RXwsl3NOQaECP9WurMCgl6Qu/JZOo41q3Ps=
X-Google-Smtp-Source: APXvYqzdREdOSzJJIVqzFTK1mhoEeZv/RG1+tr3N/N3eB5bQ9EfotKv8b7utuvL7ky5iMwhRnUx08mMm+anKYbh7mqs=
X-Received: by 2002:ac8:3fd7:: with SMTP id v23mr48716802qtk.293.1582560478024;
	Mon, 24 Feb 2020 08:07:58 -0800 (PST)
MIME-Version: 1.0
References: <20200224141457.10825-1-brgl@bgdev.pl>
In-Reply-To: <20200224141457.10825-1-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Feb 2020 08:07:47 -0800
Message-ID: <CAMKF1spm80Q00dYO8QAyqV+bAmgoqk94uYNjtkdCKZnbpr8XnA@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image_types: fix checksum conversion dependencies
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
X-List-Received-Date: Mon, 24 Feb 2020 16:07:57 -0000
Content-Type: multipart/alternative; boundary="00000000000020d811059f549318"

--00000000000020d811059f549318
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 24, 2020 at 6:15 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Only md5sum and sha256sum tools are provided by HOSTTOOLS. For other
> checksum utils, the conversions need to depend on coreutils-native.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  meta/classes/image_types.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.bbclass
> index f82f1d8862..63ffbac7e6 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -315,6 +315,10 @@ CONVERSION_DEPENDS_lzo = "lzop-native"
>  CONVERSION_DEPENDS_zip = "zip-native"
>  CONVERSION_DEPENDS_zst = "zstd-native"
>  CONVERSION_DEPENDS_sum = "mtd-utils-native"
> +CONVERSION_DEPENDS_sha1sum = "coreutils-native"
> +CONVERSION_DEPENDS_sha224sum = "coreutils-native"
> +CONVERSION_DEPENDS_sha384sum = "coreutils-native"
> +CONVERSION_DEPENDS_sha512sum = "coreutils-native"


If they are common enough on host distros then perhaps add them to
HOSTTOOLS might be better


>  CONVERSION_DEPENDS_bmap = "bmap-tools-native"
>  CONVERSION_DEPENDS_u-boot = "u-boot-tools-native"
>  CONVERSION_DEPENDS_vmdk = "qemu-system-native"
> --
> 2.19.1
>
>

--00000000000020d811059f549318
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Feb 24, 2020 at 6:15 AM Bartosz Golaszewski &lt;<a =
href=3D"mailto:brgl@bgdev.pl">brgl@bgdev.pl</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">From: Bartosz Golaszewski &lt;<a href=3D"mailto:bgo=
laszewski@baylibre.com" target=3D"_blank">bgolaszewski@baylibre.com</a>&gt;=
<br>
<br>
Only md5sum and sha256sum tools are provided by HOSTTOOLS. For other<br>
checksum utils, the conversions need to depend on coreutils-native.<br>
<br>
Signed-off-by: Bartosz Golaszewski &lt;<a href=3D"mailto:bgolaszewski@bayli=
bre.com" target=3D"_blank">bgolaszewski@baylibre.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/image_types.bbclass | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bb=
class<br>
index f82f1d8862..63ffbac7e6 100644<br>
--- a/meta/classes/image_types.bbclass<br>
+++ b/meta/classes/image_types.bbclass<br>
@@ -315,6 +315,10 @@ CONVERSION_DEPENDS_lzo =3D &quot;lzop-native&quot;<br>
=C2=A0CONVERSION_DEPENDS_zip =3D &quot;zip-native&quot;<br>
=C2=A0CONVERSION_DEPENDS_zst =3D &quot;zstd-native&quot;<br>
=C2=A0CONVERSION_DEPENDS_sum =3D &quot;mtd-utils-native&quot;<br>
+CONVERSION_DEPENDS_sha1sum =3D &quot;coreutils-native&quot;<br>
+CONVERSION_DEPENDS_sha224sum =3D &quot;coreutils-native&quot;<br>
+CONVERSION_DEPENDS_sha384sum =3D &quot;coreutils-native&quot;<br>
+CONVERSION_DEPENDS_sha512sum =3D &quot;coreutils-native&quot;</blockquote>=
<div dir=3D"auto"><br></div><div dir=3D"auto">If they are common enough on =
host distros then perhaps add them to HOSTTOOLS might be better</div><div d=
ir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0CONVERSION_DEPENDS_bmap =3D &quot;bmap-tools-native&quot;<br>
=C2=A0CONVERSION_DEPENDS_u-boot =3D &quot;u-boot-tools-native&quot;<br>
=C2=A0CONVERSION_DEPENDS_vmdk =3D &quot;qemu-system-native&quot;<br>
-- <br>
2.19.1<br>
<br>
</blockquote></div></div>

--00000000000020d811059f549318--
