Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427A2C43334
	for <webhook@archiver.kernel.org>; Sun,  5 Jun 2022 18:47:39 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web09.23405.1654454848882557204
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jun 2022 11:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jemVG6qp;
 spf=pass (domain: linaro.org, ip: 209.85.160.176,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-qt1-f176.google.com with SMTP id hh4so9105602qtb.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jun 2022 11:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=g9cyzRdg3A/6L/BQeQrAKZp9Tuvw4eBBnCE9aZx47Bo=;
        b=jemVG6qpI0tEWDXSMFMb3IBbf7f3lyo84X2foWBYdk4eQZ0GnOhcQwjywWma60Tb01
         uQIKWed8FaQieTUO8FRTJzfDc9RCp70Nth1DxfGRLAq0cujvxuFVV9ZN6m0ozMbB+g/c
         12CRxDezT3bCaOC2qXAQ9M37y+OdafFi8yATmI1nVWaiRAUm+NqEsgWKR0qKiBlIxnvc
         BEPjBkz9r57SGKjRefDyjU6Cg63lIQY0J+K6gTMXTsyq4cS0F/gryBIcVaRzjIJBggZV
         uqN91uo6sJQmfq8K0hcqace50eTEkqJG5JW8pWocLE0L9n5CRRdySQuMFBvfV2+q3Yuo
         m1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=g9cyzRdg3A/6L/BQeQrAKZp9Tuvw4eBBnCE9aZx47Bo=;
        b=QL4vWRWuNM3XBuvM7BePyOnrlMKJdZ9qHyeZqUS58EJAOZbCeMrgDgFKZP7Z0IYvsl
         2wIeH66gmHHmYDzkRR9x5YyYqRT2fe8EnSz1eZkgOOvKgccc1wT/4pr54ewgLvk85uuV
         oLK4g9OA3sxorR39B/6iZ0hH/V9SScWO9DDAfX4MoVSehXbMHxnrJP7WyElpTJWVp13H
         gFnTsAllQaYTz7T2pLFEOoquh/KuT5YA5tJ02ieWUa9mHuQeBj4ioZg6adQYB8QcfLLi
         H6D8xTkVXDPNJGseSf0EFvJpznY1szRLSaWJTE+2HcYj6oAxCFPuOUu1SxNQGdc6AfNA
         RVxQ==
X-Gm-Message-State: AOAM533x4mMPZ0sFjAUcN+prq+yg334SAt60vvSBCxLRiwtzvaB7ZUa9
	gJ2j2r/xumQ9mPCdbbiJ32FZNN1LlSqv8BgjTaI8h9tLLMiNzA==
X-Google-Smtp-Source: 
 ABdhPJwI+iVcdLw8VL8eJ7GF/zM9KbpJ7SDAkM0uIIql23mQ2YQ9y4eO7E2HWK8UXuaGlRDTnfzNgeP1r4ul3/Ofkf4=
X-Received: by 2002:a05:622a:4e:b0:301:8a1f:b89b with SMTP id
 y14-20020a05622a004e00b003018a1fb89bmr15761631qtw.62.1654454847774; Sun, 05
 Jun 2022 11:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220530170213.1562720-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220530170213.1562720-1-dmitry.baryshkov@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 5 Jun 2022 21:47:16 +0300
Message-ID: 
 <CAA8EJpoDyNDPz2GqYmqtvJZX3L71h8Gnn9Ofsse3jKVfhaWrbw@mail.gmail.com>
Subject: Re: [kirkstone][PATCH 0/2] linux-firmware: pull two patches from
 master
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jun 2022 18:47:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166581

On Mon, 30 May 2022 at 20:02, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> This pull request cherry picks two commits from master branch to split
> several packages that are usable on Qualcomm platforms. Allow using them
> directly rather than installing huge linux-firmware package.
>
> Dmitry Baryshkov (2):
>   linux-firmware: package new Qualcomm firmware
>   linux-firmware: split ath3k firmware
>
>  .../linux-firmware/linux-firmware_20220509.bb | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)

Gracious ping.

-- 
With best wishes
Dmitry

