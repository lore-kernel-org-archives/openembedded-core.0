Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FAAC6FD1F
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:25:12 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.16317.1678375505783945038
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Czp+OYuj;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id ec29so8495904edb.6
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678375504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDjGfZnTjdQzf9FjNRsZR7zC5SQm5Qv5mmZUF8qzxmY=;
        b=Czp+OYujhSTqwB1ywYuiuuBWX26kTopgGoHdh5IfqRAV+zZCbnDbdSq/RhKox4d2mO
         72pD9a51DGRXBJaod5CMp31/qG+ou91FytOzRW9f2TwcLECighe5fmPTnoGUNlq2Vfc1
         xPDdaOGFEMqZ9izev0LLjRzr/HAMiJ1DSawcMgogcrS4Ty/uaHQcEJgGRIC+Km7Ri5dC
         kRwmu2vxPsFJw1CI8q7F5DY8tL/epRIr/AQNHC9Ew1PpEwmGVShwf4ljxg3vInyF0hjt
         ydjWKtaUqgcZRjL3qHupdpMO+dzmAXhVprx3/JgeAq0z7BHsTIxQF+NAWmRXJimK1Gf9
         eR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDjGfZnTjdQzf9FjNRsZR7zC5SQm5Qv5mmZUF8qzxmY=;
        b=DOVOrP4XI4gkrnxE2hZEJKhFCRdHusF91s9aWFR4PdFgRIY9drt2/Dye0qKrfr+qN4
         ofD3AMzTZmEErXXAecAHNA35xIhHrTzU0UJtEbRwLNq7Yjo+39SwVVSUc5HyKvJ4pAl1
         jqFMEjtyjFXi210+ZEp94yix9/7TNJ+adt93UlYJg3tNPKKW+895ooh3w+GDiYlrr5t8
         XzGz+IHjHR75rd+OvSVMwRtQqjuSVGIWLLQBPGlRk3JNc/nO1ROYPVfzM9YmrqhaETSr
         yZ4FvOG/OY5xjuSzw3Tp7pLFo2Krpf6RLCktJJ5oeCKQxpIJQRZwmIEQ4Q4GekgY9QsC
         g1JA==
X-Gm-Message-State: AO0yUKXjxyM3aQBEIt6cWknUF3WZ51IDVt4xnxqax/+KkfUVBbodGiRl
	mjt0C6toDbcRc7APHdQ+7FKz7sVWV941AucXExHAHA==
X-Google-Smtp-Source: AK7set86MOxSGyx+jFJUUG3skS3Mpc5n7JClO3vtJWytPpmB8+6ZErvq9221IzF3NVKQ8JbtKfCzPo6HcH4bIKW4btA=
X-Received: by 2002:a17:906:fcb9:b0:883:ba3b:eb94 with SMTP id
 qw25-20020a170906fcb900b00883ba3beb94mr11347407ejb.3.1678375504141; Thu, 09
 Mar 2023 07:25:04 -0800 (PST)
MIME-Version: 1.0
References: <3cb18f22193455d52f5f30c837a2694719d6ae70.camel@siemens.com>
In-Reply-To: <3cb18f22193455d52f5f30c837a2694719d6ae70.camel@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 9 Mar 2023 05:24:53 -1000
Message-ID: <CAOSpxdZm91QVn9tEjKeoXC79rxNNwkeDz2qWzgPTakJ4k6Jo2w@mail.gmail.com>
Subject: Re: curl
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178253

On Thu, Mar 9, 2023 at 5:15=E2=80=AFAM Valek, Andrej <andrej.valek@siemens.=
com> wrote:

> I have a question about curl. Would it be possible to backport some
> fixes for CVEs from kirkstone to dunfell?

The curl versions in kirkstone and dunfell are different, so a direct
cherry-pick of those patches may or may not work.

If you could test cherry-picking them and then submit the patches to
the list (with your Signed-off-by added) I would be happy to take them
:-)

Steve

