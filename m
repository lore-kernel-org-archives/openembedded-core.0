Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B2BC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 20:21:07 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.1803.1647462065438614076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 13:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=htXzDHGu;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9133D240002
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 20:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647462063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PuKnUM/ZQjnJ4oqEPR0ViGdC3vGUYEo6Lmr70ikroM8=;
	b=htXzDHGuIayJvLf/xTkLvjDYoWy8H6sw1Qn+kkLVJwX0+gl5bimmjUiyCLEV5E1OONrEj2
	VNE1dS9H74CtDo/NKqTKYT19p+/xlaYOtIYUdYFv032TjmWWXIy2dTwZWD6ESI9XnauGVK
	kd/OHKa796qdTNO481wAVtkC6t77oI2NxC+DvECyi2nSE8H67JozHSMgxoN050Fwt9FoDb
	Yt/7LBiW/Dsw9rYI2/d7Bz6kXz1c3UeHuUAurK0DNytCQHY/e+W2x2OR+nkLO0nMo2xJcm
	F5FMZlNPH76lMi+EsWbkt6fHoGH6dhkMcLDJW/HkqvFbGhu1lEpw9UrAdLSKlA==
Message-ID: <2593ef46-de63-013a-dbc3-5b626e289fdd@bootlin.com>
Date: Wed, 16 Mar 2022 21:21:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Patches sent to mailing lists: "From" attribute modified
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 20:21:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163355

Greetings,

My patches sent to the mailing lists are causing trouble for Richard.

The reason is the "From" field is modified by the mailing list server. It's
From: "Michael Opdenacker via lists.yoctoproject.org"
<michael.opdenacker=bootlin.com@lists.yoctoproject.org>
instead of
From : Michael Opdenacker <michael.opdenacker@bootlin.com"
in my original patch.

And then when you try to apply the patch with "git am", you get a
modified committer name. This makes it harder for Richard to apply
patches, otherwise you get commits such as:
https://git.yoctoproject.org/poky/log/?qt=author&q=via

If I understood correctly, the problem happens because we had to enable
DMARC on our domain (bootlin.com), because of a storm of spam messages
claiming to come from our domain. Otherwise our legitimate e-mails were
getting blocked by Google Mail.

Richard recalls that someone once found a workaround for this issue. Did
any of you ever face this?

Thanks in advance
Michael.



-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


