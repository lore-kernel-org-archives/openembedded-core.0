Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF182C001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 14:57:56 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.19429.1691679474961872690
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 07:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=VFAacSph;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ba1e9b1fa9so15488281fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 07:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691679473; x=1692284273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W4Sd1AlYN+DBu30+xqMW/glua6AZR743X0BhGXUg2nU=;
        b=VFAacSphpfYz8nlct8UTqhC7vktYpeND4UnAmkI7jnMcxk6tE32km+uhp9dUTfr097
         C2SQaNN8O0ZbQrKGKRo1E6ay/9Z92RaluhQ/PupBodaIkFPPDR0RcX4zTpRbh7wdx0rI
         QGFV274D5J80HPR5wpIsHrG2rvVX/HMoWT6TDSIsoIA0psfrT8pJJGul/haw1h9G5YOp
         gA47Ebjj1vlNQtdKxL/8FvttqTlAOOt/LzstaAg8g9yrtWtULEbvGLUiuySWXZx8jIBB
         lv/QDsZS8CUvjeDl7/86mVCK0YqAQBwe/MCYybsqBK8oYCyYhXOp6vvNZlgC7GZreyMr
         teDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691679473; x=1692284273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4Sd1AlYN+DBu30+xqMW/glua6AZR743X0BhGXUg2nU=;
        b=Vy3tl+6QlBAEoFyVOET3LN6HoissthXnovZy7t7PkFYfZ2qEp3kLELa5yLpo1hdzjm
         NzUOlOS8PVrHGchVhlGi7HsfNQa+70lNuRhKs4x1pvv+PbIwGKHKHMg1d8OPvIzHH6he
         IArkfu5q9j3mipiK5qKvdJw9TvaqrDvIi2minBL+ftjJlpGIBDgHr/6M2ZqHqNdFGt5X
         MxJai8BHEeNWsd7/eb+SSrkczVqLDgiOtxHm57U8ati/YslWtKJIftcc9pT745cHUbUX
         /nVOaElU62mQtm44pDMWgugJDK8cqYklry/v0jcywemNsMKXHtwVRYTDXO+fuaIxha6S
         WyLA==
X-Gm-Message-State: AOJu0YxkxnZwQrJi8Ap4pLT87eEZ+sxed6dOiV+07UzWaTaUUR1WC48A
	vxoIqa5tFz/w7GUYP9SlOHnZBxe/yzdfW11iKy0=
X-Google-Smtp-Source: AGHT+IHXaTEYYG2vfUsZiFPQfp8SArEg/f93naTdgRjuz7Gjde0mTl/OhVK0Z9Vtcs208gVG3hYHy5pQMxGVKENBAH8=
X-Received: by 2002:a05:651c:231:b0:2b7:14d4:ce6d with SMTP id
 z17-20020a05651c023100b002b714d4ce6dmr2168932ljn.48.1691679472662; Thu, 10
 Aug 2023 07:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230810133450.237127-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230810133450.237127-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Aug 2023 16:57:41 +0200
Message-ID: <CANNYZj9AacW-XB2G-6sHQobui1LGBHUMQTxV5EU=7ordJayWQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] selftest/reproducible: Update config to match
 ongoing changes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000abd5c060292d2e2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 14:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185758

--0000000000000abd5c060292d2e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don=E2=80=99t follow i am afraid. How would having separate usr expose is=
sues
that merged usr would hide?

Alex

On Thu 10. Aug 2023 at 15.34, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> We can't have systemd here any longer without usrmerge. We don't really
> want to enable the latter since having separate usr will likely result in
> a class of reproducibility and host contamination issues that enabling it
> might hide.
>
> Also drop INHIBIT_PACKAGE_STRIP since we generally don't build with that
> and the debug binaries should be generated regardless. I suspect this
> is legacy from older issues.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py
> b/meta/lib/oeqa/selftest/cases/reproducible.py
> index 0f7e6eb376e..4c6ed4e4a50 100644
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -212,10 +212,9 @@ class ReproducibleTests(OESelftestTestCase):
>
>          config =3D textwrap.dedent('''\
>              PACKAGE_CLASSES =3D "{package_classes}"
> -            INHIBIT_PACKAGE_STRIP =3D "1"
>              TMPDIR =3D "{tmpdir}"
>              LICENSE_FLAGS_ACCEPTED =3D "commercial"
> -            DISTRO_FEATURES:append =3D ' systemd pam'
> +            DISTRO_FEATURES:append =3D ' pam'
>              USERADDEXTENSION =3D "useradd-staticids"
>              USERADD_ERROR_DYNAMIC =3D "skip"
>              USERADD_UID_TABLES +=3D "files/static-passwd"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185747):
> https://lists.openembedded.org/g/openembedded-core/message/185747
> Mute This Topic: https://lists.openembedded.org/mt/100663206/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000abd5c060292d2e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I don=E2=80=99t follow i am afraid. How would having sepa=
rate usr expose issues that merged usr would hide?</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu 10. Aug 2023 at 15.34, Richard P=
urdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.pur=
die@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">We can&#39=
;t have systemd here any longer without usrmerge. We don&#39;t really<br>
want to enable the latter since having separate usr will likely result in<b=
r>
a class of reproducibility and host contamination issues that enabling it<b=
r>
might hide.<br>
<br>
Also drop INHIBIT_PACKAGE_STRIP since we generally don&#39;t build with tha=
t<br>
and the debug binaries should be generated regardless. I suspect this<br>
is legacy from older issues.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/reproducible.py | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/s=
elftest/cases/reproducible.py<br>
index 0f7e6eb376e..4c6ed4e4a50 100644<br>
--- a/meta/lib/oeqa/selftest/cases/reproducible.py<br>
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py<br>
@@ -212,10 +212,9 @@ class ReproducibleTests(OESelftestTestCase):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config =3D textwrap.dedent(&#39;&#39;&#39=
;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PACKAGE_CLASSES =3D &quot;{=
package_classes}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INHIBIT_PACKAGE_STRIP =3D &quot;=
1&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TMPDIR =3D &quot;{tmpdir}&q=
uot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSE_FLAGS_ACCEPTED =3D =
&quot;commercial&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DISTRO_FEATURES:append =3D &#39;=
 systemd pam&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DISTRO_FEATURES:append =3D &#39;=
 pam&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0USERADDEXTENSION =3D &quot;=
useradd-staticids&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0USERADD_ERROR_DYNAMIC =3D &=
quot;skip&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0USERADD_UID_TABLES +=3D &qu=
ot;files/static-passwd&quot;<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#185747): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/185747" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/185747</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100663206/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100663206/1686489</a><br>
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

--0000000000000abd5c060292d2e2--

