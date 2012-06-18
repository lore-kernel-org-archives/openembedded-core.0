Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SgZbH-00058o-G3
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 12:54:27 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Jun 2012 03:43:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="166911479"
Received: from unknown (HELO helios.localnet) ([10.252.120.122])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jun 2012 03:43:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 18 Jun 2012 11:43:42 +0100
Message-ID: <67003530.Ye7vr7B5iY@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <F8DD14C2-FF05-4503-8006-B6BCC3BE5A81@dominion.thruhere.net>
References: <cover.1339799869.git.dvhart@linux.intel.com>
	<7661818.rLLbVEY8n5@helios>
	<F8DD14C2-FF05-4503-8006-B6BCC3BE5A81@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] busybox: Include setsid and cttyhack in defconfig
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
X-List-Received-Date: Mon, 18 Jun 2012 10:54:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 18 June 2012 11:26:22 Koen Kooi wrote:
> Op 18 jun. 2012, om 09:58 heeft Paul Eggleton het volgende geschreven:
> > On Monday 18 June 2012 07:00:19 Koen Kooi wrote:
> >> it does force the distro bbappends onto everyone, messing up
> >> /etc/hostname
> > 
> > So it did. Now it's fixed.
> 
> Thanks! I'll add it to the angstrom layer stack later this week.

Well, you could do that, but I have to say I never intended meta-baryon to be 
the proper home for the additional recipes that it contains, and indeed it 
duplicates some already in meta-oe (so it did not have to pull in meta-oe).

If you wanted to add the new recipes it contains somewhere else then I'd be 
more than happy for that to happen, or I'll get round to doing it some time in 
the near future. FYI what's there that's not currently in any other layer 
(excluding ffmpeg):

* faac [added for ffmpeg]
* ffmpeg [I'm guessing you won't want this, but mediatomb/ffmpegthumbnailer will 
need fixing up to use libav instead if you don't.]
* ffmpegthumbnailer
* libgsm [added for ffmpeg but probably could have been disabled instead]
* mediatomb
* proftpd
* schroedinger [added for ffmpeg]
* webmin [might need some tweaking]
* webmin-notice [might not be particularly interesting]

The libav adaptation is one of the reasons I haven't done this yet as it looks 
like it might not be a 5 minute job.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


