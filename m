Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACDA7C67861
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 10:30:46 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web10.7873.1712313043617123278
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Apr 2024 03:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dk+jdQjN;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7e3b3e33ae2so608156241.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Apr 2024 03:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712313042; x=1712917842; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sSHAbdguKCNnYUn3qQjoWGAZjiPWNw8ceBycnR+dD+s=;
        b=dk+jdQjNithaT3rhsGWk7X+1aBIfESD0h+g2/95J+EI/Qbfs0JIj+bfEdINUcwAURN
         x6iDkj99U4gWgjbo3BDYBtAFa+cb4n5grCMxisdqaIaI2EDDv2oMAwrb19+UHR/sMyQd
         mTR/144g+HUv/q0cTocL8GtAmewofoR1PIAzHYmJlAdV+bkemqD2bL/utdg+AvmoRXxM
         uWnXEGmhjqRo5o/OW/PaxrNnl5MTvhdlOfWC9mIp8oZNNaq2Y7NLRUgGLZ3yLO5Hi+2Q
         vVO5pwn3bcUqCb+Go00NkdILYGa4hFmaHMK30CtY/R5kVObCmbPw77SsCqbELE/0UQMQ
         Wnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712313042; x=1712917842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSHAbdguKCNnYUn3qQjoWGAZjiPWNw8ceBycnR+dD+s=;
        b=oaI4JhaYLfGuJtUj+xwfNy2l+E4K1HeD9DavwfVs2oeb0QuMEUWVikukORkbcCYbaz
         lQCtsZI18is8Ff/sXo4SBW3coSThrMKYEYIX3JwtMertN03ajo42oKl1Vay5aB5dneXW
         eTpATmez9Wt25BCKDtL6N8ksE291thTwTfasU150ZF7k7GGa4FT34FZ2waBXhg0Pzhv2
         xIjg2mjgGfZqwAsP+kaJVPgS5ZwRepbz2R5W/AzjdXNtEvPeczZYBzr9/2eVY5AYvcgU
         c+uvIgVzPLAnRwq9La0mIuSiVptJplDoAaPSoOcZy/AL3dy3aSdYL2m+NwCL7wmiRRSn
         Tmew==
X-Gm-Message-State: AOJu0YxJ3JQKEN634Tzxc7eJqiL8pGEDWLA0L+N++DrZ3GWI9UvMtPwx
	AOoX6zdMloblK+ybeCuIwxEOYCHFLUBgYnyHJoBwmK7e9J777RKh8HIEDqUzsilmtAnmnNcad74
	nkU4D8QDnkvvHvqTLugk32dAqxdCji8ssixI=
X-Google-Smtp-Source: AGHT+IF0VbAdX6ON6nYOIj7nqpCXp7Ek9ozfKpcw9m+BvWLEnTGNm0vFBDo6sLFWjRyO7aSf/V8GjD20LfGJ8cRsu18=
X-Received: by 2002:a05:6102:162a:b0:475:fe59:f33 with SMTP id
 cu42-20020a056102162a00b00475fe590f33mr962693vsb.29.1712313040759; Fri, 05
 Apr 2024 03:30:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240405101030.3291928-1-omatiush@cisco.com>
In-Reply-To: <20240405101030.3291928-1-omatiush@cisco.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 5 Apr 2024 11:30:29 +0100
Message-ID: <CANPvuRmaccR5N7ousv2j5R_x-4zhKCD2o=peUYj_G7z4j8WKeQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] curl: improve reproducibility
To: omatiush@cisco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000089f46c061556f229"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Apr 2024 10:30:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197982

--00000000000089f46c061556f229
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleh,

I think your v2 was already merged on the master branch as well as the
others patches on the patchset.
https://git.yoctoproject.org/poky/commit/?id=3Dcabeed4e6d31fd798ab9dac0313b=
88a35d1d904d

Jose

Oleh Matiusha via lists.openembedded.org <omatiush=3D
cisco.com@lists.openembedded.org> escreveu (sexta, 5/04/2024 =C3=A0(s) 11:1=
0):

