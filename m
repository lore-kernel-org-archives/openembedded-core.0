Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08911CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 14:18:19 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.55437.1697811494935949677
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 07:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZPdpxrcS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27B0720018;
	Fri, 20 Oct 2023 14:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697811493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T3u4IHVBjiQHoHj4k4HhTs3nCKPeo1NXbimzVAhSIx0=;
	b=ZPdpxrcS6Mw+facGQ25OK0yuBUgiJ4VI6JUZgGll99TgyQn03f6uokn8XFVJgLWsDYNCjU
	7JE1QlrhVMTx31Qd8FcKl+CD22xy5t1ho+PCVmntOZZ4WoNBqg0NCoQyi91Cgh8iw68mUy
	5amuWtJy1wk7DzT4iikARs2rnFCvshZmF/QlMRCBxOx7p7QuxBE+6qDEreYhZZmreIpvPo
	BKGrVH366zX8ZenU6Jya5bLB5cpgz+FOow9cHYCSTcqe1zLzDp65u+u8rMXaV2t5RsWw6s
	W6UcBPjFc33+bGysnzMdH8JN5Y3XFeuBNfjJeXGsB9Q+8rTGjxvnrvyLLXsylQ==
Message-ID: <27113695-6855-4b64-a966-34ea524927a0@bootlin.com>
Date: Fri, 20 Oct 2023 16:18:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 yocto-security@lists.yoctoproject.org
Subject: Re: [OE-core] CVE work synchronization proposal
Content-Language: en-US
To: Marta Rybczynska <rybczynska@gmail.com>, Steve Sakoman
 <steve@sakoman.com>, Ross Burton <ross.burton@arm.com>
References: <CAApg2=QBDi4jOA=N95paA+-0D-ZV7uQwCYuw0YWnkvk2B3DHig@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAApg2=QBDi4jOA=N95paA+-0D-ZV7uQwCYuw0YWnkvk2B3DHig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 14:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189538

Hi Marta

On 20.10.23 at 10:36, Marta Rybczynska wrote:
> Hello everyone,
> We have a constant flow of work on pending CVEs. During my discussion
> with multiple people, there is a common need for synchronization of
> this work to avoid duplication or forgotten fixes.
>
> We have a decision on the tooling to make: do we want to create a
> Bugzilla entry for each new open CVE? An alternative is to use a wiki
> page (this has been prototyped by Ross) with heavy scripting to
> automate the tedious part.
>
> Today I propose you to use a special wiki page and the following procedure:
>
> On the wiki page, always add all additional information after a ; sign
> to allow scripting. The first part of each line (until ";" ) will be
> auto-generated. The second part contains information about the issue,
> like who is investigating or what the situation is.
>
> There is a separate list for each branch, as we realize that people
> concentrate on various branches.
>
> Workflow:
>
> * Mark name of a person preparing a patch for each branch
> * If you have additional information (like a link to a patch), add it
> to the record
> * If a patch is posted to the mailing list, post a link to it (this
> will be automated)
> * When a patch reaches the "next" branch, mark it too (this will be
> automated too)
> * When the patch reaches the final branch, the line of the CVE is
> automatically removed (this is already automated)
> * The list is (re)generated every day
>
>
> Please have a look at the procedure proposal and how the tracking
> might look like:
>
> https://wiki.yoctoproject.org/wiki/Synchronization_CVEs


This looks very useful. Thanks!
If I understand correctly, the fact that the beginning of each line is 
generated automatically is a way to make sure nobody with Wiki write 
rights can hide a vulnerability by removing it from the list, right?

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


