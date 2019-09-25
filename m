Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 06DC46D561
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 09:57:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8P9vN2p005176
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Sep 2019 02:57:23 -0700 (PDT)
Received: from [128.224.162.210] (128.224.162.210) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 25 Sep 2019 02:57:23 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1569403775.git.liezhi.yang@windriver.com>
	<94619a2a1eee28dc3b19b4b1d2c8e1a9f7adc61d.1569403775.git.liezhi.yang@windriver.com>
	<d6bbaa58-de6b-3263-7bf5-f0f048b87d00@intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <7a9e1225-2eb9-5cd0-b874-ee6fd3eb5b72@windriver.com>
Date: Wed, 25 Sep 2019 17:57:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d6bbaa58-de6b-3263-7bf5-f0f048b87d00@intel.com>
Subject: Re: [PATCH 3/3] apr: Fix configure error for nativesdk
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
X-List-Received-Date: Wed, 25 Sep 2019 09:57:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 9/25/19 5:48 PM, Ross Burton wrote:
> On 25/09/2019 10:30, Robert Yang wrote:
>> Fixed:
>> $ bitbake nativesdk-expect
> 
> You meant nativesdk-apr
> 
>>   DEPENDS = "util-linux"
>> +DEPENDS_class-nativesdk = "nativesdk-libtool"
> 
> As we're explicitly calling libtool, why not just DEPEND on libtool always?

Thanks, all of these are good suggestions, I will send a V2.

// Robert

> 
> Ross

