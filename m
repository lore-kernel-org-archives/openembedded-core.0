Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A038EC47DDB
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 16:48:57 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.20531.1706546934324939083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 08:48:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ej98jIaR;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-204235d0913so1584715fac.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 08:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706546933; x=1707151733; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VaAHHryLonPCs5o9wVt8klYGWE+RU+c5VLY4J8mI1a8=;
        b=ej98jIaRLAp4v1kyRS1ekly8vhbu/WInmPRITfslqtO0cvBkb9uJ7YdSAxx7e1QA7n
         1hj3BthdsGuNUHbX7KC/z+LYj14dt02AC3dvo8zt7aWQaAsBbfV2g2E92gUYD21tss8z
         E3p1TbY92Y3Y11CNTo+e93Ag35bCfqxx4KWQG+Lv9O8zMqNJI66D2YZD0sd3rRYef1YQ
         b2fQ2/oKPBwJ17WOnneleXZtqloooK4bWr+iKanyA5yaFHqhdYIdnzKENsbcAeYNOYci
         BiSTq2V/6WnNj5J3gMtrdOZdlzqi6Av3noZ1Cxd1dU0ibkhTiBp09I2bnFwWgiqaHbG2
         ixzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706546933; x=1707151733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VaAHHryLonPCs5o9wVt8klYGWE+RU+c5VLY4J8mI1a8=;
        b=rEQ7HEWtVKCaBbKLgzcY5FsYpylzd22TlRJwdMD3C87W5gUTtavWbGl3z1BN1huTRt
         2HOhDZeIYx/KPTgefigri3AMT+mH8QaxhDI9vWilItt8EuELEZWiJBtCBIvA5p1koida
         p+iIRj2TtB/SkIBD2KWiIHfZfxpcwj+1Y6LUo6r1iam9a5oaPxU+HPPevSRzmRq3wjjx
         SoRIpjw4wAR5Ody3t65PeTehGX94KInzbju+a9qSr/el1CGHT6zn7C2/9PnS2ZOuOSQD
         jC4AyHPRQiTy3zLP9lEgcKEIHOTUdqGSR2xcT0arzSQi+WYxMqkAtL5z8HtP5W7iEShv
         9Vbw==
X-Gm-Message-State: AOJu0Yw0eHhmH71TLVC0lS74qEh3GkuNo5b1IF8J36kUaTsb5xnJnlWZ
	nJLMSM6B8qINO8ufFmhuKfbxuYb5EFVGeWOyuN+pNYbwYEFWyZc5TauX5Tx18QsSQWzv9sqQfnm
	TuNRZRrL/ymheTTe6BxYL53ZT66L+C8p08ZU=
X-Google-Smtp-Source: AGHT+IF1mGFNaVF6ho0GaRpSXXrRDa4IL2iyl9vmseqA4swMfJk32hTmW3VUdQrDIOaFqeCD9HNvtrUv45CcB9F++Bk=
X-Received: by 2002:a05:6870:648c:b0:210:cac2:4419 with SMTP id
 cz12-20020a056870648c00b00210cac24419mr4365821oab.38.1706546932608; Mon, 29
 Jan 2024 08:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20240129162615.3724802-1-matt@madison.systems>
In-Reply-To: <20240129162615.3724802-1-matt@madison.systems>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Jan 2024 08:48:41 -0800
Message-ID: <CAMKF1sqfi=O0Bw26Wj3bsx=aUWe2thHw7Jt1_nzsxttD6NwNmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][pseudo] ports/linux: add wrapper for statvfs64
To: Matt Madison <matt@madison.systems>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b5f3b00610186b68"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 16:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194468

--000000000000b5f3b00610186b68
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 8:26=E2=80=AFAM Matt Madison <matt@madison.systems>=
 wrote:

