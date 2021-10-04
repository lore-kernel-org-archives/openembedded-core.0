Return-Path: <naresh.kamboju@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48936C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 12:58:50 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.8862.1633352328826771611
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 05:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vh/x8JwZ;
 spf=pass (domain: linaro.org, ip: 209.85.208.51,
 mailfrom: naresh.kamboju@linaro.org)
Received: by mail-ed1-f51.google.com with SMTP id r18so64395628edv.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 05:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZJaH2+Qf/oBj28xdzGVmAywqzAfSzx6HY/aZsf1mqFY=;
        b=vh/x8JwZega3EckBiyrpKGST9sQSK6Nk+PQN7KAGohWCgEDZpRCCLXWquoT9H5tcOd
         pX94q0quuOPHddRSA22HWrx6uleY5Z4bIMNAHWSFhNc7M+DHn+nwURumbUGdA96lJ2DZ
         twhzsN8wu06GRUppZXvaRD2xUYSxk8MRnXwzow1eKcnzD82UmILiNcU0jDjqEwWpYtfk
         zRy1LdCLwWR6s6SDlGOIKgqyZzGl4fu84nyKxV0WxisfiJ29wXio78C0Rr0J7/G5taJ8
         cyM6Efqklf4++iwXglsQlSDm7Kb0VzMJ7+ZF1KUGtML5zgtEMh2i1U/uyHOq6/ZBhT+h
         OtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZJaH2+Qf/oBj28xdzGVmAywqzAfSzx6HY/aZsf1mqFY=;
        b=H6UKpTSrMp94NNmqdrmNSeRH7wJLdjgcMa7LJKXVdqLAL4inejVedktdEIYsrKImnS
         WMZLh7meBJhoFxy0BajMpCeJzo4sJKOxM7Q47ANc24IFytKEIzu1WDh1FBtJHXuOCHjZ
         GlC1nbBEewR+ut18aBZ4NnirAtciQ9S1ugfWSwEWwe6h6UjFJj5ZDl29ugo+cXGT7z0Z
         NXWHFZp7DaFdVG2aKmO1hRSZS4yjl7R9PVJl9EtiEkTO6o409T0CgmJ4Se+E1KldHqbW
         5wQwVMStpa3ah1uUJfeV2po2aLMzpCelUTfWJB3KmHrkcQNJruZybnwNA+udBpj5jbuw
         Dd6Q==
X-Gm-Message-State: AOAM533ZyOVKrR2SN6Jrd8utZ8FKcbum+jqQpOybuQ3n+pQdrROKZrL+
	Z40zBKKguOM+WpRqj3fAa+f5f+iNCEFpHCLQE3sZ2A==
X-Google-Smtp-Source: 
 ABdhPJyVOEu08Tda/PnoSUg0sq4p84vo3a07O4PjIy6q4YvQSFeoutYSYt9uto3n8XpM9rPbqzwWzNJGviLlxkssuJg=
X-Received: by 2002:a50:e184:: with SMTP id k4mr18358670edl.217.1633352316612;
 Mon, 04 Oct 2021 05:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210930190911.31243-1-petr.vorel@gmail.com>
 <CAEUSe7-FAwj0jWjxK==yL6exsG9BhqoNJF7+xMhG7t_gFpXWYA@mail.gmail.com>
In-Reply-To: 
 <CAEUSe7-FAwj0jWjxK==yL6exsG9BhqoNJF7+xMhG7t_gFpXWYA@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 4 Oct 2021 18:28:25 +0530
Message-ID: 
 <CA+G9fYus-C3+1rdjPmB6tS9jpQFXqE8=d17NsmhxumArJCPZQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] ltp: Update to 20210927
To: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>,
	Petr Vorel <petr.vorel@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 12:58:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156586

Hi Daniel and Petr,

> FWIW, we've build-tested it (against Sumo :(, changing the override
> separator), but have yet to execute the actual tests.

Thanks Daniel for creating the latest LTP builds for arm, arm64, i386
and x86_64.
LTP syscall tested on these architectures and no regression found.

15 new test cases pass on arm and arm64.
17 new test cases pass on i386 and x86_64.

- Naresh

