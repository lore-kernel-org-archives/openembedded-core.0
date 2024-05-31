Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAB5C27C4F
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 23:36:02 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.27193.1717198552708785941
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 16:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CLMw8oA8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84C4020003;
	Fri, 31 May 2024 23:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717198550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MSqz9YP4UavivSXP+X9UKgArgZWtnyRA/MF9HwocyUU=;
	b=CLMw8oA8YZOa9AAEgRpo3caM7ROA7F1bqxRkzSPDBMqbUckD8IrlFZG+Ob7QXZFyslLY5z
	81mMUQKx31/LXknlYn1sq8PFDXxQBP8huDzpiQt68ukxW6YqJKw7gW7frIqONYNrLTs62x
	l2wN/GsL39Q8QrFlxmq+naiOMohZGgxVf9iS5RXYhWpffuyRNfqtcShMwidXf5pPpZFENR
	i0p4l1tElHQB35w+97zULzWwmoK7Fa/ZwT0al/ZR1h5F++aNYGeT4Ti7Q8YR44ewfpBXpv
	RiVqr2oc1K/B1s0gVdmi6U3XdfrN2CwOHddXWu0ROtjuN3KrbQRbRuMPM2rPOw==
Date: Sat, 1 Jun 2024 01:35:50 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RESEND][PATCH] insane: add patch-status to default
 ERROR_QA
Message-ID: <20240531233550d5d4dca6@mail.local>
References: <20240524160025.275450-1-martin.jansa@gmail.com>
 <2024053121292511bb731d@mail.local>
 <CA+chaQfSvcVRQQLNQ08jZBkQWXKr-MS-4Z-NQnbMJc-tvmu2BQ@mail.gmail.com>
 <17D4B4AB2EEA06B6.21428@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17D4B4AB2EEA06B6.21428@lists.openembedded.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 23:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200093

On 01/06/2024 00:53:21+0200, Alexandre Belloni via lists.openembedded.org wrote:
> On 01/06/2024 00:37:50+0200, Martin Jansa wrote:
> > On Fri, May 31, 2024 at 11:29 PM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > ERROR: gitrepotest-1.0-r0 do_patch: QA Issue: Missing Upstream-Status in patch
> > > /home/pokybuild/yocto-worker/reproducible/build/build-st/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
> > > Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]
> > > ERROR: gitrepotest-1.0-r0 do_patch: Fatal QA errors were found, failing task.
> > 
> > https://lists.openembedded.org/g/openembedded-core/message/200086
> > should fix that.
> 
> I can't keep track of the tens f patches I need to reapply once they
> have been dropped so please always resend complete series. I'm pretty
> sure that once my current a-full build will be finished I'll have
> forgotten.
> The other option is to resend later on.

And you sent it properly as a series so you can disregard my rant ;)

Thanks!

> 
> > 
> > Thanks,
> > 
> > >
> > > On 24/05/2024 18:00:25+0200, Martin Jansa wrote:
> > > > * it's enabled for patches in oe-core for very long time and I was using
> > > >   it for many other layers as well, so most layers should be in good
> > > >   shape
> > > >
> > > > * it's also possible to disable it for individual layer as shown
> > > >   by oe-core in:
> > > >   https://git.openembedded.org/openembedded-core/commit/meta/classes-global/insane.bbclass?h=scarthgap&id=61a881fdbe8b5a21c6276b8a5d06cc30486b1eb3
> > > >
> > > > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > > ---
> > > > Resend https://patchwork.yoctoproject.org/project/oe-core/patch/20240314070903.83765-1-martin.jansa@gmail.com/
> > > > now when scarthgap is released and master is open for development
> > > >
> > > >  meta/classes-global/insane.bbclass | 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > >
> > > > diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
> > > > index 99736830b9..6d2f83c6f7 100644
> > > > --- a/meta/classes-global/insane.bbclass
> > > > +++ b/meta/classes-global/insane.bbclass
> > > > @@ -45,11 +45,10 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
> > > >              already-stripped installed-vs-shipped ldflags compile-host-path \
> > > >              install-host-path pn-overrides unknown-configure-option \
> > > >              useless-rpaths rpaths staticdev empty-dirs \
> > > > -            patch-fuzz \
> > > > +            patch-fuzz patch-status \
> > > >              "
> > > >  # Add usrmerge QA check based on distro feature
> > > >  ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
> > > > -ERROR_QA:append:layer-core = " patch-status"
> > > >  WARN_QA:append:layer-core = " missing-metadata missing-maintainer"
> > > >
> > > >  FAKEROOT_QA = "host-user-contaminated"
> > > > --
> > > > 2.45.1
> > > >
> > >
> > > >
> > > > 
> > > >
> > >
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200089): https://lists.openembedded.org/g/openembedded-core/message/200089
> Mute This Topic: https://lists.openembedded.org/mt/106284256/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

