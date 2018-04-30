Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 9883A6025E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 12:23:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Apr 2018 05:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,346,1520924400"; d="scan'208";a="47148474"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 30 Apr 2018 05:23:51 -0700
To: Marek Vasut <marex@denx.de>, yamada.masahiro@socionext.com,
	mnhu@prevas.dk, raj.khem@gmail.com
References: <20180408230223.17260-1-marex@denx.de>
	<CAMKF1squXKSNhvmHj_p0Q-5cK3H-yKH1upwKXjvDCoindshUWA@mail.gmail.com>
	<bf9e9593-a395-8d53-faf8-ad6609aa5ba1@prevas.dk>
	<53904a8f-7ba2-7f09-4e93-a95a780f60c7@denx.de>
	<d89b39f665a14c63b0821c1ad600da72@SOC-EX01V.e01.socionext.com>
	<8cc34667-5bb3-9642-40e2-d56b28f56646@prevas.dk>
	<32a348ed6176434db8178d29d7e1f183@SOC-EX01V.e01.socionext.com>
	<5ca366ed-3108-4a56-caaf-06b4f136d259@denx.de>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <627e0fde-f97f-5c49-bc1a-325e7baa9072@linux.intel.com>
Date: Mon, 30 Apr 2018 15:17:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <5ca366ed-3108-4a56-caaf-06b4f136d259@denx.de>
Cc: otavio@ossystems.com.br, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Upgrade to 2018.03 release
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
X-List-Received-Date: Mon, 30 Apr 2018 12:23:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/16/2018 11:40 AM, Marek Vasut wrote:
>> Isn't it possible to solve your issue in the OE side?
>>
> 
> Can we NOT compile DTC alongside U-Boot somehow ? :)
> That'd be the most desired solution IMO.

Yes please. Can you adjust the recipes and classes in oe-core, and 
remove the dtc recipe altogether?

Alex

