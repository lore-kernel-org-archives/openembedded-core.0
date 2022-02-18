Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE089C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 14:27:42 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web12.11415.1645194459473260092
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 06:27:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2012061000 header.b=IZIUiK6K;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de
 (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 21IERXYA012489
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 15:27:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1645194454;
	bh=jsPWNHMI4PzS18K3LJmpOayWppzfRAGN9RXdQ86+8fA=; l=1600;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=IZIUiK6K7jKh4UJCBmthP/dazonzyulMSy6T6Qu6NO4HZWp2ZO3lvUM1yiZusIPk9
	 s7I2lGQBaI1yfo15spW+5uRyOHmUTZWjU4NFWzEHJjSWxyr2GTrJL/6NGWoPYdJmK2
	 u/eOZyuf7rhrYqWXgDd4ySj9ilL5PMITRMgaybpI=
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 21IERWWU017365
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Fri, 18 Feb 2022 15:27:32 +0100
Received: from mail-msa-2.intern.sigma-chemnitz.de ( [192.168.12.72]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 5FE17612749; Fri, 18 Feb 2022 15:27:29 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
 (ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 21IERSNs012431
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 18 Feb 2022 15:27:28 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
 4.94.2)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nL4EJ-000ac2-U7; Fri, 18 Feb 2022 15:27:28 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Saul Wold <Saul.Wold@windriver.com>,
        openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] convert-variables: Script for Inclusive
 Language variable renames
References: <20220217003248.581903-1-saul.wold@windriver.com>
	<ly35kg9tsz.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<caf357e342ad33e0117af76244ba13fcd804f4fc.camel@linuxfoundation.org>
Date: Fri, 18 Feb 2022 15:27:27 +0100
In-Reply-To: 
 <caf357e342ad33e0117af76244ba13fcd804f4fc.camel@linuxfoundation.org>
	(Richard Purdie's message of "Fri, 18 Feb 2022 13:55:37 +0000")
Message-ID: <lyv8xc8d2o.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 14:27:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161941

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> > This script searches for a list of variable that have been renamed
>> > and converts them to their more descriptive names.

s/descriptive/politically correct/


>> again: most of these renamings make identifiers much less descriptive
>> because they now sound like boolean flags instead of lists
>
> Whilst you could say they sound like booleans, they clearly can't be
> as that wouldn't make sense, e.g. "Ignoring variables in basehash"
> makes no sense.

True; because it does not make sense, these variables should not be
named in this way.


> Secondly, most metadata variables are lists of things.

The renamed ones; yes.  But when I look in bitbake.conf, I can not say
that most variables are lists.


> Adding "LIST" to every variable that is a list of items would just make
> the variable names much longer with little end resulting readability
> gain.

True; explicit type annotations like in the hungarian notation are
nonsense.  But "whitelist" and "blacklist" are words with a meaning;
the "list" is not used as a type annotation there.

Variable names were perfectly readable.  A change should make things
better, not worse.


> Unfortunately there likely isn't a perfect rename and these were the
> best we were able to come up with.

Why is the rename done at all?  It makes the product just worse due to a
less usable api and because it causes a lot of work for the users of the
api (I shudder when I think about updating my CI to work with new and
old branches).



Enrico

