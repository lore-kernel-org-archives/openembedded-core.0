Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C223C04A94
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 03:30:45 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.6586.1691033439939546118
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 20:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=bvc6gSNJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-583a8596e2aso4639587b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 20:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691033439; x=1691638239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YbZRUM/NYihfzFbsbH8jDbtjhrJ9Vh8XNfMxXPOzGEg=;
        b=bvc6gSNJC91jRPONcRjzlQ319kD8IjRg6/g95kIug0tqIod13ejZnLRw2AEfOv99Qo
         8FCN7+WxcQFagB6r7dDIx6F6uLZWqWN+stoEKstramkXq8DrfUA+nAk3x3NSDq3O2PCL
         07eG2rt72EMhj+7G6N4xTQYlyvDMFj25NOhORVsW9lkFl7lPjfPZLXSHu2gtNGh5ftmd
         lQatxYD33uSiykrmUFkZzWThbl8ha7sU9YivY1I7ETGV+hKkgF9AkrK5z4NXsloMErEA
         fWTboSrjK2vA/MDQVMdkmq9DdQ/eyQSEmti0n7sy+m9TPZvFIpAKe3QKRpqy14eyCg8L
         ySmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691033439; x=1691638239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbZRUM/NYihfzFbsbH8jDbtjhrJ9Vh8XNfMxXPOzGEg=;
        b=g9bIRMYzVx+Rz9FGE6EyzA/qZnemLMaS6BbQ/AmtyRMKmRxTueIae++NcSHquLKUaB
         dnWSXLJgLaFxeeDLMaLuDsgUreJ3FA6VfygVj1yygCw1WbxJBrC6YB3LqzkBAPu+a3Ea
         lYJdUvNQG0mJPHTlu+81gjnuzrgpeHA/if4c0xYf/XE+oWeBSMTSuM4d6urAtDFUola2
         hweka7ZjXpey7/WHkWrru6jBNT7exsXVIk2sqIg6NU5EwfZPltXeW3y5KwMJVkyxegst
         iYdTr0Ruay9cttodkWWwvmug0Vgan5zsQx1+MrfUUo3YheSL/ELNJrFVZE9pc0aRSgla
         MEOQ==
X-Gm-Message-State: ABy/qLbA5X+gHs4+CX7JjrzhiBfbJLhHCZGbSm1UE+OTe0bbD81jftDX
	UG2D/x/VsC8piDUKwqpuebmRuqwsLcDblL0x6oUfSOK0
X-Google-Smtp-Source: APBJJlH8iNUgs7JPAYW4uKWyoybWw0e7qOdw6GrsLZL7keNW5O4jTp+GtO3oSN0+pbnfIWhUF3SS5afrEGMpPuHtb5A=
X-Received: by 2002:a0d:e691:0:b0:576:9d2e:ef2b with SMTP id
 p139-20020a0de691000000b005769d2eef2bmr14723807ywe.10.1691033438930; Wed, 02
 Aug 2023 20:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230802072436.1020900-1-alex@linutronix.de> <20230802072436.1020900-2-alex@linutronix.de>
In-Reply-To: <20230802072436.1020900-2-alex@linutronix.de>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 2 Aug 2023 20:30:28 -0700
Message-ID: <CANx9H-D_XcDa7xoWV9MS=aQBQFXMbfad3ieYkGwOrkM6qjbJrQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] scripts/lib/scriptutils.py: add recipe_qa
 artifacts to exclusion list in filter_src_subdirs()
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006e4c5b0601fc67b3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 03:30:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185451

--0000000000006e4c5b0601fc67b3
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 2, 2023 at 12:24 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> With newly added recipe_qa task, the function needs to filter out its
> output as well.
>
> The issue wouldn't appear in selftest because it's triggered by
> buildhistory and
> selftest disables that.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>


Tested-by: Tim Orling <tim.orling@konsulko.com>

>
> ---
>  scripts/lib/scriptutils.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
> index f7c1bd9e4e2..f433106c9a8 100644
> --- a/scripts/lib/scriptutils.py
> +++ b/scripts/lib/scriptutils.py
> @@ -277,6 +277,6 @@ def filter_src_subdirs(pth):
>      Used by devtool and recipetool.
>      """
>      dirlist = os.listdir(pth)
> -    filterout = ['git.indirectionsymlink', 'source-date-epoch']
> +    filterout = ['git.indirectionsymlink', 'source-date-epoch',
> 'sstate-install-recipe_qa']
>      dirlist = [x for x in dirlist if x not in filterout]
>      return dirlist
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185379):
> https://lists.openembedded.org/g/openembedded-core/message/185379
> Mute This Topic: https://lists.openembedded.org/mt/100500738/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000006e4c5b0601fc67b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Aug 2, 2023 at 12:24 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">With newly added recipe_qa task, th=
e function needs to filter out its output as well.<br>
<br>
The issue wouldn&#39;t appear in selftest because it&#39;s triggered by bui=
ldhistory and<br>
selftest disables that.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;</blockquote><div dir=3D"auto">=
<br></div><div dir=3D"auto">Tested-by: Tim Orling &lt;<a href=3D"mailto:tim=
.orling@konsulko.com">tim.orling@konsulko.com</a>&gt;<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex" dir=3D"auto"><br>
---<br>
=C2=A0scripts/lib/scriptutils.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py<br>
index f7c1bd9e4e2..f433106c9a8 100644<br>
--- a/scripts/lib/scriptutils.py<br>
+++ b/scripts/lib/scriptutils.py<br>
@@ -277,6 +277,6 @@ def filter_src_subdirs(pth):<br>
=C2=A0 =C2=A0 =C2=A0Used by devtool and recipetool.<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0dirlist =3D os.listdir(pth)<br>
-=C2=A0 =C2=A0 filterout =3D [&#39;git.indirectionsymlink&#39;, &#39;source=
-date-epoch&#39;]<br>
+=C2=A0 =C2=A0 filterout =3D [&#39;git.indirectionsymlink&#39;, &#39;source=
-date-epoch&#39;, &#39;sstate-install-recipe_qa&#39;]<br>
=C2=A0 =C2=A0 =C2=A0dirlist =3D [x for x in dirlist if x not in filterout]<=
br>
=C2=A0 =C2=A0 =C2=A0return dirlist<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#185379): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/185379" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/185379</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100500738/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/100500738/924729</a><br>
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

--0000000000006e4c5b0601fc67b3--

