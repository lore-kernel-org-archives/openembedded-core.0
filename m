Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 64D5C60557
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 12:23:42 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id z6so5805667iob.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 04:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f5RRWqjKQcnW67ODQSu1inlbjgZhupg9I2UbUcgP5YM=;
	b=Jg8q4vieEocHXwyYGZQqJbo4JovmqL2i90pz6Fn/hmw7lyGXlu3aZemhx8+nWd8bvz
	q5HNYMSNPP6PyGrUoM5FS2HxUA3BUqfIDA0wyWj2ILJ5x9jgPpk4wk0Gx25sz0dRCcaz
	WwZBeA5mUkLTyuCsCidlOK5VswwzlWhAeGyk7pdSqHwasxCWoYr+Wtq1XSpp2E3on2da
	+R+yJ48pW9IjV36Cz75iAyU4AgF345syBYuwLpCg5eFZtO4VgvSsIKYsBxNb/vATXst2
	EsrGNEwUqm9dL/7K6jNzP2XinYNlAwiMNVmLolm9SmGtfciFDG3HGMBDyqTHC2GAOxEh
	YPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f5RRWqjKQcnW67ODQSu1inlbjgZhupg9I2UbUcgP5YM=;
	b=sOYT/h2CjMGHlH+8Qn7B7vJaXukDxaApfVVB3Ss347K0RCvTxiNhWnT0rio+6xEvaJ
	I1MYr2wt/zCO7XX+8tklpMztevv/yVlxpO3NzZ+Q+FNt5dF9HfuuC1Dj7CLHbqWrq8iq
	xjsXVgOIDEgQ7NDW7T0sNJqHIk9LyTu8ZNpcMYFIk5EdrQva7jv+swNkUl7aODFxTle4
	EKI1M2FJeCjxoRr6P+LkEvAeR0RzinW4cKct/7ueCtBCScCz4kyT8UAEeIB3AKdy0gFI
	Zo3FKhlUVGyvVai2hCD6URTl68qWO7QMvrcC0Y2NApAjFsmkaoTzpO1xX1x93ZY5IUXj
	f48A==
X-Gm-Message-State: APf1xPDxt/9c6h726zqv3o9NENK7OWZxStokg3DfBorztIxXP6BP8QtR
	Lwg+kok1ozoXArDYNAxbbwzto6mU44oGqiUNm0JLZA==
X-Google-Smtp-Source: AH8x224AjzWW4Msl1XWJ3aX4Yjg8VhXUQN44A6UCVEvAmf82gMw38aQ5jJdNir+q7IjyIdxwvsqCvzwHZNqW3FnjraU=
X-Received: by 10.107.183.76 with SMTP id h73mr8542475iof.201.1519302224338;
	Thu, 22 Feb 2018 04:23:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Thu, 22 Feb 2018 04:23:23 -0800 (PST)
In-Reply-To: <20180222073647.31860-1-otavio@ossystems.com.br>
References: <20180222073647.31860-1-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Feb 2018 12:23:23 +0000
Message-ID: <CAJTo0LZkjeVEQohwNZRZU4KLLCJySyPbVqJQgq2nS=jB42DszA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-mkimage: Add dependency on dtc
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
X-List-Received-Date: Thu, 22 Feb 2018 12:23:43 -0000
Content-Type: multipart/alternative; boundary="94eb2c0b9e3a6386df0565cc1d80"

--94eb2c0b9e3a6386df0565cc1d80
Content-Type: text/plain; charset="UTF-8"

Shouldn't this be dtc-native?

Ross

On 22 February 2018 at 07:36, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> The dtc is used when generating images which use Device Tree and we
> must use the OE version to avoid relying on the host one.
>
> Reported-by: Renato Caldas <rm.santos.caldas@gmail.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
> b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
> index f1fc5644922..1d55f2899a1 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
> @@ -1,7 +1,7 @@
>  require u-boot-common_${PV}.inc
>
>  SUMMARY = "U-Boot bootloader image creation tool"
> -DEPENDS = "openssl"
> +DEPENDS = "openssl dtc"
>
>  EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC}
> ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
> STRIP=true V=1'
>  EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS}
> ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
> STRIP=true V=1'
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0b9e3a6386df0565cc1d80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Shouldn&#39;t this be dtc-native?<div><br></div><div>Ross<=
/div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 22 =
February 2018 at 07:36, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The dtc is used when g=
enerating images which use Device Tree and we<br>
must use the OE version to avoid relying on the host one.<br>
<br>
Reported-by: Renato Caldas &lt;<a href=3D"mailto:rm.santos.caldas@gmail.com=
">rm.santos.caldas@gmail.com</a>&gt;<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r">otavio@ossystems.com.br</a>&gt;<br>
---<br>
<br>
=C2=A0meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2018.01.bb" =
rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2018.01.bb</a> | 2=
 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2018.=
01.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2018.01.bb<=
/a> b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2018.01.bb" =
rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2018.01.bb</a><br>
index f1fc5644922..1d55f2899a1 100644<br>
--- a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2018.01.bb" =
rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2018.01.bb</a><br>
+++ b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2018.01.bb" =
rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2018.01.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0require u-boot-common_${PV}.inc<br>
<br>
=C2=A0SUMMARY =3D &quot;U-Boot bootloader image creation tool&quot;<br>
-DEPENDS =3D &quot;openssl&quot;<br>
+DEPENDS =3D &quot;openssl dtc&quot;<br>
<br>
=C2=A0EXTRA_OEMAKE_class-target =3D &#39;CROSS_COMPILE=3D&quot;${TARGET_<wb=
r>PREFIX}&quot; CC=3D&quot;${CC} ${CFLAGS} ${LDFLAGS}&quot; HOSTCC=3D&quot;=
${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}&quot; STRIP=3Dtrue V=3D1&#39;<=
br>
=C2=A0EXTRA_OEMAKE_class-native =3D &#39;CC=3D&quot;${BUILD_CC} ${BUILD_CFL=
AGS} ${BUILD_LDFLAGS}&quot; HOSTCC=3D&quot;${BUILD_CC} ${BUILD_CFLAGS} ${BU=
ILD_LDFLAGS}&quot; STRIP=3Dtrue V=3D1&#39;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.16.2<br>
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

--94eb2c0b9e3a6386df0565cc1d80--
