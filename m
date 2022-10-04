Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF81C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:52:08 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.12246.1664898722853137382
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a36+TBji;
 spf=pass (domain: gmail.com, ip: 209.85.161.41,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id
 r136-20020a4a378e000000b004755953bc6cso9053609oor.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=AJPpJN2pPcCMQoQrgvJZoW3zQf6O0L7CFCO2xe1dcWo=;
        b=a36+TBjidRv/GGYsmpevSdB0jCHnO+e8GTVu+KUrF5imIMysTbJmLHeFQgYVnCuzoE
         DhGJXwmMa3o0gRTV7lEEa+SPtfs4xAaLgxC1QBTbJtnTYD3vdozalOGmeXD4Q5r3Tln1
         lpvVGwCzYEpzD5cYf6BXBi8jQ613KR+xrbwiTByHkufhEpGGeblUQ3OYeJaHoCvFIHzm
         PyXjPQ7iKRUK0sNTo15U3VkronBEYllZSB9kUc32SiZBUsGDz4CPlIWViDtN40mk/aHD
         4tU+93gTeSyeJf/0iyapO2pO85FWtbSLo7Au+RS7LTsRBHb+6WGfbqCqzByYoM0jKYTe
         uLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=AJPpJN2pPcCMQoQrgvJZoW3zQf6O0L7CFCO2xe1dcWo=;
        b=nMyhhD70+vKAfPYIT/EPpIfuKcpXDn0upQpykiA7r1bDp196mSjy8a18LAQJCiuqLk
         E2kEL4VZGgT67kKSW3v7BFPlRPvVUeloN3UcKxsylYIHpi2rZBME9IKTSZ606XXFB+tE
         P2XAfcV8ePWA7KuIh/egUbaUJ/Gq2t0OlhdThG8H67AHSpb5gfUzDUtvBpUEvAEu1xVB
         SfgeejIHuKJvvkhywGFLUY9/Qpc0pu+iSBjFaR3CdrldHQ8m0fiBkPL3b2ATBSRsbmSI
         H+diLEFMdkvJ2GjZFsdP6V6GGtwCtocsIrqguGLT99eCTsVpedrZWpbG93cKuahxkKjw
         9OMQ==
X-Gm-Message-State: ACrzQf2Fkn8++F/g3W6Y0xt+BvUYB+C4Xc1DyO4JcurgZwirroJ98CJv
	YTxD3bjvrOJ9kVEskCAIBm1P4WcuqwGZQ7O7c9o=
X-Google-Smtp-Source: 
 AMsMyM48o1DuSbhOj/65rfL3muNCqymhpXooj1AeEOMP6lZNOEw70fy4iNdsdLcmtO3ECTZkW05MOQqgFLoKayv/Bho=
X-Received: by 2002:a05:6830:3985:b0:65c:34f7:6bb8 with SMTP id
 bs5-20020a056830398500b0065c34f76bb8mr10172721otb.122.1664898722071; Tue, 04
 Oct 2022 08:52:02 -0700 (PDT)
MIME-Version: 1.0
References: 
 <010101839477e3ea-4f401efc-cd15-4603-bc16-da2ba590225e-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <010101839477e3ea-4f401efc-cd15-4603-bc16-da2ba590225e-000000@us-west-2.amazonses.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 4 Oct 2022 11:52:23 -0400
Message-ID: 
 <CADkTA4PtfABt2F4mGFdLpiGrUb3BW8ey+6kn6OYA87f1yvUcqQ@mail.gmail.com>
Subject: Re: [OE-core] [AUH] lttng-modules: upgrading to 2.13.7 FAILED
To: Auto Upgrade Helper <auh@yoctoproject.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 15:52:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171426

FYI,

I'm fixing this, as we need it for 6.x

I'll submit the uprev as part of a linux-yocto-dev -> 6.0 series later today.

Bruce

On Sat, Oct 1, 2022 at 12:55 PM Auto Upgrade Helper
<auh@yoctoproject.org> wrote:
>
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *lttng-modules* to *2.13.7* has Failed(do_compile).
>
> Detailed error information:
>
> do_compile failed
>
>
>
> Next steps:
>     - apply the patch: git am 0001-lttng-modules-upgrade-2.13.4-2.13.7.patch
>     - check the changes to upstream patches and summarize them in the commit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --amend
>     - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this time,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/update failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171329): https://lists.openembedded.org/g/openembedded-core/message/171329
> Mute This Topic: https://lists.openembedded.org/mt/94055771/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

