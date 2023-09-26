Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E510E7D27A
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 10:21:11 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web10.15765.1695723661650407768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 03:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KfrksnBi;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4526ae5b0b3so3480357137.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 03:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695723660; x=1696328460; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/0InHDKIe5c4zkx82Aj94zV4v2CWPk7uSddmQG6izRc=;
        b=KfrksnBi/Nl6KHb/B0NeAUrWBhY2kLp+TJmaXKluIIcm+fhuSJ1iv5uNB7Ab2ZfxRC
         gZJYfbnD0ffqw5Irur+feUv0Uvm0faE33e1rNQKINHp2fmNYPzq/kdmGq86N1M08JWIs
         8+oqW1FrXKUyxs0q3a4diaWltspRT/dGItcrY3vf/UmLUVBjMev3Z3o9oYExhLt0I9II
         jynPjtGbAF2L1JUWr9vxGr16rfgw+/lLUDEpyOHAt4R/0g9ppUF2kZitAcm3UDJMbu4f
         gfTl65dDaHmBB0EYcmnajhfz6quKM7wZqSka9c2UpPseJ7/rDCN6KX+6N032O4zHlM2u
         nKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695723660; x=1696328460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0InHDKIe5c4zkx82Aj94zV4v2CWPk7uSddmQG6izRc=;
        b=vw0XTcGd5oCbiZMO4kI/ER2zevd8kdtUVx/TtfgGT5DrUjWev/mpYheiPWqj7UkiXI
         xSkK8UeC4NxF2/zaMNGCG2tvLiZVHKp3WbmCsTRtZ51qdsHL11eakAc6zgjWiqg+r1P6
         XZG9GVdGA1YURJdkM9OkOg5yewHB59YGsG3Lzpb/vWSqTXi334NnvtwLr3h6fev+1lN/
         x2tMv+t4kTFQYPM29ZJrCGTR00n1JCR7eeRVYSqPETHWSKhVBjDYpxJWT29Dc/sYlEoP
         Q8k5L90zV6Nel8l8U3l+UJ4tjNx+yPR3Agr0kYnzlfegS1BJxxm+D62//aNeC6PBH/qC
         osMg==
X-Gm-Message-State: AOJu0Yzmxp7+l/Q8olepbZz6hLqueIC8TXQn+yWGXqTQszv5W6uln7PW
	ihp3WfYhmeynCHhYGucXE27DXKjxOpTFSLaxBKq/jHP6MPDjNg==
X-Google-Smtp-Source: AGHT+IHuAVmQkrmIGRVvC9izQ7ENg7Rf/ABH0UDv92JZiIhWsej+sQ2NpCf4YifryvJLYpy+5/2sgl5Tar9NBvXoiYs=
X-Received: by 2002:a05:6102:34c3:b0:44e:94b3:9253 with SMTP id
 a3-20020a05610234c300b0044e94b39253mr6230576vst.12.1695723660240; Tue, 26 Sep
 2023 03:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230926101529.3610385-1-Qi.Chen@windriver.com>
In-Reply-To: <20230926101529.3610385-1-Qi.Chen@windriver.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 26 Sep 2023 11:20:49 +0100
Message-ID: <CANPvuRm7DqwBRpOAvS_6P8rkP5AJBBsMySMCrHbyRJ9jcM4GLg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] oe-find-native-sysroot: avoid warning message
 messing things up
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000067ed210606406e70"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 10:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188243

--00000000000067ed210606406e70
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen,

I have raised this when it lands
https://lists.openembedded.org/g/openembedded-core/message/187378

Tested.by: Jose Quaresma <quaresma.jose@gmail.com>

Jose

Chen Qi via lists.openembedded.org <Qi.Chen=3D
windriver.com@lists.openembedded.org> escreveu no dia ter=C3=A7a, 26/09/202=
3
=C3=A0(s) 11:15:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> Add '-q' option to bitbake-getvar to avoid warning messages contaminating
> the actual result.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  scripts/oe-find-native-sysroot | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/oe-find-native-sysroot
> b/scripts/oe-find-native-sysroot
> index 6228efcbee..541318b461 100755
> --- a/scripts/oe-find-native-sysroot
> +++ b/scripts/oe-find-native-sysroot
> @@ -38,7 +38,7 @@ fi
>  # Global vars
>  set_oe_native_sysroot(){
>      echo "Getting sysroot..."
> -    OECORE_NATIVE_SYSROOT=3D$(bitbake-getvar -r $1 --value
> STAGING_DIR_NATIVE)
> +    OECORE_NATIVE_SYSROOT=3D$(bitbake-getvar -q -r $1 --value
> STAGING_DIR_NATIVE)
>  }
>
>  if [ "x$OECORE_NATIVE_SYSROOT" =3D "x" ]; then
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188242):
> https://lists.openembedded.org/g/openembedded-core/message/188242
> Mute This Topic: https://lists.openembedded.org/mt/101592501/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000067ed210606406e70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0<span style=3D"color:rgb(0,0,0)">Chen,<br></s=
pan><br>I have raised this when it lands</div><a href=3D"https://lists.open=
embedded.org/g/openembedded-core/message/187378" target=3D"_blank">https://=
lists.openembedded.org/g/openembedded-core/message/187378</a><br><br>Tested=
.by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com">quaresma.=
jose@gmail.com</a>&gt;<br><br><div>Jose<br><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">Chen Qi via <a href=3D"http://lists.op=
enembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;Qi.Chen=3D=
<a href=3D"mailto:windriver.com@lists.openembedded.org" target=3D"_blank">w=
indriver.com@lists.openembedded.org</a>&gt; escreveu no dia ter=C3=A7a, 26/=
09/2023 =C3=A0(s) 11:15:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" targe=
t=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
<br>
Add &#39;-q&#39; option to bitbake-getvar to avoid warning messages contami=
nating<br>
the actual result.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0scripts/oe-find-native-sysroot | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/oe-find-native-sysroot b/scripts/oe-find-native-sysroo=
t<br>
index 6228efcbee..541318b461 100755<br>
--- a/scripts/oe-find-native-sysroot<br>
+++ b/scripts/oe-find-native-sysroot<br>
@@ -38,7 +38,7 @@ fi<br>
=C2=A0# Global vars<br>
=C2=A0set_oe_native_sysroot(){<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;Getting sysroot...&quot;<br>
-=C2=A0 =C2=A0 OECORE_NATIVE_SYSROOT=3D$(bitbake-getvar -r $1 --value STAGI=
NG_DIR_NATIVE)<br>
+=C2=A0 =C2=A0 OECORE_NATIVE_SYSROOT=3D$(bitbake-getvar -q -r $1 --value ST=
AGING_DIR_NATIVE)<br>
=C2=A0}<br>
<br>
=C2=A0if [ &quot;x$OECORE_NATIVE_SYSROOT&quot; =3D &quot;x&quot; ]; then<br=
>
-- <br>
2.40.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#188242): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/188242" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/188242</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101592501/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101592501/5052612</a><br>
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

--00000000000067ed210606406e70--

