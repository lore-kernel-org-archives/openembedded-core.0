Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F36C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:46:45 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.20.1679672802090282484
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DUcC7gpK;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5447d217bc6so40004037b3.7
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679672801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G3+UKjmKt/VqWO3/9B3RAmCaBB7GkE8zURj5GZYxcDg=;
        b=DUcC7gpKUjLIZ3IaJL31fvrENUSA/LVHIDO//xBk/sG/TFhx51JINrFC/E+8l2kCtr
         xRNjtikLjXUkZWWPwL+ynG1DQbXMn/VPVeIEbn4F3FJ+wdeBpl+Bte0Uj0Dm47cTd2Eo
         TfU4RqbpKLCw7704EO7FD6EimT/8L0ctN+9iBHmBn6HK13HOsBEHeMpirouMf6NNWQxp
         OOQ34RI01Ji+Q/VBSVLAqHZYSkvmXenzDoVnZuJRVcXLJRrl0f8x486R/Ooaq+BWXw7/
         3sArivJE41t0wT9KBKATL9A1KxCUyhs2r+JZPLBnq6vzYWH+LObge55Scugl6+89Z7TK
         fYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679672801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3+UKjmKt/VqWO3/9B3RAmCaBB7GkE8zURj5GZYxcDg=;
        b=bjEIS3FnomXfcV3GxYWFY70EcErO42gCbcqbf7hU4zXlCNLnM98zuEA5SXIWVnR9Gd
         lrOcrKtTmlsWADJxhbF1+B705j8TpjpRuP4lrxZaxGyuJhvP30RLHqCaPLTgEZr+bVru
         YMVl0hSIFVdQ+Imo6hlBZxDGl8dlplVcjIb1sD3/kcS8LiiExN/DXeBcnzrwFph22U4k
         2/DpbfJ0nOiMi+mH2OD5cAddwtDw81qLubxhkd0xl0gDmjTYzwPjH6AI+BR6jwvKCm5g
         xU4R+5+7yfIqtSggheO5n+p6H4azSMzvAs2ydgmbKO4oGn8q5DrNQVH22wBQ31E4Y/WR
         +9Rw==
X-Gm-Message-State: AAQBX9f1dEW3fMExcvi2CHNFUIgoZQJE6+6aDJjKeYjZOShdSId62OQU
	6DPLhHQ6ZNDt+hKeKa1hcbxVhg97XT4YU4TIy9RqW9iyjyg=
X-Google-Smtp-Source: AKy350ZfQdLgZHQBUevlTKY8iIvdl/jOjqzA4nbUTao0riHe833k/JTRglXtPhdHw30nR42hGyvwpcZoopUDD1ooMl8=
X-Received: by 2002:a81:b388:0:b0:545:8202:bbcf with SMTP id
 r130-20020a81b388000000b005458202bbcfmr1197661ywh.9.1679672800975; Fri, 24
 Mar 2023 08:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230324152238.194877-1-kubiznak@2n.com> <20230324152238.194877-3-kubiznak@2n.com>
In-Reply-To: <20230324152238.194877-3-kubiznak@2n.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 24 Mar 2023 08:46:30 -0700
Message-ID: <CANx9H-BZDPv8a6F5VCFUbYMq1jEBda1BKE1uJf53PDeAvx7r6g@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 3/6] python3-pygobject: depend on gobject-introspection
To: =?UTF-8?B?UGV0ciBLdWJpesWIw6Fr?= <kubiznak@2n.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a41e9005f7a74c76"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179072

--000000000000a41e9005f7a74c76
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2023 at 8:24=E2=80=AFAM Petr Kubiz=C5=88=C3=A1k <kubiznak@2=
n.com> wrote:

> When g-i feature is disabled, the gobject-introspection package
> dependency is not pulled in but pygobject has a hard dependency on it.
>
> Signed-off-by: Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com>
> ---
>  meta/recipes-devtools/python/python3-pygobject_3.42.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb
> b/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb
> index cc7b07e804..f54f4ce784 100644
> --- a/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb
> +++ b/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb
> @@ -10,7 +10,7 @@ GIR_MESON_OPTION =3D ""
>
>  inherit gnomebase setuptools3-base gobject-introspection
> upstream-version-is-even
>
> -DEPENDS +=3D "python3 glib-2.0"
> +DEPENDS +=3D "python3 glib-2.0 gobject-introspection"
>

This is not needed. It is already added by the inherited
gobject-introspection class
https://git.yoctoproject.org/poky/tree/meta/classes-recipe/gobject-introspe=
ction.bbclass#n38


>

 SRCNAME=3D"pygobject"
>
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179064):
> https://lists.openembedded.org/g/openembedded-core/message/179064
> Mute This Topic: https://lists.openembedded.org/mt/97825895/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a41e9005f7a74c76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 24, 2023 at 8:24=E2=80=AF=
AM Petr Kubiz=C5=88=C3=A1k &lt;<a href=3D"mailto:kubiznak@2n.com">kubiznak@=
2n.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">When g-i feature is disabled, the gobject-introspection package<br>
dependency is not pulled in but pygobject has a hard dependency on it.<br>
<br>
Signed-off-by: Petr Kubiz=C5=88=C3=A1k &lt;<a href=3D"mailto:kubiznak@2n.co=
m" target=3D"_blank">kubiznak@2n.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-pygobject_3.42=
.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygobject_3.42.2.bb</a>=
 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-pygobje=
ct_3.42.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygobject_3.42.2=
.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-pygobject_=
3.42.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygobject_3.42.2.bb=
</a><br>
index cc7b07e804..f54f4ce784 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-pygobject_3.42=
.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygobject_3.42.2.bb</a>=
<br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-pygobject_3.42=
.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygobject_3.42.2.bb</a>=
<br>
@@ -10,7 +10,7 @@ GIR_MESON_OPTION =3D &quot;&quot;<br>
<br>
=C2=A0inherit gnomebase setuptools3-base gobject-introspection upstream-ver=
sion-is-even<br>
<br>
-DEPENDS +=3D &quot;python3 glib-2.0&quot;<br>
+DEPENDS +=3D &quot;python3 glib-2.0 gobject-introspection&quot;<br></block=
quote><div><br></div><div>This is not needed. It is already added by the in=
herited gobject-introspection class</div><div><a href=3D"https://git.yoctop=
roject.org/poky/tree/meta/classes-recipe/gobject-introspection.bbclass#n38"=
>https://git.yoctoproject.org/poky/tree/meta/classes-recipe/gobject-introsp=
ection.bbclass#n38</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">=C2=A0</blockquote><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
=C2=A0SRCNAME=3D&quot;pygobject&quot;<br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179064): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179064" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/179064</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97825895/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
97825895/924729</a><br>
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

--000000000000a41e9005f7a74c76--

