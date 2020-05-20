Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.3146.1589998851498834596
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 11:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uHxx7rRa;
 spf=pass (domain: linaro.org, ip: 209.85.221.68, mailfrom: anibal.limon@linaro.org)
Received: by mail-wr1-f68.google.com with SMTP id v12so4104396wrp.12
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2020 11:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b2oy2Ppxfp+fSXfdv208GdZtRiheoiCKcEBLkSCDSR8=;
        b=uHxx7rRaL+UuiZ1Seoa0XyKMjIyBk6vEYk6P0YlkWjk3QqKpB59P5Y5tI3SW4SZ6IL
         bjfsKEWdNchPD/XpHaqzUou7o6fn5Ldx/IBgM9qK25eeOeYWYpwAvWyVJXb27uouhRZj
         ulUnBbNZvXRchGoQ2wW+hRFw+3VRgQYV1ISFfGcbMtcmai2+3N9NLwC2QFcwJV0a8Buc
         jya6i42Wc39GgKFnLFZrnHN7kY94o0fZ3QlSYPyyb47GagaFj7ifZkt3au1pqSS/+WMG
         xbRXikP4+v8LmdIfGbDkq3KXgVxgB2Xx/DIsCO65n9TfOIb1+okv6lcqgGsR65ElXm04
         sEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b2oy2Ppxfp+fSXfdv208GdZtRiheoiCKcEBLkSCDSR8=;
        b=QQijKE9oFSfYPfZgpMSMdETMbapkLMa5yDIRQInuhtOj/zkxkfYbnQAcoqosUBoLA2
         RiQMa2KZYQKmzaW1ktFdNUyGIxJjOvPbEwT+o17PNsqPAW7j1DJY1FbJcv9oWoB1m/WF
         BcrcrIRMr6KrBI1M+rKiZvVAJpH2yfXTlA12iFie3Iewta0BmSkqSDkGlj/C5nQmvjnL
         JMoTEg0rti8Qt+n2ufuApWqhI0gPzXhseSIEHp/7xpeAEwOZZl/nM+Xo5DanB6D15/tq
         tZ+KyvW2P1QQRL1ns9+lm9Z8TdJzoLIf84v+aqqyBYvBj795CiB7TL0kC8L9EzW5AFfE
         xYFw==
X-Gm-Message-State: AOAM532ZV91U87+z5mH3cw+IzhlgqPoC5iAflmCsJKZCTVIBklDGW+3P
	7X5GlGQhTFwpDN0WDI1fCxW1zGVkv5iENf7BLjgyuA==
X-Google-Smtp-Source: ABdhPJwXPkX2e33QwYAfXEiUcp7LvyEetMkkZ5Cglw/Ghal5lSRKTtqw3ec7Pf41cc760L7XBFxh6nN00+1OH9DPYcw=
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr5111579wrt.411.1589998849863;
 Wed, 20 May 2020 11:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200520145859.622161-1-anibal.limon@linaro.org> <CAP71WjxM3Va90iMGhEPzohWrLRLZU2a8Co97Z7_1c6S9P6ct8A@mail.gmail.com>
In-Reply-To: <CAP71WjxM3Va90iMGhEPzohWrLRLZU2a8Co97Z7_1c6S9P6ct8A@mail.gmail.com>
From: "Anibal Limon" <anibal.limon@linaro.org>
Date: Wed, 20 May 2020 13:20:38 -0500
Message-ID: <CA+_Aqis4RBNYn8yWzwoPW2ULdHqg=-o3_axQ+PoLahhHqz397g@mail.gmail.com>
Subject: Re: [PATCH][dunfell 1/3] recipes-kernel/linux-firmware: Add wlanmdsp.mbn to qcom-modem package
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000a3ff1a05a61874f0"

--000000000000a3ff1a05a61874f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 20 May 2020 at 11:51, Nicolas Dechesne <nicolas.dechesne@linaro.org=
>
wrote:

>
> On Wed, May 20, 2020 at 4:59 PM An=C3=ADbal Lim=C3=B3n <anibal.limon@lina=
ro.org>
> wrote:
>
>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>>
>
> all you 3 patches are backports/cherry-picked, please show that in your
> new patches, e.g. git cherry-pick -x -s <commit>. it's much easier to
> review stable patches.
>

right, sending v2 ones...


>
>
>> ---
>>  meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/linux-firmware/
>> linux-firmware_20200122.bb b/meta/recipes-kernel/linux-firmware/
>> linux-firmware_20200122.bb
>> index 7173409e05..139307cda3 100644
>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
>> @@ -851,7 +851,7 @@ FILES_${PN}-qcom-adreno-a3xx =3D
>> "${nonarch_base_libdir}/firmware/qcom/a300_*.fw $
>>  FILES_${PN}-qcom-adreno-a530 =3D
>> "${nonarch_base_libdir}/firmware/qcom/a530*.*"
>>  FILES_${PN}-qcom-sdm845-audio =3D
>> "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
>>  FILES_${PN}-qcom-sdm845-compute =3D
>> "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
>> -FILES_${PN}-qcom-sdm845-modem =3D
>> "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn
>> ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.*"
>> +FILES_${PN}-qcom-sdm845-modem =3D
>> "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn
>> ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.*
>> ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
>>  RDEPENDS_${PN}-qcom-venus-1.8 =3D "${PN}-qcom-license"
>>  RDEPENDS_${PN}-qcom-venus-4.2 =3D "${PN}-qcom-license"
>>  RDEPENDS_${PN}-qcom-adreno-a3xx =3D "${PN}-qcom-license"
>> --
>> 2.26.2
>>
>>

--000000000000a3ff1a05a61874f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 20 May 2020 at 11:51, Nicolas=
 Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org">nicolas.deches=
ne@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, May 20, 2020 at 4:59 PM An=C3=ADbal Lim=C3=
=B3n &lt;<a href=3D"mailto:anibal.limon@linaro.org" target=3D"_blank">aniba=
l.limon@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mail=
to:anibal.limon@linaro.org" target=3D"_blank">anibal.limon@linaro.org</a>&g=
t;<br></blockquote><div><br></div><div>all you 3 patches are backports/cher=
ry-picked, please show that in your new patches, e.g. git cherry-pick -x -s=
 &lt;commit&gt;. it&#39;s much easier to review stable patches.</div></div>=
</div></blockquote><div><br></div><div>right, sending v2 ones...</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
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
</blockquote></div></div>

--000000000000a3ff1a05a61874f0--
