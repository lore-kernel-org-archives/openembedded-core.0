Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F94C4708B
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web12.23290.1649631924024142415
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 16:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Jhdrshpi;
 spf=pass (domain: gmail.com, ip: 209.85.208.170,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id r2so2728556ljd.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 16:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QOCekqqy9HbPZm+NfnPenVRJEWRnvFylaONEVfBZjoQ=;
        b=Jhdrshpi20DpMJwSdUWTvnMbgALTghgLfJqBVEnom2EKn+AgG4RR0loqLnkxRTjMi3
         4rwvv4sB+jFBjmvKxTxMexq1VECNu2u14KHv/VyMtWTHF1P60YUTsNCpVUnvXjkoQmf8
         SQO4N/sP53FhkNi4y0dzRFdl24tofp3byp2M+Re8ZS1nQEhasLed0yCmaG+sfxVF0fm5
         QB6g1CI5zCGfm1OxT86P0WYG4OkAsv0CJpATEY4Zc77+2f4M3m+XqVoapamHR5WlDFuO
         1qI0s9milyWtphh4ZS6cJQjL715/Y3x1QxVV7CKjdRql9+cLruvXbhXgbNHsgKNTTcaY
         r87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QOCekqqy9HbPZm+NfnPenVRJEWRnvFylaONEVfBZjoQ=;
        b=nP37PFfvygrKPrNyi+eJKHaqsQXsoyP/f6KivPygtOGCQP2sYU6HY79yv19rMdYEKJ
         8IrtqA3DZ/qQnFbqgjSif9XOQkNqOyTZPKVfj/lrT/j5eHhPXs6ozRdr6y+ta/4PpcSD
         mVNpH9sjtZUbx2wRllZS0ADVF/zF0/egzbwnN3HMFGcD480kILe7vxQRVjFTf5UCHhAL
         yJmpQqA51SOLtewEVFh6nVZzBW+yeOFagvWoDoL5Gg6CHkGBfg/JUaUf2n0i9uab7bkH
         ra2bZ/BpdPIzk4y1Jx5CBrFilx/l9bL9ZfXqB0OM8aRc7l/78ZKJn/yx8XBoeoqUDY9u
         ctQg==
X-Gm-Message-State: AOAM531vLnq0F1owzHaZOOH2Fc3DxCwXxgVoi9u9yLN1QMxglKpq2mu/
	qslIbCCgkSzTMqw8HNFriJJf5T5SA3wYVtMWitc=
X-Google-Smtp-Source: 
 ABdhPJwmfCL42tz1HtJiaHWSkefnNj2pf502d77/XUybdZcRyTBufAykt+UpU814Nf6orG02maKLBxRgwV9RZh74r/g=
X-Received: by 2002:a05:651c:32e:b0:24a:fc18:723d with SMTP id
 b14-20020a05651c032e00b0024afc18723dmr18068693ljp.216.1649631922214; Sun, 10
 Apr 2022 16:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220410180721.1101347-1-raj.khem@gmail.com>
In-Reply-To: <20220410180721.1101347-1-raj.khem@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 11 Apr 2022 00:05:11 +0100
Message-ID: 
 <CANPvuR=grgNBXKQO_9te6DJGLAB8hvEeWV6pnw+ujOsk_+-E9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] libarchive: Upgrade to 2.6.1
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bbdae005dc54dc8d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164208

--000000000000bbdae005dc54dc8d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

nitpik in the version on the commit title:
-2.6.1
+3.6.1

Jose


Khem Raj <raj.khem@gmail.com> escreveu no dia domingo, 10/04/2022 =C3=A0(s)
19:07:

