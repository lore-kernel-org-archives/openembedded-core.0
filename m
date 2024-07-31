Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08106C3DA7F
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 08:47:47 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.38374.1722415661553948833
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 01:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RF8EWIke;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fc5239faebso36609065ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 01:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722415661; x=1723020461; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d7/jNNvrrxu4WJ5WcvGmKqlWnItm65mX4BRLxWMrZPs=;
        b=RF8EWIkeceLB9VVMPJ5yScQyEk2uU/5Wiz82nGH2ZtC2Xt+9IQ5Lu8gMda0hvWxEOt
         AQptx7qn1XwAnYn7FXSmtrgleBjvMtcDs2PzggThgwJBOi5eb3R52h2SpSMP+XPiieJy
         2DrcOWgZNMIcwAFt3FyAyTDZyPyPLEYzVLESGWPdKuyHPrqx8/zsAxjTpfDVWhf4RAQB
         l8U82M0odLkimTHJX4bixrnjniOu6QDK02y6eNQaPkvb6oPrLY+6BUJ0Rzbi5gBzjyKZ
         peSi8N3Lj1/VFSCp/uqF0saAEnFpPLviBkU6G0iz6hmfRqk8P/gSJYVT0sHyYF5kiuzX
         oJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722415661; x=1723020461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7/jNNvrrxu4WJ5WcvGmKqlWnItm65mX4BRLxWMrZPs=;
        b=qhyRZs/l98QsNgASfupM8JFe5RmyuRMcsCqmha16xkOSa+D7nlGWrARwmPRHUJxQUq
         2dQFoukBMQ4SVWxudPO7qCr71/Fwd0AUabEJ85rxONA58Df6bBKmPRO3MGxQLM1zVZSW
         Mv+9rMcIL4kQf3r1vBZd2a9aO+9+y+SOZwYhD3vHyx1R5tM959y1ICXWhUVFRtslXCNo
         4gfOSqMg5T9p1t3mKhzwVy7lD2LiY1PshmWtT33/TZqIYNEpK+N8JeqDqvM+aFFfjkbs
         3MSztc3L2XlGAQvOYkeJk6Pc2K2QCNIqvSMOIHPTyR+AxBwdhubB2rH/KvJJboMxyXrl
         aijA==
X-Gm-Message-State: AOJu0YyB/Yj6z94WBa/8T8Pwilb8O/F6F//A4lEa50fep9cxzLTBSJu0
	+UJiR1BbmCWBCZ9Dnojql6gHP/ep54JRQ7HyjZ/pDxgohHDXVFmlNKmqIKrti0mbQFET9D2LAwg
	S9lzXHBe2ZmCFMd9j4KYlOB05/kI=
X-Google-Smtp-Source: AGHT+IHl1qX8V+lmflAokba2u2W9BhUZAs3nL0uMD0aGXZB+qun008QIwzjrKLuMtw0Pgbruu5PdIr9HoAcJz201VRE=
X-Received: by 2002:a17:903:2291:b0:1f9:99d8:4aac with SMTP id
 d9443c01a7336-1ff046ed2e9mr132397825ad.0.1722415660665; Wed, 31 Jul 2024
 01:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240728144905.554155-1-raj.khem@gmail.com>
In-Reply-To: <20240728144905.554155-1-raj.khem@gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 31 Jul 2024 10:47:29 +0200
Message-ID: <CAApg2=Tgj=FKDcV6xGZuAuYTjQozre+T9z2353Hv_G-QC9k8bg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libyaml: Update status of CVE-2024-35328
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009c17dc061e8725e4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 08:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202694

--0000000000009c17dc061e8725e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 28, 2024 at 4:49=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:

> This is open yet but seems to be disputed
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-support/libyaml/libyaml_0.2.5.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
> b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
> index 4cb5717ece8..2d6f27af1fc 100644
> --- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
> +++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
> @@ -18,4 +18,6 @@ inherit autotools
>  DISABLE_STATIC:class-nativesdk =3D ""
>  DISABLE_STATIC:class-native =3D ""
>
> +CVE_STATUS[CVE-2024-35328] =3D "disputed: Upstream thinks there is no
> working code that is exploitable -
> https://github.com/yaml/libyaml/issues/302"
> +
>  BBCLASSEXTEND =3D "native nativesdk"
>
> Khem, formally this one isn't "disputed". "disputed" is a formal CVE
programme tag, which isn't there for CVE-2024-35328 as of today.

Regards,
Marta

--0000000000009c17dc061e8725e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 28, 2024 at 4:49=E2=80=AF=
PM Khem Raj via <a href=3D"http://lists.openembedded.org">lists.openembedde=
d.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">This is open yet but seems to be disputed=
<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/libyaml/<a href=3D"http://libyaml_0.2.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libyaml_0.2.5.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-support/libyaml/<a href=3D"http://libyaml_0.2.5.b=
b" rel=3D"noreferrer" target=3D"_blank">libyaml_0.2.5.bb</a> b/meta/recipes=
-support/libyaml/<a href=3D"http://libyaml_0.2.5.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libyaml_0.2.5.bb</a><br>
index 4cb5717ece8..2d6f27af1fc 100644<br>
--- a/meta/recipes-support/libyaml/<a href=3D"http://libyaml_0.2.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libyaml_0.2.5.bb</a><br>
+++ b/meta/recipes-support/libyaml/<a href=3D"http://libyaml_0.2.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libyaml_0.2.5.bb</a><br>
@@ -18,4 +18,6 @@ inherit autotools<br>
=C2=A0DISABLE_STATIC:class-nativesdk =3D &quot;&quot;<br>
=C2=A0DISABLE_STATIC:class-native =3D &quot;&quot;<br>
<br>
+CVE_STATUS[CVE-2024-35328] =3D &quot;disputed: Upstream thinks there is no=
 working code that is exploitable - <a href=3D"https://github.com/yaml/liby=
aml/issues/302" rel=3D"noreferrer" target=3D"_blank">https://github.com/yam=
l/libyaml/issues/302</a>&quot;<br>
+<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br></blockquote><div>Khem, formally this one isn&#39;t &quot;disputed&quot=
;. &quot;disputed&quot; is a formal CVE programme tag, which isn&#39;t ther=
e for CVE-2024-35328 as of today. <br></div><div><br></div><div>Regards,</d=
iv><div>Marta<br></div></div></div>

--0000000000009c17dc061e8725e4--

