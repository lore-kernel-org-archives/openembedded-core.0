Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE6AC48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 14:41:50 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.21811.1708958502573753016
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 06:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=buXBcJWq;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-512f892500cso1153720e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 06:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708958501; x=1709563301; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FCRTABUHmZbJAZ2rUx8c/1C7eByfmSbAn3He6XeNsCM=;
        b=buXBcJWqGS3+i+7/0X92yURO/A12Hng4C8vEQDAB+7QpmaRy0LLZYwb8yROElTE1Ny
         vvD7oTeXLzo6V6rzlI2wvwdPSy73UJqghaoTLJ0Jq/OvirFfjwxA5wL3Yq3UWy13T5op
         w+4j7TxgmPrKDm7M0pGMO3i2hevLc9F6NGUjYzlGeYEWO3yZEaMxFdHxVpE4grDbkHgG
         WZKXiFIAH87KTCnFNeTTO4DedVprmLuG7IEICDBfqeQ+8etxxkYTKJDcMfwbb4ilkJKP
         +Ysr/4Ml7rPlCP82T4iGZgPfZwApfTwRPBTEYjiRtA7S12n2OJOCRQCJrknXaCs2GY6o
         Ceow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708958501; x=1709563301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCRTABUHmZbJAZ2rUx8c/1C7eByfmSbAn3He6XeNsCM=;
        b=mLYgHXrdttbEi89yu15Rd6GvwRbv/Tc6e+lLnTW6MmtYt0K2XWr+Qn5iZ2dpJgIr2F
         d2+zdHqY+ubQUcMcIVYvg/dnqGOznGDkfic9yjUf0hUchMm7uZ8RAN36Irt04SuIq9W+
         MMPhcZIxZO6quXjrGSFezhuJ5wYJU7eG27K5OpxKExriMGs9JtiAQcFpW3VY/qvlw/tW
         wKvoNk2nMpSFArZfSKXNPtQYR+fzGtznANh8L9JuLr5LHPAyBuWfMTfQCzeOBqzWoFvn
         bBHngQgQOrjDpCYT4g/VWA1GAdZBR4V/vLEKtirkTe3jSNsvT/OtqZY5xWraL3Byrtpc
         yruw==
X-Gm-Message-State: AOJu0Yy2GhP0r2UcSFWhBtMjE0HIZ4qG3Jg5m+qPkf/m29iGpiEcMZlN
	khaczPYF2e8kBQO2YEiwGnlXUqbdwFuDJ5iyyao3CrFRR7bVRlfVdI70xQt957ObnxqpnjoFYwg
	5KheYcRWvfBLaX5Kr7hL3acZTQ5g=
X-Google-Smtp-Source: AGHT+IHuXbZTYsAfK4Svb7WNKUDChN80mRgRHZnRysNfYCmZmLZMapxqBoJSebtkMBEFti2KW7kYubH+u9Jksf6by/c=
X-Received: by 2002:a05:6512:3e24:b0:512:fce4:327b with SMTP id
 i36-20020a0565123e2400b00512fce4327bmr2932721lfv.39.1708958500373; Mon, 26
 Feb 2024 06:41:40 -0800 (PST)
MIME-Version: 1.0
References: <20240226135531.281696-1-omatiush@cisco.com>
In-Reply-To: <20240226135531.281696-1-omatiush@cisco.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Feb 2024 15:41:29 +0100
Message-ID: <CANNYZj8jSOUBBGnpm_wESUy4tJ1fy2x4vM=VOUUytEeakXQg+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] curl: improve reproducibility
To: omatiush@cisco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000059c7dc061249e808"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 14:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196212

--00000000000059c7dc061249e808
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It=E2=80=99s better to separate the processing into its own function so you=
 don=E2=80=99t
have to copy paste it from target install.

Alex

On Mon 26. Feb 2024 at 14.55, Oleh Matiusha via lists.openembedded.org
<omatiush=3Dcisco.com@lists.openembedded.org> wrote:

