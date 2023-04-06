Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E29C77B6C
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 08:23:34 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.153428.1680769410858754757
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 01:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=onTQWTd6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 325021C000F;
	Thu,  6 Apr 2023 08:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680769409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5mUisNO+lBIJdWCUgcTgeaBnSYw8ht8THTx/qflCu9s=;
	b=onTQWTd6OshEH6vbItkp6vO8BvKWj4yI69Dsk8eYWAzCchuo6gU35RSg3n12og5/d6rDKH
	Q+CJ8qm0aPCcaPYwUGvWUTvOvfaCkMXAmKGzgNZNDSH/WyCsDEhlH7fgxEzbGDd3NgWCyp
	K/OzKDsKwEpVlzTDc0vPcALmmMLOOB+exoJVgyhr+Xs16zu0ZVo7Clh2T1NytihJw+iDcU
	m2x5N/b2n+iFYiH0IYIlg84UXJSF90JWZ0cIfQHtOURtb3ulR3Yr/B/W6d+0DWb8Ka5/sc
	KH0sLvuSJUZSwWMCBTrRI42dZZ8bhxO/NKUP+Hw0z+dwnNXOm7iIoZh0nwL+WQ==
Message-ID: <67d102c4-cb70-169d-b8ad-cb141378b7f0@bootlin.com>
Date: Thu, 6 Apr 2023 10:23:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: docs@lists.yoctoproject.org, openembedded-core@lists.openembedded.org,
 Marta Rybczynska <rybczynska@gmail.com>,
 Paul Eggleton <paul.eggleton@linux.microsoft.com>,
 Alex Kiernan <alex.kiernan@gmail.com>
Subject: Re: [docs] [OE-core] [PATCH] migration-guides: update 4.2 migration
 and release notes
Content-Language: en-US
To: Frederic Martinsons <frederic.martinsons@gmail.com>
References: <17531B0D0DFA1CB6.3977@lists.openembedded.org>
 <41ad289e-fffb-b9a1-ab53-0c0510c3d324@bootlin.com>
 <CA+cAkeoPkXN+4Z39DWewrhSL1c3GSsbadPhY-_=Rf9p-Na5u+Q@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CA+cAkeoPkXN+4Z39DWewrhSL1c3GSsbadPhY-_=Rf9p-Na5u+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 08:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179757

Hi Frederic

On 05.04.23 at 21:04, Frederic Martinsons wrote:
>
>
>
>     Any more Rust changes we should mention in the migration notes?
>
>
> Maybe mention a specific procedure to update a cargo based recipe from 
> scratch (i.e. a recipe that
> didn't use the cargo-update-recipe-crates inheritance):
>
> To bootstrap a cargo base recipe which have not the checksum list, 
> below are
> the steps to make:
>   - make the recipe inherit cargo-update-recipe-crates
>   - remove all crate:// from the recipe
>   - create an empty ${BPN}-crates.inc file and make your recipe 
> requires it
>   - execute "bitbake -c update_crates your_recipe"
>   - copy paste the output of bitbake about the missing checksums in 
> your ${BPN}-crates.inc
>
> The last step requires a bitbake patch to show all the missing 
> checksum which I don't know
> if it will be in 4.2.


Do you mean this one?
https://git.openembedded.org/bitbake/commit/?h=2.4&id=dafa07c080e05975b6319b5adf78a9691c6b6643

It just got merged.
Thanks for the tip.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


