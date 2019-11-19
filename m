Return-Path: <ross.burton@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CCA257F8A9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 09:24:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Nov 2019 01:24:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,322,1569308400"; d="scan'208";a="209139462"
Received: from unknown (HELO blackadder.local) ([10.252.49.82])
	by orsmga003.jf.intel.com with ESMTP; 19 Nov 2019 01:24:08 -0800
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
References: <20191118164647.29409-1-ross.burton@intel.com>
	<2314f254-7821-bb4c-6637-faf4d26c8be4@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <3288e96c-513a-7049-3be2-836abf1c4bf1@intel.com>
Date: Tue, 19 Nov 2019 09:24:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <2314f254-7821-bb4c-6637-faf4d26c8be4@gmail.com>
Subject: Re: [PATCH 1/6] cve-update-db-native: don't hardcode the database name
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
X-List-Received-Date: Tue, 19 Nov 2019 09:24:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 18/11/2019 19:11, akuster808 wrote:
> 
> 
> On 11/18/19 8:46 AM, Ross Burton wrote:
>> Don't hardcode the database filename, there's a variable for this in
>> cve-check.bbclass.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
> 
> do you recommend these being backported ?

Yes, that series has some important fixes in.

Ross

