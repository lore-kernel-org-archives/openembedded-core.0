Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8UFA-000671-0A
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:51:00 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Sep 2012 03:38:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="140937977"
Received: from unknown (HELO helios.localnet) ([10.252.121.155])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Sep 2012 03:38:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <philb@gnu.org>
Date: Mon, 03 Sep 2012 11:37:47 +0100
Message-ID: <2466289.CAG9RzjSbc@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1346668525.2673.116.camel@phil-desktop>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
	<8e6521856490f08291c3c01a3b16e5f270fe6bac.1346668109.git.paul.eggleton@linux.intel.com>
	<1346668525.2673.116.camel@phil-desktop>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 15/28] packagegroup-base: remove openswan from packagegroup-base-ipsec
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
X-List-Received-Date: Mon, 03 Sep 2012 10:51:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 03 September 2012 11:35:24 Phil Blundell wrote:
> On Mon, 2012-09-03 at 11:30 +0100, Paul Eggleton wrote:
> > openswan was only ever provided in unmaintained form in meta-demoapps
> > which has been removed, so we never really provided it in OE-Core.
> 
> Isn't packagegroup-base-ipsec rather useless without it?

If you ignore the RRECOMMENDS line that follows, yes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


