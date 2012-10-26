Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TRjEW-0005XI-MU
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 14:41:52 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Oct 2012 05:28:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,654,1344236400"; d="scan'208";a="209656269"
Received: from unknown (HELO helios.localnet) ([10.252.122.111])
	by azsmga001.ch.intel.com with ESMTP; 26 Oct 2012 05:28:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Date: Fri, 26 Oct 2012 13:28:19 +0100
Message-ID: <3032332.QqX60qUNtI@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <1351252460-19953-1-git-send-email-ml@communistcode.co.uk>
References: <1351252460-19953-1-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe][PATCH 1/3] latencytop: disable GTK and remove gtk+ dependacy
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2012 12:41:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 26 October 2012 12:54:18 Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> 
> ---
> 
> v2
> - Don't use -D to define with make
> - Rename EXTRA_OECONF_X to EXTRA_OEMAKE_X
> 
> When DISTRO_FEATURES does not contain x11, disable GTK GUI and
> also don't add gtk+ to the DEPENDS
> 
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

I think because the commit message is below the first --- it won't be picked up 
when applied. This is probably where a cover letter is more appropriate.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


