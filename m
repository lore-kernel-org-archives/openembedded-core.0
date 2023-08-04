Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46114C001DF
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 10:39:08 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.8284.1691145539640450790
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 03:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Pa7M3M2Y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B26020003;
	Fri,  4 Aug 2023 10:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691145537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xs3KvT2Ipr0778/UI0W/dZQpooey/smmcNPzaTEvfGU=;
	b=Pa7M3M2YZBYJP8QwYbF3jR3mpRcTtSGZ5/xyHxpsgndl1NzEv41rFbrjM0cbT1qSPpjQ3z
	Qo2QuwlVh4FVt+DAOeGdVFNuPZVPxYdk3cxU76a+psiIuOOZq6WK8/dfEXKEq7/kLr4FyB
	6DgCFsKP7O7zJZdX8iHPxvv/Xzba97ATwIfVQpudUegpb7woBksVp8hyCBTrLD87YxrxNo
	Zf4SWYzeXMranfddL+PMnXyIfA9ygu4ceBQyAoI6kVLQrsEQBs+7a5akhQ2Kb1ykZZWLz3
	qv+7oX4rcecRd5C5f6FJkops6pX+6B8x9fb0F9uEY6pyu84wAORgRT43BZPNLw==
Date: Fri, 4 Aug 2023 12:38:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v7] systemd: update to v254
Message-ID: <20230804103856bf974628@mail.local>
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230802185425.2044630-1-luca.boccassi@gmail.com>
 <b7a75eb0-caf6-d999-42c8-d1532200807e@gmail.com>
 <CAMw=ZnTgBDUJg9-rmzVxEcHUx3OJbt1=nDnjkZ41BJ9+kaPiXQ@mail.gmail.com>
 <CAMw=ZnR6FsD8CUhys+K61vtHaeRErjg-08-1kbq0AD=8-qmMdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMw=ZnR6FsD8CUhys+K61vtHaeRErjg-08-1kbq0AD=8-qmMdw@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 10:39:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185521

On 03/08/2023 19:34:15+0100, Luca Bocassi wrote:
> On Thu, 3 Aug 2023 at 00:16, Luca Boccassi <luca.boccassi@gmail.com> wrote:
> >
> > On Wed, 2 Aug 2023 at 20:27, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On 8/2/23 11:54 AM, luca.boccassi@gmail.com wrote:
> > > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > >
> > > > - Drop dependency on gnu-efi, add dependency on pyelftools for EFI builds
> > > > - Refresh patches
> > > > - Ship new files and directories
> > > > - Use meson target to build sd-boot instead of filenames
> > > > - Change libpam recipe to set ANY_OF_DISTRO_FEATURES = "pam systemd" to let
> > > >    logind pull in pam-plugin-umask
> > > >
> > >
> > > We need to fix the includes in few more places, I have submitted another
> > > pull
> > >
> > > https://github.com/systemd/systemd/pull/28651
> >
> > Merged and backported in v8.
> 
> Anything else we need to do here?

It passed testing overnight, I have been struggling with other patches
breaking the build and so this is slower than usual.

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185495): https://lists.openembedded.org/g/openembedded-core/message/185495
> Mute This Topic: https://lists.openembedded.org/mt/100512144/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

