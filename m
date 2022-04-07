Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C1AC4708E
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:09 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.3404.1649361571270991413
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 12:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=myA/TlPv;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id s4so3123136qkh.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 12:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HvzcbHZmAR8RPpi0/QdYA7PDGX/f1aLmE1N15G5PvHY=;
        b=myA/TlPv/ok+xPEXU4hMmTmkHO1Peq8AnBrc8856iNfyDrm37a2n6KQjacrpj8JMuc
         GWuloC2vFgbQFLKd0Y0IJi0M5ggPYxYfEJl85gl22EdB00pvitsqBBX22pAjWciO5lJy
         erYOCga8wED7WXtVNxcb3YsWkgbzsJRqBB9jhNmEZgmH9GPYQIOouuqGZWCTL0+DiBG7
         zaiWgkSt1x7hD8FHKs+B9S28pGfobqirwcUKdshLZV/6oWJ7AYNgpsPQCy4sKs5A/dBf
         5GRHUZox9nWkqtDS9auL/LVmVnJUIUTax+1Ear6H/oXLwQRZs0IX9O/T4/AvrnEfum6F
         VN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HvzcbHZmAR8RPpi0/QdYA7PDGX/f1aLmE1N15G5PvHY=;
        b=s7RndI8/GDOzjLDLLwQVsnc4HGqpFR5qf26h3hZAN6tS3TxG7E9aBxIcm3bX1KotPU
         lpSwzg8A0FaWlIDLGU0kvdy3G3+2RP2SoQKTG3mfXFQGRezVA6jo3Ql+EvYzUJlaY4uh
         a2naN+hGX7J1dcCt3+buprIVnicbgOzBMriVTEXEm+/x/NwtXd7c6LaT8QfnNf4TKhWm
         pqpWy9F1rMv/XCQ3pYdfSKt07ttcWEbf2ouBGEnXuqBbihG/lEh+CIIBLQD8dcoQ3EDO
         6wupLy2hQUzEGchoa9WfaDKC7Faj9M444/VlhO1f7QaURQtmDSlqjW9aLVM4YVEmBVnF
         y0yA==
X-Gm-Message-State: AOAM532tovKQVCE+ES1Bp+C4fQF9p5QmwR/F8LToVxL21e2Z9GfYuSo/
	l53RBUy2nYzEpMyIZXhsPr3vAH4jf+x3irvX/AI=
X-Google-Smtp-Source: 
 ABdhPJwwiQ35N8g8uNxjAsSmCmT5Cm1YtOacIcUWXyBzoBiR9qSVhkULqWKdGyNPMMZ9vZP1SWeh/FczGuJBPsP9xgQ=
X-Received: by 2002:a05:620a:2993:b0:67d:7116:a642 with SMTP id
 r19-20020a05620a299300b0067d7116a642mr10626233qkp.180.1649361570384; Thu, 07
 Apr 2022 12:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220407170029.3500874-1-alex@linutronix.de>
 <20220407170029.3500874-17-alex@linutronix.de>
 <CAMKF1sqJLvgJh__jq2biOrkm_M6zw4ibkxP7u1s1rZPEbyLa3Q@mail.gmail.com>
 <CANNYZj_eX18s-D9=_ZhOtdhOJg4PhJHgzd9Pa6Y9MscHEn5X5g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_eX18s-D9=_ZhOtdhOJg4PhJHgzd9Pa6Y9MscHEn5X5g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Apr 2022 15:59:04 -0400
Message-ID: 
 <CAMKF1soHtQniQ5NwX=K4zbA1xnD5u0yR7QTa01=g5625cx+8JA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 17/17] python3-typing-extensions: upgrade
 3.10.0.0 -> 4.1.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164140

On Thu, Apr 7, 2022 at 3:45 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Thu, 7 Apr 2022 at 21:43, Khem Raj <raj.khem@gmail.com> wrote:
> > > -inherit pypi setuptools3
> > > +inherit pypi python_flit_core
> >
> > has this module made a move to use flit instead of setuptools ? if so,
> > perhaps adding that info in commit might be good.
>
> It has, yes. I thought such a change is self-documenting.
>

OK. sometimes there are two build systems in place for some transition time etc.
its good to mention these details for context.

> Alex

