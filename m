Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5D8D1171E
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 08:07:36 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.7241.1729843641641385552
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 01:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=A2u3osiZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89EDB1C000D;
	Fri, 25 Oct 2024 08:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729843639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ocsnQvr4VcNLj1VJ9BKKEzvMUu9RH8gect/VBhZn9bM=;
	b=A2u3osiZdq6bK5XUc7+GUBpUjt3AmqC6BBVeHFanYcliGDu3pdBjP/lF4QrSLhhvmSrttK
	wiYCH1p5+VM6V0t2LX5PecWfhLYRKuPIQosy70buThJRrrkXCS/LbFa2rxAHeu9z/Av5UN
	Y/ucqIzhWJGkgHZbx7dpGdoPqlPWpMOcbIg2hJ0dt7sR10Tv6Us9iH8+uf+L6miZIXyQUC
	uauuMKkv79hK+6YG8SgiGw5+0FsNda9srUjS3uyU08o2J588jUwJn9B729hOmPkGZqqy1T
	+kwEivv2J8aF7sYJtvovvJdkW1HD6Jhh0WqVR34Adg4YF0+i6epf2CkYAG/Aew==
Date: Fri, 25 Oct 2024 10:07:18 +0200
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: Vivek Puar <quic_vpuar@quicinc.com>
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Subject: Re: [OE-core] [PATCH] linux-firmware: add new fw file to
 ${PN}-qcom-adreno-a660
Message-ID: <ZxtRtgTPnDXL_3xj@bootlin-mathieu>
Mail-Followup-To: Vivek Puar <quic_vpuar@quicinc.com>,
	openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
References: <1800D621E53B4940.29859@lists.openembedded.org>
 <aff3ee2d-47c2-4c2e-98f6-341633e15017@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aff3ee2d-47c2-4c2e-98f6-341633e15017@quicinc.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 08:07:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206339

On Fri, Oct 25, 2024 at 11:49:12AM +0530, Vivek Puar wrote:
> Hi Richard,
> 
> Can you please review this?
> 

Hi Vivek,

As a quick update, your two patches are currently in my master-next
branch and have been built by the autobuilder without raising any issue
yet. If no other issue arise, they might land in master in the coming
days.

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

