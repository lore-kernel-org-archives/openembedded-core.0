Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3941BC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 17:04:33 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web12.7935.1647018272366011772
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:04:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fbcHp5lQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id j9so5002549vkj.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JPmC8zfa8dN6cQsYBmDE/ABh2ilBzFSwF2AEmCDJoZk=;
        b=fbcHp5lQYnM01fjoNTOpd+eLg+fPCmKPhPgYx1XcIkc20ePfYMfzC4uu9zMjDlaGqv
         59rkY/4ITUSskADa14W48q159swe/vZnr0aTLgyrgjyqTUDkV2SgJtNCHQ/M+5EDKLWj
         HlTriXNoGps5z5F3tHV4S3qNyifHAgoQF7/4qiiySktPNwIjbtSsngS94PQmy8nMkXwv
         ReX3/E6QdNqBk9jJPsQpuWB8ltm00cjEmhoNrKWFw6Ojlm9rKeSB3Mezf2Ne6xJxsh1K
         vqjG9UjL69Uw/l1pQVoXRs7IQa87ImcVTWQY+Ovf0Zpk/BVZiONZZeO3b620jYLfZLFF
         X/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JPmC8zfa8dN6cQsYBmDE/ABh2ilBzFSwF2AEmCDJoZk=;
        b=ekyB6peaBBJNfXeLFgyXMwB4KhQg2TZjJucenpJ37c1/kYkVHkZmYnpkJc9sm5CxLH
         UhXqFSxaYklybyKZt0SwF2SU4vracHDtbN3HA+Mxp3UQcgfjvHnoiCiCjujLooAahVQa
         MrZga3K+ircqqYU7KCI+Cz32FYnor0PKEWsnSaqx+RvvgLGyoOCRwxaPs1TZ4uhSZOyk
         ZPJH1ZTi/TfBvEcf75EyTUcuQreefXVO8YzKtjitdYyCLFZUQ4v/QfJs2QLwIIX947Mp
         7SUQ4/4rFBlXZ2pW6IpGYsyCbjfr2bEdAvJRjm5RiWdCrtjleawWB3y62aue9ka41pEr
         SutQ==
X-Gm-Message-State: AOAM530hAmu0OdNzvQLU3ntfx233ryp361O6T/WeH3QJNXH05dhAkiyk
	nwNMAbGS9MGgz8Gua7GyVzGsRslF7Fb97ybCLzA=
X-Google-Smtp-Source: 
 ABdhPJywChIXjuuw7bbR+xAS11BE8FHIRcpZUBKiaeSJEHiaf2N2A630xlmKcS3BevuBWFllOQR8FoxC654a1nJVvWw=
X-Received: by 2002:a1f:50c4:0:b0:336:e84d:2873 with SMTP id
 e187-20020a1f50c4000000b00336e84d2873mr5547699vkb.30.1647018271439; Fri, 11
 Mar 2022 09:04:31 -0800 (PST)
MIME-Version: 1.0
References: <20220311151836.1541579-1-f_l_k@t-online.de>
 <b3e2f344391a1d4d409d903dc3b8793d0a30b728.camel@linuxfoundation.org>
 <a15e9ff3-75c7-9038-e9b8-5b28c4802aca@t-online.de>
In-Reply-To: <a15e9ff3-75c7-9038-e9b8-5b28c4802aca@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Mar 2022 18:04:20 +0100
Message-ID: 
 <CANNYZj-Vhtje6ciT2AiNonQ+fXLN=Kb348r-f+pRTJ4qoTvVvw@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] mesa: update to 22.0.0
To: Markus Volk <f_l_k@t-online.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 17:04:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163066

You need to resubmit the patch with this explanation included in the
commit message.

Typically it looks like:

License-Update: removed references to deleted code.

Alex

On Fri, 11 Mar 2022 at 18:01, Markus Volk <f_l_k@t-online.de> wrote:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/d16263cdee95ec48864ad7a0f90275e8a4fd374b
>
> As far as I can see , this was the only change.
>
> Am 11.03.22 um 17:54 schrieb Richard Purdie:
> > On Fri, 2022-03-11 at 16:18 +0100, Markus Volk wrote:
> >> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> >> index 2f79e8b34d..c9dab15f4f 100644
> >> --- a/meta/recipes-graphics/mesa/mesa.inc
> >> +++ b/meta/recipes-graphics/mesa/mesa.inc
> >> @@ -10,7 +10,7 @@ HOMEPAGE = "http://mesa3d.org"
> >>   BUGTRACKER = "https://bugs.freedesktop.org"
> >>   SECTION = "x11"
> >>   LICENSE = "MIT"
> >> -LIC_FILES_CHKSUM = "file://docs/license.rst;md5=17a4ea65de7a9ab42437f3131e616a7f"
> >> +LIC_FILES_CHKSUM = "file://docs/license.rst;md5=9a383ee9f65a4e939d6630e9b067ff58"
> >>
> >>   PE = "2"
> >>
> > Thanks for the patch, what changed in the license?
> >
> > We require license changes to be noted in the commit message just to show that
> > someone checked the license hasn't changed.
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163064): https://lists.openembedded.org/g/openembedded-core/message/163064
> Mute This Topic: https://lists.openembedded.org/mt/89712382/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

