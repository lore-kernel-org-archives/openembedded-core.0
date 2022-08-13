Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C8EC19F2D
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 11:36:33 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.3986.1660390583950864003
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 04:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O8uymRTl;
 spf=pass (domain: gmail.com, ip: 209.85.208.179,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id bx38so3174458ljb.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 04:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=ro1+xF+c9HISgcjj4zbXHbhiMAKTbsmsjTx5H0hrJUU=;
        b=O8uymRTlBuTyGJgrgGSL8Q8bpUh5xc9XD1P9tS2tWC20F4WGzhlQEQnhBI+awO/97J
         FGbL9G7pMdJz/dnh/hg4vVE5YyFGOcqLtOqmxpMw1wquLUm49xGDF5rzZyvCbjfAzsrX
         uPZhJYsnTfNL4wi5cJ8fDCFk7a5vSjL38gmRSBubHapKfxsyBP7hPUNxi+MEzDikuugR
         4p9sAOeISM9xPo4rBelPVUnMFqBmIqtXprK2FhgDOBa8VGRT0HTt/Leztd9UiOtLdtDU
         +YUJBeSlh5NZrFfZhEjk5Qm4lUqyIiu/GrCS9FA5MXrLt1KTN5WFPPU8pdGhrogpSMJk
         yGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=ro1+xF+c9HISgcjj4zbXHbhiMAKTbsmsjTx5H0hrJUU=;
        b=YSKvEo7US5jnAQ/WS/VqjgkI61UHa7OIXY7wyR527/UGrlkU/GJ7GMHuKdxQMpfEHF
         uoJHZ21levYzGXWT1CgzgMqn924pWNPck6vukf9DL4f/tEwBQ0KRyWXosxdAChENctn7
         a7vK8mNNap4Qh5pC1WVXSZCPrFdSh/3pT9Pl7h5dWyNNOnMx7DL7HtGBdeGTYeB2YxQT
         ksD1oq0navLDsUlMAklKZyUvq68YuPombPrMYsNhaYxL3O+5y94YhYyNVpCjIY+SMwWu
         EKHc7Co8UOXI75BoZ/ZScyVLw3rk9nWRJXExP/NzLUl2xBI+VYRGaCxpm8gcEalp/C5n
         7r8w==
X-Gm-Message-State: ACgBeo12yDsEVj3tFBqeT+ZAstZzRQaJjlQ0Q4lvbQ2Ex3gnBOldB3su
	KjXN6H+EfcaPy0v9WSplgRtpobdouXuPRCr7fb4=
X-Google-Smtp-Source: 
 AA6agR7y00fe9LHIWLnB/3li7yduw/xFLaszxlo5fUI2mGr/1FZr/HuqZzlhQvJIAv81tedG5Ha5RVf1eoYFe168kZQ=
X-Received: by 2002:a2e:86c5:0:b0:25e:42c3:1320 with SMTP id
 n5-20020a2e86c5000000b0025e42c31320mr2464629ljj.41.1660390581753; Sat, 13 Aug
 2022 04:36:21 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CABF_=yi9-vQ4b-4qnOz+W5bbJmjRmk72YOog+GvDVBVyQ160+Q@mail.gmail.com>
In-Reply-To: 
 <CABF_=yi9-vQ4b-4qnOz+W5bbJmjRmk72YOog+GvDVBVyQ160+Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 13 Aug 2022 13:36:10 +0200
Message-ID: 
 <CANNYZj-c97JgQnN-W3Ae3YzpWRGOO9hwO_xF0WDuoMsCaOwyKg@mail.gmail.com>
Subject: Re: [OE-core] makeself
To: Jan Vermaete <jan.vermaete@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 11:36:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169303

No need to ask. Make a patch, write a good commit message and send it :)

Alex

On Sat, 13 Aug 2022 at 12:11, Jan Vermaete <jan.vermaete@gmail.com> wrote:
>
> Could it be useful to transfer the makeself recipe from the no longer mai=
ntained intel-iot-refkit into meta-openembedded?
>
> https://github.com/intel/intel-iot-refkit/blob/master/meta-refkit-core/re=
cipes-core/makeself/makeself_2.2.0.bb
>
> https://github.com/megastep/makeself
>
> It's useful as a native recipe to create self extracting installers for f=
irmware updates, as an example.
>
> br,
>
> --
> Jan Vermaete
> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169301): https://lists.openembedded.org/g/openembedde=
d-core/message/169301
> Mute This Topic: https://lists.openembedded.org/mt/92997365/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

