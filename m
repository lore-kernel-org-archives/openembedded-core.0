Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B39ECCA479
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 14:26:45 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.55790.1656426398021815484
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 07:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=L2wdUHfW;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A2A01240014;
	Tue, 28 Jun 2022 14:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656426396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mE5xJ3Ci0CXypCyNeEU5QlQvmC3OQlwG2sAzQVZhOrM=;
	b=L2wdUHfWWzSI6dRYWP74MTSfSWg6i7a/Btas3YD9YEz0CJ0TA52NrZLoWsOf+SG6BAb7gY
	QPH0lMlNnXImdXiIakjgs5WqL+E17RJ34uB9gwiWVdVTu7rpDiW5dWUSnX78IQukHhBctM
	JDrSEH9RTbnbK9aclWUVVx4K3GNb4InV6FW3PgQ3/P3hu0p/rnLY0LZ2r1xIRIFQNHJVj7
	6tljgEnuySVybim+8wtS3D1vujY8mC9C6bOX6CcsuZuP5QU5Qi/qjBkhVrVHT4qhriSjPq
	Po/wodq1aNsmkHqR058MmQB7iX9BWr+PbgY/+vM0Jili7HpDfIIJxtLZkRsmfw==
Message-ID: <56828337-19fd-d032-dda8-83ffe7396623@bootlin.com>
Date: Tue, 28 Jun 2022 16:26:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>,
 Yocto <yocto@lists.yoctoproject.org>
Subject: Re: [OE-core] Announcing pkgexp
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
References: <29D9E4D8-7C19-4967-8681-0633D670B1AA@arm.com>
 <3e2f8efd-8bca-425e-065a-33035c0f1632@bootlin.com>
 <CE736DC4-765F-451F-98CB-B486A1AE1221@arm.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CE736DC4-765F-451F-98CB-B486A1AE1221@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 14:26:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167346


On 6/28/22 16:24, Ross Burton wrote:
>
>> On 28 Jun 2022, at 15:11, Michael Opdenacker <michael.opdenacker@bootlin.com> wrote:
>> Hey, this looks very nice and very easy to use!
>> One minor complaint, though: the "What Depends on" button didn't immediately catch my eye.
>> Would it be possible to show such reverse dependencies in the same way you show RDEPENDS? The result may look better and everything would be on the same page.
> The immediate problem with that is that for some packages, like libc, the reverse depends list can be huuuuge.  If the page is redesigned to have scrollable regions then sure.  That would likely involve someone more skilled in web design than me getting involved ;)


Understood, this definitely makes sense. Forget it!
Cheers
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


