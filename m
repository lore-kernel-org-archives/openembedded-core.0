Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95953CD1293
	for <webhook@archiver.kernel.org>; Sat, 31 Aug 2024 02:22:39 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.510.1725070951606619667
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Aug 2024 19:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S5tbIMwp;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6b47ff8a59aso22916707b3.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 19:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725070951; x=1725675751; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wUmkptZLYql/Y1pTMKCNyGLWS5YIIOvTpi99LjYYKF0=;
        b=S5tbIMwpSyo/8riX/1U5kW6TLACfjj4nOrMh2xMEpbxUdgqQeZ/8mq5DW6nmjMouXb
         bJKIjGEwUHt3tMV45BSWr5iwdT9wZaSX0T1hr8+TIRYU8ZuzFdk//qbFF4Fk5mseMa31
         ZWxqMP/yDbEW5dbTGdSAq78V4l7puJ7x5kx7NRInxAsMH00T0+acX54nEyNpmR814PBo
         ZFxSHvNejxptj8Stbl9aMi+x5n+2SX2LrSOm4zSHMy9OJlKvdcS1e+8LVeOvUJ7noPZ6
         Z3TV29fn8fLHVGllo4pCaV3A483s2vlOvPbC/HUa4w6pxxbs/CSmF1kCpwlF8kxzSVuP
         mxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725070951; x=1725675751;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUmkptZLYql/Y1pTMKCNyGLWS5YIIOvTpi99LjYYKF0=;
        b=YdtYbURFkDYwoXbELqtruvx7CWocOSoDiO2RX3wjq1kN9vFGE9fkyGoz94sMu9G5lL
         3taw8x97ZA+oh6/KHT28MHEZoDfqdbKMAtRWom+E6Vm3NkT6hx+3hyftPeSqmdFiMM06
         pGDFz0nzVDhM1C0+IAc+aYAwzSstEE1ZK9DKgrfsHtLUhHnkIDeX4DL21XYh5UOOFHYF
         Po0aFxz2Z3W4fppnciznoOcfnnyM4xhltDZJ7SNETz21+RF39PJBoSAhtBRrv9MtP+it
         fqm5NWtpU7UKS/mNJXpC4yCfUHYwmKB6Ib/7Lzxdu8wl6b2XQ4P8+gYK/x5o72X9BwC+
         gxEQ==
X-Gm-Message-State: AOJu0YwvjrSplRhMUxD6ixh+SrB7EffqQ/SDDHywHiD9ej9x1Zl4rrzx
	5adHUVkcq7kv8DrgdZtAKdVsx3fuLo11MpAsJAZh1C+O5oUJ3HpHuVGj72nU+TOd87mt8tz+SJB
	6FvyxO+X4T9lr3ERKNmnDwFmITUU=
X-Google-Smtp-Source: AGHT+IHh4fMdJYurwr4eEMIJJpJink432hxiQJNOX+I1WPj3gF5ggR7ty8tXnIevZV4Lu5GUEGlG8HiD5Ghi1L355j4=
X-Received: by 2002:a05:690c:d83:b0:6ad:ba92:1731 with SMTP id
 00721157ae682-6d41119918bmr45120927b3.41.1725070950529; Fri, 30 Aug 2024
 19:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240830202137.1054805-1-alexander.sverdlin@siemens.com>
In-Reply-To: <20240830202137.1054805-1-alexander.sverdlin@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2024 22:22:17 -0400
Message-ID: <CADkTA4NRakyE2_uuORfxkxXmY2_OtCE9zMYsd3QE05tgAKxiyQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-fitimage: make signing failure fatal
To: alexander.sverdlin@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003803290620f161b9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Aug 2024 02:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203974

