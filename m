Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 79F7E6FCA3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 15:53:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Jun 2014 08:53:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,989,1392192000"; d="scan'208";a="524072013"
Received: from kmaligas-mobl1.gar.corp.intel.com (HELO [10.255.12.167])
	([10.255.12.167])
	by orsmga001.jf.intel.com with ESMTP; 06 Jun 2014 08:53:14 -0700
Message-ID: <5391E3EA.2040805@linux.intel.com>
Date: Fri, 06 Jun 2014 08:53:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Steffen Sledz <sledz@dresearch-fe.de>
References: <5391647F.5070003@dresearch-fe.de>
In-Reply-To: <5391647F.5070003@dresearch-fe.de>
Cc: Koen Kooi <koen@openembedded.org>,
	angstrom-distro-devel <angstrom-distro-devel@linuxtogo.org>
Subject: Re: No recipe for recipes-tweaks/qt5/qtbase_5.2.1.bbappend
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
X-List-Received-Date: Fri, 06 Jun 2014 15:53:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2014 11:49 PM, Steffen Sledz wrote:
> We're currently switching to th daisy branches.
>
> According to [1] meta-angstrom depends on openembedded-core, meta-oe, and meta-systemd layers.
>
> The angstrom-v2014.06-yocto1.6 branch of meta-angstrom contains recipes-tweaks/qt5/qtbase_5.2.1.bbappend. But there's no qtbase recipe in the required layers. So we get
>
> ---------------> snip <-------------------
> ERROR: No recipes available for:
>    /pm/sledz/hipos-dfe/meta-angstrom/recipes-tweaks/qt5/qtbase_5.2.1.bbappend
> ERROR: Command execution failed: Exited with 1
> ---------------> snip <-------------------
>
> A bug in the daisy branch of meta-angstrom?
> An incomplete dependency list in [1]?
>
Likely you need to add meta-qt5, but this is up to the maintainer of 
meta-angstrom, since it's a manual process currently. It should be in 
meta-angstrom's documentation and setup info.


Sau!

> [1] <http://layers.openembedded.org/layerindex/branch/master/layer/meta-angstrom/>
>
> Regards,
> Steffen
>

