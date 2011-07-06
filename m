Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QeSne-0003ad-9B
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 16:09:58 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Jul 2011 07:06:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,486,1304319600"; d="scan'208";a="22132732"
Received: from unknown (HELO helios.localnet) ([10.255.17.193])
	by orsmga002.jf.intel.com with ESMTP; 06 Jul 2011 07:06:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>
Date: Wed, 6 Jul 2011 15:06:03 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <1309881139.2410.14.camel@phil-desktop>
	<201107051731.12273.paul.eggleton@linux.intel.com>
	<1309891044.3176.7.camel@lenovo.internal.reciva.com>
In-Reply-To: <1309891044.3176.7.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <201107061506.04010.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bluez-dtl1-workaround: remove PRIORITY
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
X-List-Received-Date: Wed, 06 Jul 2011 14:09:58 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Tuesday 05 July 2011 19:37:24 you wrote:
> On Tue, 2011-07-05 at 17:31 +0100, Paul Eggleton wrote:
> > Is it possible some people are still using PCMCIA/CF cards with this
> > hardware in it?
> 
> It's certainly possible, yes.  But I don't think that the mere
> possibility is a very strong argument for keeping the recipe in oe-core.
> Maybe it would be better suited to meta-oe or some BSP layer,

You're right, I guess it doesn't really belong in oe-core.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


