Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7725C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 16:08:22 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.12992.1648483701218647695
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 09:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jRMir8Cj;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 10A40240005;
	Mon, 28 Mar 2022 16:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1648483699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hr5BTJwjBgYd0uRVa7AvSOMjRuDjxdbUpFd68gTei+A=;
	b=jRMir8CjrLk7/CfGGKgbwCxHfx6VosHxmfut0MKWXccj6bdb8YWGKsumjwxEtvnwLgZ3Aj
	+zZG4IX1zkkedmjqlKXRRDXP02YdYatl9l+cLbhzJc+2tphX00adwUi7V/t57Jslco7I5r
	fxKCh51zOINcZBJuTDWEbdA5siFlu8Z1pwJIiZ8LbAuOtZGwz4MHHGTnhvjRkEAeHJ3WBi
	F38kLVLMpgh4XJ8G78oDhP+BsMTp+x0NW6FbxChdig43RfLrv5bEwQXAuieChCx+Kr4gR4
	KkUTmHpCEkTSy+BTdDRax3BKhHdQKo9qhWVb53ibaTt8mte7yktxVfjvG9Z81A==
Message-ID: <1f6c9456-2896-2e60-7dfe-b88420cf97c3@bootlin.com>
Date: Mon, 28 Mar 2022 18:08:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [OE-core] [PATCH 2/2] mount-copybind: add
 MOUNT_COPYBIND_AVOID_OVERLAYFS env var to skip OverlayFS
Content-Language: en-US
To: Luca Bocassi <luca.boccassi@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20220325184032.1880706-1-luca.boccassi@gmail.com>
 <20220325184032.1880706-2-luca.boccassi@gmail.com>
 <2c8e51a2-fd18-9781-7686-21d7a5376443@bootlin.com>
 <0b46c32fb91e47f1e561a29d323f231bc59684c1.camel@debian.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <0b46c32fb91e47f1e561a29d323f231bc59684c1.camel@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 16:08:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163715

Hi Luca,

On 3/28/22 17:32, Luca Bocassi wrote:
>
>> Thanks for the patch!
>> Now that the patch is merged, would you mind proposing a patch to add a
>> description of it to the documentation? You'll probably do it better
>> than I would.
>>
>> Thanks in advance
>> Michael.
> Sure I can do that, where should it be listed exactly?


Great!
Well, I was thinking about adding an entry to
https://git.yoctoproject.org/yocto-docs/tree/documentation/ref-manual/variables.rst
corresponding to https://docs.yoctoproject.org/ref-manual/variables.html

However, I'm starting to have doubts as "volatile-binds" are not even
documented. Is this new variable meant to be used in the configuration
file? If so, it probably needs documenting, but it's nice when a
variable is either attached to a bbclass or is introduced in one of the
manuals too.

Ideas anyone?
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


