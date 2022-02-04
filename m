Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3207C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 18:39:14 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web12.13377.1643999951087717625
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 10:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2012061000 header.b=MyPPWmB5;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de
 (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 214Id8R2114695
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 4 Feb 2022 19:39:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1643999948;
	bh=b1t/F0XGvjdZzDKRl9+QN+kx7PPodsKEKfQc1RZnDQY=; l=1419;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=MyPPWmB5gGbdyEGAj8XCdUfIw0iDCrh8oY/xHbO88/7H07kPYQbljrlaBqk/3ixgL
	 P6MEU0zSA1WH9lL1t9x1nGA+18FuaX7ex+55xNwcfMq/4b8QInWDh7DBhmqnpiJIcO
	 S2p2VP/Iu67PkK5Euoic0Ab0POdeGaGGUllWnCn0=
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 214Id5QS351065;
	Fri, 4 Feb 2022 19:39:05 +0100
Received: from mail-msa-3.intern.sigma-chemnitz.de ( [192.168.12.73]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 3481524690E; Fri, 4 Feb 2022 19:38:55 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
 (ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id
 214Icsxm115816
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 4 Feb 2022 19:38:54 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
 4.94.2)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nG3Tx-004MYn-Rl; Fri, 04 Feb 2022 19:38:53 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Bryan Evenson <bevenson@melinkcorp.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Jon Mason
 <jdmason@kudzu.us>,
        Yocto-mailing-list <yocto@lists.yoctoproject.org>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        OpenEmbedded Devel List
 <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [OE-core] Inclusive Language Proposal for YP/OE
References: 
 <CAPoiz9wL16OTzxNHdw_5-L72GOHkhhM0--WZF7An071cx6sr_A@mail.gmail.com>
	<lyiltukbsk.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CANNYZj9wOzJ-gp+HVP-915AQp9d-D_PN4GrgPqaC0ZLVvzbgqg@mail.gmail.com>
	<lyee4ik98t.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CH0PR20MB3948522D8A65FE1CED08EA37BB299@CH0PR20MB3948.namprd20.prod.outlook.com>
Date: Fri, 04 Feb 2022 19:38:53 +0100
In-Reply-To: 
 <CH0PR20MB3948522D8A65FE1CED08EA37BB299@CH0PR20MB3948.namprd20.prod.outlook.com>
	(Bryan Evenson's message of "Fri, 4 Feb 2022 15:01:14 +0000")
Message-ID: <lya6f6jx36.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 18:39:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161377

Bryan Evenson <bevenson@melinkcorp.com> writes:

>> >> > For BB_DISKMON_DIRS, the actions "ABORT, STOPTASKS and WARN"
>> >> > would become "HALT, NO_NEW_TASKS and "WARN".
>> >>
>> >> I am not an native english speaker, but for "HALT" I will have to
>> >> think twice whether it will pause the operation or abort it.  I would
>> >> stay at "ABORT" because it makes much more clear what happens.
>
> Would CANCEL be clearer to you than HALT?

mmmh.... for me as a developer (and non-native english speaker), "cancel"
means some ordered ending of an operation.

But the condition above causes an emergency abort.

I do not know how this can be described without using "abort" or some
extensively long terms.


>> >> > BB_HASHCONFIG_WHITELIST -> BB_HASHCONFIG_IGNORE_VARS
>> >> > BB_SETSCENE_ENFORCE_WHITELIST -> BB_SETSCENE_ENFORCE_IGNORE_TASKS
>> >> > BB_HASHBASE_WHITELIST -> BB_BASEHASH_IGNORE_VARS
>> >> > MULTI_PROVIDER_WHITELIST -> BB_MULTI_PROVIDER_ALLOWED
>> >>
>> >> The new variable names sound like boolean flags, not like lists.
>
> Would BB_HASHCONFIG_IGNORELIST or BB_HASHCONFIG_ALLOWEDLIST make more
> sense to you?

yes; it is much better.  But should it be an "IGNORELIST" or an
"IGNORE*D*LIST"?



Enrico
[who is irritated how people and especially developer can waste their
(and other developers) time in trying to change something which was
completely fine before]

