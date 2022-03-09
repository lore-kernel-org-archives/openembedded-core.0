Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2820C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 06:12:02 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web09.2814.1646806312014322372
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 22:11:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AawPYpFq;
 spf=pass (domain: gmail.com, ip: 209.85.221.172,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id i133so714549vki.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 22:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=POqpgprG/fTDl5fK7QzUUZFrh+7K2xalnb4vGykw/wM=;
        b=AawPYpFqsdnBIfGPNZi5kNEAsdKsPiCmIqX3VdrZc6GoQiG5bh0oBGhbgPastrzJo2
         SVMV/FeS/jtRcJaGR4y68PAT4ramrd6/cMjVeiQvhHyhWrfUyuUiTYBT/cRYdFYU5UAg
         37N4iXgn2KxCPr4IrOQxwn5ExdftaU/G8cVWkONaE15aB9SwZQpDa4en07LDZsye9bEH
         J16QxtvqYG06EWuUW9hhnf21KJiqpf+fLiYcMtt2HNnwda16kuElvQte+nam/H4xwIsq
         kJ6EAhBj4ofUsULeivLVbBDUyD/Su5JNBH57JbCIVe13cyscwlxamXv8P0YH/sZFH77+
         V3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=POqpgprG/fTDl5fK7QzUUZFrh+7K2xalnb4vGykw/wM=;
        b=LjpXXkitjoIwjhQsrv71p2VVdYKecMwV3cODR5UgFp+LaDU09bOZ4+DQEuIixf5gsO
         MkiQrFXrDWJqHFy0zdpuukQLGLL27zfLzQAeIFDEe16LEs+VsVbv6gs8Okexf+udMlXO
         dSHu5qUWJ5q9iiqfktmGB3tzirLgn0rmuOyHE6Ik5LQvP8qOw7cvevu7nzGSiaLzm88k
         VduhKChsRPJ0cPQW3H1cr61JQSwhjitt/yJb5fhCKmFV1004VpMZURd4fTHCNokwkBbG
         nomgawqJ4Zfs5VL7N+SEkp58om7hOgPjXXA+VW/iPHZDw5LEXvSUvfUuLU5o60kDuXk6
         c2jg==
X-Gm-Message-State: AOAM533oPag5wD2wQAn9TZPinE0qhBAnkuzSjnlz6pmzkDQ6BFDTRl8C
	ihEx39wwp+Bmja71pJAdg6TjU+ONlzSZ99je5rk=
X-Google-Smtp-Source: 
 ABdhPJxCkJh7lKnbQ4C6UkbJyWSGIFeEZWlZOvZb6dYV+iBbaNiOVF8zdVmyEbEM0kX/3PIgRJshoJ2OZC9pwcilXyk=
X-Received: by 2002:a05:6122:130b:b0:337:bd1a:7f74 with SMTP id
 e11-20020a056122130b00b00337bd1a7f74mr677959vkp.4.1646806311029; Tue, 08 Mar
 2022 22:11:51 -0800 (PST)
MIME-Version: 1.0
References: <20220309011830.3130440-1-raj.khem@gmail.com>
In-Reply-To: <20220309011830.3130440-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Mar 2022 07:11:40 +0100
Message-ID: 
 <CANNYZj85JcW7xaLcuPC_+oap4a2hseFEWucnCLX4hFY=KT5Apg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: Fix build when x11 is not in distro
 features
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002ed03405d9c2f9a5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 06:12:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162947

--0000000000002ed03405d9c2f9a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Why is this issue not seen on autobuilder=E2=80=99s no-x11 job?

Alex

On Wed 9. Mar 2022 at 2.18, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/qemu/qemu_6.2.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/qemu/qemu_6.2.0.bb
> b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
> index 062ed32b015..c7eef0a9d5e 100644
> --- a/meta/recipes-devtools/qemu/qemu_6.2.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
> @@ -6,6 +6,8 @@ DEPENDS =3D "glib-2.0 zlib pixman bison-native ninja-nati=
ve
> meson-native"
>
>  DEPENDS:append:libc-musl =3D " libucontext"
>
> +CFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '',
> '-DEGL_NO_X11=3D1', d)}"
> +
>  RDEPENDS:${PN}:class-target +=3D "bash"
>
>  EXTRA_OECONF:append:class-target =3D "
> --target-list=3D${@get_qemu_target_list(d)}"
> --
> 2.35.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162946):
> https://lists.openembedded.org/g/openembedded-core/message/162946
> Mute This Topic: https://lists.openembedded.org/mt/89652908/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002ed03405d9c2f9a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Why is this issue not seen on autobuilder=E2=80=99s no-x1=
1 job?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 9=
. Mar 2022 at 2.18, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.=
khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:sol=
id;padding-left:1ex;border-left-color:rgb(204,204,204)">Signed-off-by: Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@g=
mail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/qemu/<a href=3D"http://qemu_6.2.0.bb" rel=3D"no=
referrer" target=3D"_blank">qemu_6.2.0.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_6.2.0.bb" re=
l=3D"noreferrer" target=3D"_blank">qemu_6.2.0.bb</a> b/meta/recipes-devtool=
s/qemu/<a href=3D"http://qemu_6.2.0.bb" rel=3D"noreferrer" target=3D"_blank=
">qemu_6.2.0.bb</a><br>
index 062ed32b015..c7eef0a9d5e 100644<br>
--- a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_6.2.0.bb" rel=3D"no=
referrer" target=3D"_blank">qemu_6.2.0.bb</a><br>
+++ b/meta/recipes-devtools/qemu/<a href=3D"http://qemu_6.2.0.bb" rel=3D"no=
referrer" target=3D"_blank">qemu_6.2.0.bb</a><br>
@@ -6,6 +6,8 @@ DEPENDS =3D &quot;glib-2.0 zlib pixman bison-native ninja-n=
ative meson-native&quot;<br>
<br>
=C2=A0DEPENDS:append:libc-musl =3D &quot; libucontext&quot;<br>
<br>
+CFLAGS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11=
&#39;, &#39;&#39;, &#39;-DEGL_NO_X11=3D1&#39;, d)}&quot;<br>
+<br>
=C2=A0RDEPENDS:${PN}:class-target +=3D &quot;bash&quot;<br>
<br>
=C2=A0EXTRA_OECONF:append:class-target =3D &quot; --target-list=3D${@get_qe=
mu_target_list(d)}&quot;<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#162946): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/162946" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/162946</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89652908/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89652908/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000002ed03405d9c2f9a5--

