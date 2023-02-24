Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E1CC7EE2D
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 16:22:51 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.22113.1677255760757908680
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 08:22:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ck3KAsWH;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id f41so18532535lfv.13
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 08:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NQZ8e4tdhw8Ef1wJezB/ycu9G4hyQVskkoUMyYCblG0=;
        b=Ck3KAsWHnq8p74wpDp88tR3iJJ+Toh9fk374jYIQtuiS7sUO/deqPPmF+gyqYp1KlS
         ngV/GqZXGovAWc86pabPlzZ72NmB5eqoJ1hdJfQNduoUOkNrnWGbYF0YdAnKywYvDPZZ
         xBHI3Am41GUuQQkqG/V9RfM9rTV8qO7sdQ5MoqJEOK2xU2QcK3svc3fJm6aaTbMt1z5S
         3ydrZO1nCRoh0vo90yREkKfbA79LKAGKslzdJJWYE7whBZhoAslbKenJvLh6QFBIbgqO
         JagkHcxIWQTv/rbSb8k5irCObbaekZcIcZLbOph0Mnh9hqYjR94Yj2/PXaQA5RjFSZMO
         rb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQZ8e4tdhw8Ef1wJezB/ycu9G4hyQVskkoUMyYCblG0=;
        b=6h8jHlcCqr/4OSZzLZx+ANPbHCenJ3VNHjJWSqlxbKA4pALVbXjjIRfxYDO8USxHmA
         OjABTOqKZwvD1ToAzLxnn5PqPdFdp7qy8LUuT5vclDHAnY5+D4XECPWnYLDOQhPwhJwt
         S4gu1dbtQj4k3e26OdkZ3XVUpNMrWXZZuAZThqPkaTq1vbqXgSeOdOBqPAHI5vy0qRml
         QRQ58UpwZiqsUArrAUykYCdziXIWh5KuiofkNgxz1JhI+akcyW4sa1gjA7HLwuc0n7bb
         k0lARrgPxMwRyAwuxrhqtXg5zVu30geeh/fRN90+3MPKBSAvmuVJwUL1oG4RlA9hetUw
         dJ7Q==
X-Gm-Message-State: AO0yUKU5Yvf6/Q84Xy1smu8e/6ThxdyDXozMd1STkHg24n4XMPgDOUPQ
	pjZSb7bTcclU/xPPWPW6n/VzfgsA0yxspzKNW+53qk4uvfQ=
X-Google-Smtp-Source: AK7set9FBIb5MXYwD0ucDLph4Jx6Naz+O5MJ6pDTbQVplrFUHzh9/Ecmddv6MH9AD1/NOm5qG89YAaTtzYOmL9Op4+E=
X-Received: by 2002:ac2:5325:0:b0:4db:1a0d:f260 with SMTP id
 f5-20020ac25325000000b004db1a0df260mr4937126lfh.0.1677255758390; Fri, 24 Feb
 2023 08:22:38 -0800 (PST)
MIME-Version: 1.0
References: <20230224161643.1596895-1-rybczynska@gmail.com>
In-Reply-To: <20230224161643.1596895-1-rybczynska@gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 24 Feb 2023 17:22:26 +0100
Message-ID: <CAApg2=SCBNSwnJYt1LqY7bkm+a+DhvopogGTjHi7ATvvcKOXhA@mail.gmail.com>
Subject: Re: [RFC]] cve-update-nvd2-native: new CVE database fetcher
To: openembedded-core@lists.openembedded.org, ross.burton@arm.com
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Content-Type: multipart/alternative; boundary="000000000000ad29da05f57489c6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 16:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177693

--000000000000ad29da05f57489c6
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 24, 2023 at 5:16 PM Marta Rybczynska <rybczynska@gmail.com>
wrote:

> Add new fetcher for the NVD database using the 2.0 API [1].
> The implementation changes as little as possible, keeping the current
> database format (but using a different database file for the transition
> period), with a notable exception of not using the META table.
>
> Minor changes that could be visible:
> - the database starts in 1999 instead of 2002
> - the complete fetch is longer (30 minutes typically)
>
>
Tests VERY MUCH welcome, I have found some bugs today still.

Docs (with a mandatory note according to the terms of use) will come with
v2.

For the swap between v1 and v2 I'm not sure what will be the best solution:
- a configuration option allows to migrate when the user decides to do so
- ... but does not protect the day they disconnect the feed

What do you think?

Kind regards,
Marta

--000000000000ad29da05f57489c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 24, 2023 at 5:16 PM Marta=
 Rybczynska &lt;<a href=3D"mailto:rybczynska@gmail.com">rybczynska@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Add new fetcher for the NVD database using the 2.0 API [1].<br>
The implementation changes as little as possible, keeping the current<br>
database format (but using a different database file for the transition<br>
period), with a notable exception of not using the META table.<br>
<br>
Minor changes that could be visible:<br>
- the database starts in 1999 instead of 2002<br>
- the complete fetch is longer (30 minutes typically)<br>
<br></blockquote><div><br></div><div>Tests VERY MUCH welcome, I have found =
some bugs today still.</div><div><br></div><div>Docs (with a mandatory note=
 according to the terms of use) will come with v2.<br></div><div><br></div>=
<div>For the swap between v1 and v2 I&#39;m not sure what will be the best =
solution:</div><div>- a configuration option allows to migrate when the use=
r decides to do so</div><div>- ... but does not protect the day they discon=
nect the feed</div><div></div><div></div><div><br></div><div>What do you th=
ink?</div><div><br></div><div>Kind regards,</div><div>Marta <br></div></div=
></div>

--000000000000ad29da05f57489c6--

