Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SFq1M-0007Jo-Qe
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 18:58:52 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Apr 2012 09:49:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="150042734"
Received: from unknown (HELO helios.localnet) ([10.252.120.33])
	by fmsmga002.fm.intel.com with ESMTP; 05 Apr 2012 09:49:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Cui, Dexuan" <dexuan.cui@intel.com>
Date: Thu, 05 Apr 2012 17:49:35 +0100
Message-ID: <5300945.hufXIED5X0@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <A25F549E4D43CD42B4C02DF47A1913230FCFCE89@SHSMSX102.ccr.corp.intel.com>
References: <cover.1333569870.git.paul.eggleton@linux.intel.com>
	<f7de5b50bca5996190ca0c1c10e2b56f20f11e8d.1333569870.git.paul.eggleton@linux.intel.com>
	<A25F549E4D43CD42B4C02DF47A1913230FCFCE89@SHSMSX102.ccr.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] self-hosted-image: decrease reserved space to	0.5%
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
X-List-Received-Date: Thu, 05 Apr 2012 16:58:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 05 April 2012 16:41:05 Cui, Dexuan wrote:
> This reminds me of something slightly similar:
> Can we enable the -z option of genext2fs in IMAGE_CMD_ext3()?
> For a 40G image, this would save the building host many giga bytes, and make
> the conversion "from .ext3 to .hdddirect" faster.

In principle if it works then we should be able to do it, but I have no idea 
if there are any other side-effects of using -z.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


