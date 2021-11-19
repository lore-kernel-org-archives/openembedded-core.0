Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CDCC433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 14:10:06 +0000 (UTC)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
 [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.web10.9257.1637330987388391182
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 06:09:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ok2onO+r;
 spf=pass (domain: gmail.com, ip: 209.85.221.182,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f182.google.com with SMTP id b125so5936128vkb.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 06:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z+jB8kFinrqzFmVWVycFbBguoMguB/G5zYQA0NVo5+M=;
        b=Ok2onO+rNu+6Fe4JIwiT5TUGsQoBDz+myxlTu/Bv0XJsp5G95GjkHFzMHdwfROalxn
         2Au+wEGPV/CMUi79LbAJfrQ7vjdtE3wr2g2gFJqap3ic/zPOidLD3i9PIw8gFsYt8YIL
         nhX/5xHRaTnie6d7Dk44wG01fVOofO9Hl2X+ecbbfeUNPxIJCItw+5wzFkFegMcylswE
         cJW1tKMizS510393k0qLMg0DzIpQIc9d+tW70Ex6CJjRLoUOuk/FjMLMaxhqiYMqUqmX
         PKNs2DDC8ydhZ8nI8/iiOTqddAyWnfCD+T2/doeAov9Qf/uXMF5J/JBrFL1fKMulVMHs
         79AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z+jB8kFinrqzFmVWVycFbBguoMguB/G5zYQA0NVo5+M=;
        b=xZ7Z5yq9FVGaF0K+RIn31ejMtmGTPo8L4G4l46YjFrVYMiHY+URrCDvWqZwxAT9tuh
         0akui+lobpD97mTrxXVlgD+PebOhIr6vmVciOqGLd0BIbcaCi7/gagVtrULMFhzYAOrF
         RwzohJRC1tbrEIw0Bz9H3mCjzFforBKpXaIB/ri2NWW8ChzB2AHs4ngoeCZSobgIL6DO
         aXOlUnXYhoT5lQkzZQ+myfmaAFkgTlQ2WFkrdoIswmdGLUBfCfORBu4t09PibQ41z/Uu
         X+AKsdnu+d/ac1jrl8sIyTog9tFEDoSf3618RAMuwa0ify/1hMIn6d9QTIh8X16rFC4T
         +Fkw==
X-Gm-Message-State: AOAM531rD7s3CS192J3MrBw5yuCJinTSniJWeSIPArXT0cKAWxet+mkg
	qH3AVuTwTxpRRxr5GB1IKmjIb3xXiux5xRFQsIg=
X-Google-Smtp-Source: 
 ABdhPJyUgMyWduTxkbFWeZbdfNgtnCIVvgbqKIWALMzxvWzv/prRIFtWmjGHW4yaTQ4/S59aO7edH0ZI2NjktnB1HDw=
X-Received: by 2002:a05:6122:1803:: with SMTP id
 ay3mr120049312vkb.24.1637330986229;
 Fri, 19 Nov 2021 06:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20211117153525.257146-1-alex@linutronix.de>
 <20211117153525.257146-2-alex@linutronix.de>
 <84c2e406c6127e55e7bdea01f2bcade6a9ab1c89.camel@linuxfoundation.org>
 <16B8EF5BF2691601.30231@lists.openembedded.org>
 <CANNYZj_7qsm0zf1CfeDF=_mzkj+xWJa3G+D-cFC_WSgGnRA-ow@mail.gmail.com>
 <b66f8b68585c7c2648c5931a8e931ab864626dfb.camel@linuxfoundation.org>
In-Reply-To: 
 <b66f8b68585c7c2648c5931a8e931ab864626dfb.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Nov 2021 15:09:34 +0100
Message-ID: 
 <CANNYZj8ivJL2A+trEWZ9-+hGh10DgO010x1R2Gd4EgP8a_ZgmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/36] groff: mark patch as non-upstreamable
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d0632d05d124d34b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 14:10:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158520

--000000000000d0632d05d124d34b
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Nov 2021 at 13:29, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2021-11-19 at 13:08 +0100, Alexander Kanavin wrote:
> > I checked; the patches are the same, except the upstream one misses one
> file,
> > which is fixed in a different upstream patch. I'd say we can keep things
> as
> > they are.
>
> Can we mark as a backport of those two commits then?
>

Right, I will add the upstream references to the patch.

Alex

--000000000000d0632d05d124d34b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 19 Nov 2021 at 13:29, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri=
, 2021-11-19 at 13:08 +0100, Alexander Kanavin wrote:<br>
&gt; I checked; the patches are the same, except the upstream one misses on=
e file,<br>
&gt; which is fixed in a different upstream patch. I&#39;d say we can keep =
things as<br>
&gt; they are.<br>
<br>
Can we mark as a backport of those two commits then?<br></blockquote><div><=
br></div>Right, I will add the upstream references to the patch.</div><div =
class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div></=
div>

--000000000000d0632d05d124d34b--

