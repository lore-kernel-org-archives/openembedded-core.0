Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TvUnB-00050Z-Cy
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 16:20:46 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 16 Jan 2013 07:05:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,479,1355126400"; d="scan'208";a="191809326"
Received: from unknown (HELO helios.localnet) ([10.252.123.117])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Jan 2013 07:05:10 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2013 15:05:09 +0000
Message-ID: <15267619.7f0x1u7J0V@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-21-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <92e9abc7bc28eced054b0cbd6f9eaa74eb4af670.1358347974.git.paul.eggleton@linux.intel.com>
References: <cover.1358347974.git.paul.eggleton@linux.intel.com>
	<92e9abc7bc28eced054b0cbd6f9eaa74eb4af670.1358347974.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] dropbear: allow configuring blank password option at runtime
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
X-List-Received-Date: Wed, 16 Jan 2013 15:20:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 16 January 2013 14:54:17 Paul Eggleton wrote:
> Instead of using IMAGE_FEATURES to control something within a recipe,
> allow this to be set at runtime and set it during postprocessing.
> Additionally, use one postprocessing function for both openssh and
> dropbear and run it regardless of whether ssh-server-* are in
> IMAGE_FEATURES so that it still takes effect if these are installed by
> adding dropbear/openssh to IMAGE_INSTALL.
> 
> Fixes [YOCTO #2578].
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/core-image.bbclass                    |    5 +-
>  meta/classes/image.bbclass                         |    8 +-
>  meta/recipes-core/dropbear/dropbear.inc            |    6 +-
>  .../dropbear/dropbear/allow-nopw.patch             |   19 ----
>  .../dropbear/dropbear/nopw-option.patch            |  106

Upon further consideration, this is not going to work for anyone inheriting 
from image.bbclass rather than core-image.bbclass, which is quite a lot of 
people. I'll send a v2.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


