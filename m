Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620C2C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 15:30:16 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.11756.1647531000321746043
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 08:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gyQltfHl;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id b67so4606931qkc.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 08:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0jwaVkS58VJLc7HrRjlNP9gw8DLWIGCtQpweJGAmur0=;
        b=gyQltfHlCxPauEPapLa6WoAPdtmNoDZrDOI2pdZylreh0quCK06G4n06h5DljvODck
         cz41ICVsAwiQb3zxYTtOKPes9mEStYv+GdBpIdGsAbCkTUeWgLWZ2xPCVKcrC/u6ITdT
         ASO7FOsVm9ImTTvlHCsn4Z0h3qSC85bKkN5iAQgb+zHdf3ABYNrijzUmfJG5PYAjXhJv
         sIvHUHJkbPjltaiToIVGQQ2oTbL0TL3P4feobcvZkIy7zzPasz7hvDLpAemhnx5oOjwT
         gaq3dtYsZoFH8sTk7A+vFdahcKQLk99wgS0YOBD9KvoZ60lNJUktYehZ3Gn7N+kiBgm+
         ObwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0jwaVkS58VJLc7HrRjlNP9gw8DLWIGCtQpweJGAmur0=;
        b=0MWOkVZgwJvh2ODuAHSrkX5YS0vn60aBMMuOm4Vnp5+zXroU28J2FSlmUuKRAdIxnY
         IusszVy0UD9RyyvGK4cPr4XyXTSiVOaYcV/gK++5kAO6lOlbf/TJSzj5S1POR3yltpcb
         uCWzynomo/v4SPtfUz5L/1tyFD32vDL+JgkUHX78EYptiiaDNEifutnfS0C0qgeEP94h
         Zl5HbdVUS0kquXkJQG4wNwTmA0MJfmE41vZ8UrcxBgqUZjUfn9dvEtsuRylqA+GVTYt4
         bD6BPDUUfyYNFg+xg6BPKzfOIW3VPLcmgB3J0O7ZbtPMfG+vkpNoj3Y/kK1LDGTL0D3P
         86Vw==
X-Gm-Message-State: AOAM530ZFeLvbrpfdEXbTQoMerNWyoJLV4BSwx7STIjDDSwufH4bmcsr
	SZdJFYhIUBrwgeIjz8M/UWvnM4rX4R0N2VAefRs=
X-Google-Smtp-Source: 
 ABdhPJwTPVghHdarz9C0tY9pFXjkOrVbSmk4Z4nlJYOsEt25wQWt2zWVXBWxN91gr47Wk610lqZVFB0YsAjVbRoalkA=
X-Received: by 2002:a05:620a:4103:b0:67b:49f4:3ee4 with SMTP id
 j3-20020a05620a410300b0067b49f43ee4mr3308401qko.72.1647530999317; Thu, 17 Mar
 2022 08:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220308155252.2454464-1-raj.khem@gmail.com>
 <CAAnfSTtiGgXAi675oJ1oxkX+r-f1bwT7+Utc-8ddvPwC_zaTSw@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTtiGgXAi675oJ1oxkX+r-f1bwT7+Utc-8ddvPwC_zaTSw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Mar 2022 08:29:33 -0700
Message-ID: 
 <CAMKF1so19J5LtAcO-kc14nBWUEjqOqTGZhk3A7vhTruMkgNugA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] qemu: Depend on virtual/egl
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 15:30:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163422

On Wed, Mar 9, 2022 at 4:30 AM Ross Burton <ross@burtonini.com> wrote:
>
> On Tue, 8 Mar 2022 at 15:52, Khem Raj <raj.khem@gmail.com> wrote:
> > -PACKAGECONFIG[glx] = "--enable-opengl,--disable-opengl,virtual/libgl"
> > +PACKAGECONFIG[glx] = "--enable-opengl,--disable-opengl,virtual/egl"
>
> Either the packageconfig name is wrong, or this patch is wrong: GLX is
> explicitly big-GL not EGL.

Neither seems to be wrong. see
https://github.com/qemu/qemu/blob/master/configure#L2289-L2313

It's expecting epoxy with egl. So virtual/egl is a better
representation. Maybe we should
add epoxy to depends section of packageconfig separately.

>
> Ross

