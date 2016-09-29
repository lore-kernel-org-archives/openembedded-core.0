Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1134C6076F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 03:37:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8T3buw8002337
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Sep 2016 20:37:56 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 28 Sep 2016 20:37:56 -0700
To: Seebs <seebs@seebs.net>
References: <cover.1475043600.git.liezhi.yang@windriver.com>
	<CB05DC3E-85D6-4866-9EA0-7341AC8C5FEC@seebs.net>
	<23b689b2-d61f-d6db-f49d-86682c9f84fc@windriver.com>
	<CB33D621-D8CC-4880-AC2F-EAE42D42F943@seebs.net>
	<db01ab37-aeb0-46cd-b953-dd110f59de8b@windriver.com>
	<2B58BF15-5955-4847-88C3-C3EF8036F1D1@seebs.net>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <f65d3c3c-4551-5d08-82d7-55efbabbdcc0@windriver.com>
Date: Thu, 29 Sep 2016 11:37:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <2B58BF15-5955-4847-88C3-C3EF8036F1D1@seebs.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] pseudo: add prefix for log and make log consistent
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Sep 2016 03:37:56 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/29/2016 11:36 AM, Seebs wrote:
> On 28 Sep 2016, at 22:34, Robert Yang wrote:
>
>> Thanks, it works for me now, I will send a V2 with your patch sooner.
>>
>> How about the prefix issues? Which ones should be prefixed do you think
>> please ?
>>
>> Yocto 2.2 may not need the prefix, but we can treat it as an enhancement
>> for YP 2.3.
>
> I don't think anything should be prefixed at this point. The prefix was a
> suggestion for clarifying those messages which were showing up on the console,
> but really, they shouldn't have been showing up on the console in the first place.

Thanks, got it.

>
> And really, ideally several of those messages would become less frequent, since
> they're diagnostics for a circumstance we expect to happen. They should probably
> be debug messages, not unconditional diagnostics.

Sounds good to me.

// Robert

>
> -s
>