--0000000000003803290620f161b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 4:22=E2=80=AFPM A. Sverdlin via lists.openembedded.=
org
<alexander.sverdlin=3Dsiemens.com@lists.openembedded.org> wrote:

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>
> mkimage doesn't fail if it is not able to sign FIT nodes.
> This may lead to unbootable images in secure boot configurations.
> Make signing failures fatal by parsing the mkimage output.
>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
>  meta/classes-recipe/kernel-fitimage.bbclass | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass
> b/meta/classes-recipe/kernel-fitimage.bbclass
> index 67c98adb232..fea9e4e19a7 100644
> --- a/meta/classes-recipe/kernel-fitimage.bbclass
> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> @@ -753,11 +753,15 @@ fitimage_assemble() {
>         # Step 8: Sign the image
>         #
>         if [ "x${UBOOT_SIGN_ENABLE}" =3D "x1" ] ; then
> -               ${UBOOT_MKIMAGE_SIGN} \
> +               output=3D$(${UBOOT_MKIMAGE_SIGN} \
>                         ${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if
> len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
>                         -F -k "${UBOOT_SIGN_KEYDIR}" \
>                         -r ${KERNEL_OUTPUT_DIR}/$2 \
> -                       ${UBOOT_MKIMAGE_SIGN_ARGS}
> +                       ${UBOOT_MKIMAGE_SIGN_ARGS})
> +               echo "$output"
> +               if echo "$output" | grep -qE "Sign value:\s*unavailable";
> then
> +                       bbfatal "${UBOOT_MKIMAGE_SIGN}: Failed to provide
> some signatures"
>
Since you have the specific information available in the log, it should
either
be output as part of the fatal message, or the message should point to the
log file location.

Bruce



> +               fi
>         fi
>  }
>
> --
> 2.46.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203970):
> https://lists.openembedded.org/g/openembedded-core/message/203970
> Mute This Topic: https://lists.openembedded.org/mt/108186299/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000003803290620f161b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Aug 30, 2024 at 4:22=E2=80=AFPM A. Sverdlin=
 via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &=
lt;alexander.sverdlin=3D<a href=3D"mailto:siemens.com@lists.openembedded.or=
g">siemens.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">From: Alexander Sverdlin &lt;<a href=
=3D"mailto:alexander.sverdlin@siemens.com" target=3D"_blank">alexander.sver=
dlin@siemens.com</a>&gt;<br>
<br>
mkimage doesn&#39;t fail if it is not able to sign FIT nodes.<br>
This may lead to unbootable images in secure boot configurations.<br>
Make signing failures fatal by parsing the mkimage output.<br>
<br>
Signed-off-by: Alexander Sverdlin &lt;<a href=3D"mailto:alexander.sverdlin@=
siemens.com" target=3D"_blank">alexander.sverdlin@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel-fitimage.bbclass | 8 ++++++--<br>
=C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass<br>
index 67c98adb232..fea9e4e19a7 100644<br>
--- a/meta/classes-recipe/kernel-fitimage.bbclass<br>
+++ b/meta/classes-recipe/kernel-fitimage.bbclass<br>
@@ -753,11 +753,15 @@ fitimage_assemble() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Step 8: Sign the image<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;x${UBOOT_SIGN_ENABLE}&quot; =3D &quo=
t;x1&quot; ] ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${UBOOT_MKIMAGE_SIG=
N} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output=3D$(${UBOOT_=
MKIMAGE_SIGN} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${@&#39;-D &quot;${UBOOT_MKIMAGE_DTCOPTS}&quot;&#39; if len(&#39=
;${UBOOT_MKIMAGE_DTCOPTS}&#39;) else &#39;&#39;} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -F -k &quot;${UBOOT_SIGN_KEYDIR}&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -r ${KERNEL_OUTPUT_DIR}/$2 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${UBOOT_MKIMAGE_SIGN_ARGS}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${UBOOT_MKIMAGE_SIGN_ARGS})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$output&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if echo &quot;$outp=
ut&quot; | grep -qE &quot;Sign value:\s*unavailable&quot;; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bbfatal &quot;${UBOOT_MKIMAGE_SIGN}: Failed to provide some signa=
tures&quot;<br></blockquote><div><div class=3D"gmail_default" style=3D"font=
-size:small"></div><div class=3D"gmail_default" style=3D"font-size:small">S=
ince you have the specific information available in the log, it should eith=
er</div><div class=3D"gmail_default" style=3D"font-size:small">be output as=
 part of the fatal message, or the message should point to the</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">log file location.</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
-- <br>
2.46.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#203970): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/203970" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/203970</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108186299/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108186299/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--0000000000003803290620f161b9--

