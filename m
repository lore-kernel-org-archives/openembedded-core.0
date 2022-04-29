Return-Path: <stephensportia@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D8AEC433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 22:17:42 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.16350.1651270649849571082
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 15:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XGFPq2Bx;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: stephensportia@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id e23so10520483eda.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 15:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6PCG+In4Y8gBRg2JOpL66ub2qc3EBC03/DAkTIMXEgo=;
        b=XGFPq2BxcSv+QVOe4nsuEEaqwGQ7Wci18avAST8p57CvtL4Sou+OD1tCfUT5uoY9YA
         jOfa4oS96kDLNCBgSVB9nlOh57ECnN+j41KSmGlx3qtvy7vdu1OtYPgD2sxCDKWwm/9g
         b8BkZI58favmv7LIEadPEoWR+K5I/NH0A/QXKx0Zz2zPRsC7E3QxdtldwQ68EugqJpmm
         BV/sOxdXBrdbCUZo6puVG8yRapP4nsyrYpolSLiw0so8CbkunmJ2f+fuRK/XbXa5FIwq
         yw4NzkWtDAnoTUWIz1F3G3N7D5+x4Jrv2WLQ9eqD7BS3Qxjx+3I57MOqJJx+BXKgszEN
         CX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6PCG+In4Y8gBRg2JOpL66ub2qc3EBC03/DAkTIMXEgo=;
        b=AVheFGW65wfkib7rl64ubDWoCh1ztUlG0FOjVAwk4/vTL9K8VTJjXA/MGws5RZyPFZ
         geM/BOwW6rXS5qTBXzKLa/7QXKV53L8BXjzkb/l7xnq0cdlCuM9awRJq2Q80NAcUWp8o
         AtZHJSfrT49RVRUgcVTp9YBDiywchoCCjXDK8W/pR/+zSllpCJpPFdC3iRq5bszkrqyd
         0uUwVSGTUTCMnlb4qflh5se+XMYEHs6ZbHYIC5IJdrcE9Yg2gPkIL7zaCts2iYtLs5Ix
         HeoGfDPRLfbnK0/hENZL3kXxbk47YLSMY/m0ST1FuyIny8+aOi3YitNlx/dQ6Qu7n6cC
         H+Yg==
X-Gm-Message-State: AOAM533/7QHG2JCjO2cqL6dk4qG9inzQ1EWK148MwRzMQ1Wml35zYPs1
	aPZq4IuqEJYRpXQCBvMq15+I3zJS1W7pd8j9qCo=
X-Google-Smtp-Source: 
 ABdhPJxPXMrRjkDOjY58spNThYKqFgV7SoB9BF+RJNDYFuO0gxZK760kmA+mw3sU9qNN539KF9sG6fMV8boYciM4KE0=
X-Received: by 2002:a50:c2d2:0:b0:425:e48c:5db1 with SMTP id
 u18-20020a50c2d2000000b00425e48c5db1mr1488888edf.378.1651270648117; Fri, 29
 Apr 2022 15:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220429073440.136829-1-stephensportia@gmail.com>
 <20220429073440.136829-2-stephensportia@gmail.com>
 <285f86a8-64f3-516c-32f1-6dcf497c6289@gmail.com>
In-Reply-To: <285f86a8-64f3-516c-32f1-6dcf497c6289@gmail.com>
From: Portia Stephens <stephensportia@gmail.com>
Date: Sat, 30 Apr 2022 08:17:16 +1000
Message-ID: 
 <CACYNXwJcHGPUDnHGA6=Ei8sbvwZKxc8SO_oCh3o9Mz03WC4tUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] volatile-binds: Remove TimeoutSec and allow
 DefaultTimeoutSec to be used
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 22:17:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165059

On Sat, Apr 30, 2022 at 1:39 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 4/29/22 12:34 AM, Portia wrote:
> > Remove setting TimeoutSec and allow the DefaultTimeSec to be set for the
> > volatile-binds services.
> >
>
> Whats the default value? I hope it does not go into infinite loop in
> case the service gets stuck
>

Timeout=0 sets the Timeout to infinity, so the current behavior is
that if the service gets stuck
it never gets killed. DefaultTimeout will depend on what is set in the
/etc/systemd/system.conf.

> > Signed-off-by: Portia Stephens <stephensportia@gmail.com>
> > ---
> >   meta/recipes-core/volatile-binds/files/volatile-binds.service.in | 1 -
> >   1 file changed, 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
> > index 8fe7d8d4f9..52384c8264 100644
> > --- a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
> > +++ b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
> > @@ -10,7 +10,6 @@ ConditionPathIsReadWrite=!@where@
> >   [Service]
> >   Type=oneshot
> >   RemainAfterExit=Yes
> > -TimeoutSec=0
> >   Environment=MOUNT_COPYBIND_AVOID_OVERLAYFS=@avoid_overlayfs@
> >   ExecStart=/sbin/mount-copybind @what@ @where@
> >   ExecStop=/bin/umount @where@
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#164998): https://lists.openembedded.org/g/openembedded-core/message/164998
> > Mute This Topic: https://lists.openembedded.org/mt/90771601/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

