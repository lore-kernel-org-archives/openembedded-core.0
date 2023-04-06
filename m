Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED65C77B6C
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 20:53:57 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.169989.1680814434438955197
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 13:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ld7OTsCR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 45BB440005;
	Thu,  6 Apr 2023 20:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680814432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HH7KQCBmU+szGWsGe8nVoJX1BPoJFXoli+WZGhvt/Zc=;
	b=ld7OTsCRlLtQUWS/2694dAlz6viht9Mq2knTFJ6udy4xpIZCPd1BRJyQ6M0lUiZT/fBaPY
	mcPWr6ukaw//ewAZu7esGjEXvgP4AFpKZk3A3ndxx+6FZHek+xaB5g/kcj9o4UK2ZCko87
	qkbtlXLOZMKRVAyTHZsZTyI8eX/mevBmOFblh85llbc6JCDrzy49pMcGeYxSxqnfqrQ+cY
	5wS5wZpCu28OjQhRTxrGUtGqGsc6zY7ANCzJNE2bAZT5Sixnwweee6w0/S3n3GRELRNLmb
	BaW+zIZuTDAlMAXgv98x8etpE2NlWB0QetmI6H4ayFBLoDYTEi8+QgycnNOIIQ==
Message-ID: <1a1b7d4b-8273-2c7c-d55a-ed9e1bef1e6b@bootlin.com>
Date: Thu, 6 Apr 2023 22:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [OE-core] [PATCH v2] migration-guides: update 4.2 migration and
 release notes
To: openembedded-core@lists.openembedded.org
References: <CA+cAkepkVZJ-WsrFeZ8Y7+=95CwD4Fu9e5ddD7WJaWnMjSs5Qw@mail.gmail.com>
 <20230406091254.248215-1-michael.opdenacker@bootlin.com>
 <927715c9e53832471789990ddccaba4cfc77c3ca.camel@linuxfoundation.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <927715c9e53832471789990ddccaba4cfc77c3ca.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 20:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179806


On 06.04.23 at 12:12, Richard Purdie wrote:
> The ptest images have changed structure in this release. The underlying
> core-image-ptest recipe now uses BBCLASSEXTEND to create a variant for
> each ptest enabled recipe in OE-Core.
>
> For example, this means that "core-image-ptest-bzip2", "core-image-
> ptest-lttng-tools" and many more image targets now exist and can be
> built/tested individually.
>
> The core-image-ptest-all and core-image-ptest-fast targets are now
> wrappers that target groups of individual images and means that the
> tests can be executed in parallel during our automated testing. This
> also means the dependencies are more accurately tested.


Thanks Richard. This will be included in the next update I send.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


