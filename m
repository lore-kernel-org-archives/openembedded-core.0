Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66661C001E0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:29:37 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.22031.1691684972754328703
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Bp7ml7QH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A41F1E0002;
	Thu, 10 Aug 2023 16:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691684971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ylijHMCCvmm3Lz0xf42F/Xik/Q8i4EqRR/Pcx7iOHNk=;
	b=Bp7ml7QHanCCGUWHEjEIn0/neUZnW8yWuFBJ5+jb+ky/DSRyRrmz02YqDBt8fR4IfFlWua
	h5sw4FUZD+2fWiGp2NfJ+YFeSlLKyvHRrlp3m4OBIdm1y5IH/bvoTPBJTFDLu8DVl9fQJW
	z2N01EWsEY6TRWppPN2xOyuAwCMUyvFak4jFULexrT0UbLrjOXI7SN+/7268tXp9tHPv7+
	LZsKK9Msdhr6pMMUofCjENtcNGqE38XBUJSXTJfzLKojsXGiIEQtYbbfqPL4rNObK0uDi+
	ntdbk4ekDpdW/LknP9a8Q59/X3d1UrWT34v8XsDgqdHa+/dsrarLbGs3ZAcOog==
Message-ID: <ecb181de-450c-9adc-44b6-531694666411@bootlin.com>
Date: Thu, 10 Aug 2023 18:29:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][mickledore 00/37] Patch review
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
 <115b6810-6f0c-9682-d8aa-bd6a1fcd93f3@bootlin.com>
 <CAOSpxdaytxu7xmJgza_gPg4AG6x5B=q88fBotba+81=uM_MKFg@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAOSpxdaytxu7xmJgza_gPg4AG6x5B=q88fBotba+81=uM_MKFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185812


On 10.08.23 at 18:26, Steve Sakoman wrote:
> On Thu, Aug 10, 2023 at 6:18 AM Michael Opdenacker
> <michael.opdenacker@bootlin.com> wrote:
>> Hi Steve,
>>
>> On 10.08.23 at 18:03, Steve Sakoman wrote:
>>> Please review this set of changes and have comments back by
>>> end of day Monday, August 14.
>>>
>>> Passed a-full on autobuilder:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5711
>>>
>>> The following changes since commit dc4099307100de817110958c9426ced4189fd0ac:
>>>
>>>     util-linux: add alternative links for ipcs,ipcrm (2023-07-27 04:32:06 -1000)
>>>
>>> are available in the Git repository at:
>>>
>>>     https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
>>>     http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut
>>
>> To update supported distributions in the Mickledore documentation, I'd
>> also need to have this patch merged in the "mickledore" branch of
>> "meta-yocto":
>>      - [poky] [PATCH] [mickledore] poky.conf: update
>> SANITY_TESTED_DISTROS to match autobuilder
>>        https://lists.yoctoproject.org/g/poky/message/13118
>>
>> Could you take care of it too?
> Yes.  This particular review request is for oe-core.
>
> I'll take your meta-yocto patches for all of the stable branches later
> today if there are no objections on the list.

Great, thanks!
>
> BTW, ideally the tag should be [meta-yocto], not [poky], since my
> searches are typically for meta-yocto and the branch name.


Actually, [poky] was the mailing list prefix which I copied, but is not 
present in the commit title.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


