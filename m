Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509EDCDB474
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 08:08:47 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.58996.1697270917437112864
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 01:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JMi7ut1j;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFAC7E0006;
	Sat, 14 Oct 2023 08:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697270915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0FcsDt4Awk/DUTelj0KZU6De0j+FUFOCe76nvj1ewQ=;
	b=JMi7ut1jF6CxRzLaa+OppQmB1Lu8v4g1v9+/zGawg+cAdPrxF/Iix6fUEnol9Cdeem2v3c
	9aO3Zw+hHQPQixqOqzClho0i9MFX6McuPhBUu8Vqn395J9DvL5FGmW2iSLsQeNLqymV9gC
	f/aJw+9Rh0e/c0PT2K8tF9VYtfE96LMt+J9BfLzbO1WMwR6wXF6zpyqfxjXBvV4Rnk/4qC
	feR9uEetOUHIGmiJuTGnpPV2lJ0TtQcHFm0Pjm71YriIQYjDiGO08ux+oGzezvK6I2Wq3I
	InHcdyEPNzrzxGiSHGTRdAFLUXcC1UoMTY3H+ENJjFCWuvZLIC1kxsdxrdgFEg==
Date: Sat, 14 Oct 2023 10:08:30 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Johannes Schneider via lists.openembedded.org"
 <johannes.schneider=leica-geosystems.com@lists.openembedded.org>
Cc: johannes.schneider@leica-geosystems.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Jason Wessel
 <jason.wessel@windriver.com>, Richard Purdie
 <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH] base-files: profile: allow profile.d
 to set EDITOR
Message-ID: <20231014100830.69fe931c@booty>
In-Reply-To: <DB6PR06MB400859907A9D2543961D71D5BCD2A@DB6PR06MB4008.eurprd06.prod.outlook.com>
References: <DB6PR06MB400859907A9D2543961D71D5BCD2A@DB6PR06MB4008.eurprd06.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 08:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189110

Hello Johannes,

On Fri, 13 Oct 2023 10:27:34 +0000
"Johannes Schneider via lists.openembedded.org"
<johannes.schneider=leica-geosystems.com@lists.openembedded.org> wrote:
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

As you can see your sender address has been mangled, and as a result
the patch is rejected by the the openembedded git server. This is not
your fault, but we need you to modify your git configuration to prevent
this from happening in the future. Have a look at the wiki for more
info and how to solve that:

https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Fixing_your_From_identity

I'm taking your patch for testing on the autobuilders fixing it
manually so you don't need to resend your patch this time.

Luca


-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