> Nativesdk package contains host references in output packages.
> Remove them.
>
> Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
> ---
>  meta/recipes-support/curl/curl_7.85.0.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta/recipes-support/curl/curl_7.85.0.bb
> b/meta/recipes-support/curl/curl_7.85.0.bb
> index 1e71ed821e..2d60f9aba1 100644
> --- a/meta/recipes-support/curl/curl_7.85.0.bb
> +++ b/meta/recipes-support/curl/curl_7.85.0.bb
> @@ -110,6 +110,16 @@ do_install:append:class-target() {
>             ${D}${bindir}/curl-config
>  }
>
> +do_install:append:class-nativesdk() {
> +       # cleanup buildpaths from curl-config
> +       sed -i \
> +           -e 's,--sysroot=3D${STAGING_DIR_TARGET},,g' \
> +           -e 's,--with-libtool-sysroot=3D${STAGING_DIR_TARGET},,g' \
> +           -e 's|${DEBUG_PREFIX_MAP}||g' \
> +           -e 's|${@" ".join(d.getVar("DEBUG_PREFIX_MAP").split())}||g' =
\
> +           ${D}${bindir}/curl-config
> +}
> +
>  do_compile_ptest() {
>         oe_runmake test
>         oe_runmake -C ${B}/tests/server
> --
> 2.33.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196204):
> https://lists.openembedded.org/g/openembedded-core/message/196204
> Mute This Topic: https://lists.openembedded.org/mt/104582066/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000059c7dc061249e808
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It=E2=80=99s better to separate the processing into its o=
wn function so you don=E2=80=99t have to copy paste it from target install.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon 26. Feb=
 2024 at 14.55, Oleh Matiusha via <a href=3D"http://lists.openembedded.org"=
>lists.openembedded.org</a> &lt;omatiush=3D<a href=3D"mailto:cisco.com@list=
s.openembedded.org">cisco.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color=
:rgb(204,204,204)">Nativesdk package contains host references in output pac=
kages.<br>
Remove them.<br>
<br>
Signed-off-by: Oleh Matiusha &lt;<a href=3D"mailto:omatiush@cisco.com" targ=
et=3D"_blank">omatiush@cisco.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/curl/<a href=3D"http://curl_7.85.0.bb" rel=3D"no=
referrer" target=3D"_blank">curl_7.85.0.bb</a> | 10 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
<br>
diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_7.85.0.bb" re=
l=3D"noreferrer" target=3D"_blank">curl_7.85.0.bb</a> b/meta/recipes-suppor=
t/curl/<a href=3D"http://curl_7.85.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">curl_7.85.0.bb</a><br>
index 1e71ed821e..2d60f9aba1 100644<br>
--- a/meta/recipes-support/curl/<a href=3D"http://curl_7.85.0.bb" rel=3D"no=
referrer" target=3D"_blank">curl_7.85.0.bb</a><br>
+++ b/meta/recipes-support/curl/<a href=3D"http://curl_7.85.0.bb" rel=3D"no=
referrer" target=3D"_blank">curl_7.85.0.bb</a><br>
@@ -110,6 +110,16 @@ do_install:append:class-target() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${bindir}/curl-config<br>
=C2=A0}<br>
<br>
+do_install:append:class-nativesdk() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# cleanup buildpaths from curl-config<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,--sysroot=3D${STAGING_D=
IR_TARGET},,g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,--with-libtool-sysroot=
=3D${STAGING_DIR_TARGET},,g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s|${DEBUG_PREFIX_MAP}||g&=
#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s|${@&quot; &quot;.join(d=
.getVar(&quot;DEBUG_PREFIX_MAP&quot;).split())}||g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${bindir}/curl-config<br>
+}<br>
+<br>
=C2=A0do_compile_ptest() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake test<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -C ${B}/tests/server<br>
-- <br>
2.33.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#196204): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196204" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/196204</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104582066/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104582066/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000059c7dc061249e808--

