Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAD5C433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 16:15:43 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web12.25651.1642004141770391528
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 08:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e6ePS2Hw;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id m90so5811910uam.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 08:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1CiVnioCvJykVxZMDb5KDCbKDwNwiFZFEAdYYoSo/yQ=;
        b=e6ePS2HwBo+tXLypSHcZlgsgKtpb7QgEIx5kI3mtN9FytsL8nCwZWgJWWZghxpMOtr
         z/UvZAXa2hHWKOXO+XIIgqq/4Iz86lftV/ZHlyRsL8I7azE7+rCGV/OO4pkUA9NWm6SX
         YbENI6QzwbikPO6tyZeSkNzuEzC5Egay7x5RyUgVt/G2f5bz5w45w8zztvn+oNJ754WC
         PV9QGY4gJg+VwN14ENRstBhrjwIATzfnL+35fMasxW+a/EqPysxil+DsphyLOwA4iTe9
         A1yD+mTH5d60lr/RUnnPq+x8dYLyteVEZqKcR+J567dptVDHGNi1iMd8J9nrupLwfCkK
         PjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1CiVnioCvJykVxZMDb5KDCbKDwNwiFZFEAdYYoSo/yQ=;
        b=mMkbCRC8kOdWJT1iAKp6Je0YzXRaoJ15tSvlE819d8M216+d6PMmx4kSPOGo1uR6/1
         mCYEUq1S6KadCcMsm+BFlRTbEvmzvC0nRgzOjVxtIHyAFcvWqMgqP+rLOv++TolSyHpZ
         MmVc78DdO1Zij8fQ9UnLadV29zCUOb8wtcd7M5fal3ADzKkscWgStYKcK3UCAHj4XL23
         LYiFPbk3q9S3uvZAgq8/R2MvwQkRWzcyCglyCEZcJEwvOKaWV77fEjVd+cBaUWBE7OMc
         JOGK7gbDK1Z4Z2y4iLJX0Gbn+mD29fsYyA4Q6z759Ywj7Xr+y6xT7fwmYbHy4TEOQPna
         yEmg==
X-Gm-Message-State: AOAM531ZbmQ0dWEb2Jki2As3bqPyJ3Mi0durnj8D8Yiyjrfy7JlfHl+U
	2/wX0AKmWlXI4TFEur3UcwyCepg+uKdQ3WBkubc=
X-Google-Smtp-Source: 
 ABdhPJzvxBoYqI1BWjyqxAeAthwzP8gsh2g0MBXSy9zDnI7q6A1W4ou+4GSnuZh2rXhNEPCR2QMYbZr5V9QFdKeu9UY=
X-Received: by 2002:ab0:59ea:: with SMTP id k39mr252352uad.71.1642004140913;
 Wed, 12 Jan 2022 08:15:40 -0800 (PST)
MIME-Version: 1.0
References: <20220112152806.1754604-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220112152806.1754604-1-dmitry.baryshkov@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Jan 2022 17:15:29 +0100
Message-ID: 
 <CANNYZj-jwJDrR55ap85aiGdavQ-NJ0J-hU1QCK0tU2xvYUph4g@mail.gmail.com>
Subject: Re: [PATCH] go-runtime: fix building without SECURITY_LDFLAGS
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000089f7ce05d564e1cd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 16:15:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160491

--00000000000089f7ce05d564e1cd
Content-Type: text/plain; charset="UTF-8"

Thanks, this needs to be done in go-target.inc too.

Alex

On Wed, 12 Jan 2022 at 16:28, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
wrote:

