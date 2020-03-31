Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com [209.85.222.66])
 by mx.groups.io with SMTP id smtpd.web11.3435.1585681525965097409
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 12:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PFACoffC;
 spf=pass (domain: linaro.org, ip: 209.85.222.66, mailfrom: anibal.limon@linaro.org)
Received: by mail-ua1-f66.google.com with SMTP id z7so3724631uai.6
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 12:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y1Vx1L99J4ecFvzBknZI6Az/qOm4znxY/afuz/RLpp4=;
        b=PFACoffCNQcNWiIWHRBvV94yh74EBVXJv43VeLlvem52/OI8LXUbGvV8B1HMt8idOh
         AdfSs1s6NmVJRV7vyruOuEUOQqqJx+0vfI4Jxm0s2AIWmkrlfScO43GbbRAGVKqzWqh0
         0Wxm9ul4Wl1KMa5tG+VHLlbTHfOjgWDUs8KYzCiGKKtVMuCf0R+0UfTtaRdgY8faWJYL
         8tFUhCshV5mHG7BJ1DmMz3de7DXXH2gNlUqySQdMKOT2V/D4Olm7U4OgVtUM+UTjPHT3
         FU9RkCihx4GKZ0+VVdbKZsPzLzLv3K5Y5VJZHbfxctlftr3yfGDvOBMAQLM1p5/TWGFh
         FPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y1Vx1L99J4ecFvzBknZI6Az/qOm4znxY/afuz/RLpp4=;
        b=NEfbPvAXsTh0gU5N3X3tLvOtsxu1NPrPJjJCQNSFyEBZB8jQUFD10dmIChveC5ntd7
         neq8reRKA10I504jsgd/aPVSCxCRpDryiSXXik8UlIh4M5ZINnokgOMoevzEO5+Q7aVi
         ncJZCv53UuGcanXWWQkl0vF+bcyK9eoCb/UtKTkVUyAy58n5YMfNMYq+f7QhChoIxbEL
         wtquZrSVBsV6N1zkdIzXglELaCK/8OFyYWaVjPpoQ2LJ1G6/hGJaWfBUS8u/JBD5yxtR
         5bauTASA+x18ujTlZTN6C0PzaEtjY9MIk3fFgQsOGp71o+5aaaq98RQozbytO86vAa47
         yN1g==
X-Gm-Message-State: AGi0PuYai2avnvLQWZNIM1dL5TuOtzDZYJB4UEMRtzbYuF48VG5urlKB
	p826rPb4jd75w2+9MnIyobXAzBpan9BAU4Er7Bf64g==
X-Google-Smtp-Source: APiQypLPwoEsgQjcHcSoTNJPFHQ8pMWlBPEV9sJ0Ex3zE/GlJ1njlmkt2bZxtnyds40chc+4br8PunOqcvSkvA6Iw/I=
X-Received: by 2002:ab0:288d:: with SMTP id s13mr12594935uap.39.1585681524934;
 Tue, 31 Mar 2020 12:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200331020114.25468-1-anibal.limon@linaro.org> <CAP71WjwikNPRY8t6yP5zLLxGFyDQKCEzreYjYViBRVfw1knq4Q@mail.gmail.com>
In-Reply-To: <CAP71WjwikNPRY8t6yP5zLLxGFyDQKCEzreYjYViBRVfw1knq4Q@mail.gmail.com>
From: "Anibal Limon" <anibal.limon@linaro.org>
Date: Tue, 31 Mar 2020 13:05:13 -0600
Message-ID: <CA+_AqivP3f6akWudAP7HaTZ-aAGUnPpt1_c+qHMzTMKXtVm88w@mail.gmail.com>
Subject: Re: [PATCH] recipes-kernel/linux-firmware: Add qcom-sdm845 firmware package
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000006d35905a22b4063"

--00000000000006d35905a22b4063
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 31 Mar 2020 at 07:31, Nicolas Dechesne <nicolas.dechesne@linaro.org=
>
wrote:

>
>
> On Tue, Mar 31, 2020 at 4:01 AM An=C3=ADbal Lim=C3=B3n <anibal.limon@lina=
ro.org>
> wrote:
>
>> Contains the firmware for the modem and wireless in SDM845 platforms.
>>
>
> it is more than that, since that folder contains also the audio and
> compute DSP firmware, so we should either say that , or not include them.
>
>
>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>> ---
>>  meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-kernel/linux-firmware/
>> linux-firmware_20200122.bb b/meta/recipes-kernel/linux-firmware/
>> linux-firmware_20200122.bb
>> index a7406e48de..3e03aafb6b 100644
>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
>> @@ -289,6 +289,7 @@ PACKAGES =3D+ "${PN}-ralink-license ${PN}-ralink \
>>               ${PN}-qcom-license \
>>               ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 \
>>               ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 \
>> +             ${PN}-qcom-sdm845 \
>>               ${PN}-whence-license \
>>               ${PN}-license \
>>               "
>> @@ -848,10 +849,12 @@ FILES_${PN}-qcom-venus-1.8 =3D
>> "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
>>  FILES_${PN}-qcom-venus-4.2 =3D
>> "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
>>  FILES_${PN}-qcom-adreno-a3xx =3D
>> "${nonarch_base_libdir}/firmware/qcom/a300_*.fw
>> ${nonarch_base_libdir}/firmware/a300_*.fw"
>>  FILES_${PN}-qcom-adreno-a530 =3D
>> "${nonarch_base_libdir}/firmware/qcom/a530*.*"
>> +FILES_${PN}-qcom-sdm845 =3D "${nonarch_base_libdir}/firmware/qcom/sdm84=
5/*"
>>
>
> I think we should be specific for the files we include, using the wildcar=
d
> means we don't control/know what we are packaging. We could do several
> packages for qcom-sdm845-modem, qcom-sdm845-audio, qcom-sdm845-compute, .=
..
> which would be ideal.. but i am not sure how appropriate this is for
> oe-core. but for the other qcom firmware, we package them by 'feature' (s=
ee
> above).
>

Right, better to have a split of firmware by feature, I will send a v2.

Anibal

>
>  RDEPENDS_${PN}-qcom-venus-1.8 =3D "${PN}-qcom-license"
>>  RDEPENDS_${PN}-qcom-venus-4.2 =3D "${PN}-qcom-license"
>>  RDEPENDS_${PN}-qcom-adreno-a3xx =3D "${PN}-qcom-license"
>>  RDEPENDS_${PN}-qcom-adreno-a530 =3D "${PN}-qcom-license"
>> +RDEPENDS_${PN}-qcom-sdm845 =3D "${PN}-qcom-license"
>>
>>  FILES_${PN}-liquidio =3D "${nonarch_base_libdir}/firmware/liquidio"
>>
>> --
>> 2.26.0
>>
>>

--00000000000006d35905a22b4063
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, 31 Mar 2020 at 07:31, Nicolas=
 Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org">nicolas.deches=
ne@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 31, 2020 at =
4:01 AM An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@linaro.or=
g" target=3D"_blank">anibal.limon@linaro.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Contains the firmware for the m=
odem and wireless in SDM845 platforms.<br></blockquote><div><br></div><div>=
it is more than that, since that folder contains also the audio and compute=
 DSP firmware, so we should either say that , or not include them.<br></div=
><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
firmware, we package them by &#39;feature&#39; (see above).<br></div></div>=
</div></blockquote><div><br></div><div>Right, better to have a split of fir=
mware by feature, I will send a v2.</div><div><br></div><div>Anibal</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div></div><div> <br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
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
</blockquote></div></div>

--00000000000006d35905a22b4063--
