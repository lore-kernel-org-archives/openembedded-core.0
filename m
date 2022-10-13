Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E71FC43219
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 09:59:32 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web12.5673.1665655167000240453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 02:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XKBkYYoF;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id f37so1666047lfv.8
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 02:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HfLSYWlhsY+eNZB7B2hqZL9l6OTWNYJkPPEC6Ol0qAQ=;
        b=XKBkYYoF9C52WwK2KLGPW/5Sg+qc6Z+TrR4dExe7jGMWVXJ5aneF8MmRTxSP2dAHcL
         5Phgz7B0zueqRAlAWkv4AJp56SUPYQZ1rwpUIWw0mqcyB3OJrkNu3nfkxaQbefeMLNaY
         5nRvjbG/L6treK3ZdZbdZSH5oK3SSVjRslk7rstfnqAweE8klJaZhPxRYjeCG753YZZu
         VL6FAczPwqF5Nvy7Rde5lKCwbrce5hDjVeIdY4r+fPqyb0BbDe7OPa1ODxDA6hECiiDL
         JK65fGavmR2Ild7PWjzk0k+tHmxX1+TUjqym08la6OIgkmf3P25pPoaORdnqrwD1AHwv
         K2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfLSYWlhsY+eNZB7B2hqZL9l6OTWNYJkPPEC6Ol0qAQ=;
        b=Q1bWYhKGLRQZfNwEX4xkgPlfCUsyunMXeBZuVr6BFW1rGYe90sfog/0Yzbo/0Ghvxq
         rsoYvLbcc58BKjWJOIDrlZM22FaR9a6PmErFpXBnVhNvzXynf/35fwuUCAn4Tci4jkrS
         RVY+26JBT3BOY9LOCVNYvtbOE+WPno6gjHkbU2mJjr370aOkW1E8T5LZDp/oQ2bQWoy3
         Z5xvMcPXCWzkAaJtbLy4H4VjGfBAv0jS9VzM/nYBsi31Ct5WpsZfFdSWCx//6IeT9Pp6
         4mVLDni1g/dvSFceSfjwAIVddMG+jJAeW9UaRBo46vwH6imxMcw4uaSEXXWBz1UQm4PU
         TOjA==
X-Gm-Message-State: ACrzQf397hrUV07jSM9QQLUHhI37W4CaVDTujyYazRP8B7ND0ExNsZcH
	IAzNb/Gju0QEGEHEd/N/ulfaJxi/rcqgny15gZA=
X-Google-Smtp-Source: AMsMyM4zxcHXRSqUCn0+K/dWpLQbxtjRce0Y/OIDHl9xfq8FbeRbowd0GkH2eUgZ/49wQCAgqJSpF/wblrG/FzWclCE=
X-Received: by 2002:ac2:429a:0:b0:49f:9c71:50b6 with SMTP id
 m26-20020ac2429a000000b0049f9c7150b6mr11509883lfh.349.1665655164999; Thu, 13
 Oct 2022 02:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=TmNEnu+KQTz9iJ72LaduRoHQh_YwevzJgpROj5C8qJew@mail.gmail.com>
 <Y0fFumcfL7RGRxvL@mail.local> <CAApg2=S0J4iqqPNVuYd6Dw8D6x5wM_0e6f6iq2bCeL0x+fH=7A@mail.gmail.com>
 <CANNYZj8nm3BGTUXN+j8gWGGhvWTKscVM_1Q+tBvdJyqFQVne2g@mail.gmail.com>
In-Reply-To: <CANNYZj8nm3BGTUXN+j8gWGGhvWTKscVM_1Q+tBvdJyqFQVne2g@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 13 Oct 2022 11:59:12 +0200
Message-ID: <CAApg2=SaWifk0RtRmAEKj-e=WHLbvq3bdXFG6=oLfXw_SCnRAA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] core-image-weston doesn't build
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 09:59:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171696

$ bitbake weston
Loading cache: 100%
|###################################################################################################################################|
Time: 0:00:00
Loaded 1640 entries from dependency cache.
ERROR: Nothing PROVIDES 'weston'
weston was skipped: missing required distro features 'wayland opengl'
(not in DISTRO_FEATURES)

Summary: There was 1 ERROR message, returning a non-zero exit code.

I can add distro-features et al, just wondering if this image is
expected to build by default with oe-core?

Regards,
Marta

On Thu, Oct 13, 2022 at 10:15 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> What happens when you run 'bitbake weston'?
>
> Alex
>
> On Thu, 13 Oct 2022 at 10:10, Marta Rybczynska <rybczynska@gmail.com> wrote:
> >
> >
> >
> > On Thu, 13 Oct 2022, 17:00 Alexandre Belloni, <alexandre.belloni@bootlin.com> wrote:
> >>
> >> On 13/10/2022 09:52:44+0200, Marta Rybczynska wrote:
> >> > Hello all,
> >> > I'm trying to build the core-image-weston in kirkstone to look into
> >> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14926
> >> >
> >> > It turns out that the image does not build (oe-core
> >> > e728d0965d6fda8ac54e065ca7bf7eb9da9a8170 with bitbake
> >> > 6603c3e39f1cf746669ec6c9f0be8c6e6ece426e). I'm getting:
> >> >
> >> > $ bitbake core-image-weston
> >> > Loading cache: 100%
> >> > |###################################################################################################################################|
> >> > Time: 0:00:00
> >> > Loaded 1640 entries from dependency cache.
> >> > NOTE: Resolving any missing task queue dependencies
> >> > ERROR: Nothing RPROVIDES 'weston-xwayland' (but
> >> > /oe-standalone/oe-core/meta/recipes-graphics/images/core-image-weston.bb
> >> > RDEPENDS on
> >> > or otherwise requires it)
> >> > NOTE: Runtime target 'weston-xwayland' is unbuildable, removing...
> >> > Missing or unbuildable dependency chain was: ['weston-xwayland']
> >> > ERROR: Required build target 'core-image-weston' has no buildable providers.
> >> > Missing or unbuildable dependency chain was: ['core-image-weston',
> >> > 'weston-xwayland']
> >> >
> >> > Summary: There were 2 ERROR messages, returning a non-zero exit code.
> >> >
> >> > I can't find this one in bugzilla. Is it a known issue?
> >> >
> >>
> >> Did you remove x11 from your DISTRO_FEATURES?
> >
> >
> > No. This is a fresh clone. The only changes I have are in local.conf: DL_DIR and parallel build options. That's why I'm surprised.
> >
> > Regards
> > Marta
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#171687): https://lists.openembedded.org/g/openembedded-core/message/171687
> > Mute This Topic: https://lists.openembedded.org/mt/94299411/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

