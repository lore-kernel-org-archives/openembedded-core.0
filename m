Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E01C433FE
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 10:40:08 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web08.5.1637232007081076683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 02:40:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LYxLVk3M;
 spf=pass (domain: gmail.com, ip: 209.85.221.173,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id q21so3511598vkn.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 02:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rJBOZs4+/2PdBIMACuldtdpsVGoaQP1vzVrVJwWL/Lk=;
        b=LYxLVk3MKe5MiCgrbZuavpPKa4BX+orSEn1OmSHsFYdT8rlPcd/DrGd/lttBDEKPni
         h3/8FonnsMA5QWbL47FdJsbBHJMLO1jXDHIuNotsk16X5vRSvARGrLSH+JUxPEpZ6nuL
         KDzqBNN/3CFFtSyw38uGBnjKw+m663nGJpf5CBc6Y0yVG1Xy8Cs9fUAduC6nFUWC8rjY
         06JHLjhSv0CkJUYQ+fry0a73V95ScOcCbDt2k9YLmWSMHePsAfpuQba/s8jjXWot7G0E
         N8vCuUM2FPHADZ/F0G6fu4u7N2XRt2ddkepfWpGLVkxAsh//CSauvFZ9Wx5sLMWoNK6j
         rN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rJBOZs4+/2PdBIMACuldtdpsVGoaQP1vzVrVJwWL/Lk=;
        b=3idG1YG/l55EbHbZQwMCbH6tkLqY+OwzxiZ1ByPXBV3RPMdxB31Ig5MIqW61vHYMhu
         Ej6aHJJvPnkc7ETNsly6tAlugv9hBneFujhFHbI8tbgXd1VdR/M0xTtO4bnAZH20wSJb
         W5jg9Dp+XrlRe0dRZYI+EYCWLmWzhfafU839cetON+yVHPYu+54/m/deZlVfxlEP13be
         3tzTZkgMAKNzuNfpu4Ct24A90nsw32iPV52JvF8QC41pPEtZRpZon6fBvvaSzJQXjAcQ
         hL27z8MtauIfBEOreJa4WSx8eq1boiEsHavZOLhP9OUIphZGoxAnR3Z3t7VIBCT9vKN9
         AR1A==
X-Gm-Message-State: AOAM533K2X9sVifsoFlCt9op/SZkPnI9WcmUOCjhi24jH75C4RiZR5qJ
	+mfLX3QbE3D7sl5yvsWMEUfbn0HQ7rZUM1pvInE=
X-Google-Smtp-Source: 
 ABdhPJxr9D8SarjvKHoNizEVFy8Qm7f33S65x+biSLrAXWmwTDUnuNUxfb3euWym5K1W8VvBld6w7OLUhl0Znok7xSQ=
X-Received: by 2002:a05:6122:907:: with SMTP id
 j7mr103159449vka.12.1637232005719;
 Thu, 18 Nov 2021 02:40:05 -0800 (PST)
MIME-Version: 1.0
References: <8ca5808d-1fd6-751-f9c9-b99ab8242cd6@crashcourse.ca>
In-Reply-To: <8ca5808d-1fd6-751-f9c9-b99ab8242cd6@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Nov 2021 11:39:54 +0100
Message-ID: 
 <CANNYZj-EPE7=dax-6SOEofne_R8xwUwMUGqWVXtCfox=zbq4RA@mail.gmail.com>
Subject: Re: [OE-core] how to "prune" dead sstate-cache?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001da9e605d10dc871"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 10:40:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158470

--0000000000001da9e605d10dc871
Content-Type: text/plain; charset="UTF-8"

Not really, no. It's also important to stop all builds while this is
running - sstate artefacts vanishing during a build will cause chaos.

Alex

On Thu, 18 Nov 2021 at 11:38, Robert P. J. Day <rpjday@crashcourse.ca>
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
> Mute This Topic: https://lists.openembedded.org/mt/87140377/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000001da9e605d10dc871
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Not really, no. It&#39;s also important to stop all b=
uilds while this is running - sstate artefacts vanishing during a build wil=
l cause chaos.</div><div><br></div><div>Alex<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 18 Nov 2021 =
at 11:38, Robert P. J. Day &lt;<a href=3D"mailto:rpjday@crashcourse.ca">rpj=
day@crashcourse.ca</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><br>
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
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87140377/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87140377/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000001da9e605d10dc871--

