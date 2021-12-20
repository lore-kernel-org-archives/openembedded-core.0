Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84CFCC433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 09:39:23 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web11.3507.1639993162427499371
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 01:39:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dmev7ho/;
 spf=pass (domain: gmail.com, ip: 209.85.221.178,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id j10so5650261vkk.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 01:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ssatE0jMBz2wCcJd+3QU5/VKpEHc7omodNI0aKpMhBg=;
        b=dmev7ho/tkGxeI39cX7/y5pZuBuuVsr3l797dCslCZEIWr4y0WerdlJETEoaQ+/Sat
         HBRfsEZ8EqgJq9FqAoBKvFa5PjtG6XoJ20uChX0TSRm514QbIGQx+M/hi8kf6I+qyNSd
         w0aUlXErCnyN919ZSgJK42L+ptAK93WiuJRb+ehgdJbge6TxO0A0WalYLpPyDUhywIUr
         Py1Cmn9XBkcK5J9v4jtXPiiaFk9obTwavae1eoT0BG/KzG5WXxd/KtBYFW5IITPJBIOT
         149ycBtQxgA0W0m0S2iAPkbrfx/tNc2Dvnu5FV3EVshq0GKM6n6Bw5A5Wy4axZjY0Oyh
         22aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ssatE0jMBz2wCcJd+3QU5/VKpEHc7omodNI0aKpMhBg=;
        b=cIBKCsyjtlAUr9pkIOef2kxVphkvn4qHWDV63KxFuoLoEBVpDZMei7Nwh3O9jPiYzB
         SV3RP/lRX/SjRlX3ZtDGwuiemQerLPKa76lfjGrp7Pn0mFf5qQeA+1EgVSa366xoYbI+
         s9nubjME7zWC4IFVq52Ed0LLZcZ0exeyDgSxJCiuQua82hk7M2SANtoai53F7h3bz7hA
         U73r+wU/ito8GUZPwTxFqTgnnlUv2iSQHTnrwu5/mpICYTotZRKz78Bs6Fc4daKSsKF+
         pyQpJzk/GpimHSuVcg2K5PZFqLUqMQNPjtoO/VzQQ40njYEC4sLGbSVZF8pc78SKGO5L
         fntA==
X-Gm-Message-State: AOAM530LSKgL0pb0k3b0m5tBjkzQBDDqUCJMAp9e+tg6P3Z9PNoz0fsj
	r1jV9L3r3tCqQ6RpoGnAsZGDN3MLn225rLd50oc=
X-Google-Smtp-Source: 
 ABdhPJz/uaKhUgDtBvF0XLOosS7deYn0AOe4FDcZcFTbYEEkax+uyJJNo2CT4mFzVQzrWIqwYNKqs645xlaDRTN17E4=
X-Received: by 2002:ac5:cfc4:: with SMTP id m4mr2464836vkf.30.1639993161531;
 Mon, 20 Dec 2021 01:39:21 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAMKF1sq2tnXmzSYGErx6XP_m=H-=f2ijwkgPYZPfCqeD8+AWTA@mail.gmail.com>
 <6300.1639991564379207141@lists.openembedded.org>
In-Reply-To: <6300.1639991564379207141@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Dec 2021 12:39:10 +0300
Message-ID: 
 <CANNYZj-B+g7Yd_na8i5d5uaJgzHJHjYA0Ljf6fkzXZw1seKGCQ@mail.gmail.com>
Subject: Re: [OE-core] [meta][dunfell][PATCH] boost: Add a NULL check for the
 pointer which causes a crash
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d3c42f05d390a97e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 09:39:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159855

--000000000000d3c42f05d390a97e
Content-Type: text/plain; charset="UTF-8"

No, as upstream explained, in this case the null indicates invalid internal
state, so the correct behavior for the program is indeed to halt the
program execution and for you it is to find out how the invalid internal
state occurs in the first place through debugging or similar.

Alex

Alex

On Mon 20. Dec 2021 at 12.12, Ranjitsinh Rathod <
ranjitsinhrathod1991@gmail.com> wrote:

> Steve,
>
> Earlier we have also thought the same things from the upstream issue
> comment and we have tried another workaround mentioned on the ticket which
> is disabled epoll.
> We have tried it and it didn't work for the project. we still facing the
> issue.
>
> Then we tried the NULL check for the variable. Maybe it's not a proper fix
> (just a workaround to check the pointer before accessing), but there is
> nothing wrong with checking the null before accessing any variable.
>
> Ranjitsinh
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159854):
> https://lists.openembedded.org/g/openembedded-core/message/159854
> Mute This Topic: https://lists.openembedded.org/mt/87787403/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d3c42f05d390a97e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">No, as upstream explained, in this case the null indicate=
s invalid internal state, so the correct behavior for the program is indeed=
 to halt the program execution and for you it is to find out how the invali=
d internal state occurs in the first place through debugging or similar.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon 20. Dec 2021 at 12.12, Ranjit=
sinh Rathod &lt;<a href=3D"mailto:ranjitsinhrathod1991@gmail.com">ranjitsin=
hrathod1991@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Steve,<br><b=
r>Earlier we have also thought the same things from the upstream issue comm=
ent and we have tried another workaround mentioned on the ticket which is d=
isabled epoll.<br>We have tried it and it didn&#39;t work for the project. =
we still facing the issue.<br><br>Then we tried the NULL check for the vari=
able. Maybe it&#39;s not a proper fix (just a workaround to check the point=
er before accessing), but there is nothing wrong with checking the null bef=
ore accessing any variable.<br><br>Ranjitsinh
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159854): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159854" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159854</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87787403/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87787403/1686489</a><br>
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

--000000000000d3c42f05d390a97e--

