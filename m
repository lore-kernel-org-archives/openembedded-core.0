Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.13025.1589465560320832955
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 07:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MpbUWYFE;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: liu.ming50@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id v12so4266496wrp.12
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 07:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ojgtv9akVaLPTFD73Yoz+m73nNuo6W/DaSSUND3oVPM=;
        b=MpbUWYFEk4nIPI1n2J8JgNgqK1TcBaWoHKbqEuA8IogfUPG3LWJmA5jdKGC6dnJhgh
         kW+tYFmxVaAhry7mPRzrzdtqWet7cD3h9kfch52VpiMOyjaX4hkb9/jKdPWPAhoMzkjo
         LfTbV7SHccNFObGg2z/aTc1mP/N1hPF64v79YvorbNIB3XNuN2QEqgTkaFGUBlajskRh
         gArCk22pnee3ZznZEq+DZNhnU0L/wWAMMoD2djM8uVcLhFS8d21f0uid7BZkjT6SEYeP
         SpxkNdSEkfnpKLVWW4TfxTnHNF4YrQ85t7G6a7oq2guYt2HIFW6BX7XS8stMMz5rcus6
         6KNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ojgtv9akVaLPTFD73Yoz+m73nNuo6W/DaSSUND3oVPM=;
        b=fvBxOdJLGYePZL3Enf/pbVqtk+0s4akv4CjaAmiu59cHjNzoPnknFG8bijQZKkxPyj
         nttfK6OiK8d9x/5oQQQOLeWxlfneTjeAtGB3HopNiGf1IEODUhKFhedgwLiZi3gbD2u9
         qPgcW869A8dUodIpaD0XZp32ACdd01sc5K2Kyo65pPWHaAeY4TxAhhvs6i+VA/5CbO+W
         niGzI4hk9yfDqufUQHZDC+ZmHj5DSvKIxo1mciNVKEZymfXjtip+Fiu+mVl0v/wt3qlt
         iJ89xgGfQj5AmP+wJdIQhuufl9KBDx08mYNYtVkMW6wNcQPypH+fZZ1ZifHk02pGJ2uG
         DZxQ==
X-Gm-Message-State: AOAM530Io+L2WJO8JYioBQFp5EXj29MDFrMJ3zH+vBBA7q+hP4AFrKdd
	S2bm/HV/+TP3GqVhhQNdf1iUAlgBtFahwTKwcnadjAdC
X-Google-Smtp-Source: ABdhPJw+WzdRqf8rJdoMjXeaUuL0fBt4dSB0rFkeWyvT4xYqyYmT5Hd3s9n//cD78ZBlaEYoOhlNhe9Du/4OTQueu8c=
X-Received: by 2002:a5d:6144:: with SMTP id y4mr5840466wrt.185.1589465558612;
 Thu, 14 May 2020 07:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200406192216.23434-1-liu.ming50@gmail.com>
In-Reply-To: <20200406192216.23434-1-liu.ming50@gmail.com>
From: "Ming Liu" <liu.ming50@gmail.com>
Date: Thu, 14 May 2020 16:13:18 +0200
Message-ID: <CALatG=6MMcB8z5MdKFLt27Lub9u7jyPTLW-x6rzWraKPxzTpCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: support merging .cfg files for UBOOT_CONFIG
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Stefan Agner <stefan.agner@toradex.com>, 
	Max Krummenacher <max.krummenacher@toradex.com>, Ming Liu <ming.liu@toradex.com>
Content-Type: multipart/alternative; boundary="00000000000000fedb05a59c4aee"

--00000000000000fedb05a59c4aee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, maintainers:

Ping! May I get some comments about this patch? It's been pending for weeks=
.

//Ming Liu

