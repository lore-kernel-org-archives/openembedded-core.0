Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
 by mx.groups.io with SMTP id smtpd.web11.489.1585718284978437053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 22:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=id1UZkbr;
 spf=pass (domain: linaro.org, ip: 209.85.219.194, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f194.google.com with SMTP id g6so12510960ybh.12
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 22:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jwtp4kTu2kNzZZu517kWkDdmInDLNl94Fw/ZLW2BASI=;
        b=id1UZkbrRAy5kwoXHzclQ4NKhfxvhhPbPkF+oQi3bKiTHBhJu+mVCA6k+CQTNIzksX
         SBxJrVdxAJpMVVQzbeKggmz/+/UjIKFtZST+PRja5zEHGW2Fq6C8OkSM4JNRRIMzsdyk
         0WidUw32kO0mi+xRcU4nkDdOcnO1YXs07/v/lRji/k8NtvR6MiSKcDbzouAlu79X2S9r
         bmQ5BcGjNXMWHHXUKAfRz/jUDUBfPxN5zuf5Pwn6Hy0oTt43kDx126w0MbHnS7OqI7EK
         cjafun8ycRxJY9sX8GTx2wOC8WWtwPoC5RUmroBd1tnnxCH3dFIdVdqqhBjPQ0I7gKbl
         hhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jwtp4kTu2kNzZZu517kWkDdmInDLNl94Fw/ZLW2BASI=;
        b=bv97YUHDkFIKeskXva5rAUzoMJC4O1vTSpqCdVfs8uCe5zO88RqXL0T203uaUY1W/H
         l/hZ0PkZw0jHTOPgVte7hfHBnsnx9l3/cf+nghsTQ99BiVdM+W1iTOv0VItqQU6JUhwn
         UdXIgUOEWfyf4AbcEXmJTo2epGZ5TswgIXLai7AnvGV07pht8KkznpGNh/1iffx2TDtD
         GsAsoIV3AUuDYSej3xzWaHFkzWn6Dy/q8ZxNJYXUTYPqJ0uz660A+C07LdlTN0CZDbZU
         tKkBsFdwRmcOmTCPuYqLP+KBsBxpC4RgD+0JMyLwSPSj0GTz8fzuPyJNjQWEebKW4TWt
         FQmg==
X-Gm-Message-State: ANhLgQ0nsZfrRpgXSbM2qgp1Qa/ZgrekO21zWG4sePv+WsgabsdzHpYk
	ZJaSD48KiRUXoKe//VPbgPU5NTWoq0dmyLuNzDyQdQ==
X-Google-Smtp-Source: ADFU+vutspxD+1zv1CUvVFfkQS2vviJMXbaoKYBaVYynAqiAxIPRDzKlAQ5AyUJJOBpYvd/i2YwzoQHtSKdUAawm1F4=
X-Received: by 2002:a25:2d49:: with SMTP id s9mr36002503ybe.273.1585718284069;
 Tue, 31 Mar 2020 22:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200331202507.280778-1-anibal.limon@linaro.org>
In-Reply-To: <20200331202507.280778-1-anibal.limon@linaro.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 1 Apr 2020 07:17:53 +0200
Message-ID: <CAP71Wjy=b2JyeYtNgd81UjVzotiWuxJLvZ7EUHsLj0YR+-6+QQ@mail.gmail.com>
Subject: Re: [PATCHv2] recipes-kernel/linux-firmware: Add qcom-sdm845-{audio,compute,modem} firmware packages
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000009466505a233cf7e"

--00000000000009466505a233cf7e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2020 at 10:25 PM An=C3=ADbal Lim=C3=B3n <anibal.limon@linar=
o.org>
wrote:

> Contains the firmware for the audio, compute and modem/wireless in SDM845
> platforms.
>

thanks. it's better this way.

in case it helps:
Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>


>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ---
>  .../linux-firmware/linux-firmware_20200122.bb            | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.b=
b
> b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> index a7406e48de..7173409e05 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> @@ -289,6 +289,7 @@ PACKAGES =3D+ "${PN}-ralink-license ${PN}-ralink \
>               ${PN}-qcom-license \
>               ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 \
>               ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 \
> +             ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute
> ${PN}-qcom-sdm845-modem \
>               ${PN}-whence-license \
>               ${PN}-license \
>               "
> @@ -841,17 +842,23 @@ FILES_${PN}-qat-license   =3D
> "${nonarch_base_libdir}/firmware/LICENCE.qat_firmwar
>  FILES_${PN}-qat           =3D "${nonarch_base_libdir}/firmware/qat*.bin"
>  RDEPENDS_${PN}-qat        =3D "${PN}-qat-license"
>
> -# For QCOM VPU/GPU
> +# For QCOM VPU/GPU and SDM845
>  LICENSE_${PN}-qcom-license =3D "Firmware-qcom"
>  FILES_${PN}-qcom-license   =3D
> "${nonarch_base_libdir}/firmware/LICENSE.qcom
> ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
>  FILES_${PN}-qcom-venus-1.8 =3D
> "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
>  FILES_${PN}-qcom-venus-4.2 =3D
> "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
>  FILES_${PN}-qcom-adreno-a3xx =3D
> "${nonarch_base_libdir}/firmware/qcom/a300_*.fw
> ${nonarch_base_libdir}/firmware/a300_*.fw"
>  FILES_${PN}-qcom-adreno-a530 =3D
> "${nonarch_base_libdir}/firmware/qcom/a530*.*"
> +FILES_${PN}-qcom-sdm845-audio =3D
> "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
> +FILES_${PN}-qcom-sdm845-compute =3D
> "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
> +FILES_${PN}-qcom-sdm845-modem =3D
> "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn
> ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.*"
>  RDEPENDS_${PN}-qcom-venus-1.8 =3D "${PN}-qcom-license"
>  RDEPENDS_${PN}-qcom-venus-4.2 =3D "${PN}-qcom-license"
>  RDEPENDS_${PN}-qcom-adreno-a3xx =3D "${PN}-qcom-license"
>  RDEPENDS_${PN}-qcom-adreno-a530 =3D "${PN}-qcom-license"
> +RDEPENDS_${PN}-qcom-sdm845-audio =3D "${PN}-qcom-license"
> +RDEPENDS_${PN}-qcom-sdm845-compute =3D "${PN}-qcom-license"
> +RDEPENDS_${PN}-qcom-sdm845-modem =3D "${PN}-qcom-license"
>
>  FILES_${PN}-liquidio =3D "${nonarch_base_libdir}/firmware/liquidio"
>
> --
> 2.26.0
>
>

--00000000000009466505a233cf7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 31, 2020 at 10:25 PM An=
=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@linaro.org">anibal.=
limon@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Contains the firmware for the audio, compute and modem/wire=
less in SDM845 platforms.<br></blockquote><div><br></div><div>thanks. it&#3=
9;s better this way.</div><div><br></div><div>in case it helps:</div><div>R=
eviewed-by: Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.=
org">nicolas.dechesne@linaro.org</a>&gt;</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@li=
naro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
---<br>
=C2=A0.../linux-firmware/<a href=3D"http://linux-firmware_20200122.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-firmware_20200122.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 9 ++++++++-<br>
=C2=A01 file changed, 8 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-fir=
mware_20200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_2020=
0122.bb</a> b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-fi=
rmware_20200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_202=
00122.bb</a><br>
index a7406e48de..7173409e05 100644<br>
--- a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_2=
0200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_20200122.bb=
</a><br>
+++ b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_2=
0200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_20200122.bb=
</a><br>
@@ -289,6 +289,7 @@ PACKAGES =3D+ &quot;${PN}-ralink-license ${PN}-ralink \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-qcom-license \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-qcom-venus-1.8 ${PN}=
-qcom-venus-4.2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-qcom-adreno-a3xx ${P=
N}-qcom-adreno-a530 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-qcom-sdm845-audio ${=
PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-whence-license \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-license \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
@@ -841,17 +842,23 @@ FILES_${PN}-qat-license=C2=A0 =C2=A0=3D &quot;${nonar=
ch_base_libdir}/firmware/LICENCE.qat_firmwar<br>
=C2=A0FILES_${PN}-qat=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;${n=
onarch_base_libdir}/firmware/qat*.bin&quot;<br>
=C2=A0RDEPENDS_${PN}-qat=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;${PN}-qat-lic=
ense&quot;<br>
<br>
-# For QCOM VPU/GPU<br>
+# For QCOM VPU/GPU and SDM845<br>
=C2=A0LICENSE_${PN}-qcom-license =3D &quot;Firmware-qcom&quot;<br>
=C2=A0FILES_${PN}-qcom-license=C2=A0 =C2=A0=3D &quot;${nonarch_base_libdir}=
/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt&quot=
;<br>
=C2=A0FILES_${PN}-qcom-venus-1.8 =3D &quot;${nonarch_base_libdir}/firmware/=
qcom/venus-1.8/*&quot;<br>
=C2=A0FILES_${PN}-qcom-venus-4.2 =3D &quot;${nonarch_base_libdir}/firmware/=
qcom/venus-4.2/*&quot;<br>
=C2=A0FILES_${PN}-qcom-adreno-a3xx =3D &quot;${nonarch_base_libdir}/firmwar=
e/qcom/a300_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw&quot;<br>
=C2=A0FILES_${PN}-qcom-adreno-a530 =3D &quot;${nonarch_base_libdir}/firmwar=
e/qcom/a530*.*&quot;<br>
+FILES_${PN}-qcom-sdm845-audio =3D &quot;${nonarch_base_libdir}/firmware/qc=
om/sdm845/adsp*.*&quot;<br>
+FILES_${PN}-qcom-sdm845-compute =3D &quot;${nonarch_base_libdir}/firmware/=
qcom/sdm845/cdsp*.*&quot;<br>
+FILES_${PN}-qcom-sdm845-modem =3D &quot;${nonarch_base_libdir}/firmware/qc=
om/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.*&quot=
;<br>
=C2=A0RDEPENDS_${PN}-qcom-venus-1.8 =3D &quot;${PN}-qcom-license&quot;<br>
=C2=A0RDEPENDS_${PN}-qcom-venus-4.2 =3D &quot;${PN}-qcom-license&quot;<br>
=C2=A0RDEPENDS_${PN}-qcom-adreno-a3xx =3D &quot;${PN}-qcom-license&quot;<br=
>
=C2=A0RDEPENDS_${PN}-qcom-adreno-a530 =3D &quot;${PN}-qcom-license&quot;<br=
>
+RDEPENDS_${PN}-qcom-sdm845-audio =3D &quot;${PN}-qcom-license&quot;<br>
+RDEPENDS_${PN}-qcom-sdm845-compute =3D &quot;${PN}-qcom-license&quot;<br>
+RDEPENDS_${PN}-qcom-sdm845-modem =3D &quot;${PN}-qcom-license&quot;<br>
<br>
=C2=A0FILES_${PN}-liquidio =3D &quot;${nonarch_base_libdir}/firmware/liquid=
io&quot;<br>
<br>
-- <br>
2.26.0<br>
<br>
</blockquote></div></div>

--00000000000009466505a233cf7e--
