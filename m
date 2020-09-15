Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web11.10244.1600165604667122181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 03:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=UwaDwfMs;
 spf=pass (domain: burtonini.com, ip: 209.85.208.195, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f195.google.com with SMTP id u4so2294699ljd.10
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 03:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l2BnzAvS9MGh/28UeyjOSLU26HGjlijtS20wpxl75C8=;
        b=UwaDwfMsb8GR0UnHjsAIN3A45ukvscdmaOxW2Wd/G1zjKGEEALI/FYhsvmvDoHmczb
         n4xqc8+t71phVeKom9vy2mJ1r4jevZ8t1thwTUeCSdz7cXLG2gFT/6vYiBspx3x448tZ
         EeJ0mATrchugCgCK6oxuOZGTCoeAJH8JDVEdhXQqeyEawznBceYZcweD5Z6XLEx0Avt3
         icZ3Lorq+5lGjlGSdZvWE/+Oh2NzV8rqn6JpTIy3UsbqQDTIpTQA+4ynkQmlY7XxjsbF
         k0NvpkzALYlo/3hOp0fSpWxxaVaerpDO7yQaDuUyZWcgs9cnbNdTxfsC25OcR88Krb8V
         jI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l2BnzAvS9MGh/28UeyjOSLU26HGjlijtS20wpxl75C8=;
        b=IPmtDFOXkOFaXdQh/Uiv1a1kBzw9HGT9a2NGW9FCrIK4CS4q1tWbehwvP4gYj47MLv
         E7xAi0JK9+M3w9lh+cCw5PQyKefbnu+yk+G/2brEdzvdXOlMKbiDEH3uH6lgTOl/FVRH
         UtPvX7gQ7aEdAp5FF70dBw1F8DNMlzjzM+D4+9Le0aVFYJVOSgcME8dRFq5OhemKRTWO
         AJs3v7GMHeM4Q4po5Im9cwOUf0n2RxY3ZHK37xI9DkAT09WavVxDFjWOkUTtMazW+JT8
         0cJHcgl8MUXduoHyVuRxRRnlypUZ9tAOLBPbRFsEm/OQKuwF/znc30HaULIp2ncenwim
         /83g==
X-Gm-Message-State: AOAM532Y3hYGco6GwJ3Y1ziD/6gU961/1WFRNjFnBZIlGttVepMzhf0I
	ZwJhXVUC//D/zfjg+3hHWEwnuvAFPiiz+iQGSkUWKA==
X-Google-Smtp-Source: ABdhPJzPNYQ/aSTA9VtO+OKThZ59HGyfSdTaVSgn7lKiqhrFDp+9Iquuo8ATHvOULpd4v7j6OlUZcJw8yxFP6F6dr8E=
X-Received: by 2002:a2e:5c89:: with SMTP id q131mr6256765ljb.352.1600165602412;
 Tue, 15 Sep 2020 03:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200910025728.3868717-1-mingli.yu@windriver.com>
 <CAAnfSTsTmAE5fbvTck6m9rsQGa_FebUMWmAXEvKkCfq2TWjiZw@mail.gmail.com>
 <26851540-6c95-c58e-7ae9-87d2ba546478@windriver.com> <236780a1-589b-589e-3e76-00d829868a0a@gmail.com>
 <3d6f9248-f819-debb-0d71-de29ee312ead@windriver.com> <eabcd7ed-88a8-8453-18dc-af4fcc92c9d8@gmail.com>
 <dc5035a2-5051-ceb5-310e-ed6d7dff8fd1@windriver.com> <CAMKF1srYA5s5et4j7HbX6BQ0+zY4WXciagffTh2X3yMKy2vUZQ@mail.gmail.com>
In-Reply-To: <CAMKF1srYA5s5et4j7HbX6BQ0+zY4WXciagffTh2X3yMKy2vUZQ@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 15 Sep 2020 11:26:31 +0100
Message-ID: <CAAnfSTvE_wrt6DUGxPGQefJ4uF_0CZaPvpAtUsBJzoVUqbfjRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: always define unknown_lock_type
To: Khem Raj <raj.khem@gmail.com>
Cc: "Yu, Mingli" <mingli.yu@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sep 2020 at 16:23, Khem Raj <raj.khem@gmail.com> wrote:

> > > perhaps you are not using one of -O<n> option ?
> >
> > -Og passed to the compiler as DEBUG_BUILD = "1" defined in local.conf.
>
> Does qemu work when built with -Og

This is the pertinent question.  If qemu doesn't run after
un-upstreamable patches when built with -Og, what's the point?
Debuggable code that you can't execute serves no purpose.

If qemu *needs* to be optimised to actually execute then override
DEBUG_BUILD to optimise at the lowest usable level.

Ross
