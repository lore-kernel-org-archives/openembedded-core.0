Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F073C001B0
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 10:22:16 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.84950.1691576526596335786
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 03:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kv4Cgwtx;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fe44955decso905859e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 03:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691576524; x=1692181324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eIMSq61cFA40KoEckDypHs33t/4cKfkzvEYO15K47Dw=;
        b=kv4CgwtxL3v1GZuYcUrIWjEQeHudFLBfimPywO4JnLvZWjMnDEtsdIDY+iWGQ0zqS7
         OucfeheYM6IssfqI4lldvwe0SUTHb/vWeF8lrIQA62YxQcnx+UtIZOgjezBOBXak5GYb
         xCgOEk0YlKzXX4P8B+lBbu221ZZW86Wr+ym+CsYhTA/HaolBsMSU1QzlzO4jM4DhLb1h
         z6lWqdEGr+FOi7PBOZX47JY7tzJeoC9Pe2xu4lzS4/uYFRVcv0hnjAwHglxd6SGiF/0q
         WMp1UcgtV1c58atP93knTfbB+u6zTozWqldNvKDekVUEsNVr1rE2MLs4ZdGdAwrWk0Km
         /bAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691576524; x=1692181324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eIMSq61cFA40KoEckDypHs33t/4cKfkzvEYO15K47Dw=;
        b=P19vY1xMCg4pGKdh8gtynMzaNNubeshPZya+aqdmQ8yb1keVmAHeR/pDT1UmSpLCo1
         GMNuDNgTnMb3XNV793J5aZHgbDXGoEdh6S20pQ9Q8pTELJOmnngFtfccBcyyWPHM2K7F
         noeGcPzH44U/BtsyXOm3+cTYjxAnzgz/cx+ccT/KkoYkZFPwrXQu9B4TYVNq4wcsc+3J
         CpKSD2ML6PZmVHXxdEvZzrQ3OtrIMwpfBK3PKSeg5bRPfl6Lyk49pOkMl6VZp4jDDGVz
         OI7lYlhZkHMgnWNvJxdiJ0Kiy0kGSAQZbLUYJDp9ladawfscSEjRDZbc6XhZs2XQ8wqd
         Gqbg==
X-Gm-Message-State: AOJu0YwH+qh3YAoaZiDHHVjmdiFRz452xoJaoq5KjOexfqfnotqZ6FaL
	Pw4l+93jMv34DpWoQju4YNUWCeDaHigM3/il8L8=
X-Google-Smtp-Source: AGHT+IF3Lc5//wv7l6RSsU3qFfOzCn2DBLm0NSBhDyNTnrsziRy0nkxgbisb/VSCzbr0o1TytlvsdgnTrNI2MecHgYk=
X-Received: by 2002:a05:6512:2249:b0:4fe:5741:9eb6 with SMTP id
 i9-20020a056512224900b004fe57419eb6mr856157lfu.26.1691576524269; Wed, 09 Aug
 2023 03:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230809084550.9390-1-sudipm.mukherjee@gmail.com>
 <CANNYZj_L1BHsg-9cV9LS84d6e7tgt_yQsqNOkUC2E2k0xepRjw@mail.gmail.com> <CADVatmPXY4MxwNaios=2AGOLKPn5vPPreuoSOLp1989xEnVOOw@mail.gmail.com>
In-Reply-To: <CADVatmPXY4MxwNaios=2AGOLKPn5vPPreuoSOLp1989xEnVOOw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Aug 2023 12:21:52 +0200
Message-ID: <CANNYZj_ziirujoVk+rPr1+zbg9xyHTsPYaLMbQF8QJa0djNstg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kea: upgrade to v2.5.0
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 10:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185695

On Wed, 9 Aug 2023 at 12:05, Sudip Mukherjee <sudipm.mukherjee@gmail.com> wrote:
> Yeah, I know and I always try to send any patches upstream first.
> But in this case there seems to be no way to do it.
>
> I have tried with https://gitlab.isc.org/isc-projects/kea/ but they
> are not allowing gmail
> or any non-corporate email address to register or login. Also tried to
> login via authenticating
> with gitlab/github but that also did not work.

I just managed to log in with github authentication, so if you can try
from a different ISP, I'd appreciate.

Alex

