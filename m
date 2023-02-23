Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B88C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 17:09:51 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.16534.1677172187493012147
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 09:09:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pe5EtUWC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 87492E000C;
	Thu, 23 Feb 2023 17:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677172185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=17L6rip8e5+eE5qT+OyhlewlmPT7kCtSlLcMjPEshgg=;
	b=pe5EtUWC9lB8NRMHSgL7oe+9de0HFkZa6YwnDBBPQ+8MZMLWrmsNn3ue82Bz0xhe69h3XL
	h0H+3BSVg99/v3W0z7gaBSoiHeYzGfiIb8+fMehKhHuI20kue11B4yFjNsvUxnhasNqUDI
	jJy65GOTuYD2zerpHHfyE7ikL6DUlxhSsfeZIT7IPAmgV+zVRZ3drzyeUil8SJB3K4n2Kb
	VIgkjVQqHaGlLCMfshG+99B7lG2xsRyn7uYxnZarzDuZ4Sv093+ROPp3d1BA1JOqTKrv+w
	RbjV1vH5M7oJO20J9XSToG21/iuuahonK+snv2xI2Xp53Q95dqOkv/oDwYEpCw==
Message-ID: <66b9a05e-00fe-a3f7-82e1-2cb9459d87f8@bootlin.com>
Date: Thu, 23 Feb 2023 18:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Difference between INIT_MANAGER="none" and INIT_MANAGER="sysvinit"?
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 17:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177616

Greetings

I'm trying to document the possible values of INIT_MANAGER.

I'm using the master branch of Poky, and whether I'm using 
INIT_MANAGER="none" or INIT_MANAGER="sysvinit" in conf/local.conf, I'm 
getting the exact same "core-image-minimal" image (it's not even rebuilt).

Anyway, ./meta/conf/distro/include/init-manager-sysvinit.inc and 
./meta/conf/distro/include/init-manager-none.inc look very similar and 
even seem to be equivalent as I'm getting the same image anyway.

So, what's the use of INIT_MANAGER = "none"?

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


