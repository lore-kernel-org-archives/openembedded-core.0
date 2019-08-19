Return-Path: <ross.burton@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E88647F250
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 14:31:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Aug 2019 07:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,405,1559545200"; d="scan'208";a="180379278"
Received: from pruecklm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.36.159])
	by orsmga003.jf.intel.com with ESMTP; 19 Aug 2019 07:31:27 -0700
To: openembedded-core@lists.openembedded.org
References: <20190814222921.34551-1-raj.khem@gmail.com>
	<b3f880cd-422a-a0ef-db42-6e44364ab06e@gmail.com>
	<CAMKF1sqQLs_Rey6XCoH5AGMx5=-n-XrspEgrh=zrmF-eDtB2Eg@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <3bf454c4-0ab2-8020-76cf-74e77f4a0ab6@intel.com>
Date: Mon, 19 Aug 2019 15:31:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqQLs_Rey6XCoH5AGMx5=-n-XrspEgrh=zrmF-eDtB2Eg@mail.gmail.com>
Subject: Re: [PATCH] libffi: Upgrade to 3.3-rc0
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
X-List-Received-Date: Mon, 19 Aug 2019 14:31:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 14/08/2019 23:46, Khem Raj wrote:
> On Wed, Aug 14, 2019 at 3:42 PM akuster808 <akuster808@gmail.com> wrote:
>>
>>
>>
>> On 8/14/19 3:29 PM, Khem Raj wrote:
>>> libffi 3.1 release has been a bit aged and new architectures, compilers
>>> have since been come on stage to compile it, we have been carrying
>>> patches, but its better to use the latest 3.3 rc0 which has lot of these
>>> issues handled and is in good shape.
>>
>> Will the RC part cause the PE to be invoked when 3.3 comes out?  I did
>> this on wireshark and shot myself in the foot.
>>
> 
> I am expecting the releases to be 3.3.0  but looking into the history
> of releases it
> could be 3.3 so yes you are right, Probably I will renable the recipe
> to libffi_3.2+3.3-rc0.bb
> and that should fix this

Set the PV to 3.3~rc0 and 3.3 will sort after it.

Ross


