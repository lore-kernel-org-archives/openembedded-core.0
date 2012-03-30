Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SDZaW-0001xc-F6
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 13:01:48 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 30 Mar 2012 03:52:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="83476264"
Received: from unknown (HELO helios.localnet) ([10.252.123.235])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Mar 2012 03:52:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Fri, 30 Mar 2012 11:52:41 +0100
Message-ID: <3716008.CUCJMsn9SM@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1203300617321.30730@oneiric>
References: <alpine.DEB.2.02.1203291505580.4586@oneiric>
	<4067879.36leZStCMh@helios>
	<alpine.DEB.2.02.1203300617321.30730@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: argh ... "_append" versus "+=" and IMAGE_INSTALL confusion
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
X-List-Received-Date: Fri, 30 Mar 2012 11:01:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 30 March 2012 06:23:39 Robert P. J. Day wrote:
>   that is, stop messing with IMAGE_INSTALL and do your customization
> with CORE_IMAGE_EXTRA_INSTALL.  isn't that what it was expressly
> designed for?

Possibly, but I had assumed though that CORE_IMAGE_EXTRA_INSTALL (and 
EXTRA_IMAGE_FEATURES) were intended to be used only from local.conf so that 
people modifying them in local.conf could never unintentionally remove things 
from the image by assigning to it directly with = as opposed to using +=.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


