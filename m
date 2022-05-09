Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C46C433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 10:46:04 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web08.30223.1652093158184596113
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 03:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WKfFPCj+;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id u23so17360718lfc.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 03:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xup3GhSN6NW/Qjy8YkvFIN7L4VwatKbzcUio6yBXRv8=;
        b=WKfFPCj+riMK9Sd8LFitzTwEqukbNwAGJOOCJ3B6HVgiySFHjZ3WuDtJTy44nBB6dN
         S6oZjk4AsKFWC7RxSp9hkf/EYHAEfdeWfSHIZFSYihVO4puzyg+xO5FKftO1bai04e+p
         ET8Wu9b7rFkTlMPgqW7joEx9MMLXtQs5dVBNBIeI5wIqUNBsBhn//TwVtvxqxknizN5t
         f2Z8yeipLplkpO9XySXH3yZZVK2KIvvqfobFjmlLEFC1EXgJMTRTeVKRosoaBo+IF1Kx
         TZcE18VsMMsCHg76F45MHoWurkPM9XHjQx2SwEEsYaSY3yPUMvymT+Ndy0p5S0FrSp6t
         kjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xup3GhSN6NW/Qjy8YkvFIN7L4VwatKbzcUio6yBXRv8=;
        b=KLuQDE4kvaow0hr8PZkHLSPprWHbUzQSurskWl8f6l7zh79o8I53DdL60DMa3mD79P
         6EW8Gi5cn/G7DJmgrhR12cGE/dMtVh7CodI1W3cx6kIy2Whj/aMt+o3sLkokzgOTFxB8
         nZrX5+lHgHk+9xVxk4TJ58QPptqty5WaUFw5hvmymhPeMW/QR/luKvOyoJraeeP4LZoA
         jdooYt0XZb0KYo8i673jiluVbjX9m9doaxPmsb048vIqOoHKOWdqwustyaZwm8lCGbpY
         XQEgmM8cBzNNkWAJ6ugoWqXFxEcxO1FtZDXt90aQKV/8h++mwtDtxpwbdVHXrLXN0WMC
         bGOA==
X-Gm-Message-State: AOAM5301Ssu6tQS2ACY6OIB11rya8B6jgxpZqG2aABXUgNKia6APW1yk
	mkDW8Z6N4k52EIWvaxP1CmVV8YB90XLIbbhzGS8=
X-Google-Smtp-Source: 
 ABdhPJxfJt8+jJrg3YfJcWOrRUAMk2XX+uGRcJ5LphP+wYPXOtGY5C0yMtlgG3/gp4Yqx+SvOx4D0CAr58Gz7uxUPtU=
X-Received: by 2002:a05:6512:2353:b0:473:d801:6e3c with SMTP id
 p19-20020a056512235300b00473d8016e3cmr12432040lfu.26.1652093156152; Mon, 09
 May 2022 03:45:56 -0700 (PDT)
MIME-Version: 1.0
References: 
 <PR2PR09MB3100ABEE6886A2DD315983E7A8C69@PR2PR09MB3100.eurprd09.prod.outlook.com>
In-Reply-To: 
 <PR2PR09MB3100ABEE6886A2DD315983E7A8C69@PR2PR09MB3100.eurprd09.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 May 2022 12:45:44 +0200
Message-ID: 
 <CANNYZj9hcGeyP+sE7wLFPR4TDzcrjsiCMEEBBxEQMOJjdVR0Gw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-firmware: replace mkdir by install
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 10:46:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165394

On Mon, 9 May 2022 at 12:42, Konrad Weihmann <kweihmann@outlook.com> wrote:
> +Upstream-Status: Submitted

Submitted [where] please. If it's to a mailing list, link to the
message on some web archive.

Alex

