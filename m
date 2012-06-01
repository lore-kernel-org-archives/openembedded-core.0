Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SaPEE-0005rD-Vv
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 12:37:11 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Jun 2012 03:26:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106661974"
Received: from unknown (HELO helios.localnet) ([10.255.12.84])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Jun 2012 03:26:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
Date: Fri, 01 Jun 2012 11:26:47 +0100
Message-ID: <4539907.k7xmu0jQ3E@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-24-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <D03C46EA-D51F-40C5-9947-0EA7FAE6DD94@gmail.com>
References: <D03C46EA-D51F-40C5-9947-0EA7FAE6DD94@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-xilinx] WARNING: linux-xilinx: No generic license file exists for: GPL in any provider
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
X-List-Received-Date: Fri, 01 Jun 2012 10:37:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 31 May 2012 19:44:41 Elvis Dowson wrote:
> Hi,
>       While attempting to build linux-xilinx, I get the following warning:
> 
> WARNING: linux-xilinx: No generic license file exists for: GPL in any
> provider
> 
> What should I do to fix this warning?

You could ignore it, or you could fix the linux-xilinx recipe. FYI what it's 
really saying is "GPL" by itself is not really specific enough. The recipe 
should be stating "GPLv2" or "GPLv3" or whichever version the software being 
built is really licensed under. Being that it sounds like it's the Linux 
kernel one would assume "GPLv2" would be the correct answer for the linux-
xilinx recipe.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


