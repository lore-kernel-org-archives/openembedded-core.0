Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web10.8928.1585661497482418126
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 06:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=aQcEE30x;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id 11so11098050ybj.11
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 06:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cmqui0xhxfkPZ4OxJ9jsyfw7K4Bk9G+slZ+Z0/ulN5Q=;
        b=aQcEE30xi9bhW+yWMurtQ4i2Cm7f3INyHK9kjoKew8m6AG0SBh7geDjp+xXYgutrvQ
         sA6YVk9tCG0bMe8B2n+MGSsy2dK8T1I91VyHioRHxFxpmxgizI2Gw6CRpX0+Vmj9EoBB
         7Ic1skExbLAIj4CdA+xU1IMugwJlosyFNa4C+CZsf/DU33HBpUnzYqvupuZlIq0XNXEv
         M3PssIhSzwJ0ks2bu3bwWU8DwIKlIu25lsMXtXL8udbynayxyqZX197/wPYo6XZuIZye
         4WVHSPTz9AlYp4H+rcMhvcYh3RsBe50sm11L9Zw9etMjZjOOe1yWXUmmC00AQWyK346W
         CMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cmqui0xhxfkPZ4OxJ9jsyfw7K4Bk9G+slZ+Z0/ulN5Q=;
        b=I4R8iCASoIW5aPPpVaYCR9oWhpZhDUGA4SPpQ3YEdJyONdcqVMrveiOoxya3g5vaJx
         S7X3gvVtYXD5+ZDo5iOe2BdjIIsCg+Fbzasyom5/FEe+qoSuiVXvpne0u5PpPAEI4uKg
         eEmllBm6gIZOl8MhGtWg/pE//K2qbuYU24+ANkYKUZX5TF2AeWRRHNPoZsWA1HpJv/ew
         AkRXCC7rDv+sVA+sapdSL+BNNWV+GwkU4dD3RYYp9/lNmqs+BUTvxJdcCXKfX1hNbzks
         T6/nPzunWNLxGdDKRLngGeumy2IO3iUtsFO3k38I1saASac3UULIn/yOPu7rX6RRzJYE
         j7Rw==
X-Gm-Message-State: ANhLgQ3EeB34wKdcvJsEWHvkReUlAHByfqiv3+36fd6Ck2mU0heMaZCw
	uBOUZjTwhTxe2/6R1G4Mpt+QrjsL6jw5dOb5Oy9s8w==
X-Google-Smtp-Source: ADFU+vv6TF2XNErmZlzXLcY9f81D+R9CKn9ZdthHljylZYU+HoaXfoCKX/PGvANI1FRqJZd06j/3gMip7Nbztd2pw4U=
X-Received: by 2002:a25:ccc3:: with SMTP id l186mr27757960ybf.454.1585661496455;
 Tue, 31 Mar 2020 06:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200331020114.25468-1-anibal.limon@linaro.org>
In-Reply-To: <20200331020114.25468-1-anibal.limon@linaro.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 31 Mar 2020 15:31:25 +0200
Message-ID: <CAP71WjwikNPRY8t6yP5zLLxGFyDQKCEzreYjYViBRVfw1knq4Q@mail.gmail.com>
Subject: Re: [PATCH] recipes-kernel/linux-firmware: Add qcom-sdm845 firmware package
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000003b0ac305a2269687"

--0000000000003b0ac305a2269687
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2020 at 4:01 AM An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro=
.org>
wrote:

> Contains the firmware for the modem and wireless in SDM845 platforms.
>

it is more than that, since that folder contains also the audio and compute
DSP firmware, so we should either say that , or not include them.


> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ---
>  meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.b=
b
> b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> index a7406e48de..3e03aafb6b 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> @@ -289,6 +289,7 @@ PACKAGES =3D+ "${PN}-ralink-license ${PN}-ralink \
>               ${PN}-qcom-license \
>               ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 \
>               ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 \
> +             ${PN}-qcom-sdm845 \
>               ${PN}-whence-license \
>               ${PN}-license \
>               "
> @@ -848,10 +849,12 @@ FILES_${PN}-qcom-venus-1.8 =3D
> "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
>  FILES_${PN}-qcom-venus-4.2 =3D
> "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
>  FILES_${PN}-qcom-adreno-a3xx =3D
> "${nonarch_base_libdir}/firmware/qcom/a300_*.fw
> ${nonarch_base_libdir}/firmware/a300_*.fw"
>  FILES_${PN}-qcom-adreno-a530 =3D
> "${nonarch_base_libdir}/firmware/qcom/a530*.*"
> +FILES_${PN}-qcom-sdm845 =3D "${nonarch_base_libdir}/firmware/qcom/sdm845=
/*"
>

I think we should be specific for the files we include, using the wildcard
means we don't control/know what we are packaging. We could do several
packages for qcom-sdm845-modem, qcom-sdm845-audio, qcom-sdm845-compute, ...
which would be ideal.. but i am not sure how appropriate this is for
oe-core. but for the other qcom firmware, we package them by 'feature' (see
above).

 RDEPENDS_${PN}-qcom-venus-1.8 =3D "${PN}-qcom-license"
>  RDEPENDS_${PN}-qcom-venus-4.2 =3D "${PN}-qcom-license"
>  RDEPENDS_${PN}-qcom-adreno-a3xx =3D "${PN}-qcom-license"
>  RDEPENDS_${PN}-qcom-adreno-a530 =3D "${PN}-qcom-license"
> +RDEPENDS_${PN}-qcom-sdm845 =3D "${PN}-qcom-license"
>
>  FILES_${PN}-liquidio =3D "${nonarch_base_libdir}/firmware/liquidio"
>
> --
> 2.26.0
>
>

--0000000000003b0ac305a2269687
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 31, 2020 at 4:01 AM An=C3=
=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@linaro.org">anibal.lim=
on@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Contains the firmware for the modem and wireless in SDM845 pla=
tforms.<br></blockquote><div><br></div><div>it is more than that, since tha=
t folder contains also the audio and compute DSP firmware, so we should eit=
her say that , or not include them.<br></div><div> <br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@li=
naro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_2=
0200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_20200122.bb=
</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-fir=
mware_20200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_2020=
0122.bb</a> b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-fi=
rmware_20200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_202=
00122.bb</a><br>
index a7406e48de..3e03aafb6b 100644<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-qcom-sdm845 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-whence-license \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-license \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
@@ -848,10 +849,12 @@ FILES_${PN}-qcom-venus-1.8 =3D &quot;${nonarch_base_l=
ibdir}/firmware/qcom/venus-1.8/*&quot;<br>
=C2=A0FILES_${PN}-qcom-venus-4.2 =3D &quot;${nonarch_base_libdir}/firmware/=
qcom/venus-4.2/*&quot;<br>
=C2=A0FILES_${PN}-qcom-adreno-a3xx =3D &quot;${nonarch_base_libdir}/firmwar=
e/qcom/a300_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw&quot;<br>
=C2=A0FILES_${PN}-qcom-adreno-a530 =3D &quot;${nonarch_base_libdir}/firmwar=
e/qcom/a530*.*&quot;<br>
+FILES_${PN}-qcom-sdm845 =3D &quot;${nonarch_base_libdir}/firmware/qcom/sdm=
845/*&quot;<br></blockquote><div><br></div><div>I think we should be specif=
ic for the files we include, using the wildcard means we don&#39;t control/=
know what we are packaging. We could do several packages for qcom-sdm845-mo=
dem, qcom-sdm845-audio, qcom-sdm845-compute, ... which would be ideal.. but=
 i am not sure how appropriate this is for oe-core. but for the other qcom =
firmware, we package them by &#39;feature&#39; (see above).<br></div><div> =
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0RDEPENDS_${PN}-qcom-venus-1.8 =3D &quot;${PN}-qcom-license&quot;<br>
=C2=A0RDEPENDS_${PN}-qcom-venus-4.2 =3D &quot;${PN}-qcom-license&quot;<br>
=C2=A0RDEPENDS_${PN}-qcom-adreno-a3xx =3D &quot;${PN}-qcom-license&quot;<br=
>
=C2=A0RDEPENDS_${PN}-qcom-adreno-a530 =3D &quot;${PN}-qcom-license&quot;<br=
>
+RDEPENDS_${PN}-qcom-sdm845 =3D &quot;${PN}-qcom-license&quot;<br>
<br>
=C2=A0FILES_${PN}-liquidio =3D &quot;${nonarch_base_libdir}/firmware/liquid=
io&quot;<br>
<br>
-- <br>
2.26.0<br>
<br>
</blockquote></div></div>

--0000000000003b0ac305a2269687--
