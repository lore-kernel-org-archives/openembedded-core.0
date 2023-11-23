Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBD3C5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 21:07:40 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.107934.1700773653799074873
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 13:07:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=JMCunf0c;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3DB7686BA8;
	Thu, 23 Nov 2023 22:07:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1700773651;
	bh=8jqxJMDZdDQpp6Zu+NwwjwbeU4ZuJ8dsYlbYsf1Pvy0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JMCunf0c8JC2Nvcocjuc8bfK+Stom/evLNKXYy7UTkny+mvpZyWaKekZRaa1YoSmA
	 M4umfXsyYgnFkeQJ5NrqlmWw1eq+2WCIFb6X7ukZOJO+0eGL5ct9pV4zqht8+F3scD
	 pWAQ34vpnSpcZ61FyqZ+KG63UHRCka0VQNfbyayElt38oYjIXHUjPe+UEeWgyPTY/5
	 ubMPf6W9Xxkug/iH3n/BZE130Rl5JNXW+cpdn38U4Y5A37vyoFLAR+TMzvR7Zxuf+/
	 BioPRr9qRX9s+UtUEadC8XII3mKA3I8hUE3ux2EPSRbKNAY9aPbIbTM8PBcIBTrVo3
	 g3CZZ0ZBUjRPA==
Message-ID: <f5a8fb84-42cc-432b-8704-9b058be25835@denx.de>
Date: Thu, 23 Nov 2023 12:49:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] Revert "lzop: remove recipe from oe-core"
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Ross Burton <ross.burton@arm.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20231123004605.82598-1-marex@denx.de>
 <CANNYZj8s99epW6DxAmNzW=70P_0ksoAntN3bVbUu6ehR=tkcpg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CANNYZj8s99epW6DxAmNzW=70P_0ksoAntN3bVbUu6ehR=tkcpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 21:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191175

On 11/23/23 09:26, Alexander Kanavin wrote:
> I'm not sure I agree. It's totally ok to depend on things that are not
> in core, if they're not enabled or tested on the AB by default, and
> what layer they're in is well known (meta-oe in this case).

The lzop is called in oe-core and I was under the impression that 
oe-core shouldn't depend on anything except bitbake . So either this 
stuff should be moved to meta-oe too (which would be unfortunate growth 
of dependencies) or the lzop should be reinstated . I would obviously be 
in favor of the later.

