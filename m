Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFEFC636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 17:10:01 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web11.15768.1676567393467596866
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 09:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K9DV8vq3;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id m1so2594076vst.7
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 09:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WZJUMSQUDCwls5l/4LtRee0kuM82y+a4myB1rNGTuTY=;
        b=K9DV8vq3DNwLjpt9EcBCeEKLcKvEF6uWOZlQIUuQ7oWiZnlunjpIZbJtDO6yI1NxZ8
         dUrBze6B17gzeznvBJ8+FZCWTXpj7h2PZlA4lm8D107Iuf9dKjoZWk8VXCpysmtXXk0b
         m8S2D0Oof/1bKACPDeoVnq4E9q+SyaiUICdgLNGellhOtQ8rGLNkhdr4XFKpwiJdVmZf
         TcmvuyKwN5ARw5JmPU0So9DYuJeKBFZZnr4Y/ymTe9XI3UB1cV2MUNiHkCe9hKw9stwn
         tAmLKnQC//sSUIsJkFqLhWEF/Q+o44uuB/7QXXFpcdlciD/G//eJVC7zWHoLmFePbZP3
         pTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZJUMSQUDCwls5l/4LtRee0kuM82y+a4myB1rNGTuTY=;
        b=HxtxjHNCGmJ9n3h0//93b9idWiOqhsyGGx9mxo9JQ3qdpg9ncpEtfTyGfHgb6gLXgb
         /DDM775sSUDdje6qvNaNHV8SOojLnKLxLX1Bxn2WU8sOkIYYek1spmHS+wS5FXGExbMp
         owAOLHWc7YM7SzwuG0NWvn5VP4mGykuu/5ePTr1jxtJYg4Hp4rYCilOfUUjw0rhzwv20
         Mmp+Po6SilmKE5j3tjbPmtMZH0MwBk+/qQTk9bYy+JwHQ33819VcwTnDhK6b/r6rB5oy
         6xsqgErz9F6MpLKAcUAVkbXJIxceFBwzNvyqCGCHbKKZSQ2hbnSIbbrq6Kc7hE8wF0q8
         NqSw==
X-Gm-Message-State: AO0yUKXxpGdDAD2PbadsJNHlIUu8C7mTITlpNnDDsej5e98JHVLyrPXU
	Ne6ZNcphzhrYNWSTWQMvlauFOkCVE2LICQKXkpw=
X-Google-Smtp-Source: AK7set9niiTfCQIhKrDDA/6QfHnXq6RJUcv8E2Ul/4WbvWrz+w5J8ioHnx+dHVIwKzVdG3mTRO6DGePlATz3VsDjkZ0=
X-Received: by 2002:a05:6102:11f7:b0:3f0:be66:8037 with SMTP id
 e23-20020a05610211f700b003f0be668037mr1219899vsg.80.1676567392506; Thu, 16
 Feb 2023 09:09:52 -0800 (PST)
MIME-Version: 1.0
References: <20230216151005.3469200-1-ross.burton@arm.com> <20230216151005.3469200-3-ross.burton@arm.com>
In-Reply-To: <20230216151005.3469200-3-ross.burton@arm.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 16 Feb 2023 17:09:41 +0000
Message-ID: <CANPvuRkwMCmFUTCGGbPzmTRa-Q7VYROT9+YL8Y=e-n7y70RBsA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] python3-pytest: add BBCLASSEXTEND
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: multipart/alternative; boundary="000000000000df590805f4d443de"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 17:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177298

--000000000000df590805f4d443de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

Ross Burton <ross.burton@arm.com> escreveu no dia quinta, 16/02/2023 =C3=A0=
(s)
15:10:

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/python/python3-pytest_7.2.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-pytest_7.2.1.bb
> b/meta/recipes-devtools/python/python3-pytest_7.2.1.bb
> index 105b76a4a64..c7610d440c1 100644
> --- a/meta/recipes-devtools/python/python3-pytest_7.2.1.bb
> +++ b/meta/recipes-devtools/python/python3-pytest_7.2.1.bb
> @@ -11,7 +11,7 @@ DEPENDS +=3D "python3-setuptools-scm-native"
>
>  inherit update-alternatives pypi python_setuptools_build_meta
>
> -RDEPENDS:${PN}:class-target +=3D " \
> +RDEPENDS:${PN} +=3D " \
>

The commit title is not describing what has been done on the patch.

Jose

     ${PYTHON_PN}-atomicwrites \
>      ${PYTHON_PN}-attrs \
>      ${PYTHON_PN}-debugger \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177293):
> https://lists.openembedded.org/g/openembedded-core/message/177293
> Mute This Topic: https://lists.openembedded.org/mt/97007314/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000df590805f4d443de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Ross,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Ross Burton &lt;<a href=3D"mailto:ross.burton=
@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt; escreveu no dia qui=
nta, 16/02/2023 =C3=A0(s) 15:10:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burt=
on@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-pytest_7.2.1.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-pytest_7.2.1.bb</a> | 2 +-<=
br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-pytest_=
7.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest_7.2.1.bb</a> =
b/meta/recipes-devtools/python/<a href=3D"http://python3-pytest_7.2.1.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-pytest_7.2.1.bb</a><br>
index 105b76a4a64..c7610d440c1 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-pytest_7.2.1.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-pytest_7.2.1.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-pytest_7.2.1.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-pytest_7.2.1.bb</a><br>
@@ -11,7 +11,7 @@ DEPENDS +=3D &quot;python3-setuptools-scm-native&quot;<br=
>
<br>
=C2=A0inherit update-alternatives pypi python_setuptools_build_meta<br>
<br>
-RDEPENDS:${PN}:class-target +=3D &quot; \<br>
+RDEPENDS:${PN} +=3D &quot; \<br></blockquote><div><br></div><div>The commi=
t title is not describing what has been done on the patch.</div><div><br></=
div><div>Jose</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-atomicwrites \<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-attrs \<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-debugger \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#177293): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/177293" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/177293</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97007314/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97007314/5052612</a><br>
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
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div>

--000000000000df590805f4d443de--

