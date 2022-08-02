Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89694C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 09:52:31 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.4262.1659433943435213938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 02:52:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JwGCVqUn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3FFD4E0002;
	Tue,  2 Aug 2022 09:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659433941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bKzLQeCIAVbTS/NnEuYLgnN+K5Dih1a7wK7c5is3xX4=;
	b=JwGCVqUnPg0UxzPsF89O5ldQU08ilNldmw856P6HpTgcv9bshNnmnbRi+F9qTUrxdUIbBZ
	ikJDc/R+YQgLaL1BACiN79fzbP19G5/VmwCKOAbuR6JeG4UhOw0fWUVKBDBi8TP3L1XDn0
	29ZYv+8ZZLwp3nicXxs/GcKjhfh3Gahg9rNtaSqVEF3TjjATMlJuC9HVNe3WNvJqyEGDcu
	2sfYe2U6JKGqsiE3DQ5TOUTFlzfUEEwj/nvh4ZcE0WLTZoQlD95bi2rzu6iw61PAYFeU4P
	lTFozD3C/3vevm4W6L6zaEBBLwlPXB9EPMiPty2W3B/5OIXwlQJVxr6NhSIesg==
Date: Tue, 2 Aug 2022 11:52:18 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Pgowda" <pgowda.cve@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 richard.purdie@linuxfoundation.org, rwmacleod@gmail.com, Vinay Kumar
 <vinay.m.engg@gmail.com>
Subject: Re: [OE-core] [PATCH v6] Rust Oe-Selftest implementation
Message-ID: <20220802115218.5eeb964c@booty>
In-Reply-To: 
 <CALY4986e=cqifcHUNt0buU5+FtHjLju_29SwLhD14rwFd2zU_g@mail.gmail.com>
References: <20220802035352.1497111-1-pgowda.cve@gmail.com>
	<20220802103833.0b32b669@booty>
	<CALY4986e=cqifcHUNt0buU5+FtHjLju_29SwLhD14rwFd2zU_g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 09:52:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168776

Hi Pgowda,

On Tue, 2 Aug 2022 14:37:54 +0530
"Pgowda" <pgowda.cve@gmail.com> wrote:

> Hi Luca,
> 
> There were around 270 testcase failing when "has-elf-tls" has been
> enabled while building llvm.
> Hence, we had to remove the option to enable the proper working of these tests.
> The patch has been tested on Ubuntu and also fedora (using docker image).

Thanks for the explanation. Then why not adding an explanatory comment,
as below?

# Disabled because.....
#    tspec['has-elf-tls'] = True

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

