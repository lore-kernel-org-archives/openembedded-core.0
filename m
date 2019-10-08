Return-Path: <ross.burton@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 318807F360
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 10:42:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Oct 2019 03:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,270,1566889200"; d="scan'208";a="218244578"
Received: from unknown (HELO blackadder.local) ([10.252.56.237])
	by fmsmga004.fm.intel.com with ESMTP; 08 Oct 2019 03:42:12 -0700
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1569728615.git.liezhi.yang@windriver.com>
	<53a2dd95f2fbdb4106916bf5556c5a26172a6e57.1569728615.git.liezhi.yang@windriver.com>
	<6446e616-bd19-483f-bdea-9cf7f84ee326@intel.com>
	<d21d85b1-67b6-aea0-96f7-a897dd5e5bd9@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <c7e3e13b-83d7-409e-d9f7-4c7c73bd22f7@intel.com>
Date: Tue, 8 Oct 2019 11:42:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d21d85b1-67b6-aea0-96f7-a897dd5e5bd9@windriver.com>
Subject: Re: [PATCH 1/1] bluez5: Fix for --enable-btpclient
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
X-List-Received-Date: Tue, 08 Oct 2019 10:42:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 08/10/2019 04:12, Robert Yang wrote:
> 
> Hi Ross,
> 
> On 9/30/19 7:06 PM, Ross Burton wrote:
>> On 29/09/2019 04:44, Robert Yang wrote:
>>> +Upstream-Status: Inappropriate [Upstream already fixed]
>>
>> So this is a backport then?
> 
> I just come back from the holiday, sorry for the late reply. Upstream
> fixed it in a different way, I didn't backport it since the fix looks
> risky for bluez5 5.50. Should we use Backport for such a case, please?

I'd mark it as backport with an explanation that it's a subset of the 
full fix that went upstream.

Ross

