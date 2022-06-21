Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43528C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 08:24:53 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.40980.1655799890975605095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 01:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OwVWZPMY;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8637C200011;
	Tue, 21 Jun 2022 08:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655799889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hd2yQZRdFwuFY3pQG6pCIhcUjAr2vbQ+Sdlt5XBR3Iw=;
	b=OwVWZPMYRtl6XpAimE18LBJ4hbPQcKG9xxNRzAG1SK0NnLTfQjWWnV4RddLg0Db15uhTNM
	2JEOUM4/DtTYD9VweysWS+rDui1hqJ42mKUDPY28khPbUoReh+r7lsGoURKxkylcGNxp10
	wUvo+3AlZyRutcZPV92SSVoItXG8n/MGI1aD1lFmPqXmv90iTg1dQbKnZnALnZ/9OLbpxm
	NQJUuNUvYTUdfVhyDV8FYWeI6yBj1CXm/eipVJ5NzW8CttCsgVaTMGWMrhb+h9/ZpA1Iow
	m3tLCl7JVuGmtvQJfM5XkZaCgdQsBMyZV3eeUxiAXAPEJBdD2ycdCuihLRMpXQ==
Date: Tue, 21 Jun 2022 10:24:46 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Qorin Wu" <qorin.wu@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Qorin
 <qorin.qorinna@nl.abb.com>
Subject: Re: [OE-core] [PATCH] resolvconf: Install missing
 normalize-resolvconf file
Message-ID: <20220621102446.16d12268@booty>
In-Reply-To: <20220620131338.160501-1-qorin.wu@gmail.com>
References: <20220620131338.160501-1-qorin.wu@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 08:24:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167136

Hi Qorin,

On Mon, 20 Jun 2022 15:13:38 +0200
"Qorin Wu" <qorin.wu@gmail.com> wrote:

> From: Qorin <qorin.qorinna@nl.abb.com>
> 
> It was moved to a separate file in version 1.90

When sending a new version of a patch, please mark it as "v2", "v3"
etc. This is very easy to do with 'git format-patch' and 'git
send-email' by adding the '-v<NUMBER>' option.

Another thing you are required to do is to sign off your patches. Git
makes also this simple to do by adding '-s' to 'git commit'.

Thank you!
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

