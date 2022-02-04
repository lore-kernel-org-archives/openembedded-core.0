Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EEB5C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 20:09:05 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web08.14448.1644005340988799909
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 12:09:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2012061000 header.b=fG70hJVR;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de
 (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 214K8wk7119027
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 4 Feb 2022 21:08:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1644005338;
	bh=BpUrJkx3eD1gIgcDL4D7V1xRLEGjGPcFYO/2vgNej1M=; l=1248;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=fG70hJVRCkP/1Jq2YIUHzcy5CGE1MMnVE06rzsWS/ucnAmcfN8ZZwAYd9INQYyEJX
	 Ryd8QOdm3Dm1EYaHWmbyBwqBT8nrebqi/9Kmij7AouVPC4bVyMQ0tjOA9jTAES4YRU
	 3GzQ2jk3DZkRD0ManmyiD89OI+6A8TTlmWUz5E2w=
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 214K8uKN352282;
	Fri, 4 Feb 2022 21:08:56 +0100
Received: from mail-msa-2.intern.sigma-chemnitz.de ( [192.168.12.72]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 2A881FAD28D; Fri, 4 Feb 2022 21:08:50 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
 (ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 214K8nn9113263
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 4 Feb 2022 21:08:50 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
 4.94.2)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nG4sz-0062Rj-Hm; Fri, 04 Feb 2022 21:08:49 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Bryan Evenson <bevenson@melinkcorp.com>, Jon Mason <jdmason@kudzu.us>,
        Yocto-mailing-list <yocto@lists.yoctoproject.org>,
        Patches and
 discussions about the oe-core layer
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
	<lya6f6jx36.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CANNYZj86eHSn=5gcryZeVBS-qqqKKiafq5XyDO=nup-QdcF7iw@mail.gmail.com>
Date: Fri, 04 Feb 2022 21:08:49 +0100
In-Reply-To: 
 <CANNYZj86eHSn=5gcryZeVBS-qqqKKiafq5XyDO=nup-QdcF7iw@mail.gmail.com>
	(Alexander Kanavin's message of "Fri, 4 Feb 2022 20:12:23 +0100")
Message-ID: <lytudemm26.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 20:09:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161381

Alexander Kanavin <alex.kanavin@gmail.com> writes:

>> > Would CANCEL be clearer to you than HALT?
>>
>> mmmh.... for me as a developer (and non-native english speaker), "cancel"
>> means some ordered ending of an operation.
>>
>> But the condition above causes an emergency abort.
>>
>
> Cancel is the same as abort: a request to immediately stop the operation
> (or not even start it) without reaching the originally requested
> outcome.

https://english.stackexchange.com/questions/535153/what-is-the-difference-between-cancel-and-abort

| Cancel implies the action is rescinded before it implements...
|
| Abort is an emergency procedure to interrupt...


> Halt implies the operation is not going to continue

Really?

https://translate.google.com/?sl=en&tl=de&text=halt&op=translate says

| a suspension of movement or activity, typically a temporary one.

Examples in

      https://dictionary.cambridge.org/de/worterbuch/englisch/halt

sound like there is a chance to continue after the "halt" (show the
permit, resolve the pay dispute).


When we want to continue this inclusion BS, then "halt" seems to be
offending to some people because it can mean

| ... having a physical disability.



Enrico

