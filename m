Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73383C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 12:31:59 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.4834.1646829117854423323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 04:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=v+YHkm0R;
 spf=pass (domain: burtonini.com, ip: 209.85.221.47,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f47.google.com with SMTP id p9so2749307wra.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 04:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6GbYt3JF0hJ7d1Yubwxaxx+jq6wrnnagP8+f7tbzg6E=;
        b=v+YHkm0RtfswCoJzyX3Qc7B8QF0AEMgUW2hJr8JdSfksXFCo5VPW/0CX3QwsNdc2lI
         WCEDUT3qpX3Q+++Wd/OxEMLGRkgqrVQDyWXCVok1jAOcWpOHYArnRtv69SMO9KJ2VPHR
         P/knsIIqAYjmzbzOfCC9UtkIyWKSYhYRg724dzrr3DZ6lWdNtmwu00++Speq9Z2KpJl3
         4WKUVDrSAXykUWXcHYRl3ahoQR8jD1qrd2MA7l5PSmU8thiQEjmjXduRiMTGcvl15t1r
         WtYnFr4WnbnDyU4Tr4/uRWJIlREBIdOFGJJgbLSzncvyAxicZuwb2QtLbDQmlXeuh0vX
         G88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6GbYt3JF0hJ7d1Yubwxaxx+jq6wrnnagP8+f7tbzg6E=;
        b=2tRCo20gVm3dE7x/O0AVOCpQyBXqEQrUdcgvJfxuOsc1j2II6cB8SeSncwPwMX2uoH
         vXEt4ca8c4fchojZ+N/v6xj5DGjVcJLMvEdbXtA3CJ3hkNS41bxu+gKIqvomX+fYtIKb
         weVaVV613jmoKxq3U3v24DpHSJRIHZDtrX2aCGKD2LvGuvmsMxJepaaHFPXbX+Pp2zFO
         6nq7LUm4NC1Gq09JBpxAcaFVuKE3mikJA0VAGHVShrbTI0GfhiG+kBH+Azpmiv2tqDFf
         HmbnPR3eRAnWr46U4dCIDwU5ZfPDuJ/1PokzrF0W+ft77OnpS5pYAu62MXyE+DolB7Q1
         ulow==
X-Gm-Message-State: AOAM531ctnUdSu8ovWMzfu3/HfvA/jxqflrNHeCS8fzca6aoEAusWnZY
	2SAg8wrzxQ7YntdwRhru4OIGyPPdl3fj9AB/YDyh0g==
X-Google-Smtp-Source: 
 ABdhPJzRf/uenr0Io7bTqejJ4LxEG2RHb1RmOqi1P9du6lETmBC6UwkOzpSEAhn310GPTcV7GUFz1ojFRzvct1YbYms=
X-Received: by 2002:adf:e74a:0:b0:1f0:25cb:3ad5 with SMTP id
 c10-20020adfe74a000000b001f025cb3ad5mr15256124wrn.231.1646829116020; Wed, 09
 Mar 2022 04:31:56 -0800 (PST)
MIME-Version: 1.0
References: <20220308155252.2454464-1-raj.khem@gmail.com>
 <20220308155252.2454464-2-raj.khem@gmail.com>
In-Reply-To: <20220308155252.2454464-2-raj.khem@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 9 Mar 2022 12:31:45 +0000
Message-ID: 
 <CAAnfSTtuxTW5R9Vpuf7N1htF72m_X-KabOE3gV-5p9cmBHHj3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/5] libsdl2: Depend on virtual/egl
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 12:31:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162961

On Tue, 8 Mar 2022 at 15:52, Khem Raj <raj.khem@gmail.com> wrote:
> -PACKAGECONFIG[opengl]     = "-DSDL_OPENGL=ON,-DSDL_OPENGL=OFF,virtual/libgl"
> +PACKAGECONFIG[opengl]     = "-DSDL_OPENGL=ON,-DSDL_OPENGL=OFF,virtual/egl"

What does libSDL2 look for, then? Is it EGL explicitly? Or GLX? Or
something else.

I agree that the virtual/libgl thing is a mess, but if we're clearing
it up we need to clear about what is changing.

Ross

