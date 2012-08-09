Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SzUdN-0003EE-Lf
	for openembedded-core@lists.linuxtogo.org;
	Thu, 09 Aug 2012 17:26:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Aug 2012 08:13:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,740,1336374000"; d="scan'208";a="178785657"
Received: from unknown (HELO helios.localnet) ([10.252.121.69])
	by azsmga001.ch.intel.com with ESMTP; 09 Aug 2012 08:13:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ross Burton <ross.burton@intel.com>
Date: Thu, 09 Aug 2012 16:13:54 +0100
Message-ID: <5154002.dhIIyVWEkz@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-27-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1344524789-17424-1-git-send-email-ross.burton@intel.com>
References: <1344524789-17424-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.linuxtogo.org
Subject: Re: [PATCH] pimlico: Remove
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
X-List-Received-Date: Thu, 09 Aug 2012 15:26:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 09 August 2012 16:06:29 Ross Burton wrote:
> Remove the Pimlico applications (Contacts, Dates, Tasks) and associated
> libraries, features, documentation and tasks.  oe-core isn't a reference PIM
> stack, so we don't need this.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  documentation/dev-manual/dev-manual-intro.xml      |    4 -
>  documentation/poky-ref-manual/ref-features.xml     |    2 -
>  documentation/poky-ref-manual/resources.xml        |    3 -

These docs are not part of OE-Core, the changes need to be separated out, 
applied to the yocto-docs repo and sent to the yocto ML.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


