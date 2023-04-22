Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBF0C6FD18
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 16:12:09 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.10700.1682179923801051839
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 09:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=LUR89umN;
 spf=pass (domain: mvista.com, ip: 209.85.208.181, mailfrom: skulkarni@mvista.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2a8dd1489b0so25939611fa.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 09:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1682179922; x=1684771922;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hW6APwebghVBMIZ+TKhsUMOW2c0bRxVCLm6V+CfEtzE=;
        b=LUR89umNE6UK/QW6KJKpc02/Dj9o9xsJpJhskzLW72L9CEx6m2DwQuZARAy8MGwWiM
         g3mbLhf1uxhi4xW/eqhbGEEMldJhDUigJJYwp/r1sPFLUlVp3bGiZ5ehrJKWnDfaTVjv
         dU4oAcgckZH02H7MevkzIOaZC+h1kBqtXVgAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682179922; x=1684771922;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hW6APwebghVBMIZ+TKhsUMOW2c0bRxVCLm6V+CfEtzE=;
        b=ly11YiInvVgmrEOWWJFivE7gJm/2jzgDbRgDQLOk4Lrboi/1DcKKgAIvTdzyD3iOch
         Eh3nzB1o2XbRe+icwm7tQmwbhuEMfEK5rZNK4upO6R0mvVTb8o5ityiuahlNrZFa4/99
         sPsbiPkNQjyNi4+H1JLpeBwBYiEuyKaxXf5W3z9ou9gE+dLCVGjlUWZEeUn1riQyb4p3
         vXPhIouG1u/wLWhj3S76Q54sqBYdG5Bx2lAVA5T0O6J8CNF7BEtoPTuAPjxHErvP8mgQ
         YTwd+UOQZxoDmpJfh0oWOGhUUtdrNIn2W8Nc+XJZAxF0uH/CJewmnFlBkvSDTYl2kg6S
         jLXA==
X-Gm-Message-State: AAQBX9eotgXq7zBXX0RrSKQGWmZq9h1BCCycSrVBdSADM5rkJ3dc/5Ke
	nJX5Ah8TDd+zTrLCvsgUvpKLMAxdcyuIZDaZhExr+dB9cGfBW3Dl
X-Google-Smtp-Source: AKy350ZcdW2anf58TtNqXcqUOSeKFrEc8n6cZK6UPoFuZiguibLT+fgxKLKdClyFnpbrxKj+pG3NUrOBklgJfMSGj4o=
X-Received: by 2002:a05:651c:108:b0:2a8:b286:826e with SMTP id
 a8-20020a05651c010800b002a8b286826emr1345637ljb.33.1682179921424; Sat, 22 Apr
 2023 09:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230421112447.21966-1-skulkarni@mvista.com>
In-Reply-To: <20230421112447.21966-1-skulkarni@mvista.com>
From: Shubham Kulkarni <skulkarni@mvista.com>
Date: Sat, 22 Apr 2023 21:41:50 +0530
Message-ID: <CAKzga+z6NaV9QyyzQKFuAniM9VkZvuC4zm2xyQQaGaQPa+JJog@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] go: Ignore CVE-2022-1705
To: openembedded-core@lists.openembedded.org, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000aa481105f9ef08cc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 16:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180323

--000000000000aa481105f9ef08cc
Content-Type: text/plain; charset="UTF-8"

Hi Steve,

Is there any issue with this patch? It's not included in the patch review
list email.

Thanks,
Shubham

On Fri, 21 Apr, 2023, 4:54 pm Shubham Kulkarni, <skulkarni@mvista.com>
wrote:

> From: Shubham Kulkarni <skulkarni@mvista.com>
>
> The vulnerability was introduced in go1.15beta1 with commit d5734d4.
> Dunfell uses go1.14 version which does not contain the affected code.
>
> Ref: https://security-tracker.debian.org/tracker/CVE-2022-1705
>
> Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> ---
>  meta/recipes-devtools/go/go-1.14.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/go/go-1.14.inc
> b/meta/recipes-devtools/go/go-1.14.inc
> index 8df9d62612..961e233fe6 100644
> --- a/meta/recipes-devtools/go/go-1.14.inc
> +++ b/meta/recipes-devtools/go/go-1.14.inc
> @@ -85,3 +85,6 @@ CVE_CHECK_WHITELIST += "CVE-2022-30630"
>
>  # This is specific to Microsoft Windows
>  CVE_CHECK_WHITELIST += "CVE-2022-41716"
> +
> +# Issue introduced in go1.15beta1, does not exist in 1.14
> +CVE_CHECK_WHITELIST += "CVE-2022-1705"
> --
> 2.40.0
>
>

--000000000000aa481105f9ef08cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Steve,<div dir=3D"auto"><br></div><div dir=3D"auto">Is=
 there any issue with this patch? It&#39;s not included in the patch review=
 list email.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</di=
v><div dir=3D"auto">Shubham</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri, 21 Apr, 2023, 4:54 pm Shubham Kulk=
arni, &lt;<a href=3D"mailto:skulkarni@mvista.com" target=3D"_blank" rel=3D"=
noreferrer">skulkarni@mvista.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">From: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mvista=
.com" rel=3D"noreferrer noreferrer" target=3D"_blank">skulkarni@mvista.com<=
/a>&gt;<br>
<br>
The vulnerability was introduced in go1.15beta1 with commit d5734d4.<br>
Dunfell uses go1.14 version which does not contain the affected code.<br>
<br>
Ref: <a href=3D"https://security-tracker.debian.org/tracker/CVE-2022-1705" =
rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://security=
-tracker.debian.org/tracker/CVE-2022-1705</a><br>
<br>
Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mvista.com"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">skulkarni@mvista.com</a>&g=
t;<br>
---<br>
=C2=A0meta/recipes-devtools/go/go-1.14.inc | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/g=
o/go-1.14.inc<br>
index 8df9d62612..961e233fe6 100644<br>
--- a/meta/recipes-devtools/go/go-1.14.inc<br>
+++ b/meta/recipes-devtools/go/go-1.14.inc<br>
@@ -85,3 +85,6 @@ CVE_CHECK_WHITELIST +=3D &quot;CVE-2022-30630&quot;<br>
<br>
=C2=A0# This is specific to Microsoft Windows<br>
=C2=A0CVE_CHECK_WHITELIST +=3D &quot;CVE-2022-41716&quot;<br>
+<br>
+# Issue introduced in go1.15beta1, does not exist in 1.14<br>
+CVE_CHECK_WHITELIST +=3D &quot;CVE-2022-1705&quot;<br>
-- <br>
2.40.0<br>
<br>
</blockquote></div>

--000000000000aa481105f9ef08cc--

