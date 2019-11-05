Return-Path: <ross.burton@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A02977F8F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 11:59:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Nov 2019 03:59:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="285283085"
Received: from felsner-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.252.57.88])
	by orsmga001.jf.intel.com with ESMTP; 05 Nov 2019 03:59:05 -0800
To: Adrian Bunk <bunk@stusta.de>
References: <20191104205504.24428-1-bunk@stusta.de>
	<aa3aa480-65d5-789c-71c0-3997d742424e@intel.com>
	<20191105110116.GA20425@localhost>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <a4953f27-c2d3-54f8-e17b-d2d227b09f60@intel.com>
Date: Tue, 5 Nov 2019 11:59:04 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105110116.GA20425@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] iputils: Whitelist CVE-2000-1213 CVE-2000-1214
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
X-List-Received-Date: Tue, 05 Nov 2019 11:59:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 05/11/2019 11:01, Adrian Bunk wrote:
> On Tue, Nov 05, 2019 at 10:38:32AM +0000, Ross Burton wrote:
>> On 04/11/2019 20:55, Adrian Bunk wrote:
>>> +# Fixed in 2000-10-10, but the versioning of iputils
>>> +# breaks the version order.
>>> +CVE_CHECK_WHITELIST += "CVE-2000-1213 CVE-2000-1214"
>>
>> So the problem is that our PV matches the upstream git tags, which don't
>> match the naming convention in the CPE entries.
>>
>> The tags are of the form s20190709, but the CPE uses 2010-10-10.
>>
>> If we assume that the CPE version scheme will remain the same
>> ...
> 
> CVE-2010-2529 had an explicit list of affected versions of the
> scheme 20100214.
> 
> These 19 year old ones from a time when CVE was new are outliers.
> I would expect versions in new CVE to match the OE versioning,
> except that the 's' might (or might not) be missing.

<shakes fist>

Of course -2529 uses a different CPE product/vendor name to -1213 so 
didn't appear in my search.

Okay, lets use the whitelist approach.

Ross


