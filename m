Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com [209.85.219.195])
 by mx.groups.io with SMTP id smtpd.web11.1304.1589993480210254136
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 09:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=V5zm7YeP;
 spf=pass (domain: linaro.org, ip: 209.85.219.195, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f195.google.com with SMTP id a10so1315790ybc.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2020 09:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iMaZqM7A7g8UF1qo3wNM44CSnkRMk1UT3ayesLz/nPw=;
        b=V5zm7YeP1ax+boWJChvg1vIntnytPt/JXnjSljbnU8tfOyWUmdrjk1NcFdGX8TkwBE
         RhTQNfGel1KSfwQOPhpYVvTEAcqD3lSO/RSzTRVRNDHDQ8q4DoQk0dTlbrnah/LAvDzs
         C82BQCJgk/xsOdGESmLENzd51DsKRxYyfzNXlLm0DcGI05qXLlkcUddzXWNxFK7AwZZJ
         c8gRTT6DzfgWMGT7IoaQGg03M6Hs79/GasTl7hlQ206ALFPRZ8UcHF807ieqRVcLDZ/e
         MmqP5vasDu3J4J+gvHaz1fAfYqxK1uNjSOXDcFAu00MYzNRurPdc8tvJvdZNogINUfxi
         MYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iMaZqM7A7g8UF1qo3wNM44CSnkRMk1UT3ayesLz/nPw=;
        b=CUZgpf6aY/cBKvlVw+dJxnzcntFkgZyQSnL8szzCF6FEvxjur+EarQn69hNNgXmJqL
         wssZRgaSihrCD6utyoU0pFKS5mZKuBMuOIFVWCY9kZ6YBgHBjS3wnJ8XJK7JY5KGLAoQ
         NAbkjHratckijy3cDqMTi5Oz5s/p7cmQ+hzQ+6VUPY1LYuImZHidGt33GZOqyU+d1zmj
         JqOhFN/Rs4gSI6ysdgRRX1Sfv1AGD1tGgWdj2HUwUW8repItGLSm5imFXJUVOUVL5lZS
         A2koAEbq0VK5CAuImFXzlTlmc4AVPOXvnIqYv5lnOB5kZA9MIv7RikqEEv/DuHmg6gHQ
         1qdw==
X-Gm-Message-State: AOAM532/nqgXEQOFQ7jaXnmT1NhJ5OoOpr3KD4ifijwJjDCj2TYptm4f
	1/aW6Yl2+M2PiG0VKy5lQavcGQxUpFMgSwa3g8A5YA==
X-Google-Smtp-Source: ABdhPJx8LRAQZ8EjZVrGHHTO8iw++kZsQ3OkVLoLVUOZ9S2XLU+4tppeZ5rstle3Mn8gT/WeZE3XJLy5eD/M1RzUIW0=
X-Received: by 2002:a25:8b0c:: with SMTP id i12mr8705038ybl.371.1589993479205;
 Wed, 20 May 2020 09:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200520145859.622161-1-anibal.limon@linaro.org>
In-Reply-To: <20200520145859.622161-1-anibal.limon@linaro.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 20 May 2020 18:51:07 +0200
Message-ID: <CAP71WjxM3Va90iMGhEPzohWrLRLZU2a8Co97Z7_1c6S9P6ct8A@mail.gmail.com>
Subject: Re: [PATCH][dunfell 1/3] recipes-kernel/linux-firmware: Add wlanmdsp.mbn to qcom-modem package
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000860e2a05a61734be"

--000000000000860e2a05a61734be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 4:59 PM An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro=
.org>
wrote:

> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>

all you 3 patches are backports/cherry-picked, please show that in your new
patches, e.g. git cherry-pick -x -s <commit>. it's much easier to review
stable patches.


> ---
>  meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.b=
b
> b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> index 7173409e05..139307cda3 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> @@ -851,7 +851,7 @@ FILES_${PN}-qcom-adreno-a3xx =3D
> "${nonarch_base_libdir}/firmware/qcom/a300_*.fw $
>  FILES_${PN}-qcom-adreno-a530 =3D
> "${nonarch_base_libdir}/firmware/qcom/a530*.*"
>  FILES_${PN}-qcom-sdm845-audio =3D
> "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
>  FILES_${PN}-qcom-sdm845-compute =3D
> "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
> -FILES_${PN}-qcom-sdm845-modem =3D
> "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn
> ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.*"
> +FILES_${PN}-qcom-sdm845-modem =3D
> "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn
> ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.*
> ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
>  RDEPENDS_${PN}-qcom-venus-1.8 =3D "${PN}-qcom-license"
>  RDEPENDS_${PN}-qcom-venus-4.2 =3D "${PN}-qcom-license"
>  RDEPENDS_${PN}-qcom-adreno-a3xx =3D "${PN}-qcom-license"
> --
> 2.26.2
>
>

--000000000000860e2a05a61734be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, May 20, 2020 at 4:59 PM An=C3=ADbal Lim=C3=B3n &lt;<a hr=
ef=3D"mailto:anibal.limon@linaro.org">anibal.limon@linaro.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by:=
 An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@linaro.org" targ=
et=3D"_blank">anibal.limon@linaro.org</a>&gt;<br></blockquote><div><br></di=
v><div>all you 3 patches are backports/cherry-picked, please show that in y=
our new patches, e.g. git cherry-pick -x -s &lt;commit&gt;. it&#39;s much e=
asier to review stable patches.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
---<br>
=C2=A0meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_2=
0200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_20200122.bb=
</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-fir=
mware_20200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_2020=
0122.bb</a> b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-fi=
rmware_20200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_202=
00122.bb</a><br>
index 7173409e05..139307cda3 100644<br>
--- a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_2=
0200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_20200122.bb=
</a><br>
+++ b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_2=
0200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_20200122.bb=
</a><br>
@@ -851,7 +851,7 @@ FILES_${PN}-qcom-adreno-a3xx =3D &quot;${nonarch_base_l=
ibdir}/firmware/qcom/a300_*.fw $<br>
=C2=A0FILES_${PN}-qcom-adreno-a530 =3D &quot;${nonarch_base_libdir}/firmwar=
e/qcom/a530*.*&quot;<br>
=C2=A0FILES_${PN}-qcom-sdm845-audio =3D &quot;${nonarch_base_libdir}/firmwa=
re/qcom/sdm845/adsp*.*&quot;<br>
=C2=A0FILES_${PN}-qcom-sdm845-compute =3D &quot;${nonarch_base_libdir}/firm=
ware/qcom/sdm845/cdsp*.*&quot;<br>
-FILES_${PN}-qcom-sdm845-modem =3D &quot;${nonarch_base_libdir}/firmware/qc=
om/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.*&quot=
;<br>
+FILES_${PN}-qcom-sdm845-modem =3D &quot;${nonarch_base_libdir}/firmware/qc=
om/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${no=
narch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn&quot;<br>
=C2=A0RDEPENDS_${PN}-qcom-venus-1.8 =3D &quot;${PN}-qcom-license&quot;<br>
=C2=A0RDEPENDS_${PN}-qcom-venus-4.2 =3D &quot;${PN}-qcom-license&quot;<br>
=C2=A0RDEPENDS_${PN}-qcom-adreno-a3xx =3D &quot;${PN}-qcom-license&quot;<br=
>
-- <br>
2.26.2<br>
<br>
</blockquote></div></div>

--000000000000860e2a05a61734be--
