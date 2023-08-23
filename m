Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BD1EE4993
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 08:41:15 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.7127.1692780072534775933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 01:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=S4nYMJmO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D08040003;
	Wed, 23 Aug 2023 08:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692780069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QZHXgiVHDwT/3ozpz/iWysomPIgyv7lBnJVC8b0uJDk=;
	b=S4nYMJmOmzUqvdKQ9qcSDf4NMZbt62DgqpkwqBGs6eaBuYoCKDWlq+pTRXX0d0AMLHqDl8
	ov4ou63sr3tuaVpUufeSE+UrIgtaGQk2fDTcVNCS20f/84Q0AhRK1a1xmSYZI7Beu/pglh
	qNf4h2ZBdYenvEufKO8XsyHo/4DuxoXU9+OjjLfd8nvyrmRx5U8bULVWQfXbZx7GOsMb66
	k4Oy5nOg2H4Ql44XB+uw4G9MPgjQyVpzfh74sbulg/g6+z1OsBBCZqxyud7xwNDz+Nw54E
	JnkHS0yFLouNmpY829bqk2cb0XpnZ296pYqtPKBYmZI63i5NXbI2zJCXInXAsw==
Date: Wed, 23 Aug 2023 10:41:07 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Adrian Freihofer" <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Adrian Freihofer
 <adrian.freihofer@siemens.com>
Subject: Re: [OE-core] [PATCH v2 13/13] docs: cover devtool ide
Message-ID: <20230823104107.53f001b7@booty>
In-Reply-To: <20230822192300.3235896-14-adrian.freihofer@siemens.com>
References: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
	<20230822192300.3235896-14-adrian.freihofer@siemens.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 08:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186562

Hello Adrian,

On Tue, 22 Aug 2023 21:20:19 +0200
"Adrian Freihofer" <adrian.freihofer@gmail.com> wrote:

> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/sdk-manual/extensible.rst | 97 ++++++++++++++++++++++++-

This patch should be sent to the docs mailing list.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

