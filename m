Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPoNd-0006Le-5t
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 06:10:33 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 May 2011 21:07:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,278,1304319600"; 
   d="scan'208";a="2716143"
Received: from unknown (HELO [10.255.12.184]) ([10.255.12.184])
	by azsmga001.ch.intel.com with ESMTP; 26 May 2011 21:07:24 -0700
Message-ID: <4DDF237C.20506@linux.intel.com>
Date: Thu, 26 May 2011 21:07:24 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1306218459.git.sgw@linux.intel.com>
	<1306443683.5911.1.camel@vorpal.jf.intel.com>
	<4DDEC006.30701@linux.intel.com>
	<201105262214.44529.paul.eggleton@linux.intel.com>
In-Reply-To: <201105262214.44529.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 1/2] IMAGE_ROOTFS_SIZE Cleanup
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
X-List-Received-Date: Fri, 27 May 2011 04:10:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/26/2011 02:14 PM, Paul Eggleton wrote:
> On Thursday 26 May 2011 22:03:02 Darren Hart wrote:
>> Yeah, this wasn't clear to me either. And my question in 2/2 still
>> stands - what is the goal of the overhead factor?
> 
> I think the thinking was that the more software you have installed to begin 
> with the more user data you're likely to need to store. Personally I think it 
> would be simpler if we just set some additional overhead as an absolute value 

I had the same thought, so "seconded".

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


