Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E7AC77B6E
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 16:05:03 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.17532.1681401896851209283
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 09:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZId7tlvV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3FC3B20016;
	Thu, 13 Apr 2023 16:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681401894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y93dlpX/+qWw9GdHt4pEY+I8A/2nJ8XDE8ukhW0iQJo=;
	b=ZId7tlvVlGuZz2WjWbnlatB/PwnplEFGup58KH2f1XXIOJBQ5Djq8Ymy2LKZVLpPcPbLjG
	1dOUcsiHZwuQWRvj5MxIYITtFRJom2PIs12FNYZuKwbHJoxUh0U4/RvSHwRIkYlLTNiFuy
	mpPbR24YWPaeONMwwqyMkiKa/vvbrqgM+gFAp2CCFeFDWEKgUBt9UxB8cUQfYLocUJLAbR
	BrhhUSr8GjObB2OjW5hoGOclBbC9VpGZUh72RoXu6R5AhHSy+zoUIxQix1DX58UQ0ju/nr
	oYKwVbqiIwl5OIcnLCZLNUza9hWhm29TfLFod/o+Va1KIjXkODTE+qcKhyUDIw==
Date: Thu, 13 Apr 2023 18:04:52 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Jamin Lin" <jamin_lin@aspeedtech.com>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] kernel-fitimage: support 64 bits address
Message-ID: <20230413180452.53f9eb8f@booty>
In-Reply-To: <20230413103109.5604-2-jamin_lin@aspeedtech.com>
References: <20230413103109.5604-1-jamin_lin@aspeedtech.com>
	<20230413103109.5604-2-jamin_lin@aspeedtech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 16:05:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179981

Hello Jamin,

thank you for your contribution!

On Thu, 13 Apr 2023 18:31:08 +0800
"Jamin Lin" <jamin_lin@aspeedtech.com> wrote:

> The default value of address-cells is "1", so the generated "its" file
> only supports 32bits address for kernel FIT image.
> However, some platforms may want to support 64bits address
> of UBOOT_LOADADDRESS and UBOOT_ENTRYPOINT.
> Therefore, adds a variable to support both 64bits and 32bits address cells.
> 
> By default, the address-cell is "1" which is used for 32bits load address.
> If users would like to use 64bits load address, users are able to
> set as following for "0x400000000" 64bits load address.
> 1. FIT_ADDRESS_CELLS = "2"
> 2. UBOOT_LOADADDRESS= "0x04 0x00000000"
> 
> (From OE-Core rev: f79046d082f3a7752e6780b2990470dcd36cbba4)

This line should not be there. It looks like  you generated your patches
from a poky repository where this patch landed via combo-layers, but it
just doesn't make sense as an oe-core patch. Also, that SHA-1 does not
exist in the public oe-core repository.

I removed that line while applying the patch for testing, so you
don't need to resend for this time, but please make sure you generate
your patches from an oe-core repository in the future.

The same applies to patch 2/2.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

