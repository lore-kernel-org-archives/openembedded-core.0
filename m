Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3270960D8A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 17:42:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Dec 2013 09:42:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,508,1384329600"; d="scan'208";a="454362119"
Received: from unknown (HELO [10.255.15.128]) ([10.255.15.128])
	by orsmga002.jf.intel.com with ESMTP; 18 Dec 2013 09:42:45 -0800
Message-ID: <52B1DE95.5040209@linux.intel.com>
Date: Wed, 18 Dec 2013 09:42:45 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Scott Garman <scott.a.garman@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1386279548.git.scott.a.garman@intel.com>
	<52B1DD24.5040606@intel.com>
In-Reply-To: <52B1DD24.5040606@intel.com>
Subject: Re: [PATCH 0/1] runqemu fix for bug #5617
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
X-List-Received-Date: Wed, 18 Dec 2013 17:42:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/2013 09:36 AM, Scott Garman wrote:
> Ping reminder on this patch.
>

I believe it was merged last week, did you update master?

Sau!

> Scott
>
> On 12/05/2013 01:57 PM, Scott Garman wrote:
>> Hi all,
>>
>> It's been a while since I've submitted a patch, let's see if I can get
>> this process right the first time. ;)
>>
>> This is a fix for Yocto bug #5617. Ross Burton wasn't a fan of the image
>> filename whitelist, and I have to agree - it's not very maintainable. So
>> when we have to guess the image filename, instead just pick the most
>> recently modified imgage filename that conforms to our typical naming
>> conventions, *image*machine.fstype
>>
>> Scott
>>
>> The following changes since commit
>> 300760193c6bcfd20f1d4908f912bebd53e86281:
>>
>>    tcl: fix tclConfig.sh to point to the correct private headers
>> (2013-12-05 16:48:17 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.openembedded.org/openembedded-core-contrib
>> sgarman/runqemu-imgfn-fix
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgarman/runqemu-imgfn-fix
>>
>>
>> Scott Garman (1):
>>    runqemu: remove core-image-* whitelist
>>
>>   scripts/runqemu | 17 +++++------------
>>   1 file changed, 5 insertions(+), 12 deletions(-)
>>
>
>


