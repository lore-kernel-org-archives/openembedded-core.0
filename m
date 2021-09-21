Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.7614.1632230920812544681
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 06:28:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112 header.b=w+ZjHMrj;
 spf=pass (domain: burtonini.com, ip: 209.85.221.51, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f51.google.com with SMTP id u18so37435402wrg.5
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 06:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=Xc2aEYkGSzI1+G2Fu4Lp2wtv0aC4Pf0/QPSQeQ7/usw=;
        b=w+ZjHMrjdwjwT2IK9pcNE6MW2pG38zNInOH1yXcLTDNDEM9wsQiMjfmsPEMPZ9ep8q
         /0+0ZerCBgY6OYGiNATr37EyoE9YSVq1Eyv8y3Jn0qUrVGkwhkoNM42HypZIt7p1HAAO
         me1TbMFaD+u0nwBkqg7nkIQtPqjpmgw0wly79vF5jqBKV8r8t1pAuuWtNBrQO3QH1f+c
         Zyqu81wLQ3d1MTnXPGcllATyjApNVNpG4Aow+m/xIQx2V7AiL2qhggpzr4GvOlU9r6yF
         ViOkexH/r5ohBmmBBaKDb0U8OQRkRRKPoDxSjihRv7GNZxOJfFJqsq9Mznim1IQJgUJe
         KetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Xc2aEYkGSzI1+G2Fu4Lp2wtv0aC4Pf0/QPSQeQ7/usw=;
        b=6m+7E9qE8LfROlbzshOEpT1XZi7ogR+BNwYzlNs127XEFmHw7nHOQwD7h4bzIYLyng
         HD2a4difeCxy2ZJ6nJU3yJ1MyUakPAFr08cLj+vK3fj2uaSWE9uHIpJVkIHc9T9s4tsT
         0axtWYk0XegR2lqDOjq7UM4ewEoBWNDRQzkvH86kY8LRiIwsWBb75SBz6tJlPCAbA6/r
         u2eSZNF2wDiRnFz+dnfX8rbBGBYDs/JMJtJUL7gIcRHqMSPLuwcjcCn2ASvEHngMDfaG
         TU3BRMdpfc9Lcm8ZFE4nCeiav8UxW0NvKBldUXCF1PMv61pFHB9FvHhLX6VnPWEfvp2c
         fB6g==
X-Gm-Message-State: AOAM5314pqn4Hqkw8zOZvG4SJ0ox6NWeaXwUrlF77Kfo0Lo4c3cvcpu/
	q9oxevGL7PSyQHKdj2+1Iv7XmMRWn6rnduenr3JuVCbp9SrhnFI7
X-Google-Smtp-Source: ABdhPJwkG9rcM0fG/9p7VMBVL93XNUr3YJprZbb4cKH1D9uORDcMuoPp4xl71XBPTaVuGmOEtXn/inUvwS+VKefDAp8=
X-Received: by 2002:adf:f48d:: with SMTP id l13mr34741025wro.94.1632230918263;
 Tue, 21 Sep 2021 06:28:38 -0700 (PDT)
MIME-Version: 1.0
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 21 Sep 2021 14:28:27 +0100
Message-ID: <CAAnfSTvRABnV6Pvax8=iR5uO_JFzqHnXR66jR3xoXsLwG_P3uQ@mail.gmail.com>
Subject: eudev retirement/rebooting
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Because this doesn't appear to be that well known, it appears that
Gentoo is stopping development of eudev:

https://www.gentoo.org/support/news-items/2021-08-24-eudev-retirement.html

Interestingly the reason they're no longer using eudev is that systemd
can be built with musl "using patches from OpenEmbedded".  These are
the patches we guard with the warning "Using systemd with musl is not
recommended since it is not supported upstream and some patches are
known to be problematic" so I was initially quite worried, but it now
appears that Alpine/Devuan/some Gentoo developers are rebooting eudev:

https://github.com/eudev-project/

We should keep an eye out on this and be prepared to switch when they
start making new releases.

Ross
