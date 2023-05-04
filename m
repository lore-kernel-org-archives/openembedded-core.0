Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41446C77B78
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 14:54:37 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.52407.1683212074371436179
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 07:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HlGPkaPu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 460A7E0007;
	Thu,  4 May 2023 14:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683212072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dHPmzRR02AsJpakCQG5YRL51o7KKHYxFKKzcSOE7NJg=;
	b=HlGPkaPukTmUBWr51frKQuMQrPK6hkD3gKxHTSjNSqL4PEUG2dV4aiCVlBvK8XEG/yYogh
	oiYwaf0zrdaQMdQXdDz2oo6ekVg4iyDwR+KR0AWdEHJZClY3gEb/XsdiZP+4v9IxW1Pe72
	Y0gj70X7WW2Eum6pHyxggpqF/9LlEq8IkE81s454DxdWqt1xXokJjYyI179Jbjdfwx0WSu
	7K6jRAs+ZfSk+kOJBi54AQuBDPJ60DLMuaSg5iPGxW/CaP+9sOgqQVa9bV4H/C0dLOL+qo
	+b23gQ2H3EZD1wJd3eykmmVlG0a/uQaCqiLDsTdSBmUZ4rwlCM3ug+wtg2GJ0g==
Message-ID: <486ec5bb-7f56-c2e4-62da-169e39c0b137@bootlin.com>
Date: Thu, 4 May 2023 16:54:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: Josef Holzmayr <jester@theyoctojester.info>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [Yocto-Advocacy] Yocto Project Community Manager updates
Content-Language: en-US
To: Nicolas Dechesne <ndec13@gmail.com>, yocto@lists.yoctoproject.org,
 yocto-advocacy@lists.yoctoproject.org,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: <CAOT3mi+DorC4uSqCwO7HmmFVuXX3BLFWJNp_o-NH4OmqP=6ZSg@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAOT3mi+DorC4uSqCwO7HmmFVuXX3BLFWJNp_o-NH4OmqP=6ZSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 14:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180878

Dear Nico,

On 04.05.23 at 16:40, Nicolas Dechesne wrote:
> Dear all,
>
> After five years, I have decided to resign from my position as the 
> Yocto Project Community Manager. I joined the OpenEmbedded community 
> around 2008. I have fond memories of my early days, and still remember 
> some of my first interactions on IRC and mailing lists! This is a very 
> welcoming community, always helping new people with patience and 
> kindness. Serving the project during the last five years is something 
> I am very proud of, and I will be forever grateful to all of you for 
> accepting me!
>
> During these years, we have gone through a lot together, the pandemic 
> gave us an opportunity to rethink how our community should come 
> together. Setting up our Virtual Summits has been a lot of work (and 
> stress!) for a group of few people, but the never ending success of 
> these events has been very rewarding! Our online presence in social 
> media has dramatically improved, and allows us to reach out to and 
> interact with our community faster than ever before!
>
> On the side of all the technical changes, and releases, we have also 
> established the Yocto LTS process which was a recurring request from 
> the community and has become a strength of the project! We also 
> revamped the project documentation to make it easier to maintain and 
> contribute. The Yocto Project documentation is such a great resource 
> for our community! I have spent so many hours on these PDFs in my 
> early days!
>
> Anyway, let’s not focus on the past! The future looks bright and I am 
> really excited to announce that Josef Holzmayr has accepted to take 
> over the Community Manager role. Josef needs no introduction, he has 
> been a key member of this community for so many years. Thanks to 
> Josef's relentless efforts, we have grown our social media presence on 
> Youtube, Twitter, LinkedIn and Mastodon! His energy will be a great 
> source of inspiration for this community! I wish Josef and Yocto the 
> best for the years to come, and I am convinced this community is in 
> good hands and that Josef will be a great community leader!


Many thanks for everything you did for the project, and are still doing 
for the wider embedded Linux community. You will be missed here but I 
hope you will still be around.

Now the bar is high and Josef is expected to stay as an official 
Community Manager for at least 5 years ;-)

Thanks again to you Nico and thanks to Josef for taking over!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


