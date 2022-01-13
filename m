Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C1FC433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 19:46:22 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web12.2005.1642103178772333846
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 11:46:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HBaYViB1;
 spf=pass (domain: gmail.com, ip: 209.85.222.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id c36so13101566uae.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 11:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xkDFNdRqIWDnNza42urAefifu5B64HIvbyKhKerVR1o=;
        b=HBaYViB1O+J/gMCwzOTRj/S+//Vksy0EsLLIp/chMlxGmPcwrAq6QWqQ1HZopwltpA
         03gnRUh1rxmk1FhqCRjTR6LseTheE00twSD7YoizAvtMzEuGupVzqglVGwT9MXgYecsV
         derLsDkP2jo+Ho4LgXBgWbFmu/jSnqbtyrGEKhnW7p01ZZnG+tq8nDmk9zTEKNbpd88X
         f+fTpKbepopqJX6/eqcZUucgQSrTF/ZB5IA8Uie5/f7lLly5MTeqOTXu4NZwGUvaVLVd
         nPdQo9Uh7971xqcUXGgvHfTXKLf/aigpVc5B67gR0Tiy9Tu2KXPFi//nYCB51s8ja0kd
         6cJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xkDFNdRqIWDnNza42urAefifu5B64HIvbyKhKerVR1o=;
        b=IGYPc2kUwtLAArTW7Wbu+PJQLpPMYmCEpGcJ9OySDTByaDnshnpbdKj0J1lQ8MTwUk
         vSw/PqXNrFhgjoumtyrd3oFhfFon7NnJcFpquWmdUX+r96bRn10BIMRyhk/7M9IGZaGt
         3QTNE+TRSYXG1O7o4GnZ/3/J4YTZSwyQ6DmWvdrj2GrhHHww7075atYSA57K0M01NXV+
         /p3uE4Mu3vieAO+EMe11wkQK0oU08aoO11Bz1yRIMJN7VYnTKS+j541dNLVYV18coqPf
         bHLZDkemXhh6BvNeF0SAvN/Gt7R5uhhOKaZxntrXW0gMY7hjqnE+TD1XDnCPBtTLG/Fk
         OhHA==
X-Gm-Message-State: AOAM531lKGevhE9yG+xLNlRtk7gYIgQDKjvSXCNC6MRMRqE/QNnDDDS7
	HNBCJK2822XmyHSruCqQHZh6Ik24jU1SV2FyhwA=
X-Google-Smtp-Source: 
 ABdhPJzT7IZkMZ8sl2rSSC9yQ8E/kdgUUKcPKcbFIiFMdTrosK1WvDt9Zvnq8AHgasVAfDzvwft5rL9ahbICjUhuDGY=
X-Received: by 2002:a67:c81c:: with SMTP id u28mr2820049vsk.38.1642103177720;
 Thu, 13 Jan 2022 11:46:17 -0800 (PST)
MIME-Version: 1.0
References: <20220113192249.818255-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220113192249.818255-1-dmitry.baryshkov@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Jan 2022 20:46:05 +0100
Message-ID: 
 <CANNYZj8dCQ=E_unfqUrQXJAuoCaauuGZf5LoLEQDF-HLS2u2bw@mail.gmail.com>
Subject: Re: [PATCH v2] go: fix building without SECURITY_LDFLAGS
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000097b6fd05d57bf032"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 19:46:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160531

--00000000000097b6fd05d57bf032
Content-Type: text/plain; charset="UTF-8"

Thanks, this should work.

Alex

On Thu, 13 Jan 2022 at 20:22, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
>  meta/recipes-devtools/go/go-target.inc  | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
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
> diff --git a/meta/recipes-devtools/go/go-target.inc
> b/meta/recipes-devtools/go/go-target.inc
> index 51f1b79cc320..b0d487ae1c21 100644
> --- a/meta/recipes-devtools/go/go-target.inc
> +++ b/meta/recipes-devtools/go/go-target.inc
> @@ -9,7 +9,8 @@ DEBUG_PREFIX_MAP = "\
>  export CGO_CFLAGS = "${CFLAGS}"
>  export CGO_CPPFLAGS = "${CPPFLAGS}"
>  export CGO_CXXFLAGS = "${CXXFLAGS}"
> -export CGO_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}
> ${SECURITY_LDFLAGS}"
> +# Filter out -fdebug-prefix-map options as they clash with the GO's build
> system
> +export CGO_LDFLAGS = "${@ ' '.join(filter(lambda f: not
> f.startswith('-fdebug-prefix-map'), d.getVar('LDFLAGS').split())) }"
>
>  export GOCACHE = "${B}/.cache"
>  GO_LDFLAGS = ""
> --
> 2.30.2
>
>

--00000000000097b6fd05d57bf032
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, this should work.</div><div><br></div><div>Al=
ex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Thu, 13 Jan 2022 at 20:22, Dmitry Baryshkov &lt;<a href=3D"m=
ailto:dmitry.baryshkov@linaro.org">dmitry.baryshkov@linaro.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Commit 9985b1=
7a30bb (&quot;go: correctly set debug-prefix-map and build<br>
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
=C2=A0meta/recipes-devtools/go/go-target.inc=C2=A0 | 3 ++-<br>
=C2=A02 files changed, 4 insertions(+), 2 deletions(-)<br>
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
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools=
/go/go-target.inc<br>
index 51f1b79cc320..b0d487ae1c21 100644<br>
--- a/meta/recipes-devtools/go/go-target.inc<br>
+++ b/meta/recipes-devtools/go/go-target.inc<br>
@@ -9,7 +9,8 @@ DEBUG_PREFIX_MAP =3D &quot;\<br>
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
<br>
=C2=A0export GOCACHE =3D &quot;${B}/.cache&quot;<br>
=C2=A0GO_LDFLAGS =3D &quot;&quot;<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div>

--00000000000097b6fd05d57bf032--

