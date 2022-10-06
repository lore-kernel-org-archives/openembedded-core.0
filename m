Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1C3C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 09:35:17 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.3880.1665048913420454491
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 02:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Jc6WaIfc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D9C85C0006;
	Thu,  6 Oct 2022 09:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665048911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tSPbqQqIQtk8IgwQr0DhkVIZLNHjorkLbFRij4cCKrQ=;
	b=Jc6WaIfcTh901HWNjdwHei8eaOyfWrYvadTvuoYv45T8Lc1O1iLZd7fgYy/a+7Kp2QznUe
	812g8oYj13f4uVTgBUKE/cxSNCZyv+aCDJrIFmYq00rA3GO6c0tGytoyr1HeYklFkw3jzO
	hAcHFl3l2Ut5d1+fmyniC8LLvfDz87AoIlwDeIs3ORNINm8zjNLZE7BDP8Qsu48N5KCyKJ
	6z1yBlBZFQEP5EjLMeEKb1kOgSpy/3xT4RV2E1LQTBcTG26JS7PfG5CX2e+GjWh6QMa6p2
	70PS76wY7xdIRpO8dHHRhuhG4vH32muyfx9SNo4ZKk7VWUcZxydIqcdtlfUAFA==
Message-ID: <9c4935f3-2184-afc0-339f-13ad899cbe13@bootlin.com>
Date: Thu, 6 Oct 2022 11:35:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: John Edward Broadbent <jebr@google.com>,
 Carson Labrado <clabrado@google.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [dunfell] [PATCH] externalsrc: git submodule--helper
 list unsupported
Content-Language: en-US
To: sven@svenschwermer.de
References: <20221006092257.67313-1-sven@svenschwermer.de>
 <171B70EA61BB4E6A.13650@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <171B70EA61BB4E6A.13650@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 09:35:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171486


On 06.10.22 11:30, Michael Opdenacker via lists.openembedded.org wrote:
>
> Thanks for the patch, but it doesn't apply.
> I guess you should re-apply to the openembedded-core repository first, 
> which has different paths.


My bad, it does apply indeed to the "dunfell" branch.
Apologies for the noise
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