> Commit 9985b17a30bb ("go: correctly set debug-prefix-map and build
> directory") has changed CGO_LDFLAGS to the manually crafted version of
> LDFLAGS to strip out DEBUG_PREFIX_MAP contents.
>
> However this manually crafted version includes ${SECURITY_LDFLAGS}.
>
> If security_flags.inc is not included, the variable is not defined, thus
> CGO_LDFLAGS will include the '${SECURITY_LDFLAGS}' literally. When
> building the recipe, the build would break with the follwing message:
>
> aarch64-linaro-linux-gcc: error: ${SECURITY_LDFLAGS}: No such file or
> directory
>
> So, instead of manually specifying variable contents, perform the
> expected action: filter offending arguments out of LDFLAGS.
>
> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  meta/recipes-devtools/go/go-runtime.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/go/go-runtime.inc
> b/meta/recipes-devtools/go/go-runtime.inc
> index a08d44dd3a8c..ccb86d4fe9a6 100644
> --- a/meta/recipes-devtools/go/go-runtime.inc
> +++ b/meta/recipes-devtools/go/go-runtime.inc
> @@ -10,7 +10,8 @@ DEBUG_PREFIX_MAP = "\
>  export CGO_CFLAGS = "${CFLAGS}"
>  export CGO_CPPFLAGS = "${CPPFLAGS}"
>  export CGO_CXXFLAGS = "${CXXFLAGS}"
> -export CGO_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}
> ${SECURITY_LDFLAGS}"
> +# Filter out -fdebug-prefix-map options as they clash with the GO's build
> system
> +export CGO_LDFLAGS = "${@ ' '.join(filter(lambda f: not
> f.startswith('-fdebug-prefix-map'), d.getVar('LDFLAGS').split())) }"
>  export GOCACHE = "${B}/.cache"
>
>  GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
> --
> 2.30.2
>
>

--00000000000089f7ce05d564e1cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, this needs to be done in go-target.inc too.</=
div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 12 Jan 2022 at 16:28, Dmitry =
Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@linaro.org">dmitry.baryshk=
ov@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Commit 9985b17a30bb (&quot;go: correctly set debug-prefix-map =
and build<br>
directory&quot;) has changed CGO_LDFLAGS to the manually crafted version of=
<br>
LDFLAGS to strip out DEBUG_PREFIX_MAP contents.<br>
<br>
However this manually crafted version includes ${SECURITY_LDFLAGS}.<br>
<br>
If security_flags.inc is not included, the variable is not defined, thus<br=
>
CGO_LDFLAGS will include the &#39;${SECURITY_LDFLAGS}&#39; literally. When<=
br>
building the recipe, the build would break with the follwing message:<br>
<br>
aarch64-linaro-linux-gcc: error: ${SECURITY_LDFLAGS}: No such file or direc=
tory<br>
<br>
So, instead of manually specifying variable contents, perform the<br>
expected action: filter offending arguments out of LDFLAGS.<br>
<br>
Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=
=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@lina=
ro.org" target=3D"_blank">dmitry.baryshkov@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/go-runtime.inc | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtool=
s/go/go-runtime.inc<br>
index a08d44dd3a8c..ccb86d4fe9a6 100644<br>
--- a/meta/recipes-devtools/go/go-runtime.inc<br>
+++ b/meta/recipes-devtools/go/go-runtime.inc<br>
@@ -10,7 +10,8 @@ DEBUG_PREFIX_MAP =3D &quot;\<br>
=C2=A0export CGO_CFLAGS =3D &quot;${CFLAGS}&quot;<br>
=C2=A0export CGO_CPPFLAGS =3D &quot;${CPPFLAGS}&quot;<br>
=C2=A0export CGO_CXXFLAGS =3D &quot;${CXXFLAGS}&quot;<br>
-export CGO_LDFLAGS =3D &quot;-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}=
 ${SECURITY_LDFLAGS}&quot;<br>
+# Filter out -fdebug-prefix-map options as they clash with the GO&#39;s bu=
ild system<br>
+export CGO_LDFLAGS =3D &quot;${@ &#39; &#39;.join(filter(lambda f: not f.s=
tartswith(&#39;-fdebug-prefix-map&#39;), d.getVar(&#39;LDFLAGS&#39;).split(=
))) }&quot;<br>
=C2=A0export GOCACHE =3D &quot;${B}/.cache&quot;<br>
<br>
=C2=A0GO_EXTLDFLAGS ?=3D &quot;${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAG=
S}&quot;<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div>

--00000000000089f7ce05d564e1cd--

