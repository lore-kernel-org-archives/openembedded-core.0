Return-Path: <valentin.popa@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D35CA65D76
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Apr 2014 14:51:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Apr 2014 07:51:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,857,1389772800"; d="scan'208";a="520184943"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.76])
	([10.237.105.76])
	by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2014 07:51:04 -0700
Message-ID: <534BF5DD.7040906@intel.com>
Date: Mon, 14 Apr 2014 17:51:09 +0300
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1397483894-8263-1-git-send-email-valentin.popa@intel.com>
	<1920576.UjDLljL2KG@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1920576.UjDLljL2KG@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dora][PATCH_V2] mesa: double check for eglplatform.h
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
X-List-Received-Date: Mon, 14 Apr 2014 14:51:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/14/2014 05:02 PM, Paul Eggleton wrote:
> Hi Valentin,
>
> On Monday 14 April 2014 16:58:14 Valentin Popa wrote:
>> Even if 'egl' is in PACKAGECONFIG, mesa egl support
>> can be disabled explicitly (using a .bbappend, for example).
>> This patch adds another check for the existence
>> of eglplatform.h before 'sed' can alter it.
>>
>> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> If this is dora-only, you need to mention why master isn't affected in the
> commit message. If it affects master the patch needs to go into master first and
> then dora.
>
> Cheers,
> Paul
>
It doesn't affect the master. It's just for dora. I'll submit a V3 with 
the explanations.




