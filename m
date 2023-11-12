Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7E5C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 12:11:01 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.13755.1699791057419210135
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Nov 2023 04:10:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FoHF8rsw;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-32fb1d757f7so2224379f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Nov 2023 04:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699791056; x=1700395856; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zOFXCf5yvMQ98uhunjg6KFP5rmUOPbKkXaiGu04CXbs=;
        b=FoHF8rsw1AMT3VEUSTRTbMZMCFNS3XIbHphRWCYqa8oAyhUIeTeMNdK7S8BaJWV6LQ
         PrZPXpVJlQ688eQ5OvtQmSA+hlMJ4bke5tj2JRUZYdFd0mIVgtOZ9Vt0DeTeOIK0abeO
         Xuw9c3FV/QQV+kIiYW6RBcGcsJm/499H6i+uiBqX9hLcAKsJKnqnD5+bmI6CjQoTDnqi
         U2EqAhI6uB0rpRso/S1/D+Z7NrDqF3i2b3bx8zdOWqh1JK1PWXfRDq9bvkkZ6o4opYXl
         YhES7hohaDd7s4xG8OtzkMPawPy365TwRjDg0Kl/K+k2HOTaWFPvaKNd1kisS3nJypBA
         nXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699791056; x=1700395856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOFXCf5yvMQ98uhunjg6KFP5rmUOPbKkXaiGu04CXbs=;
        b=QwF0XX3MQWPI9ab5Cp++9e1pchF//dfHKY23xkDcFCPB9rnYX8sN073YXsCiTyuDEq
         nsCJGKAKr6Y/ABVSvOof+xetHMDv/DMCQz2ZQ6m3IOMGdrqokgFQmHu1N/IjELiAS84l
         vO7csJzknAdXKD/73NOrik6i4KshztKhE2wrVL4KUfRb1O3BCMyuqoFfjXxOD5c958HD
         DS/BIdkzutjLPHG5w3JDrGn0OztVB4Tm16t+SS2EctfGfQnWDFNOqjCmc7J6yPdCjyqs
         llY06J3zKXoSuHsHrRJj4sECYi84r1emxaAFMXuEVSOXIX5OYFYnXj9Rw/OZRrtMYzKD
         +zTQ==
X-Gm-Message-State: AOJu0YxgRQs50/6nY0QtIEvTIQqRvoJD6Kh4F4MF7cWieHVX2IlOmsRH
	dI3t3v9BERqoxcL7Ci1IQOg0Lj6FazJtkR2oBIw=
X-Google-Smtp-Source: AGHT+IFEgAxwrVQ8BJ+lL+HpTElX6kV7ZVBWPcMLpUDnwJ6KX0Bb43eu9C6slMAZ+x/iZ1PErxoyLg/b2N8flsK1xUw=
X-Received: by 2002:a5d:6e55:0:b0:32d:e6ec:2862 with SMTP id
 j21-20020a5d6e55000000b0032de6ec2862mr2119375wrz.7.1699791055493; Sun, 12 Nov
 2023 04:10:55 -0800 (PST)
MIME-Version: 1.0
References: <20231107115258.172865-1-zboszor@gmail.com>
In-Reply-To: <20231107115258.172865-1-zboszor@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 12 Nov 2023 13:10:42 +0100
Message-ID: <CA+chaQcGuSLhpJ90JH3PiaofmFBo_2u4=mqzyAv_FJoTiMzT3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] common-licenses: Add Baekmuk license
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000000e229c0609f372c9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Nov 2023 12:11:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190446

--0000000000000e229c0609f372c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Why don't you add this only to meta-sicom layer? It doesn't seem to be used
in many recipes to include it in oe-core.

On Tue, Nov 7, 2023 at 12:53=E2=80=AFPM Zoltan Boszormenyi <zboszor@gmail.c=
om>
wrote:

> The Baekmuk font uses this license.
>
> The license file was extracted from
> http://kldp.net/baekmuk/release/865-baekmuk-ttf-2.2.tar.gz
>
> The SPDX link for this license:
> https://spdx.org/licenses/Baekmuk.html
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/files/common-licenses/Baekmuk | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta/files/common-licenses/Baekmuk
>
> diff --git a/meta/files/common-licenses/Baekmuk
> b/meta/files/common-licenses/Baekmuk
> new file mode 100644
> index 0000000000..04322ec737
> --- /dev/null
> +++ b/meta/files/common-licenses/Baekmuk
> @@ -0,0 +1,11 @@
> +Copyright (c) 1986-2002 Kim Jeong-Hwan
> +All rights reserved.
> +
> +Permission to use, copy, modify and distribute this font is
> +hereby granted, provided that both the copyright notice and
> +this permission notice appear in all copies of the font,
> +derivative works or modified versions, and that the following
> +acknowledgement appear in supporting documentation:
> +    Baekmuk Batang, Baekmuk Dotum, Baekmuk Gulim, and
> +    Baekmuk Headline are registered trademarks owned by
> +    Kim Jeong-Hwan.
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190270):
> https://lists.openembedded.org/g/openembedded-core/message/190270
> Mute This Topic: https://lists.openembedded.org/mt/102440823/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000e229c0609f372c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why don&#39;t you add this only to meta-sicom layer? It do=
esn&#39;t seem to be used in many recipes to include it in oe-core.</div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, =
Nov 7, 2023 at 12:53=E2=80=AFPM Zoltan Boszormenyi &lt;<a href=3D"mailto:zb=
oszor@gmail.com">zboszor@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">The Baekmuk font uses this license.<br>
<br>
The license file was extracted from<br>
<a href=3D"http://kldp.net/baekmuk/release/865-baekmuk-ttf-2.2.tar.gz" rel=
=3D"noreferrer" target=3D"_blank">http://kldp.net/baekmuk/release/865-baekm=
uk-ttf-2.2.tar.gz</a><br>
<br>
The SPDX link for this license:<br>
<a href=3D"https://spdx.org/licenses/Baekmuk.html" rel=3D"noreferrer" targe=
t=3D"_blank">https://spdx.org/licenses/Baekmuk.html</a><br>
<br>
Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=3D"mailto=
:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/files/common-licenses/Baekmuk | 11 +++++++++++<br>
=C2=A01 file changed, 11 insertions(+)<br>
=C2=A0create mode 100644 meta/files/common-licenses/Baekmuk<br>
<br>
diff --git a/meta/files/common-licenses/Baekmuk b/meta/files/common-license=
s/Baekmuk<br>
new file mode 100644<br>
index 0000000000..04322ec737<br>
--- /dev/null<br>
+++ b/meta/files/common-licenses/Baekmuk<br>
@@ -0,0 +1,11 @@<br>
+Copyright (c) 1986-2002 Kim Jeong-Hwan<br>
+All rights reserved.<br>
+<br>
+Permission to use, copy, modify and distribute this font is<br>
+hereby granted, provided that both the copyright notice and<br>
+this permission notice appear in all copies of the font,<br>
+derivative works or modified versions, and that the following<br>
+acknowledgement appear in supporting documentation:<br>
+=C2=A0 =C2=A0 Baekmuk Batang, Baekmuk Dotum, Baekmuk Gulim, and<br>
+=C2=A0 =C2=A0 Baekmuk Headline are registered trademarks owned by<br>
+=C2=A0 =C2=A0 Kim Jeong-Hwan.<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190270): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190270" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/190270</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102440823/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102440823/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000000e229c0609f372c9--

