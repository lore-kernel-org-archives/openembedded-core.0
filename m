Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8233CC433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 10:37:33 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.8094.1652179043644389059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 03:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OXhW2cX7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EC2072000B;
	Tue, 10 May 2022 10:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1652179041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Ofkrk5BdQwx36qvx4VuBC09kaB0+KBv48/7/uxxtuM=;
	b=OXhW2cX71ZQWIqF8Ikc7nXJYfYpyiNmZ22Hbx6InQ8gv08955DEJXfFRa2UP2DpVri6jvS
	m3zoO7EUjo7jqlPIDvN5Zbz3XXdIJxUyHVKbPLLGNx8feYV549JwdsmdWgXgUf8osbXlZ8
	m3fVNKWND0l23/40OeOGecT3TsCyDNiYQOiKqxlua4gN2ngmBzgjxYczMKrjlVQnxC8MFv
	E3/Tu173cnFC9TfHoo/cnOKNyWFwSt/ze6Vpi/XiWni42MhwUrkcZLhnUMDaDnI8VVAGGX
	lcFbezN+SUu3F2lICmGaii+OsqRYgR2isaNbTJlAz5cjzVqtelaivEW74Mn4FA==
Date: Tue, 10 May 2022 12:37:18 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gcc: upgrade 11.3 -> 12.1
Message-ID: <20220510123718.451b33ef@melee>
In-Reply-To: 
 <CAMKF1sofg6oc_gKhWZ_RtVqLiH5ZwwfLvO9Y+2=dAfMRSAonmg@mail.gmail.com>
References: <20220508003820.1120893-1-raj.khem@gmail.com>
	<20220509233931.2d4bbf0b@melee>
	<CAMKF1sofg6oc_gKhWZ_RtVqLiH5ZwwfLvO9Y+2=dAfMRSAonmg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 10:37:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165414

Hi Khem,

Il giorno Mon, 9 May 2022 16:59:02 -0700
Khem Raj <raj.khem@gmail.com> ha scritto:

> On Mon, May 9, 2022 at 2:39 PM Luca Ceresoli
> <luca.ceresoli@bootlin.com> wrote:
> >
> > Hi Khem,
> >
> > Il giorno Sat,  7 May 2022 17:38:20 -0700
> > "Khem Raj" <raj.khem@gmail.com> ha scritto:
> >  
> > > Major gcc release with lot of changes [2]
> > >
> > > - Add patch to re-shuffle include of sched.h to fix build on musl
> > > - porting guide to gcc 12 [1]
> > > - Fix version in maintainers entry
> > >
> > > [1] https://gcc.gnu.org/gcc-12/porting_to.html
> > > [2] https://gcc.gnu.org/gcc-12/changes.html
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>  
> >
> > We have a xen-tools build failure on meta-virt with this patch
> > applied:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/60/steps/13/logs/stdio
> >
> > and the same build succeeds without that patch:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/61/steps/13/logs/stdio
> >  
> 
> yeah this has been taken care in meta-virtualization/master this
> morning. So please give it another
> spin.

Indeed it succeeded now:

https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/65

Thank you!
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

