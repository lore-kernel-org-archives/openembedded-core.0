Return-Path: <kory.maincent@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2477C7114A
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:11 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.18976.1650529240323392805
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 01:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lQGD5PjD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: kory.maincent@bootlin.com)
Received: (Authenticated sender: kory.maincent@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 52D4EE0004;
	Thu, 21 Apr 2022 08:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650529237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2a3RugGaeNBNvqmWQy1bcQnF3wHr52075bwKEHOJH8=;
	b=lQGD5PjDWuVKOf2eJwMmYwnRYwxS/bej2txZlgqBn+sxTNEVObsWP6KvlBQ1T1qd9FO+AN
	gKUbnIWMnMmIC8hG7WfFOtHubfu7EAUIKcsrQNBwRb4Ub2tpSIp/99rvnxUnGPiEO4j+c/
	VRYDIJkhwCccr33JkN5mumAI7zVro/UDUSDyoJCImLWVfvF20gniy+H51pEa4vNKzsLIDu
	jsO967A9VlNj+Stpv9cuLC1+Sh+g4ffgjx9l1YUoxpC0fyRe2xvcoWP0/wRd1zpIdIHEJd
	zhxl0t/WatlU/LzRP4W3Hzp0s9yRp4BDE+cMGiuPL5G5EdP2krEUqdRwi09A4w==
Date: Thu, 21 Apr 2022 10:20:35 +0200
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: "Alex Kiernan" <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alex Kiernan <alexk@zuma.ai>
Subject: Re: [OE-core] [meta-oe][PATCH 7/8] wpa-supplicant: Simplify
 build/install flow
Message-ID: <20220421102035.244debd2@kmaincent-XPS-13-7390>
In-Reply-To: <20220412130315.25917-7-alexk@zuma.ai>
References: <20220412130315.25917-1-alexk@zuma.ai>
	<20220412130315.25917-7-alexk@zuma.ai>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164746

Hello Alex,

On Tue, 12 Apr 2022 14:03:14 +0100
"Alex Kiernan" <alex.kiernan@gmail.com> wrote:

> The build/install steps for wpa-supplicant support CFLAGS and an install
> target, so use these rather than attempting to do it manually (which was
> broken by upstream splitting into build.rules and lib.rules).
> 
> Note that this installs wpa_passphrase into sbindir rather than bindir.

It seems the wpa_passphrase binary is not installed anymore with that patch.
Could you verify on your side?

Regards,

