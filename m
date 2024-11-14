Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBEC0D68B09
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 13:11:58 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.36822.1731589918022012711
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 05:11:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Gh8l1jNT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2199560012;
	Thu, 14 Nov 2024 13:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731589916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nmX+QYnSG3/J1dZluTq8UywiM0zUop1wf/ojI3SnuPA=;
	b=Gh8l1jNTMcPFdUyXNdruVTCKZZKyp0ejSBh2AsNqNlrGgcPUrEs782nh1ZZl9QfCocb54G
	IBvdD4GsxSMAGV73YNoqXHcKXA3EBa0AgEOLrEXapQhoC/awQKUEKwXF0zAcYYCiTA8hRx
	HxEhO9jGq6Z5/YEGP0wG87vaD6GtF4/uQSAo3yuFK6JXqWQYtSUcQoO/xUWAEobtqDKRNu
	TGGSiFBvKG5BVnCzF6ro2590m0MvtSzguhtG+I2Kt39yogwezPzsZtMDhcR2cAtZO+tpag
	snGrkzNyfhSJ8gPHr/TTAH3bLEoqEGtd1yPo0AO9fCweNHhe/uVn+OdUF1+veg==
Date: Thu, 14 Nov 2024 14:11:54 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] systemtap: Add git revision to PV
Message-ID: <ZzX3GstbGu8K530z@bootlin-mathieu>
Mail-Followup-To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20241114124856.35716-1-mathieu.dubois-briand@bootlin.com>
 <CANNYZj-V=TDuXtWGmukPwDbQLeoowoc3wruG1heDAV0qS_r+yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-V=TDuXtWGmukPwDbQLeoowoc3wruG1heDAV0qS_r+yw@mail.gmail.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 13:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207161

On Thu, Nov 14, 2024 at 01:59:29PM +0100, Alexander Kanavin wrote:
> On Thu, 14 Nov 2024 at 13:49, Mathieu Dubois-Briand via
> lists.openembedded.org
> <mathieu.dubois-briand=bootlin.com@lists.openembedded.org> wrote:
> > -PV = "5.1"
> > +PV = "5.1+git"
> 
> I'm not sure I understand the reproducible 'magic' this would trigger
> in systemtap's usage of 'git describe', but if this does fix things,
> you need to leave a comment in the recipe asking people not to remove
> "+git". This is because "+git" suffix is typically used for something
> else: an indication that we're taking a revision that's several
> commits after the tagged version (e.g. containing important fixes).
> 
> Alex

Yes, indeed having a comment here would be better, I will make a v2
adding it.

As for the reasoning leading to add +git in the revision, the bug entry
gives some context:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15288#c10

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

