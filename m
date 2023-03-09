Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E0EC64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 08:31:19 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.8580.1678350676597097856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 00:31:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lA1zbgvR;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id j3so579553wms.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 00:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678350675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ggBCujoBqDO/Z2nj7f+1Sr8zaK4I+hWiGKoGCzvRxVE=;
        b=lA1zbgvRXKjwxJt98IMM2JZSSBobqq/SLjnx1RNTVGEk93esoozTFZaE47Jy9iaJwl
         nVhnG4i3u1bzzDkUpv28Jt9L0oUf8fm/xwPEYNk6d85dN3+ihubSpxQuUdtK0pdowOCa
         KWQ7YN3z75hG+jogB0HWXnSx6DA6ZHnqNxO3mvrK3DOwTUBpotqI7dowwBo5hBlF9hiv
         Lo2QP40GJcFCr7tZRf5B9FYV6gpM0h1WhE3basa8XsAk7w5xmyxUBYnTjY8DlJKzlQsv
         4jIUDmQ7peg/u1+SHQp2Iqh6Q4g49Y/pNpV40sxpcPhyJJVRQIEe+DYgSQkk5Iu6I6rf
         EfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678350675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggBCujoBqDO/Z2nj7f+1Sr8zaK4I+hWiGKoGCzvRxVE=;
        b=aVux9V4qplyzFEp5NOVfoK5hPxRsGeyJP5NdW88ojX8b94c9IdMnxSMdE8Qn0sXH5b
         uMlFJCr05iAZnW2I1PE89cchoVzRtZ7wtzmTXQBlfElyBC7nKrjR0zeEx1/liTW52HzN
         kVoJeR2Yg/j2kQEPXbvzWjWA/I+kB0iGiEXYKjnYS5zfmANnwa9PfOoLhkGSv8bB4C5u
         H2+ZV6pRLMxWNKr2zI7wmyEbqlWgdvPjuvxeJTYdJ6mFDfDraxUW3NhbTQeYeiSHJlem
         sst5MXpVgaVG0JefFByPz9V9XOIOxzpYmNzn+OoZy7/5qtrKqhudX6E3483uPF+LokEl
         oMSw==
X-Gm-Message-State: AO0yUKWRZhS0QQLQShNUi1sfZrAcKkhflu41VUnWl7sGmk2Hj+tvo4tk
	u1xi/QqaO/1SAQfDmE5NYfhXSWYoon6UQnBi1ag=
X-Google-Smtp-Source: AK7set/U8PQ3KKx50QX372pTDG2iDRkX2aEiafh8MBNxkkS3K0/yRDiGvO73h4o7HHaCsf+bhlgHkxx5irkYzsojXAA=
X-Received: by 2002:a05:600c:41d2:b0:3e2:1a3f:4e9e with SMTP id
 t18-20020a05600c41d200b003e21a3f4e9emr4661078wmh.3.1678350674980; Thu, 09 Mar
 2023 00:31:14 -0800 (PST)
MIME-Version: 1.0
References: <20230309075452.6463-1-romuald.jeanne@st.com>
In-Reply-To: <20230309075452.6463-1-romuald.jeanne@st.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 9 Mar 2023 09:30:59 +0100
Message-ID: <CA+chaQcX6BmW-j9GZpk2jR2_Pw7Ag2tx1g=tOnWJoy9Y__muVA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] image_types: fix vname var init in
 multiubi_mkfs() function
To: romuald.jeanne@st.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ca736b05f67377ef"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 08:31:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178212

--000000000000ca736b05f67377ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 9, 2023 at 8:55=E2=80=AFAM Romuald Jeanne via lists.openembedde=
d.org
<romuald.jeanne=3Dst.com@lists.openembedded.org> wrote:

> From: Romuald JEANNE <romuald.jeanne@st.com>
>
> As vname var is needed in multiubi_mkfs() function, we need to keep it
> defined and use it as parameter to the new write_ubi_config() function.
>
> See [YOCTO #15027]
>
> Signed-off-by: Romuald JEANNE <romuald.jeanne@st.com>
> ---
>  meta/classes-recipe/image_types.bbclass | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes-recipe/image_types.bbclass
> b/meta/classes-recipe/image_types.bbclass
> index 764e6a5574..c6cb8f5336 100644
> --- a/meta/classes-recipe/image_types.bbclass
> +++ b/meta/classes-recipe/image_types.bbclass
> @@ -157,11 +157,7 @@ UBI_VOLTYPE ?=3D "dynamic"
>  UBI_IMGTYPE ?=3D "ubifs"
>
>  write_ubi_config() {
> -       if [ -z "$1" ]; then
> -               local vname=3D""
> -       else
> -               local vname=3D"_$1"
> -       fi
> +       local vname=3D"$1"
>

Did you drop the _ separator intentionally?

--000000000000ca736b05f67377ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Mar 9, 2023 at 8:55=E2=80=AFAM Ro=
muald Jeanne via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;romuald.jeanne=3D<a href=3D"mailto:st.com@lists.openembedded=
.org">st.com@lists.openembedded.org</a>&gt; wrote:<br></div><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Romuald=
 JEANNE &lt;<a href=3D"mailto:romuald.jeanne@st.com" target=3D"_blank">romu=
ald.jeanne@st.com</a>&gt;<br>
<br>
As vname var is needed in multiubi_mkfs() function, we need to keep it<br>
defined and use it as parameter to the new write_ubi_config() function.<br>
<br>
See [YOCTO #15027]<br>
<br>
Signed-off-by: Romuald JEANNE &lt;<a href=3D"mailto:romuald.jeanne@st.com" =
target=3D"_blank">romuald.jeanne@st.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/image_types.bbclass | 13 +++++++------<br>
=C2=A01 file changed, 7 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/=
image_types.bbclass<br>
index 764e6a5574..c6cb8f5336 100644<br>
--- a/meta/classes-recipe/image_types.bbclass<br>
+++ b/meta/classes-recipe/image_types.bbclass<br>
@@ -157,11 +157,7 @@ UBI_VOLTYPE ?=3D &quot;dynamic&quot;<br>
=C2=A0UBI_IMGTYPE ?=3D &quot;ubifs&quot;<br>
<br>
=C2=A0write_ubi_config() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$1&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local vname=3D&quot=
;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local vname=3D&quot=
;_$1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local vname=3D&quot;$1&quot;<br></blockquote><d=
iv><br></div><div>Did you drop the _ separator intentionally?</div></div></=
div>

--000000000000ca736b05f67377ef--