> rpm 4.19 now builds with LFS64 support enabled by default,
> so it calls statvfs64() to get the space available on the
> filesystem it is installing packages into.  Add a wrapper
> for this call so the right filesystem is used.
>
> Signed-off-by: Matt Madison <matt@madison.systems>
> ---
>  ports/linux/statvfs/guts/statvfs64.c | 15 +++++++++++++++
>  ports/linux/statvfs/wrapfuncs.in     |  1 +
>  2 files changed, 16 insertions(+)
>  create mode 100644 ports/linux/statvfs/guts/statvfs64.c
>
> diff --git a/ports/linux/statvfs/guts/statvfs64.c
> b/ports/linux/statvfs/guts/statvfs64.c
> new file mode 100644
> index 0000000..856d3db
> --- /dev/null
> +++ b/ports/linux/statvfs/guts/statvfs64.c
> @@ -0,0 +1,15 @@
> +/*
> + * Copyright (c) 2018 Wind River Systems; see
> + * guts/COPYRIGHT for information.
> + *
> + * SPDX-License-Identifier: LGPL-2.1-only
> + *
> + * int statvfs64(const char *path, struct statvfs64 *buf)
> + *     int rc =3D -1;
> + */
> +
> +       rc =3D real_statvfs64(path, buf);
> +
> +/*     return rc;
> + * }
> + */
> diff --git a/ports/linux/statvfs/wrapfuncs.in b/ports/linux/statvfs/
> wrapfuncs.in
> index 1afb64d..6a59660 100644
> --- a/ports/linux/statvfs/wrapfuncs.in
> +++ b/ports/linux/statvfs/wrapfuncs.in
> @@ -1 +1,2 @@
>  int statvfs(const char *path, struct statvfs *buf);
> +int statvfs64(const char *path, struct statvfs64 *buf);


Statvfs is under a conditional I wonder if this should be too

>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194464):
> https://lists.openembedded.org/g/openembedded-core/message/194464
> Mute This Topic: https://lists.openembedded.org/mt/104034596/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b5f3b00610186b68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jan 29, 2024 at 8:26=E2=80=AFAM Matt Madison &lt;ma=
tt@madison.systems&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">rpm 4=
.19 now builds with LFS64 support enabled by default,<br>
so it calls statvfs64() to get the space available on the<br>
filesystem it is installing packages into.=C2=A0 Add a wrapper<br>
for this call so the right filesystem is used.<br>
<br>
Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
---<br>
=C2=A0ports/linux/statvfs/guts/statvfs64.c | 15 +++++++++++++++<br>
=C2=A0ports/linux/statvfs/<a href=3D"http://wrapfuncs.in" rel=3D"noreferrer=
" target=3D"_blank">wrapfuncs.in</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 16 insertions(+)<br>
=C2=A0create mode 100644 ports/linux/statvfs/guts/statvfs64.c<br>
<br>
diff --git a/ports/linux/statvfs/guts/statvfs64.c b/ports/linux/statvfs/gut=
s/statvfs64.c<br>
new file mode 100644<br>
index 0000000..856d3db<br>
--- /dev/null<br>
+++ b/ports/linux/statvfs/guts/statvfs64.c<br>
@@ -0,0 +1,15 @@<br>
+/*<br>
+ * Copyright (c) 2018 Wind River Systems; see<br>
+ * guts/COPYRIGHT for information.<br>
+ *<br>
+ * SPDX-License-Identifier: LGPL-2.1-only<br>
+ *<br>
+ * int statvfs64(const char *path, struct statvfs64 *buf)<br>
+ *=C2=A0 =C2=A0 =C2=A0int rc =3D -1;<br>
+ */<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D real_statvfs64(path, buf);<br>
+<br>
+/*=C2=A0 =C2=A0 =C2=A0return rc;<br>
+ * }<br>
+ */<br>
diff --git a/ports/linux/statvfs/<a href=3D"http://wrapfuncs.in" rel=3D"nor=
eferrer" target=3D"_blank">wrapfuncs.in</a> b/ports/linux/statvfs/<a href=
=3D"http://wrapfuncs.in" rel=3D"noreferrer" target=3D"_blank">wrapfuncs.in<=
/a><br>
index 1afb64d..6a59660 100644<br>
--- a/ports/linux/statvfs/<a href=3D"http://wrapfuncs.in" rel=3D"noreferrer=
" target=3D"_blank">wrapfuncs.in</a><br>
+++ b/ports/linux/statvfs/<a href=3D"http://wrapfuncs.in" rel=3D"noreferrer=
" target=3D"_blank">wrapfuncs.in</a><br>
@@ -1 +1,2 @@<br>
=C2=A0int statvfs(const char *path, struct statvfs *buf);<br>
+int statvfs64(const char *path, struct statvfs64 *buf);</blockquote><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Statvfs is under a conditional I wo=
nder if this should be too=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D=
"auto"><br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#194464): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/194464" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/194464</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104034596/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104034596/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000b5f3b00610186b68--

