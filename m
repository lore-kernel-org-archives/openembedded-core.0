Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2EEED7893E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 19:27:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jan 2018 11:27:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,327,1511856000"; 
   d="scan'208";a="8829013"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 07 Jan 2018 11:27:21 -0800
To: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
References: <20180107161920.30937-1-marex@denx.de>
	<3cdba2e1-94df-32fd-0138-a6fa533ec165@linux.intel.com>
	<233b2ff5-22a9-f378-98d9-fb833f5cc848@denx.de>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <878f3830-3b43-cdd4-aa06-e237db4d0af0@linux.intel.com>
Date: Sun, 7 Jan 2018 21:27:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <233b2ff5-22a9-f378-98d9-fb833f5cc848@denx.de>
Subject: Re: [PATCH 1/2] xenomai: Add xenomai recipe
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
X-List-Received-Date: Sun, 07 Jan 2018 19:27:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/07/2018 07:55 PM, Marek Vasut wrote:
>>> Add recipe for the xenomai. This recipe is used twice, once to build
>>> the xenomai userspace components and again to patch the kernel with
>>> the cobalt core. Therefore, the xenomai sources are installed into
>>> work-shared rather then work to make them accessible to the kernel
>>> recipe, which triggers the patching.
>>
>> What is xenomai? What is a 'cobalt core'? What do they do and who would
>> want to use them? Please do explain that in the commit message.
> 
> I guess the link in the xenomai recipe explains it, details are here:
> http://xenomai.org/installing-xenomai-3-x/

I need to clarify: all of these questions need to be answered in the 
context of oe-core. Essentially, you need to explain why the recipe 
should be in oe-core and not in its own layer.

>>> +SUMMARY = "Xenomai 3 userspace libraries"
>>> +DESCRIPTION = "Xenomai 3 userspace libraries"
>>
>> ... and here - description cannot be the same as the summary.
> 
> So do I remove one of them or what's the difference really ?

Same as the difference between commit summary and commit message. 
Description usually spans several lines, and provides fully formed 
sentences that explain what the software provided by the recipe does.

Also, an update to maintainers.inc would be appreciated, when adding new 
recipes.


Alex

