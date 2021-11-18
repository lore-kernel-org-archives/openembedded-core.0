Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07933C433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 10:39:37 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.19.1637231976346507390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 02:39:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mZqwLDnb;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 gf14-20020a17090ac7ce00b001a7a2a0b5c3so7810211pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 02:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MqGsFFX0mMTGDzZF1qByAG1Uw8/WPJND5VN6hFwgscA=;
        b=mZqwLDnbxPGFQI7mZj5YFlIgyKN45NvaLPmSOjuxzKZcLldGAphCcxnn37a6elO0E8
         3VzXtKhBzN5aADmXn2I68bEPPFd1/tyOJAjiCxKdIg5RGFvMA2ODufuWSQwuA0+xfaDc
         cfHxEZjs0npHhVhB8NiYhOVeeTXlglJfocpRw/U83YiIIhnOm5SUrxXHaAhm6drdzXLZ
         ElhBCslz3/EDve6uklVig4ZOpux9PkOpfT0RikFJ3MlMUpbS5Yetfwit73zepH7zgr00
         eooaiikpa3O/c11Z9yQLBhgHZ2PqfO6QQJ2utLAodAxzfiXXOBe8vnEGgoWiFrXLKVfn
         OscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MqGsFFX0mMTGDzZF1qByAG1Uw8/WPJND5VN6hFwgscA=;
        b=jjxOQU25KM4Vw9bPk25fS19C79LAFGGdAJTWgb8l2gFjrYuf6huDaMtDh+qZfoJPdf
         7GoqCo+Ptwd2UhFgLbhbqZf83qHmWbKoRCRqykq/D8t2MZaEewbb7/jRyfMDQniINtoy
         650KVMxTrHKGS0FHTQIP3MUdYm2+Au0RY7z92DfTUST0OUhVpfdPG9WClSzkQd4DfjfM
         etoeFj+s7vGEk3Mib9TusBALd1EWQKI4LZpLVTFi979ztFHW5/bhwp+7eexd4DdorAln
         NTAlLIkcHTcAss5hVabATrXFEpCEhLbaJjOkdpz8ZbhjoPmJtsv0PUw4jxZ/CgErJsH/
         /gng==
X-Gm-Message-State: AOAM531HS2hzsGPLD6TkforJe8Vr5TvzDF0SEKLy2icJ2tdpGFmNcNvV
	I/acMDLQ/th95hT84HuPG5jZ+Ld0vGKF0Fs3TcM=
X-Google-Smtp-Source: 
 ABdhPJwuLUp/YyIJqE4N9MqiFezxT8ebTX1EL4IUYq6uWE8qFsU3jkKeHl68s8VWaAcOpA01YAiinnY3EV7sgY0rbO8=
X-Received: by 2002:a17:90a:e60a:: with SMTP id
 j10mr9311135pjy.169.1637231975804;
 Thu, 18 Nov 2021 02:39:35 -0800 (PST)
MIME-Version: 1.0
References: <8ca5808d-1fd6-751-f9c9-b99ab8242cd6@crashcourse.ca>
In-Reply-To: <8ca5808d-1fd6-751-f9c9-b99ab8242cd6@crashcourse.ca>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 18 Nov 2021 11:39:24 +0100
Message-ID: 
 <CA+chaQeUB2ew1=odQPwXbsXDL62LoNw3aZOR8x69oeHrksPr5w@mail.gmail.com>
Subject: Re: [OE-core] how to "prune" dead sstate-cache?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000055321c05d10dc653"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 10:39:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158469

--00000000000055321c05d10dc653
Content-Type: text/plain; charset="UTF-8"

openembedded-core/scripts/sstate-cache-management.sh

On Thu, Nov 18, 2021 at 11:38 AM Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   assuming my (correct) understanding of sstate-cache is that, as time
> goes by, it just gets larger and larger, it will increasingly contain
> content that is of little value anymore, what is the simplest way to
> purge or prune entries that are no longer involved in any desired
> builds?
>
>   i'm guessing a simple way to do that is to first delete tmp/, then
> build any current targets/images, immediately followed by something
> like:
>
>   $ find sstate-cache -type f -atime +1 -delete
>
> is there anything fancier than that?
>
> rday
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158468):
> https://lists.openembedded.org/g/openembedded-core/message/158468
> Mute This Topic: https://lists.openembedded.org/mt/87140377/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000055321c05d10dc653
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">openembedded-core/scripts/sstate-cache-management.sh<br></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Thu, Nov 18, 2021 at 11:38 AM Robert P. J. Day &lt;<a href=3D"mailto:rpjda=
y@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><br>
=C2=A0 assuming my (correct) understanding of sstate-cache is that, as time=
<br>
goes by, it just gets larger and larger, it will increasingly contain<br>
content that is of little value anymore, what is the simplest way to<br>
purge or prune entries that are no longer involved in any desired<br>
builds?<br>
<br>
=C2=A0 i&#39;m guessing a simple way to do that is to first delete tmp/, th=
en<br>
build any current targets/images, immediately followed by something<br>
like:<br>
<br>
=C2=A0 $ find sstate-cache -type f -atime +1 -delete<br>
<br>
is there anything fancier than that?<br>
<br>
rday<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158468): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158468" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158468</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87140377/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87140377/3617156</a><br>
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

--00000000000055321c05d10dc653--

