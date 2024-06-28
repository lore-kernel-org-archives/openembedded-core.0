Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0A6C2BD09
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 00:21:32 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.6863.1719534090560696185
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 17:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nw8b6Liw;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: festevam@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ed5af6b214so93021fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 17:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719534089; x=1720138889; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Q426EdBOO93NuASoG2tfXlX3xfQM7dbOqz9yFcsqbk=;
        b=Nw8b6LiwmbL1iz2IouJCW3gHGdqvhiz12AScZiSFC++Lg/noYEPc9egl847kD0s2AC
         53tOgItLX1rZEeggaLxOvMDkp2feDk+dz+rBt32uqnj9G5EdScKGEHu/aOuofxN1vHsC
         hidkKnGFQSM9FYB/mq2wQlqxUWYDj8AMg1MQbmZbC7zEsOxf4kqmI1k310gjqY4fcqDc
         1GwMLd9E8HJGGI/Utd6MBr4/18JMDlHLRJf8cjV0I9Pv7aOHJnBPPqXNoiQvsfblaqvU
         rRtlj5yKV4lPUR1NLPMJAAKxEty5Qtds03loZkmZuWuKoH9zwJu2pRkOkIj+wWt5zb7w
         Dd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719534089; x=1720138889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Q426EdBOO93NuASoG2tfXlX3xfQM7dbOqz9yFcsqbk=;
        b=uN63WLq5VsWoR9U7D1RoHy0j90GVvPhRW4wu8r6evNZeCb317di7jskpv9t2uMHuyx
         4MdDiFbRlrpfXqGgkBjEYCJSfAJ2amqjvcdXlvrtyvnWQ/7FypNNf5Lpgnd2pn5WjF9c
         Y0BmMFyR0hZopN348WU/ZqKDOYenqqIU9Fju+x84jDjO1tSe+TTzrJJQI7qpfh307+6G
         OfGxdT7/AdLrGt77AFiRBnB/bTVgi/Vz1pvX9QHnFVujAuUrTV6uES5YOPRM2bfHtYfx
         8EMp1YPgS26EopxUkjBY9JobuguEx6F1mY8P3UczkjniDWBaKApBgYIM3SPq5RRRj2fz
         34jw==
X-Gm-Message-State: AOJu0Yz5qIAonuSlcuIhbsTVdqkDcr0uUZGxyuEp/JeNqdyPrzcQwCeg
	r5cAAGpmocI4X99k6ypLDf1mdlVUwlSRCBeLVNzn92OvPJOIFZquoAfFlbBaiNMFyN0YxY72LNd
	OAdtrr0kgYPGHLfpj8eGVO+hP9p8=
X-Google-Smtp-Source: AGHT+IFkeAe9kLB7l1UhuUPXq8QWcoh4acNdEGhD7eCMoILZYxcnOgHBQJ71T+KzfMJBBkohd3i0xy/uifnr+sUDjJY=
X-Received: by 2002:a2e:3c12:0:b0:2ec:5361:4e21 with SMTP id
 38308e7fff4ca-2ec54d0a940mr99389991fa.5.1719534088358; Thu, 27 Jun 2024
 17:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <1EA2FE0C-0589-4346-B2F2-AA61CE6FE812@arm.com> <27879.1719529823108837685@lists.openembedded.org>
In-Reply-To: <27879.1719529823108837685@lists.openembedded.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 27 Jun 2024 21:21:16 -0300
Message-ID: <CAOMZO5AoVW=sL45p0hE8KmzUpThfudNJLWECFjX_YzjytWgVeg@mail.gmail.com>
Subject: Re: [OE-core] mc: broken source link
To: egyszeregy@freemail.hu
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jun 2024 00:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201216

On Thu, Jun 27, 2024 at 8:10=E2=80=AFPM Livius via lists.openembedded.org
<egyszeregy=3Dfreemail.hu@lists.openembedded.org> wrote:
>
> I do not have any information about what is the new URL for download tar.=
bz2 sources.

What about fetching it from git?
 https://github.com/MidnightCommander/mc.git

