Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80124C7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 04:47:34 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.42718.1683175650345749028
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 21:47:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YIF+56jv;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-b8f34bca001so91885276.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 21:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683175649; x=1685767649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4DWouNR0v9phWCU9aPlHtF0KbgBrgxGa0SkJVNCkydA=;
        b=YIF+56jvmtgSSwv9vCueFAm1FGSxhzQKJ9YCy8CRAbi7OwQvQfQGZ+w9e+JrVYEO18
         02wRHtbmHVWXiTHo/OOT9tm/iWlRAZdEmiSpFQpAvsQrEUEhxdYOJ4TLfLYr/z6Zt+dV
         4DgAstpNf5b21fffS70v0wVrD/bJQK5iNv6GRD20udPhDNfgmIR7IYJOH2XqgdJLtzPN
         WM5p34RcCI7rJGqsudRpNvPU31xI7QwtppImpSR51fn7en6PNIC/UvaFu0u0S6PlYDBo
         PR18c3oxtA9lJpAPVAHwFy2EVLSfSOSAfyLOQ4tGEE99y1CMG6brLTiZGQUq+G6+cF1F
         3NYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683175649; x=1685767649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4DWouNR0v9phWCU9aPlHtF0KbgBrgxGa0SkJVNCkydA=;
        b=iUq88lC6bToSmvG6SLR722g2tfo6u80ZQ164XdxdmO7f3K1wgC2RalAUEIev38Cn3L
         du6rtwJeDRpMhZYFE262FyY8lX0FjOyWRJUoIcY7x+AsbcxX+nCZOjWxhU+ICk6burK/
         PJWoJ2ndFQMWSHIX+sfrqcoDxiW/rck98dvwR6B2m9TdCAcpyrNfUn6VcUCrmVnVDOTa
         snODGg9YRUmAvbZb+Gd3fGXhaR+enz3Sz6MMHMIbcu72deFSm9UO/u/ItRlBHwWxn3Um
         /yVqyPZlE3o4RvxVelqrt+FU3ne7vZ1SAdIIXe+uEbTTHOXUu2KOSOrlRJf9ExLy+pQO
         lI4w==
X-Gm-Message-State: AC+VfDxFN4YukVmrhNaot+LuBych9iIzbOznaTccgiw0cjoLRvG1CzkK
	QDEZxD1WNTKq7xO7tW0ZD92ehdnJO0iyX79rTAw=
X-Google-Smtp-Source: ACHHUZ6D+gPKOOBwa9XnWDILnn2bbSmrz3gSEaKKoXVrx5GvJGqxqVbjMUpllHt1lXScgfRWpcVae4Dr2Ogymj4olgM=
X-Received: by 2002:a25:fc1b:0:b0:b9a:6f77:9018 with SMTP id
 v27-20020a25fc1b000000b00b9a6f779018mr22025453ybd.41.1683175649201; Wed, 03
 May 2023 21:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230502173422.1439794-1-ernstp@gmail.com> <20230502173422.1439794-2-ernstp@gmail.com>
In-Reply-To: <20230502173422.1439794-2-ernstp@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 3 May 2023 21:47:18 -0700
Message-ID: <CANx9H-AYYY-5mo0xmxNcO15Fimo_MHTc9_tZtnWjKSOw5MROXg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/6] python3-fixtures: add recipe
To: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000aa549105fad6deb0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 04:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180846

--000000000000aa549105fad6deb0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please add some reason that it needs to be added to core. Empty commit logs
do not help future users know =E2=80=9Cwhy?=E2=80=9D

On Tue, May 2, 2023 at 10:35 AM Ernst Sj=C3=B6strand <ernstp@gmail.com> wro=
te:

> Signed-off-by: Ernst Sj=C3=B6strand <ernstp@gmail.com>
> ---
>  .../python/python3-fixtures_4.0.1.bb          | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-fixtures_4.0.1.b=
b
>
> diff --git a/meta/recipes-devtools/python/python3-fixtures_4.0.1.bb
> b/meta/recipes-devtools/python/python3-fixtures_4.0.1.bb
> new file mode 100644
> index 00000000000..f71eec6497e
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-fixtures_4.0.1.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "Python fixtures for testing / resource management"
> +HOMEPAGE =3D "https://github.com/testing-cabal/fixtures"
> +SECTION =3D "devel/python"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D239e2f4698b85aad5ed39bae5d2ef=
226"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] =3D
> "d2758826400d095b79666cf93a32a84f50ff8cd179831927efb48cd1e3ca7466"
> +
> +DEPENDS +=3D " \
> +    ${PYTHON_PN}-pbr-native \
> +    "
> +
> +RDEPENDS:${PN} +=3D "\
> +    ${PYTHON_PN}-pbr \
> +    "
> +
> +BBCLASSEXTEND =3D "nativesdk"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180757):
> https://lists.openembedded.org/g/openembedded-core/message/180757
> Mute This Topic: https://lists.openembedded.org/mt/98644245/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000aa549105fad6deb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please add some reason that it needs to be added to core.=
 Empty commit logs do not help future users know =E2=80=9Cwhy?=E2=80=9D</di=
v><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Tue, May 2, 2023 at 10:35 AM Ernst Sj=C3=B6strand &lt;<a href=3D"mailto=
:ernstp@gmail.com">ernstp@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">Signed-off-by: Ernst Sj=C3=B6strand &lt;<a href=3D"mailto:e=
rnstp@gmail.com" target=3D"_blank">ernstp@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-fixtures_4.0.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-fixtures_4.0.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 19 +++++++++++++++++++<br>
=C2=A01 file changed, 19 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://pyt=
hon3-fixtures_4.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-fixtur=
es_4.0.1.bb</a><br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-fixture=
s_4.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-fixtures_4.0.1.bb<=
/a> b/meta/recipes-devtools/python/<a href=3D"http://python3-fixtures_4.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-fixtures_4.0.1.bb</a><br>
new file mode 100644<br>
index 00000000000..f71eec6497e<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-fixtures_4.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-fixtures_4.0.1.bb</a><br>
@@ -0,0 +1,19 @@<br>
+SUMMARY =3D &quot;Python fixtures for testing / resource management&quot;<=
br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/testing-cabal/fixtures" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/testing-cabal/fixtur=
es</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D239e2f4698b85aad5ed39bae5d=
2ef226&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;d2758826400d095b79666cf93a32a84f50ff8cd179831=
927efb48cd1e3ca7466&quot;<br>
+<br>
+DEPENDS +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-pbr-native \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+RDEPENDS:${PN} +=3D &quot;\<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-pbr \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#180757): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/180757" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/180757</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98644245/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
98644245/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000aa549105fad6deb0--

