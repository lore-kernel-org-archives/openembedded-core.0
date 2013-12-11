Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E72DF6A59E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 16:51:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2013 08:51:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,872,1378882800"; d="scan'208";a="450632682"
Received: from unknown (HELO [10.255.12.47]) ([10.255.12.47])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2013 08:51:49 -0800
Message-ID: <52A89825.7030303@linux.intel.com>
Date: Wed, 11 Dec 2013 08:51:49 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Robert Yang <liezhi.yang@windriver.com>
References: <cover.1386752561.git.liezhi.yang@windriver.com>
	<1386771992.4332.76.camel@ted>
In-Reply-To: <1386771992.4332.76.camel@ted>
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 000/122 V2] [dora] fixes for dora (cover leter only)
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
X-List-Received-Date: Wed, 11 Dec 2013 16:51:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2013 06:26 AM, Richard Purdie wrote:
> Hi Robert,
>
> Can you confirm that all these patches have an equivalent change in
> master already? I can see some which I can't find equivalent changes in
> master for :(
>
I know there were a few explicit "for dora" only patches that do not 
match in master since master moved forward in version.

Sau!

> You also do need to drop the "kernel: restore scripts in the sysroot"
> patch since it was reverted in master and is not a correct fix for
> anything.
>
> Cheers,
>
> Richard
>
> On Wed, 2013-12-11 at 04:21 -0500, Robert Yang wrote:
>> * V2:
>>    + Create the PULL based on oe-core
>>    + Remove the 2 patches after more discussions with the submitter:
>>      - native-python: bad interpreter error message
>>      - Fix conflict between procps and base-files
>>
>> * V1 (Initial version)
>>    + Main changes:
>>      - Wic fixes
>>      - Update the kernel to 3.10.17
>>      - CVE fixes
>>      - Other Bug fixes
>>
>> // Robert
>>
>> The following changes since commit c303f5ecf7cda1c3b8bb776a6800946c0487cd93:
>>
>>    Revert "utils.bbclass: Fix override ordering for FILESPATH" (2013-12-03 12:55:47 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib robert/dora-next-oecore
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/dora-next-oecore
>
>

