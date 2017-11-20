Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B543678480
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 08:49:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAK8n1cF004706
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 20 Nov 2017 00:49:01 -0800
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 20 Nov 2017 00:49:00 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
	<a1b36b8d-0380-2cd4-8774-9927d2dd28f4@windriver.com>
	<1511166320.3952.182.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <2c491846-5f1d-374a-4306-0f0eae792694@windriver.com>
Date: Mon, 20 Nov 2017 16:48:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1511166320.3952.182.camel@linuxfoundation.org>
Subject: Re: [PATCH 00/23] Fixes for multilib and eSDK
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
X-List-Received-Date: Mon, 20 Nov 2017 08:49:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 11/20/2017 04:25 PM, Richard Purdie wrote:
> On Mon, 2017-11-20 at 15:36 +0800, Robert Yang wrote:
>> Would you please take a look at these patches ? The multilib image is
>> broken (wrong packages are installed because of the allarch issues)
>> without these fixes.
> 
> As noted in the weekly status report, we're having trouble with test
> builds. Until we figure out why we're getting intermittent test
> failures, patch merging is effectively stalled.
> 

Sorry, I had missed that report.

// Robert

> I'd note that was no respond to that status email so I'll just have to
> assume everyone is fine for us to halt merging for the next few weeks
> whilst we struggle to resolve it.
> 
> Cheers,
> 
> Richard
> 
> 
> 
> 
> 

