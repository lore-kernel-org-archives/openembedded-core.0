Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B7CAC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 10:36:49 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.6305.1667903802633172576
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 02:36:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=V36Lb4A6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7923C60009;
	Tue,  8 Nov 2022 10:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667903800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Crxi5gywdkA4R2Bj3LCB6BFVCipQTkD+3M/gmhnt3YI=;
	b=V36Lb4A6mFqZJ2vLZFDYpIJlVwwiy3sFZIT2nQMs8jWJOqsmFkE8ezpRVzDuS+LO7eQH+l
	S7N4Pvxi38CVXSKWJ9LBL/CFcjv03VJGNBGCAqeT54pRuGTm5DWwEXE30YKVklcrC7gcVa
	BmvTf73AYnBhEppUCUv9hW3LemDIuTNgNW17gGboNwcUO45reweHuqnUFkqH+0maj91IQD
	XADXHoXQK57KNkpdV+U8FgegiBsc5XXiyjiZ/7hZPf/HUkh9ezmuGqoN+9eogTNwxUv6Bg
	oYEe+3O1Y6Q19j8S7cx+JttX2KDZvqDjfMlLl+xu9FeX7dWnVPpWWhf7IfwAzQ==
Message-ID: <935fefd6-3746-56f4-0f9e-21f3f505f629@bootlin.com>
Date: Tue, 8 Nov 2022 11:36:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: Re: [OE-core] [PATCH] mirrors.bbclass: use shallow tarball for
 nativesdk-binutils
Content-Language: en-US
To: ecordonnier@snapchat.com, openembedded-core@lists.openembedded.org
References: <20221107095119.965403-1-ecordonnier@snap.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221107095119.965403-1-ecordonnier@snap.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 10:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172958

Hi Etienne

Many thanks for the patch!

On 11/7/22 10:51, Etienne Cordonnier via lists.openembedded.org wrote:
> This is useful e.g. when using meta-clang, which introduces a dependency to nativesdk-binutils when
> populating the SDK, and then a full tarball of binutils is fetched additionally to a shallow tarball.
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>

However, there's a problem with the way your patches are received on the 
Yocto Project mailing lists though. I used to have it too.

If I apply your patch through "git am", the author of the commit will be:
Etienne Cordonnier via lists.openembedded.org 
<ecordonnier=snapchat.com@lists.openembedded.org>
instead of
Etienne Cordonnier <ecordonnier@snap.com>

That's because of the configuration of the Yocto Project mailing lists, 
if I understood correctly.

Because of this issue, the maintainer has to manually fix this field 
when accepting your patch. Worse, if he doesn't catch this, that's 
harder to fix afterwards.

You should be able to fix this by running:
git config --global sendemail.from "ecordonnier@snap.com"

This should add a "From" field to the sent patch which "git am" should 
be able to match with your name.
At least this worked for me. See 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_using_git-send-email

Could you try to send an update (don't hesitate to send a private one to 
me first)?

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


