Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C73C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 02:28:00 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.5327.1636597679079864451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 18:27:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vhf/T3Ym;
 spf=pass (domain: gmail.com, ip: 209.85.160.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id a2so4011723qtx.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 18:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZBu3VCxFbSyXUOhyxT9Fc4lK7DOxk6Y9FparcefxDlQ=;
        b=Vhf/T3YmxmCBbuA8wgZ/h/kn/c2XqxPZ23johqxrhKvHXmeQVMi7F/r1SJnDEFt/9t
         TqSjHQcEV6Y3yxKJ727EahPFentNZrMiw7VNEq/Y/xYHk54jxApiVqHYEtqYEGv9Yh8x
         XxCpXG8izBS6U5rno91iILl6hHEecF7G8KWksF1dgPXNgrutEeYYz0WHrvy3kBg3GcP2
         qn7/oxnvoX4eluv12d0vEa2cXZ/b2cVF5pe/KvX0eSopwpP17mDsc2fnrf8pwbV8QqP8
         2ze1b9yj0ZjSdJF7FySd70hfGNQ4tu45elWxhQhXj1jg1gBWip4P+fGqDjBwhzEpPAkB
         PYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZBu3VCxFbSyXUOhyxT9Fc4lK7DOxk6Y9FparcefxDlQ=;
        b=WSl3G0v3vVU2LTovyW3wEg/b0uxmnUIFGdBfRg39k8p+DNkYnfKPL0OTanRJw/iKBu
         q/xn66NgoMc/8W1YPTHfBevBEx16GQI1N02LOtJk6J6BGqRvgtmC+LpFAU3oAKZ6qB1K
         cv/Cb4IO6/tngBzaA1Qzf3SMzWgC2yO97QsAMfPkFsG/O50Xcl+RivDsMDYdL4kCNB9Z
         cW/SS935M13QbtkV6kJTKjO4l23ucVz38AqWgIocJ2orYWaTgO3wzOVRId8Z9ZLc3YHS
         8YAC6WOppGJNf3chGc5nvlOFreQARYM4A5X2jVfDUcsBWVF3ONqZFLWsKXsukiUejp52
         LohQ==
X-Gm-Message-State: AOAM530dG+NH8iv+susSJE+iUBbD0vb6hDySw4MfSBmOTT72oti/I6TU
	g+ghoQjtV00jhZPQEV18YSss2Vb+PJDgzK/4jUA=
X-Google-Smtp-Source: 
 ABdhPJxHJ+cAC+vdSQCedlxMpxFLIX6Li5FbJQeK5PObe+natpMWahbdVAAYoJyzlkyI8xYmpjJf6lgq24DfDso8Nbo=
X-Received: by 2002:ac8:5d8e:: with SMTP id d14mr4079490qtx.227.1636597678141;
 Wed, 10 Nov 2021 18:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20211110231856.5799-1-pkj@axis.com>
 <20211110231856.5799-3-pkj@axis.com>
 <CAJ86T=Vn=2gi=8m2hskxWsStR91GJ_B3DNzMGnhfQnoS1bc9Ow@mail.gmail.com>
In-Reply-To: 
 <CAJ86T=Vn=2gi=8m2hskxWsStR91GJ_B3DNzMGnhfQnoS1bc9Ow@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Nov 2021 18:27:31 -0800
Message-ID: 
 <CAMKF1sphWi-Ei+Xd6U5AtencNkAyWV36dboprLjcCvaTQbJWXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/5] gcc-common.inc: Clean up the additions to
 MIRRORS
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 02:28:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158130

On Wed, Nov 10, 2021 at 6:18 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Wed, Nov 10, 2021 at 3:19 PM Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> >
> > Since commit 044fb04d in bitbake (fetch2: Allow whitespace only mirror
> > entries) there is no need to separate the entries in MIRRORS with "\n".
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc-common.inc | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
> > index 74190644e6..0d950e780d 100644
> > --- a/meta/recipes-devtools/gcc/gcc-common.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> > @@ -86,11 +86,11 @@ get_tune_parameters[vardepsexclude] = "AVAILTUNES TUNE_CCARGS OVERRIDES TUNE_FEA
> >  DEBIANNAME:${MLPREFIX}libgcc = "libgcc1"
> >
> >  MIRRORS =+ "\
> > -${GNU_MIRROR}/gcc    ftp://gcc.gnu.org/pub/gcc/releases/ \n \
> > -${GNU_MIRROR}/gcc      ftp://gd.tuwien.ac.at/gnu/gcc/ \n \
> > -${GNU_MIRROR}/gcc      http://mirrors.rcn.net/pub/sourceware/gcc/releases/ \n \
> > -${GNU_MIRROR}/gcc   http://gcc.get-software.com/releases/ \n \
> > -${GNU_MIRROR}/gcc      http://gcc.get-software.com/releases/ \n \
> > +    ${GNU_MIRROR}/gcc ftp://gcc.gnu.org/pub/gcc/releases/ \
> > +    ${GNU_MIRROR}/gcc ftp://gd.tuwien.ac.at/gnu/gcc/ \
> > +    ${GNU_MIRROR}/gcc http://mirrors.rcn.net/pub/sourceware/gcc/releases/ \
> > +    ${GNU_MIRROR}/gcc http://gcc.get-software.com/releases/ \
> > +    ${GNU_MIRROR}/gcc http://gcc.get-software.com/releases/ \
>
> Last two lines are duplicates. ftp mirrors should probably be replaced
> with https.

agreed

>
> Are these even useful at all? They were added in 2012...
>

yeah I tried to access http://gcc.get-software.com/releases and it
says domain is available to buy :)
and http://mirrors.rcn.net/ is also not accessible. So perhaps just
have https://gcc.gnu.org/pub/gcc/releases/
and if needed use some of mirrors as mentioned here
https://gcc.gnu.org/mirrors.html instead


> >  "
> >  #
> >  # Set some default values
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158127): https://lists.openembedded.org/g/openembedded-core/message/158127
> Mute This Topic: https://lists.openembedded.org/mt/86970465/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

