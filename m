Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF14CA1009
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 19:58:35 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.32253.1693943906616110664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 12:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HopTN+JV;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-501bd7711e8so2040289e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 12:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693943905; x=1694548705; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uk8O44B9otsazxd/1oS5ntsTzJKnr627Vc68jgMrvC0=;
        b=HopTN+JVJVf0X/g/QuSAWj0D2SdNdH+P1p78v70WyCTeV/bwfcq+wsO+c5YbyaI3Wk
         rKKoka0Utp0zsF+nzvwy5VIxPcCH018QvDcKk/U/NASkw+dR/Re3iC/qFazL6/b/X8ma
         ximnH/gi24HDRvqw7LElw+PyQqdoLIOC5kXQQpEjyNQP6uT1ATbOmiPBta/JN6gZi3SQ
         TvhvmSDhFJcoBj6IlhIHmcgIZvQdo2sjPjWBncILwz5TPPwd0e5kz36nKr3b1LG5IllE
         YuU7c66O4daANOcQ+ssa6Q5+TnNmB9T19qAWzZTPH6DQk7o0T3dgj5HKJhLKs1mORESC
         Xfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693943905; x=1694548705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uk8O44B9otsazxd/1oS5ntsTzJKnr627Vc68jgMrvC0=;
        b=MKT7EYO5mMD2ZNW9oh1WrLr3AvRtFrrwr4rO1DIVnWWmUlHg2PvUSx0uR4+8NRoQGf
         T828slax7i1PFPm8Tbw64V2YXIeAZhuPUYqwdk0JnXc3jZkkIFyHEPPGGiXA15i3vuiu
         drbVMzDgFO3cBtOP4pvZwAyqYuBOl5THP6GD3IyMZkeI2zoaIKqw1lI7EuxWFMBcqTUN
         PspAH1+yQ4GxiFiR5Il7EBi2srkvHEA5LnCCtFb2Mn45DPAA4UHoX+JbZQqcvsC1+zH1
         MkpvrJ/s1utd0s/PnNT96bdtckZ3VC/Z44kDByriW08FnILXFGeVZWSYSM6RomMs2xrx
         PH1Q==
X-Gm-Message-State: AOJu0YxDCjzxCDZqCa14rwEqWgzqyKDFwTKgyiA7lNFl6BSbtNnPFm7o
	+9UzgVH+bcb7NCa2N2L8ANRPMtAjCqd7UySUJH4=
X-Google-Smtp-Source: AGHT+IFCYWDLm7wcT8qBSfFbX2yW0umtg03zxpjN0LNaJECunI05y8Vw3292ilHCDiB4CVINMjKcdXKpEyDqGtdbTAw=
X-Received: by 2002:a05:6512:15a6:b0:500:af82:7dd4 with SMTP id
 bp38-20020a05651215a600b00500af827dd4mr869653lfb.3.1693943904440; Tue, 05 Sep
 2023 12:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <1781038DDC42F2C1.32676@lists.openembedded.org> <b9ac5c81f623c560f74e98294b4855bb8da9b534.camel@linuxfoundation.org>
In-Reply-To: <b9ac5c81f623c560f74e98294b4855bb8da9b534.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Sep 2023 21:58:13 +0200
Message-ID: <CANNYZj9OT2-ewQNGnTkVmtcgYz1FAMat4H_S6zfPHBtDz8u6wg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] Add DOCS-WIP
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 19:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187255

On Tue, 5 Sept 2023 at 21:32, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This has proven contentious. Whilst I think it would help our docs
> maintenance, there are differing views:
>
> * it should be a directory for conflict reasons
> * we don't want a top level directory for this
> * we don't want a directory called "WIP" as it looks bad
> * we shouldn't have "partial" half way staging, either the docs are in
> repo or they're not
>
> I'm weary, I can't reconcile the views being expressed, some people
> haven't clearly haven't read or understood the proposal reasoning and
> its turning into a perfect bike shedding exercise.
>
> Much as I think it would be the right direction, some people won't be
> happy, the complaints are going to annoy me and I'm going to abandon
> the patch.

Ugh, this is *not* the outcome I was expecting. Whoever is bike
shedding: shame on you.

My two eurocents:
1. Top level directory is fine.
2. Top level directory called 'WIP' is fine, if it's not in a release
or a stable branch.
3. I'm regularly adding features or changing behavior that require doc
updates. I'm just as regularly forgetting to document what I'm doing,
and this would've helped. The most notorious example is per image
license checks which went undocumented for several years.

I'm going to resurrect this with the upcoming Y2038 fixes, or
oe-setup-build rewrite that I just did, but holding off due to feature
freeze.

Alex

