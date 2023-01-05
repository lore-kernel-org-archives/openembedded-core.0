Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D371C3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 09:12:20 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.8934.1672909938529006071
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 01:12:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Khtwu+tG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9C7A72000B;
	Thu,  5 Jan 2023 09:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672909935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gC8zUpFokaDmvL7MUDUOhddViXoQwLCtdcl0yRSziXc=;
	b=Khtwu+tG9SjLD2HllhVKCcuvQQBQ+MygTR/eE4RHptmZYH9HLovxgUTRgf1LkhWkHQmrzv
	7Y45F1tE87b+RRFW4AiDlvQRGurPrRzMH+QVjOa/5H2DBMrmWH7XkY2CnOfMr9fD2YlfIL
	5dLTM5kkHvirkXBK88soRxJ+wjHkJ3v7pZGuTlgd5zCP9i8yCwS9Awh3S1QAFBihPdtDbj
	mqbbaUicoFppndQrZ1lpCoIeceYHdlPjrcLS7IdfU12lNdhQoRPV8TU5iOw94fSLlNNoeJ
	yw16GCl+ruW/4aEdxJXuz8ZAEHOYwLmvmQiF94HhZE3c4+5T0omG9uIIsYtA7Q==
Message-ID: <6ade9c89-7e12-2f1c-c9d4-0d7beb4f3853@bootlin.com>
Date: Thu, 5 Jan 2023 10:12:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: mark.hatle@kernel.crashing.org, openembedded-core@lists.openembedded.org,
 bruce.ashfield@gmail.com
Subject: Re: [OE-core][PATCH v2 1/2] kernel-fitimage: Adjust order of dtb/dtbo
 files
To: sandeep.gundlupet-raju@amd.com
References: <20230104220902.1530659-1-sandeep.gundlupet-raju@amd.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230104220902.1530659-1-sandeep.gundlupet-raju@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 09:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175517

Hi Sandeep

Am 04.01.23 um 23:09 schrieb Sandeep Gundlupet Raju via 
lists.openembedded.org:
> The dtb files must be before the dtbo files, otherwise the overlays may
> not be applied correctly.

...

Thanks for the patch updates!

There's a problem with the way your patches are received on the Yocto 
Project mailing lists though. I used to have it too.

If I apply your patch through "git am", the author of the commit will be:
Sandeep Gundlupet Raju via lists.openembedded.org 
<sandeep.gundlupet-raju=amd.com@lists.openembedded.org>
instead of
Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>

That's because of the configuration of the Yocto Project mailing lists, 
if I understood correctly.

Because of this issue, the maintainer has to manually fix this field 
when accepting your patch. Worse, if he doesn't catch this, that's 
harder to fix afterwards.

You should be able to fix this by running:
git config --global sendemail.from "sandeep.gundlupet-raju@amd.com"

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


