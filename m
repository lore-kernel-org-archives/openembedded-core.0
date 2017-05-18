Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id ACD9D77F4C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 13:26:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 May 2017 06:26:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,359,1491289200"; d="scan'208";a="1132094658"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 18 May 2017 06:26:28 -0700
To: "Belal, Awais" <Awais_Belal@mentor.com>,
	Robert Yang <liezhi.yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20170518065043.1662-1-awais_belal@mentor.com>
	<62e4fbc9-931b-d0dd-e71b-99002495c32e@windriver.com>
	<a577a0c9-e1df-a657-a00b-4c5cd69c4609@linux.intel.com>
	<1495106583673.65036@mentor.com>
	<62eacb9b-662a-c259-0bbf-364c488cb194@linux.intel.com>
	<1495113640541.39546@mentor.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <401f15a7-02de-d15a-443b-e68a159ba541@linux.intel.com>
Date: Thu, 18 May 2017 16:24:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1495113640541.39546@mentor.com>
Subject: Re: [PATCH] autogen-native: allow user to set POSIX_SHELL as desired
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
X-List-Received-Date: Thu, 18 May 2017 13:26:30 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/18/2017 04:20 PM, Belal, Awais wrote:
>> I just checked why is autogen in oe-core in the first place. The
>> only thing that needs it now is grub, and it will no longer be
>> necessary when Khem's grub 2.02 patch shows up in master. So then
>> we can remove the whole thing. But thanks for fixing! :)
>
> I went through Khem's grub2 changes:
> http://cgit.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=0af89270aa83d6ad0a4859e18643b53191567c8b
> and in those changes the grub2.inc still reads
>
> DEPENDS = "flex-native bison-native autogen-native"
>
> So I think this can be valuable :)

Don't take what DEPENDS says as authoritative on the subject. :) The 
only way to tell if some dependency is no longer needed is careful 
inspection of upstream code.

In this case:
http://git.savannah.gnu.org/cgit/grub.git/tree/NEWS#n159

Alex


