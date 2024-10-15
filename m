Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38899D216A9
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 14:13:56 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.14670.1729001627078714964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 07:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aOltmh+a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d495d217bso4894290f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 07:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729001625; x=1729606425; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cRI25CExAiC1nd5kDBKlJlUhJzUW+QTQUOgdZShl3PU=;
        b=aOltmh+acKc5bsokPNDnB2yfO+z5L9/I8cHBeCX2TlRwd/yu62UTWAiUJwiaGZ6Loj
         LJjpBfWJ3XFOlKRmfNFLKQ11tZbUl5tKCDlAE1cCtW1YPykbEkllwzagnVAga9HrVjI3
         7yqJgXhdSdYk+IhMfv9l+ZozaKikCLuherZao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729001625; x=1729606425;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cRI25CExAiC1nd5kDBKlJlUhJzUW+QTQUOgdZShl3PU=;
        b=hb4CWvkAZ0FswFTc3ZV+UHLE01Otwd5gqYd07K8UOZ1PcmaI1nz8/qrHq1iuR1Iafu
         p7S+pQ3kbwpgEY4D5hWkw2CD66eiFycZCuLnxKATeUvy9x9Pkxq+W0Z9NV9qoYi1IGAF
         RFtWF+kyfs3SuojkO4IQyVaXhS7wy+43ulon2kW0O0JiwlQ1czl+PRCbDjyrGPAzQDU9
         umoGmvnqER2uYNjF6lp85CJByd3KnyB7FGPbMaLRST/uvT8o2GM1wPOEuWzU3CPJYwFr
         btt0WRFF0h/NEcdKMF+xCYuZZJgsdBE1+cYZ2fz4GMbyRWVCvB2OEw0f1m5ZSWFtHKkf
         FAew==
X-Gm-Message-State: AOJu0YzfMxU72RCmjISsVpKw6pc8hGMmpyymqUiWl4u0yMqrmGkzxb4o
	lEN/s/dM4QanjWWcEUE3VzyvNGCOppApLwyVKTwBgOBQ71V5AK/j1PnkSnA429E=
X-Google-Smtp-Source: AGHT+IF1i6iMwBu7LN9vBw9E21WAXRRgmwHCLweputuWwmEM/zBeMLrRT+95FfW6gZTShftQp+bG8A==
X-Received: by 2002:a5d:6788:0:b0:37d:52fc:edf9 with SMTP id ffacd0b85a97d-37d5ff873f6mr11463118f8f.20.1729001625351;
        Tue, 15 Oct 2024 07:13:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:28fa:e6b1:dce2:85c9? ([2001:8b0:aba:5f3c:28fa:e6b1:dce2:85c9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf8164sm1664412f8f.71.2024.10.15.07.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 07:13:44 -0700 (PDT)
Message-ID: <de120c84628b099ba1528c82e681171c206b6cd2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v8 0/8] systemd uki support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2024 15:13:44 +0100
In-Reply-To: <Zw5Qm1ZEScA196fh@nuoska>
References: <20241011122044.12222-1-mikko.rapeli@linaro.org>
	 <ebd022b240f4bb6b8e2e2fb8d93a4c9f2ba9492f.camel@linuxfoundation.org>
	 <17FE4B15CF045259.4702@lists.openembedded.org> <Zw4PXRX28-qB8FjT@nuoska>
	 <874585dde5c3fe6685e9c8b250cd02dc2404f26c.camel@linuxfoundation.org>
	 <Zw5Qm1ZEScA196fh@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 14:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205917

On Tue, 2024-10-15 at 14:23 +0300, Mikko Rapeli wrote:
> Hi,
>=20
> On Tue, Oct 15, 2024 at 11:43:33AM +0100, Richard Purdie wrote:
> > The arm test still fails:
> >=20
> > https://valkyrie.yoctoproject.org/#/builders/23/builds/267/steps/14/log=
s/stdio
> >=20
> > The traceback is at least cleaner now I fixed the lock error. I did
> > test with KVM disabled.
>=20
> Bugger. I had tested this on qemuarm64 and genericarm64 on an x86_64
> build host with Ubuntu 22.04. Is this an arm64 build host with Ubuntu
> 20.04?
>=20
> I will remove the tests as it is clearly too hard to get these
> running.
>=20
> It is a bit hard to figure out in which environments selftests are
> running.

Please don't remove them. The automated tests are the main reason the
project actually continues to function in any sane way.

For that reason I really do appreciate having them and would like to
see more of them.

Unfortunately I don't know enough about the subject area to help on
this. I have at least tried to improve the failure messages and run out
the one area I knew was potentially an issue (KVM on arm).

Cheers,

Richard

