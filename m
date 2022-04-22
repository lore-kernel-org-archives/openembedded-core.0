Return-Path: <matthias@extraklein.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5881BC48BE5
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.61.102])
 by mx.groups.io with SMTP id smtpd.web10.7003.1650625774343554415
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 04:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@extraklein.de header.s=key2 header.b=NLljtOyK;
 spf=pass (domain: extraklein.de, ip: 188.68.61.102,
 mailfrom: matthias@extraklein.de)
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4KlBWH6cdWz7w9J;
	Fri, 22 Apr 2022 13:09:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=extraklein.de;
	s=key2; t=1650625771;
	bh=KuOytOZP8K8CO6JDevrCoMosFGcxqQiVcMy0tn59Ys0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NLljtOyK44EWAMEmqtqh6ViHLUYP+5yRETnc00mT3iwWQ4qWSAH9CjxOp5nyDqqgP
	 S8BtT5utnUYQMI/pmg0tPjRaL/W7WULiQ+XpWQLh6iyWK6WdDBKUTnZnnDjvx9ZjpT
	 ibj636QZx9sZVpc1EriVSenTESF44zex2KOBmPUpMwi+6l2DCpbleJaA2Bt+hNlM5I
	 cd4YmlLcgzC3j9WWnRPek5vrFrUou6IGVjWEpYjodbP694L4zylJVB21AEeovJ9k/U
	 1WTlb7wRsGnnDUwH7vtz+BgyfvOlAXvGYDPvFIoVdNLJFL35wrRt+SlTQARxj3cRe7
	 qkW4990w8UH/A==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4KlBWH6DrHz7w7k;
	Fri, 22 Apr 2022 13:09:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
Received: from mx2fa3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4KlBWH0zyhz8shG;
	Fri, 22 Apr 2022 13:09:31 +0200 (CEST)
Received: from webmail01.netcup.net (unknown [46.38.249.153])
	by mx2fa3.netcup.net (Postfix) with ESMTPA id 9709E14004A;
	Fri, 22 Apr 2022 13:09:30 +0200 (CEST)
Authentication-Results: mx2fa3;
        spf=pass (sender IP is 46.38.249.153)
 smtp.mailfrom=matthias@extraklein.de smtp.helo=webmail01.netcup.net
Received-SPF: pass (mx2fa3: connection is authenticated)
MIME-Version: 1.0
Date: Fri, 22 Apr 2022 13:09:30 +0200
From: Matthias Klein <matthias@extraklein.de>
To: luca.ceresoli@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] gpsd: bugfix: add gps-utils-python to PACKAGES
In-Reply-To: <20220422115938.776ffbd6@melee>
References: <20220422083247.1322-1-matthias@extraklein.de>
 <20220422115938.776ffbd6@melee>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <25c9ad816e7fbda2286eb0c8d5bed4cd@extraklein.de>
X-Sender: matthias@extraklein.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <165062577081.26776.2994029528237755291@mx2fa3.netcup.net>
X-PPP-Vhost: extraklein.de
X-NC-CID: b6ZSyyZIsiSoEpi67nCsYj2WDQ3p6VIHSGtijRqt0KbEP6vE4NY=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164787

Hello Luca,

> This file is not in oe-core. This patch should be sent to the meta-oe
> mailing list.

Done: https://lists.openembedded.org/g/openembedded-devel/message/96734

Best regards,
Matthias

