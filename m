Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D5A8C4708D
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 16:24:41 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.18138.1673022277137665452
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 08:24:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LqixQj2C;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id b3so2655878lfv.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 08:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tmwxGBpfWLxUYKWcfpqk+hk6uVuBLsnYBDIPYORGjj0=;
        b=LqixQj2Cbz9RuSVqRO4MWZ9g4CqrHuZfZudhqNhTlmDapOIck9XOrF6bdJZMh6OO8W
         OpckfcbXAYee4VvtuzVjylc/TU6dF5uYZGxhap0l37IJchwILOlH5HzfUDVP9Z/HTPxM
         DofI7eHsDI2n3DsK9c3RkmPOp8KJoF/WdZ0B+2iNbnZCR7EOnAJ2bG640nSGMFIJQ5+1
         AfEeqyYcNVYK80Z1O9t2ybxLNNfRTJ8vzKqXvAkDrd98lqRDf1bubBWinmAdvlmtgyVn
         xvV3YvEYWfV4b3Cx1/pXwxjAq8xsTRxKgtzfM9zt4Mzkwujrg42QwvcKQMK4vWYVUw7B
         rXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmwxGBpfWLxUYKWcfpqk+hk6uVuBLsnYBDIPYORGjj0=;
        b=fKqybkEhH7kSZlkr00IgfSF8J+x9lKjoE4O7zv4OVXzx/ixe1VCzjO06WHvZOUAcgO
         E2zaiOu9t2IR/JuuCZkMpT7o2EipfVfH0oGsQ+FirIeXG9ORk8YQ/iy+ze+QYzdSeRmu
         Q1sa+n1M769hftWr78n9yVlrOS7iUvP+uaLN8e0x+YeXIKs07CEe3azbpKoVvMWRbhvT
         7055YKhyEJVx8sgSJnyAjxDodwFOQZj89FGR/cnvAUOPpDnd/FEeaGd8B8Nd/wAkK21D
         RU2uluVycoVdVQGn3Jv9jsSGHqL0S6g82ST+n41wiNK7fSB5Kn3yloswX+sd0d84Y9BC
         ANfg==
X-Gm-Message-State: AFqh2kqyamDFZNAD9m3OkVA/QxITYe6hmCQuzTtZiz3f5vYuEeASv8l3
	ROKvZXR4BlnMcA7C5yP0twpD8mc7IHOpJANv6Tk=
X-Google-Smtp-Source: AMrXdXsrk60u+se05v5AXmhn4qMk+Jc0SscOUXRleh32qHmMjYCK4otPSAv0VM5MQgs1ig30qT/JjJVtoKBeJ0EtBgA=
X-Received: by 2002:a05:6512:39ce:b0:4cc:716d:e018 with SMTP id
 k14-20020a05651239ce00b004cc716de018mr53455lfu.367.1673022275303; Fri, 06 Jan
 2023 08:24:35 -0800 (PST)
MIME-Version: 1.0
References: <20230106100806.838732-1-mingli.yu@eng.windriver.com>
 <CANNYZj_cxDBBbe3mz3R5qiiqeSaiQp-Q6Sj_druYWbXcxeFDVQ@mail.gmail.com> <70I2OR.1GRVLP9YUW9F@t-online.de>
In-Reply-To: <70I2OR.1GRVLP9YUW9F@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Jan 2023 17:24:24 +0100
Message-ID: <CANNYZj_EXp-OkWih=1obixcxzSnO=a8vHOpe1V-wN1T7HSdpKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libportal: add opengl to REQUIRED_DISTRO_FEATURES
To: Markus Volk <f_l_k@t-online.de>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006bbe6505f19ada0a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 16:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175599

--0000000000006bbe6505f19ada0a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Only if you can configure it in a way that doesn=E2=80=99t pull in Mesa, an=
d I
don=E2=80=99t think it=E2=80=99s possible.

Alex

On Fri 6. Jan 2023 at 15.09, Markus Volk <f_l_k@t-online.de> wrote:

