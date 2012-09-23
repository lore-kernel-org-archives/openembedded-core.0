Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TFuk2-0000D0-Ho
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 00:33:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Sep 2012 15:20:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,471,1344236400"; d="scan'208";a="196111383"
Received: from unknown (HELO helios.localnet) ([10.252.121.252])
	by azsmga001.ch.intel.com with ESMTP; 23 Sep 2012 15:20:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Sep 2012 23:20:44 +0100
Message-ID: <1540243.ihgQ8YivHP@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.1 (Linux/3.2.0-31-generic-pae; KDE/4.9.1; i686; ; )
In-Reply-To: <1348436710.4444.247.camel@x121e.pbcl.net>
References: <1348436710.4444.247.camel@x121e.pbcl.net>
MIME-Version: 1.0
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] kernel.bbclass: Allow modules.tar.gz generation to be inhibited
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
X-List-Received-Date: Sun, 23 Sep 2012 22:33:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 23 September 2012 22:45:10 Phil Blundell wrote:
> The modules.tar.gz archive is sometimes of no value and it can take
> a noticeable time to build if many modules were enabled in the kernel
> configuration.  The extraneous file also contributes to deploy/ clutter
> and is a waste of disk space.
> 
> Allow it to be suppressed by setting KERNEL_DEPLOY_MODULE_TARBALL=0.

I'm wondering, does anyone still find this file useful?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


