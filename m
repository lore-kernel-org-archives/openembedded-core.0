Return-Path: <paul@betafive.co.uk>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA897D414
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 07:05:25 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 4B627222C9;
	Fri,  3 May 2019 03:05:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Fri, 03 May 2019 03:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=subject:to:references:from:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=h
	WCVmjY3F9a7PMTPeBW819DK0mMJLik5PYOKP1xIngE=; b=ixVieqD0TEAe08iNn
	uvnTyXl0sizJcHb06xVKFrpADP9HYYC2H0NKkR/bBIv8px/kUM2V3OpUQB2V6tqg
	AT6W4nn1W1SdGn09pv97BpplbY+H8y2sHMkDzEecTKxtPinuTq8LMEX4OGRXVqa5
	L54vZ6KydioS59zQHuNnKITkNtdxAwqD5PNWZ4ghO9tr6NI6vCSG+9iPXQweR3kl
	4u+HNQSbaxI5hwiNqByYtAQaPOlEMWboFAbbQl+ow06nWtbXg1it+3JsZusEsz7Q
	iwXM0Ktqb/oTNJpo4ybms/Vxk2PfQNaM8IrnwNf0YuNd4NX71E7osYEnrLnxuSys
	0YVRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=hWCVmjY3F9a7PMTPeBW819DK0mMJLik5PYOKP1xIn
	gE=; b=y9u1CeqffkE5qCCkDCQZPm2lcF1tBA06BbfP0ez0uY3pCbFH7FHXdw7bd
	eEri4RvIX63NUIhNvVn6dX9TgqjcpWLzK1bMqPq/W5/epT3nFhhkPSkpwlLJbOa0
	cujVNjaKV8C1jDYR2X5zFLQiYQLNtgjUjrzzJKv2H/6lT3Li/U/k53Owt52fkFwE
	tnQWWNSYAVfrGdu7/pMJQxIfYj+WL1cEpx8dMJq3WIrztj8jycYTJZiQIYVMC1FU
	+utYe5pgRcPShpK+LXpcdYYjHD9e7uRPjIIcAfua5fOCd6Lr/yj56u7CSRbwoYd5
	7B5ebViIEjii1hR3YIaBm8qQBBWQQ==
X-ME-Sender: <xms:MujLXKRiPz7rddH7G5NTv0F4Kgpjn2ojyxFKLARuZlDIMo3rL5j_2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjedtgdduudegucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepuffvfhfhohfkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefrrghu
	lhcuuegrrhhkvghruceophgruhhlsegsvghtrghfihhvvgdrtghordhukheqnecukfhppe
	ekuddrudekjedrfedvrddufeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhes
	sggvthgrfhhivhgvrdgtohdruhhknecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:MujLXJQ6PdavJ9L2iCTfqRtD51_Yp0gZSFsisKbVOvIIiyVWsdx9bA>
	<xmx:MujLXMEV1sWlok_g79SG_uEX6HQWQxObb-wobKlGqHu-zaXKzb2yLQ>
	<xmx:MujLXNnzG24LTRcad9RdUjoybcAs7_FNVT560xRW9OTC4-kK84qYCQ>
	<xmx:M-jLXCvi3LM9wUSK-v1ADDmPEotxiQyqRXibBOUx9Uev4AhzoM0zSQ>
Received: from [192.168.2.138] (138.32.187.81.in-addr.arpa [81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4AB68103D5;
	Fri,  3 May 2019 03:05:22 -0400 (EDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190502213052.15962-1-paul@betafive.co.uk>
	<20190502213052.15962-2-paul@betafive.co.uk>
	<7a2175fe5786ab041053400f235ede965cee3bcd.camel@linuxfoundation.org>
From: Paul Barker <paul@betafive.co.uk>
Organization: Beta Five Ltd
Message-ID: <ec9790bf-ea42-53a5-6a94-3e4884a39769@betafive.co.uk>
Date: Fri, 3 May 2019 08:05:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <7a2175fe5786ab041053400f235ede965cee3bcd.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] license_image: Don't try to hard link license files
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
X-List-Received-Date: Fri, 03 May 2019 07:05:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 03/05/2019 06:05, Richard Purdie wrote:
> On Thu, 2019-05-02 at 21:30 +0000, paul@betafive.co.uk wrote:
>> From: Paul Barker <paul@betafive.co.uk>
>>
>> This change allows us to support the placement of WORKDIR and
>> DEPLOY_DIR
>> on different devices. As the license files are typically small, the
>> increase in disk usage and build time should be negligible.
>>
>> Signed-off-by: Paul Barker <paul@betafive.co.uk>
>> ---
>>   meta/classes/license_image.bbclass | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> We create a lot of hardlinks and its not negligible overall ;-).
> 
> I'd prefer we continue to do so where we can. We should probably create
> a function similar to lib.oe.path.copyhardlinktree() and use that here
> rather than abandon the hardlinks.
> 

Ok, I'll throw together a copyhardlink() helper and send a v2 of this patch.

Thanks,

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

