Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551B6C43334
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 16:05:28 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web09.102.1656432322062001955
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 09:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c1Sy8NeF;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id o23so15444574ljg.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 09:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ujEmqn0uTp/B+ylrNpc6PNv8BeAw/Ro1lGENGICOib4=;
        b=c1Sy8NeFFOZGirSV4Q24DC36kiDrZeScDcrrHM3UQnn8YPdT/mFLMu1BOQRnnPOQNF
         uppA2e06g61Do3Lz6ji8wl4f82Ot4q/fBKvlDyqntKfWTmNpUmDw92FTCptL2bBF4YmJ
         cTOa2FNpF7kHXLyeQmIXEGod3UubnV2p3y9Fr0I4KpizeOlTl5tANqxD3Q8Te7cm23gH
         XVfy9xeGMyV7Hm9Wn9I3A+VfZ1pkXU7aoLql3830AGFArhYb6XUC255kGeB4U9dghHpn
         tJTwjPVLafZWVwzyKK5Az5UfNkToKF2FH7mCk3ohBev696w70euVZiGchLh0ak/+5gMq
         gW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ujEmqn0uTp/B+ylrNpc6PNv8BeAw/Ro1lGENGICOib4=;
        b=gm1qAkpLUGpZvXZWGBJxfjFT3KxqrVdazffihxhkAt78+0P7FNWqmwIsIOB9KGqAes
         /tYynJwwNqJAn12y63TdiSA0y9HDF0jpIC0AxCh8K5xxPK6dZgDlOFyhxu4uYndin2TP
         iVdu6WPYOr545Sd/jHeDGh+xHsyAfFe7TNHkxw1DlCsnA+9MJU0CDCDDwbf6W07Xthgd
         NK2vfmv1Ej8i1zdBSuNCwjcTfIYORQe1lFVmc5K9fgEirS/KqNHs3EAf3Ea03YSOCzsN
         ++3f5IejsOTm1xiDXAUQDbkDQYE+BFIq1yhEZAGFqQWoy9j5KwJleQIWW5wOuKD80hba
         W0xg==
X-Gm-Message-State: AJIora9hWCcLYrdJaD85BdnVIh9AhjFentUcW4hmuAieBRzzeIS4Wz5T
	RcdoxryEOLmODZsYLxhDcF9HFzFJYFtpCBmeuB4=
X-Google-Smtp-Source: 
 AGRyM1spgRcd0LdGri1pvgbiuTC0LYiPnqWFX920rPpgmV3qhmk821U0piKkYoQodEbdof8JTjOnP/R5B2Kq4I0heg0=
X-Received: by 2002:a2e:889a:0:b0:25a:ca71:823e with SMTP id
 k26-20020a2e889a000000b0025aca71823emr9765518lji.11.1656432320134; Tue, 28
 Jun 2022 09:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220628133713.3390786-1-davide.gardenal@huawei.com>
 <20220628133713.3390786-5-davide.gardenal@huawei.com>
In-Reply-To: <20220628133713.3390786-5-davide.gardenal@huawei.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 28 Jun 2022 18:05:08 +0200
Message-ID: 
 <CAApg2=TuaL-4NBRwaRp-YDVUDCjXVD53vbBy9AXWcSvRMgFM1g@mail.gmail.com>
Subject: Re: [OE-core] [master][kirkstone][PATCH 5/5] selftest/cve_check:
 update to new cve-check bb var
To: Davide Gardenal <davidegarde2000@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Davide Gardenal <davide.gardenal@huawei.com>
Content-Type: multipart/alternative; boundary="00000000000009463005e284348a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 16:05:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167351

--00000000000009463005e284348a
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 28, 2022 at 3:38 PM Davide Gardenal <davidegarde2000@gmail.com>
wrote:

> After cve-check.bbclass refactor some variables changed,
> this commit updates them to get the test working properly.
>
>
A general comment on this patch-set. There are quite many changes but it
makes
code way more regular between the text and JSON output.

I have currently other refactoring and various changes (symlinks,
generating the output without the database etc) but holding off to have
discussion on this one.

Kind regards,
Marta

--00000000000009463005e284348a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 28, 2022 at 3:38 PM David=
e Gardenal &lt;<a href=3D"mailto:davidegarde2000@gmail.com">davidegarde2000=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">After cve-check.bbclass refactor some variables changed,<br>
this commit updates them to get the test working properly.<br>
<br></blockquote><div><br></div><div>A general comment on this patch-set. T=
here are quite many changes but it makes</div><div>code way more regular be=
tween the text and JSON output.</div><div><br></div><div>I have currently o=
ther refactoring and various changes (symlinks, generating the output witho=
ut the database etc) but holding off to have discussion on this one.</div><=
div><br></div><div>Kind regards,</div><div>Marta<br></div></div></div>

--00000000000009463005e284348a--

