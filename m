Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SXPnu-0004o6-Dd
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 06:37:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 May 2012 21:27:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147735530"
Received: from edwin-gen.sh.intel.com (HELO [10.239.36.17]) ([10.239.36.17])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 21:27:26 -0700
Message-ID: <4FBDB8F7.1030305@intel.com>
Date: Thu, 24 May 2012 12:28:39 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1337805812.git.sgw@linux.intel.com>
	<5ddf365f3f772918a18a67dac1a5b8cc3e2758a6.1337805812.git.sgw@linux.intel.com>
	<4FBDAEB3.2040608@linux.intel.com>
In-Reply-To: <4FBDAEB3.2040608@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Consolidated Pull 4/5] qemu: Add an option to remove host sdl/gl checking
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 May 2012 04:37:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/24/2012 11:44 AM, Saul Wold wrote:
> On 05/23/2012 03:46 PM, Saul Wold wrote:
>> From: Zhai Edwin<edwin.zhai@intel.com>
>>
>> Add an PACKAGECONFIG in qemu to disable GL acceleration:
>> * By default configure try best to enable GL acceleration and fail
>> when missing
>>    host dependency(libSDL and libGL).
>> * End user can also choose to turn off GL capability, thus remove the
>> host
>>    dependence in building.
>>
>> [YOCTO #2407] got fixed.
>>
> I think I found a problem with this when building for the target, so I
> pulled it from the branch.


Which target? Can you attach build log?


>
> Sau!



