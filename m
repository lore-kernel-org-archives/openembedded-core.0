Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB12C43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 15:32:27 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.7388.1655134339865244964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 08:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nd+1RT3i;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.44,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f44.google.com with SMTP id g25so11879483ejh.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 08:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wf5nrSLYvry+JTFkeNKw+WYvjhwPV8reCh3yTAhFufo=;
        b=nd+1RT3i3UexXH3n5YmjEklW+bzpZ4vcMQKZuhV/kIC8wAiJgK/WuYVNNGdjzoXoHI
         8ye47UGuZj2xJ4f+y95qaJ05cbWFUP/bghrLhWiSi2oQVg6S7LN6S4nPeyAT+tDYX2K/
         /SPke2v/TqZaJJdUt4NQ3ARNcY2QWBpUWCMzqMjK7T87568GymOCcruI7CSVi76TijJg
         cwqIENlWagIiyB8v1s0codVUxN64hRA68z46P5MDykrVg450zt7/P2vp3qxy4cYng9HT
         73JnDqDMLC3+FBV1agYArT3CHRPXc0lie7dTy5ffWzHxNnkSO7DYWbisNc1T7i7IcIwY
         p5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wf5nrSLYvry+JTFkeNKw+WYvjhwPV8reCh3yTAhFufo=;
        b=XNXDOYiI1RM0HFEeFJBGpyJBZNWtYRchUZDoD+n2F1UpurXJg3vYP0zoYLt5fl9vHs
         zvE9+U8tVAfTMZJI1m5dxi1NHXmW9ue34SzGh8RkrS5ImmQJC+S09XKOd8z+obs65qtv
         DnP9dZhnoKon+29yWpuMPcYbX6UJmrTJa0ODOvkfFoGQB7WKiZ1ebEvff9PX2wwIEqYy
         qpdUo3leMtcrkffiNd3YdBWNchOaT8JXwYZZgB8CDvnfcEN8iRaE4Ru5/oaoL5clvd0V
         OLXuoQio/oGLRpAj8qSnVvMIk1kEK9k3MJ1TYIVBY137XjpWZEQpxM0Ap2Mv2nIl90+B
         Mc3w==
X-Gm-Message-State: AOAM5331rfKaBmIm1rcf0nSVqAo2FTp/Um1d7UbjsX9albGNDh6BfOZl
	7VK25DzWnTPdgOJKkNIewA1TCJGueExjQs1RP9lLWA==
X-Google-Smtp-Source: 
 ABdhPJwX36bknMVCA3T0by8MqoB6DW/1HRYkJFsw68bnSRcEDuCKfXafAm4pc4af+KDdyOqw+l81STVqK9RWFLt7ewk=
X-Received: by 2002:a17:906:f17:b0:6fe:94f6:cb8a with SMTP id
 z23-20020a1709060f1700b006fe94f6cb8amr378138eji.456.1655134338140; Mon, 13
 Jun 2022 08:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220612120224.4629B96054A@nuc.router0800d9.com>
 <AD877D76-9887-4236-80AC-F3F0BD6E4540@arm.com>
In-Reply-To: <AD877D76-9887-4236-80AC-F3F0BD6E4540@arm.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 13 Jun 2022 05:32:06 -1000
Message-ID: 
 <CAOSpxdYb97KG45YxedP1Gne7mrPqU0v3pwS-CbU02hJZSyJSgw@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 12 Jun
 2022 02:00:01 AM HST
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
 <yocto-security@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 15:32:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166867

On Mon, Jun 13, 2022 at 5:01 AM Ross Burton <Ross.Burton@arm.com> wrote:
>
>
> > CVE-2022-26691 (CVSS3: 6.7 MEDIUM): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26691 *
>
> This is fixed in 2.4.2 which is already in master.
>
> The stable branches can cherry-pick https://github.com/OpenPrinting/cups/commit/de4f8c196106033e4c372dce3e91b9d42b0b9444.

I'm working on that for dunfell and kirkstone today.

Steve

