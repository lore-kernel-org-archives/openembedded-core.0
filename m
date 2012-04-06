Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SG0Q0-000876-BD
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 06:05:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Apr 2012 20:55:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="129304820"
Received: from unknown (HELO envy.home) ([10.255.12.143])
	by orsmga002.jf.intel.com with ESMTP; 05 Apr 2012 20:55:40 -0700
Message-ID: <4F7E6914.7080908@linux.intel.com>
Date: Thu, 05 Apr 2012 20:55:00 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <A25F549E4D43CD42B4C02DF47A1913230FCFD3A2@SHSMSX102.ccr.corp.intel.com>
In-Reply-To: <A25F549E4D43CD42B4C02DF47A1913230FCFD3A2@SHSMSX102.ccr.corp.intel.com>
X-Enigmail-Version: 1.4
Subject: Re: Do we have a package that installs the kernel headers and config into the target?
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
X-List-Received-Date: Fri, 06 Apr 2012 04:05:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/05/2012 08:20 PM, Cui, Dexuan wrote:
> In a typical Linux distribution, there is a build link(or directory) that specifies the directory where the kernel headers and kernel config are put.
> 
> E.g. in my Ubuntu 11.04, a package linux-headers-2.6.38-8-generic installs .config, include/ and Kconfig into /usr/src/linux-headers-2.6.38-8-generic/ and makes a link /lib/modules/2.6.38-8-generic/build to point to the directory.
> 
> However, looks in Yocto, we don't have such a package? Do we have a plan to add it?
> 
> I'm asking the question because in the ESDC contest, the students found in Yocto they couldn't build the wifi driver's source code that was downloaded from realtek.com:  http://www.realtek.com.tw/downloads/downloadsView.aspx?Langid=1&PFid=48&Level=5&Conn=4&ProdID=226&DownTypeID=3&GetDown=false&Downloads=true
> In Ubuntu, they can build the driver fine.
> 

There is an open bug:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=1614


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


