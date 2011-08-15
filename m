Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QsxDc-0008Ow-66
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 15:28:40 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 15 Aug 2011 06:24:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,374,1309762800"; 
   d="scan'208";a="7292699"
Received: from unknown (HELO helios.localnet) ([10.255.18.70])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Aug 2011 06:24:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Anders Darander <anders@chargestorm.se>
Date: Mon, 15 Aug 2011 14:24:01 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <1313164659.6733.163.camel@phil-desktop>
	<1313413653.6733.175.camel@phil-desktop>
	<20110815131547.GA22184@chargestorm.se>
In-Reply-To: <20110815131547.GA22184@chargestorm.se>
MIME-Version: 1.0
Message-Id: <201108151424.01537.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libx11: skip self if x11 not in DISTRO_FEATURES
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
X-List-Received-Date: Mon, 15 Aug 2011 13:28:40 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 15 August 2011 14:15:47 Anders Darander wrote:
> The short-term solution is to get a similar patch applied to meta-oe.
> The long-term solution, any volunteers?, would be to convert the
> qt4-recipes in meta-to bbappends (if they still are needed).

I already did this a few weeks ago. The only Qt 4 thing left that is a full 
recipe in meta-oe is qmake2 (for the target).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


