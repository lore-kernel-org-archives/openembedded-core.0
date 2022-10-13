Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BC3C433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 08:01:11 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.5105.1665648061540176375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 01:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jClC6eq6;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 48CAB240012;
	Thu, 13 Oct 2022 08:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665648059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Meqltg8RX3DuOnLB/f7VIJ8NpA2rN2d4qcVI0GuALc=;
	b=jClC6eq6vC0mEC9Ot+nO6BUTWvSHYDP5n32uEQ9MDbWezlcPenyc9C1qevHaPZjIlPYFlp
	Lj//4Xpp/F1fYN9MoQ/UFIyaQLzSESvBA7o9v2pfi319sCGncY4FwKLJBvdMtCbPKsY+sV
	UVdL68GzKsYvJ/q+AjJe/vxwqiEFbtKiW9zVcuqzMnTzwnIiKo5div3BJHLp9N1OkDs8LK
	nZu3f6u2+7F+97Ms/ZYoSGWdOnWVWKzv9fxhXxs3zBU/KPwjo1w7MEIbYoOpN+o4pMZ1kV
	v4PNhisrDc11BiD7r4uzJ9L4Rn25U8Vv8xAlXYojsqDlzQ4fk/5P+6yXUAPPbg==
Date: Thu, 13 Oct 2022 10:00:58 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [kirkstone] core-image-weston doesn't build
Message-ID: <Y0fFumcfL7RGRxvL@mail.local>
References: <CAApg2=TmNEnu+KQTz9iJ72LaduRoHQh_YwevzJgpROj5C8qJew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAApg2=TmNEnu+KQTz9iJ72LaduRoHQh_YwevzJgpROj5C8qJew@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 08:01:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171686

On 13/10/2022 09:52:44+0200, Marta Rybczynska wrote:
> Hello all,
> I'm trying to build the core-image-weston in kirkstone to look into
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14926
> 
> It turns out that the image does not build (oe-core
> e728d0965d6fda8ac54e065ca7bf7eb9da9a8170 with bitbake
> 6603c3e39f1cf746669ec6c9f0be8c6e6ece426e). I'm getting:
> 
> $ bitbake core-image-weston
> Loading cache: 100%
> |###################################################################################################################################|
> Time: 0:00:00
> Loaded 1640 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'weston-xwayland' (but
> /oe-standalone/oe-core/meta/recipes-graphics/images/core-image-weston.bb
> RDEPENDS on
> or otherwise requires it)
> NOTE: Runtime target 'weston-xwayland' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['weston-xwayland']
> ERROR: Required build target 'core-image-weston' has no buildable providers.
> Missing or unbuildable dependency chain was: ['core-image-weston',
> 'weston-xwayland']
> 
> Summary: There were 2 ERROR messages, returning a non-zero exit code.
> 
> I can't find this one in bugzilla. Is it a known issue?
> 

Did you remove x11 from your DISTRO_FEATURES?



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

