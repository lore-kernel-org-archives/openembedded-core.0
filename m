Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A39C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 16:49:57 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by mx.groups.io with SMTP id smtpd.web10.123.1664988590193362994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 09:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ne8Xe308;
 spf=pass (domain: bootlin.com, ip: 217.70.178.240,
 mailfrom: michael.opdenacker@bootlin.com)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 58DCCCF7B8
	for <openembedded-core@lists.openembedded.org>;
 Wed,  5 Oct 2022 16:03:47 +0000 (UTC)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7DAC7C000F;
	Wed,  5 Oct 2022 16:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664985823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9cO+1gnDKienIbmuqtB57GVNdEuBkDEKkJB2bAy7Gd4=;
	b=Ne8Xe3088PdbV41HMcQjnVxsVDeQd3N/3YWomg27osw4HTAgDcxoGXYKjQL0Fn55WgXV4S
	Bbb/nJW5RvD/1PU6IbVNWLb5bB9EW7LYns/ITeaOy2EC6waBrlLRIFeN9iHQpL9AJjmjzw
	hDlifRhMQEWt+i4KwFMy5MiB+HLaw9sGG+PrZdx00a2VHb2eLABwi/ZL6Q+C+5FZQNdk73
	HrsqZVYIBjErArnyOqXYBWUwY4qDyEJltPT6WpWy1rux0Z7hPZma3zczGu1EDa45x5kNGH
	D2lPznVuy8hA0p6k+QYd2z1j9cjSKlcJs21dPEcdXHQnqkTVL6FEggZZtvBZJg==
Message-ID: <f2f9731b-7a35-d29e-75c7-6b69d7ffc4ee@bootlin.com>
Date: Wed, 5 Oct 2022 18:03:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] psplash: add psplash-default in rdepends
Content-Language: en-US
To: thomas.perrot@bootlin.com
References: <20221005145712.2528771-1-thomas.perrot@bootlin.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221005145712.2528771-1-thomas.perrot@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 16:49:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171466

Hello Thomas

Thanks for the patch!

On 05.10.22 16:57, Thomas Perrot via lists.openembedded.org wrote:
> Otherwise when the installation of recommended packages is prevented
> (NO_RECOMMENDATIONS = "1"), then splash screen will not be cast.
>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>


There's a problem with the way you send your patches though. I used to 
have the same one.

If I apply your patch through "git am", the author of the commit is:
Thomas Perrot via lists.openembedded.org 
<thomas.perrot=bootlin.com@lists.openembedded.org>
instead of
Thomas Perrot <thomas.perrot@bootlin.com>

Because of this issue, the maintainer has to manually fix this field 
when accepting your patch. Worse, if he doesn't catch this, that's 
harder to fix afterwards.

You should be able to fix this by running:

git config --global sendemail.from "thomas.perrot@bootlin.com"

At least this worked for me from the same domain ;-) See 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_using_git-send-email

Could you try to send an update? You could send it to me again through 
private-mail first.

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


