Return-Path: <ross.burton@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 69E387F7E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 13:16:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2019 05:16:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="355788836"
Received: from bhatavin-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.249.42.178])
	by orsmga004.jf.intel.com with ESMTP; 14 Nov 2019 05:16:45 -0800
To: Adrian Bunk <bunk@stusta.de>
References: <20191113081914.28778-1-bunk@stusta.de>
	<02d2657c-0beb-eeb1-ca00-3add30515f9c@intel.com>
	<20191114125101.GB13971@localhost>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <67857156-6a64-13bf-d2cb-226d96a4031f@intel.com>
Date: Thu, 14 Nov 2019 13:16:44 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191114125101.GB13971@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bind: Whitelist CVE-2019-6470
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
X-List-Received-Date: Thu, 14 Nov 2019 13:16:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 14/11/2019 12:51, Adrian Bunk wrote:
> On Thu, Nov 14, 2019 at 12:04:40PM +0000, Ross Burton wrote:
>> On 13/11/2019 08:19, Adrian Bunk wrote:
>>> +# Affects: Builds of dhcpd versions prior to version 4.4.1 when using BIND versions 9.11.2 or later
>>> +CVE_CHECK_WHITELIST += "CVE-2019-6470"
>>
>> Can you be a bit more explicit about why this is whitelisted?
> 
> Something like
>    BIND >= 9.11.2 need dhcpd >= 4.4.1, don't report it here since
>    dhcpd is already recent enough.

Right.

Ross

