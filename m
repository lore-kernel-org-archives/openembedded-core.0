Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28E0C433F5
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 21:18:55 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.82734.1638307134070633946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 13:18:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=5ugK+0/C;
 spf=pass (domain: burtonini.com, ip: 209.85.221.51,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f51.google.com with SMTP id q3so24511716wru.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 13:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2tJhSuoWhK5TNDic6QIHyP+fh2IOuza16Qk8hnQCbjU=;
        b=5ugK+0/CXvd+CuK/EAcn4/XQesgpjZywLmh0d8EAVq/Pi86WVBPH3/McC/ImJMiBwf
         kFOqTvxHQ+MUvxTs0PrwK/SfhFxt7yxKuSh4ZbeicusPF0GMBWCUnCdRzfVZCbNi24lv
         t9Yo/4XuT3DWRbPUElzfElfFl6X+U+VayDlw+Nl36xOJD+fK8Mxl0MywBZ0Wv9QtNh4b
         GYxGwslHjrc7nnbDn+T08ZAMbLb64VWrdBDK/OCfryn/KLEunDW5N3HaJPMehOw8vQzY
         Qnn67ss110Ch2d8lkYtTMUU/lE4gBxZcuf/0C/wvwMuWxyqgoYBec9MfjfQIT5SN6RGD
         e8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2tJhSuoWhK5TNDic6QIHyP+fh2IOuza16Qk8hnQCbjU=;
        b=urGs/nvnyeQ8bTrSOJIGc1REN6M3cXe29p5Nh6ORULvMldXzvRh4evlkOF6cz7O4Z1
         m77NxYIlAr3LOfrBUyj609CV/jRVvXvYcaU0hm8jQjiU0iYP7OCR3boGfUqFcNhkSG+O
         81YROVfvvMBZOmed+R2ndoYW4qi9aJpLwxbWtxsfZO7LoZvHHlR3/uM3yBW86W3K8m4H
         GOMyGVssHGw8KaDFo5BuauFAnMWhHrfvpTw+ypTrAQAp3prLLjQxfZN92ticJpMSKyqX
         f1NkbOR9lMNsF712H8bIKKDG/Xn4F6LHjihbQJCdbeSquGV31FkPSCGIKdT2a8p0DUjn
         aTtg==
X-Gm-Message-State: AOAM530YLcgf1QlNKYt622O+s+dy+LP92PF9oCSsHT3o/Y81YqRV7fzk
	FN6OAKqE8+eV3QBc/owKKSZkCGbC6WKKg+8+ZX0IBA==
X-Google-Smtp-Source: 
 ABdhPJyLQ4s1kSA0dABbh0X1mUMc+8j3JR7ZXYtGjZCPBaLFrlsK3ZffBRSBfzzhkD52mCWKywUV06LfMR4bvCL8ymY=
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr1702174wri.376.1638307132250;
 Tue, 30 Nov 2021 13:18:52 -0800 (PST)
MIME-Version: 1.0
References: 
 <CABKMkPJoE74O2OnAe7WsLSu56Ww4ZfPfxksZ43-Np43otAhRWA@mail.gmail.com>
In-Reply-To: 
 <CABKMkPJoE74O2OnAe7WsLSu56Ww4ZfPfxksZ43-Np43otAhRWA@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 30 Nov 2021 21:18:41 +0000
Message-ID: 
 <CAAnfSTvyfXctcWpbHBb90_UhoDrue6JrY73ax_bVJ+xr_HEdFQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC] meson needs a pkg-config wrapper script
To: Joel Winarske <joel.winarske@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 21:18:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158995

On Tue, 30 Nov 2021 at 17:20, Joel Winarske <joel.winarske@gmail.com> wrote=
:
> PKG_CONFIG_SYSROOT_DIR behaves like a simple string prepend to all packag=
e config variable queries.  So if you want to determine the absolute path o=
f a variable in .pc you set PKG_CONFIG_SYSROOT_DIR and make your query.  Cu=
rrently this is not possible with Yocto+Meson.

I should just point out that this is barely possible in a portable
manner: pkgconfig and pkgconf have differing behaviour here, and they
both consider their behaviour correct.

So, good luck with getting absolute paths of variables when sysroots
are involved.

Ross

