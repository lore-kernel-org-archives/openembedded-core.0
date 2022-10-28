Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B2EC38A02
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 13:12:36 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.6037.1666962752403251130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 06:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PHFxqwLA;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id z14so6537445wrn.7
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 06:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vdWL8Du/dRPuA72jWxGXafTDoK1euD4PUQz0S1HAbe4=;
        b=PHFxqwLAZMdcBcoM6P+aA0y6ru91FkH7UUAIz9EklNino3wpAPLFtl0SqDo68/M590
         RmI2Gwq08sp5o+HrBFGP+Hg6CInpNaJ9K0lfJj9OxIXkQ2yxbSLLdtM3JId5CLzPYiLa
         BTfjMEK546YSi3R9Lh/p/p/9cl4FPARdfDYRpaNZSnc1YjDr9RfOVv4QJABk1OYQv0aj
         slJeMSq6y9Zj1EXFXqADd54S/ImVN6hbfKMOuVmLnme7nmfzLNQ9llY4XqWR1XWpilA8
         FIKRCfsnVyFF6GiHiFY1t5rFYWsra0rQdn+b5jfYOEIF+tQF46+Y4b9Q8PtbbLjGj9My
         L9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdWL8Du/dRPuA72jWxGXafTDoK1euD4PUQz0S1HAbe4=;
        b=cZiQK6pm5I3ISRRNDNY3bppy49I728s8Ce29lU0KHymK3bsQl/qz7L2Hbs96QoIyoi
         2iH1V9k659l/r/CkjxKbjBNjR0Hr8kfHZp/y7CewrNMFktJo896P6TdJ2yaXAPW97ieD
         RRRLsZaQ5NFAVu4pewo9T9TAwfmRijVR0qWfI9GUY//6A7sf3F5NlBZg4KQR2sXVlhRH
         yOg83jTHA3JQ0ZCiRZIK4NBv7QbAq9sDgP39x+rVjuuji9XJrGzJ2bB1oV+KZCJiBTue
         rtM2+7qFiDvRNuazU4jpTUscCeGi5vqRIa8cGsP7nqzZsyms3UtWUsbpK6XQiHDLmaBv
         taug==
X-Gm-Message-State: ACrzQf1Qh/OBwnEbPOcwVKm8EeejRG1WVvOe09L/k+U7RABsoS4B/2Us
	ot1HOzA41YqW/P/O7tlqHgE4H1bfS3qrR2JXJj0=
X-Google-Smtp-Source: AMsMyM7UIgqr4L8DKLRNvSPenNmMc2MD/dIi9wRswXefSLI0Z53QixHZmxtuKYfCD0MBR2wMxRTVfO7N7I4+fYiFbm0=
X-Received: by 2002:adf:f8c3:0:b0:236:9c97:6f6b with SMTP id
 f3-20020adff8c3000000b002369c976f6bmr3776884wrq.548.1666962750799; Fri, 28
 Oct 2022 06:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221028123050.3910-1-ciaran.courtney@activeenergy.ie> <b1da60bfe5e0910037a6dac36c75a6e2d078ba6b.camel@yadro.com>
In-Reply-To: <b1da60bfe5e0910037a6dac36c75a6e2d078ba6b.camel@yadro.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 28 Oct 2022 15:12:18 +0200
Message-ID: <CA+chaQdqMPBTSa=UNpzCbhJfG9ZN8MB3gG+L2GrGz7SD30EhZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wic: swap partitions are not added to fstab
To: Sergey Zhmylev <s.zhmylev@yadro.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"ciaran.courtney@activeenergy.ie" <ciaran.courtney@activeenergy.ie>
Content-Type: multipart/alternative; boundary="0000000000009d83b305ec1802ec"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 13:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172256

--0000000000009d83b305ec1802ec
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 28, 2022 at 3:05 PM Sergey Zhmylev <s.zhmylev@yadro.com> wrote:

> The commit you're reffering to is absent:
> https://git.yoctoproject.org/poky/commit/?id=7aa678ce804c21dc1dc51b9be442671bc33c4041
> It does not exist either in poky-contrib and on github.
>

https://git.openembedded.org/openembedded-core/commit/?h=7aa678ce804c21dc1dc51b9be442671bc33c4041


It's oe-core commit.

--0000000000009d83b305ec1802ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Oct 28, 2022 at 3:05 PM Sergey Zh=
mylev &lt;<a href=3D"mailto:s.zhmylev@yadro.com">s.zhmylev@yadro.com</a>&gt=
; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">



<div>
<div>The commit you&#39;re reffering to is absent:=C2=A0<a href=3D"https://=
git.yoctoproject.org/poky/commit/?id=3D7aa678ce804c21dc1dc51b9be442671bc33c=
4041" target=3D"_blank">https://git.yoctoproject.org/poky/commit/?id=3D7aa6=
78ce804c21dc1dc51b9be442671bc33c4041</a></div>
<div>It does not exist either in poky-contrib and on github.</div></div></b=
lockquote><div><br></div><div><a href=3D"https://git.openembedded.org/opene=
mbedded-core/commit/?h=3D7aa678ce804c21dc1dc51b9be442671bc33c4041">https://=
git.openembedded.org/openembedded-core/commit/?h=3D7aa678ce804c21dc1dc51b9b=
e442671bc33c4041</a>=C2=A0</div><div><br></div><div>It&#39;s oe-core commit=
.</div></div></div>

--0000000000009d83b305ec1802ec--

