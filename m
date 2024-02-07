Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AA5C4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 11:13:01 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.18123.1707304378907898271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 03:12:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mpluGxiX;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: uvv.mail@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc6db13f1abso445244276.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 03:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707304378; x=1707909178; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zSLg25dctXY0+gmmvdSiphJmKlT00gkY5iCxIsLTkfg=;
        b=mpluGxiXNA0EjpoT1xtWRfmnT+yc4QqlPBQKSuc8yOv9rUVVMHw2xMp/2J5rI0IHG1
         i27GYsF/S+pM8ogWfGhhQYr84Y01X7yM8haFnwExczIVEPS5Ra5Lmvg672CY4DnkvMMl
         /xJLV8P2cgITvc8xr2PM7Wn2BAU2bspfWgnKQqfk5/Z4O6v6h91nXiFSj0EJqbxZ4ZUu
         8s6vPLARYaCn8FuGqSUv7aaqzkF2Wnp7yF2aulZeTI9WR1Egtu6SUjHSM7yX8tbHTTGR
         pYW4IbXMQFPwA2oOS7VBQ1Qo9sI8+n4ZEM7uyYIAx4lfm87V2B9+VWgUku3GtcHGEqAs
         Y2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707304378; x=1707909178;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSLg25dctXY0+gmmvdSiphJmKlT00gkY5iCxIsLTkfg=;
        b=rQ86xQGJ/gGImX3pg05ovNkoFxaQDkDm3ynWb47NWYoKQ273jEH+1VGzFpWoJEjN5x
         gUmrHqNLTy+p3A8vIURSIUIrIPwhrrD5MyZAq+Mms3lvInbmlH867R1vdVYyNpq0G0GQ
         jW1OCfO6LhKvSwTfJ2UrOTQDZk5C97au3my1+Qo9oP9rn+m4r6T+40ahiStNRe/kKKbt
         EZ8HaFfbzdp12bguJPCbPDgm2f4phWkUVZwgF6KM/gj2VB1mwsObZb8pmEuogAZsjYUY
         iGTrcH04SI6cYyfTI9p5pNZ5o1G73L56YRRU3ukht1FMHUqBriyDhy8hO3+YV6t3x7TL
         LQ4w==
X-Gm-Message-State: AOJu0YzuP9jrprQq7SttUGV06uyCSTpmUdv5vDtncEdVq7CfYFknLHhq
	yzDJgYQz16WCw0RCEP3Yx+412FUcJJZoIQ7d769HBp1PUMXHRx2Ee5c+ePFcQl2REAanXdOqFpy
	eHBd30Qhmo9nNmwfNw/mt3zcESciwHyaPby8=
X-Google-Smtp-Source: AGHT+IHTGH3hISYG6iPRAwPH6PlmPsy8LEP6Q3gKiMIfQG+27pUPW7c+0Mw5vpVzSMMjMTL8v46z2w8AHfeII2QgJug=
X-Received: by 2002:a5b:604:0:b0:dc2:5674:b408 with SMTP id
 d4-20020a5b0604000000b00dc25674b408mr4188982ybq.57.1707304377917; Wed, 07 Feb
 2024 03:12:57 -0800 (PST)
MIME-Version: 1.0
References: <f5c320e4510ce97bc1e346103ef3f54cb70c5c01.1707118743.git.baruch@tkos.co.il>
In-Reply-To: <f5c320e4510ce97bc1e346103ef3f54cb70c5c01.1707118743.git.baruch@tkos.co.il>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
Date: Wed, 7 Feb 2024 12:12:47 +0100
Message-ID: <CAKHfEaiWBC2nQhxTp0Xs98xWpBy_rciCxYYNxKy0bevAjY50bA@mail.gmail.com>
Subject: Re: [PATCH] overlayfs: add missing closing parenthesis in selftest
To: Baruch Siach <baruch@tkos.co.il>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f825070610c8c6cd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 11:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195049

--000000000000f825070610c8c6cd
Content-Type: text/plain; charset="UTF-8"

Good catch, thanks.

Slava

On Mon, Feb 5, 2024, 08:39 Baruch Siach <baruch@tkos.co.il> wrote:

> Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
> b/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
> index 88c8998cf9ee..3b59e3761977 100644
> --- a/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
> +++ b/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
> @@ -18,5 +18,5 @@ do_install() {
>
>  FILES:${PN} += "\
>      ${exec_prefix} \
> -    ${sysconfdir \
> +    ${sysconfdir} \
>  "
> --
> 2.43.0
>
>

--000000000000f825070610c8c6cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Good catch, thanks.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Slava<br><br><div class=3D"gmail_quote" dir=3D"auto"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 5, 2024, 08:39 Baruch Siach =
&lt;<a href=3D"mailto:baruch@tkos.co.il" target=3D"_blank" rel=3D"noreferre=
r">baruch@tkos.co.il</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Cc: Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.com" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">uvv.mail@gmail.com</a>&gt;<br>
Signed-off-by: Baruch Siach &lt;<a href=3D"mailto:baruch@tkos.co.il" rel=3D=
"noreferrer noreferrer" target=3D"_blank">baruch@tkos.co.il</a>&gt;<br>
---<br>
=C2=A0meta-selftest/recipes-test/overlayfs-user/<a href=3D"http://overlayfs=
-user.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">overla=
yfs-user.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-selftest/recipes-test/overlayfs-user/<a href=3D"http://ov=
erlayfs-user.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank"=
>overlayfs-user.bb</a> b/meta-selftest/recipes-test/overlayfs-user/<a href=
=3D"http://overlayfs-user.bb" rel=3D"noreferrer noreferrer noreferrer" targ=
et=3D"_blank">overlayfs-user.bb</a><br>
index 88c8998cf9ee..3b59e3761977 100644<br>
--- a/meta-selftest/recipes-test/overlayfs-user/<a href=3D"http://overlayfs=
-user.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">overla=
yfs-user.bb</a><br>
+++ b/meta-selftest/recipes-test/overlayfs-user/<a href=3D"http://overlayfs=
-user.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">overla=
yfs-user.bb</a><br>
@@ -18,5 +18,5 @@ do_install() {<br>
<br>
=C2=A0FILES:${PN} +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${exec_prefix} \<br>
-=C2=A0 =C2=A0 ${sysconfdir \<br>
+=C2=A0 =C2=A0 ${sysconfdir} \<br>
=C2=A0&quot;<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div></div></div>

--000000000000f825070610c8c6cd--

