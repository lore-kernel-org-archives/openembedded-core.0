Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F66C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 12:12:23 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.10603.1639051942828994926
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 04:12:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OvBrs6uf;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id y196so4007928wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 04:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i0MAoBIhgl8foeV0DADXumTOhWjZSgTStpCKgjFfDCo=;
        b=OvBrs6uf+9ObGRUPpWfPPiXSiSnvHT88L0EK2mw6BUb52EHyjQ63z3wNaaSNdJYbhM
         xwIcWGF1bMiZugIfZV3D9AqICgJDM2jpobuvDISQLOcadAvejMJx65fdbK7kZ39UYB/N
         Kji37fo4Fnd7TAWOuMZuQ5hZrZBlbHvoZtExXLjcJtTz7MvfAZ2mQpwd9nJmJsrCD2o3
         7zRP6pLa4mWkP5h9xbb53VChsTk9vd68KjdU1k6HS8Kv7rs279qI7VhYhikZJDKPlbTE
         fKh0jLONWhhZuS++9cUkIUHaSo8lS3oj8SzygPPk8uCBsMv4HmZ+6m9Qz7i3iMff+huH
         S1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i0MAoBIhgl8foeV0DADXumTOhWjZSgTStpCKgjFfDCo=;
        b=IBlQE2IIun6MZHaaTjshLc5HO8Cc+q+egW2grJ1KRFKuATYKeEUyVUY6nFdz8wo67w
         PH+hfRwvERRh2ASAhwWAhjzPHIw5mXczzGsB3W9NDQAfyvWS4TTve2cb8SLMICix9bHx
         8AnZjes7sTPiI/TSd6qBbe1WW7PNEE1/58le0+QgYYxrRJRBbXrMxrg3Tjhf6xJuMIDy
         p/QwUAG9D+lll+gjJX2XWWFGyO/8rG6MlWcjju7yf/jN6VDqw6f8zSK2BR+kjHiU7iHa
         pHNXiCTicC2yNlTOPT9NEXm8dWN7FHk74JL9mOMf5/vlVXgN/MrqFscCWdeFHu+Z6/j+
         0SZg==
X-Gm-Message-State: AOAM533tjyB7PUahwqCESMYloNwlj2yBucpmYwfO1ogbiFJe2S4RZu+A
	V/gRfHB9xiKuBG5BZ06a5+veSnDQan5rfZ1WtGDrWpwW
X-Google-Smtp-Source: 
 ABdhPJyOqStWnWKYyBL5ir/W7ja7DNDaVkz7plK4Ejq/d9m6JTOdE1szFPf3B0n0aZMW8g1mPr+Of0dFGaztt11pXKM=
X-Received: by 2002:a05:600c:1d0e:: with SMTP id
 l14mr6636710wms.64.1639051941360;
 Thu, 09 Dec 2021 04:12:21 -0800 (PST)
MIME-Version: 1.0
References: <20211209065335.2999735-1-timothy.t.orling@intel.com>
In-Reply-To: <20211209065335.2999735-1-timothy.t.orling@intel.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 9 Dec 2021 13:12:10 +0100
Message-ID: 
 <CAApg2=S+t867iCm7e4+JaJLStP1KX2F2NtCeLMLS7EVgfbTV=Q@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] gcc: Add CVE-2021-37322 to the list of
 CVEs to ignore
To: Tim Orling <ticotimo@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Steve Sakoman <steve@sakoman.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 12:12:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159447

On Thu, Dec 9, 2021 at 7:53 AM Tim Orling <ticotimo@gmail.com> wrote:
>
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> The CVE applies to binutils 2.26 and not to gcc so ignore there.
>

Tim,
Have you requested a NVD database change on this one? Or you prefer me to do it?

Kind regards,
Marta

