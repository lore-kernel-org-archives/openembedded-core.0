Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9A1C63797
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 10:33:57 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.163492.1673865236471771388
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 02:33:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hG4xGtzS;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id j34-20020a05600c1c2200b003da1b054057so7546515wms.5
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 02:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8pqGoJ9qK9saYMRUtmRFHbdPXfP2KbuFcBlgpRmfdq0=;
        b=hG4xGtzSGaOrW8HutNJ6rk9p55gIyRXhJOS199QaWaC5GOT+g4K64763IzyPQDc/fg
         a+hIJC69RheK6Hk3vrh/FxfKXWD0LvMxYXkXkpFIkkouCw2NF/YffkbHRVPhGWndwSBs
         cWMRzIKcnMN93TwNjMIbsa4kkStgLdjSlOykc/udTcC4W/ioMnCvCyaQNs2C4LgCO+E/
         SJfQmHEJjLewAPlhhUTDPlLGiBveZXj0eGgvgNbeblrE2LXTV8VWjc3BOaAtspjwovxm
         kJ+hRYcNx9fc04UxXEH+X8f8B9H0lqLAElhvaQRrYzsZtUHXyyQiNLanzK3jd8PqCogS
         rmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pqGoJ9qK9saYMRUtmRFHbdPXfP2KbuFcBlgpRmfdq0=;
        b=bUFfDFwjh48ILK9dK5C7hrE0s4Skproie9s7o2+0zGsDEToRjng42pWzz5NyfIYPWI
         HO0xmLUiTFtK2cvdpI0FshPD2UYt5WAsXSa/Junsju9lgX5A1Yx5n47iEL0ZNFWa+m/8
         By5tu1KbWGxCZ/CTYuA0WJ4H0wNRa0nWx08z6o9aomM7IyJXO4y87a6zifZufIaaK0u5
         ZFp78Vu9/nR9K6YT+xw2NaOEfRmlt4YB7VFNOboAMTCS3nqCX1FMcG9k0BpOIC/Z/Dj0
         P35T28qRfNuFA21y1ioNwJH524LqRIzikWp+I0+sJxPWtqZ8LliXEan2V5gt7DLsXsQk
         sKZQ==
X-Gm-Message-State: AFqh2kroHUe04jfDgqcIhdLH8ANW/I0FGaOOBfrj+hnEFEh0HxCbD+jB
	/PRx6SO2f4GXxmnLoLLj1i6ZWHgXcvZ6JrsJiAs=
X-Google-Smtp-Source: AMrXdXt3Dj8vdSMcdosIIsXhKBuVRtykiqY+ZXaoArbm27uP+RC/2geqdJsumNWf0PFoFUrLFdR27mskm5ErWUKwFI4=
X-Received: by 2002:a05:600c:310f:b0:3da:dbb:5ee0 with SMTP id
 g15-20020a05600c310f00b003da0dbb5ee0mr1096802wmo.2.1673865234446; Mon, 16 Jan
 2023 02:33:54 -0800 (PST)
MIME-Version: 1.0
References: <20230116084809.16470-1-Qi.Chen@windriver.com>
In-Reply-To: <20230116084809.16470-1-Qi.Chen@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 16 Jan 2023 11:33:42 +0100
Message-ID: <CA+chaQe990PE-tB_r-VEvRjAoDhP1pZgNmhUrdouo7686XjYvQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] rpm: make nativesdk-rpm rdepend on nativesdk-file
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b3803105f25f1e96"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 10:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175969

--000000000000b3803105f25f1e96
Content-Type: text/plain; charset="UTF-8"

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

On Mon, Jan 16, 2023 at 9:48 AM Chen Qi <Qi.Chen@windriver.com> wrote:

> For now, running `file' inside SDK errors out.
>   file: could not find any valid magic files!
>
> This is because nativesdk-rpm exports MAGIC. So let's
> make nativesdk-rpm depend on file for better user
> experiences.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-devtools/rpm/rpm_4.18.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
> b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
> index 8eb0ab207e..3b7d4d640a 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
> @@ -188,6 +188,7 @@ PROVIDES += "python3-rpm"
>  FILES:python3-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
>
>  RDEPENDS:${PN}-build = "bash perl python3-core"
> +RDEPENDS:nativesdk-rpm += "nativesdk-file"
>
>  PACKAGE_PREPROCESS_FUNCS += "rpm_package_preprocess"
>
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175963):
> https://lists.openembedded.org/g/openembedded-core/message/175963
> Mute This Topic: https://lists.openembedded.org/mt/96303256/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b3803105f25f1e96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Acked-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@=
gmail.com">Martin.Jansa@gmail.com</a>&gt;<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 16, 2023 at 9:48 A=
M Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>For now, running `file&#39; inside SDK errors out.<br>
=C2=A0 file: could not find any valid magic files!<br>
<br>
This is because nativesdk-rpm exports MAGIC. So let&#39;s<br>
make nativesdk-rpm depend on file for better user<br>
experiences.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.18.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">rpm_4.18.0.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.18.0.bb" rel=
=3D"noreferrer" target=3D"_blank">rpm_4.18.0.bb</a> b/meta/recipes-devtools=
/rpm/<a href=3D"http://rpm_4.18.0.bb" rel=3D"noreferrer" target=3D"_blank">=
rpm_4.18.0.bb</a><br>
index 8eb0ab207e..3b7d4d640a 100644<br>
--- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.18.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">rpm_4.18.0.bb</a><br>
+++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.18.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">rpm_4.18.0.bb</a><br>
@@ -188,6 +188,7 @@ PROVIDES +=3D &quot;python3-rpm&quot;<br>
=C2=A0FILES:python3-rpm =3D &quot;${PYTHON_SITEPACKAGES_DIR}/rpm/*&quot;<br=
>
<br>
=C2=A0RDEPENDS:${PN}-build =3D &quot;bash perl python3-core&quot;<br>
+RDEPENDS:nativesdk-rpm +=3D &quot;nativesdk-file&quot;<br>
<br>
=C2=A0PACKAGE_PREPROCESS_FUNCS +=3D &quot;rpm_package_preprocess&quot;<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#175963): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/175963" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/175963</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96303256/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96303256/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b3803105f25f1e96--

