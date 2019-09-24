Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6F6067DE8F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 15:31:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8OFU0JQ015699
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Sep 2019 08:30:15 -0700
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 24 Sep 2019 08:29:54 -0700
To: "Bedel, Alban" <alban.bedel@aerq.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>
References: <20190731135317.20174-1-alban.bedel@aerq.com>
	<2306529da2e15035d6070ab9ba109dca6718e127.camel@aerq.com>
	<6ab39e20e78a32845410113de13dbe78b0aad5e5.camel@aerq.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <560ca763-4a6e-d126-b6af-8670d5bb244f@windriver.com>
Date: Tue, 24 Sep 2019 11:29:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6ab39e20e78a32845410113de13dbe78b0aad5e5.camel@aerq.com>
X-Originating-IP: [172.25.44.5]
Subject: Re: [warrior][PATCH] kernel-uboot: compress arm64 kernels
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
X-List-Received-Date: Tue, 24 Sep 2019 15:31:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 9/24/19 3:23 AM, Bedel, Alban wrote:
> On Tue, 2019-09-03 at 09:41 +0000, Bedel, Alban wrote:
>> On Wed, 2019-07-31 at 13:53 +0000, Bedel, Alban wrote:
>>> AArch64 images are not self-decompressing, thus usually much
>>> larger.
>>> Boot times can be reduced by compressing them in FIT and uImages.
>>>
>>> This commit is a backport of commit a725d188b5 (kernel-uboot:
>>> compress
>>> arm64 kernels) and commit 60bc7e180e (kernel-uboot: remove useless
>>> special casing of arm64 Image) from master. Both commit were melted
>>> into one to avoid some useless churn.
>>
>> Was this patch overlooked, or is there a reason it is not considered
>> in
>> the next round of update for warrior? Without this patch kernel
>> images
>> are too large to fit in the flash of the system I'm using.
>> Furthermore
>> it is not trivial to fix this in my own layer.
> 
> Please, I really like to get an answer here. I'm fine if there is a
> reason why this patch is not considered for warrior, but just getting
> ignored is very frustrating.

Add Armin, who maintains warrior.
It seems like he just missed the thread.

There was a 50 patch update posted for warrior last night
but I don't see this patch mentioned.

../Randy
> 
> Alban
> 
> 


-- 
# Randy MacLeod
# Wind River Linux

