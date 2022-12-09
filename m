Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD0EC10F1E
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 16:37:34 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.6292.1670603844849420839
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 08:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mHGm7011;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id q186so4975886oia.9
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 08:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zEoYLl+gwFPdlS74JeNSAkO18VZfrlE4oUEICtiuxTA=;
        b=mHGm70118MVKMQQzMcbC8eBiZkjxQyOWPmgc/glwTbZMY5l5FIm+ghTbhyI/W5fPDD
         z0N0XgFeTySEENrpvzNONonUtFekDySlgo4gx5l9jxSljpowqBNtAHFHKDVmDKhTAa48
         iBWgcb3x0VikAsK5GYZJL3YS57MKyI/3Z5CbXHj40Kue7rI9ZfD5gQBPFLNHw5Ll8DoR
         OKGHEYMFqqS86BJlUiWFodjCxxriLUpd56PF7j19HL85CBBIFcIB5gMmOwlsTy6ISwt7
         xJDZxZubQaTLxYlUuO9CwORrgBpmD8x+bXUtgvYL7r2fPNVIcYrNOa5MonDtupqIIXaY
         zPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEoYLl+gwFPdlS74JeNSAkO18VZfrlE4oUEICtiuxTA=;
        b=C5Kz8HWkUA4Emoh25PKlXMLlPnBbIh1npz0DYI2pXnxrtmwoTPZWbhsn7/qaXYrcSk
         MxDPABXNDjRrMx+II/SGpcJKY1LFkbA6FEQVbbudfxD4WdGtUsCFkVBCI7MYM3Fli9OX
         3Hn6v24u2wJa2BaPFnz43W9iabtZxZ8XxuSmNP6c4/2T4kogcGcx+6Yv0PS2N4t1o/z0
         LjL29cN+gQAFvAcQwIg28qoRIB+R9j/N89n82+t97UBYAVx7W80LDVP5VEwFG31WiaKf
         SbDbQ26eU0A5++iYYv1UklsYr3/enq+GkacVx75gMkzrULot8VftXGQG/XGABLWSPMum
         exeA==
X-Gm-Message-State: ANoB5pnJ2KDxzO1qqCqygLqEGxn5YdO29NQMN1XAwbK7fohhg2fxvs7V
	RYbj+GcKgWe5d5gi9aUpLL83MC2gjS2pLPKOls0=
X-Google-Smtp-Source: AA0mqf50i3HcuxSEP9sh2CRW7ja/gS/+VYMGT1gh5KJkj7vESyVWEBfKcWhw35GRxSCNPjl8XskWVHgIge9Ap1O8zBo=
X-Received: by 2002:aca:f046:0:b0:35c:53a9:5513 with SMTP id
 o67-20020acaf046000000b0035c53a95513mr7218354oih.262.1670603844050; Fri, 09
 Dec 2022 08:37:24 -0800 (PST)
MIME-Version: 1.0
References: <20221208071136.1967696-1-olani@axis.com> <20221208071136.1967696-4-olani@axis.com>
 <08c1f279-d446-bc7c-f01d-4ebfb1da51d8@gmail.com> <jwq5yekdg24.fsf@axis.com> <Y5Mzg1VAbMREQ55k@mail.local>
In-Reply-To: <Y5Mzg1VAbMREQ55k@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Dec 2022 08:36:57 -0800
Message-ID: <CAMKF1srTh1v7ZESSVGVOxje=ibVKU2EzyUYB9mRMjC2BOdrj5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH RFC 3/3] time64.conf: Include to enable 64 bit
 time flags
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ola x Nilsson <ola.x.nilsson@axis.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 16:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174467

On Fri, Dec 9, 2022 at 5:09 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 09/12/2022 10:55:16+0100, Ola x Nilsson wrote:
> >
> > On Fri, Dec 09 2022, Khem Raj wrote:
> >
> > > Thanks for the patches
> > >
> > > On 12/7/22 23:11, Ola x Nilsson wrote:
> > >> Signed-off-by: Ola x Nilsson <olani@axis.com>
> > >> ---
> > >>   meta/conf/distro/time64.conf | 23 +++++++++++++++++++++++
> > >>   1 file changed, 23 insertions(+)
> > >>   create mode 100644 meta/conf/distro/time64.conf
> > >>
> > >> diff --git a/meta/conf/distro/time64.conf b/meta/conf/distro/time64.conf
> > >> new file mode 100644
> > >> index 0000000000..99eb06dc0f
> > >> --- /dev/null
> > >> +++ b/meta/conf/distro/time64.conf
> > >> @@ -0,0 +1,23 @@
> > >> +GLIBC_64BIT_TIME_FLAGS = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
> > >> +
> > >> +# TODO: Only for 32-bit architectures?
> > >> +TARGET_CC_ARCH:append:arm = " ${GLIBC_64BIT_TIME_FLAGS}"
> > >> +TARGET_CC_ARCH:append:armeb = " ${GLIBC_64BIT_TIME_FLAGS}"
> > >> +TARGET_CC_ARCH:append:mips32el = " ${GLIBC_64BIT_TIME_FLAGS}"
> > >
> > > We should enable it across all 32bit systems
> > > something like
> > >
> > > TARGET_CC_ARCH += "${@'-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64' if
> > > d.getVar('SITEINFO_BITS') == '32' else ''}"
> > >
> > > would do it.
> >
> > I was looking for a way to identify 32-bit platforms but did not find
> > SITEINFO_BITS.  I'll look into using that instead.
> >
>
> I don't think it is correct to assume all the 32bit platforms are
> affected. riscv32 is not affected for example nor would be any newer
> 32bit architecture.

yeah that's a good point, I overlooked that because these defines will
become redundant in those cases

>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

