Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QWHTy-0005Et-AS
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 02:27:50 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Jun 2011 17:24:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,361,1304319600"; d="scan'208";a="15842609"
Received: from unknown (HELO helios.localnet) ([10.255.16.170])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jun 2011 17:24:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 14 Jun 2011 01:24:23 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <46ED2218-6735-449C-B10C-D557B92DA339@dominion.thruhere.net>
	<1308009720.15712.319.camel@rex>
	<BANLkTinh1G+8fKDAiGnCyzWXoVV=MoAEfg@mail.gmail.com>
In-Reply-To: <BANLkTinh1G+8fKDAiGnCyzWXoVV=MoAEfg@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201106140124.23185.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Where is atom-pc.conf hiding?
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
X-List-Received-Date: Tue, 14 Jun 2011 00:27:50 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 14 June 2011 01:09:27 Otavio Salvador wrote:
> I know the delta is getting smaller and smaller. This is good. A good
> way to make it move faster is using OE-Core as basis. This will
> "force" the backporting of missing Poky's change to OE-Core to happen
> faster.

We *are* using oe-core as a basis. The thing limiting us right now is the lack 
of appropriate layer tooling, something which is being worked on right now and 
should arrive very soon - in fact the combo layer tool you responded to 
earlier is the most important piece that we need to fix this integration issue.

> Currently there're many people that base the stuff (that is target to
> OE-Core) on Poky and sometimes it cases issues (as the bitbake ones I
> used as example).

Since bitbake upstream and the one in poky are now very close (differences 
almost negligible) and we now send all of our changes via upstream first, I 
would not expect any more bitbake divergence in future.

I'm not saying we can't do better or we shouldn't test with oe-core alone - we 
definitely should do the latter more often. I can only reiterate what Richard 
has said - bear with us, we're working on it :)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


