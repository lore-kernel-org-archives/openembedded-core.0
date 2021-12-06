Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4086C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 14:08:20 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.51797.1638799699470731037
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 06:08:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZWaOXHsI;
 spf=pass (domain: burtonini.com, ip: 209.85.221.53,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f53.google.com with SMTP id a18so22712682wrn.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 06:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z5tpeOAnhlXZAMeH/e/jSOL7jIV4hl6UPAUA3HpR/Hc=;
        b=ZWaOXHsIR2mE4qW3WLTIHD8epropfyKFSA0Q5QSgl0c8CkxP58dau3w13QpgfnBdtW
         Bt2NuqkNkXJWwErZJpsSN1z+BrCgcaG/5R2nwUeFy2I/RE9X9SHomuHEPoXjiuREXEuL
         2BBUUEEALbKhAsQFnjMe1BKBlvC+M7DQ+YfPw1Iiwn+O72ZbZkH+PIlaSn+OVL2g/dZd
         0hKF7ylXMTsZ0K5kcOvH95m0+fOJTwxmfSbJykC7wc4rvVt9IPMKSdHaI0aiEtxsGpyB
         APC3+V7ptOh4LU59DMrnHpwX+KT2bPygCVHg255TGUY52Cu5pXT5ImCO8GEMfqlhHUAr
         XtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z5tpeOAnhlXZAMeH/e/jSOL7jIV4hl6UPAUA3HpR/Hc=;
        b=V7vDcekAenTXCicIx525vjZz+u/zoI3nOAarhJUMb3SHWReuMy9zYup1FfyZvSqiZf
         UmQvnsxpIofYVD0fbgF02Pbs0aCAd/8YTwQsUkbpDSIBGa6yXjAE4L60DmXf7/RyNR7c
         De1DZFT2klVJKb7VjFG1Fd7NRXHGCUZsw+IisXFyFTxoMOmdvXY8OABsmm1YaiAfqhYR
         SFHQUFVJ/qdYfK/s7N0XNXxIPRs/EeVmlTdtWmSP6yBirymU1AbOAfWikGZNWcN0YXQ3
         HXB7Yj+k0G88z4TqZYHdZEtelzqTuS8uoUztOqoFgezJe3a+TZozRcJgutu52vqrqlFh
         wzpA==
X-Gm-Message-State: AOAM532lFkLX7Agq+7nk2LVxpEpYx2JW/TZpSeW/PEDUHJXf4Yi8GGxI
	cFQ/EYjbsXPeFEKev0+lExexVszhTzDnp15dukTHVQ==
X-Google-Smtp-Source: 
 ABdhPJxoT3/oP8yZnt/zfXkbmtrssIvuv0I2NvbeTHqsiS73cCLdxc5LprbEvw1PgpiAtVWEW88sfAa9W6tU2IsOlvk=
X-Received: by 2002:adf:e54a:: with SMTP id
 z10mr42038351wrm.328.1638799697756;
 Mon, 06 Dec 2021 06:08:17 -0800 (PST)
MIME-Version: 1.0
References: <20211204071323.2480163-1-alex@linutronix.de>
 <20211204071323.2480163-26-alex@linutronix.de>
 <CAAnfSTu4iCqOneHeDgTKvG5ao+rOnxV5EWXN6pfFaRVRhPv_3w@mail.gmail.com>
 <CANNYZj95RL+FwZSpSSVurmypf1wXWDzkjV18Ee4zrDxs03F7mw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj95RL+FwZSpSSVurmypf1wXWDzkjV18Ee4zrDxs03F7mw@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 6 Dec 2021 14:08:07 +0000
Message-ID: 
 <CAAnfSTurVLUFAPSVtoD1hvvqOdKWduAiD0Qgc6L38Fh8A_YdTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 26/26] serf: mark patches as inappropriate for
 upstream submission
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 14:08:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159230

On Mon, 6 Dec 2021 at 11:03, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> Presumably, that someone would start updating the repo and making releases, at which point we can reevaluate the situation with the patches. As of today, they are inappropriate.

But how, in two years time, would we know to re-evaluate the patches
if they're marked as inappropriate for upstream?

They're not inappropriate for upstream, we just can't submit them to a
meaningful upstream.  There's a big difference.

Ross

