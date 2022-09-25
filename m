Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EB9C04A95
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 16:54:41 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web09.18981.1664124874948901403
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 09:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oaYzh9hC;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id
 r22-20020a9d7516000000b00659ef017e34so3114769otk.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 09:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=nNCxzsw4NDFEZCJvrC9/Q8KM0cmJ+uzFgFR4qEGukI0=;
        b=oaYzh9hC8Pbb5I9lzXy2V9bWlQEQEz5KJpE3SUmzpAGyMOGJ6W4rTPKqPSaKJHHNhz
         LOMpq9ZXf3D3ZVX9u1PTnOq49wx9Ab96H3PuLOF+HqAhCsknEzosP6yeiCS4MCMISKXU
         Ft4puhAydSP1RMY4B7ZyoAVUpTSXKDds70vPi7AuYpL4tMzbT3GxRQ8sVL5RC3Gorhnr
         8oyGAvh2xObxs5CV0y35vZ1nOAz0uKFZNErQwv8f5hgTv6hlw3EjSOXJaeXBT2UWDsqo
         gmKdfrmSuPMbjoRYnxbT+b9l+H2Ta3gkkh2mZejJFf/Udb1wkKRfzhLmn6UWQNrTrXfv
         3xrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=nNCxzsw4NDFEZCJvrC9/Q8KM0cmJ+uzFgFR4qEGukI0=;
        b=cKLnKdtpL3uzcf+WZDRux/CVO5VquZVH28wgJyqkqjBwqZbZ0mr2J5BZ7AvMiBHQtB
         S34RUk7MWw3WASWDWEUs+YTQgg22+3qIZ+JQwjqyEuVyn7tF/BJ4TNuX9Xldkas70Zqa
         /dxb++7EaQf+aTyV0mtIbp16yjSbBALbUekTc9jn9KsjNqDoQVk6cJMT8eOJ56gHpQPD
         wB6KemcqZRTsUNjGhWvUCr9eO7zJeKVYT5FYnv+nQ1oTSXN0TskufDOJeewQwN4lXWNI
         LZiJhHQj2Tv3FNOJED077+zt5xv+BNR3+9W3HUT1heizZ2ItW3m7XD6OBgnkyOsG9H6Q
         qRTQ==
X-Gm-Message-State: ACrzQf0Q4gxZlataijwFrkeO3K2hF+leiH3Pf/0NkuJy9M6KVRh3m/pn
	qWoKterwvv9t5qXzVjOBuQFP1pf4nOJhvpfnTHs=
X-Google-Smtp-Source: 
 AMsMyM5sLauUdMk4A1hbQmUySIFaiyM8eDtILMcJXjlz49fCuT+7qLaFV58rXrpNJPnLD5xcxcPZ6iNmI5Efj7veUBs=
X-Received: by 2002:a05:6830:2019:b0:65b:f320:8cd2 with SMTP id
 e25-20020a056830201900b0065bf3208cd2mr6043399otp.111.1664124874071; Sun, 25
 Sep 2022 09:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220925143441.38925-1-changhyeok.bae@gmail.com>
In-Reply-To: <20220925143441.38925-1-changhyeok.bae@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 Sep 2022 09:54:23 -0700
Message-ID: 
 <CAMKF1spB9vUyasAxErWbEbKOY0ssse8a-wt9dGv--Gnh1i8BEQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 1/2] iproute2: Unset CLEANBROKEN
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fb237305e983437a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 16:54:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171013

--000000000000fb237305e983437a
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 25, 2022 at 7:35 AM Changhyeok Bae <changhyeok.bae@gmail.com>
wrote:

> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> ---
>  meta/recipes-connectivity/iproute2/iproute2.inc | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc
> b/meta/recipes-connectivity/iproute2/iproute2.inc
> index b1bcc1434c..c292b95e36 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> @@ -13,8 +13,6 @@ DEPENDS = "flex-native bison-native iptables libcap"
>
>  inherit update-alternatives bash-completion pkgconfig
>
> -CLEANBROKEN = "1"
> -


A bit of history how it is fixed would be helpful

>
>  PACKAGECONFIG ??= "tipc elf devlink"
>  PACKAGECONFIG[tipc] = ",,libmnl,"
>  PACKAGECONFIG[elf] = ",,elfutils,"
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171010):
> https://lists.openembedded.org/g/openembedded-core/message/171010
> Mute This Topic: https://lists.openembedded.org/mt/93907752/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000fb237305e983437a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Sep 25, 2022 at 7:35 AM Changhyeok Bae &lt;<a href=
=3D"mailto:changhyeok.bae@gmail.com">changhyeok.bae@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Changhyeok Bae &lt=
;<a href=3D"mailto:changhyeok.bae@gmail.com" target=3D"_blank">changhyeok.b=
ae@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/iproute2/iproute2.inc | 2 --<br>
=C2=A01 file changed, 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes=
-connectivity/iproute2/iproute2.inc<br>
index b1bcc1434c..c292b95e36 100644<br>
--- a/meta/recipes-connectivity/iproute2/iproute2.inc<br>
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc<br>
@@ -13,8 +13,6 @@ DEPENDS =3D &quot;flex-native bison-native iptables libca=
p&quot;<br>
<br>
=C2=A0inherit update-alternatives bash-completion pkgconfig<br>
<br>
-CLEANBROKEN =3D &quot;1&quot;<br>
-</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">A bit of histor=
y how it is fixed would be helpful=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
" dir=3D"auto"><br>
=C2=A0PACKAGECONFIG ??=3D &quot;tipc elf devlink&quot;<br>
=C2=A0PACKAGECONFIG[tipc] =3D &quot;,,libmnl,&quot;<br>
=C2=A0PACKAGECONFIG[elf] =3D &quot;,,elfutils,&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171010): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171010" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171010</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93907752/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93907752/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000fb237305e983437a--

