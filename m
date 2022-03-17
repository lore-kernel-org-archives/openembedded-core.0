Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88B9C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 09:35:25 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.8291.1647509723785328589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 02:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Cu/8pV2G;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D6C221C0008
	for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 09:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647509722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=guKc3SXcphBCTFq7rBnwdJtQ2dYPq37swTPBTDvIy/M=;
	b=Cu/8pV2GG75hUgjxkr2MfurlBpKuaWbglXgPGTXLpRTZFLlro41Kb+E8SZP3vK5bODyrKF
	NgB3OZhK1vsc/TsRPgLA9QIEUV0ksjXs6ZFOfDEjAqEwI2Jcd1PJVMfsRqb/8zoofXztTs
	CSOmlhHzXt9dnX4pzc7BI41d4z3JHNswq4AN5856dLhmJWVgXT7t5KPoc8n17IXm4/Xk/3
	UD8ijdFpKSWWrrvfVdKlkEeXJi8jvw9tVINmln66mGNcSe6BqfXErxxHMV7pS5Y7QfTiM7
	n9q/9l5ohRZjbPGijmDt5Uv/o5AIv687OxhA9gKH6x74IySrgGKuwnMsWacs3w==
Message-ID: <d54721ab-03a8-9c80-0445-17c7d76d6570@bootlin.com>
Date: Thu, 17 Mar 2022 10:35:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] Patches sent to mailing lists: "From" attribute
 modified
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>
References: <16DCF6055FEB6DC7.29979@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <16DCF6055FEB6DC7.29979@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 09:35:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163378


On 3/16/22 21:21, Michael Opdenacker via lists.openembedded.org wrote:
> Greetings,
>
> My patches sent to the mailing lists are causing trouble for Richard.
>
> The reason is the "From" field is modified by the mailing list server. It's
> From: "Michael Opdenacker via lists.yoctoproject.org"
> <michael.opdenacker=bootlin.com@lists.yoctoproject.org>
> instead of
> From : Michael Opdenacker <michael.opdenacker@bootlin.com"
> in my original patch.
>
> And then when you try to apply the patch with "git am", you get a
> modified committer name. This makes it harder for Richard to apply
> patches, otherwise you get commits such as:
> https://git.yoctoproject.org/poky/log/?qt=author&q=via
>
> If I understood correctly, the problem happens because we had to enable
> DMARC on our domain (bootlin.com), because of a storm of spam messages
> claiming to come from our domain. Otherwise our legitimate e-mails were
> getting blocked by Google Mail.
>
> Richard recalls that someone once found a workaround for this issue. Did
> any of you ever face this?


The problem seems to originate from the behavior of "git am"... As its
manual says (https://git-scm.com/docs/git-am):

"The commit author name is taken from the "From: " line of the message"

... and there seems to be no way to override this behavior.

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


