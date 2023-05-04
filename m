Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F68C7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 04:53:24 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.42767.1683175995231478283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 21:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=L0FGUQSN;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-b9d8b2e1576so96528276.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 21:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683175994; x=1685767994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vy7maqCch/PKwOxq1OU5WySoRzondGTzUTwEBPqZbvU=;
        b=L0FGUQSNaQx/MgLev9mk7LTIVRV4gNTud91bJV8uDRG1VVO0cZeZzRtvjrtc9ow8BG
         4J2Az5C4qSc8U9vMF2qbUlU/yS9LbRw1+BmqKF3krqdsHef8+Pm/eZmIPFPXYA3fLa0i
         KP6ZdUQUohWdqUMeNiMirnrWBFYs+54TUVEhpJi3T3KgH0OsYGXLjUZbo+4f/vnYSUTw
         xQHeh/mj92RBCH/h7WdQlVF8TOSMOEZ9GqHHktmu1l0F/ge1IEAWYqwg5my3PApqhSA7
         R0CDMSAEZIUuWEVd6b1LguN5m+AJgz1LP22pOAVUcQ77mojTvFFvZ7NV4kvnC420ZIx4
         HVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683175994; x=1685767994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vy7maqCch/PKwOxq1OU5WySoRzondGTzUTwEBPqZbvU=;
        b=dIBtpodXTmG8MOl4v0txbh0uPUotxwDB3VaTko00Ibvo3i/IMw4Lwj0ixmaKKegggg
         uI1apQaNDQ189Z5JVrdfSwtMrnBrWKrlZOYKJRFcGZJvdmpiMcNPslsezEPy1s1yC3oa
         ctWS8DsnuX/HXJl9BD8fPSVqkSTkrYDe1THg325nlvvFssq21qcc4xLoyEwA++43v4sc
         VY1koUJeg1kDYnaNHjFikwnGzrpW/X4oQOC8v9tVwFrTDJNP/BpjMRvyBltOACY7t33v
         3H10cdwkPJ0GVD42gmyIpMSAYEgKNecOsYjTH63rPOpVBDQH9oY8RYCQc82G6XHJueOr
         Tzgw==
X-Gm-Message-State: AC+VfDxavuJuWa2SSJGg+ATGvuZguidrevZ0i99U0lKNEzAOIyHA/YhK
	epfcCG2SyZdS8iSHmabgp84hm5rtCQD1OG8r5OTx2S1P
X-Google-Smtp-Source: ACHHUZ7JeEQD1fbmj/BTo/iD88FarblQj6qBsyTwU1FiG1zRYa+t8t6PetkS2Bkys2qHqK8DnBFXOIlkAfnKiA2jDn0=
X-Received: by 2002:a25:453:0:b0:b9e:8f7b:5c36 with SMTP id
 80-20020a250453000000b00b9e8f7b5c36mr6412837ybe.17.1683175994091; Wed, 03 May
 2023 21:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230502173422.1439794-1-ernstp@gmail.com> <20230502173422.1439794-4-ernstp@gmail.com>
In-Reply-To: <20230502173422.1439794-4-ernstp@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 3 May 2023 21:53:03 -0700
Message-ID: <CANx9H-C6EwnRO_36JmFP6W=usCGji892TStTP9Eq3whJGHRBng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/6] python3-charset-normalizer: add recipe
To: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000038ec0205fad6f330"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 04:53:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180848

--00000000000038ec0205fad6f330
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Why does this need to be added to core? Please provide some
reason/justification for adding the recipe.

On Tue, May 2, 2023 at 10:35 AM Ernst Sj=C3=B6strand <ernstp@gmail.com> wro=
te:

> Signed-off-by: Ernst Sj=C3=B6strand <ernstp@gmail.com>
> ---
>  .../python/python3-charset-normalizer_3.1.0.bb         | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/
> python3-charset-normalizer_3.1.0.bb
>
> diff --git a/meta/recipes-devtools/python/
> python3-charset-normalizer_3.1.0.bb b/meta/recipes-devtools/python/
> python3-charset-normalizer_3.1.0.bb
> new file mode 100644
> index 00000000000..9fda99b7ca6
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-charset-normalizer_3.1.0.bb
> @@ -0,0 +1,10 @@
> +DESCRIPTION =3D "Truly universal encoding detector in pure Python"
> +HOMEPAGE =3D "https://charset-normalizer.readthedocs.io"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0974a390827087287db39928f7c52=
4b5"
> +
> +SRC_URI[sha256sum] =3D
> "34e0a2f9c370eb95597aae63bf85eb5e96826d81e3dcf88b8886012906f509b5"
> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180759):
> https://lists.openembedded.org/g/openembedded-core/message/180759
> Mute This Topic: https://lists.openembedded.org/mt/98644247/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000038ec0205fad6f330
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Why does this need to be added to core? Please provide so=
me reason/justification for adding the recipe.</div><div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 2, 2023 at 1=
0:35 AM Ernst Sj=C3=B6strand &lt;<a href=3D"mailto:ernstp@gmail.com">ernstp=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-o=
ff-by: Ernst Sj=C3=B6strand &lt;<a href=3D"mailto:ernstp@gmail.com" target=
=3D"_blank">ernstp@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-charset-normalizer_3.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-charset-normalizer_3.1.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://pyt=
hon3-charset-normalizer_3.1.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-charset-normalizer_3.1.0.bb</a><br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-charset=
-normalizer_3.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-charset-=
normalizer_3.1.0.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://py=
thon3-charset-normalizer_3.1.0.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon3-charset-normalizer_3.1.0.bb</a><br>
new file mode 100644<br>
index 00000000000..9fda99b7ca6<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-charset-normal=
izer_3.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-charset-normali=
zer_3.1.0.bb</a><br>
@@ -0,0 +1,10 @@<br>
+DESCRIPTION =3D &quot;Truly universal encoding detector in pure Python&quo=
t;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://charset-normalizer.readthedocs.io" r=
el=3D"noreferrer" target=3D"_blank">https://charset-normalizer.readthedocs.=
io</a>&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D0974a390827087287db39928f7=
c524b5&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;34e0a2f9c370eb95597aae63bf85eb5e96826d81e3dcf=
88b8886012906f509b5&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#180759): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/180759" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/180759</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98644247/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
98644247/924729</a><br>
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

--00000000000038ec0205fad6f330--

