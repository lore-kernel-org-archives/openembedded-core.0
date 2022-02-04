Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC3BC433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:16:32 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web12.9609.1643984188399336716
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 06:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2012061000 header.b=kT0zZJK/;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de
 (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 214EGOZV112849
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 4 Feb 2022 15:16:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1643984184;
	bh=Fy90ePUx5awPrlFmrxFMuG0AVkccSPaMEIQg7P3UBsQ=; l=1537;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=kT0zZJK/wQZvFt7hpF519m1Yqng/u8n7EVj0Tgc6JCYudo8awMx0Lv1TgFv7XQI9N
	 RUjgMM3MmxZaNUecdEltMI1UNbDw4cGyTDkOdK3tHkL6ey6TQ3ilZmfjhfpgHu6fPP
	 cgl1ltP5TlYNUzjtWfVHMf8jpUvQtLj0OA9/YAMs=
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 214EGMlJ347180;
	Fri, 4 Feb 2022 15:16:22 +0100
Received: from mail-msa-2.intern.sigma-chemnitz.de ( [192.168.12.72]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 267511B75FC; Fri, 4 Feb 2022 15:16:18 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
 (ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 214EGI6r110941
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 4 Feb 2022 15:16:18 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
 4.94.2)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nFzNq-00HHfN-6E; Fri, 04 Feb 2022 15:16:18 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Jon Mason <jdmason@kudzu.us>,
        Yocto-mailing-list
 <yocto@lists.yoctoproject.org>,
        Patches and discussions about the oe-core
 layer <openembedded-core@lists.openembedded.org>,
        OpenEmbedded Devel List
 <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [OE-core] Inclusive Language Proposal for YP/OE
References: 
 <CAPoiz9wL16OTzxNHdw_5-L72GOHkhhM0--WZF7An071cx6sr_A@mail.gmail.com>
	<lyiltukbsk.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CANNYZj9wOzJ-gp+HVP-915AQp9d-D_PN4GrgPqaC0ZLVvzbgqg@mail.gmail.com>
Date: Fri, 04 Feb 2022 15:16:18 +0100
In-Reply-To: 
 <CANNYZj9wOzJ-gp+HVP-915AQp9d-D_PN4GrgPqaC0ZLVvzbgqg@mail.gmail.com>
	(Alexander Kanavin's message of "Fri, 4 Feb 2022 14:58:34 +0100")
Message-ID: <lyee4ik98t.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 14:16:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161365

Alexander Kanavin <alex.kanavin@gmail.com> writes:

>> > For BB_DISKMON_DIRS, the actions "ABORT, STOPTASKS and WARN" would
>> > become "HALT, NO_NEW_TASKS and "WARN".
>>
>> I am not an native english speaker, but for "HALT" I will have to
>> think twice whether it will pause the operation or abort it.  I would
>> stay at "ABORT" because it makes much more clear what happens.
>
> I'm not taking a stand here, but just providing the context for where
> the push for avoidance of 'abort' comes from:
> https://inclusivenaming.org/word-lists/tier-1/
>
> Keep in mind that for non-native english speakers none of these words
> are emotionally charged; they're just terms.

Yes; these are terms.  But it should be possible to understand the
meaning of these terms without using a special "inclusivenaming"
dictionary.  Else, we could just use "A", "B" and "C" for the actions
above and explain these "terms" in some documentation later.


>> > BB_HASHCONFIG_WHITELIST -> BB_HASHCONFIG_IGNORE_VARS
>> > BB_SETSCENE_ENFORCE_WHITELIST -> BB_SETSCENE_ENFORCE_IGNORE_TASKS
>> > BB_HASHBASE_WHITELIST -> BB_BASEHASH_IGNORE_VARS
>> > MULTI_PROVIDER_WHITELIST -> BB_MULTI_PROVIDER_ALLOWED
>>
>> The new variable names sound like boolean flags, not like lists.
>
> I'd say the context should make it clear that they are lists

It is bad when a context is required to understand the meaning of a
variable.

And where do you see a context when local.conf contains

| BB_HASHCONFIG_IGNORE_VARS = "true"



Enrico

