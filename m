Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3SG8-0007Zi-HG
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 15:43:12 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 Aug 2012 06:31:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,797,1336374000"; d="scan'208";a="183142262"
Received: from unknown (HELO helios.localnet) ([10.252.121.92])
	by azsmga001.ch.intel.com with ESMTP; 20 Aug 2012 06:31:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marc Reilly <marc@cpdesign.com.au>
Date: Mon, 20 Aug 2012 14:31:07 +0100
Message-ID: <1657652.otRuZizLvo@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1345422099-26198-1-git-send-email-marc@cpdesign.com.au>
References: <1345422099-26198-1-git-send-email-marc@cpdesign.com.au>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Add recipe for hplip 3.12.6
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
X-List-Received-Date: Mon, 20 Aug 2012 13:43:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 20 August 2012 10:21:38 Marc Reilly wrote:
> This adds a recipe for hplip 3.12.6 with a configuration targeted for USB
> printers. I'm not much of a linux printing expert, so just went with a
> setup that let me print all the different doc types required.
> 
> This is based on a recipe for an earlier version which didn't seem to make
> it into oe-core. I'm guessing that oe-core is the correct place for it:
> next to cups, ghostscript and foomatic.

Since this is something that not everyone needs I think the best place for it 
is probably meta-oe. I believe the justification for having cups etc. available 
in OE-Core is that these are required when you want LSB compliance.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


