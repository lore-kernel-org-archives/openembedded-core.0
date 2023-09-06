Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D586CEB8FC7
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 12:56:52 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web11.7693.1694005006690606895
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 05:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nL4AzpWs;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-77ac14ff51bso151770239f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 05:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694005006; x=1694609806; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mU51GY9yuxPO6GEa7yQ+JP3SRd01g30GTLWKAvbMxCc=;
        b=nL4AzpWsrqdYRQ6MPwLwfS6RO4NutC3NDeX1CwS5xWZKnnoY4rBO80hoh2f5Fu4qST
         7M85nE73/6URnpFmDmWN1u5KfZ3uRaKbt62s2+CjK5RbYt/DNbH25mqklLUoITQTTuq8
         0XyliQE43WukY+0YnxiPQuBug0MmbFx0w/5NFOtCmX2xXexaF6w2t/dusPsMh6aaqeyi
         7gUd6f6qoChRqeiJeJ8k3lG6of7AzWQ+xMuQ9qDw7TUE1YL/hL4bWmX+Rs71helYmR5A
         E1pUg1iU6PRKbCA7SQD2mkwQoNKDknnG5LbP+vtr3C5u79yAW7uhem97vM/rOeIb+8sy
         Fllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694005006; x=1694609806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mU51GY9yuxPO6GEa7yQ+JP3SRd01g30GTLWKAvbMxCc=;
        b=Q1iQrNGpE/UwvmTjrdPHvrXZ1lkhzLCob5Zd8ANDn0MLvFOI1cWQlKHqFwlUoztnk3
         bHpW/YDmYXCXqXoodkhITdLdriSjQHPSVOlLmHDeqihQ8jCDVTg4zVdN7/TTQnyTPSSZ
         yVezQzHDvkXH5az/0y/Xusyo94EegtyCMg3WdwEs74TlT8i6o70BM/gobKnGaXjyKoGM
         cPbU73QLMkOJxdM7bkJFfWCHyrRCqvIt1t4WT/wyb9DIufhWXMWbevJJcvf9vc8kVjIv
         5AnRL6oKmt//bVfDhr3fpZValXV8xE8Y20VGkvWAGYkEtL+53Do2AX38l3fs7omcLWCC
         yyvw==
X-Gm-Message-State: AOJu0YzCDtuHJTHYJsGNsHhBNAdO7gQBxtgttILsWB/pW/pw77kgDz3Q
	0M+/YG059M/R9SKP+EInZeoxBsah+PrGyWFNrbeq+X6P9qc=
X-Google-Smtp-Source: AGHT+IEgKK8hWkWiNuDHkVeMNzTufKEWmr7pBMEOSelfeqR63X8IwZ2DX5NeNYkSM8k6kAD5OD/rxC+kSM3EJG58gs8=
X-Received: by 2002:a5e:8706:0:b0:792:8d16:91ea with SMTP id
 y6-20020a5e8706000000b007928d1691eamr18335822ioj.0.1694005005918; Wed, 06 Sep
 2023 05:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693924532.git.bruce.ashfield@gmail.com> <2E1BC731-5CE1-41F7-88B5-3ACF145BF7B0@arm.com>
In-Reply-To: <2E1BC731-5CE1-41F7-88B5-3ACF145BF7B0@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 6 Sep 2023 08:56:34 -0400
Message-ID: <CADkTA4MgPLM1L-bO=+28QE_xZC14EFmeAHfZSPKCtjOZfCZU+A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/8] linux-yocto: consolidated pull request
To: Ross Burton <Ross.Burton@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 12:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187311

On Wed, Sep 6, 2023 at 8:39=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:
>
> On 5 Sep 2023, at 15:37, Bruce Ashfield via lists.openembedded.org <bruce=
.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Richard,
> >
> > Here's the next round of -stable and configuration changes.
> >
> > I also ran into a build issue with 6.4+ on one of my builders
> > due to a gzip mismatch with zlib versions. So I've included
> > a fix for that.
>
> Would you be able to throw in a cve-exclusions update when you upgrade th=
e kernels?  I can do it, but it=E2=80=99s easier if it=E2=80=99s done as pa=
rt of the upgrade.
>
> For now it=E2=80=99s a little manual.  Have a clone of https://github.com=
/nluedtke/linux_kernel_cves to hand then:
>
> $ ./generate-cve-exclusions.py  ~/Code/drive-by/linux_kernel_cves/ 6.4.11=
 > cve-exclusion_6.4.inc
>
> (update paths as needed)

I'll add that to my update steps.

As long as I don't have to audit/check or manually edit anything, it
won't be an issue.

Bruce

>
> Ross



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

