Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7D68C60103
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 14:38:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2REcIwo015934
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Mar 2018 07:38:18 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 27 Mar 2018 07:38:17 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Zhang Xiao
	<xiao.zhang@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <20180312091303.121887-1-xiao.zhang@windriver.com>
	<7673ca98-3ed5-c770-180e-88d599736d92@linux.intel.com>
	<a739f962-dad5-1d0f-5795-b46bee65c26d@windriver.com>
	<dcc91a62-07a3-9374-5f5c-41fae23fb682@linux.intel.com>
	<cc14195a-81df-190f-23fa-9c914e21e6d9@windriver.com>
	<4813fff9-6e19-4c8d-e22e-2ab6ce5e8989@linux.intel.com>
	<ae9c1af4-ee4d-99f4-7485-968b17bb6811@windriver.com>
	<88e3e4f3-e431-8629-192e-e5ddfc0f45bc@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <1909fbfd-6c8e-b2f1-68ec-5565e0fc1d90@windriver.com>
Date: Tue, 27 Mar 2018 09:38:16 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <88e3e4f3-e431-8629-192e-e5ddfc0f45bc@linux.intel.com>
Subject: Re: [PATCH 1/7] eudev: fix file conflict when multilib enabled
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
X-List-Received-Date: Tue, 27 Mar 2018 14:38:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/27/18 5:37 AM, Alexander Kanavin wrote:
> On 03/26/2018 06:28 PM, Mark Hatle wrote:
>> I want a multilib_exec that can be used to generate a wrapper.  The recipe will
>> have to pass in the name of what is being wrapped, and how to determine the
>> correct 'default'.  The scripting should handle everything else.   Like
>> multilib_header it needs to generate an identical script no matter when multilib
>> it's called with, avoiding any potential file conflict during install -- and
>> then an automatic rename of the underlying 'executable'... using the same logic
>> as multilib_header.
> 
> Thanks. This does look like a project that Wind River should be driving, 
> possibly even as a separate layer (initially). Would be good to have a 
> proven solution merged, rather than something half-baked with newly 
> discovered issues popping up down the road.

Open for assistance from others.. but that is more or less the plan.. We (Wind
River) will be working on this as we're able.

--Mark

> Alex
> 


