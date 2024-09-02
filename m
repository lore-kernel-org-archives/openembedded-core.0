Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BEFCD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 13:53:00 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.527.1725285177038904743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 06:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L6evzW4i;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2d8b96c18f0so968920a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 06:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725285176; x=1725889976; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6EPMd8WdJmzl5Dyj+xtHy4iiXm0g6kW9PUwjlVnReKE=;
        b=L6evzW4iXwMo3fJsU3fxCToVE2sG/BjK3JSyI7xM/Ns4hQgL7uXdR2sIV1lKvVtwMD
         1uneRnuFcr5+YIc2wGt7nMbTSe+HooQ3wier/8UhY0SW/pVWPuhInZ5YNeRIZ/Wszm+6
         zdMxOOE1hWkU81xOgGnHrgh0rk268Q9+VPP6946OpeC5usWH779T6Y8mmvWOiSVQEmO3
         6acEnV7uclXAfUi7zSquizUN8qaPVyjCMWCXHw+fzF+2lKFkdb+j+Q7RcfNYdxDcQt9+
         ubw2NFYSeCqs9sCgx1AD4Vw02eDgTvv7+Wg3WbJxmxP+jVq7BxlJb8SJulMb18txWoOu
         nYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725285176; x=1725889976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EPMd8WdJmzl5Dyj+xtHy4iiXm0g6kW9PUwjlVnReKE=;
        b=tTVFLc9BLNRRAng7gALeGig828LEUangsyrgblEW7t/uD3fXFJz3K3U+QosKx/7yVn
         CKf+6uxtOXgw7/Vp/jWH67B32ppGrqZZ9N2uzXijKAhmUhfyhsy/v4BqxmGEzFJnYjd0
         5jH+ukcjucTf1HJnCIMy/y/pgM7hifaJW2Ntk4WBaAe441oQZaV2EId/3o3EeFCdznP/
         8Nihi1vJLJ8tjk/2mL3qL18wbRbK3U/97gB8shrBz0nllyGuhV01jwqYN/e720iU3FkI
         ESExX42A+TKmw1Kxi8v398t15yKcuUI8Bci/2wmQNLbVtcdO5DP/F4tzLEIyq93AFFj6
         CvfA==
X-Gm-Message-State: AOJu0YyVv4dL9Zcd7amrvuVwHFc6W9LXJ3Fn3ZXZAoXr4bSO86zYRHyr
	ighsj4klaVp7P01gNdAudzTtxoZurPrHeUvrhSFPkGRmX8xX3yVTTWNrJFF7YpXaQ+BEJDdbiEX
	G2P52vjEJOMWZg6aYBbGho7n+mW4=
X-Google-Smtp-Source: AGHT+IEMubk4hxQxqkVtPuAwLl6eYeg9gC8xwZ/y0Fymyufxr0Jas8SHsM72u0p/aZWqOxV57UVuL1rBoLhkltI2AIk=
X-Received: by 2002:a17:90a:f18d:b0:2d8:f7e2:f03 with SMTP id
 98e67ed59e1d1-2d8f7e210e4mr1227690a91.32.1725285176070; Mon, 02 Sep 2024
 06:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240902114523.1168083-1-alexander.sverdlin@siemens.com>
In-Reply-To: <20240902114523.1168083-1-alexander.sverdlin@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 2 Sep 2024 09:52:44 -0400
Message-ID: <CADkTA4MWVM9ZF1-XbujSSp=EyBDuR2SbzqBhudDw+U+42WhR_w@mail.gmail.com>
Subject: Re: [PATCH v2] kernel-fitimage: make signing failure fatal
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000e5b250621234237"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 13:53:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204105

--0000000000000e5b250621234237
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 7:46=E2=80=AFAM A. Sverdlin <alexander.sverdlin@siem=
ens.com>
wrote:

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>
> mkimage doesn't fail if it is not able to sign FIT nodes.
> This may lead to unbootable images in secure boot configurations.
> Make signing failures fatal by parsing the mkimage output.
>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
> Changes in v2:
> - bbfatal -> bbfatal_log
>
>  meta/classes-recipe/kernel-fitimage.bbclass | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass
> b/meta/classes-recipe/kernel-fitimage.bbclass
> index 67c98adb232..cfda17f5e3b 100644
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
> +                       bbfatal_log "${UBOOT_MKIMAGE_SIGN}: Failed to
> provide some signatures"
>

This still is missing the details about the issue.

Either pointing to the log, or including the relevant bits of $output in
the error message
will save everyone a lot of time.

Bruce



> +               fi
>         fi
>  }
>
> --
> 2.46.0
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000000e5b250621234237
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Sep 2, 2024 at 7:46=E2=80=AFAM A. Sverdlin =
&lt;<a href=3D"mailto:alexander.sverdlin@siemens.com">alexander.sverdlin@si=
emens.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Alexander Sverdlin &lt;<a href=3D"mailto:alexander.sverdli=
n@siemens.com" target=3D"_blank">alexander.sverdlin@siemens.com</a>&gt;<br>
<br>
mkimage doesn&#39;t fail if it is not able to sign FIT nodes.<br>
This may lead to unbootable images in secure boot configurations.<br>
Make signing failures fatal by parsing the mkimage output.<br>
<br>
Signed-off-by: Alexander Sverdlin &lt;<a href=3D"mailto:alexander.sverdlin@=
siemens.com" target=3D"_blank">alexander.sverdlin@siemens.com</a>&gt;<br>
---<br>
Changes in v2:<br>
- bbfatal -&gt; bbfatal_log<br>
<br>
=C2=A0meta/classes-recipe/kernel-fitimage.bbclass | 8 ++++++--<br>
=C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass<br>
index 67c98adb232..cfda17f5e3b 100644<br>
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
=A0 =C2=A0bbfatal_log &quot;${UBOOT_MKIMAGE_SIGN}: Failed to provide some s=
ignatures&quot;<br></blockquote><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">This still is missing the details about the=
 issue.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Either pointing t=
o the log, or including the relevant bits of $output in the error message</=
div><div class=3D"gmail_default" style=3D"font-size:small">will save everyo=
ne a lot of time.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</=
div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
-- <br>
2.46.0<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--0000000000000e5b250621234237--