<liu.ming50@gmail.com> =E6=96=BC 2020=E5=B9=B44=E6=9C=886=E6=97=A5 =E9=80=
=B1=E4=B8=80 =E4=B8=8B=E5=8D=889:21=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Ming Liu <ming.liu@toradex.com>
>
> U-boot recipe supports .cfg files in SRC_URI, but they would be merged
> to .config during do_configure only when UBOOT_MACHINE is set, we
> should also support merging .cfg files for UBOOT_CONFIG.
>
> Signed-off-by: Ming Liu <ming.liu@toradex.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
> b/meta/recipes-bsp/u-boot/u-boot.inc
> index 188e5295cf..9126fafe0b 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -77,7 +77,21 @@ def find_cfgs(d):
>      return sources_list
>
>  do_configure () {
> -    if [ -z "${UBOOT_CONFIG}" ]; then
> +    if [ -n "${UBOOT_CONFIG}" ]; then
> +        unset i j
> +        for config in ${UBOOT_MACHINE}; do
> +            i=3D$(expr $i + 1);
> +            for type in ${UBOOT_CONFIG}; do
> +                j=3D$(expr $j + 1);
> +                if [ $j -eq $i ]; then
> +                    KCONFIG_CONFIG=3D${S}/configs/${config%_*}_defconfig
> merge_config.sh -m ${S}/configs/${config%_*}_defconfig ${@"
> ".join(find_cfgs(d))}
> +                    oe_runmake -C ${S} O=3D${B}/${config} ${config}
> +                fi
> +            done
> +            unset  j
> +        done
> +        unset  i
> +    else
>          if [ -n "${UBOOT_MACHINE}" ]; then
>              oe_runmake -C ${S} O=3D${B} ${UBOOT_MACHINE}
>          else
> @@ -114,7 +128,6 @@ do_compile () {
>                  j=3D$(expr $j + 1);
>                  if [ $j -eq $i ]
>                  then
> -                    oe_runmake -C ${S} O=3D${B}/${config} ${config}
>                      oe_runmake -C ${S} O=3D${B}/${config}
> ${UBOOT_MAKE_TARGET}
>                      for binary in ${UBOOT_BINARIES}; do
>                          k=3D$(expr $k + 1);
> --
> 2.26.0
>
>

--00000000000000fedb05a59c4aee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, maintainers:</div><div><br></div>Ping! May I get =
some comments about this patch? It&#39;s been pending for weeks.<div><br></=
div><div>//Ming Liu=C2=A0 =C2=A0</div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">&lt;<a href=3D"mailto:liu.ming50@gmai=
l.com">liu.ming50@gmail.com</a>&gt; =E6=96=BC 2020=E5=B9=B44=E6=9C=886=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=889:21=E5=AF=AB=E9=81=93=EF=BC=9A=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Ming Liu =
&lt;<a href=3D"mailto:ming.liu@toradex.com" target=3D"_blank">ming.liu@tora=
dex.com</a>&gt;<br>
<br>
U-boot recipe supports .cfg files in SRC_URI, but they would be merged<br>
to .config during do_configure only when UBOOT_MACHINE is set, we<br>
should also support merging .cfg files for UBOOT_CONFIG.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:ming.liu@toradex.com" target=
=3D"_blank">ming.liu@toradex.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-bsp/u-boot/u-boot.inc | 17 +++++++++++++++--<br>
=C2=A01 file changed, 15 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc<br>
index 188e5295cf..9126fafe0b 100644<br>
--- a/meta/recipes-bsp/u-boot/u-boot.inc<br>
+++ b/meta/recipes-bsp/u-boot/u-boot.inc<br>
@@ -77,7 +77,21 @@ def find_cfgs(d):<br>
=C2=A0 =C2=A0 =C2=A0return sources_list<br>
<br>
=C2=A0do_configure () {<br>
-=C2=A0 =C2=A0 if [ -z &quot;${UBOOT_CONFIG}&quot; ]; then<br>
+=C2=A0 =C2=A0 if [ -n &quot;${UBOOT_CONFIG}&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unset i j<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for config in ${UBOOT_MACHINE}; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=3D$(expr $i + 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for type in ${UBOOT_CONFIG}; do<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 j=3D$(expr $j + 1)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $j -eq $i ]; =
then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KCON=
FIG_CONFIG=3D${S}/configs/${config%_*}_defconfig merge_config.sh -m ${S}/co=
nfigs/${config%_*}_defconfig ${@&quot; &quot;.join(find_cfgs(d))}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_r=
unmake -C ${S} O=3D${B}/${config} ${config}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset=C2=A0 j<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unset=C2=A0 i<br>
+=C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;${UBOOT_MACHINE}&quot; ]; t=
hen<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake -C ${S} O=3D${B}=
 ${UBOOT_MACHINE}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
@@ -114,7 +128,6 @@ do_compile () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0j=3D$(expr $j=
 + 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $j -eq $=
i ]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_r=
unmake -C ${S} O=3D${B}/${config} ${config}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0oe_runmake -C ${S} O=3D${B}/${config} ${UBOOT_MAKE_TARGET}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0for binary in ${UBOOT_BINARIES}; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0k=3D$(expr $k + 1);<br>
-- <br>
2.26.0<br>
<br>
</blockquote></div>

--00000000000000fedb05a59c4aee--
