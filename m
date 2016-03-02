Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 79C4B70018
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 19:11:46 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 02 Mar 2016 11:11:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,530,1449561600"; d="scan'208";a="662676162"
Received: from ttndukum-mobl4.amr.corp.intel.com (HELO [10.254.180.164])
	([10.254.180.164])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Mar 2016 11:11:47 -0800
To: Saul Wold <saul.wold@intel.com>, openembedded-core@lists.openembedded.org
References: <cover.1456906424.git.mariano.lopez@linux.intel.com>
	<5f7a27cd00738654a1f7324e234ea853a57c8b92.1456906424.git.mariano.lopez@linux.intel.com>
	<1456940230.4346.102.camel@intel.com>
From: "Lopez, Mariano" <mariano.lopez@linux.intel.com>
Message-ID: <56D73AF2.3000902@linux.intel.com>
Date: Wed, 2 Mar 2016 13:11:46 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1456940230.4346.102.camel@intel.com>
Subject: Re: [PATCH 1/1] yocto-bsp: Set linux-yocto-4.1 as default for x86-64
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
X-List-Received-Date: Wed, 02 Mar 2016 19:11:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/2/2016 11:37 AM, Saul Wold wrote:
> On Wed, 2016-03-02 at 08:14 +0000, mariano.lopez@linux.intel.com wrote:
>> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>>
>> Setting default kernel to linux-yocto-4.1 now that
>> 3.19 bbappend is no longer in the tree.
>>
> This should default to 4.4 for 2.1, correct? 4.1 is the LSB/LTS kernel
> for 2.1.

I was setting the default to the same as the other archs in order to fix 
the error with x86-64. If it's okay to change to version 4.4 at this 
point in the release I can send a v2 patch with all the archs updated.

Mariano

