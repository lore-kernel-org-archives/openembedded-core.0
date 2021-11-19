Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A37C433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 17:06:21 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web11.11781.1637341580436737453
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 09:06:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HkAmQcBD;
 spf=pass (domain: gmail.com, ip: 209.85.221.173,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id e27so3336648vkd.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 09:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NfAArKqNArCj9DQZMX9U20Nb6eibovgyiN8hrdvPt+k=;
        b=HkAmQcBDBB8kUS0qVpGOPMdcCkzzuffddYO/lA0ceNrJc2uHQWng1/Mfz3qcz7Aktl
         iuSWyoflp1PVoxXX2rudTDUJvp8k0Lrr7eF8dkB6UPQ8a3VZhXA+tf/Uyqe5vPCib9c1
         Xy3OzEsZcuBuByE/3onn0lDf1xtIGyD3utjFIpw2AUKr1ow3oxBaeK7z5Xci0HQjjus9
         JrQAPlZKQpL7maDaame8Tv73h4dG73DqUCzaz/57ivhu7uJc9Hh/xtScQ3sY80VuKpE6
         nfkN4wVrwBqTVOoj3k613vUehXUi7h7iXS9rl0Oxx1zU4yrS65H/uNyyWx93iYi67FZB
         ImHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NfAArKqNArCj9DQZMX9U20Nb6eibovgyiN8hrdvPt+k=;
        b=bXvBGj82QDmarCFlx5qBjVlsKjNTKHj2quJc0ywIAEeyJ48IBsZ85JNZE0TKMXZ1zO
         MwDR4SPVB/YUsGDP6Dyp7igoMecrzEDb94LUegC+dDDmKyqe6Ug4w64IFUIKr16tagyJ
         q0k+BX5mDJC18V3ipKJ0jgWI6i9QCOUwuDsMpepkKaqKucTQtUNwF2r7iySJOSFXaLgV
         OB4foVVIZVE+54IEOyk0Vd74ix8pdBlv0QDZvkkUMRq17PytANGj2VUJp4S4uIQFP/6E
         CF/KZiy17j19wUKq3NBbC/1KNjW3wJ5omPpQtejx5Bw2GCYekSNyIuhyNdjfCLmiW3Di
         O6aw==
X-Gm-Message-State: AOAM530lbPoR1MyslV8RDsMUv5phSGUp1yh1HIbUP6zMbfWC5vBeiyfe
	IQM9m0SGnVcJlaIw8ZLsaNbZMooX3CR3hsWbXmAjRd21
X-Google-Smtp-Source: 
 ABdhPJzzYW35BfzAUtgJZm+idkQ1/7k4amm0ru4Ym+wO36eNwqKkvSc0J1vNJHNMFGu9JkiBe4lKTg/oA4qv1jNcP7k=
X-Received: by 2002:a05:6122:d08:: with SMTP id
 az8mr121613997vkb.15.1637341579633;
 Fri, 19 Nov 2021 09:06:19 -0800 (PST)
MIME-Version: 1.0
References: 
 <CANNYZj8h4kDhv-ZqkKqMY_aXAezOVYmmrV28jn-jQjdK-d3N2Q@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8h4kDhv-ZqkKqMY_aXAezOVYmmrV28jn-jQjdK-d3N2Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Nov 2021 18:06:08 +0100
Message-ID: 
 <CANNYZj-A4OU5FvM3sMLDfYiv0KBujAifRnCijZHxa_GP4YvELA@mail.gmail.com>
Subject: Re: pls comment on weston non-PAM patch (link inside)
To: OE-core <openembedded-core@lists.openembedded.org>, tom.hochstein@nxp.com,
	Denys Dmytriyenko <denis@denix.org>
Cc: ppaalanen@gmail.com
Content-Type: multipart/alternative; boundary="0000000000003ae6b905d1274b02"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 17:06:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158524

--0000000000003ae6b905d1274b02
Content-Type: text/plain; charset="UTF-8"

Hello guys,

reminding you to speak up in the patch submission; if you don't, upstream
will close it without merging, and I will start working towards removing
the patch from Yocto as well.

Alex

On Fri, 12 Nov 2021 at 10:48, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Hello folks,
>
> I sent the weston non-PAM patch upstream and they have raised questions
> about its validity, can you please comment on it?
> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/725
>
> Thanks,
> Alex
>
>
>
>

--0000000000003ae6b905d1274b02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello guys,</div><div><br></div><div>reminding you to=
 speak up in the patch submission; if you don&#39;t, upstream will close it=
 without merging, and I will start working towards removing the patch from =
Yocto as well.</div><div><br></div><div>Alex<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 12 Nov 2021 =
at 10:48, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">a=
lex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div>Hello folks,</div><div><br></div=
><div>I sent the weston non-PAM patch upstream and they have raised questio=
ns about its validity, can you please comment on it?</div><div><a href=3D"h=
ttps://gitlab.freedesktop.org/wayland/weston/-/merge_requests/725" target=
=3D"_blank">https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/=
725</a></div><div><br></div><div>Thanks,</div><div>Alex<br></div><div><br><=
/div><div><br></div><div><br></div></div>
</blockquote></div>

--0000000000003ae6b905d1274b02--

