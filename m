Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE150C433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 09:14:07 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web09.8315.1651482837981696296
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 02:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o22n838U;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id t25so24215693lfg.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 02:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zMGG1zYjTEFE3r7Hp/6ZCEud/tpr6HZfUbANaVa8Ak8=;
        b=o22n838U3BcyP+AAVpN1b+hgkfzD03OU6fX8yCDYAT2dXW3attNaNjgM34VM4tWYUx
         4eNB1EZNvoNpOz++9I54MGuKGzOpA9TO3OncvY4WNq25vJ3pg/HaF1pn9kxPuPf1fnOj
         9BfV5MTwMjeMYmp3yBT3TR6ed7/ZtPdyS+SHoqWG6uFJYE4mNa9jUtD6CDMn5Fcd5JnU
         BhbfaRFhokJqsD94q5m0XbYhYoUy0wOEqaO/hwZDoPFlMeIDjId++FbirJeN36KpeRbh
         A5tT/TuhXsxMvOrHU+lDMCun4/B5TW7ZBlTjkFklRIK8vqUxOAai6zGJsK+mxXCyfJK2
         ocnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zMGG1zYjTEFE3r7Hp/6ZCEud/tpr6HZfUbANaVa8Ak8=;
        b=O9NQwh9FTjETfhZ0I2yP0ritz3qcleQmbpsUtV96Te4Z1OUHKkgpqiZYnTtiHm1+5x
         ls98/hI/1ysP3mY+320exbQCnG1b0UfU+uuXJASDn3mSBUxFJdj3iuKP7bBg4RLsOhtm
         sJ3fFTkWyLJENlayR7APpOFODybKG6FraJUf5bXRZ66OMZQ5kGBw1PAaXKuFjuBrTEyT
         WYZItWjdVEs0qerNWPtGs+xX9jDj8frJ0C/jOu/XU50fTKzFkzyUYmQWOkDxUohfQNAn
         nHZ+6gDUSZPSEAm7heskHemoeY5CX1BilH5/189StHpNTbKjjPp+eyjN7V8Qbkko9ZWs
         tD6A==
X-Gm-Message-State: AOAM5320enkePkxzmO3k5lVDqUFMTt4TUTiibQo3HtBOZVKaGXZvZt4K
	cZdhKoxyZKu/TKfh3uph4eBKMbjYRZ8wo7zji5A=
X-Google-Smtp-Source: 
 ABdhPJxe8614VEqKzGyr425H5qXLGMuWe+vq8Vti7+ttUSVWOpmtjjnuLSTVjsMU5nc1mVqik++PxYo6QiGDFtiw4DU=
X-Received: by 2002:a05:6512:128b:b0:472:5d58:5122 with SMTP id
 u11-20020a056512128b00b004725d585122mr5947562lfs.95.1651482836174; Mon, 02
 May 2022 02:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220502080851.40753-1-pgowda.cve@gmail.com>
In-Reply-To: <20220502080851.40753-1-pgowda.cve@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 2 May 2022 10:13:44 +0100
Message-ID: 
 <CANPvuRkaw7S+Exqn+TWUVeMt3vASGkhj=J9t0QyH2nHocUmUPA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: ptest: Add lib32-glibc-tests PROVIDES
To: Pgowda <pgowda.cve@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, rwmacleod@gmail.com
Content-Type: multipart/alternative; boundary="000000000000cd8aaa05de03cf1e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 09:14:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165163

--000000000000cd8aaa05de03cf1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pgowda,

Pgowda <pgowda.cve@gmail.com> escreveu no dia segunda, 2/05/2022 =C3=A0(s) =
09:09:

> While running lib32-glibc-tests, it fails with the following error
> as the recipe is not PROVIDED. BBCLASSEXTEND is cleaned in glibc-tests
> and is not able to recognize the multilibs.
>
> ERROR: Nothing PROVIDES 'lib32-glibc-tests'
>
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc-tests_2.35.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-tests_2.35.bb
> b/meta/recipes-core/glibc/glibc-tests_2.35.bb
> index 414f8660de..2515e98bb3 100644
> --- a/meta/recipes-core/glibc/glibc-tests_2.35.bb
> +++ b/meta/recipes-core/glibc/glibc-tests_2.35.bb
> @@ -18,7 +18,7 @@ python __anonymous() {
>         d.setVar("PROVIDES", "${PN} ${PN}-ptest")
>         d.setVar("RPROVIDES", "${PN} ${PN}-ptest")
>
> -       d.setVar("BBCLASSEXTEND", "")
> +#       d.setVar("BBCLASSEXTEND", "")
>

Why commenting? this line can be removed and the git will take care of
storing the change for future reference.

Jose


>         d.setVar("RRECOMMENDS", "")
>         d.setVar("SYSTEMD_SERVICE:nscd", "")
>         d.setVar("SYSTEMD_PACKAGES", "")
> --
> 2.35.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165161):
> https://lists.openembedded.org/g/openembedded-core/message/165161
> Mute This Topic: https://lists.openembedded.org/mt/90831085/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000cd8aaa05de03cf1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Pgowda,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Pgowda &lt;<a href=3D"mailto:pgowda.cve@gma=
il.com">pgowda.cve@gmail.com</a>&gt; escreveu no dia segunda, 2/05/2022 =C3=
=A0(s) 09:09:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Wh=
ile running lib32-glibc-tests, it fails with the following error<br>
as the recipe is not PROVIDED. BBCLASSEXTEND is cleaned in glibc-tests<br>
and is not able to recognize the multilibs.<br>
<br>
ERROR: Nothing PROVIDES &#39;lib32-glibc-tests&#39;<br>
<br>
Signed-off-by: pgowda &lt;<a href=3D"mailto:pgowda.cve@gmail.com" target=3D=
"_blank">pgowda.cve@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc-tests_2.35.bb" rel=3D=
"noreferrer" target=3D"_blank">glibc-tests_2.35.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc-tests_2.35.bb"=
 rel=3D"noreferrer" target=3D"_blank">glibc-tests_2.35.bb</a> b/meta/recipe=
s-core/glibc/<a href=3D"http://glibc-tests_2.35.bb" rel=3D"noreferrer" targ=
et=3D"_blank">glibc-tests_2.35.bb</a><br>
index 414f8660de..2515e98bb3 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc-tests_2.35.bb" rel=3D=
"noreferrer" target=3D"_blank">glibc-tests_2.35.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc-tests_2.35.bb" rel=3D=
"noreferrer" target=3D"_blank">glibc-tests_2.35.bb</a><br>
@@ -18,7 +18,7 @@ python __anonymous() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;PROVIDES&quot;, &quot;${PN} ${PN=
}-ptest&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;RPROVIDES&quot;, &quot;${PN} ${P=
N}-ptest&quot;)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;BBCLASSEXTEND&quot;, &quot;&quot=
;)<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;BBCLASSEXTEND&quot;, &quot;&quo=
t;)<br></blockquote><div><br></div><div>Why commenting? this line can be re=
moved and the git will take care of storing the change for future reference=
.</div><div><br></div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;RRECOMMENDS&quot;, &quot;&quot;)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;SYSTEMD_SERVICE:nscd&quot;, &quo=
t;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;SYSTEMD_PACKAGES&quot;, &quot;&q=
uot;)<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#165161): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/165161" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/165161</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90831085/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90831085/5052612</a><br>
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
 Quaresma</div></div></div></div>

--000000000000cd8aaa05de03cf1e--

