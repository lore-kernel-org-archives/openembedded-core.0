Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SGBr2-0006Sg-7T
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 18:17:40 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Apr 2012 09:08:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138550182"
Received: from unknown (HELO envy.home) ([10.255.12.143])
	by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2012 09:08:23 -0700
Message-ID: <4F7F14D0.1060408@linux.intel.com>
Date: Fri, 06 Apr 2012 09:07:44 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: "Cui, Dexuan" <dexuan.cui@intel.com>
References: <A25F549E4D43CD42B4C02DF47A1913230FCFD3A2@SHSMSX102.ccr.corp.intel.com>
	<4F7E6914.7080908@linux.intel.com>
	<A25F549E4D43CD42B4C02DF47A1913230FCFD49B@SHSMSX102.ccr.corp.intel.com>
	<4F7E881E.1000106@linux.intel.com>
	<A25F549E4D43CD42B4C02DF47A1913230FCFD667@SHSMSX102.ccr.corp.intel.com>
	<A25F549E4D43CD42B4C02DF47A1913230FCFD897@SHSMSX102.ccr.corp.intel.com>
In-Reply-To: <A25F549E4D43CD42B4C02DF47A1913230FCFD897@SHSMSX102.ccr.corp.intel.com>
X-Enigmail-Version: 1.4
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 06 Apr 2012 16:17:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/06/2012 04:12 AM, Cui, Dexuan wrote:
> Cui, Dexuan wrote on 2012-04-06:
>> Darren Hart wrote on 2012-04-06:
>>> On 04/05/2012 09:41 PM, Cui, Dexuan wrote:
>>> While I understand there are valid use cases, I think this is generally
>>> contrary to workflow of the project. We build the OS, it runs on the
>>> target. This is building a general purpose OS, and then having it build
>>> itself out more. It doesn't feel like an embedded workflow.
> BTW, my question might be simplified as:
> If we strictly follow the rule the target OS shouldn't build itself out
> more, why do we supply a recipe core-image-sato-sdk.bb that can
> create an image with tools-sdk that includes development tools
> like gcc? :-)
> 
> Or, while we recommend the common embedded workflow, we
> also somewhat support (or tolerate) the way "the target builds
> itself out more"?
> 

Yup, agree.


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


