Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4CCC47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 09:43:27 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.8400.1706003000389612453
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 01:43:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z1SFSjPV;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2cda523725bso41897771fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 01:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706002998; x=1706607798; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3rEAUB6xm36dL3ATqe5WobEPdNf3wNxyV3fNAbjHClY=;
        b=Z1SFSjPViCUhcpxHBu5iw4b+RyaV38HnT/tWkFp8K8jtmbff3wHsi6G9G+qlfihcRs
         AiFZD1bBtSebgAbzj5bnHKAjEN/TN5A+z2m91htHvBXdb+Kzl+U5A27dC48w1rPCGJ3F
         TxUcp2WRd2tbIpJ84rTGAHnV/f4IXc9ovq0YCoun6836fAmPW3yG9t/q0i5RcXd+IGK7
         +LNbzoFGvCqV7M7tiFYNbWh0pN5YYQ7GTxFRhtQG7dBtMQ+gGCkDTb4vwTaeqVg9w/ml
         C4U5jOl2kEJShgL1Zf9X6OHZP4nBFhAhINdIJYP69qiJT0XxH4JZUZIKuEzYmHP62/mb
         40qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706002998; x=1706607798;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rEAUB6xm36dL3ATqe5WobEPdNf3wNxyV3fNAbjHClY=;
        b=MiyaGdXVdT5/GXIHhVFB9ysbUV59PMLvXU/DNKMWIXl5zfKWDkwiF5aXUyl1O3hyaI
         v/ipeqqhAw/QubIJ62AsYMXRL2X7YPJ+Gs5h+FO1wVa7vNc0ZRHnufs3ThkG2Gq9EQgB
         vWvEnn7rNiEYh6aj+vWMf205bTgDXW61Sdb0XsoyqztjXq/JDD8vNNyPRuBGndy1gHea
         O9nu6n3BcyQZ9assZvA/9u6iKQz9txuvDSigT8rbNTZWEdfIhIVC2ys/54aQfCOKa5mN
         Mjbh7O1yorHjRxN086ggGnS+tLniGKXWyRlVvZwA7OK54NX/Ir/1XsPy/3vhr/Ymdytn
         7xJg==
X-Gm-Message-State: AOJu0Yw/PlXUeHu7iIX2Le3s6UjEdiXYejwX8yrsutu2+CMcXH6vAoob
	Qd6ZqWAeiKubi4+soOGYqOW1Msjah346yIY+jSW6vyBXonn+Q+lF27TJ4jh5wiDqIyu8okil2mH
	6byPsoVCuFyRWQGQCz3H/p6Qvo4by+W7V
X-Google-Smtp-Source: AGHT+IF/VNQIbDimQn6DzYk24Htu8PT0Nq3JaM9wJunQMfO4EHupFMnKI2ZkqkQs/YHP5XDqzqTdVhhOh2dWwymbN44=
X-Received: by 2002:a2e:b44f:0:b0:2cc:8760:64db with SMTP id
 o15-20020a2eb44f000000b002cc876064dbmr1287017ljm.96.1706002998299; Tue, 23
 Jan 2024 01:43:18 -0800 (PST)
MIME-Version: 1.0
References: <20240123080918.3391325-1-chi.xu@windriver.com>
In-Reply-To: <20240123080918.3391325-1-chi.xu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Jan 2024 10:43:06 +0100
Message-ID: <CANNYZj_x6V1BfWOLMHN3_nmOcGZ99NjaVPSBt5K7oNtecJLUGA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] xz: Add ptest support
To: Chi Xu <chi.xu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 09:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194223

On Tue, 23 Jan 2024 at 09:21, Chi Xu <chi.xu@eng.windriver.com> wrote:
> +tests=`find . -type f -executable | sed 's/\.\///g'`
> +
> +for i in ${tests}; do
> +    if [ $i == "create_compress_files" ]; then
> +        ./$i
> +        if [ $? -eq 0 ]; then
> +            echo "PASS: $i"
> +        else
> +            echo "FAIL: $i"
> +        fi
> +    else
> +        ./$i
> +    fi

This should be investigated a bit more. Why does create_compress_files
need to be special cased and other tests do not?

Alex

