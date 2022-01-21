Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB999C433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 13:42:17 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.12008.1642772536838288413
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 05:42:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B5E2F1C0003;
	Fri, 21 Jan 2022 13:42:14 +0000 (UTC)
Cc: Ross Burton <ross.burton@arm.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] runqemu: automatically turn on "kvm" on x86
 CPUs with VT
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20220120152146.1912559-1-michael.opdenacker@bootlin.com>
 <CANNYZj-wjwmKuu_FxoktmP84TFUJU4yi9JJ4bZ1N23VP+83n6g@mail.gmail.com>
 <27cd215a-abb7-a873-40a6-86df335691b1@bootlin.com>
 <56724a11b917e32b196f8aeb7c4678c4e0903d49.camel@linuxfoundation.org>
 <CANNYZj8SFzeYPNvp87nP0WqL-T5FGAZCRMVOZAfjU7+Q4Jgg2Q@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <f2eda39b-1948-9ebe-5f5f-4212b740b2ea@bootlin.com>
Date: Fri, 21 Jan 2022 14:42:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CANNYZj8SFzeYPNvp87nP0WqL-T5FGAZCRMVOZAfjU7+Q4Jgg2Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 13:42:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160828


On 1/21/22 12:43 PM, Alexander Kanavin wrote:
> On Thu, 20 Jan 2022 at 21:46, Richard Purdie
> <richard.purdie@linuxfoundation.org
> <mailto:richard.purdie@linuxfoundation.org>> wrote:
>
>
>     I think the patch as it stands will actually regress things for
>     many users. You
>     must be already in the right groups to be able to access kvm on
>     your system but
>     I don't think that is the default for many distros. On those
>     distros you would
>     see a "permission denied" message from qemu which users find very
>     confusing and
>     I think this is why the code is in the form it is in.
>
>     We might be able to improve the test further with the open
>     permissions Alexander
>     mentions but that is probably necessary to make the patch mergable.
>
>
> I guess what we can do for a start is to check if host and target
> arches match (e.g. x86 on x86), and then if kvm is not asked for,
> gently suggest to the users that they do, for a much better
> experience, with a link to the kvm on yocto guide. Then we can look
> into auto-attempting it carefully, so that such attempts don't make
> the experience worse.


Thanks for your ideas.
If you think this idea of automatically enabling KVM is risky, it sounds
like a good idea indeed to make this suggestion when applicable.

I'll also update the documentation to remind people. I guess that mainly
beginner users are impacted, and those are the ones who will read the
our docs.
Thanks again
Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


