Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22356D68B36
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 16:28:40 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.41546.1731601712399546203
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 08:28:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BLfO1ypV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62DD260007;
	Thu, 14 Nov 2024 16:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731601710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mXdktXoR2r7cGXetViEpWiWdMs5dAh9W/IAiHE6lJBs=;
	b=BLfO1ypVCqalhz3Q9eXkr03Dd/PQ12Nr/VgWG8AUHayzDgFhLuzucKxa4trs91pf8nA3Ct
	bW4wDQED6OPGiMo86muXj2LRFtJOysTsvRUG30rwVwhAzS/mDxTU6CdCiwKJwXKl/vXt99
	apZOPccf1vJbdW1B/yMMM0DEXPqD7OH6+K1byK/vJQTZ08jGLRmQLGBFNWdhegAGpF9bmf
	FCw2J06mwg4OEXdOwWbMhVvshxflEMaUmaBzAoyby+aZSGZxduXqoMVr8/NTiM/dDycUmB
	jtDMuQNI8AIYmmd1vruEJdzBtXYNfYekBjSmjx/o1KeH8q6s+w40fz7b3Vs7Ew==
Date: Thu, 14 Nov 2024 17:28:28 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: liezhi.yang@windriver.com
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com
Subject: Re: [OE-core] [PATCH v2 1/1] bootchart2: Several fixes
Message-ID: <ZzYlLDUiQgtvN6aa@bootlin-mathieu>
Mail-Followup-To: liezhi.yang@windriver.com,
	openembedded-core@lists.openembedded.org, ross.burton@arm.com
References: <cover.1731571498.git.liezhi.yang@windriver.com>
 <cfbc483721d4dc7cd442e8cbc344b0c05160cad8.1731571498.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfbc483721d4dc7cd442e8cbc344b0c05160cad8.1731571498.git.liezhi.yang@windriver.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 16:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207171

On Thu, Nov 14, 2024 at 12:25:17AM -0800, Robert Yang via lists.openembedded.org wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
> 
> Fixed Ross' comments:
> * Add -n to gzip to make the resulting files reproducible, so we don't need to
>   decompress them.
> 
> * Makefile: Let bootchartd.conf use EARLY_PREFIX, so that bootchartd.conf can
>   install to correct location.
> 
> * Set MANDIR and DOCDIR to make the files install to correct location for
>   bootchart2-native.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

Hi Robert,

Thanks for the v2, but I believe this is failing some builds on the
autobuilder:

ERROR: bootchart2-0.14.9-r0 do_package: QA Issue: bootchart2:
Files/directories were installed but not shipped in any package:
  /usr/etc
  /usr/etc/bootchartd.conf

https://valkyrie.yoctoproject.org/#/builders/25/builds/432/steps/14/logs/stdio

Can you look at this issue please ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

