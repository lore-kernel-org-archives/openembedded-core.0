Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96BA1C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 13:57:34 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web08.11792.1656511052016384716
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 06:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oJ6GyaDd;
 spf=pass (domain: gmail.com, ip: 209.85.208.179,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id n15so19034402ljg.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 06:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EalZHc8Nk9b1XzNxV7DyxmjxD6iEKX6LwNlVl3Iemm0=;
        b=oJ6GyaDdw7k4kmmoHzewrhfSd8SYPzkjZOxg1MahHZCCIOh4h72OeBAXyrAN9HIopZ
         dyMvIVgiczEkoBwynd7YxR5gteROUV1W0UAdqMQM+KbGmau1PzereRoBlubxpHTCBEjR
         BqPsLFdgNtW2g2alAnnnvXFnqGY+T3UgTLeZkvnpjtSeIrdVdQB3OxtJQqO8ecZ+2uaJ
         EQeQABkK+bW9fAqHVsSxwrEpVIqaethzDosB8fohD6y7b7wd9STwmeQ8lAmpwFV/2chK
         9fA0nBLhHZUpFFqW4vrTEP2Rq+E0/aAD1pq7dBuubOZflR1kbtRL7AbMvO5jCaI/i5Mu
         o+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EalZHc8Nk9b1XzNxV7DyxmjxD6iEKX6LwNlVl3Iemm0=;
        b=cf5Moqk4xD1OFrUHuh9VkP7mgW/2sBF8GG+n3E7u9pCkzcxQTj5907+9t6ypsKu0En
         iqfZd2evy+CpoOyIDUTwpNQhasbNVdF6oigCLFhAXTJI1p9KhkqtrrdBPqdWXbHUIdEj
         YozOBr6VD4c2Hcxamwk/hShHH8Nt2VfZa9g8GK71Mty0jtSlyJ99vriOMFeslsce3dX1
         U2zUH/2lDOa1wv72ZyEA3e245A8O+v5YtRgItXC1NLd3TPQOLheatdCYFuy9BG10IUd5
         f9Cee2q/rK7wOor2p+0LFAFE4ZPyjjv27WNrLMvsy3LPJRxEIssHtW2SqvMGLGutX4D1
         FNuw==
X-Gm-Message-State: AJIora9kyZzZ0euo35IqEdaiCVFS+aiFl2AkvRd7C5d4gngdAxLy0is5
	MY1iVe9CQuccb4MLaV0W98izpcn3f6rsHCSWVe8=
X-Google-Smtp-Source: 
 AGRyM1szjkic4dysGZNyPjeoOUZk0IAiE2wu7VBS/KoHjAjDPVcc0TjqkmoDFgjG5N2CPGIlIzX67i1f2goSCAMFmCU=
X-Received: by 2002:a05:651c:4c7:b0:25a:755d:5f9f with SMTP id
 e7-20020a05651c04c700b0025a755d5f9fmr1785261lji.109.1656511050022; Wed, 29
 Jun 2022 06:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220629132621.581615-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220629132621.581615-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Jun 2022 16:57:18 +0300
Message-ID: 
 <CANNYZj8mU1djPZBVQHFa_=FBL1tUw6OXH0AJ8VDKPX+bEmqbYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vim: 8.2.5083 -> 9.0.0005
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b401e405e2968879"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 13:57:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167376

--000000000000b401e405e2968879
Content-Type: text/plain; charset="UTF-8"

Would it be better to stay at 9.0.0000 for now?

Alex

On Wed 29. Jun 2022 at 16.26, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> The license checksum changed due to a major version change in the
> referenced file.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../vim/{vim-tiny_8.2.bb => vim-tiny-9.0.bb}                | 0
>  meta/recipes-support/vim/vim.inc                            | 6 +++---
>  meta/recipes-support/vim/{vim_8.2.bb => vim_9.0.bb}         | 0
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-support/vim/{vim-tiny_8.2.bb => vim-tiny-9.0.bb}
> (100%)
>  rename meta/recipes-support/vim/{vim_8.2.bb => vim_9.0.bb} (100%)
>
> diff --git a/meta/recipes-support/vim/vim-tiny_8.2.bb
> b/meta/recipes-support/vim/vim-tiny-9.0.bb
> similarity index 100%
> rename from meta/recipes-support/vim/vim-tiny_8.2.bb
> rename to meta/recipes-support/vim/vim-tiny-9.0.bb
> diff --git a/meta/recipes-support/vim/vim.inc
> b/meta/recipes-support/vim/vim.inc
> index 06707dbe112..b85f34d6c8e 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -11,7 +11,7 @@ RSUGGESTS:${PN} = "diffutils"
>
>  LICENSE = "Vim"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99 \
> -
> file://runtime/doc/uganda.txt;md5=daf48235bb824c77fe8ae88d5f575f74"
> +
> file://runtime/doc/uganda.txt;md5=001ef779f422a0e9106d428c84495b4d"
>
>  SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
>             file://disable_acl_header_check.patch \
> @@ -21,8 +21,8 @@ SRC_URI = "git://
> github.com/vim/vim.git;branch=master;protocol=https \
>             file://racefix.patch \
>             "
>
> -PV .= ".5083"
> -SRCREV = "db77c49401145d76441fbb3d22a1d7d987681c13"
> +PV .= ".0005"
> +SRCREV = "040674129f3382822eeb7b590380efa5228124a8"
>
>  # Remove when 8.3 is out
>  UPSTREAM_VERSION_UNKNOWN = "1"
> diff --git a/meta/recipes-support/vim/vim_8.2.bb
> b/meta/recipes-support/vim/vim_9.0.bb
> similarity index 100%
> rename from meta/recipes-support/vim/vim_8.2.bb
> rename to meta/recipes-support/vim/vim_9.0.bb
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167375):
> https://lists.openembedded.org/g/openembedded-core/message/167375
> Mute This Topic: https://lists.openembedded.org/mt/92064575/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b401e405e2968879
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Would it be better to stay at 9.0.0000 for now?</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 29. Jun 2022 at 1=
6.26, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,2=
04)">The license checksum changed due to a major version change in the refe=
renced file.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0.../vim/{<a href=3D"http://vim-tiny_8.2.bb" rel=3D"noreferrer" target=
=3D"_blank">vim-tiny_8.2.bb</a> =3D&gt; <a href=3D"http://vim-tiny-9.0.bb" =
rel=3D"noreferrer" target=3D"_blank">vim-tiny-9.0.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A0meta/recipes-support/vim/vim.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 +++---<b=
r>
=C2=A0meta/recipes-support/vim/{<a href=3D"http://vim_8.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">vim_8.2.bb</a> =3D&gt; <a href=3D"http://vim_9.0.bb=
" rel=3D"noreferrer" target=3D"_blank">vim_9.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 0<br>
=C2=A03 files changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta/recipes-support/vim/{<a href=3D"http://vim-tiny_8.2.bb" r=
el=3D"noreferrer" target=3D"_blank">vim-tiny_8.2.bb</a> =3D&gt; <a href=3D"=
http://vim-tiny-9.0.bb" rel=3D"noreferrer" target=3D"_blank">vim-tiny-9.0.b=
b</a>} (100%)<br>
=C2=A0rename meta/recipes-support/vim/{<a href=3D"http://vim_8.2.bb" rel=3D=
"noreferrer" target=3D"_blank">vim_8.2.bb</a> =3D&gt; <a href=3D"http://vim=
_9.0.bb" rel=3D"noreferrer" target=3D"_blank">vim_9.0.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-support/vim/<a href=3D"http://vim-tiny_8.2.bb" re=
l=3D"noreferrer" target=3D"_blank">vim-tiny_8.2.bb</a> b/meta/recipes-suppo=
rt/vim/<a href=3D"http://vim-tiny-9.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">vim-tiny-9.0.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-support/vim/<a href=3D"http://vim-tiny_8.2.bb" rel=
=3D"noreferrer" target=3D"_blank">vim-tiny_8.2.bb</a><br>
rename to meta/recipes-support/vim/<a href=3D"http://vim-tiny-9.0.bb" rel=
=3D"noreferrer" target=3D"_blank">vim-tiny-9.0.bb</a><br>
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vi=
m.inc<br>
index 06707dbe112..b85f34d6c8e 100644<br>
--- a/meta/recipes-support/vim/vim.inc<br>
+++ b/meta/recipes-support/vim/vim.inc<br>
@@ -11,7 +11,7 @@ RSUGGESTS:${PN} =3D &quot;diffutils&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;Vim&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D6b30ea4fa660c483b6199=
24bc709ef99 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://runtime/doc/uganda.txt;md5=3Ddaf48235bb824c77fe8ae88d5f575f74&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://runtime/doc/uganda.txt;md5=3D001ef779f422a0e9106d428c84495b4d&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/vim/vim.git;bran=
ch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.c=
om/vim/vim.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://disable_acl_header_check.p=
atch \<br>
@@ -21,8 +21,8 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/vim/=
vim.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://racefix.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-PV .=3D &quot;.5083&quot;<br>
-SRCREV =3D &quot;db77c49401145d76441fbb3d22a1d7d987681c13&quot;<br>
+PV .=3D &quot;.0005&quot;<br>
+SRCREV =3D &quot;040674129f3382822eeb7b590380efa5228124a8&quot;<br>
<br>
=C2=A0# Remove when 8.3 is out<br>
=C2=A0UPSTREAM_VERSION_UNKNOWN =3D &quot;1&quot;<br>
diff --git a/meta/recipes-support/vim/<a href=3D"http://vim_8.2.bb" rel=3D"=
noreferrer" target=3D"_blank">vim_8.2.bb</a> b/meta/recipes-support/vim/<a =
href=3D"http://vim_9.0.bb" rel=3D"noreferrer" target=3D"_blank">vim_9.0.bb<=
/a><br>
similarity index 100%<br>
rename from meta/recipes-support/vim/<a href=3D"http://vim_8.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">vim_8.2.bb</a><br>
rename to meta/recipes-support/vim/<a href=3D"http://vim_9.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">vim_9.0.bb</a><br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167375): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167375" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167375</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92064575/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92064575/1686489</a><br>
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

--000000000000b401e405e2968879--

