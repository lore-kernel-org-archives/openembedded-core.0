Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 240CE6E630
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 11:18:21 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Oct 2017 04:18:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,431,1503385200"; d="scan'208";a="167371772"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 25 Oct 2017 04:18:22 -0700
To: akuster808 <akuster808@gmail.com>, Li Zhou <li.zhou@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <1508744693-248151-1-git-send-email-li.zhou@windriver.com>
	<f4cc1dae-2111-1d0f-9b39-01e77acb6583@linux.intel.com>
	<e64a026c-95dd-9ade-b274-514e7d687a7b@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <cd317265-e904-0ed5-2bd2-c8f0e73a21d3@linux.intel.com>
Date: Wed, 25 Oct 2017 14:18:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <e64a026c-95dd-9ade-b274-514e7d687a7b@gmail.com>
Subject: Re: [PATCH] curl: Security Advisory - curl - CVE-2017-1000254
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
X-List-Received-Date: Wed, 25 Oct 2017 11:18:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/25/2017 07:40 AM, akuster808 wrote:
> 
> 
> On 10/23/2017 03:29 AM, Alexander Kanavin wrote:
>> On 10/23/2017 10:44 AM, Li Zhou wrote:
>>> Porting patch from <https://github.com/curl/curl/commit/
>>> 5ff2c5ff25750aba1a8f64fbcad8e5b891512584> to solve CVE-2017-1000254.
>>
>> It's better to update to latest version (7.56) instead of backporting
>> patches, please do that.
> 
> Then these should be stagged for Rocko. Work has been done.

Only if master is also fixed at the same time (or sooner) - there cannot 
be a situation where something is fixed in rocko, but not in master. I'm 
fine if it's via CVE backports, but I would prefer a version upgrade.

Alex

