Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1StPrT-0003Rv-AL
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 23:08:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Jul 2012 13:56:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172154999"
Received: from unknown (HELO helios.localnet) ([10.252.121.58])
	by azsmga001.ch.intel.com with ESMTP; 23 Jul 2012 13:56:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 23 Jul 2012 21:56:45 +0100
Message-ID: <3312625.ONM3TZznPV@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1207231454340.9373@oneiric>
References: <alpine.DEB.2.02.1207231454340.9373@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: OE layer index page entry referring to "meta-oe" seems wrong
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
X-List-Received-Date: Mon, 23 Jul 2012 21:08:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 23 July 2012 14:57:15 Robert P. J. Day wrote:
>   i was checking out the OE layer index page:
> 
> http://www.openembedded.org/wiki/LayerIndex
> 
> and it seems like the early entry for meta-oe is misleading.  if you
> check out that git repo, what you get is the meta-openembedded top
> level directory, of which meta-oe is just one of a number of
> sub-layers (meta-efl, meta-gnome, ..., meta-oe), similar to the
> situation with meta-intel.

That's what the "Repo subdir" column is supposed to help with - that indicates 
which subdirectory within the repository the layer is in. Git does not really 
conveniently allow checking out just a subdirectory so we have to refer to the 
top level. That said, I'm happy to have suggestions on how we can improve the 
index in this regard.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


