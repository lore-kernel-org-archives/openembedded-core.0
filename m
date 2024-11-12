Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54F1D41D51
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 19:55:29 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.96302.1731441323786427469
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 11:55:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nopyAoHI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8988440003;
	Tue, 12 Nov 2024 19:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731441321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kPqsd+NpVs+5RK2pLuS2UGJZNeRsCVezt+N0nJktA1U=;
	b=nopyAoHIIyUGlhqhp8fJIQstWr+n5f7oGwr1uC8wteM7KppRxK7g8ooX/57cXBABXi92r5
	/Pi9WtQaTTC0CtGUnycVngZeZ0UllyUnF9akXxXU8Smc8ureE+Eyn5m8gUz/uLmuEiW1P0
	LiwF3tInAFIEruv4Jr+f+wJfWQ7iB2aPn6acVPBSfjbo4S2Fcxyp7YamDgnY8BiIY2v3eN
	c+qOAwe4sUiYkJq4EgWeCxFUGXyBG/X5CtbZMFfed34GKYcpnOtHc+fqfSZXCNRY49BINM
	ME7kmieBQHk6NcwWAfj+fhbykpl123gTUJb/X9xPto8DGBaF2c5az0x0dYlkMA==
Date: Tue, 12 Nov 2024 20:55:20 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: ross.burton@arm.com
Cc: "peter.marko@siemens.com" <peter.marko@siemens.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH] curl: upgrade 8.10.1 -> 8.11.0
Message-ID: <ZzOyqKFGwKIBv5Uc@bootlin-mathieu>
Mail-Followup-To: ross.burton@arm.com,
	"peter.marko@siemens.com" <peter.marko@siemens.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
References: <20241109222058.1949835-1-peter.marko@siemens.com>
 <1CE2D433-AA61-482E-A0C8-5C1AB7299907@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1CE2D433-AA61-482E-A0C8-5C1AB7299907@arm.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207062

On Mon, Nov 11, 2024 at 12:14:48PM +0000, Ross Burton via lists.openembedded.org wrote:
> curl 8.11.0 is known to have some regressions in, for example from the curl-distros list:
> 
> “”"
> As you probably know, there were some regressions in the latest release 8.11.0.
> 

Hi,

Yes, I confirm we are affected by these kind of issues if we do merge
the patch:

fatal: unable to access 'https://git.yoctoproject.org/git/dbus-wait/':
.netrc parser error

https://valkyrie.yoctoproject.org/#/builders/31/builds/410

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

