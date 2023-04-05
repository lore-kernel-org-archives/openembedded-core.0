Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C14AC7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 18:40:10 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.138865.1680720006690559161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 11:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AO9TiYap;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D26DB240005;
	Wed,  5 Apr 2023 18:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680720004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tqy5geFQOVhaERnMdRDJuiY1lbP3RdIFIotDMRZj8i8=;
	b=AO9TiYapWvM1mn26EaLEDy4FVkHfhlwrVHzSRweeQYSimz9rWAxXeZFBvh8HDxmJNYPZrk
	oDwUEZeV5VdPSepChTVtrKO3HkwoH/tMYCiUt0FSOd5VmCTYfTcMcTSMkSG+QY3Bg6kp4Z
	3fh6vnBoPYhyUl6c28eqM6Xe/YhNVvOyJ5vnwXoccQHBUL1w+hwe3R18sJQCGvzYEDaMQZ
	4GAsm1CBqPSQlRWkteAg1L1crCdnUUJYp8OaAtzcZjP7IXqRz6kGzuAj8Ev1UTw6BTznMl
	6T0C+16o7kCNg1/77q3sqmLFBNIlWzEIHneOCoCzQuXYfvkiYSVE5Wjm+1wlTw==
Message-ID: <41ad289e-fffb-b9a1-ab53-0c0510c3d324@bootlin.com>
Date: Wed, 5 Apr 2023 20:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: openembedded-core@lists.openembedded.org,
 Frederic Martinsons <frederic.martinsons@gmail.com>,
 Marta Rybczynska <rybczynska@gmail.com>,
 Paul Eggleton <paul.eggleton@linux.microsoft.com>,
 Alex Kiernan <alex.kiernan@gmail.com>
Subject: Re: [OE-core] [PATCH] migration-guides: update 4.2 migration and
 release notes
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <17531B0D0DFA1CB6.3977@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <17531B0D0DFA1CB6.3977@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 18:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179745

Greetings,

I copied the OE-core mailing list to get the attention of contributors. 
If you want your new features to be featured in the release and 
migration notes for 4.2, it's time to speak!

What I wrote so far is a very early draft meant to help you detect 
what's missing and correct what I've written so far.

See my questions and comments below...

On 05.04.23 at 19:46, Michael Opdenacker via lists.openembedded.org wrote:
> diff --git a/documentation/migration-guides/migration-4.2.rst b/documentation/migration-guides/migration-4.2.rst
> index 1339411b3e..3b04e072cb 100644
> ...
> +Rust: mandatory checksums for crates
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +This release now supports checksums for Rust crates and make
> +them mandatory for each crate in a recipe. See :yocto_git:`python3_bcrypt recipe changes
> +</poky/commit/?h=mickledore&id=0dcb5ab3462fdaaf1646b05a00c7150eea711a9a>`
> +for example.
> +
> +The ``cargo-update-recipe-crates`` utility
> +:yocto_git:`has been extended </poky/commit/?h=mickledore&id=eef7fbea2c5bf59369390be4d5efa915591b7b22>`
> +to include such checksums.


Any more Rust changes we should mention in the migration notes?


> diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documentation/migration-guides/release-notes-4.2.rst
> index edafe378b0..1a60fe5490 100644
> --- a/documentation/migration-guides/release-notes-4.2.rst
> +++ b/documentation/migration-guides/release-notes-4.2.rst


Here in the release notes, I didn't work on the detailed changes, such 
as version changes for the kernel and many recipes. I'm trying to help 
with the first part showing the big picture.

>   
> -     addpylib ${LAYERDIR}/lib oe
> +      addpylib ${LAYERDIR}/lib oe
> +
> +-  BitBake has seen multiple internal changes that may impact
> +   memory and disk usage as well as parsing time, in particular:
> +
> +   -  BitBake's Cooker server is now multithreaded.
> +
> +   -  BitBake's cache has been extended to include more hash
> +      debugging data, but has also been optimized to :yocto_git:`compress
> +      cache data <https://git.yoctoproject.org/poky/commit/?h=mickledore&id=7d010055e2af3294e17db862f42664ca689a9356>`.
> +
> +   -  BitBake's Cooker server :yocto_git:`can now be pinged
> +      https://git.yoctoproject.org/poky/commit/?h=mickledore&id=26f255da09>`
> +      from the UI.


More BitBake changes we should mention?

> +
> +-  Rust improvements:
> +
> +   -  This release adds Cargo support on the target, and includes
> +      automated QA tests for this functionality.
> +
> +   -  It also supports checksums for Rust crates and makes
> +      them mandatory for each crate in a recipe.


More Rust changes we should highlight?

> +-  Miscellaneous changes:
> +
> +   -  Supporting 64 bit dates on 32 bit platforms: several packages have been
> +      updated to pass Y2038 tests.


By the way, what's the status of Y2038 support in Mickledore? Are all 
tests passing now?

To make the drafts easier to review, they have been compiled in the 
master-next branch:
https://docs.yoctoproject.org/next/migration-guides/release-4.2.html

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


