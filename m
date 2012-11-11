Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>)
	id 1TXdA3-0004E9-Rw; Sun, 11 Nov 2012 20:25:40 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Nov 2012 11:11:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,758,1344236400"; d="scan'208";a="217976724"
Received: from unknown (HELO helios.localnet) ([10.252.122.192])
	by orsmga001.jf.intel.com with ESMTP; 11 Nov 2012 11:11:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Nov 2012 19:11:28 +0000
Message-ID: <12301427.Yf0uchSh3U@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: OE-Classic recipe migration status
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
X-List-Received-Date: Sun, 11 Nov 2012 19:25:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

Whilst the OE-Core-based layer landscape has grown quite a bit over the last 
year and we now have a wealth of clean and up-to-date recipes, I've heard a 
few people commenting that we've still lost quite a few recipes along the way. 
Nobody who did make that comment has seemed to be able to be specific about 
what they thought we were missing however, so I figured it would be worth 
trying to determine exactly which recipes are only available in OE-Classic.

With the help of some scripts I've produced a list of the recipes, made some 
notes and categorised some of them. I've published the list on the wiki 
(unfortunately I had to split it into two pages since it was too large to put 
into one):

 http://www.openembedded.org/wiki/OE-Classic_Recipes_A-I
 http://www.openembedded.org/wiki/OE-Classic_Recipes_J-Z

I don't know much about a lot of these recipes, so if you can help to fill in 
the gaps particularly by marking the obsolete ones as such or adding other 
comments, that would be great. Either edit the pages directly or make your 
comments here and I'll merge them.

Using some more hacky scripts to break down the recipes into groups, I've 
produced the following numbers (with the incomplete data as it stands):

   1484 other
    218 BSP
    211 BugLabs
    195 libs
    193 obsolete
    155 obsolete directory (OE-Classic)
    136 PERL
    119 python
     92 distro
     89 tasks
     84 nonworking directory (OE-Classic)
     80 GPE
     79 X11 drivers
     59 images
     59 games
     41 fonts
     23 security
     20 in another layer
     18 pending
     11 EFL

So clearly there are quite a few recipes left that could be brought back, 
assuming there is demand; on the other hand there are a significant number that 
can probably just be discarded. For those that are still of interest, we need 
motivated individuals to do the migration and maintain the recipes going 
forward.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


