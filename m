Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE980C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 17:12:11 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.9235.1667322721433240439
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 10:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ppDTYnJE;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: festevam@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id q71so13953936pgq.8
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 10:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yZRgmns/7NucGx5dvc1gmnirHBqkQTMfgUvoRKyHdzQ=;
        b=ppDTYnJEcGC8PgQpHDbapbT+Ezv283Dex9CIiJDWPhIy+YqXv+yae7VQBZPJDoa+3D
         QbAxgk3F292wf9F9d0JEYjpkxcdEfhCFyLnHK2LpOmGSc94cbT8TTS+NsrOSDnVlY57s
         3yy4ml4sqPv6/DEHG7LhEWw5TKg4zKCtAXuNjGPOVmR6O3Z4BJpuV52+DfBpMCW1WRh8
         m+jzDPUcsgSpJc9ARELPNbrXkAPmColuLMALBELuDpaGhGZZhuEL08bijjVzrIqb2Z/4
         Onjg20kRbqDTriymptnDKOnhSy0TKv495J13zfc2GgLc/xs7wCxVEuuoB4Jt0xh0xHUK
         eRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZRgmns/7NucGx5dvc1gmnirHBqkQTMfgUvoRKyHdzQ=;
        b=kpLKPuI7BeEYpoF8YrIGd4zmJjyuj4gamo8TG4/di0Q4kl5oQc2GHN2stGlOTeaM90
         ZYuZHQcyQi0boPCd/sgZrBcoP4plEt4AJnBJpGZb17oZExH+4ayJqR7TjAE7b4i5qEqk
         EuF+1Pt7dcZJZWlQFIh2tx+RBb6SV/giG2Y9uY0UJ8RA4NNZCJTc2pswblp1u5a+mGzZ
         Owhp5OQFDQDf2jc8WCdPHHm5CziiN9oyxJvvRyOI3NaVMhXBWtS441B7IpIGGwgXiKOT
         LyUDBRmbFosm4qaWaQREzCY8+WeV81dECPQ1sT0VWkIGCur0Bi9WwoyhvuSwz2AJkVrZ
         z6WA==
X-Gm-Message-State: ACrzQf1RJfGvVfoSc20cDyRqoyAOfpJvAJPDh4W5P+v8Za/jqm2IdL+1
	/8/vWJFiF3xVkgtdQXIZ4OYpeghtvEyIRE6qfZ8=
X-Google-Smtp-Source: AMsMyM5sKAbHXslqYd+V6P8vU5aUmM17DZkj9E/KOzHd4Nlzt9c9X6P3JphaU0kiTQHkHxAiQMc9hNaWO6LX+CW6H8k=
X-Received: by 2002:a63:4a26:0:b0:46f:7b0f:1a60 with SMTP id
 x38-20020a634a26000000b0046f7b0f1a60mr3566734pga.131.1667322720761; Tue, 01
 Nov 2022 10:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221011030216.3874881-1-raj.khem@gmail.com>
In-Reply-To: <20221011030216.3874881-1-raj.khem@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 1 Nov 2022 14:11:48 -0300
Message-ID: <CAOMZO5BZQFHDYgA99ymw_zL12Qsmg9yzkLwqYRDUh5x53b9ZKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perf: Depend on native setuptools3
To: Khem Raj <raj.khem@gmail.com>, akuster808@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 17:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172370

Hi Armin,

On Tue, Oct 11, 2022 at 12:02 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> perf has need for python setuptools when scripting is enabled
> from 6.0.0 onwards it seems to throw an explicit error
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>

This one landed in master:
https://github.com/openembedded/openembedded-core/commit/da3d00178809bbf7cc453401e0c5937796ebc2c1

Could it be backported to kirkstone too?

I am facing an error when building a 6.0 kernel and this commit in
master fixes it.

Thanks

