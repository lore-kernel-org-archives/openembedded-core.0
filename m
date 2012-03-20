Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S9vjf-0000QF-Oe
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 10:52:12 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Mar 2012 02:43:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="122849503"
Received: from unknown (HELO helios.localnet) ([10.252.123.195])
	by orsmga002.jf.intel.com with ESMTP; 20 Mar 2012 02:43:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 20 Mar 2012 09:43:16 +0000
Message-ID: <1757423.DE0kMhjxZk@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <4F684301.5060307@windriver.com>
References: <4F684301.5060307@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Why qemu-config RDPENDS on distcc ?
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
X-List-Received-Date: Tue, 20 Mar 2012 09:52:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 20 March 2012 16:42:41 Robert Yang wrote:
> I'm just curious that qemu-config RDPENDS on distcc:
> 
> meta/recipes-bsp/qemu-config/qemu-config.bb:RDEPENDS_${PN} = "distcc ..."
> 
> And there are 4 processes named "distcc" running after boot the target
> with "runqemu qemux86".
> 
> We have distcc on the target, but no gcc or g++, can we remove it from
> qemu-config's RDEPENDS?

I think the idea was that if you wanted to do compilation on the emulated 
target, having distcc would let you do it with much better performance. I  
agree it seems that it's not particularly useful if you're never going to do 
any compilation on the target though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


