Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B483C001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:18:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.21777.1691684298767212245
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aZRl6XFl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4C7EFF80B;
	Thu, 10 Aug 2023 16:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691684297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/Hf0/akeIpGpnuayVNeX8IRHB9W/a5uyAaIKLJ/3qU=;
	b=aZRl6XFlqRoi/+Qr4kAteXYbmZ+g3ty/UFYN/KuTSeiEkgBOl5JE7pyahyycPyxsgZrsNX
	79bGlNDMvy1CDADqzfIhSxDfEckze/A8Vg3P0pG2ZLP1mRiosIeOL/mDGxGQs5cZFFaGLH
	ut7V1aDHhuH0MzxtD6mY1mOgK7RgjTR/V7FuX+mD8QddaiL6HHgf1aYB1SgPaImrcT25Gn
	Cr4aZ5oPaecF4zmwt6F8clLulDuoLzQMIUJvWK2d3bOdLOeXhK/11D2np8Hu7w2+o0R3ZW
	zxDhP5lrKV/GudlwivrsjKvgTjVnw+ST/ujfZgOQe9AAXtwbokdVq1B5isqsIQ==
Message-ID: <115b6810-6f0c-9682-d8aa-bd6a1fcd93f3@bootlin.com>
Date: Thu, 10 Aug 2023 18:18:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][mickledore 00/37] Patch review
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185800

Hi Steve,

On 10.08.23 at 18:03, Steve Sakoman wrote:
> Please review this set of changes and have comments back by
> end of day Monday, August 14.
>
> Passed a-full on autobuilder:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5711
>
> The following changes since commit dc4099307100de817110958c9426ced4189fd0ac:
>
>    util-linux: add alternative links for ipcs,ipcrm (2023-07-27 04:32:06 -1000)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut


To update supported distributions in the Mickledore documentation, I'd 
also need to have this patch merged in the "mickledore" branch of 
"meta-yocto":
    - [poky] [PATCH] [mickledore] poky.conf: update 
SANITY_TESTED_DISTROS to match autobuilder
      https://lists.yoctoproject.org/g/poky/message/13118

Could you take care of it too?

FYI information I also have the same changes for Kirkstone and Dunfell:
    - [poky] [PATCH] [kirkstone] poky.conf: update SANITY_TESTED_DISTROS 
to match autobuilder
      https://lists.yoctoproject.org/g/poky/message/13119
    - [poky] [PATCH] [dunfell] poky.conf: update SANITY_TESTED_DISTROS 
to match autobuilder
      https://lists.yoctoproject.org/g/poky/message/13120

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


