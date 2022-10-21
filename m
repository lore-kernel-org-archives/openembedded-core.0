Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC42C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 16:24:48 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web09.11859.1666369482820652191
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 09:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JSEQ9Go7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 94727E0009;
	Fri, 21 Oct 2022 16:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666369481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YdYOdyw6kmnb2LsB6EwQm+CfwFpjlnbiawEW5Mf2pnI=;
	b=JSEQ9Go76pKlOk+K+W+MoYmGIkKDk5UiGtJN1vqiWXwk83Plv6XOnBjyifQISjhxpH9Ih1
	Z6RGZNPnjbzX7CyV6F+fv9EEUccCl/ZtenFcPCVJNlId/XbjCdjuXP0DS13akJW+onHU49
	9YXYJBrwXMNEWcIEWrG4fM1KPjn5yiuJs8c7Zw+IgVAOZJqri8nUw1WR8sCHIUO4Oo1G2S
	TTJVrU+5onmhwr+kwwdyjAnf2i1nO9x+8Kzp6HzNnb+3M4kJUuYeGIAxMDOMMGvXxPNooc
	1FxP4I6DHbbX2s2k5l8o5JEWLeSHAKvsQJIwmMRK4AftvgC2NzPn9UdxHy+Ciw==
Message-ID: <f39014e0-6847-fcd0-f6d7-142cb3658a58@bootlin.com>
Date: Fri, 21 Oct 2022 18:24:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] openssh: Install internal header/lib files
Content-Language: en-US
To: wltu@google.com
References: <IAS2.1666358226748943797.wkAx@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <IAS2.1666358226748943797.wkAx@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 16:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172035

Hi Willy

Thanks for the patch!

On 10/21/22 15:17, Willy Tu via lists.openembedded.org wrote:
> Install API only if opensshinternals is in DISTRO_FEATURES.
> Install the OpenSSH header + lib files for other repo to build using it.
> For example, https://github.com/google/hiba is dependent on those files
> to build and this change is needed to meet that requirement.
> https://github.com/openembedded/meta-openembedded/pull/597
> Signed-off-by: Willy Tu <wltu@google.com>
> ---
>  meta/recipes-connectivity/openssh/openssh_9.0p1.bb | 11 +++++++++++
>  1 file changed, 11 insertions(+)


There's a problem with the way you send your patches though. I used to 
have it too.

If I apply your patch through "git am", the author of the commit will be:
Willy Tu via lists.openembedded.org <wltu=google.com@lists.openembedded.org>
instead of
Willy Tu <wltu@google.com>

Because of this issue, the maintainer has to manually fix this field 
when accepting your patch. Worse, if he doesn't catch this, that's 
harder to fix afterwards.

You should be able to fix this by running:

git config --global sendemail.from "wltu@google.com"
This should add a "From" field to the sent patch which "git am" should 
be able to match with your name.

At least this worked for me. See 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_using_git-send-email

Could you try to send an update? You could send it to me again through 
private-email first.

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


