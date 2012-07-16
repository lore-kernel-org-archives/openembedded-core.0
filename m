Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SqiqV-0000lR-5X
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 12:48:07 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 03:36:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="177946202"
Received: from unknown (HELO helios.localnet) ([10.252.121.17])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jul 2012 03:36:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 16 Jul 2012 11:36:47 +0100
Message-ID: <5766114.d2laZrfaXp@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <8F9AE1A6-06B6-432B-B336-B8F72D3C2697@dominion.thruhere.net>
References: <1342259955-8875-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0Laa4jNytbBv1ozJWE9kf=-4hSE4_gsZN+VA2N5C1MJVeQ@mail.gmail.com>
	<8F9AE1A6-06B6-432B-B336-B8F72D3C2697@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] powertop: update to 2.0+git
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
X-List-Received-Date: Mon, 16 Jul 2012 10:48:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 16 July 2012 12:33:00 Koen Kooi wrote:
> Op 16 jul. 2012, om 10:47 heeft Burton, Ross het volgende geschreven:
> > On 16 July 2012 07:11, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >>> Please add proper Upstream-Status for the patches; it is nice to have
> >>> those to track the pending patches.
> >> 
> >> Isn't that field only used to put in "pending" and then backslap each
> >> other on doing such a good job?> 
> > Personally I find it incredibly useful to differentiate between
> > patches that should be going upstream and patches that are OE-specific
> > for various reasons.
> 
> I'm not debating the usefulness of the U-S field, I'm debating the
> usefulness of using 'Pending' as a catch-all. I can do:
> 
> for patch in *.patch ; do
> 	echo "Upstream-Status: Pending" >> $patch
> done
> 
> And it will get accepted, but is ultimately useless.

No, it is not. It signifies that the patch is considered appropriate by the 
submitter for upstreaming.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


