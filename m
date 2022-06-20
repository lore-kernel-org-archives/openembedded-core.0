Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CB7C433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 12:53:27 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.29771.1655729606226672292
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 05:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SSeNIVBf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [37.161.31.168])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C163A1BF204;
	Mon, 20 Jun 2022 12:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655729604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=26b3hmtmWMOFvcVUWparsR7VEQCL2+8Ub4+fwbXBNQo=;
	b=SSeNIVBfMmStRlMa8dfiNx8Dg/bkZkglTs0JCPC6k9S8afSG26ZnsA1m+kb/ZBnIKDn7PH
	FLNmZ3SUTb3jdNrQZ3kFUZtVRXQwLV4S9JUJxRmX0TbZEjXaj4L6a/XOWcVFszFpX2qBUK
	lzgtINcKPitqlxVwTSUrBI9kp7Ou5a6j+jJUIhb6hnw+RpRgk83eam834D9twsgm5DEtfK
	AzTG5icWomBJQXyrMwzkeL0UXqDRGWtHMb8/+KYH9UhxCuLuvSAMcyhn0n0TcmUSosnB7E
	R/DcqSq5oMATvBZRJsP0vUb/GI7auISfbHAxrcCfi42A6JG2dmrMXO+2VS4v7w==
Date: Mon, 20 Jun 2022 14:53:20 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Ross Burton" <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Subject: Re: [OE-core] [PATCH 1/3] Add python3-hatchling (from meta-oe)
Message-ID: <20220620145320.4ce9ae2a@booty>
In-Reply-To: <20220620144832.0c93a7b8@booty>
References: <20220619212520.4158865-1-ross.burton@arm.com>
	<20220620144832.0c93a7b8@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 12:53:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167097

Hi,

On Mon, 20 Jun 2022 14:48:32 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> Hi Ross,
> 
> On Sun, 19 Jun 2022 22:25:18 +0100
> "Ross Burton" <ross.burton@arm.com> wrote:
> 
> > Recipes in core are now needing to use the Hatch build system, so
> > move the hatchling recipe and class from meta-oe to oe-core.
> > 
> > Signed-off-by: Ross Burton <ross.burton@arm.com>  
> 
> This patch is causing failures on the autobuilders:
> 
> ERROR: Nothing PROVIDES 'python3-pathspec-native' (but .../python3-hatchling_1.3.0.bb DEPENDS on or otherwise requires it). Close matches:

References:
https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/5402/steps/18/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/5402/steps/16/logs/stdio


-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

