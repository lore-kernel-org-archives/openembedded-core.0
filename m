Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPKN8-0003LJ-8U
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 22:08:03 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 May 2011 13:04:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,268,1304319600"; 
   d="scan'208";a="1678973"
Received: from unknown (HELO [10.255.12.181]) ([10.255.12.181])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2011 13:04:44 -0700
Message-ID: <4DDD60E3.606@linux.intel.com>
Date: Wed, 25 May 2011 13:04:51 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <4DDBDE9D.5000709@linux.intel.com>	
	<20110524172330.GC18086@sakrah.homelinux.org>	
	<6D7346D0-2F4B-44EC-A04B-2F443B33E544@dominion.thruhere.net>	
	<1306260430.2491.2.camel@elmorro>
	<1306333690.2491.82.camel@elmorro>	
	<1306334330.2525.236.camel@phil-desktop>
	<4DDD50D3.4090202@linux.intel.com>
	<1306350664.3120.28.camel@lenovo.internal.reciva.com>
In-Reply-To: <1306350664.3120.28.camel@lenovo.internal.reciva.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: adding meta-intel layers breaks parsing, was Re: Updating u-boot for oe-core or meta-yocto
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
X-List-Received-Date: Wed, 25 May 2011 20:08:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/25/2011 12:11 PM, Phil Blundell wrote:
> On Wed, 2011-05-25 at 11:56 -0700, Darren Hart wrote:
>> If it is indeed space separated then I should be able to remedy both
>> issues by simply using the append operator and not self-referencing.
>> Correct?
> 
> I think that's true, yes.  But, space separation is fairly undesirable
> for anything involving paths (particularly absolute ones) and it is
> tempting to say that we should change that variable to have a different
> separator. 
> 

The only example I see of concatenating this variable is a prepend which
uses colons. RP also mentioned he was pretty sure it should be colons.
I'll figure it out for certain and fix the path assignments in meta-intel.


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


