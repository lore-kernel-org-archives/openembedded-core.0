Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311E9C4167B
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 07:41:40 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.69745.1669966890965531677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 23:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zi0i8NYK;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so3588644wmi.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 23:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zcHx5RuBlvMMVy5aOGtnGp2c+v2AUafLkXSAy4UriNQ=;
        b=Zi0i8NYKyfF5/q7YfZGYM/cEsd2r2Jn54oB1js8irh4cP4RR3N9bulcI7qRKuqH56B
         8zQVp88okaGz1PHQeVkWtM8YQN0sD0Gs/B++MMdePM5dLtIJoto2VY3Eqzhs6RYbHC0Z
         +ZHeEMNzKAcQlw+LyWMj81nteDpo/HQjAa6fJiaJqUlLsyG2QW+6DlorZjtI5kD18Xpm
         2hQyZeE3uymHYpGl8fS/nqjoiLhbXVGxKkJ7tzIt1HztdRUgDljgUC4HVh1FDzdoAkB0
         6IgCLsdtYTXnB3gXl/pFbbOjBVkuRRR51YeaTzvjPza0o1t/Fayyzth6XuqCzzRvvmAb
         ic+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcHx5RuBlvMMVy5aOGtnGp2c+v2AUafLkXSAy4UriNQ=;
        b=g4Ht4/PvTG5/ebGldy88tXZL1O0gNd601eI/coq8+9j0OnBzdVI4jXoi0VIKcYsV1x
         z7/LzDG3qs3HKDeO1oAsUklso6Zzomy5iNhfXx4WBuNnN7NXzbLbHn4wm1g++nakYwIH
         RVf2Nfz25DgCzoyG25l4nYj/HH47H2j9nceHjWR7e2KlfcW4PF7XIhdhrjBxXLsaqkFX
         pBigDZnwIkVA61Wy5q8SZS8PJsFto0HzR0LmCqR9uipRTvKd5DCavln5npSLDfXJ7bpR
         mkdsUv+CBan0ILJt+JgCoGquhaY+Fyd6CdqIYXzUE9q12FC/Cn4hSvGqbql7Xs3qO3SJ
         bzBg==
X-Gm-Message-State: ANoB5pmz5uv8mBkuxonM0j8G0Toh9yGve5gUpms63mKxAk2KXOgC4edW
	CvtrFweYN0odpZT+3kbkEp/hrwwkFyZCSdeTuGo=
X-Google-Smtp-Source: AA0mqf5qMJXIWUBzDbzX+7ScWUi2MBUGV2asIEKStipC1HboROHX/9QzIkImohIxdUOebms8bbJAwlfQVmR3k3F7gZs=
X-Received: by 2002:a05:600c:1d81:b0:3cf:6ab3:4a60 with SMTP id
 p1-20020a05600c1d8100b003cf6ab34a60mr39924557wms.32.1669966889129; Thu, 01
 Dec 2022 23:41:29 -0800 (PST)
MIME-Version: 1.0
References: <20185.1668683543873254772@lists.openembedded.org> <4965.1669954979811583031@lists.openembedded.org>
In-Reply-To: <4965.1669954979811583031@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 2 Dec 2022 08:41:16 +0100
Message-ID: <CA+chaQevcAt2WTkKONqrgjY+ULQCXm92GyPFiFOORqQsiUyzLQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] curl: Fix multiple CVEs
To: Hitendra Prajapati <hpprajapati@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000369a8e05eed3774a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 07:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174224

--000000000000369a8e05eed3774a
Content-Type: text/plain; charset="UTF-8"

I see the same fixes with correct Author in .patch files (please don't
change the Author when you're just backporting a patch from someone else)
queued from someone else in kirkstone-nut branch:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=stable/kirkstone-nut&id=518bea85c9496d77c70d703b818e442eda841554
https://git.openembedded.org/openembedded-core-contrib/commit/?h=stable/kirkstone-nut&id=e6796b426503477620e0e5c5c9da50352269a593
https://git.openembedded.org/openembedded-core-contrib/commit/?h=stable/kirkstone-nut&id=4754f33d7ec96f72351853463540c8b1a3f4bc0c
so they should be applied soon.

On Fri, Dec 2, 2022 at 5:23 AM Hitendra Prajapati <hpprajapati@mvista.com>
wrote:

> Hi Steve/Team ,
> Any update or issue with this patches ?? Why it is not picked or merged ?
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174219):
> https://lists.openembedded.org/g/openembedded-core/message/174219
> Mute This Topic: https://lists.openembedded.org/mt/94800386/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000369a8e05eed3774a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I see the same fixes with correct Author in .patch files (=
please don&#39;t change the Author when you&#39;re just backporting a patch=
 from someone else) queued from someone else in kirkstone-nut branch:<div><=
a href=3D"https://git.openembedded.org/openembedded-core-contrib/commit/?h=
=3Dstable/kirkstone-nut&amp;id=3D518bea85c9496d77c70d703b818e442eda841554">=
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/k=
irkstone-nut&amp;id=3D518bea85c9496d77c70d703b818e442eda841554</a><br></div=
><div><a href=3D"https://git.openembedded.org/openembedded-core-contrib/com=
mit/?h=3Dstable/kirkstone-nut&amp;id=3De6796b426503477620e0e5c5c9da50352269=
a593">https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dst=
able/kirkstone-nut&amp;id=3De6796b426503477620e0e5c5c9da50352269a593</a><br=
></div><div><a href=3D"https://git.openembedded.org/openembedded-core-contr=
ib/commit/?h=3Dstable/kirkstone-nut&amp;id=3D4754f33d7ec96f72351853463540c8=
b1a3f4bc0c">https://git.openembedded.org/openembedded-core-contrib/commit/?=
h=3Dstable/kirkstone-nut&amp;id=3D4754f33d7ec96f72351853463540c8b1a3f4bc0c<=
/a><br></div><div>so they should be applied soon.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 2, 2022 =
at 5:23 AM Hitendra Prajapati &lt;<a href=3D"mailto:hpprajapati@mvista.com"=
>hpprajapati@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Hi Steve/Team ,<br>Any update or issue with this pat=
ches ?? Why it is not picked or merged ?
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#174219): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/174219" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/174219</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94800386/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94800386/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000369a8e05eed3774a--

