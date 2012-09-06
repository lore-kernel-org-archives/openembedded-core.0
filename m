Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T9Z1K-0006m3-N1
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 12:09:10 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 06 Sep 2012 02:56:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,379,1344236400"; d="scan'208";a="142117834"
Received: from unknown (HELO helios.localnet) ([10.252.121.173])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Sep 2012 02:56:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Bodke, Kishore K" <kishore.k.bodke@intel.com>
Date: Thu, 06 Sep 2012 10:56:31 +0100
Message-ID: <1751966.om2roK65Ws@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <D956029D25CF204F948EA0FB515E1EE20AD6186E@ORSMSX105.amr.corp.intel.com>
References: <D956029D25CF204F948EA0FB515E1EE20AD6186E@ORSMSX105.amr.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: compiling package with bitbake with CROSS_COMPILE flag
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
X-List-Received-Date: Thu, 06 Sep 2012 10:09:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 27 August 2012 18:10:12 Bodke, Kishore K wrote:
> I hope I am asking this question to the right mailing list, since it is
> related to meta modules classes.
> 
> I have a package trying to compile using bitbake.
> 
> When you inherit module, I think CROSS_COMPILE option is enabled by
> module-base.bbclass.
> 
> I get below error because of this CROSS_COMPILE flag.
> 
> error: inlining failed in call to always_inline 'icp_adf_pollQueue':
> function body not available
> 
> I disabled the flag in my recipe by export CROSS_COMPILE="".
> Then it compiled fine.
> 
> My question is
> what this CROSS_COMPILE flag  does when bitbake runs?  Does it set any extra
> compiler flags, which is not accepted by my package I am building using
> bitbake? How do you avoid this inlining issue when CROSS_COMPILE flag is
> enabled?

CROSS_COMPILE is set in order for the kernel module makefiles to be able to 
determine the correct prefix for the compilation tools. If it isn't set I think 
you would potentially be using the wrong compiler and tools for the target 
platform.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


