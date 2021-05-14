Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.12517.1621015976208885559
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 May 2021 11:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZB1Wb6wL;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id u76so291676pfc.11
        for <openembedded-core@lists.openembedded.org>; Fri, 14 May 2021 11:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nG8cFRtTpmfg7fuxt8P1sKg18VkbdHgVLkcT1wxbaVA=;
        b=ZB1Wb6wLYzuPU3h66QkeU4YroLCrOpwvXGss9rYbDNba3bF99p3UbqdVx/geNIsyLy
         HA3Cuj4tRBRqRfzyMdZjsJht44cHgR3FkQpObMQASyP7rfL4COJBRQ0v2sT2l87uVVA8
         3eOXErbr7ZdwLhp7pKaOKjs47I2t6HwV+ca84SL5oRb61nSN+HKGStPwoYmnJxcWS4Fx
         Uo1S+G/+GFbMBGNeFcHTC45J+jbFrQ0Up8TTIwPkhkm7pwgASYDlnUnlSTWvzeqffalI
         rGVHUn47KVDOrBrLi7ZvxEtLjLYQrFRum599fjZaa9FFYrwrC68JMIYCaJZOUu91eCtN
         nYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nG8cFRtTpmfg7fuxt8P1sKg18VkbdHgVLkcT1wxbaVA=;
        b=RmQaaOrpZhB2Mul4Rx2TAAZeiUXKg0YD9IyBWUsrL4Hr/PNN2mkCtqRzJLmaQUyg8B
         J5K4qrWb0CHJDdgh5FxTG3+Vj/LADPruECNvAIEKx3wZivpmKlLCya/R+VRel8O7T6ai
         XX/LZUwzNSfZkU7iUurtw459rBZ4bGcYOuWNAcCBP811IWl/m8+bzkVDogHzGgxTQvt1
         BY75NZgG0t1gr0vMpg0Usni34dR47xpUgmv9nZN7ei0zl1hWvjjbw8QOlhhPE9JzVV9p
         wQK6pMeSvHA4QEs1HLYwsjJtH4N5ZtJn6YHuH20csYJ7zbNTgiDjZuQlfphcg/TfC/xZ
         FJ+Q==
X-Gm-Message-State: AOAM532ZUZ7ZYwGmRkPFHgFEYFYg8szk0KLB9mWeG+o1oj8ys9t0mQI9
	Rz2DIpaAMPGPFvtMW1CTL+Wb8Hl5adhAf9kEZGI=
X-Google-Smtp-Source: ABdhPJyDSkYugLBDHPMh6uDkYgoayli9G/4yePLmbdYW/BUQksFUXGWveI6BdTCwavnmNqwcoajZKyAhRZbHWrDCS2E=
X-Received: by 2002:a62:3344:0:b029:28c:6f0f:cb90 with SMTP id
 z65-20020a6233440000b029028c6f0fcb90mr46152943pfz.58.1621015975714; Fri, 14
 May 2021 11:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210513205622.60879-1-alex.kanavin@gmail.com>
 <20210513205622.60879-4-alex.kanavin@gmail.com> <CAMKF1spKq8-K7DW42rc0X0hAvYv=1nz9mwcX1NsS5j+6wyeP3Q@mail.gmail.com>
 <CANNYZj-wDbwCusowfkfwMwOeweWShHweRxXfxK38YmoHHMmJCA@mail.gmail.com> <CAMKF1spq1myXA5=hEBswv-XOjF9sLdjFthNWM398DLm_Xuo8mQ@mail.gmail.com>
In-Reply-To: <CAMKF1spq1myXA5=hEBswv-XOjF9sLdjFthNWM398DLm_Xuo8mQ@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Fri, 14 May 2021 20:12:43 +0200
Message-ID: <CALbNGRRkOGoVoedK8MLcMkFX8EFmfaQwC3yZrntghw7n8Bz-RQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/8] meson: update 0.57.2 -> 0.58.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 14, 2021 at 5:20 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, May 14, 2021 at 6:59 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Probably resolved by updating to 40.1?
> > https://gitlab.gnome.org/GNOME/nautilus/-/tags
> >
>
> easier said than done.  Sadly these are complex apps and I don't have
> time to fix the  long list of dependencies it will ensue
> therefore I will leave it broken and exclude them from my distro
> builds from, Andreas might be
> interested
>
Will look into

Cheers

Andreas