> nativesdk-curl package contains host references in output files.
> remove them.
>
> Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
> ---
> v2
>  - moved common code to separate function
> v3
>  - absolute path cleanup for all classes
> ---
> ---
>  meta/recipes-support/curl/curl_8.6.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/curl/curl_8.6.0.bb
> b/meta/recipes-support/curl/curl_8.6.0.bb
> index ea69164d76..003f3edf3f 100644
> --- a/meta/recipes-support/curl/curl_8.6.0.bb
> +++ b/meta/recipes-support/curl/curl_8.6.0.bb
> @@ -79,7 +79,7 @@ EXTRA_OECONF =3D " \
>      ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls
> mbedtls openssl', d) =3D=3D '') else ''} \
>  "
>
> -do_install:append:class-target() {
> +do_install:append() {
>         # cleanup buildpaths from curl-config
>         sed -i \
>             -e 's,--sysroot=3D${STAGING_DIR_TARGET},,g' \
> --
> 2.33.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197979):
> https://lists.openembedded.org/g/openembedded-core/message/197979
> Mute This Topic: https://lists.openembedded.org/mt/105345472/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000089f46c061556f229
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0<span style=3D"color:rgb(0,0,0)">Oleh,</span>=
</div><div><span style=3D"color:rgb(0,0,0)"><br></span></div><div><span sty=
le=3D"color:rgb(0,0,0)">I think your v2 was already merged on the master br=
anch as well as the others patches on the patchset.</span></div><div><div><=
a href=3D"https://git.yoctoproject.org/poky/commit/?id=3Dcabeed4e6d31fd798a=
b9dac0313b88a35d1d904d">https://git.yoctoproject.org/poky/commit/?id=3Dcabe=
ed4e6d31fd798ab9dac0313b88a35d1d904d</a><span style=3D"color:rgb(0,0,0)"><b=
r></span></div><br class=3D"gmail-Apple-interchange-newline"></div>Jose<div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Oleh =
Matiusha via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;omatiush=3D<a href=3D"mailto:cisco.com@lists.openembedded.org">c=
isco.com@lists.openembedded.org</a>&gt; escreveu (sexta, 5/04/2024 =C3=A0(s=
) 11:10):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">native=
sdk-curl package contains host references in output files.<br>
remove them.<br>
<br>
Signed-off-by: Oleh Matiusha &lt;<a href=3D"mailto:omatiush@cisco.com" targ=
et=3D"_blank">omatiush@cisco.com</a>&gt;<br>
---<br>
v2<br>
=C2=A0- moved common code to separate function <br>
v3<br>
=C2=A0- absolute path cleanup for all classes<br>
---<br>
---<br>
=C2=A0meta/recipes-support/curl/<a href=3D"http://curl_8.6.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">curl_8.6.0.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_8.6.0.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_8.6.0.bb</a> b/meta/recipes-support/=
curl/<a href=3D"http://curl_8.6.0.bb" rel=3D"noreferrer" target=3D"_blank">=
curl_8.6.0.bb</a><br>
index ea69164d76..003f3edf3f 100644<br>
--- a/meta/recipes-support/curl/<a href=3D"http://curl_8.6.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">curl_8.6.0.bb</a><br>
+++ b/meta/recipes-support/curl/<a href=3D"http://curl_8.6.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">curl_8.6.0.bb</a><br>
@@ -79,7 +79,7 @@ EXTRA_OECONF =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${@&#39;--without-ssl&#39; if (bb.utils.filter(&#39;PAC=
KAGECONFIG&#39;, &#39;gnutls mbedtls openssl&#39;, d) =3D=3D &#39;&#39;) el=
se &#39;&#39;} \<br>
=C2=A0&quot;<br>
<br>
-do_install:append:class-target() {<br>
+do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # cleanup buildpaths from curl-config<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s,--sysroot=3D${STAGING_D=
IR_TARGET},,g&#39; \<br>
-- <br>
2.33.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#197979): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/197979" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/197979</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105345472/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105345472/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div></div>

--00000000000089f46c061556f229--

