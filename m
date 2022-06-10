Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70547C43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 09:12:58 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.24775.1654852373921906492
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 02:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FkPRpkfA;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 o37-20020a05600c512500b0039c4ba4c64dso826116wms.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 02:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lZJqSwXmPD9vqM5UfZi6o6rZEXFbp2660wSdvGLXDWA=;
        b=FkPRpkfA2ICgkXsG/tPYBOxbWCOL6TZiughMbC869ehgOxyFQc2+uzY+D9lTYvXC/T
         1BhOkzLaUnTyhW1ycfDWVYVzFOYFTxHTEWBaT5faLXz1ykruqOH61fDxO+pUvU/ly/9X
         L1HRJFulFv6GCDb0uPZdQxWUJx2jmngw7o7HyXMPWrY441p0sk8lBh0B/ztFT/6ov7QC
         VyUK+p75goDPGTRxP5Qe6tOudsUN4HP8Jtn4ImjFZufDVO+ze9oVySyVzVljmLc2g0b0
         9FHBLqv0JA6ILZSFwyFg4hEwlZA/xgKU6fIVBzE8QsJj+jk42Xlv/dmXgBLkXK/XFHKZ
         G84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lZJqSwXmPD9vqM5UfZi6o6rZEXFbp2660wSdvGLXDWA=;
        b=IKX1msWEcI2E/RNTwHQ9RRe0Y22/OTNgf5o8mqKZXZljnn2EiyxdW/55f6gPkLXDr7
         /pnc2dnZDNe/3uBavHyZMbuOrrmDJLQGd0393eMBn0IgAXgMAxLbhap57c6WqTcEeYIs
         WbVWcJfd+JWOlVv3fgmE5ORNi4ezfnQ/nw33EvSHE8nniWCmi/rIMcxTZykUT7dFIq2f
         Rfa1g56SsX0BgXXb3Iiw36M92mMJAskMEkElTWGiX+xBXLqe4ZNf95yMboashPWbfJJu
         d5GC67hOU0zBPKJNcogZPOZ+FnN5h3ZdSaY+TTW2qa7ad1z+9ynnIgKzhH7WyK355ICf
         t9Aw==
X-Gm-Message-State: AOAM5311WHCPaU88TCe8qml8JiiTrSTRN4x9gPR79qs3fEWH5pa3cXl4
	R0jrzkGMtTVnuY/Iosjdoxp7FPc7MFoJMAGpSoI=
X-Google-Smtp-Source: 
 ABdhPJxvfD1MarlQyK+cGoIx7bu7dilfBMH1WeKBJU9L+aKh6yhw90bWbYeuC22VnVodEH4UaRN0Pn2N8sgrDDD/hxg=
X-Received: by 2002:a05:600c:2e47:b0:39c:37f5:cd74 with SMTP id
 q7-20020a05600c2e4700b0039c37f5cd74mr7759179wmf.32.1654852372212; Fri, 10 Jun
 2022 02:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1654188574.git.steve@sakoman.com>
 <11399.1654850358021809382@lists.openembedded.org>
In-Reply-To: <11399.1654850358021809382@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 10 Jun 2022 11:12:36 +0200
Message-ID: 
 <CA+chaQevwOdx8w6bGNqwX1=WBN9WnBgHv+EBkUOf8cT7Z=NbjA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone 00/26] Patch review
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cd302f05e1145795"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 09:12:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166791

--000000000000cd302f05e1145795
Content-Type: text/plain; charset="UTF-8"

Don't know if it was intentional, but these patches seem to be moved to
stable/kirkstone-next:
http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

On Fri, Jun 10, 2022 at 10:39 AM Sundeep KOKKONDA <
sundeep.kokkonda@gmail.com> wrote:

> Hello Steve,
>
> I am planning to do a regression test on gcc-11.3 and cloned the repo from
> given link '*git://git.openembedded.org/openembedded-core-contrib
> <http://git.openembedded.org/openembedded-core-contrib>
> stable/kirkstone-nut*' but I did not get these patches included in the
> cloned repository. I could still see gcc-11.2 cloned. Also, I verified
> patches in rust-common file, those are also not updated.
>
> Can you let me know does this repo is correct or I've do anything else to
> get these patches?
>
>
> Thanks,
> Sundeep K.
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166790):
> https://lists.openembedded.org/g/openembedded-core/message/166790
> Mute This Topic: https://lists.openembedded.org/mt/91503792/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000cd302f05e1145795
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Don&#39;t know if it was intentional, but these patches se=
em to be moved to stable/kirkstone-next:<div><a href=3D"http://cgit.openemb=
edded.org/openembedded-core-contrib/log/?h=3Dstable/kirkstone-next">http://=
cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/kirkstone-n=
ext</a><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, Jun 10, 2022 at 10:39 AM Sundeep KOKKONDA &lt;<a h=
ref=3D"mailto:sundeep.kokkonda@gmail.com">sundeep.kokkonda@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello S=
teve,<br><br>I am planning to do a regression test on gcc-11.3 and cloned t=
he repo from given link &#39;<span style=3D"white-space:pre-wrap"><em>git:/=
/<a href=3D"http://git.openembedded.org/openembedded-core-contrib" target=
=3D"_blank">git.openembedded.org/openembedded-core-contrib</a> stable/kirks=
tone-nut</em>&#39; but I did not get these patches included in the cloned r=
epository. I could still see gcc-11.2 cloned. Also, I verified patches in <=
/span><span style=3D"white-space:pre-wrap">rust-common file, those are also=
 not updated.</span><span style=3D"white-space:pre-wrap"><br><br>Can you le=
t me know does this repo is correct or I&#39;ve do anything else to get the=
se patches?<br><br><br>Thanks,<br>Sundeep K.</span>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#166790): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/166790" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/166790</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91503792/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91503792/3617156</a><br>
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

--000000000000cd302f05e1145795--

