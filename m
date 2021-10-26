Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCCDC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 11:09:30 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web08.10666.1635246570336857990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 04:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nIbmX6XY;
 spf=pass (domain: gmail.com, ip: 209.85.221.173,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id o64so1965500vke.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 04:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a2g/Q1hX0HKdCFj8O8GkPEufDDLBTuzxGwL8o1wj5lU=;
        b=nIbmX6XY0rl62RZdpYpdL0skULf1ggIAUKHYOKgZOE0IazYGdabfCYC71WDX/pjEal
         PfPLrGbZm58lBCaLSXZbtz6RoU5vW/sRVxpRByjm8443mUEQrgcYWulWTyD8Nns3DrWm
         JgpGy+dWUjTPZUpr9PRISCYxX8U2hb19mxS4eIG/gMz5QFgRVoalo5F6N3gEauqXBMQm
         EypLLSYQLoczjPLBK465bjxFdtG4EA+ELZJoL9Nzft9ipruI8eWjmzzBu6x0iAHAtROH
         xNwvBOF2yI3NCCEBjg806O5r3HkpaDccW/DLThkTd5PAOR6O++oQCo0q3z1PnNNhGsF2
         ZGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a2g/Q1hX0HKdCFj8O8GkPEufDDLBTuzxGwL8o1wj5lU=;
        b=YYQLN6naTRd8MUMH8Ok0N5NRmCXY9p3roIEGvP/WQietDc/TjG3nD3i8QKViCWB/VV
         /kKuXSjNk05R2oZyf8+OQnOPyzZeFF3XRrKDsAVfQLLu5EAMJWfGmt7tcKvU1L0/YSi/
         zpdMRnHbGRgRwMpY2CmJ9trzhbQSYqcq+BZeBZ31Mk5wuqlPifDTqfZFGAmtqJEqaJID
         elCiOgIkOIwjFCgYoQHB9uBROXdC1zJPdP953oQBzhNPLq157V9QwWf9Mj8yT0duwuAs
         DcKp5QYfDTKUivmiAqA56lT983DL/9i7+51NpyOx1WqUO99ykPugJ3Z07mySN9zZnDrt
         x8rg==
X-Gm-Message-State: AOAM533wNZTc8cVWnth6wpGSL9Jfqf3MpudYTpsd+scNpVLhXdeuzfD4
	tA3XI64dkMo6qKvga5kmuYjRQPiykpHhx6nBcc4=
X-Google-Smtp-Source: 
 ABdhPJxGLbyy2GtYQr3hakV+qps8XmMOQjYd8MB/OR+f5EReXaMW9eBkiZESLi0s7r1AjnPEcUOExBdiATSUR8hA3VE=
X-Received: by 2002:a1f:1e06:: with SMTP id e6mr21735049vke.24.1635246569578;
 Tue, 26 Oct 2021 04:09:29 -0700 (PDT)
MIME-Version: 1.0
References: 
 <06387e0dd040237457de963fd13ff3db3e02be61.1635240032.git.martyn.welch@collabora.com>
 <e1285a97073645957532749c71d2de3a02310198.1635240032.git.martyn.welch@collabora.com>
 <AM9PR09MB46423424A75EE5AF6AE482C5A8849@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB46423424A75EE5AF6AE482C5A8849@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Oct 2021 13:09:18 +0200
Message-ID: 
 <CANNYZj9zSwHyy0dwQWi=i-NyyESdDgH4TLHbmZnv_+FMe+tfOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6 2/2] core-image.bbclass: add default
 IMAGE_QA_PROHIBIT_PATHS variable
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Martyn Welch <martyn.welch@collabora.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e6659f05cf3f82af"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 11:09:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157382

--000000000000e6659f05cf3f82af
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Oct 2021 at 12:56, Konrad Weihmann <kweihmann@outlook.com> wrote:

> I like the idea, but wouldn't make more sense to do that on a package
> level, as here the user is more or less left alone in guessing where the
> file actually does come from
>

Perhaps both. There can be all sorts of rootfs post-processing, and files
may slip in through that.

Alex

--000000000000e6659f05cf3f82af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 26 Oct 2021 at 12:56, Konrad Weihmann &lt;<a href=3D"mailto:=
kweihmann@outlook.com">kweihmann@outlook.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">I like the idea, but wouldn&#39=
;t make more sense to do that on a package <br>
level, as here the user is more or less left alone in guessing where the <b=
r>
file actually does come from<br></blockquote><div><br></div>Perhaps both. T=
here can be all sorts of rootfs post-processing, and files may slip in thro=
ugh that.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quo=
te">Alex<br></div></div>

--000000000000e6659f05cf3f82af--