> Changes in this release [1]
>
> [1] https://github.com/libarchive/libarchive/releases/tag/v3.6.1
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../libarchive/{libarchive_3.6.0.bb =3D> libarchive_3.6.1.bb}     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-extended/libarchive/{libarchive_3.6.0.bb =3D>
> libarchive_3.6.1.bb} (96%)
>
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.0.bb
> b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
> similarity index 96%
> rename from meta/recipes-extended/libarchive/libarchive_3.6.0.bb
> rename to meta/recipes-extended/libarchive/libarchive_3.6.1.bb
> index f078c8ad03e..c795b416289 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.6.0.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
> @@ -35,7 +35,7 @@ EXTRA_OECONF +=3D "--enable-largefile"
>  SRC_URI =3D "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
>  UPSTREAM_CHECK_URI =3D "http://libarchive.org/"
>
> -SRC_URI[sha256sum] =3D
> "a36613695ffa2905fdedc997b6df04a3006ccfd71d747a339b78aa8412c3d852"
> +SRC_URI[sha256sum] =3D
> "c676146577d989189940f1959d9e3980d28513d74eedfbc6b7f15ea45fe54ee2"
>
>  inherit autotools update-alternatives pkgconfig
>
> --
> 2.35.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164205):
> https://lists.openembedded.org/g/openembedded-core/message/164205
> Mute This Topic: https://lists.openembedded.org/mt/90378968/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000bbdae005dc54dc8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Khem,<div><br></div><div>nitpik in the version on =
the commit title:</div><div>-2.6.1</div><div>+3.6.1<br><div><br></div></div=
><div>Jose</div><div><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com">raj.khem@gmail.com</a>&gt; escreveu no dia domingo, 10/04/2022 =C3=
=A0(s) 19:07:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Ch=
anges in this release [1]<br>
<br>
[1] <a href=3D"https://github.com/libarchive/libarchive/releases/tag/v3.6.1=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/libarchive/libarc=
hive/releases/tag/v3.6.1</a><br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../libarchive/{<a href=3D"http://libarchive_3.6.0.bb" rel=3D"norefer=
rer" target=3D"_blank">libarchive_3.6.0.bb</a> =3D&gt; <a href=3D"http://li=
barchive_3.6.1.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.6.1.bb=
</a>}=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-extended/libarchive/{<a href=3D"http://libarchive=
_3.6.0.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.6.0.bb</a> =3D=
&gt; <a href=3D"http://libarchive_3.6.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">libarchive_3.6.1.bb</a>} (96%)<br>
<br>
diff --git a/meta/recipes-extended/libarchive/<a href=3D"http://libarchive_=
3.6.0.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.6.0.bb</a> b/me=
ta/recipes-extended/libarchive/<a href=3D"http://libarchive_3.6.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libarchive_3.6.1.bb</a><br>
similarity index 96%<br>
rename from meta/recipes-extended/libarchive/<a href=3D"http://libarchive_3=
.6.0.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.6.0.bb</a><br>
rename to meta/recipes-extended/libarchive/<a href=3D"http://libarchive_3.6=
.1.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.6.1.bb</a><br>
index f078c8ad03e..c795b416289 100644<br>
--- a/meta/recipes-extended/libarchive/<a href=3D"http://libarchive_3.6.0.b=
b" rel=3D"noreferrer" target=3D"_blank">libarchive_3.6.0.bb</a><br>
+++ b/meta/recipes-extended/libarchive/<a href=3D"http://libarchive_3.6.1.b=
b" rel=3D"noreferrer" target=3D"_blank">libarchive_3.6.1.bb</a><br>
@@ -35,7 +35,7 @@ EXTRA_OECONF +=3D &quot;--enable-largefile&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://libarchive.org/downloads/libarchi=
ve-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://libarchive=
.org/downloads/libarchive-${PV}.tar.gz</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://libarchive.org/" rel=
=3D"noreferrer" target=3D"_blank">http://libarchive.org/</a>&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;a36613695ffa2905fdedc997b6df04a3006ccfd71d747=
a339b78aa8412c3d852&quot;<br>
+SRC_URI[sha256sum] =3D &quot;c676146577d989189940f1959d9e3980d28513d74eedf=
bc6b7f15ea45fe54ee2&quot;<br>
<br>
=C2=A0inherit autotools update-alternatives pkgconfig<br>
<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#164205): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/164205" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/164205</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90378968/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90378968/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div>

--000000000000bbdae005dc54dc8d--

