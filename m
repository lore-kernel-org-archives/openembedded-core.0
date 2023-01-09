Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034D2C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 17:42:00 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.79459.1673286116246059187
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 09:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GDCYPNrU;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F165C240005;
	Mon,  9 Jan 2023 17:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673286114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eQjNwYT7HfYRUFHhoFJWQbfwTJdf4QQCwPXcA/5Rs/A=;
	b=GDCYPNrUadsplLzi6YrrP8OGSf6hEwNpddAGC+eXwZBeCUBuABGFenFETkIKZAoHgwCCKW
	cwnJSmQtkTytXbLX68eklvrkcbAMxT78pLtOce/GKvDhkmo7I5urPv1zLZHqO+3UyZ9m2S
	pcAvmin/5veC83U8uX3zWLa3GfAjmYtlEkqpZJuQXlpcKvTlnBvee/QdJx5AVhBK2+IDi3
	C50pF8GqUT7/kNW1T3JrRMBkS9ncH5TW2pv1qzNlkXJ3R/MK0TqKCsaqiWDONo84opT2Mk
	j93lyAkCKc0OYHHB7cbR+pOEc1g/nsbvHlIyyQqk/XW7AXWu0dYmV/IQZtSSiQ==
Message-ID: <a10e9f36-9020-ecbc-d292-5a9aa1df6830@bootlin.com>
Date: Mon, 9 Jan 2023 18:41:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: ranjitsinh.rathod@kpit.com, BINDU <bindudaniel1996@gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] qemu: Fix CVE-2022-4144
To: openembedded-core@lists.openembedded.org, bhabu.bindu@kpit.com
References: <20230109093241.19105-1-bindudaniel1996@gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230109093241.19105-1-bindudaniel1996@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 17:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175694

Hi Bhabu (I hope I got your first name right)

On 09.01.23 at 10:32, BINDU wrote:
> Add patch to fix CVE-2022-4144
>
> Link: https://security-tracker.debian.org/tracker/CVE-2022-4144
>
> Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>

Many thanks for the patch!

However, it is sent with an incomplete identity.

If I apply your patch through "git am", the author of the commit will be:
BINDU <bindudaniel1996@gmail.com>
instead of
Bhabu Bindu <bhabu.bindu@kpit.com>

Because of this issue, the maintainer has to manually fix this field 
when accepting your patch. Worse, if he doesn't catch this, that's 
harder to fix afterwards.

You should be able to fix this by running:
git config --global sendemail.from "bhabu.bindu@kpit.com"

This should add a "From" field to the sent patch which "git am" should 
be able to match with your name.
See 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_using_git-send-email

Could you try to send an update (don't hesitate to send a private one to 
me first)?

Thanks in advance. This makes life easier for our very busy maintainers.
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