> Maybe the REQUIRED_DISTRO_FEATURES =3D "opengl" line should just be remov=
ed
> from gtk4.bb ?
>
> Am Fr, 6. Jan 2023 um 11:31:30 +0100 schrieb Alexander Kanavin <
> alex.kanavin@gmail.com>:
>
> Please stop. What problem does adding this solve?
>
> Alex
>
> On Fri 6. Jan 2023 at 11.08, Yu, Mingli <mingli.yu@eng.windriver.com>
> wrote:
>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> libportal depends on gtk4 which needs opengl DISTRO_FEATURES, so
>> add opengl DISTRO_FEATURES requirement for libportal too.
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>  meta/recipes-gnome/libportal/libportal_0.6.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-gnome/libportal/libportal_0.6.bb
>> b/meta/recipes-gnome/libportal/libportal_0.6.bb
>> index ca58ef4138..cb3c5631d9 100644
>> --- a/meta/recipes-gnome/libportal/libportal_0.6.bb
>> +++ b/meta/recipes-gnome/libportal/libportal_0.6.bb
>> @@ -14,6 +14,7 @@ inherit meson gi-docgen gobject-introspection vala
>> features_check pkgconfig
>>  GIDOCGEN_MESON_OPTION =3D 'docs'
>>
>>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>> +REQUIRED_DISTRO_FEATURES =3D "opengl"
>>
>>  DEPENDS +=3D "glib-2.0 glib-2.0-native gtk+3 gtk4"
>>
>> --
>> 2.25.1
>>
>>
>>
>>
>>

--0000000000006bbe6505f19ada0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Only if you can configure it in a way that doesn=E2=80=99=
t pull in Mesa, and I don=E2=80=99t think it=E2=80=99s possible.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 6. Jan 2023 at 15.=
09, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)"><div id=3D"m_4536959301242338019ge=
ary-body" dir=3D"auto"><div>Maybe the=C2=A0REQUIRED_DISTRO_FEATURES =3D &qu=
ot;opengl&quot; line should just be removed from <a href=3D"http://gtk4.bb"=
 target=3D"_blank">gtk4.bb</a> ?</div></div><div id=3D"m_453695930124233801=
9geary-quote" dir=3D"auto"><br>Am Fr, 6. Jan 2023 um 11:31:30 +0100 schrieb=
 Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"=
_blank">alex.kanavin@gmail.com</a>&gt;:<br><blockquote type=3D"cite"><div d=
ir=3D"auto">Please stop. What problem does adding this solve?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 6. Jan 2023 at 11.08,=
 Yu, Mingli &lt;<a href=3D"mailto:mingli.yu@eng.windriver.com" target=3D"_b=
lank">mingli.yu@eng.windriver.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=3D"_b=
lank">mingli.yu@windriver.com</a>&gt;<br>
<br>
libportal depends on gtk4 which needs opengl DISTRO_FEATURES, so<br>
add opengl DISTRO_FEATURES requirement for libportal too.<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" tar=
get=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-gnome/libportal/<a href=3D"http://libportal_0.6.bb" rel=
=3D"noreferrer" target=3D"_blank">libportal_0.6.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-gnome/libportal/<a href=3D"http://libportal_0.6.b=
b" rel=3D"noreferrer" target=3D"_blank">libportal_0.6.bb</a> b/meta/recipes=
-gnome/libportal/<a href=3D"http://libportal_0.6.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libportal_0.6.bb</a><br>
index ca58ef4138..cb3c5631d9 100644<br>
--- a/meta/recipes-gnome/libportal/<a href=3D"http://libportal_0.6.bb" rel=
=3D"noreferrer" target=3D"_blank">libportal_0.6.bb</a><br>
+++ b/meta/recipes-gnome/libportal/<a href=3D"http://libportal_0.6.bb" rel=
=3D"noreferrer" target=3D"_blank">libportal_0.6.bb</a><br>
@@ -14,6 +14,7 @@ inherit meson gi-docgen gobject-introspection vala featur=
es_check pkgconfig<br>
=C2=A0GIDOCGEN_MESON_OPTION =3D &#39;docs&#39;<br>
<br>
=C2=A0ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;glib-2.0 glib-2.0-native gtk+3 gtk4&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div></blockquote></div></div>

--0000000000006bbe6505f19ada0a--

