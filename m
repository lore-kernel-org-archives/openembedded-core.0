Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796E9C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 16:49:24 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.9864.1639154963588709197
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 08:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=pl+FwyAO;
 spf=pass (domain: burtonini.com, ip: 209.85.221.54,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f54.google.com with SMTP id t18so15886341wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 08:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mePKQQtqcPmIIc5OWiDKuDq66z2C+/dHws1G/o/mujA=;
        b=pl+FwyAOCybw1B/g9UJ++JYEEwN81tXiC8oAtAstL4a0YOI8MwBeLDKH49JKAO9N16
         NFq5izZ8S7aPPq0lIzWhkt/24iYfgEG9mY90MEB/1yA6KroIR/Mna8Ct9SGT/tfci4Lp
         1bfOo5h+uMs0+30siF7CNykk6QxnHUDkLyHjI6CFiXQeuJuoCyxCrCw0QSELlnSOKg7k
         ozjAu62TPdKTRXSSWj8npwHLygA6K8r/z/EWbH+bRm1HfsYtVB69KNOjetz6WNsbTKzr
         uyEyzCkhAzFhkhPq7jFid5Pu/HVfn4UssOLsyVn9LQa7jYYSl1zQiSJIqb7J7cOZFXy9
         xULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mePKQQtqcPmIIc5OWiDKuDq66z2C+/dHws1G/o/mujA=;
        b=FdWCsnirhnyW5tSpKezavzfyyX3/GLIJUvm9GR+AX+eGB9t5ymTWB5TOucsMdVJ/2j
         XRZwzv9pC98FX9k2MoldyWkYHehwHRcJPn8cQS1UIxs7xQaplzXywOy5yphjF8yoEJiB
         vyHZWJxdVWIG6CSlgM/gZio0pIOQyIsE98PZ2C6NPewGcr2vtlItZqSHj+ydLK9qEAVU
         jgNKDhDXEftkNeg0yb9IAt1KXRZBC8i+WPI9PHNhFYCahyfsGeMVe4JJWFrJG3LukWn4
         iK8UitR1EqvzwgQM9RNTpQWDJXClazFX5PF5YnFhKaevKr3Gud4/V/QFu7OcG3LKG4Be
         M48w==
X-Gm-Message-State: AOAM530WO2QCZxVXwMZ5awoZRUH3rdjjJOk9cjxiF5NR+ua+rkjRU9cl
	/fQEliPshNQp3TFiLBEjO8T55xZIKnrGfTg9HRG2QQ==
X-Google-Smtp-Source: 
 ABdhPJzKmg1al5Q6vkkpGesFx5lJrtbqAPf0mlyqKzrnnAmMQSkWZwVmjE5jPw7SF6RdP0NktbbINabKDtn0ch6Ha7Q=
X-Received: by 2002:adf:f44c:: with SMTP id
 f12mr14783595wrp.620.1639154961795;
 Fri, 10 Dec 2021 08:49:21 -0800 (PST)
MIME-Version: 1.0
References: <20211210142242.2698587-1-ross.burton@arm.com>
 <20211210142242.2698587-8-ross.burton@arm.com>
 <CAMKF1sohc1y9WtchDDFtt9YrAX77VADc-1H8x2_5mN-BFrFb-w@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sohc1y9WtchDDFtt9YrAX77VADc-1H8x2_5mN-BFrFb-w@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Fri, 10 Dec 2021 16:49:11 +0000
Message-ID: 
 <CAAnfSTuZR5Mykt05pLVd+tkfhBybuaj4r=FSei6rwgoZgbqT-A@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 08/10] qemu: remove obsolete support for
 renamed libtool
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 16:49:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159554

On Fri, 10 Dec 2021 at 15:58, Khem Raj <raj.khem@gmail.com> wrote:
>> libtool is now longer renamed to ${host}-libtool, so
>
> Typo now should be no

Argh.

Dug out git-filter-branch, now fixed in poky-contrib:ross/libtool.

Ross

