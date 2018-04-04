Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58FFB60596
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 20:08:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w34K877J019916
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Apr 2018 13:08:07 -0700 (PDT)
Received: from [128.224.56.223] (128.224.56.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 4 Apr 2018 13:08:06 -0700
To: Cuero Bugot <cbugot@sierrawireless.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>
References: <CY1PR02MB115212269AF12AA9BC2963DBA3D40@CY1PR02MB1152.namprd02.prod.outlook.com>
	<BY1PR02MB11478B00DEE78E80BF02468CA3A10@BY1PR02MB1147.namprd02.prod.outlook.com>
	<1522763797.11431.234.camel@linuxfoundation.org>
	<CY1PR02MB11529A719BDE5DD784C82C69A3A50@CY1PR02MB1152.namprd02.prod.outlook.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <53af03d6-282a-caf1-38c5-6898e2a24d1b@windriver.com>
Date: Wed, 4 Apr 2018 16:08:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CY1PR02MB11529A719BDE5DD784C82C69A3A50@CY1PR02MB1152.namprd02.prod.outlook.com>
X-Originating-IP: [128.224.56.223]
Subject: Re: [PATCH] uninative: add variables to the whitelist so that it does not re-triger recipe parsing
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
X-List-Received-Date: Wed, 04 Apr 2018 20:08:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2018-04-03 10:15 AM, Cuero Bugot wrote:
>> In short the answer is that no, we shouldn't and your patch is the better option. I've queued it in sumo-next. Thanks for figuring it out as it is an annoying problem.
> 
> Hey no prb ! Given he traffic on this list I understand everyone is busy!
> Would it be possible to add it to rocko-next  as well ? (the patch applies as is) (I ask in my self interest as we are using rocko as of now); or does it contradict specific policies for released branches ?

I'm not sure if there's any objection to backporting this patch but
Armin is the guy to ask about that. I've added him to the thread in case
he missed your rocko reference.

Usually, a patch has to be in master and not just master-next
before being backported IIRC, so give it a few days.

../Randy

> Thx,
> Cuero
> 


-- 
# Randy MacLeod.  WR Linux
# Wind River

