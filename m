Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QBr1J-0007iU-KN
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 18:09:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Apr 2011 09:07:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,233,1301900400"; d="scan'208";a="735105448"
Received: from doubt.jf.intel.com (HELO [10.24.5.31]) ([10.24.5.31])
	by orsmga001.jf.intel.com with ESMTP; 18 Apr 2011 09:07:26 -0700
Message-ID: <4DAC61C1.4070406@linux.intel.com>
Date: Mon, 18 Apr 2011 09:07:29 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1302886579.git.paul.eggleton@linux.intel.com>
	<4DA8CA18.3000801@mlbassoc.com> <4DA8CE4A.6090408@linux.intel.com>
	<201104181012.13920.paul.eggleton@linux.intel.com>
In-Reply-To: <201104181012.13920.paul.eggleton@linux.intel.com>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 2/3] netbase: automatically bring up usb0 on beagleboard
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
X-List-Received-Date: Mon, 18 Apr 2011 16:09:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/18/2011 02:12 AM, Paul Eggleton wrote:
> On Saturday 16 April 2011 00:01:30 Darren Hart wrote:
>> On 04/15/2011 03:43 PM, Gary Thomas wrote:
>>> eth1 yes, but doesn't the BeagleBoard xM have eth0?
>>
>> No. The onboard device is usb0.
> 
> Looks like we're not the only ones confused by this:
> 
> https://bugs.launchpad.net/linux-linaro/+bug/622429
> 

Perhaps I am missing some context, but I don't see any problem with
having the name usb0. In fact, I find it informative, and helps to
explain why things like tftp don't work from u-boot, etc.

While the community remains divided, I plan to stay in the usb0 camp.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


