Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TdiXh-0001xt-DK
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 15:23:30 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Nov 2012 06:08:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,177,1355126400"; d="scan'208";a="255916382"
Received: from unknown (HELO helios.localnet) ([10.252.122.248])
	by fmsmga002.fm.intel.com with ESMTP; 28 Nov 2012 06:08:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 28 Nov 2012 14:08:56 +0000
Message-ID: <2817873.ANYiItS1vX@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.2.0-33-generic-pae; KDE/4.9.3; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1211280849310.26034@oneiric>
References: <alpine.DEB.2.02.1211272315510.29858@oneiric>
	<5890106.Vb1bZqkAH2@helios>
	<alpine.DEB.2.02.1211280849310.26034@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: what is "packagegroup-core-nfs-server"?
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
X-List-Received-Date: Wed, 28 Nov 2012 14:23:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 November 2012 08:55:59 Robert P. J. Day wrote:
>   and to finalize the confusion, there's this from
> meta/classes/image.bbclass:
> 
> # IMAGE_FEATURES may contain any available package group
> 
> which would appear to be untrue at this point.  

I'm pretty sure this has never been true. We should just remove that comment.

> i think a better way to approach this would be to discuss the possible types
> of entries you might find in IMAGE_FEATURES, which appear to be:
> 
> * actual package groups
> * individual recipes(?)

I don't think this is the way to explain it. They can be values defined as 
PACKAGE_GROUP_valuename (in which you can specify one or more packages to be 
installed when the feature is enabled - where the packages could be any kind 
of runtime package including packagegroups). The term "recipe" should be 
avoided here.

> * values processed totally independently by other recipes that are
> neither package groups nor recipes (eg, "read-only-rootfs")

True. FWIW, this aspect is along the same lines as how DISTRO_FEATURES, 
MACHINE_FEATURES etc. are handled - we check for values contained in them in 
the places in the metadata where we need to be conditional upon those values.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


