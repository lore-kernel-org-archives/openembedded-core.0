Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A598C433F5
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 17:23:10 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.762.1651425786886264333
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 10:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=t5F83ntM;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.53,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f53.google.com with SMTP id z19so14327081edx.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 10:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IMpd4lkaAnJDB9h8LQtQlOuzMwjpYKteEQZlSrQ/OPA=;
        b=t5F83ntMj/kSGOugbHuQRM6F06AxzYUJOAUQFzMI94vVMRF5XJkUpTNSE/zad1v8S4
         7MIRXOUu1CBagvfknynXY013D4/VMsOHRBhJniZcziIiezzcsiRSIMW0LWjXCGIaNt+q
         Lcb94nMM355kRV6bzqXzp+S0DooNR0vHv8trsSl60y4giOOFjDSov5RCVnB6Rz2Ffqb1
         8WQqMmmQt+O+qVr+92ZNbHtfsWGbNwX+SMpez60D7pdNxMCXx5p7RBfo+a3xD4MwHFxf
         rzodMkkzQOKfiLr9WlrfyLodwZG5wYuFaNTURNBsm+4y6RMrHz8TdgeV4IeZLPJ7poxP
         uSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IMpd4lkaAnJDB9h8LQtQlOuzMwjpYKteEQZlSrQ/OPA=;
        b=Q0Qw8pBd20xiEjQ8FbpXhTwIENX7+Qh2nC/+lOvZnXOeurJpwQY4Ih9NOYj2hQDM1Q
         llF2KNe+hEVxOugjsD5Ctiy/9WUMj3I+iNjRi0xdB+J7LnRE0pZ8HLyFOyMxxOXRZxvc
         pteaRX/+ahMIgVbGMzhU10t0SuHUUAHQ2z6U0uWJZARvYwp/rolyZDXlRZly9tNpZuKP
         VKwwNVMoEdUrn/mxfwaapEmkSTXeo++hRSzOmFWMgieM2R8hCYkk+bHqQOMAoaeV7YlF
         K+slDktAHBHy8pYPVMbe3Ho2T/A3/hZOqJOVsmm/MdvGfQFr17oxYzbMwh6IdssYtS1l
         EEWA==
X-Gm-Message-State: AOAM5303iT+Q9X/DTAX9PmiocTnpRf4fetuqeLmkipd+WMIaNTdjA6XA
	KwLv5SOU1+9a1yP7KterBtkEC51seDNIC4azedrlQQ==
X-Google-Smtp-Source: 
 ABdhPJxRTF1u7Y1ZXS/dPwfxyMqwH/rvMeuugUHwghu73uRWQvo9r89PEBbcq9Lu5+S/v5x9k4qUoJ/GcvUAf13WRrQ=
X-Received: by 2002:a05:6402:2945:b0:41d:aad:c824 with SMTP id
 ed5-20020a056402294500b0041d0aadc824mr9783538edb.364.1651425784585; Sun, 01
 May 2022 10:23:04 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAOSpxdauyRx_uCPuBPuxRq1RK15wDkLejgCzPmmpU2Ko4pdBNQ@mail.gmail.com>
 <9631.1651424677019511500@lists.openembedded.org>
In-Reply-To: <9631.1651424677019511500@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 1 May 2022 07:22:53 -1000
Message-ID: 
 <CAOSpxdbykaeQLMiW2kqRfmnVireDGWATGm7sCPrj2+ai5_pRKg@mail.gmail.com>
Subject: Re: [OE-core] backported "neard: Switch SRC_URI to git repo" patch
 from master to dunfell and warrior branch
To: rahul.kumar_3@philips.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 17:23:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165085

On Sun, May 1, 2022 at 7:04 AM Rahul Kumar via lists.openembedded.org
<rahul.kumar_3=philips.com@lists.openembedded.org> wrote:
>
> Thanks Steve For Quick response.
>
> Any update on Warrior branch.
> Or Is there any way to track the queue for warrior branch?

Warrior went EOL in June 2020, so it is no longer being maintained.

Steve

> Thanks & Regards
> Rahul Kumar
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165084): https://lists.openembedded.org/g/openembedded-core/message/165084
> Mute This Topic: https://lists.openembedded.org/mt/90816117/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

