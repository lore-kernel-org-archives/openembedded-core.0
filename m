Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A93C6FA83
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 18:57:59 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.2582.1663009073939396196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 11:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JCBR52U7;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 c2-20020a1c3502000000b003b2973dafb7so11661151wma.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 11:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Gd+WhPQLHOl/HSkcshFbnE5J4nODs9FJOorgOGF/Hk0=;
        b=JCBR52U7RuA76lC8b9QaFIp2eqTMWbE/Z2DF3JaZApHS+v/XufKLRWagsn8zpgOIM1
         nNN1QyxTQ4PBRcHdDC5VpMDbnUyM7W/VKdxCS2y8UCQktVnka5jhvOEfZScZAdhBYLKs
         a5pEMK6ePtm9JKCkESSWO+AsLPNYy3bGVle8e/RlTgGHYSRYkKNcvHqD56kZpSUBmGCC
         /k3hy35ZUIEj5l8vk6AR3WdgXEFwkJ/0cpHOeKaH5FXxZzXCFRtnTvRQhNS0t35g1yyM
         crseZKP13xTGgaEGTBgx3FJLee96tP6bTEiQUNLQlIlPKfKEy6VcZ7F2WYG33mFGueZt
         W2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Gd+WhPQLHOl/HSkcshFbnE5J4nODs9FJOorgOGF/Hk0=;
        b=gM9uQfkPbezTSOHDPL9csSO+D9xsg9ZOCTliN9RMMDbelCTyvcWxS3tKwwgJhlHhqw
         64FoBrtDAecTfKy7aTkbaIaR/E4rM9VQV4xsIU5WO7nVA9BOJ1P/3LyQbEwN5L/YOacD
         XGPc0QIYNe0uXKU3nl9x5OIPOGOK+/vaTXDHLetN0Qjx812KF1CiE9vVYaQRXfcDkJ7G
         qoxWcdI97ZQrCiJSfjXuviorCKsZWY3QWsAi9GFXl5wys3+TlxGK7AsdLNeD0mPA1uEr
         VZ91nAgPJIskVHtwdVRYgziqeN504QlWs9g6QGHl+I9A2HkrUE1iCr2/R0LNhhpc8NOT
         e6jQ==
X-Gm-Message-State: ACgBeo2SNghBnUC1T7uYGLe1hxifs/k4qYhXjhuteqNVmWw1MQ1RX341
	H8bKBwdQhrbmyN8Y3EirAozEAYXPmzpsOaoqT8Q=
X-Google-Smtp-Source: 
 AA6agR4WbVr94U9hYosLr66rx2lVbVjStsJzCneVmVnoq5W4UyTbV7nkaqHmELZnhzEYpcpnMoyePL+pTak0ujhi3yg=
X-Received: by 2002:a05:600c:3844:b0:3a6:123:5ac5 with SMTP id
 s4-20020a05600c384400b003a601235ac5mr14713010wmr.102.1663009072062; Mon, 12
 Sep 2022 11:57:52 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAOSpxdY3j8DAsOQGhG9w1BJi+2ao4sO_KLvbkxX70fwbq8BfzQ@mail.gmail.com>
 <CAApg2=RssQ94dKngx=5ph_QbyZsWnqS7LRJ9rg67Q6b6bZbMWw@mail.gmail.com>
In-Reply-To: 
 <CAApg2=RssQ94dKngx=5ph_QbyZsWnqS7LRJ9rg67Q6b6bZbMWw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 12 Sep 2022 20:57:39 +0200
Message-ID: 
 <CA+chaQcks8Dmpp0zgizGfqSsRbp+YxMMvsgmae6YutVP5mar4A@mail.gmail.com>
Subject: Re: [OE-core] CVE raffle: collision avoidance
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ffab8f05e87f787a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 18:57:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170541

--000000000000ffab8f05e87f787a
Content-Type: text/plain; charset="UTF-8"

You mean this list?
https://lists.yoctoproject.org/g/yocto-security/message/655

On Mon, Sep 12, 2022 at 8:56 PM Marta Rybczynska <rybczynska@gmail.com>
wrote:

>
>
>
> On Mon, 12 Sept 2022, 17:55 Steve Sakoman, <steve@sakoman.com> wrote:
>
>> Reply to this thread noting which CVE you plan to work on.  Please
>> don't claim one unless you really intend to follow through!
>>
>> Hello Steve,
> What about sending the list of pending CVEs (from the existing
> dunfell/kirkstone/master lists) for easier tracking?
>
> Kind regards,
> Marta
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170540):
> https://lists.openembedded.org/g/openembedded-core/message/170540
> Mute This Topic: https://lists.openembedded.org/mt/93637108/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000ffab8f05e87f787a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You mean this list?</div><a href=3D"https://lists.yoc=
toproject.org/g/yocto-security/message/655">https://lists.yoctoproject.org/=
g/yocto-security/message/655</a><br></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 12, 2022 at 8:56 PM Marta R=
ybczynska &lt;<a href=3D"mailto:rybczynska@gmail.com">rybczynska@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"auto"><div><br><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 12 =
Sept 2022, 17:55 Steve Sakoman, &lt;<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Reply to this thread noting which CVE you =
plan to work on.=C2=A0 Please<br>
don&#39;t claim one unless you really intend to follow through!<br>
<br></blockquote><div>Hello Steve,</div><div>What about sending the list of=
 pending CVEs (from the existing dunfell/kirkstone/master lists) for easier=
 tracking?</div><div><br></div><div>Kind regards,</div><div>Marta <br></div=
></div></div></div>
</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#170540): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/170540" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/170540</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93637108/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93637108/3617156</a><br>
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

--000000000000ffab8f05e87f787a--

