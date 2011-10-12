Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>)
	id 1RE18J-0004wS-J1; Wed, 12 Oct 2011 17:54:15 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Oct 2011 08:48:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="62249814"
Received: from unknown (HELO helios.localnet) ([10.252.120.213])
	by orsmga001.jf.intel.com with ESMTP; 12 Oct 2011 08:48:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Oct 2011 16:48:29 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-11-generic-pae; KDE/4.6.5; i686; ; )
References: <CAOd_LFzbT0j3wSjp+d3POcTUo9X9+aiYtax4d6tep3YXmTwb2g@mail.gmail.com>
	<CAMKF1srHT5uh5a=z=mt0kOpF2YO9YyKkEdkRK9ZT8=LaGY6JSA@mail.gmail.com>
	<6C40DE44-FE7C-4C0A-AB7F-1B78CE95216F@dominion.thruhere.net>
In-Reply-To: <6C40DE44-FE7C-4C0A-AB7F-1B78CE95216F@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201110121648.29478.paul.eggleton@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] git server move
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
X-List-Received-Date: Wed, 12 Oct 2011 15:54:16 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 12 October 2011 16:18:37 Koen Kooi wrote:
> Op 12 okt. 2011, om 17:16 heeft Khem Raj het volgende geschreven:
> > On Wed, Oct 12, 2011 at 1:17 AM, Koen Kooi <koen@dominion.thruhere.net> 
wrote:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >> 
> >> Op 11-10-11 21:11, Cliff Brake schreef:
> >>> Hi, we are moving git.openembedded.org to a new server.
> >>> 
> >>> SSH access on the old server has been disabled.  git:// still works
> >>> there.
> >>> 
> >>> As soon as DNS propagates, SSH access will work with the new server.
> >>> 
> >>> Let me know if you see any problems.
> >> 
> >> When will cgit be back up?
> > 
> > It should be up already. Do Ctrl+f5 in your browser on
> > git.openembedded.org
> 
> Let me rephrase: when will it be working again? I still get "No
> repositories found" when clicking on a repo.

I think you may find it's the "/cgit.cgi" part of the URL that's causing 
problems. It used to work, now it doesn't - if you remove it then you get a 
working interface.

FWIW I'd be in favour of fixing it however; all of the links to cgit on my 
layer index page are now broken for example.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


