Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF43C001DB
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 09:30:45 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.13441.1691659844081033599
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 02:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IgDCW2TN;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fe0d5f719dso1023747e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 02:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691659842; x=1692264642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oljKQZdnYDNipzftkyh4LQABdOOYku/SRD19dpY11HA=;
        b=IgDCW2TNQVgZGvAfTvzLbTHn6gk7CBUmzuM/g1j6DrVkr8/rLsC+n+elzf9FD2icaE
         7uSNgiHa+ulmzemXg4jyQg5fmDrYFkhX+T9dkX6pTKSS3DooHYyGkDF+mZb+/ESid87A
         gjnsrRi3rooLIGvnSqDUJG1pl2WQYaCsUxdq+nlqdU3OvLdVrmxkS1RxUhKRoM5H/Yuh
         JQJkVXJjYraWhm1SM4uyA2ZF9IuFwJ5+Tlu3UfyDbzbIKLd/apSnySMW4/JlCbHB00pe
         P4cxZkBz4DCCfQcayk9UlujKzudN4IODdz6DPB8kBLAuoYSamby3TvhGwgmQx80+ddkp
         PaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691659842; x=1692264642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oljKQZdnYDNipzftkyh4LQABdOOYku/SRD19dpY11HA=;
        b=brpWHvyZh2WJxdJPGHr6Kfe8uNb0XCRbsoSY/ttuV65X87VfrMKPsIsICZ6ODE3UD2
         d2hxyv5rBARF07AusrCKofzkmZAhYQ6C1P+VwduAmUHBPQlziXxIV1QDa8+VTruI6OFE
         W1r2is3+JtIS6Wx/86o692+1QRroLJxKlNvkoKfrs9t+Ac/8IWDasQ8ieSXQboDVzBwP
         O4r+e2IbB1JUNzdxKUw5MHcD4gBY8ZhoC2LlvuOd0RL0udRXdQpZ0CFqRCAaal6yjkrL
         LmoNfw3y3hJRuOh6LDrKV3VgH0jO1UeWzUVQgF4pc3hKUvIH+fgpMl/CDT0Ql8EcqMKF
         DX3w==
X-Gm-Message-State: AOJu0YygRnJbwtd9KP9gkSPro1lbCIk3Xip2kmJZ/5BVEw9E0Thqbex0
	rQ28YRqlYKNzOq7z1taNdTPLn9WULrPPdoLhybY=
X-Google-Smtp-Source: AGHT+IE7DhYZmc4St8XFAGZ5fKaFwsvprWCIb+B6R7a4SLWnBy4cdBplOi0a7jrKyUFWwOcdDlhr/jdx2pU8GBJshm8=
X-Received: by 2002:ac2:5b8b:0:b0:4fd:f876:d86 with SMTP id
 o11-20020ac25b8b000000b004fdf8760d86mr1238010lfn.50.1691659841993; Thu, 10
 Aug 2023 02:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230810091721.8123-1-sudipm.mukherjee@gmail.com>
In-Reply-To: <20230810091721.8123-1-sudipm.mukherjee@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Aug 2023 11:30:30 +0200
Message-ID: <CANNYZj--E_qFqOa0PM8pd2Nevy5FDHdJxuHCS+AiSaK7bd_0dg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kea: upgrade to v2.4.0
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:30:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185730

On Thu, 10 Aug 2023 at 11:17, Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
> +Upstream-Status: Pending

This should say 'Submitted [where]', as you have indeed submitted the
patch and upstream have seen it. Submitted doesn't mean they have to
like it and are going to take it.

Alex

