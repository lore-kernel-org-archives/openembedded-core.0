Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CD4C4321E
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 20:35:55 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.100664.1669581347064694259
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 12:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tn0ftpmQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id r12so14581257lfp.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 12:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e9EsSF2V7/XMxWc7haFeTFd9fhjiUB8cMZ0Ur9ftj+Q=;
        b=Tn0ftpmQTPNNE211Z04fJT/ZbcBvOoO5Xis0106EEPY7Cs+NABE7xofy9IuuLlQB72
         0dGfBGgIHQsr+ZlbOVHLmu5vCyeAVFVskQ7Lu/Ftob8+pBReMMsKh2AI1sHlEgLAYojQ
         yTqcLA5Y34hqweYkExxUiH2qzAiAvbCr18teRzA+9mSgQFExfqRUsh+CuVj6AG6AtLnM
         jgwyPt9nemwxoC6q+tM4GMi36/Iaq23i13dMVYXlG35w8WcVXTwpzeHgEf253aiKA9sa
         6THSzMTqeBgbQ2bz76kfO3WxjjO47AE5MqI3WKPMgmma7KlLsnarqxFD3CYRzVBopiJF
         qcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9EsSF2V7/XMxWc7haFeTFd9fhjiUB8cMZ0Ur9ftj+Q=;
        b=36u0w49+EKScYQo2912Fj6YocaZTIu99RJ1f6LdYomXX5GF4wviQohY2x176U5rjYr
         FLnMW6NQ4wkXWg574k1uudQ9e0pCBiQFRn5ts4tFzh6zRKQSAn3JB1PTggBfBZ6hWdRB
         tNOqKLfgCwuW6tF88ftUESRft52X5O6NhHCmE3bbD9IQiB5muz7FRL6cKGu4cyqMSpKC
         Qx2fi+3od6yxqm7m+Gx26iS7s3c7P5+5mowAAtG4SuMQucCfV3j1X9497jitsrSIdROW
         2QzNLSKop2OTPRQMLtstsvMbAYkXwLlN0hPhL1l73N0556It9YsTX4j4tYOEIdTquECB
         lQ6w==
X-Gm-Message-State: ANoB5pnob3E+6jQsfKLy+sPhhq0+7yXBQuBNLhcUlAUcFhRGIwPLn2OW
	McafBJQcpwWZLQQLiTSrXVz5/4gDzWrioGeeRWU=
X-Google-Smtp-Source: AA0mqf5LJYbIi/OHa1pETt6Hqiz7/MXoepRPRKyqN0msTgcMpQqYOasgVWaL5sBXnOEQrnBnuRXzlQhPUm/O/E8DXCA=
X-Received: by 2002:ac2:4a62:0:b0:4aa:323f:e850 with SMTP id
 q2-20020ac24a62000000b004aa323fe850mr16153972lfp.492.1669581345192; Sun, 27
 Nov 2022 12:35:45 -0800 (PST)
MIME-Version: 1.0
References: <20221127122744.1404648-1-f_l_k@t-online.de> <Y4O2Zu5VubWJiFhP@mail.local>
 <UJU0MR.40BCMW1Z3VVX@t-online.de>
In-Reply-To: <UJU0MR.40BCMW1Z3VVX@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 27 Nov 2022 21:35:34 +0100
Message-ID: <CANNYZj9rJkiM+wWNG=Nr33aVHcz0coDUMYfnw3UH9TO-oWsPxw@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Markus Volk <f_l_k@t-online.de>
Cc: alexandre.belloni@bootlin.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000001015d05ee79b37b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 20:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173884

--00000000000001015d05ee79b37b
Content-Type: text/plain; charset="UTF-8"

I would suggest that gtk4 is moved to core. The time has come.

Alex

On Sun 27. Nov 2022 at 20.38, Markus Volk <f_l_k@t-online.de> wrote:

> Am So, 27. Nov 2022 um 20:11:34 +0100 schrieb Alexandre Belloni via
> lists.openembedded.org <alexandre.belloni=
> bootlin.com@lists.openembedded.org>:
>
> stdio: WARNING: Nothing PROVIDES 'gtk4' (but
> /home/pokybuild/yocto-worker/a-full/build/meta/recipes-gnome/gcr/
> gcr_4.0.0.bb DEPENDS on or otherwise requires it)
>
>
> mmh, i guess possible solutions would be to move either gtk4 to oe-core or
> gcr4 to meta-gnome
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173883):
> https://lists.openembedded.org/g/openembedded-core/message/173883
> Mute This Topic: https://lists.openembedded.org/mt/95287600/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000001015d05ee79b37b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I would suggest that gtk4 is moved to core. The time has =
come.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun 27=
. Nov 2022 at 20.38, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f=
_l_k@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div id=3D"m_-870=
4944525410101109geary-body" dir=3D"auto">Am So, 27. Nov 2022 um 20:11:34 +0=
100 schrieb Alexandre Belloni via <a href=3D"http://lists.openembedded.org"=
 target=3D"_blank">lists.openembedded.org</a> &lt;alexandre.belloni=3D<a hr=
ef=3D"mailto:bootlin.com@lists.openembedded.org" target=3D"_blank">bootlin.=
com@lists.openembedded.org</a>&gt;:<br><blockquote type=3D"cite"><div style=
=3D"white-space:break-spaces">stdio: WARNING: Nothing PROVIDES &#39;gtk4&#3=
9; (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-gnome/gcr/<a=
 href=3D"http://gcr_4.0.0.bb" target=3D"_blank">gcr_4.0.0.bb</a> DEPENDS on=
 or otherwise requires it)</div></blockquote><div><br></div><div>mmh, i gue=
ss possible solutions would be to move either gtk4 to oe-core or gcr4 to me=
ta-gnome</div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#173883): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/173883" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/173883</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95287600/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95287600/1686489</a><br>
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

--00000000000001015d05ee79b37b--

