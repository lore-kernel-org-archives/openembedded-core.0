Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63DF3C87FCA
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 19:34:34 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.17295.1753817673568956482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 12:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CfUlf1uu;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32b7113ed6bso64443071fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 12:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753817671; x=1754422471; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mdZwDXV90zqOhKZ8U16Iel23kM9/oVH31E4/KPa+U90=;
        b=CfUlf1uu9H4UbNb7b29uJ9jJdcZ2Jk9gDH1jlLV/mACv7f366om4seU8ZLA4eb8xxw
         rjViurm07+ZtbVF3ttQqjN1hfrbOCjbEvA/yX77S+ThpA1y9DfKqL2VRwDb4kg47HC0q
         xd3qUvK4TN1EF6Xmt9VwWaDpBh6Nqyk5mZMYGap935SIcwjUKAN67wU3tFJ3t11RW0iS
         Vdc/rSyOoR8cfY7KloXk/sNi2IUXcvlEw/Wqcj+g6GLh+kYShAKXxY3sVySb1RU1nL7A
         9bwO7n4Jumkc4w5xNNCsjQ5HGQgZYKPJ9jrYpLZBZXyUaUPkw2kUtNYCAQte6cMM4F3b
         dxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753817671; x=1754422471;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mdZwDXV90zqOhKZ8U16Iel23kM9/oVH31E4/KPa+U90=;
        b=pQaMEyVSTDf9g1k0IPdQ9beE7gBtVe/y6e7MLAw098Aun4XyYjpf5NYY/Fgi+vGlgW
         hYfMvTTshyx5r59fgUBbGHEoPQEgfeaMip162b5WbLJX9BgVp335jOe5vMgDQcb6Nn4w
         VJ8PEktQAianLhqooGwZhGiIb6uawz/HRZsP+1T8CZw90iCNigA3YrKePoG6CB+zw90/
         k0pIEzex6NpVYCFMqcPeyFYSUbqQx1jhgYx7URHkDgi9juWxs4kfnnZinsSJXK7aOvrG
         /Ol7PyofrUNrCGphLIJC5aMWTtnqCp/HiwltfPcyvkgB6Wa7Z36r8MN32NYgH96+NTdW
         p3qA==
X-Gm-Message-State: AOJu0YwD8DVKEvEiG9pYrm/9W0okaeOI65pIsb8yg2Rwafzi1ZYT4+6V
	EiNLsv15MjD04dYwlDI9UzrnMP/JXFNSmnGNEKQSfQAZDVcuQuH7i8Ool+D5hw2A3jaqIbKzxos
	9rSgXUBZ7FsIEkQG2vMiEIc/YFAinm1blkA==
X-Gm-Gg: ASbGncvvBfM+LrdDW8KYGrYvZkbDOz8q/p7idvA0KXDrOfa83+pS+y9xRZveX7WfJBx
	VGn3h2q9aP3PBmOpInshpUpEXLn/wfHCIkFB8wd67uUuCmzt3ymPkfdiXwSiV5WAq1tijl4ROmE
	RAJarl/3L77HwwYnmA+bbfmjtxP8ijKXLlumV3ld6+kddQUukqHWx+z3vesxPWQ8qJrm8B9mQJO
	vpWUOLk7k2j/OP+6zuuyw==
X-Google-Smtp-Source: AGHT+IGnwBrr770LchBxoEcvww0WsTS/5wkYkLweB//n/1kEwtCH6vpogf9p5sCVbMR4FHe4617aq7uJUPg9xBhrHSk=
X-Received: by 2002:a05:651c:211d:b0:331:edf7:f4c8 with SMTP id
 38308e7fff4ca-33224c2edb3mr1630781fa.41.1753817670557; Tue, 29 Jul 2025
 12:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250625222916.11663-1-JPEWhacker@gmail.com>
In-Reply-To: <20250625222916.11663-1-JPEWhacker@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 29 Jul 2025 13:34:17 -0600
X-Gm-Features: Ac12FXw6RlYpp_p1Phrh2YNM0yVLgeQ1hJtkPBfsdK8P4BYFDexcVljmFfjz9YM
Message-ID: <CAJdd5GaM-WUiRkssxh-WXWmUhSZnTnay1qp50qH4s-1Rd8iB7g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] spdx30_tasks: Change recipe license to declared
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000412710063b167f8b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 19:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221086

--000000000000412710063b167f8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks like this might have gotten missed?

On Wed, Jun 25, 2025 at 4:29=E2=80=AFPM Joshua Watt <jpewhacker@gmail.com> =
wrote:

> Per discussion with the SPDX licensing group, recipe LICENSE statements
> classify as a declared license, not a concluded license.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index beeafc2bb7c..5d9f3168d97 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -552,7 +552,7 @@ def create_spdx(d):
>      )
>      build_objset.new_relationship(
>          source_files,
> -        oe.spdx30.RelationshipType.hasConcludedLicense,
> +        oe.spdx30.RelationshipType.hasDeclaredLicense,
>          [oe.sbom30.get_element_link_id(recipe_spdx_license)],
>      )
>
> --
> 2.49.0
>
>

--000000000000412710063b167f8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks like this might have gotten missed?</div><br><div cl=
ass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, Jun 25, 2025 at 4:29=E2=80=AFPM Joshua Watt &lt;<a href=3D"mai=
lto:jpewhacker@gmail.com">jpewhacker@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Per discussion with the SPDX =
licensing group, recipe LICENSE statements<br>
classify as a declared license, not a concluded license.<br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/spdx30_tasks.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py<br>
index beeafc2bb7c..5d9f3168d97 100644<br>
--- a/meta/lib/oe/spdx30_tasks.py<br>
+++ b/meta/lib/oe/spdx30_tasks.py<br>
@@ -552,7 +552,7 @@ def create_spdx(d):<br>
=C2=A0 =C2=A0 =C2=A0)<br>
=C2=A0 =C2=A0 =C2=A0build_objset.new_relationship(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source_files,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.spdx30.RelationshipType.hasConcludedLicense=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.spdx30.RelationshipType.hasDeclaredLicense,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[oe.sbom30.get_element_link_id(recipe_spd=
x_license)],<br>
=C2=A0 =C2=A0 =C2=A0)<br>
<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div>

--000000000000412710063b167f8b--

