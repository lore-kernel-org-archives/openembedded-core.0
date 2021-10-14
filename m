Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC63C433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 12:22:02 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.8390.1634214122202946266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LmN7yNoJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id w19so23743279edd.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mNVcYNjNp1tY4RJJfXJVlILWGmfLitD7x0GLxVmeIPA=;
        b=LmN7yNoJJm8DhB6vF99G4UAZYXVSEYbrc7cWRTL+gFP4/HWcInQ6rRXxhGGfbI44zl
         G/VN/oZh0BCDrsr2CTn9o0ofX/1UkflnDuFLrAmR8kvy82lZO2qc0NXbeELxQBp3RkHi
         +ShHlgnYfCJ3xCBkO1H6mk+POHmGqYDNKAOwh6/O9sVokeURrhdsLBCTN4Gjn+8rPyvb
         Rbweo5JapUrnecTPUV1OSXKKuepZpXTSGt/xcdyuiNLVRy9WsXPMWguoB+87/eHexoKH
         DEzvYBDK4RRj47KmEXozwYRoawxfTRXT7MNg0ZHxewJmq6nOf3PEfo6afk9V5iOKCPyf
         4GXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mNVcYNjNp1tY4RJJfXJVlILWGmfLitD7x0GLxVmeIPA=;
        b=iM66mZi9ijkJTD9OZn7JiB4yCyhzyRhQB6b/F+fJnzsEHBGuOV50XcgDRkhW/9+EjQ
         wrSURmy4kGUsEhMV20H3okC9Isc9AM+XcfgoB9mzXFhr28Y5ezo+CEpTs1QCJT9WyzQZ
         ZZiHNh0Z09g+GFBdPoFEmTircqfkVXCCjn0iSTCvcMyR5XMiXpcfEinHBK45hKLIUvDO
         mOWKUYbONQpm+rujiHLf80gdfqLApvVAnvE06OLvqrrleouIKOuLQbV3xF3vlVILmS8B
         TEGBBtHjY87UznMWGPSsISjXmTZSKlN3dFiH+iiE0nFsHnaws0k5DNoG4UgBsBXC1xqn
         WWrw==
X-Gm-Message-State: AOAM532owOd4SvNJkw0/Lw9Q1DIi0bLhJQ3uxLwlLD98YfbAZ0pXbsnd
	Xtp2+CuBvD2Bf6UFvybXDJr9/FNT3E6FpkTC+Y1+4M3AsSE=
X-Google-Smtp-Source: 
 ABdhPJzQ+9NtT5iRFGT7xtx83UshuFuxNXzI/q5hNHJZxQNovpxrP3OzduFZ8ljcbzIpmLydFHtrobQTw5ALHyh04lo=
X-Received: by 2002:a17:906:3542:: with SMTP id
 s2mr3495137eja.379.1634214119358;
 Thu, 14 Oct 2021 05:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211014102204.2904559-1-richard.purdie@linuxfoundation.org>
 <CADkTA4PxFFZvvu9jjstmJ6JxzVaDA_=dMRonNSLUMd6KBqHHyQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PxFFZvvu9jjstmJ6JxzVaDA_=dMRonNSLUMd6KBqHHyQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Oct 2021 08:21:48 -0400
Message-ID: 
 <CADkTA4MBsR_EeyvM6ejeJvWncNynPMqhqFqyyPVtEmWfDTSuVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto-dev: Ensure DEPENDS matches recent
 5.14 kernel changes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 12:22:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156947

On Thu, Oct 14, 2021 at 8:20 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> I already have this in my queue to send, but I guess this will do :D
>

I just sent my version, so you can choose. I have a slightly different
and extra commentary in mine.

Bruce

> Bruce
>
> On Thu, Oct 14, 2021 at 6:22 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > DEPENDS here should match what 5.14 is using.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto-dev.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > index f58b5ab0b86..005b6887789 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > @@ -38,6 +38,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> >
> >  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> >  DEPENDS += "openssl-native util-linux-native"
> > +DEPENDS += "gmp-native libmpc-native"
> >
> >  COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64)"
> >
> > --
> > 2.32.0
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#156932): https://lists.openembedded.org/g/openembedded-core/message/156932
> > Mute This Topic: https://lists.openembedded.org/mt/86308914/1050810
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

